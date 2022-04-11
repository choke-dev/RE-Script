local function WTS(part)
    local screen = workspace.CurrentCamera:WorldToViewportPoint(part.Position)
    return Vector2.new(screen.x, screen.y)
end

local function round(n)
	return math.ceil(n - 0.5)
end
    
local function ESP(part, text, color)
    local box = Drawing.new("Square")
    local name = Drawing.new("Text")
    -- // text settings // --
    name.Text = "Initializing..."
    name.Color = color
    name.Position = WTS(part)
    name.Size = 20.0
    name.Outline = true
    name.Center = true
    name.Visible = true
    -- // box settings // --
    box.Size = Vector2.new(10,10)
    --box.AnchorPoint = Vector2.new(0.5, 0.5)
    box.Position = WTS(part)
    box.Color = color
    box.Thickness = 0.5
    box.Visible = true

    local RdSt = game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            --local Distance = (workspace.Camera.CFrame.Position - part.Position).Magnitude
            local Distance = (game:GetService("Players").LocalPlayer.Character.Head.Position - part.Position).Magnitude
            name.Text = "["..round(Distance).."] "..text
            local destroyed = not part:IsDescendantOf(workspace)
            if destroyed and name ~= nil then
                name:Remove()
                box:Remove()
                RdSt:Disconnect()
            end
            if part ~= nil then
                name.Position = WTS(part)
                box.Position = WTS(part)
            end
            local _, screen = workspace.CurrentCamera:WorldToViewportPoint(part.Position)
            if screen then
                name.Visible = true
                box.Visible = true
            else
                name.Visible = false
                box.Visible = false
            end
        end)
    end)
end

local function isGun(name)
    if name == {"Glock17", "P90", "MP7", "AKS-74U", "FlameThrower", "FreezeThrower"} then
        return true
    else
        return false
    end
end

local function getLevel(card)
    local cardLevel = math.floor(card:WaitForChild("Level").Value / 10)
    return cardLevel
end

local function search()
    for _,v in pairs(workspace.Debris:GetChildren()) do
        if v:WaitForChild("Level") then
            local cardlvl = getLevel(v) or "❌"
            ESP(v.Card, "Keycard Level: "..cardlvl, Color3.fromRGB(52, 255, 154))
        elseif isGun(v.Name) then
            ESP(v.hand, v.Name, Color3.fromRGB(255, 106, 37))
        end
    end
end