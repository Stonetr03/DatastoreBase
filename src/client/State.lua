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

-- ProcessTable and CloneData are used to Desync the tables given from Datastore Function
local function ProcessTable(t)
    local NewTab = {}
    for i,v in pairs(t) do
        if typeof(v) == "table" then
            NewTab[i] = table.clone(ProcessTable(v))
        else
            NewTab[i] = v
        end
    end
    return NewTab
end
local function CloneData(Data)
    if typeof(Data) == "table" then
        return ProcessTable(table.clone(Data))
    else
        return Data
    end
end

function Module:GetKey(Key)
    local Data = DataStore:GetKey(Key)
    Module.CurrentKey:set(Key)
    if Data == nil then
        -- No Data
    else
        Module.OriginalData:set({[Key] = CloneData(Data)})
        Module.CurrentData:set({[Key] = CloneData(Data)})
    end
end

function Module:UpdateKey(NewValue)
    if Module.CurrentKey:get() ~= "" then
        if NewValue == nil then
            -- Delete Key
            warn("Delete Data")
        else
            -- Update Key
            Module.CurrentData:set({[Module.CurrentKey:get()] = NewValue})
            print("Update Key")
            print("Og:",Module.OriginalData:get())
            print("Nw:",Module.CurrentData:get())
        end
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
