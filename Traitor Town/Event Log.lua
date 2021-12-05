--[[ 

coded by choke#3588
the else ifs are bad i know :c

]]--

local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
local Notify = AkaliNotif.Notify;
function notify(title,text)
Notify({
Description = text;
Title = title;
Duration = 7;
});
end
local check = "rbxassetid://899278095"
local cross = "rbxassetid://899276813"
local shield = "rbxassetid://899276031"
local smile = "rbxassetid://899377516"
local maglass = "rbxassetid://500592011"
local star = "rbxassetid://500596592"
local app = "rbxassetid://899377601"
local coins = "rbxassetid://899275659"

local EventLog = game:GetService("ReplicatedStorage").RoundEvents
EventLog.ChildAdded:Connect(function(elog)
    local emoji = elog:WaitForChild("Icon").Value
    if emoji == check then
        notify("✅ | Traitor Kill / Justified Kill / Self Defense", elog.Name)
    elseif emoji == cross then
        notify("❌ | Teamkill", elog.Name)
    elseif emoji == shield then
        notify("🛡️ | Traitor Killed!", elog.Name)
    elseif emoji == smile then
        notify("💀 | Suicide", elog.Name)
    elseif emoji == maglass then
        notify("🔍 | Body Discovered", elog.Name)
    elseif emoji == star then
    	notify("⭐ | Round Status", elog.Name)
    elseif emoji == app then
    	notify("🎯 | Round Status", elog.Name)
	elseif emoji == coins then
		notify("💰 | Credits Found", elog.Name)
    else
        notify("❔ | Unknown Event", elog.Name)
    end
end)

notify("<b><font color=\"rgb(0, 255, 0)\">Success!</font></b>", "<b><font color=\"rgb(255, 0, 0)\">TT</font></b> <b><font color=\"rgb(255, 255, 0)\">Event Log</font></b> <b><font color=\"rgb(0, 255, 0)\">Loaded!</font></b>")    
