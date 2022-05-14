-- // Services \\ --
local AlertModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/choke-dev/RE-Script/main/Flood%20Escape%202/Alert%20System.lua"))()
local Notify = AkaliNotif.Notify;
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ContextActionService = game:GetService("ContextActionService")

-- // References \\ --
local LP = Players.LocalPlayer
local LC = LP.Character
local Hum = LC:WaitForChild("Humanoid")

-- // Variables \\ --
local InfiniteAirEvent
local HumDied
local InfiniteAir = false
local BlacklistedParts = {"Cycle1", "Cycle2", "Cycle3", "Cycle4", "Cycle5"}

-- // Functions \\ --
local function checkState()
    LC = LP.Character
    Hum = LC.Humanoid
    pcall(function()
        if InfiniteAir then
            for _,v in pairs(LC:GetDescendants()) do
                if v:IsA("Part") and not table.find(BlacklistedParts, v.Name) then
                    v.Material = Enum.Material.ForceField
                end
            end
        else
            for _,v in pairs(LC:GetDescendants()) do
                if v:IsA("Part") and not table.find(BlacklistedParts, v.Name) then
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

AlertModule.newAlert("Press [ Q ] to toggle.", Color3.new(0.188235, 0.447058, 1), 10)
AlertModule.newAlert("FE2 Infinite Air Loaded.", Color3.new(0.188235, 1, 0.321568), 10)