# 🤖 Modelos de Clasificación

Este módulo contiene la implementación y evaluación de modelos de clasificación aplicados al análisis de publicaciones de X. 
El objetivo es identificar patrones, categorías o tipos de contenido mediante algoritmos de aprendizaje supervisado.

## 📚 Objetivo

Clasificar automáticamente textos en categorías como:
- Not_ciberbullying
- Ciberacoso (por edad, género, etnia, etc.)

El modelo aprende a partir de textos preprocesados y vectores generados mediante técnicas de Procesamiento de Lenguaje Natural (PLN).

## 🧠 Modelos implementados

- **Naive Bayes**
- **SVM (Support Vector Machine)**
- **Random Forest**
- **K-Nearest Neighbors (KNN)**
- **Redes Neuronales (MLPClassifier de Scikit-Learn)**
- **Modelos basados en BERT/BETO** (usando HuggingFace)

> Los modelos se entrenan usando representaciones como TF-IDF, lexicones y embeddings (Word2Vec, BETO).
