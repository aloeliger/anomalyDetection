import src.score_plots_axo_style as script
import argparse

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Runs the paper axo-style score plot')

    args = parser.parse_args()
    script.main(args)
