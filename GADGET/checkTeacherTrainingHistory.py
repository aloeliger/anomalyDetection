import matplotlib.pyplot as plt
import numpy as np
from matplotlib.colors import ListedColormap
from matplotlib.patches import Patch
from pathlib import Path
import pandas as pd

def main():
    log = pd.read_csv('models/teacher/training.log')
    
    training_loss = log["loss"]
    validation_loss = log["val_loss"]
    
    plt.plot(np.arange(1, len(training_loss)+1), training_loss, label="Training")
    plt.plot(np.arange(1, len(validation_loss)+1), validation_loss, label="Validation")
    plt.legend(loc="upper right")
    plt.xlabel("Epoch")
    plt.ylabel("loss")
    plt.savefig("plots/teacher_loss_history.png", bbox_inches="tight")
    plt.close()

if __name__ == '__main__':
    main()
