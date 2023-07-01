-- Stonetr03

local Module = {}

function Module:GetDataStore(Name,Scope)
    return game.ReplicatedStorage.Comm:InvokeServer("Get",Name,Scope) -- Returns true / false
end

function Module:Cleanup()
    return game.ReplicatedStorage.Comm:InvokeServer("Cleanup") -- Returns true / false
end

function Module:GetKey(Key)
    return game.ReplicatedStorage.Comm:InvokeServer("Key",Key) -- Returns Data
end

function Module:SaveKey(Key,Data)
    return game.ReplicatedStorage.Comm:InvokeServer("Save",Key,Data) -- Returns true / false
end

function Module:RemoveKey(Key)
    return game.ReplicatedStorage.Comm:InvokeServer("Remove",Key) -- Returns true / false
end

return Module
