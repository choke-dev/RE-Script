-- // Services \\ --
local RS = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- // Main \\ --
local module = {}

local NotificationEvent = Players.LocalPlayer.PlayerScripts["CL_MAIN_GameScript"].Notify
local AlertRemote = RS.Remote.Alert
local AirRemote = RS.Remote.TEST.AirToggle

function module.newAlert(text:string, color:Color3, textime:NumberRange, event:string, autoLocalize:boolean)
	for i,v in pairs(getconnections(AlertRemote.OnClientEvent)) do
	    v:Fire(text, color, textime, event, autoLocalize)
	end
end

function module.toggleAir(status:boolean)
	for i,v in pairs(getconnections(AirRemote.OnClientEvent)) do
		v:Fire(status)
	end
end

function module.newNotification(title, description, img, func)
	local TEMP_Title = title or "newNotification Guide"
	local TEMP_Description = description or "newNotification(Title <string>, Description <string>, Image <number>, <Function to run when \"Confirm\" is clicked>)"
	NotificationEvent:Fire(TEMP_Description, TEMP_Title, func, img)
end

return module

--[[

	what the last 2 parameters do:
	event is just either "event" or "rainbow"
	├ rainbow is self explanatory
	└ event makes a flashing text between the color you chose and red just above the hud

	autoLocalize is a boolean that will automatically localize the text
	└ true will automatically localize the text
	└ false will not localize the text (default)

	textime is a number range that will determine how long the text will stay on screen

	( i am bad at explaining things :> )
]]