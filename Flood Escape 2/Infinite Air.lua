-- // Services \\ --
local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
local Notify = AkaliNotif.Notify;
local Players = game:GetService("Players")
local ContextActionService = game:GetService("ContextActionService")

-- // References \\ --
local LP = Players.LocalPlayer
local LC = LP.Character
local Hum = LC.Humanoid

-- // Variables \\ --
local InfiniteAir = false

-- // Main \\ --
Players.CharacterAdded:Connect(function(char)
    if char.Name ~= LP.Name then return end
    local InfiniteAirEvent = Hum:GetPropertyChangedSignal("Health"):Connect(function()
        if not InfiniteAir then return end
        Hum.Health = 100
    end)
end)

-- // Handler when the player dies \\ --
Players.CharacterRemoving:Connect(function(char)
    if char.Name ~= LP.Name then return end
    InfiniteAirEvent:Disconnect()
    InfiniteAirEvent = nil
    InfiniteAir = false
    checkState()
end)

local function checkState()
    pcall(function()
        if InfiniteAir then
            for _,v in pairs(LC:GetDescendants()) do
                if v:IsA("Part") then
                    v.Material = Enum.Material.ForceField
                end
            end
        else
            for _,v in pairs(LC:GetDescendants()) do
                if v:IsA("Part") then
                    v.Material = Enum.Material.Plastic
                end
            end
        end
    end)
end

-- // Keybinding \\ --

ContextActionService:BindAction("FE2_Godmode", function(name, inputState)
    if inputState ~= Enum.UserInputState.Begin then return end

    if InfiniteAir then
        InfiniteAir = false
        checkState()
    else
        InfiniteAir = true
        checkState()
    end
end, false, Enum.KeyCode.Q)

Notify({
    Description = "Press [ Q ] to toggle.";
    Title = "<b><font color=\"rgb(58, 67, 255)\">FE2 Infinite Air</font></b>";
    Duration = 10;
});