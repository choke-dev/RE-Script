if game.PlaceId ~= 9289724442 then return end

-- // Services \\ --
local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")
-- // Modules \\ --
local ESPModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/choke-dev/RE-Script/main/Dependencies/ESP%20Module.lua"))()

-- // Main \\ --
while task.wait() do
    pcall(function()
        for i,v in pairs(workspace:GetDescendants()) do
            if v.Name == "AnimateScript" and v.Parent:IsA("Model") and v:IsA("LocalScript") and not CollectionService:HasTag(v.Parent.HumanoidRootPart, "3D_ESP") then
                ESPModule.Create3DESP(v.Parent.HumanoidRootPart, "Hider", Color3.fromRGB(112, 149, 120))
            end
        end
    end)
end