local ContextActionService = game:GetService("ContextActionService")
local lol = false
local breathstatus
local clron = Color3.new(0, 1, 0.5019607843137255)
local clroff = Color3.new(1, 0.4745098039215686, 0.4745098039215686)
local highlight = Instance.new("Highlight", game:GetService("Players").LocalPlayer.Character)
highlight.OutlineColor = clroff
highlight.FillTransparency = 1
local keybindHandler = function(name, inputState)
    if inputState ~= Enum.UserInputState.Begin then return end
    breathstatus = game:GetService("Players").LocalPlayer.Character.Water.IsBreathEnabled
    if lol then
        lol = false
        breathstatus.Value = lol
        highlight.OutlineColor = clron
    else
        lol = true
        breathstatus.Value = lol
        highlight.OutlineColor = clroff
    end
end

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
    lol = false
    local funny = Instance.new("Highlight", char)
    funny.OutlineColor = clroff
    funny.FillTransparency = 1
    highlight = funny
end)

ContextActionService:BindAction("InfiniteAirBind", keybindHandler, false, Enum.KeyCode.Q)

--[[

local ContextActionService = game:GetService("ContextActionService")
ContextActionService:UnbindAction("InfiniteAirBind")

]]