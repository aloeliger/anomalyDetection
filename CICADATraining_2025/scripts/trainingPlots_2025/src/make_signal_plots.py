#Infrastructure to support the CICADA physics case.
#What do we need with CICADA?

#In general, we're going to need a way to reweight MC or zero bias to the other
#So we need either an NPV reweight, or we need a region reweight

#plots we're going to want
#Signal acceptance with L1 + various amount of pure CICADA rate
#ROC curves

#Okay, let's start with the signal acceptance plot
#What we want is a per pure rate afforded, how much signal do we get back?
# so what we need is pure event score, non pure event scores, and way to translate each score into
# a pure rate necesary to have caught this

from sklearn.metrics import roc_curve, auc
import matploylib.pyplot as plt
import numpy as np

def get_rate_with_nonexact_threshold(rate_table, threshold):
    table_keys = list(rate_table.keys())
    low_bin = 0
    high_bin = len(table_keys) - 1
    prev_search_bin = None
    search_bin = (low_bin + high_bin) // 2

    while (search_bin != prev_search_bin):
        search_threshold = table_keys[search_bin]
        if search_threshold == threshold:
            break

        if search_threshold > threshold:
            high_bin = search_bin
        else:
            low_bin = search_bin

        prev_search_bin = search_bin
        search_bin = (low_bin + high_bin) // 2

    final_threshold = table_keys[search_bin]
    final_rate = rate_table[final_threshold]

    return final_rate, final_threshold

def make_signal_acceptance_plot(pure_mc_scores, non_pure_mc_scores, pure_rate_table):
    pass

def make_roc_plot(
        signal_predictions,
        background_predictions,
        save_location
):
    plt.figure()
    
    for signal in singal_predictions:
        true_values = np.zeros((len(background_predictions),))
        true_values = np.append(
            true_values,
            np.ones((len(signal_predictions[signal]),)),
            axis=0
        )

        scores = np.append(background_predictions, signal_predictions[signal])

        fpr, tpr, threshold = roc_curve(y_true, y_scores)

        roc_auc = auc(fpr, tpr)

        plt.plot(fpr, tpr, lw=2, label=f'{signal} (AUC = {roc_auc:.2f})')
    plt.plot([0,1], [0,1], color='gray', linestyle='--')
    plt.xlabel('Zero Bias Acceptance')
    plt.ylabel('Signal Acceptance')
    plt.legend(loc='lower right')
    plt.savefig(f'{save_location}')
    
