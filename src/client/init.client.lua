-- Stonetr03

local Fusion = require(script:WaitForChild("Packages"):WaitForChild("Fusion"))

local New = Fusion.New
local Children = Fusion.Children

local Ui = require(script:WaitForChild("Ui"))

New "ScreenGui" {
    Parent = game.Players.LocalPlayer.PlayerGui;
    ResetOnSpawn = false;
    DisplayOrder = 3;
    [Children] = {
        Ui.MainUi {}
    }
}
