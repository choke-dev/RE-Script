local Weapons = {"Glock17", "P90", "MP7", "AKS-74U", "FlameThrower", "FreezeThrower", "Beretta93r", "Famas", "M249", "HK416", "Grenade"}
local Items = {"MedKit", "Smoothie", "FireExtinguisher", "Lavender", "FlashDrive", "Sponges", "CoverBag", "Medbag", "FlashLight", "Restraints", "Radio", "Candy", "SCP-096Pic"}
local SCPS = {"096", "939", "3199"}

-- // DO NOT EDIT ANYTHING BELOW UNLESS YOU KNOW WHAT YOU ARE DOING!!! \\ --

local CS = game:GetService("CollectionService")

local ESPModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/choke-dev/RE-Script/main/Dependencies/ESP%20Module.lua"))()

local function isGun(name)
    if table.find(Weapons, name) then
        return true
    else
        return false
    end
end

local function isItem(name)
    if table.find(Items, name) then
        return true
    else
        return false
    end
end

local function getLevel(card)
    local cardLevel = math.floor(card:WaitForChild("Level").Value / 10)
    return cardLevel
end

local function search()
    for _,v in pairs(workspace.Debris:GetChildren()) do
        if v.Name == "KeyCard" and not CS:HasTag(v, "3D_ESP") then
            local cardlvl = getLevel(v) or "❌"
            ESPModule.Create3DESP(v.hand, "Keycard Level: "..cardlvl, Color3.fromRGB(52, 255, 154))
        elseif isGun(v.Name) and not CS:HasTag(v, "3D_ESP") then
            ESPModule.Create3DESP(v.hand, v.Name, Color3.fromRGB(255, 106, 37))
        elseif isItem(v.Name) and not CS:HasTag(v, "3D_ESP") then
            ESPModule.Create3DESP(v.hand, v.Name, Color3.fromRGB(171, 98, 255))
        end
    end
end

search()

workspace.Debris.ChildAdded:Connect(function()
    search()
end)

workspace.Debris.ChildRemoved:Connect(function(instance)
    pcall(function()
        CS:RemoveTag(instance.hand, "3D_ESP")
    end)
end)