# Video Classification (Kaggle: What's on the video?)

Решение задачи классификации видеоконтента в рамках соревнования [Kaggle: What's on the video?](https://www.kaggle.com/competitions/what-on-the-video). Основной скрипт реализован в Jupyter Notebook `video_label.ipynb`.

## Загрузка данных

Для автоматической загрузки датасета с Kaggle используется библиотека `opendatasets`. 

```python
!pip install opendatasets --quiet
import opendatasets as od

# Требуется указать Kaggle API credentials (username и key)
# {"username":" ", "key":" "}
od.download("https://www.kaggle.com/competitions/what-on-the-video")
```

## Формат выходных данных

Модель анализирует видеофайлы и формирует таблицу предсказаний со следующей структурой:

| index | file_name | label |
| :--- | :--- | :--- |
| 0 | Arizona desert shrubs and clouds_preview.mp4 | cloud food sunset water |
| 1 | 005495163-white-flower_preview.mp4 | cloud food sunset water |
| 2 | 170411A_13_Blossom_1080p_preview.mp4 | cloud food sunset water |
| 3 | 181015_15b_Venice Canals_HD_01_preview.mp4 | cloud food sunset water |
| 4 | Big leaf maple flowers zoom in_preview.mp4 | cloud food sunset water |

## Стек технологий
* **Python**
* **Jupyter Notebook** (`video_label.ipynb`)
* **Pandas**
* **Opendatasets**
