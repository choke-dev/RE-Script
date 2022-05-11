-- // Services \\ --
local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
local Notify = AkaliNotif.Notify;
local Players = game:GetService("Players")
local ContextActionService = game:GetService("ContextActionService")

-- // References \\ --
local LP = Players.LocalPlayer
local LC = LP.Character
local Hum = LC:WaitForChild("Humanoid")

-- // Variables \\ --
local InfiniteAirEvent
local HumDied
local InfiniteAir = false

-- // Functions \\ --
local function checkState()
    LC = LP.Character
    Hum = LC.Humanoid
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

local keybindHandler = function(name, inputState)
    if inputState ~= Enum.UserInputState.Begin then return end

    if InfiniteAir then
        InfiniteAir = false
        checkState()
    else
        InfiniteAir = true
        checkState()
    end
end

-- // Main \\ --
    
InfiniteAirEvent = Hum:GetPropertyChangedSignal("Health"):Connect(function()
    if not InfiniteAir then return end
    Hum.Health = 100
end)

LP.CharacterAdded:Connect(function(char)
    if char.Name ~= LP.Name then return end
    LC = LP.Character
    Hum = LC:WaitForChild("Humanoid")
    
    InfiniteAir = false -- just incase if the localplayer exceeds the time limit and the game forces them to respawn
    InfiniteAirEvent = Hum:GetPropertyChangedSignal("Health"):Connect(function()
        if not InfiniteAir then return end
        Hum.Health = 100
    end)

    HumDied = Hum.Died:Connect(function()
        InfiniteAirEvent:Disconnect()
        HumDied:Disconnect()
    end)
end)

-- // Handler when the player dies \\ --
HumDied = Hum.Died:Connect(function()
    InfiniteAirEvent:Disconnect()
    HumDied:Disconnect()
end)


-- // Keybinding \\ --
ContextActionService:BindAction("InfiniteAirBind", keybindHandler, false, Enum.KeyCode.Q)

Notify({
    Description = "Press [ Q ] to toggle.";
    Title = "<b><font color=\"rgb(58, 67, 255)\">FE2 Infinite Air</font></b>";
    Duration = 10;
});