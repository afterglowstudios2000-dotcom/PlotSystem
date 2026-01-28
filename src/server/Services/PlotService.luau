local ServerStorage = game:GetService("ServerStorage")

local PlotService = {}

function PlotService.AssignPlotToPlayer(player: Player)
    local plotsFolder = ServerStorage:WaitForChild("Plots")

    for _, plot in plotsFolder:GetChildren() do
        local ownerValue = plot:FindFirstChild("OwnerValue")
        if ownerValue and ownerValue.Value == 0 then
            ownerValue.Value = player.UserId
            plot.Parent = workspace
            break
        end
    end
end

function PlotService.Start()
    -- optional init logic
end

return PlotService
