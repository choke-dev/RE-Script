local Players = game:GetService("Players")

local player = Players.LocalPlayer

-- Fetch the thumbnail
local userId = player.UserId
local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size420x420
local lolcontent, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

getgenv()["IrisAdd"] = true
local Notification = loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterNotifications.lua"))()

Notification.Notify("Success", "choke's IIS Control Panel loaded!", lolcontent, {
    Duration = 7,

    TitleSettings = {
        TextXAlignment = Enum.TextXAlignment.Center,
        Font = Enum.Font.SourceSansSemibold,
    },

    GradientSettings = {
        GradientEnabled = false,
        SolidColorEnabled = true,
        SolidColor = Color3.fromRGB(99, 255, 107),
        Retract = true
    }
})

-- idk how to call a function in a loadstring :sob:

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
Coolant_Pump_Section:NewButton("❄️ Toggle Coolant 1", "Toggles coolant pump 1", function()
    fireclickdetector(game:GetService("Workspace").Coolantcont1.Button.ClickDetector)
end)
Coolant_Pump_Section:NewButton("❄️ Toggle Coolant 2", "Toggles coolant pump 2", function()
    fireclickdetector(game:GetService("Workspace").Coolantcont2.Button.ClickDetector)
end)
Coolant_Pump_Section:NewButton("❄️ Toggle Coolant Supply", "Toggles the coolant supply", function()
    fireclickdetector(game:GetService("Workspace").Coolant.Button.ClickDetector)
end)
-- Towers
Tower_Section:NewButton("Toggle Tower 1", "Toggles tower 1", function()
    fireclickdetector(game:GetService("Workspace").DischargeControls.Button1.ClickDetector)
end)
Tower_Section:NewButton("Toggle Tower 2", "Toggles tower 2", function()
    fireclickdetector(game:GetService("Workspace").DischargeControls.Button2.ClickDetector)
end)
Tower_Section:NewButton("Toggle Tower 3", "Toggles tower 3", function()
    fireclickdetector(game:GetService("Workspace").DischargeControls.Button3.ClickDetector)
end)
Tower_Section:NewButton("Toggle Tower 4", "Toggles tower 4", function()
    fireclickdetector(game:GetService("Workspace").DischargeControls.Button4.ClickDetector)
end)
Tower_Section:NewButton("Toggle Tower 5", "Toggles tower 5", function()
    fireclickdetector(game:GetService("Workspace").DischargeControls.Button5.ClickDetector)
end)
-- Fans
Fan_Section:NewButton("💨 Toggle Fan 1", "Toggles fan 1", function()
    fireclickdetector(game:GetService("Workspace").Fancontrols.Fancontrol1.Clicker.ClickDetector)
end)
Fan_Section:NewButton("💨 Toggle Fan 2", "Toggles fan 2", function()
    fireclickdetector(game:GetService("Workspace").Fancontrols.Fancontrol2.Clicker.ClickDetector)
end)
Fan_Section:NewButton("💨 Toggle Fan 3", "Toggles fan 3", function()
    fireclickdetector(game:GetService("Workspace").Fancontrols.Fancontrol3.Clicker.ClickDetector)
end)
-- Others
Other_Cooling_Section:NewButton("🚪 Toggle Safety Door", "Toggles the core's safety door", function()
    fireclickdetector(game:GetService("Workspace").Doorcontrol.Open2.ClickDetector)
end)
Other_Cooling_Section:NewButton("💡 Toggle Cooling Lamp", "Toggles the core's cooling lamp", function()
    fireclickdetector(game:GetService("Workspace").coolinglight.Button.ClickDetector)
end)
Other_Misc_Section:NewButton("👨‍🚀 Get Astronaut Suit", "Allows you to survive outside the ship.", function()
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace")["Space Suit"].MorphButton, 0)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace")["Space Suit2"].MorphButton, 0)
    wait(0.3)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace")["Space Suit"].MorphButton, 1)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace")["Space Suit2"].MorphButton, 1)
end)
Other_Misc_Section:NewButton("🚀 Get Jetpack", "Gets the jetpack, used to control movement in space.", function()
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").JetpackGiver, 0)
    wait(0.3)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").JetpackGiver, 1)
end)
Other_Misc_Section:NewButton("⛽ Get Jerrycan", "Gets the jerrycan, used to refill fuel.", function()
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").Jerrygiver, 0)
    wait(0.3)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").Jerrygiver, 1)
end)
