# script for the creation of jobs for paper Ntuples
import argparse
from rich.console import Console
from rich.progress import Progress
from rich.syntax import Syntax
import subprocess
import datetime
import re
import os
import time
import random

console = Console()

class submissionSettings():
    def __init__(
            self,
            identity: str,
            jobName: str,
            fullSampleName: str,
            sampleName:str, 
            basePath:str, 
            progress:Progress,
            finalShellFileName:str,
            finalShellFile,
    ):
        self.identity = identity
        self.jobName = jobName
        self.fullSampleName = fullSampleName
        self.sampleName = sampleName
        self.basePath = basePath
        self.progress = progress
        self.finalShellFileName = finalShellFileName
        self.finalShellFile = finalShellFile

def parseFileList(fileName: str) -> list[str]:
    with open(fileName, 'r') as theFile:
        fileContents = theFile.read()
    listOfFiles = fileContents.split('\n')
    while '' in listOfFiles:
        listOfFiles.remove('')
    return listOfFiles    

def getListOfNonDiskLocations(fullSampleName: str) -> list[str]:
    dasCommand = f"dasgoclient --query=\"site dataset={fullSampleName}\""
    siteProcess = subprocess.run(
        [dasCommand],
        shell=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        check=True
    )
    time.sleep(random.gauss(mu=3.0, sigma=1.0)) # do a 3 second average wait to be nice to DAS servers
    allOutput = siteProcess.stdout.decode()
    allOutput = allOutput.split('\n')
    allOutput.remove('')

    nonTapeLocations = list(filter(
        lambda x: re.match(".*[tT]ape", x) is None,
        allOutput
    ))

    return nonTapeLocations

def getListOfFiles(fullSampleName: str) -> list[str]:
    listOfLocations = getListOfNonDiskLocations(fullSampleName)
    allFiles = set()
    for location in listOfLocations:
        dasCommand = f"dasgoclient --query=\"file dataset={fullSampleName} site={location}\""
        try:
            fileProcess = subprocess.run(
                [dasCommand],
                shell=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                check=True,
            )
        except subprocess.CalledProcessError:
            console.print(':warning-emoji: Had an issue getting all files:', style="bold red")
            console.print_exception()
            console.print("Command used:")
            console.print(dasCommand)
            exit(1)
        time.sleep(random.gauss(mu=3.0, sigma=1.0)) # do a 3 second average wait to be nice to DAS servers
        allOutput = fileProcess.stdout.decode()
        allOutput = allOutput.split('\n')
        allOutput.remove('')

        for fileName in allOutput:
            allFiles.add(fileName)
    return allFiles

def makeCondorSubmission(
        theSettings:submissionSettings,
        runRange=None,
        isData = False,
)->None:
    dagLocation = f'{theSettings.basePath}/dags/'
    os.makedirs(dagLocation, exist_ok=True)
    submitLocation = f'{theSettings.basePath}/submit/'
    outputDir = f'/store/user/{theSettings.identity}/{theSettings.jobName}/{theSettings.sampleName}'

    # Let's get a list of the valid files
    validFiles = getListOfFiles(theSettings.fullSampleName)
    validFilesFile = f'{theSettings.basePath}/{theSettings.sampleName}_Files.txt'
    with open(validFilesFile, 'w') as theFile:
        theFile.write('\n'.join(validFiles))
    del validFiles

    # let's make the final farmout command
    farmout_command = [
        'farmoutAnalysisJobs \\',
        f'--submit-dir={submitLocation} \\',
        '--assume-input-files-exist \\',
        '--input-dir=/ \\',
        f'--output-dir={outputDir} \\',
        f'--output-dag-file={dagLocation}/dag \\',
        "--use-singularity CentOS7 \\",
        '--memory-requirements=4000 \\',
        f'--input-file-list={validFilesFile} \\',
        f'{theSettings.jobName} \\',
        f'{os.environ["CMSSW_BASE"]} \\',
        f'{os.environ["CMSSW_BASE"]}//src/anomalyDetection/paperCode/python/makeCICADANtuplesFromRAW.py \\',
        "\'outputFile=$outputFileName\' \\",
        "\'inputFiles=$inputFileNames\' "
    ]

    farmout_command = '\n'.join(farmout_command)
    shell_command = f'# {theSettings.sampleName}\n{farmout_command}\n\n'
    shell_syntax = Syntax(shell_command, "bash")
    theSettings.progress.console.log(shell_syntax)
    theSettings.finalShellFile.write(shell_command)

