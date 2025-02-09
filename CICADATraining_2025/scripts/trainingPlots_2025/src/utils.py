#!/usr/bin/env python3
#Some basic plot stuff to be useful in other places
import ROOT

def convert_eff_to_rate(eff, n_bunches=2544):
    return eff * (float(n_bunches) * 11425e-3) #11425e-3 is the kHz orbit frequency

def convert_rate_to_eff(rate, n_bunches=2544):
    return rate / (float(n_bunches) * 11425e-3)

#We need a way to define a pure event
#Which means we need a way to talk about what events triggered or not
#Okay, here's the general plan
#We're going to have to do this by Era
#We'll use the L1TTriggerBitsNtuplizer
#We'll define a new value "pureEvent" that labels whether or not a L1T
#Trigger fired

# To figure this out, we'll dump out all the possible trigger names
# Then for each trigger in the list, we'll dump out it's prescale column
# And look for anything that is not prescale 1.
# Once we have a list of unprescaled triggers, we can simply define a
# true or false new value that looks at this list

def get_list_of_triggers(sample):
    list_of_columns = sample.df.GetColumnNames()
    list_of_triggers = [str(x) for x in list_of_columns if ('L1_' in str(x) and '_prescale' not in str(x) and '_initial' not in str(x))]
    list_of_triggers = [x.split('.')[1] for x in list_of_triggers]
    return list_of_triggers

def filter_technical_triggers(list_of_triggers):
    technical_trigger_words = [
        'First',
        'Bunch',
        'Train',
        'Orbit',
        'Always',
    ]
    def doesnt_contain_technical_trigger_word(x):
        for word in technical_trigger_words:
            if word in x:
                return False
        return True

    filtered_list = filter(doesnt_contain_technical_trigger_word, list_of_triggers)

    return list(filtered_list)

def get_list_of_unprescaled_triggers(sample):
    list_of_triggers = get_list_of_triggers(sample)
    list_of_triggers = filter_technical_triggers(list_of_triggers)

    counts={}
    unprescaled_triggers = []
    for trigger in list_of_triggers:
        prescale_column = f'{trigger}_prescale'
        counts[trigger] = sample.df.Filter(f'{prescale_column} != 1').Count()

    for trigger in counts:
        counts[trigger] = counts[trigger].GetValue()
        if counts[trigger] == 0:
            unprescaled_triggers.append(trigger)
    return unprescaled_triggers

def make_pure_event_filter_string(list_of_triggers):
    filter_string = ''
    for trigger in list_of_triggers:
        filter_string += f'{trigger} == 0 && '
    filter_string = filter_string[:-4]
    return filter_string

def make_pure_event_variable(sample):
    unprescaled_triggers = get_list_of_unprescaled_triggers(sample)
    sample.df = sample.df.Define('pure_event', make_pure_event_filter_string(unprescaled_triggers))
    return sample

def make_pure_event_variable_from_list(the_df, list_of_triggers):
    the_df =  the_df.Define('pure_event', make_pure_event_filter_string(list_of_triggers))
    return the_df

def get_plot_dict_minimum(plot_dict):
    global_minimum = None
    for key in plot_dict:
        minimum = plot_dict[key].GetMinimum()
        if global_minimum is None or minimum < global_minimum:
            global_minimum = minimum
    return global_minimum

def get_plot_dict_maximum(plot_dict):
    global_maximum = None
    for key in plot_dict:
        maximum = plot_dict[key].GetMaximum()
        if global_maximum is None or maximum > global_maximum:
            global_maximum = maximum
    return global_maximum

def filter_bad_events(the_df):
    return the_df.Filter('npv > 10')

def define_cicada_average_variable(the_df):
    the_function = """
    double average = 0.0;
    try {
       for (int i = 0; i < 18*14; ++i) {
          average += (double) modelInput.at(i);
       }
       average = (average / 252.0);
       return average;
    }
    catch (const std::runtime_error& e) {
       return -999.0;
    }
    """

    the_df = the_df.Define(
        'cicada_input_average',
        the_function
    )
    return the_df

colors = [
    ROOT.TColor.GetColor('#656364'),
    ROOT.TColor.GetColor('#578dff'),
    ROOT.TColor.GetColor('#8668dd'),
    ROOT.TColor.GetColor('#adad7d'),
    ROOT.TColor.GetColor('#c849a9'),
    ROOT.TColor.GetColor('#c91f16'),
    ROOT.TColor.GetColor('#ff5e02'),
    ROOT.TColor.GetColor('#1845fb'),
]
