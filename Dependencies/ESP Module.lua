local module = {}

local CoSe = game:GetService("CollectionService")

-- // 2D ESP // --

local function WTS(part)
    local screen = workspace.CurrentCamera:WorldToViewportPoint(part.Position)
    return Vector2.new(screen.x, screen.y)
end

local function round(n)
	return math.ceil(n - 0.5)
end

function module.Create2DESP(part, text, color)
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

    CoSe:AddTag(part, "2D_ESP")

    local RdSt = game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            local Distance = (workspace.Camera.CFrame.Position - part.Position).Magnitude
            --local Distance = (game:GetService("Players").LocalPlayer.Character.Head.Position - part.Position).Magnitude
            name.Text = "["..round(Distance).."] "..text
            local destroyed = not part:IsDescendantOf(workspace)
            if destroyed and name ~= nil then
                name:Remove()
                box:Remove()
                CoSe:RemoveTag(part, "2D_ESP")
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

-- // END OF 2D ESP // --

-- // 3D ESP // --

local workspace = game:GetService("Workspace")
local player = game:GetService("Players").LocalPlayer
local camera = workspace.CurrentCamera

--// Settings:
local on = true -- Use this if your making gui

local Box_Thickness = 2
local Box_Transparency = 1 -- 1 Visible, 0 Not Visible

local Autothickness = true -- Makes screen less encumbered

local function NewLine(coloror)
    local Box_Color = coloror or Color3.fromRGB(255, 0, 0)
    local line = Drawing.new("Line")
    line.Visible = false
    line.From = Vector2.new(0, 0)
    line.To = Vector2.new(1, 1)
    line.Color = Box_Color
    line.Thickness = Box_Thickness
    line.Transparency = Box_Transparency
    return line
end

--// Main Function:
--[[
    Example: 
    local Part = workspace.Part      
    ESP(Part)
]]
function module.Create3DESP(objected, text, coloror)
    CoSe:AddTag(objected, "3D_ESP")
    local part = objected   

    local name = Drawing.new("Text")
    name.Text = text or "Part"
    name.Color = coloror or Color3.new(1, 1, 1)
    name.Position = WTS(part)
    name.Size = 20.0
    name.Outline = true
    name.Center = true
    name.Visible = true

    --// Lines for 3D box (12)
    local lines = {
        line1  = NewLine(coloror),
        line2  = NewLine(coloror),
        line3  = NewLine(coloror),
        line4  = NewLine(coloror),
        line5  = NewLine(coloror),
        line6  = NewLine(coloror),
        line7  = NewLine(coloror),
        line8  = NewLine(coloror),
        line9  = NewLine(coloror),
        line10 = NewLine(coloror),
        line11 = NewLine(coloror),
        line12 = NewLine(coloror)
    }

    --// Updates ESP (lines) in render loop
    local function Updater()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            pcall(function()
                local partpos, onscreen = camera:WorldToViewportPoint(part.Position)
                local destroyed = not objected:IsDescendantOf(workspace)
                local Distance = (workspace.Camera.CFrame.Position - part.Position).Magnitude
                name.Text = "["..round(Distance).."] "..text
                if destroyed then
                    for i,v in pairs(lines) do
                        v:Remove()
                    end
                    name:Remove()
                    CoSe:RemoveTag(objected, "3D_ESP")
                    connection:Disconnect()
                end
                if on and onscreen then
                    name.Position = WTS(part)
                    local size_X = part.Size.X/2
                    local size_Y = part.Size.Y/2
                    local size_Z = part.Size.Z/2

                    local Top1 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(-size_X, size_Y, -size_Z)).p)
                    local Top2 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(-size_X, size_Y, size_Z)).p)
                    local Top3 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(size_X, size_Y, size_Z)).p)
                    local Top4 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(size_X, size_Y, -size_Z)).p)

                    local Bottom1 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(-size_X, -size_Y, -size_Z)).p)
                    local Bottom2 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(-size_X, -size_Y, size_Z)).p)
                    local Bottom3 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(size_X, -size_Y, size_Z)).p)
                    local Bottom4 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(size_X, -size_Y, -size_Z)).p)

                    --// Top:
                    lines.line1.From = Vector2.new(Top1.X, Top1.Y)
                    lines.line1.To = Vector2.new(Top2.X, Top2.Y)

                    lines.line2.From = Vector2.new(Top2.X, Top2.Y)
                    lines.line2.To = Vector2.new(Top3.X, Top3.Y)

                    lines.line3.From = Vector2.new(Top3.X, Top3.Y)
                    lines.line3.To = Vector2.new(Top4.X, Top4.Y)

                    lines.line4.From = Vector2.new(Top4.X, Top4.Y)
                    lines.line4.To = Vector2.new(Top1.X, Top1.Y)

                    --//Bottom:
                    lines.line5.From = Vector2.new(Bottom1.X, Bottom1.Y)
                    lines.line5.To = Vector2.new(Bottom2.X, Bottom2.Y)

                    lines.line6.From = Vector2.new(Bottom2.X, Bottom2.Y)
                    lines.line6.To = Vector2.new(Bottom3.X, Bottom3.Y)

                    lines.line7.From = Vector2.new(Bottom3.X, Bottom3.Y)
                    lines.line7.To = Vector2.new(Bottom4.X, Bottom4.Y)

                    lines.line8.From = Vector2.new(Bottom4.X, Bottom4.Y)
                    lines.line8.To = Vector2.new(Bottom1.X, Bottom1.Y)

                    --//Sides:
                    lines.line9.From = Vector2.new(Bottom1.X, Bottom1.Y)
                    lines.line9.To = Vector2.new(Top1.X, Top1.Y)

                    lines.line10.From = Vector2.new(Bottom2.X, Bottom2.Y)
                    lines.line10.To = Vector2.new(Top2.X, Top2.Y)

                    lines.line11.From = Vector2.new(Bottom3.X, Bottom3.Y)
                    lines.line11.To = Vector2.new(Top3.X, Top3.Y)

                    lines.line12.From = Vector2.new(Bottom4.X, Bottom4.Y)
                    lines.line12.To = Vector2.new(Top4.X, Top4.Y)

                    if Autothickness then
                        local distance = (player.Character.HumanoidRootPart.Position - part.Position).magnitude
                        local value = math.clamp(1/distance*100, 0.1, 4) --0.1 is min thickness, 6 is max
                        for u, x in pairs(lines) do
                            x.Thickness = value
                        end
                    else 
                        for u, x in pairs(lines) do
                            x.Thickness = Box_Thickness
                        end
                    end

                    for u, x in pairs(lines) do
                        x.Visible = true
                    end
                else 
                    for u, x in pairs(lines) do
                        x.Visible = false
                    end
                end
            end)
        end)
    end
    coroutine.wrap(Updater)()
end

return module