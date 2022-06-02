local function round(number, decimalPlaces)
    local decplaces = decimalPlaces or 0
	return math.round(number * 10^decplaces) * 10^-decplaces
end
local diffBalance = {
    ["Easy"] = 0.4,
    ["Normal"] = 0.5,
    ["Hard"] = 0.6,
    ["Insane"] = 0.65,
    ["Crazy"] = 1.5,
}
local boostCounter = {
    ["5💎"] = "0",
    ["9💎"] = "0.5",
    ["16💎"] = "1",
    ["28💎"] = "1.5",
    ["49💎"] = "2",
    ["❌"] = "2.5"
}

local waitingText = "⌛"
local loading
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local IntensityChangeValue = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local DebugInfo = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")

--Properties:

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "IntensityPredictor"

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.00573215215, 0, 0.88976115, 0)
Frame.Size = UDim2.new(0.139470994, 0, 0.0991277099, 0)
Frame.ZIndex = 2

Title.Name = "Title"
Title.Parent = Frame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0, 0, 0.0711347982, 0)
Title.Size = UDim2.new(1, 0, 0.190554589, 0)
Title.ZIndex = 2
Title.Font = Enum.Font.Ubuntu
Title.Text = "Predicted Intensity Change:"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 19.000
Title.TextWrapped = true

IntensityChangeValue.Name = "IntensityChangeValue"
IntensityChangeValue.Parent = Frame
IntensityChangeValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
IntensityChangeValue.BackgroundTransparency = 1.000
IntensityChangeValue.Position = UDim2.new(0, 0, 0.419135809, 0)
IntensityChangeValue.Size = UDim2.new(1, 0, 0.483341187, 0)
IntensityChangeValue.ZIndex = 2
IntensityChangeValue.Font = Enum.Font.Ubuntu
IntensityChangeValue.Text = "⌛"
IntensityChangeValue.TextColor3 = Color3.fromRGB(255, 255, 127)
IntensityChangeValue.TextScaled = true
IntensityChangeValue.TextSize = 46.000
IntensityChangeValue.TextWrapped = true

UICorner.CornerRadius = UDim.new(0.100000001, 0)
UICorner.Parent = Frame

UIAspectRatioConstraint.Parent = Frame
UIAspectRatioConstraint.AspectRatio = 2.500

DebugInfo.Name = "DebugInfo"
DebugInfo.Parent = Frame
DebugInfo.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
DebugInfo.BorderSizePixel = 0
DebugInfo.Position = UDim2.new(0, 0, -2.47809339, 0)
DebugInfo.Size = UDim2.new(1.09586787, 0, 2.7396698, 0)
DebugInfo.Font = Enum.Font.Ubuntu
DebugInfo.Text = waitingText
DebugInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
DebugInfo.TextScaled = true
DebugInfo.TextSize = 19.000
DebugInfo.TextWrapped = false

UICorner_2.CornerRadius = UDim.new(0.100000001, 0)
UICorner_2.Parent = DebugInfo

UIAspectRatioConstraint_2.Parent = DebugInfo
UIAspectRatioConstraint_2.DominantAxis = Enum.DominantAxis.Height

local playersAlive
local playersJoined
local intensityValue
local boostCount
local playerPercentage
local finalCalculation

local keybindHandler = function()
    if game:GetService("Workspace").Lobby.GameInfo.SurfaceGui.Frame.Players.Text == "Waiting for Players" then
        IntensityChangeValue.Text = waitingText
        IntensityChangeValue.TextColor3 = Color3.new(1, 1, 0.4980392156862745)
        return
    end
    pcall(function()
        playersAlive     = game:GetService("Workspace").Lobby.GameInfo.SurfaceGui.Frame.Players.Text:split("/")[1]
        playersJoined    = game:GetService("Workspace").Lobby.GameInfo.SurfaceGui.Frame.Players.Text:split("/")[2]:split(" ")[1]
        intensityValue   = game:GetService("Workspace").Lobby.GameInfo.SurfaceGui.Frame.Difficulty.Difficulty.Text:split(":")[1]
        boostCount       = game:GetService("Players").LocalPlayer.PlayerGui.MenuGui.Shop.Window.Content.Categories.BoostIntensity.Desc.Text:split(" ")[2]
        playerPercentage = playersAlive/playersJoined

        finalCalculation = round(playerPercentage, 2) + boostCounter[boostCount] - diffBalance[intensityValue]
        
        Title.Text = "Predicted Intensity Change:"
        if round(finalCalculation, 2) == 0 then
            IntensityChangeValue.Text = round(finalCalculation, 2)
            IntensityChangeValue.TextColor3 = Color3.new(0.513725, 0.513725, 0.513725)
        elseif round(finalCalculation, 2) < 0 then
            IntensityChangeValue.Text = round(finalCalculation, 2)
            IntensityChangeValue.TextColor3 = Color3.new(1, 0.286274, 0.286274)
        else
            IntensityChangeValue.Text = "+"..round(finalCalculation, 2)
            IntensityChangeValue.TextColor3 = Color3.new(0, 1, 0.533333)
        end
        local DEBUGTemplate = [[
        Players Alive: %s
        Players Joined: %s
        Player Percentage: %s
        -----------------------
        Boosts: %s
        Difficulty Balance: %s
        -----------------------
        Formula: %s + %s - %s
        Result: %s
        ]]
        DebugInfo.Text = DEBUGTemplate:format(playersAlive, playersJoined, round(playerPercentage, 2), boostCounter[boostCount], diffBalance[intensityValue], round(playerPercentage, 2), boostCounter[boostCount], diffBalance[intensityValue], round(finalCalculation, 2))
    end)
end

game:GetService("Workspace").Lobby.GameInfo.SurfaceGui.Frame.Players:GetPropertyChangedSignal("Text"):Connect(keybindHandler)
game:GetService("Players").LocalPlayer.PlayerGui.MenuGui.Shop.Window.Content.Categories.BoostIntensity.Desc:GetPropertyChangedSignal("Text"):Connect(function()
    if game:GetService("Players").LocalPlayer.PlayerGui.MenuGui.Shop.Window.Content.Categories.BoostIntensity.Desc.BackgroundColor3 ~= Color3.fromRGB(155, 89, 182) then
        keybindHandler()
    end
end)
game:GetService("Workspace").Lobby.GameInfo.SurfaceGui.Frame.TimeLeft.Percentage:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
    if round(game:GetService("Workspace").Lobby.GameInfo.SurfaceGui.Frame.TimeLeft.Percentage.AbsoluteSize.X) == 489 then
        keybindHandler()
    end
end)

keybindHandler()