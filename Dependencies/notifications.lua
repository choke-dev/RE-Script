function IAB()
local Players = game:GetService("Players")
 
local player = Players.LocalPlayer
 
-- Fetch the thumbnail
local userId = player.UserId
local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size420x420
local lolcontent, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

getgenv()["IrisAdd"] = true
local Notification = loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterNotifications.lua"))()

Notification.Notify("Success", "choke's IAB Control Panel loaded!", lolcontent, {
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

function IIS()
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
