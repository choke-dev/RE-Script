--[[

	DOCUMENTATION

	newAlert Parameters:
	├ text - The text to display in the alert
	├ color - The color of the alert
	├ textime - Time in seconds before the alert disappears.
	├ Event Parameters:
	│	├ "event" - Creates a flashing text on top of the HUD.
	│	└ "rainbow" - Creates an animated rainbow text alert on top of the HUD.
	│
	└ autoLocalize - Automatically localize the text.

	toggleAir Parameters:
	├ true - Prevents the player from dying when the oxygen bar reaches 0%.
	└ false - Allows the player to die when the oxygen bar reaches 0%.

	newNotification Parameters:
	├ "title" - The title of the notification.
	├ "description" - The description of the notification.
	├ "img" - The image of the notification.
	└ "func" - The function to be called when the "Confirm" button is clicked.
	
]]

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
	NotificationEvent:Fire(description, title, func, img)
end

return module