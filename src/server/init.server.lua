-- Stonetr03

local DataStoreService = game:GetService("DataStoreService")
local DataStore

game.ReplicatedStorage.Comm.OnServerInvoke = function(p,Req,Name,Value)
    if Req == "Get" then
        return true
        --local s,e = pcall(function()
        --  DataStore = DataStoreService:GetDataStore(Name,Value)
        --end)
        --if s and DataStore then
        --    return true
        --else
        --    return false
        --end
    elseif Req == "Cleanup" then
        --DataStore = nil
        return true
    elseif Req == "Key" then
        return {
            Inventory = {
                [1] = {1,2};
                [2] = {3,4};
                [3] = {
                    A = {"pi"};
                    B = 3.14
                };
                [4] = "Example!";
                [5] = {}
            };
            Title = "Example Data";
            Points = 100;
            Enabled = true;
        }
    end
end
