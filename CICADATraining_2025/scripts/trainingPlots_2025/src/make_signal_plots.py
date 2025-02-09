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
