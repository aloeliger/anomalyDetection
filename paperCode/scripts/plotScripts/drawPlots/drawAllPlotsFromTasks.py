# !/usr/bin/env python3

import argparse
from rich.console import Console
from time import perf_counter

from anomalyDetection.paperCode.plottingTasks.drawCICADAandHTCorrelationTask import drawCICADAandHTCorrelationTask
from anomalyDetection.paperCode.plottingTasks.drawScorePlotsTask import drawScorePlotsTask
from anomalyDetection.paperCode.plottingTasks.drawTeacherStudentPlotTask import drawTeacherStudentPlotTask
from anomalyDetection.paperCode.plottingTasks.drawSignalAdditionsPlotsTask import drawSignalAdditionsPlotsTask
from anomalyDetection.paperCode.plottingTasks.drawCICADAPurityContentsPlotsTask import drawCICADAPurityContentsPlotsTask
from anomalyDetection.paperCode.plottingTasks.drawCICADATurnOnCurveTask import drawCICADATurnOnCurveTask
from anomalyDetection.paperCode.plottingTasks.drawObjectCorrelationPlotsTask import drawObjectCorrelationPlotsTask
from anomalyDetection.paperCode.plottingTasks.drawObjectControlPlotsTask import drawObjectControlPlotsTask
from anomalyDetection.paperCode.plottingTasks.drawCICADAandAXOScatterPlotsTask import drawCICADAandAXOScatterPlotsTask


console = Console()

def drawPlots(allTasks):
    nFailedTasks = 0
    failedTasks = []
    for task in allTasks:
        console.log(f"Executing: {task.taskName}")
        start_time = perf_counter()
        try:
            task.executeTask()
        except:
            console.print_exception(show_locals=True)
            nFailedTasks+=1
            failedTasks.append(task.taskName)
        end_time=perf_counter()
        console.log(f"Finished executing: {task.taskName}")
        console.log(f"Finished in {end_time-start_time:8.4g} seconds")
        console.print()
    if nFailedTasks > 0:
        console.log("There were failed tasks")
        console.log(f"{nFailedTasks} failed to draw")
        console.log("Failed tasks:")
        console.log(failedTasks)
    else:
        console.log("All tasks completed successfully")
    console.print()

def main(args):
    theDrawScorePlotsTask = drawScorePlotsTask(
        taskName = 'Draw Score Plots',
        dictOfFiles = {
            'scores': '/nfs_scratch/aloeliger/PaperPlotFiles/PlotFiles/scorePlots.root'
        },
    )
    theTeacherStudentPlotsTask = drawTeacherStudentPlotTask(
        taskName = 'Draw Teacher Student Plots',
        dictOfFiles = {
            'teacherstudent':'/nfs_scratch/aloeliger/PaperPlotFiles/PlotFiles/TeacherStudentPlots.root'
        },
    )
    theHTCorrelationPlotTask = drawCICADAandHTCorrelationTask(
        taskName = 'Draw HT Correlation Plots',
        dictOfFiles = {
            'correlation': "/nfs_scratch/aloeliger/PaperPlotFiles/PlotFiles/CICADA_HT_Correlation.root",
        },
    )
    theSignalAdditionsPlotTask = drawSignalAdditionsPlotsTask(
        taskName = 'Draw Signal Additions Plots',
        dictOfFiles = {
            'signaladditions': '/nfs_scratch/aloeliger/PaperPlotFiles/PlotFiles/signalAdditionsPlots.root',
        },
    )
    thePurityContentsTask = drawCICADAPurityContentsPlotsTask(
        taskName = 'Draw Purity Contents Plots',
        dictOfFiles = {
            'purity': '/nfs_scratch/aloeliger/PaperPlotFiles/PlotFiles/CICADAPurityContent.root'
        }
    )
    theTurnOnCurveTask = drawCICADATurnOnCurveTask(
        taskName = 'Draw CICADA Turn On Curves Plots',
        dictOfFiles = {
            'turnon': '/nfs_scratch/aloeliger/PaperPlotFiles/PlotFiles/CICADATurnOnCurves.root'
        }
    )
    theDrawObjectCorrelationTask = drawObjectCorrelationPlotsTask(
        taskName = 'Draw Object Correlation Plots',
        dictOfFiles = {
            'objects': '/nfs_scratch/aloeliger/PaperPlotFiles/PlotFiles/CICADAObjectPlots.root'
        }
    )
    theDrawObjectControlPlotsTask = drawObjectControlPlotsTask(
        taskName = 'Draw Object Control Plots',
        dictOfFiles = {
            'controls': '/nfs_scratch/aloeliger/PaperPlotFiles/PlotFiles/CICADAObjectControlPlots.root'
        }
    )
    theCICADAandAXOScatterPlotsTask = drawCICADAandAXOScatterPlotsTask(
        taskName = 'Draw CICADA and AXO Scatters',
        dictOfFiles = {
            'scatters': '/nfs_scratch/aloeliger/PaperPlotFiles/PlotFiles/CICADAandAXOScatterPlots.root'
        }
    )
    AXOL1TLDrawScorePlotsTask = drawScorePlotsTask(
        taskName = 'Draw AXOL1TL Score Plots',
        dictOfFiles = {
            'scores': '/nfs_scratch/aloeliger/PaperPlotFiles/PlotFiles/Axol1tlScorePlots.root'
        },
    )

    allTasks = [
        theDrawScorePlotsTask,
        AXOL1TLDrawScorePlotsTask,
        #theTeacherStudentPlotsTask,
        #theHTCorrelationPlotTask,
        #theSignalAdditionsPlotTask,
        #thePurityContentsTask,
        #theTurnOnCurveTask,
        #theDrawObjectCorrelationTask,
        #theDrawObjectControlPlotsTask,
        #theCICADAandAXOScatterPlotsTask,
    ]

    drawPlots(allTasks)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Draw all analysis plots")
    
    args = parser.parse_args()

    main(args)
