module SignalTablesInterface_WGLMakie_runtests

import SignalTables
using  Test

@testset "Test SignalTablesInterface_WGLMakie/test" begin
    SignalTables.usePlotPackage("WGLMakie")
    include("$(SignalTables.path)/test/include_all.jl")
    SignalTables.usePreviousPlotPackage()
end

end