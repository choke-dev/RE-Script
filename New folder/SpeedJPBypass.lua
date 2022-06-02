local Players = game:GetService("Players")

local getrawmetatable = getrawmetatable or debug.getmetatable
local setrawmetatable = setrawmetatable or debug.setmetatable
local Meta = getrawmetatable(game)
local Me = Players.LocalPlayer
local New = {}
for Name, Method in next, Meta do
    New[Name] = Method
end
local FakeHumanoid = Instance.new("Humanoid")
New.__index = newcclosure(function(self, index)
    if index == "WalkSpeed" then
        return 20
    elseif index == "JumpPower" then
        return 50
    elseif index == "Changed" then
        return Meta.__index(FakeHumanoid, "Changed")
    else
        return Meta.__index(self, index)
    end
end)
New.__namecall = newcclosure(function(self, ...)
    local Args = {...}
    local Method = Args[#Args]
    if Method == "GetPropertyChangedSignal" then
        return Meta.__namecall(FakeHumanoid, ...)
    else
        return Meta.__namecall(self, ...)
    end
end)
local HookChar = function(Char)
    if Char then
        setrawmetatable(Char:WaitForChild("Humanoid"), New)
    end
end
HookChar(Me.Character)
Me.CharacterAdded:Connect(HookChar)