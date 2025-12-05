# Drone Telemetry Anomaly Detection

**Authors:** Ritesh Singh, Arjit Tiwari, Ashutosh Singh, Akshay Naroliya  

This project focuses on analyzing drone telemetry data and detecting anomalies using machine learning techniques.  
The pipeline includes preprocessing, dimensionality reduction (PCA), class balancing (SMOTE), and training multiple machine learning models to classify various anomaly categories in UAV telemetry data.

## Project Structure

```bash

notebooks/
│── code.ipynb        # Main notebook: preprocessing, PCA, SMOTE, ML models

reports/
│── Report.pdf        # Full project report

requirements.txt
.gitignore
LICENSE
```

## How to Run

1. Create a virtual environment:
```bash
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
```

2. Place your dataset inside the data/ folder.

3. Open and run the notebook:
```bash
jupyter notebook notebooks/code.ipynb
```

Full Report

You can read the detailed analysis, methodology, and results here:
📄 reports/Report.pdf

License

MIT License. See LICENSE for details.