local ModuleLoader = {}
local CachedNodules = {}

function ModuleLoader.Get(name: string)
    return CachedNodules[name]
end

function ModuleLoader.Init(scripts: {ModuleScript})
    for _, modscript in scripts do
        if not modscript:IsA("ModuleScript") then continue end
        local mod = require(modscript)
        CachedNodules[modscript.Name] = mod
    end    
end

function ModuleLoader.Start()
    for _, mod in CachedNodules do
        if mod.Start then
            task.spawn(mod.Start)
        end      
    end
end

shared.Get = ModuleLoader.Get

return ModuleLoader