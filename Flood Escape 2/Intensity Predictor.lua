local FE2Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/choke-dev/RE-Script/main/Flood%20Escape%202/FE2_Library.lua"))()
local ContextActionService = game:GetService("ContextActionService")
local function round(number, decimalPlaces)
	return math.round(number * 10^decimalPlaces) * 10^-decimalPlaces
end
local diffBalance = {
    ["Easy"] = 0.4,
    ["Normal"] = 0.5,
    ["Hard"] = 0.6,
    ["Insane"] = 0.65,
    ["Crazy"] = 1.5,
}
local boostCounter = {
    ["5💎"] = "0",
    ["9💎"] = "0.5",
    ["16💎"] = "1",
    ["28💎"] = "1.5",
    ["49💎"] = "2"
}

local playersAlive  
local playersJoined 
local intensityValue
local boostCount     
local playerPercentage
local finalCalculation

local keybindHandler = function(name, inputState)
    if inputState ~= Enum.UserInputState.Begin then return end

    playersAlive = game:GetService("Workspace").Lobby.GameInfo.SurfaceGui.Frame.Players.Text:split("/")[1]
    playersJoined = game:GetService("Workspace").Lobby.GameInfo.SurfaceGui.Frame.Players.Text:split("/")[2]:split(" ")[1]
    intensityValue = game:GetService("Workspace").Lobby.GameInfo.SurfaceGui.Frame.Difficulty.Difficulty.Text:split(":")[1]
    boostCount = game:GetService("Players").LocalPlayer.PlayerGui.MenuGui.Shop.Window.Content.Categories.BoostIntensity.Desc.Text:split(" ")[2]
    playerPercentage = playersAlive / playersJoined
    finalCalculation = round(playerPercentage, 2)  + boostCounter[boostCount] - diffBalance[intensityValue]
    --FE2Lib.newAlert("Calculation Formula: "..round(playerPercentage, 2).." + "..boostCounter[boostCount].." - "..diffBalance[intensityValue])
    --FE2Lib.newAlert("Final Calculation: "..round(finalCalculation, 2))
    if string.find(round(finalCalculation, 2), "-") then
        FE2Lib.newAlert("Predicted Intensity Change: "..round(finalCalculation, 2), Color3.new(1,0,0))
    else
        FE2Lib.newAlert("Predicted Intensity Change: +"..round(finalCalculation, 2), Color3.new(0,1,0))
    end
end

ContextActionService:BindAction("Calculate", keybindHandler, false, Enum.KeyCode.R)