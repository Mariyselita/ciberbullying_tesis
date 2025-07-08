const fs = require('fs');
const { jsonrepair } = require('jsonrepair');
const path = require('path');


const DATA_SOURCE_DIRECTORY = "./raw"
const FINAL_DIRECTORY = "./tweets"

const isEmptyObject = (myEmptyObj) => Object.keys(myEmptyObj).length === 0 && myEmptyObj.constructor === Object

const hasMexicoPlace = (place) => place.country_code === "MX"

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

const processFiles = async () => {
    const jsonFiles = getJsonFiles(DATA_SOURCE_DIRECTORY);
    for (let index = 0; index < jsonFiles.length; index++) {
        const jsonFile = jsonFiles[index];
        try {
            const data = fs.readFileSync(
                jsonFile,
                "utf8"
            )
            const analizeJsonCollection = JSON.parse(jsonrepair(data));
            for (let index = 0; index < analizeJsonCollection.length; index++) {
                const tweetJson = analizeJsonCollection[index];
                if (tweetJson.id &&
                    tweetJson.lang === "es" &&
                    !isEmptyObject(tweetJson.place) &&
                    hasMexicoPlace(tweetJson.place)
                ) {
                    const file = `${FINAL_DIRECTORY}/${tweetJson.id}.json`
                    console.log(`GUARDANDO TWEET ${file}`)
                    fs.writeFileSync(file, JSON.stringify(tweetJson, null, 2));
                }
            }
        } catch (errorProcessFile) {
            console.log(`ERROR AL PROCESAR EL ARCHIVO EXTRAIDO ${jsonFile}`);
            console.log(errorProcessFile);
        }
    }
    console.log("PROCESO TERMINADO");
}

processFiles();