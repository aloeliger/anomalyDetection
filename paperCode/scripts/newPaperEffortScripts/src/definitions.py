# Some quick functions to help with the construction of quantities
# that may be necessary in making plots
from .samples import Sample
import os
import json
import functools

UNPRESCALED_TRIGGER_TABLE_ = f'{os.getenv("CMSSW_BASE")}/src/anomalyDetection/paperCode/metadata/updated_unprescaled_trigger_list.json'

@functools.cache
def get_unprescaled_trigger_list():
    with open(UNPRESCALED_TRIGGER_TABLE_) as the_file:
        unprescaled_trigger_list = json.load(the_file)
    return unprescaled_trigger_list

def make_pure_event_filter_string(list_of_triggers):
    filter_string = ''
    for trigger in list_of_triggers:
        filter_string += f'{trigger} == 0 && '
    filter_string = filter_string[:-4]
    return filter_string

def add_pure_event_variable(the_sample: Sample):
    unprescaled_trigger_list = get_unprescaled_trigger_list()
    filter_string = make_pure_event_filter_string(unprescaled_trigger_list)
    the_sample.df = the_sample.df.Define('pure_event', filter_string)

def add_cicada_input_sum(the_sample: Sample):
    cicadaInputSumFunction = """
    int sum = 0;
    try {
       for(int i = 0; i < 18; ++i) {
          for(int j = 0; j < 14; ++j) {
             sum += modelInput.at(i*14 + j);
          }
       }
       return sum;
    }
    catch (const std::runtime_error& e) {
        return -999;
    }
    """

    the_sample.df = the_sample.df.Define("cicadaInputSum", cicadaInputSumFunction)
    
def add_all_values(the_sample: Sample):
    add_cicada_input_sum(the_sample)
    add_pure_event_variable(the_sample)
