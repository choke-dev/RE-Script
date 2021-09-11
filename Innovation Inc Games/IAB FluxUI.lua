local Flux = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/fluxlib.txt")()

local win = Flux:Window("Remote Control\nPanel", "\n\nby choke#3588", Color3.fromRGB(255, 110, 48), Enum.KeyCode.LeftControl)
--Flux:Notification("Made by choke#3588", "ok.")
local CoolTab = win:Tab("Cooling", "http://www.roblox.com/asset/?id=4384392025")
local ValvTab = win:Tab("Valves", "http://www.roblox.com/asset/?id=4370347078")
local FanTab = win:Tab("Fan", "http://www.roblox.com/asset/?id=7340322600")
CoolTab:Button("Turn off coolant pump 1", "Turns off coolant pump 1.", function()
  fireclickdetector(game.Workspace.Core.Pump1Buttons["0"].ClickDetector)
end)

CoolTab:Button("Turn off coolant pump 2", "Turns off coolant pump 2.", function()
  fireclickdetector(game.Workspace.Core.Pump2Buttons["0"].ClickDetector)
end)

CoolTab:Line()

CoolTab:Button("Turn on coolant pump 1", "Turns on coolant pump 1.", function()
  fireclickdetector(game.Workspace.Core.Pump1Buttons["2"].ClickDetector)
end)

CoolTab:Button("Turn on coolant pump 2", "Turns on coolant pump 2.", function()
  fireclickdetector(game.Workspace.Core.Pump2Buttons["2"].ClickDetector)
end)

ValvTab:Button("Turn off Valve 1", "Turns off coolant valve 1.", function()
    local Mist1 = game:GetService("Workspace").Core.WaterPart.Water1A.Enabled
    if Mist1 == true then
    fireclickdetector(game.Workspace.Core.Valve1.ClickDetector)
    wait(5)
end
end)

ValvTab:Button("Turn off Valve 2", "Turns off coolant valve 2.", function()
    local Mist1 = game:GetService("Workspace").Core.WaterPart.Water2A.Enabled
    if Mist1 == true then
    fireclickdetector(game.Workspace.Core.Valve2.ClickDetector)
    wait(5)
end
end)

ValvTab:Line()

ValvTab:Button("Turn on Valve 1", "Turns on coolant valve 1.", function()
    local Mist1 = game:GetService("Workspace").Core.WaterPart.Water1A.Enabled
    if Mist1 == false then
    fireclickdetector(game.Workspace.Core.Valve1.ClickDetector)
    wait(5)
end
end)

ValvTab:Button("Turn on Valve 2", "Turns on coolant valve 2.", function()
    local Mist1 = game:GetService("Workspace").Core.WaterPart.Water2A.Enabled
    if Mist1 == false then
    fireclickdetector(game.Workspace.Core.Valve2.ClickDetector)
    wait(5)
end
end)

FanTab:Button("Set Fan Speed to 0", "Turns the fans off.", function()
  fireclickdetector(game.Workspace.Core.FanButtons["0"].ClickDetector)
end)

FanTab:Button("Set Fan Speed to 1", "Sets the fan speed to 1.", function()
  fireclickdetector(game.Workspace.Core.FanButtons["1"].ClickDetector)
end)

FanTab:Button("Set Fan Speed to 2", "Sets the fan speed to 2.", function()
  fireclickdetector(game.Workspace.Core.FanButtons["2"].ClickDetector)
end)

FanTab:Button("Set Fan Speed to 3", "Sets the fan speed to 3.", function()
  fireclickdetector(game.Workspace.Core.FanButtons["3"].ClickDetector)
end)

FanTab:Button("Set Fan Speed to 4", "Sets the fan speed to 4.", function()
  fireclickdetector(game.Workspace.Core.FanButtons["4"].ClickDetector)
end)
