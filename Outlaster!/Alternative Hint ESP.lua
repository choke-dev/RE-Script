local Announcement = require(game:GetService("Players").LocalPlayer.PlayerScripts.GameUI.Announcement)
Announcement.Display("Script Loaded!", "Press [V] to search for hints!")

synlog = NEON:github('belkworks', 'synlog')
if game.PlaceId ~= 5765666934 then 
    synlog:error("You must join an Outlaster game to use this script!")
    return 
end

local CoSe = game:GetService("CollectionService")
local twodeeESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/choke-dev/RE-Script/main/Dependencies/Drawing%20Library%202D%20Box%20ESP.lua"))();
local ContextActionService = game:GetService("ContextActionService")
local contextButton = false


local function search()
    if contextButton then
        contextButton = false
        return
    else
        contextButton = true
    end

    local foundhints = 0

    for i,v in pairs(workspace:GetDescendants()) do
        if v:IsA("TouchTransmitter") and v.Parent:IsA("MeshPart") and v.Parent.Parent:IsA("Model") and v.Parent.Parent.Parent:IsA("MeshPart") and v.Parent.Parent.Parent.Parent:IsA("Model") and not CoSe:HasTag(v, "ESP") then
            twodeeESP.ESP(v.Parent, "Advantage Hint", Color3.fromRGB(0,255,0))
            CoSe:AddTag(v, "ESP")
            foundhints = foundhints + 1
        end
    end

    if foundhints ~= 0 then
        synlog:success("Found " .. foundhints .. " hints!")
    else
        synlog:warn("No new hints were found!")
    end
end

ContextActionService:BindAction("V | Search", search, false, Enum.KeyCode.V)
