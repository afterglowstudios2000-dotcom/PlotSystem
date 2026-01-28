local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")

local PlotService = require(ServerScriptService.Server.Services:WaitForChild("PlotService"))

local PlayerService = {}

function PlayerService.Start()
    Players.PlayerAdded:Connect(function(player)
        PlotService.AssignPlotToPlayer(player)
    end)
end

return PlayerService
