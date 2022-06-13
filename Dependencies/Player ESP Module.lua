getgenv().PlayerESPs = {}

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local Camera = game:GetService("Workspace").CurrentCamera
local Mouse = LP:GetMouse()

local module = {}

local function WTS(part)
    local screen = workspace.CurrentCamera:WorldToViewportPoint(part.Position)
    return Vector2.new(screen.x, screen.y)
end

function module.CreateESP(playerName:string, clr:Color3, txt:string)
    if Players[playerName] == nil then return error("Player ESP Module: Player not found!") end
    local plr = Players[playerName]
    local color = clr or Color3.new(1,1,1)
    local text = txt or plr.Name
    local Box = Drawing.new("Quad")
    local name = Drawing.new("Text")
    -- // Text Settings \\ --
    name.Text = "Initializing..."
    name.Color = color
    name.Position = WTS(plr.Character:FindFirstChild("Head"))
    name.Size = 20.0
    name.Outline = true
    name.Center = true
    name.Visible = true
    -- // Box Settings \\ --
    Box.Visible = false
    Box.Color = color
    Box.PointA = Vector2.new(0, 0)
    Box.PointB = Vector2.new(0, 0)
    Box.PointC = Vector2.new(0, 0)
    Box.PointD = Vector2.new(0, 0)
    Box.Color = Color3.fromRGB(255, 255, 255)
    Box.Thickness = 1
    Box.Transparency = 1

    local function Update()
        local renderstepconnection
        renderstepconnection = game:GetService("RunService").RenderStepped:Connect(function()
            local Distance = (workspace.Camera.CFrame.Position - plr.Character:FindFirstChild("Head").Position).Magnitude
            name.Text = "["..math.round(Distance).."]\n"..text
            if plr.Character ~= nil and plr.Character:FindFirstChildOfClass("Humanoid") ~= nil and plr.Character.PrimaryPart ~= nil and plr.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
                local pos, vis = Camera:WorldToViewportPoint(plr.Character.PrimaryPart.Position)
                if vis then 
                    local points = {}
                    local c = 0
                    for _,v in pairs(plr.Character:GetChildren()) do
                        if v:IsA("BasePart") then
                            c = c + 1
                            local p, vis = Camera:WorldToViewportPoint(v.Position)
                            if v == plr.Character.PrimaryPart then
                                p, vis = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(0, 0, -v.Size.Z)).p)
                            elseif v.Name == "Head" then
                                p, vis = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(0, v.Size.Y/2, v.Size.Z/1.25)).p)
                            elseif string.match(v.Name, "Left") then
                                p, vis = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(-v.Size.X/2, 0, 0)).p)
                            elseif string.match(v.Name, "Right") then
                                p, vis = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(v.Size.X/2, 0, 0)).p)
                            end
                            points[c] = {p, vis}
                        end
                    end

                    local TopY = math.huge
                    local DownY = -math.huge
                    local LeftX = math.huge
                    local RightX = -math.huge

                    local Left
                    local Right
                    local Top
                    local Bottom

                    local closest = nil
                    for _,v in pairs(points) do
                        if v[2] == true then
                            local p = v[1]
                            if p.Y < TopY then
                                Top = p
                                TopY = p.Y
                            end
                            if p.Y > DownY then
                                Bottom = p
                                DownY = p.Y
                            end
                            if p.X > RightX then
                                Right = p
                                RightX = p.X
                            end
                            if p.X < LeftX then
                                Left = p
                                LeftX = p.X
                            end
                        end
                    end

                    if Left ~= nil and Right ~= nil and Top ~= nil and Bottom ~= nil then
                        Box.PointA = Vector2.new(Right.X, Top.Y)
                        Box.PointB = Vector2.new(Left.X, Top.Y)
                        Box.PointC = Vector2.new(Left.X, Bottom.Y)
                        Box.PointD = Vector2.new(Right.X, Bottom.Y)

                        Box.Visible = true
                    else 
                        Box.Visible = false
                    end
                else 
                    Box.Visible = false
                end
            else
                Box.Visible = false
                if game.Players:FindFirstChild(plr.Name) == nil then
                    c:Disconnect()
                end
            end
        end)
        getgenv().PlayerESPs[plr.Name] = {Box, name, renderstepconnection}
    end
    
    coroutine.wrap(Update)()
end

function module.RemoveESP(playerName:string)
    getgenv().PlayerESPs[playerName][3]:Disconnect()
    getgenv().PlayerESPs[playerName][3] = nil
    getgenv().PlayerESPs[playerName][2]:Destroy()
    getgenv().PlayerESPs[playerName][1]:Destroy()
end

return module
