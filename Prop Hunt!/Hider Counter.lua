local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UIStrokeFrame = Instance.new("UIStroke")
local UIStrokeText = Instance.new("UIStroke")
local Teams = game:GetService("Teams")
 
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(0.137255, 0.121569, 0.12549)
Frame.Position = UDim2.new(0.0157440007, 0, 0.901019454, 0)
Frame.Size = UDim2.new(0.144808114, 0, 0.0703703687, 0)

UICorner.Parent = Frame
UICorner.CornerRadius = UDim.new(0.5, 0)

UIStrokeFrame.Parent = Frame
UIStrokeFrame.Color = Color3.fromRGB(255, 83, 110)
UIStrokeFrame.Thickness = 4

UIStrokeText.Parent = TextLabel
UIStrokeText.Color = Color3.new(0.137255, 0.121569, 0.12549)
UIStrokeText.Thickness = 7

TextLabel.Parent = Frame
TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(0.5, 0, 0.223709106, 0)
TextLabel.Size = UDim2.new(0.884955823, 0, 0.705311835, 0)
TextLabel.Font = Enum.Font.LuckiestGuy
TextLabel.Text = "50 Hiders Left."
TextLabel.TextColor3 = Color3.new(1, 0.32549, 0.431373)
TextLabel.TextScaled = true
TextLabel.TextSize = 42
TextLabel.TextWrapped = true

while task.wait() do
    if #Teams.Hider:GetPlayers() == 0 then
        TextLabel.Text = "No Hiders Left."
    elseif #Teams.Hider:GetPlayers() < 2 then
        TextLabel.Text = #Teams.Hider:GetPlayers().." Hider Left."
    else
        TextLabel.Text = #Teams.Hider:GetPlayers().." Hiders Left."
    end
end