# Some quick functions to help with the construction of quantities
# that may be necessary in making plots
from .samples import Sample

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
