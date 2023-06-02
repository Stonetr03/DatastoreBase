-- Stonetr03

local Config = require(script.Parent:WaitForChild("Config"));
local Fusion = Config.Fusion
local DataStore = require(script.Parent:WaitForChild("Datastore"))

local Value = Fusion.Value

local Module = {
    CurrentDataStore = Value("");
    CurrentScope = Value("");
    CurrentKey = Value("");

    CurrentData = Value({});
    OriginalData = Value({});
}

function Module:GetDataStore(Name,Scope,props)
    Module.CurrentDataStore:set(Name);
    Module.CurrentScope:set(Scope);

    if Scope == "" then
        Scope = nil
    end

    local s = DataStore:GetDataStore(Name,Scope)
    if s == true then
        -- Next Ui
        return true
    elseif s == false then
        -- Error Ui
        props.Error:set(401)
        print(props.Error:get())
        return false
    end

end

function Module:GetKey(Key)
    local Data = DataStore:GetKey(Key)
    if Data == nil then
        -- No Data
    else
        Module.OriginalData:set({[Key] = Data})
        Module.CurrentData:set({[Key] = Data})
    end
end

function Module:RemoveDataStore()
    Module.CurrentDataStore:set("");
    Module.CurrentScope:set("");
    Module.CurrentData:set({});
    Module.OriginalData:set({});
    DataStore:Cleanup()
end

return Module
