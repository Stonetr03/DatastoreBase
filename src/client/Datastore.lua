-- Stonetr03

local Module = {}

function Module:GetDataStore(Name,Scope)
    return game.ReplicatedStorage.Comm:InvokeServer("Get",Name,Scope)
end

function Module:Cleanup()
    game.ReplicatedStorage.Comm:InvokeServer("Cleanup")
end

function Module:GetKey(Key)
    return game.ReplicatedStorage.Comm:InvokeServer("Key",Key)
end

return Module
