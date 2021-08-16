loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterCompat.lua"))() -- make this shit compatible with other exploits
--loadstring(game:HttpGet("https://raw.githubusercontent.com/choke-dev/rscripts/main/Universal/functions?token=ALLESGWJZN7IILSX4RQE2T3BEMDYK"))() -- the functions i probably dont need lol
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))() --Initialize the UI Lib
local MainWindow = Library.CreateLib("Artic Base Remote Control Panel by choke#3588", "Ocean")
local CTC = MainWindow:NewTab("Core Temp Control")
local Loops = MainWindow:NewTab("Loops")
local CTL = Loops:NewSection("Core Temp")
local PumpS = CTC:NewSection("Coolant Pump Control")
local ValveS = CTC:NewSection("Coolant Valve Control")
local FanS = CTC:NewSection("Fan Control")
PumpS:NewButton("❌ Turn off pump 1", "Sets coolant pump 1 to the lowest speed", function()
    fireclickdetector(game.Workspace.Core.Pump1Buttons["0"].ClickDetector)
end)
PumpS:NewButton("❌ Turn off pump 2", "Sets coolant pump 2 to the lowest speed", function()
    fireclickdetector(game.Workspace.Core.Pump2Buttons["0"].ClickDetector)
end)
PumpS:NewButton("✅ Turn on pump 1", "Sets coolant pump 1 to max speed", function()
    fireclickdetector(game.Workspace.Core.Pump1Buttons["2"].ClickDetector)
end)
PumpS:NewButton("✅ Turn on pump 2", "Sets coolant pump 2 to max speed", function()
    fireclickdetector(game.Workspace.Core.Pump2Buttons["2"].ClickDetector)
end)
ValveS:NewButton("❌ Turn off Valve 1", "Toggles the coolant generating valves", function()
    local Mist1 = game:GetService("Workspace").Core.WaterPart.Water1A.Enabled
    if Mist1 == true then
    fireclickdetector(game.Workspace.Core.Valve1.ClickDetector)
    wait(5)
end
end)
ValveS:NewButton("❌ Turn off Valve 2", "Toggles the coolant generating valves", function()
    local Mist2 = game:GetService("Workspace").Core.WaterPart.Water2A.Enabled
    if Mist2 == true then
    fireclickdetector(game.Workspace.Core.Valve2.ClickDetector)
    wait(5)
end
end)
ValveS:NewButton("✅ Turn on Valve 1", "Toggles the coolant generating valves", function()
    local Mist1 = game:GetService("Workspace").Core.WaterPart.Water1A.Enabled
    if Mist1 == false then
    fireclickdetector(game.Workspace.Core.Valve1.ClickDetector)
    wait(5)
end
end)
ValveS:NewButton("✅ Turn on Valve 2", "Toggles the coolant generating valves", function()
    local Mist2 = game:GetService("Workspace").Core.WaterPart.Water2A.Enabled
    if Mist2 == false then
    fireclickdetector(game.Workspace.Core.Valve2.ClickDetector)
    wait(5)
end
end)
FanS:NewButton("Set fan to 0", "ButtonInfo", function()
    fireclickdetector(game.Workspace.Core.FanButtons["0"].ClickDetector)
end)
FanS:NewButton("Set fan to 1", "ButtonInfo", function()
    fireclickdetector(game.Workspace.Core.FanButtons["1"].ClickDetector)
end)
FanS:NewButton("Set fan to 2", "ButtonInfo", function()
    fireclickdetector(game.Workspace.Core.FanButtons["2"].ClickDetector)
end)
FanS:NewButton("Set fan to 3", "ButtonInfo", function()
    fireclickdetector(game.Workspace.Core.FanButtons["3"].ClickDetector)
end)
FanS:NewButton("Set fan to 4", "ButtonInfo", function()
    fireclickdetector(game.Workspace.Core.FanButtons["4"].ClickDetector)
end)    

--invitesyn()
