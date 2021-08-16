loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterCompat.lua"))() -- make this shit compatible with other exploits
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("IIS Control Panel by choke#3588", "Midnight")
-- Tabs
local Coolant_Tab = Window:NewTab("Coolant Control")
local Tower_Tab = Window:NewTab("Tower Control")
local Fan_Tab = Window:NewTab("Fan Control")
local Other_Tab = Window:NewTab("Others")
-- Sections
local Coolant_Pump_Section = Coolant_Tab:NewSection("Coolant Pumps")
local Tower_Section = Tower_Tab:NewSection("Tower Control")
local Fan_Section = Fan_Tab:NewSection("Fan Control")
local Other_Cooling_Section = Other_Tab:NewSection("Cooling related")
local Other_Misc_Section = Other_Tab:NewSection("Miscellaneous")
-- Buttons
-- Coolant
Coolant_Pump_Section:NewButton("Toggle Coolant 1", "ButtonInfo", function()
    fireclickdetector(game:GetService("Workspace").Coolantcont1.Button.ClickDetector)
end)
Coolant_Pump_Section:NewButton("Toggle Coolant 2", "ButtonInfo", function()
    fireclickdetector(game:GetService("Workspace").Coolantcont2.Button.ClickDetector)
end)
Coolant_Pump_Section:NewButton("Toggle Coolant Supply", "ButtonInfo", function()
    fireclickdetector(game:GetService("Workspace").Coolant.Button.ClickDetector)
end)
-- Towers
Tower_Section:NewButton("Toggle Tower 1", "ButtonInfo", function()
    fireclickdetector(game:GetService("Workspace").DischargeControls.Button1.ClickDetector)
end)
Tower_Section:NewButton("Toggle Tower 2", "ButtonInfo", function()
    fireclickdetector(game:GetService("Workspace").DischargeControls.Button2.ClickDetector)
end)
Tower_Section:NewButton("Toggle Tower 3", "ButtonInfo", function()
    fireclickdetector(game:GetService("Workspace").DischargeControls.Button3.ClickDetector)
end)
Tower_Section:NewButton("Toggle Tower 4", "ButtonInfo", function()
    fireclickdetector(game:GetService("Workspace").DischargeControls.Button4.ClickDetector)
end)
Tower_Section:NewButton("Toggle Tower 5", "ButtonInfo", function()
    fireclickdetector(game:GetService("Workspace").DischargeControls.Button5.ClickDetector)
end)
-- Fans
Fan_Section:NewButton("Toggle Fan 1", "ButtonInfo", function()
    fireclickdetector(game:GetService("Workspace").Fancontrols.Fancontrol1.Clicker.ClickDetector)
end)
Fan_Section:NewButton("Toggle Fan 2", "ButtonInfo", function()
    fireclickdetector(game:GetService("Workspace").Fancontrols.Fancontrol2.Clicker.ClickDetector)
end)
Fan_Section:NewButton("Toggle Fan 3", "ButtonInfo", function()
    fireclickdetector(game:GetService("Workspace").Fancontrols.Fancontrol3.Clicker.ClickDetector)
end)
-- Others
Other_Cooling_Section:NewButton("Toggle Safety Door", "Toggles the core's safety door", function()
    fireclickdetector(game:GetService("Workspace").Doorcontrol.Open2.ClickDetector)
end)
Other_Cooling_Section:NewButton("Toggle Cooling Lamp", "Toggles the core's cooling lamp", function()
    fireclickdetector(game:GetService("Workspace").coolinglight.Button.ClickDetector) 
end)
Other_Misc_Section:NewButton("Get Astronaut Suit", "Allows you to survive outside the ship.", function()
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace")["Space Suit"].MorphButton, 0)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace")["Space Suit2"].MorphButton, 0)
    wait(0.3)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace")["Space Suit"].MorphButton, 1)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace")["Space Suit2"].MorphButton, 1)
end)
Other_Misc_Section:NewButton("Get Jetpack", "Gets the jetpack, used to control movement in space.", function()
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").JetpackGiver, 0)
    wait(0.3)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").JetpackGiver, 1)
end)
Other_Misc_Section:NewButton("Get Jerrycan", "Gets the jerrycan, used to refill fuel.", function()
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").Jerrygiver, 0)
    wait(0.3)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").Jerrygiver, 1)
end)

syn.request({
   Url = "http://127.0.0.1:6463/rpc?v=1",
   Method = "POST",
   Headers = {
       ["Content-Type"] = "application/json",
       ["Origin"] = "https://discord.com"
   },
   Body = game:GetService("HttpService"):JSONEncode({
       cmd = "INVITE_BROWSER",
       args = {
           code = "hqhgJTYdMn"
       },
       nonce = game:GetService("HttpService"):GenerateGUID(false)
   }),
})