def makeCrabSubmission(
        theSettings:submissionSettings,
        nFiles=2,
        runRange=None,
        isData=False,
):
    os.makedirs(theSettings.basePath, exist_ok=True)
    pythonConfigName = f"{theSettings.basePath}/submit.py"
    crabPythonConfig = open(pythonConfigName, "w")

    splitSampleName = theSettings.fullSampleName.split('/')
    splitSampleName.remove('')
    
    configContents = ""

    configContents+="from CRABClient.UserUtilities import config\nimport os\nimport datetime\n\n"
    configContents+="config = config()\n"

    configContents+=f"config.General.requestName = '{theSettings.jobName}'\n"
    configContents+=f'config.General.workArea = \'{theSettings.basePath}/crab\'\n'
    configContents+=f'config.General.transferOutputs = True\n\n'

    configContents+=f'config.JobType.pluginName = \'Analysis\'\n'
    configLocation = f'{os.environ["CMSSW_BASE"]}/src/anomalyDetection/paperCode/python/makeCICADANtuplesFromRAW.py'
    configContents+=f'config.JobType.psetName = \'{configLocation}\'\n'
    if isData==True:
        configContents += f'config.JobType.pyCfgParams=[\'isData=True\']\n'
    configContents+='config.JobType.maxMemoryMB = 4000\n'
    CICADALocation = f'{os.environ["CMSSW_BASE"]}/src/anomalyDetection/CICADA'
    configContents+=f'config.JobType.inputFiles=[\'{CICADALocation}\']\n\n'
    configContents+=f'config.Data.inputDataset=\'{theSettings.fullSampleName}\'\n'
    configContents+='config.Data.inputDBS = \'global\'\n'
    configContents+='config.Data.splitting = \'FileBased\'\n'
    configContents+=f'config.Data.unitsPerJob = {nFiles}\n'
    if runRange != None:
        configContents += f'config.Data.runRange = \'{runRange}\'\n'
    configContents+='config.Data.publication = False\n'
    configContents+=f'config.Data.outputDatasetTag = \'{theSettings.jobName}\'\n\n'

    configContents+=f'config.Site.storageSite = \'T2_US_Wisconsin\''

    shell_command = f'# {theSettings.sampleName}\ncrab submit -c {pythonConfigName}\n'
    theSettings.finalShellFile.write(shell_command)

    config_syntax = Syntax(configContents, "python")
    shell_syntax = Syntax(shell_command, "bash")

    theSettings.progress.console.print(config_syntax)
    theSettings.progress.console.print()
    theSettings.progress.console.print(shell_syntax)

    crabPythonConfig.write(configContents)
    crabPythonConfig.close()

def main(args) -> None:
    inputList = None
    if args.listOfSamples == None and args.fileList != None: #Work with a list of files
        inputList = parseFileList(args.fileList)
    elif args.listOfSamples != None and args.fileList == None: #Work with command line samples
        inputList = args.listOfSamples
    else:
        raise RuntimeError("Got a weird/impossible specification of inputs")
    
    console.log("Input samples to be ntuplized:")
    console.print(inputList, overflow='ellipsis')
    console.print()

    # let's sort out who we are, and make a submission area
    identityProcess = subprocess.run(
        ["whoami"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        check=True,
    )

    identityOutput = identityProcess.stdout.decode()
    identity = identityOutput.replace('\n','')
    console.log(f'[underline]Performing task submission as:[/underline] {identity}')
    console.print()

    currentTime = datetime.datetime.now()
    currentTimeStr = currentTime.strftime("%d%b%Y")
    
    if args.isData:
        finalShellFileName = f'FinalSubmission_Data_{currentTimeStr}.sh'
    else:
        finalShellFileName = f'FinalSubmission_MC_{currentTimeStr}.sh'
    finalShellFile = open(finalShellFileName,'w')

    jobName = f'Paper_Ntuples_{currentTimeStr}'

    with Progress() as progress:
        submissionTask = progress.add_task("Generating submissions...", total=len(inputList))
        for fullSampleName in inputList:
            
            splitSampleName = fullSampleName.split('/')
            splitSampleName.remove('')
            sampleName = splitSampleName[0]
            if args.isData:
                sampleName += f'_{splitSampleName[1]}'
                jobName = f'Paper_Ntuples_{currentTimeStr}' + f'_{splitSampleName[1]}'
            progress.console.rule(sampleName)
            
            basePath = f'/nfs_scratch/{identity}/CICADA_Paper_Ntuples/{sampleName}_{currentTimeStr}'
            progress.console.log('Base path:')
            progress.console.log(basePath)

            theSettings = submissionSettings(
                identity,
                jobName,
                fullSampleName,
                sampleName, 
                basePath, 
                progress,
                finalShellFileName,
                finalShellFile,
            )

            if args.condor:
                makeCondorSubmission(
                    theSettings,
                    args.runRange,
                    args.isData
                )
            elif args.crab:
                makeCrabSubmission(
                    theSettings,
                    args.filesPerJob,
                    args.runRange,
                    args.isData,
                )

            progress.update(submissionTask, advance=1.0)
    finalShellFile.close()
    console.print(f"Done! Run the shell file {finalShellFileName} to complete the submission!")
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Submit condor Ntuples for paper Ntuples")
    
    input_group = parser.add_mutually_exclusive_group(required=True)
    input_group.add_argument(
        '--listOfSamples',
        nargs='+'   
    )
    input_group.add_argument(
        '--fileList',
        nargs='?'
    )

    cluster_group = parser.add_mutually_exclusive_group(required=True)
    cluster_group.add_argument(
        '--condor',
        action='store_true'
    )
    cluster_group.add_argument(
        '--crab',
        action='store_true'
    )

    parser.add_argument(
        '-d',
        '--isData',
        action='store_true',
        help='Pass to the configuration appropriate data flags',
    )

    parser.add_argument(
        '--runRange',
        help='A string to specify the runs to run',
        type=str,
        nargs='?'
    )

    parser.add_argument(
        '--jobSplitting',
        help='Job splitting parameter for crab based submissions'
    )

    parser.add_argument(
        '--filesPerJob',
        default=2,
        type=int,
        help='Number of files to process per single job. Default 2.'
    )

    args = parser.parse_args()

    main(args)
