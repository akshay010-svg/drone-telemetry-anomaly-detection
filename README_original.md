Fusion ML Pipeline – DNN, Physics-Guided Hybrid & Knowledge Distillation

This project builds a complete ML pipeline for multi-class classification using three models:

a DNN Teacher model,
a Hybrid Physics-guided model, and
a Lightweight Student model trained via Knowledge Distillation.
The script handles data loading, cleaning, feature selection, scaling, class-weighting and performance reporting (F1, accuracy, confusion matrices).
A physics rule layer is added to improve edge-case detection.
Finally, all models are compared on accuracy, F1-score and parameter count.

How to Run
Place your dataset at: Fusion_Data.csv
Install dependencies:
pip install pandas numpy tensorflow scikit-learn seaborn matplotlib
Run the script in Jupyter/Colab or:
python your_script.py
Visualizations + comparison table will be displayed after training.