--[[

                ⚠ DEPRECATED ⚠
    This script is no longer maintained/supported.

]]
-- // Keybinding \\ --
if not getgenv().FE2_InfAirBind then
    getgenv().FE2_InfAirBind = Enum.KeyCode.Q
end

-- // Services \\ --
local FE2Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/choke-dev/RE-Script/main/Flood%20Escape%202/FE2_Library.lua"))()
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ContextActionService = game:GetService("ContextActionService")

-- // References \\ --
local LP = Players.LocalPlayer
local LC = LP.Character
local Hum = LC:WaitForChild("Humanoid")

-- // Variables \\ --
local InfiniteAir
local HumanoidDied_Event
local Status = false
local Highlight_Status
local ColorStatus_ON = Color3.new(0, 1, 0.6666666666666667)
local ColorStatusALT_ON = Color3.new(0, 1, 0.4666666666666667)

-- // Highlighting \\ --
local TEMPHighlight_Status = Instance.new("Highlight", LC)
TEMPHighlight_Status.FillTransparency = 1
TEMPHighlight_Status.FillColor = ColorStatus_ON 
TEMPHighlight_Status.OutlineTransparency = 1
TEMPHighlight_Status.OutlineColor = ColorStatusALT_ON
Highlight_Status = TEMPHighlight_Status

-- // Tweens \\ --
local HighlightOutline_ON = TweenService:Create(Highlight_Status, TweenInfo.new(0.5,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut,0,false,0), {OutlineTransparency = 0})
local HighlightOutline_OFF = TweenService:Create(Highlight_Status, TweenInfo.new(0.5,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut,0,false,0), {OutlineTransparency = 1})
local HighlightFill_ON = TweenService:Create(Highlight_Status, TweenInfo.new(0.5,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut,-1,true,0), {FillTransparency = 0.65})
local HighlightFill_OFF = TweenService:Create(Highlight_Status, TweenInfo.new(0.5,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut,0,false,0), {FillTransparency = 1})

-- // Functions \\ --
function checkState()
    LC = LP.Character
    Hum = LC.Humanoid
    pcall(function()
        if Status then
            HighlightOutline_ON:Play()
            HighlightFill_ON:Play()
        else
            HighlightOutline_OFF:Play()
            HighlightFill_OFF:Play()
        end
    end)
end

function refreshTweens()
    HighlightOutline_ON = TweenService:Create(Highlight_Status, TweenInfo.new(0.5,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut,0,false,0), {OutlineTransparency = 0})
    HighlightOutline_OFF = TweenService:Create(Highlight_Status, TweenInfo.new(0.5,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut,0,false,0), {OutlineTransparency = 1})
    HighlightFill_ON = TweenService:Create(Highlight_Status, TweenInfo.new(0.5,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut,-1,true,0), {FillTransparency = 0.65})
    HighlightFill_OFF = TweenService:Create(Highlight_Status, TweenInfo.new(0.5,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut,0,false,0), {FillTransparency = 1})
end

local keybindHandler = function(name, inputState)
    if inputState ~= Enum.UserInputState.Begin then return end

    if Status then
        Status = false
        checkState()
    else
        Status = true
        checkState()
    end
end

-- // Main \\ --
InfiniteAir = Hum:GetPropertyChangedSignal("Health"):Connect(function()
    if not Status then return end
    Hum.Health = 100
end)

-- // Player Respawn Event \\ --
LP.CharacterAdded:Connect(function(char)
    if char.Name ~= LP.Name then return end
    LC = LP.Character
    Hum = LC:WaitForChild("Humanoid")
    Status = false -- just incase if the localplayer exceeds the time limit and the game forces them to respawn
    InfiniteAir = Hum:GetPropertyChangedSignal("Health"):Connect(function()
        if not Status then return end
        Hum.Health = 100
    end)
    HumanoidDied_Event = Hum.Died:Connect(function()
        InfiniteAir:Disconnect()
        HumanoidDied_Event:Disconnect()
    end)
    local TEMPHighlight_Status = Instance.new("Highlight", LC)
    TEMPHighlight_Status.FillTransparency = 1
    TEMPHighlight_Status.FillColor = ColorStatus_ON 
    TEMPHighlight_Status.OutlineTransparency = 1
    TEMPHighlight_Status.OutlineColor = ColorStatusALT_ON
    Highlight_Status = TEMPHighlight_Status
    refreshTweens()
end)

-- // Player Died Event \\ --
HumanoidDied_Event = Hum.Died:Connect(function()
    InfiniteAir:Disconnect()
    HumanoidDied_Event:Disconnect()
end)


-- // Keybinding \\ --
ContextActionService:BindAction("InfiniteAirBind", keybindHandler, false, getgenv().FE2_InfAirBind)

FE2Lib.newAlert("⚠ This version is deprecated.", Color3.new(1, 0.301960, 0.301960), 8)
FE2Lib.newAlert("Press [ "..getgenv().FE2_InfAirBind.Name.." ] to toggle.", Color3.new(0.188235, 0.447058, 1), 8)
FE2Lib.newAlert("FE2 Infinite Air v1.5 Loaded.", Color3.new(0,1,0), 8.001, "rainbow")