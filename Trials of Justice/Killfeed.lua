local text = "[ %s ] %s killed %s"
-- [TIME] killer killed victim
local targettext = "[ %s ] %s is a %s of %s"
-- [TIME] victim is a [TARGET TYPE] of person

local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stebulous/solaris-ui-lib/main/source.lua"))()
local Players = game:GetService("Players")
local Targets = {"NightTarget", "SecondNightTarget", "DayTarget"}

local win = SolarisLib:New({
  Name = "Trials of Justice GUI",
  FolderToSave = "SolarisLibStuff"
})

local KillFeed = win:Tab("Kill Logs")
local KillLogs = KillFeed:Section("Logs")

local TargetFeed = win:Tab("Target Logs")
local TargetLogs = TargetFeed:Section("Logs")


-- // Kill Feed \\ --
for i,v in pairs(Players:GetDescendants()) do
    if v.Name == "Killer" and v.Value ~= nil then
        KillLogs:Label(text:format("UNKNOWN", v.Value.Name, v.Parent.Name))
        --[[KillLogs:Button(text:format(game:GetService("Players").LocalPlayer.PlayerGui.Time.Bar.DayLabel.Text, v.Value.Name, v.Parent.Name), function()
            SolarisLib:Notification("Reason for death:", "["..v.Parent.Name.."] "..v.Parent.DeathReason.Value)
        end)]]
    end
end

for i,v in pairs(Players:GetDescendants()) do
    if v.Name == "Killer" then
        local KillEvent = v:GetPropertyChangedSignal("Value"):Connect(function()
            KillLogs:Label(text:format(game:GetService("Players").LocalPlayer.PlayerGui.Time.Bar.DayLabel.Text, v.Value.Name, v.Parent.Name))
            --[[KillLogs:Button(text:format(game:GetService("Players").LocalPlayer.PlayerGui.Time.Bar.DayLabel.Text, v.Value.Name, v.Parent.Name), function()
                SolarisLib:Notification("Reason for death:", "["..v.Parent.Name.."] "..v.Parent.DeathReason.Value)
            end)]]
            KillEvent:Disconnect()
        end)
    end
end
-- // Target Logs \\ --
for i,v in pairs(Players:GetDescendants()) do
    if table.find(Targets, v.Name) then
        local TargetEvent = v:GetPropertyChangedSignal("Value"):Connect(function()
            TargetLogs:Label(targettext:format(game:GetService("Players").LocalPlayer.PlayerGui.Time.Bar.DayLabel.Text, v.Parent.Name, v.Name, v.Value.Name))
        end)
    end
end