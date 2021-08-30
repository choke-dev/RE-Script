local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
Players = game:GetService("Players")

local Window = Material.Load({
	Title = "choke's artic base control panel [DEV]",
	Style = 1,
	SizeX = 500,
	SizeY = 350,
	Theme = "Dark",
})

local FanSection = Window.New({
	Title = "Fan"
})

local PumpSection = Window.New({
	Title = "Pumps"
})

local ValveSection = Window.New({
	Title = "Valves"
})

local DebugSection = Window.New({
	Title = "Debug"
})

--[[local Y = Window.New({
	Title = "UI Functions"
})]]

local FanButton0 = FanSection.Button({
	Text = "Set Fan Speed to 0",
	Callback = function()
		fireclickdetector(game.Workspace.Core.FanButtons["0"].ClickDetector)
	end,
	Menu = {
		Information = function(self)
			Window.Banner({
				Text = "Sets the fan speed to 0."
			})
		end
	}
})

local FanButton1 = FanSection.Button({
	Text = "Set Fan Speed to 1",
	Callback = function()
		fireclickdetector(game.Workspace.Core.FanButtons["1"].ClickDetector)
	end,
	Menu = {
		Information = function(self)
			Window.Banner({
				Text = "Sets the fan speed to 1."
			})
		end
	}
})

local FanButton2 = FanSection.Button({
	Text = "Set Fan Speed to 2",
	Callback = function()
		fireclickdetector(game.Workspace.Core.FanButtons["2"].ClickDetector)
	end,
	Menu = {
		Information = function(self)
			Window.Banner({
				Text = "Sets the fan speed to 2."
			})
		end
	}
})

local FanButton3 = FanSection.Button({
	Text = "Set Fan Speed to 3",
	Callback = function()
		fireclickdetector(game.Workspace.Core.FanButtons["3"].ClickDetector)
	end,
	Menu = {
		Information = function(self)
			Window.Banner({
				Text = "Sets the fan speed to 3."
			})
		end
	}
})

local FanButton4 = FanSection.Button({
	Text = "Set Fan Speed to 4",
	Callback = function()
		fireclickdetector(game.Workspace.Core.FanButtons["4"].ClickDetector)
	end,
	Menu = {
		Information = function(self)
			Window.Banner({
				Text = "Sets the fan speed to 4."
			})
		end
	}
})

local PumpButton0 = PumpSection.Button({
	Text = "Set Coolant Pump 1 to 0",
	Callback = function()
		fireclickdetector(game.Workspace.Core.Pump1Buttons["0"].ClickDetector)
	end,
	Menu = {
		Information = function(self)
			Window.Banner({
				Text = "Sets coolant pump 1's speed to 0."
			})
		end
	}
})

local PumpButton1 = PumpSection.Button({
	Text = "Set Coolant Pump 2 to 0",
	Callback = function()
		fireclickdetector(game.Workspace.Core.Pump2Buttons["0"].ClickDetector)
	end,
	Menu = {
		Information = function(self)
			Window.Banner({
				Text = "Sets coolant pump 2's speed to 0."
			})
		end
	}
})

local PumpButton2 = PumpSection.Button({
	Text = "Set Coolant Pump 1 to max speed",
	Callback = function()
		fireclickdetector(game.Workspace.Core.Pump1Buttons["2"].ClickDetector)
	end,
	Menu = {
		Information = function(self)
			Window.Banner({
				Text = "Sets coolant pump 1's speed to max."
			})
		end
	}
})

local PumpButton3 = PumpSection.Button({
	Text = "Set Coolant Pump 2 to max speed",
	Callback = function()
		fireclickdetector(game.Workspace.Core.Pump2Buttons["2"].ClickDetector)
	end,
	Menu = {
		Information = function(self)
			Window.Banner({
				Text = "Sets coolant pump 2's speed to max."
			})
		end
	}
})

local ValveButton0 = ValveSection.Button({
	Text = "Turn off valve 1",
	Callback = function()
		local Mist1 = game:GetService("Workspace").Core.WaterPart.Water1A.Enabled
        if Mist1 == true then
            fireclickdetector(game.Workspace.Core.Valve1.ClickDetector)
            wait(5)
        end
	end,
	Menu = {
		Information = function(self)
			Window.Banner({
				Text = "Turns off the coolant generating valve."
			})
		end
	}
})

local ValveButton1 = ValveSection.Button({
	Text = "Turn off valve 2",
	Callback = function()
		local Mist1 = game:GetService("Workspace").Core.WaterPart.Water2A.Enabled
        if Mist1 == true then
            fireclickdetector(game.Workspace.Core.Valve2.ClickDetector)
            wait(5)
        end
	end,
	Menu = {
		Information = function(self)
			Window.Banner({
				Text = "Turns off the coolant generating valve."
			})
		end
	}
})

local ValveButton2 = ValveSection.Button({
	Text = "Turn on valve 1",
	Callback = function()
		local Mist1 = game:GetService("Workspace").Core.WaterPart.Water1A.Enabled
        if Mist1 == false then
            fireclickdetector(game.Workspace.Core.Valve1.ClickDetector)
            wait(5)
        end
	end,
	Menu = {
		Information = function(self)
			Window.Banner({
				Text = "Turns on the coolant generating valve."
			})
		end
	}
})

local ValveButton3 = ValveSection.Button({
	Text = "Turn on valve 2",
	Callback = function()
		local Mist1 = game:GetService("Workspace").Core.WaterPart.Water2A.Enabled
        if Mist1 == false then
            fireclickdetector(game.Workspace.Core.Valve2.ClickDetector)
            wait(5)
        end
	end,
	Menu = {
		Information = function(self)
			Window.Banner({
				Text = "Turns off the coolant generating valve."
			})
		end
	}
})

local RejoinButton = DebugSection.Button({
	Text = "Rejoin",
	Callback = function()
		Players = game:GetService("Players")
		if #Players:GetPlayers() <= 1 then
				Players.LocalPlayer:Kick("\n\n\n\n⌛\nRejoining...\n\n\n")
				wait()
				game:GetService('TeleportService'):Teleport(game.PlaceId, Players.LocalPlayer)
			else
				game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, Players.LocalPlayer)
		end
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "Rejoins the game using a JobId else, it uses the PlaceId."
			})
		end
	}
})

local InvisFlingButton = DebugSection.Button({
	Text = "Initialize Invisible Fling",
	Callback = function()
        if not getgenv().InvisFling then
            loadstring(game:HttpGet("https://pastebin.com/raw/qJsepewG"))()
            getgenv().InvisFling = true
        end
	end,
	Menu = {
		Information = function(self)
			Window.Banner({
				Text = "Invis fling."
			})
		end
	}
})
