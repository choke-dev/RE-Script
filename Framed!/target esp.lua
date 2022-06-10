synlog = NEON:github('belkworks', 'synlog')

if getgenv().Connections then
	for i,v in ipairs(getgenv().Connections) do
		v:Disconnect()
	end
	synlog:success("Disconnected all previous connections.")
end

getgenv().Connections = {}

-- // Services \\ --
local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")

-- // Modules \\ --
local ESPModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/choke-dev/RE-Script/main/Dependencies/ESP%20Module.lua",true))()

-- // Variables \\ --
local Target

-- // Functions \\ --
local function highlightPlayer(playerName)
	ESPModule.Create2DESP(Players[tostring(playerName)].Character.Head, "\nTarget\n"..Players[tostring(playerName)].DisplayName, Color3.fromRGB(136, 0, 255))
end

local function scanForNewTarget()
	pcall(function()
		synlog:info("Scanning for new target...")
		Target = workspace.Events.GetTargetLocal:InvokeServer()
		if Target ~= nil then
			highlightPlayer(tostring(Target))
			synlog:success("Found new target, Displaying...")
			local DiedTrigger = Players[tostring(Target)].Character.Humanoid.Died:Connect(function()
				synlog:success("Target died, Scanning for new target...")
				scanForNewTarget()
				DiedTrigger:Disconnect()
			end)
			table.insert(getgenv().Connections, DiedTrigger)
		else
			synlog:error("This isn't supposed to happen, but it did.\nTarget's character wasn't found.")
		end
	end)
end

-- // Events \\ --
Players.LocalPlayer.CharacterAdded:Connect(function()
	scanForNewTarget()
end)

-- // Main \\ --
synlog:success("Script loaded.")
scanForNewTarget()
