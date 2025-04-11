import src.eff_plots as script
import argparse

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Runs the efficiency plots')

    parser.add_argument(
        '--debug',
        action='store_true',
        help='Run with fewer events to debug'
    )
    
    args = parser.parse_args()
    script.main(args)
