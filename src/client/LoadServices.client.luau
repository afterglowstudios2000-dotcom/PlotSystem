local rs = game:GetService("ReplicatedStorage")
local moudleLoader = require(rs.Shared.ModuleLoader)
local servicesFolder = script.Parent:WaitForChild("Services")

moudleLoader.Init(servicesFolder:GetChildren())
moudleLoader.Start()