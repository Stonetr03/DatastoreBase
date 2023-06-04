-- Stonetr03

local DataStoreService = game:GetService("DataStoreService")
local DataStore

-- WARNING: This Code is for Testing Only and should NOT be used in a Live environment.
-- For use in a Live Environment, its recommended to use pcalls and Checks

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
        --return DataStore:GetAsync(Name)
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
    elseif Req == "Save" then
        print("Save",Name)
        print(Value)
        --DataStore:SetAsync(Name,Value)
    elseif Req == "Remove" then
        -- Delete Key
        --DataStore:RemoveAsync(Name)
    end
end
