module SignalTablesInterface_WGLMakie

# Constants
const headingSize = 10

const path = dirname(dirname(@__FILE__))   # Absolute path of package directory
const Version = "0.1.1"
const Date = "2022-08-05"

println("Importing SignalTablesInterface_WGLMakie Version $Version ($Date) - this takes some time due to WGLMakie import")

import SignalTables
import Colors
import Measurements
import MonteCarloMeasurements
using  Unitful

using  WGLMakie
include("$(SignalTables.path)/src/AbstractPlotInterface.jl")

const showFigureStringInDiagram = true
const callDisplayFunction = true
const reusePossible = false

const Makie_Point2f = isdefined(WGLMakie, :Point2f) ? Point2f : Point2f0    
include("$(SignalTables.path)/src/makie.jl")


function showFigure(figureNumber::Int)::Nothing
    #println("... in showFigure")
    if haskey(figures, figureNumber)
        matrixFigure = figures[figureNumber]
        fig = matrixFigure.fig
        display(fig)
    else
        @info "showFigure: figure $figureNumber is not defined."
    end    
    return nothing
end


function saveFigure(figureNumber::Int, fileName; kwargs...)::Nothing
    #println("... in saveFigure")
    if haskey(figures, figureNumber)
        #fig = figures[figureNumber].fig       
        #fullFileName = joinpath(pwd(), fileName)
        #println("... save plot in file: \"$fullFileName\"")
        @info "saveFigure($figureNumber, \"$fileName\") is ignored since WLGMakie.save(..) leads to errors."
        #save(fileName, fig; kwargs...)
        #display(fig)         
    else
        @info "saveFigure: figure $figureNumber is not defined."
    end    
    return nothing
end


function closeFigure(figureNumber::Int)::Nothing
    #println("... in closeFigure")
    delete!(figures,figureNumber)
    if length(figures) > 0
        dictElement = first(figures)
        display(dictElement[2].fig)
    else
        fig = Figure()
        display(fig)
    end
    return nothing
end


"""
    closeAllFigures()

Close all figures.
"""
function closeAllFigures()::Nothing
    #println("... in closeAllFigures")
    if length(figures) > 0
        empty!(figures)
        fig = Figure()
        display(fig)
    end
    return nothing
end

end
