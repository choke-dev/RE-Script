local text = "%s 🔪 %s"
-- killer 🔪 victim

local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stebulous/solaris-ui-lib/main/source.lua"))()
local Players = game:GetService("Players")

local win = SolarisLib:New({
  Name = "Trials of Justice GUI",
  FolderToSave = "SolarisLibStuff"
})

--win:Tab(title <string>)
local tab = win:Tab("Main")

--tab:Section(title <string>)
local sec = tab:Section("Killfeed")

for i,v in pairs(Players:GetDescendants()) do
    if v.Name == "Killer" and v.Value ~= nil then
        sec:Label(text:format(v.Value.Name, v.Parent.Name))
    end
end

for i,v in pairs(Players:GetDescendants()) do
    if v.Name == "Killer" then
        v:GetPropertyChangedSignal("Value"):Connect(function()
            sec:Label(text:format(v.Value.Name, v.Parent.Name))
        end)
    end
end
