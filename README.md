# 📚 Tesis de Maestría – Exploración y Detección de Ciberacoso

Este repositorio contiene el desarrollo completo de mi tesis de maestría, centrada en la **detección de ciberacoso en redes sociales**. Se organiza en carpetas temáticas que abarcan desde la exploración de datos hasta la implementación de modelos, artículos de referencia y herramientas auxiliares.

---

## 📁 Estructura del proyecto

```plaintext
ciberbullying-tesis/
├── data-exploration/
│   ├── mapa/*
│   └── R.project/*
|
├── notebooks/
│   ├── obtención
|   |   ├── CB_SMTH_BOW.ipynb
|   |   ├── convert.js
│   |   └── index.js
|   |
|   ├──creación_dataset
|   |   ├── CB_CREACIÓN-DATASET.ipynb
|   |   ├── Centroides.ipynb
│   |   └── Centroides_B.ipynb
|   |
|   ├── PLN
|   |   ├── CB_PLN.ipynb
|   |   ├── CB_Tratamiento-DatasetB.ipynb
│   |   └── CB_Tratamiento.ipynb
|   |
│   └── modelos_clasificación
|   |   ├── CB_CLASIFICACIÓN_LEXICONES_minidataset.ipynb
|   |   ├── CB_Clasificación-RegresiónLogística.ipynb
|   |   ├── CB_ETIQUETADO.ipynb
|   |   ├── CB_MLP.ipynb
|   |   ├── CB_NB.ipynb
|   |   ├── CB_Random-Forest.ipynb
|   |   ├── CB_SVM_BETO.ipynb
|   |   ├── CB_SVM_hp.ipynb
│   |   └── CB_Tuits clasificados de kaggle.ipynb
|   |
├── utils/
│   ├── 962480528996749312.json
│   ├── CB-Ejemplo_JSON_Resultante_API
│   └── CB-Fichero_Nefasto.json
|
├── .gitignore
└── README.md
```
---

## 🔍 Descripción general

Este trabajo explora las dinámicas del ciberacoso mediante el análisis de texto y datos geoespaciales. Utiliza una combinación de herramientas como R, Python, librerías de PLN, modelos de clasificación y visualización de datos.

### Tecnologías y herramientas usadas

- **Python (Colab Notebooks)**: `pandas`, `scikit-learn`, `transformers`, `pysentimiento`, etc.
- **R**: `ggplot2`, `sf`, `tidyverse` para visualización y mapas
- **APIs**: Twitter/X API (recolección de datos)
- **GIS**: Procesamiento geográfico con coordenadas a archivos shapefile y visualización realizados en QGIS (pdf, png, svg)

---

## 📁 Contenido por carpeta

### `data-exploration/`
Exploración inicial de los datos, limpieza, análisis descriptivo y mapas geográficos de eventos.

### `docs/`
Documentación académica utilizada como soporte teórico. Incluye artículos en PDF y referencias.

### `notebooks/`
Implementación de modelos de detección de ciberacoso, análisis de sentimientos y preprocesamiento de texto.

### `utils/`
Contiene archivos `.json` generados, como:
- Lexicones personalizados
- Datos estructurados provenientes de la API

---

## ✨ Objetivo

Detectar y analizar el ciberacoso con enfoques automáticos, contribuyendo a la comprensión del fenómeno y ofreciendo herramientas que ayuden a su identificación temprana.

---

## 🐧 Autor

**Lic. en C. Marisela Cadena Cosmes**  
- Para obtener grado de Maestro en Ciencias de la Computación
- [Instituto Politécnico Nacional](https://www.ipn.mx)
- [Centro de Investigación en Computación](https://www.cic.ipn.mx)

---

## 📌 Nota

Este repositorio es parte de un trabajo académico. Si deseas usar algún fragmento de código, por favor, cita adecuadamente o contacta a la autora. 

**Contacto**
- [missmaryvangogh@gmail.com](mailto:missmaryvangogh@gmail.com)

**Dataset**
- [Dataset](https://www.kaggle.com/datasets/mariyselita/posts-de-x-preprocesados-de-mexico)

**Citar APA dataset:**
- Marisela Cadena Cosmes. (2025). Pre-processed X posts from Mexico [Dataset]. Kaggle. https://doi.org/10.34740/KAGGLE/DS/7822010


**Repositorio original**
- [https://github.com/Mariyselita/ciberbullying_tesis](https://github.com/Mariyselita/ciberbullying_tesis)


---

## 🛡️ Licencia

Este proyecto está bajo una licencia de uso académico y de la Secretaría de Ciencia, Humanidades, Tecnología e Innovación y del Instituto Politécnico Nacional.



