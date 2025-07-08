const xlsx = require("xlsx");
const fs = require('fs');
const path = require('path');

const DATA_SOURCE_DIRECTORY = "./tweets"
const FINAL_PATH_DIRECTORY = "./data.xlsx";

const getJsonFiles = (directory) => {
    let main_elements = [];
    const elements = fs.readdirSync(directory);

    elements.forEach((element) => {
        const complete_path = path.join(directory, element);
        if (fs.statSync(complete_path).isDirectory()) {
            main_elements = main_elements.concat(getJsonFiles(complete_path));
        } else if (path.extname(element) === ".json") {
            main_elements.push(complete_path);
        }
    });
    return main_elements;
}

const generateFinalXlsx = async () => {

    const jsonFiles = getJsonFiles(DATA_SOURCE_DIRECTORY);
    jsonFiles.sort(() => Math.random() - 0.5);
    const tweets = [];
    for (let index = 0; index < jsonFiles.length; index++) {
        const jsonFile = jsonFiles[index];
        try {
            const data = fs.readFileSync(
                jsonFile,
                "utf8"
            )
            const tweetJson = JSON.parse(data);
            tweets.push({
                id: tweetJson.id,
                url: tweetJson.url,
                text: tweetJson.text,
                source: tweetJson.source,
                createdAt: tweetJson.createdAt,
                lang: tweetJson.lang,
                media: tweetJson.media,
                "author.userName": tweetJson.author?.userName,
                "author.id": tweetJson.author?.id,
                "author.name": tweetJson.author?.name,
                "author.location": tweetJson.author?.location,
                "author.createdAt": tweetJson.author?.createdAt,
                "author.favouritesCount": tweetJson.author?.favouritesCount,
                "author.mediaCount": tweetJson.author?.mediaCount,
                "author.statusesCount": tweetJson.author?.statusesCount,
                "author.possiblySensitive": tweetJson.author?.possiblySensitive,
                "place.bounding_box.coordinates": JSON.stringify(tweetJson.place.bounding_box.coordinates),
                "place.bounding_box.type": tweetJson.place.bounding_box.type,
                "place.country": tweetJson.place.country,
                "place.full_name": tweetJson.place.full_name,
                "place.name": tweetJson.place.name,
                "place.id": tweetJson.place.id,
                "place.place_type": tweetJson.place.place_type,
                "entities.hashtags": tweetJson.entities?.hashtags
            });
        } catch (errorProcessFile) {
            console.log(`ERROR AL PROCESAR EL ARCHIVO EXTRAIDO ${jsonFile}`);
            console.log(errorProcessFile);
        }
    }
    const wb = xlsx.utils.book_new();
    const ws = xlsx.utils.json_to_sheet(tweets);
    xlsx.utils.book_append_sheet(wb, ws, "Tweets");
    xlsx.writeFile(wb, FINAL_PATH_DIRECTORY);
    console.log("PROCESO TERMINADO");
}
generateFinalXlsx();