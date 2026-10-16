# Lamoda Images Classification

Решение задачи бинарной классификации изображений одежды в рамках соревнования [Kaggle: Lamoda images classification](https://www.kaggle.com/competitions/lamoda-images-classification). Основной код решения содержится в Jupyter Notebook `lamoda.ipynb`.

## Описание задачи
Модель выполняет бинарную классификацию изображений на два целевых класса:
* `bluzy` (0) — блузки
* `bryuki` (1) — брюки

## Загрузка данных

Для автоматического скачивания датасета напрямую с Kaggle используется библиотека `opendatasets`. Перед запуском необходимо подготовить Kaggle API token.

```python
import opendatasets as od

# {"username": "YOUR_USERNAME", "key": "YOUR_KEY"}
od.download("https://www.kaggle.com/competitions/lamoda-images-classification")
```

## Генерация сабмита

Предсказания строятся на тестовом датасете с помощью фреймворка **PyTorch**. Метки классов (`0` и `1`) автоматически декодируются обратно в строковые названия для формирования финального файла отправки:

submission_df = pd.DataFrame({
    'index': filenames,
    'label': all_labels
})


## Стек технологий
* **Python**
* **PyTorch** (обучение нейросети и инференс)
* **Pandas** (формирование файлов отправки)
* **Opendatasets** (скачивание датасета)