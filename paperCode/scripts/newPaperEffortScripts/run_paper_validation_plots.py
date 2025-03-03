import src.paper_validation_plots as script
import argparse

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Runs paper validation plots')

    args = parser.parse_args()

    script.main(args)

