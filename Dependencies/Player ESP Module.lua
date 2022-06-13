if not getgenv().PlayerESPs then
    getgenv().PlayerESPs = {}
end

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local Camera = game:GetService("Workspace").CurrentCamera
local Mouse = LP:GetMouse()

local module = {}

local function WTS(part)
    pcall(function()
            local screen = workspace.CurrentCamera:WorldToViewportPoint(part.Position)
            return Vector2.new(screen.x, screen.y)
    end)
end

function module.CreateESP(playerName:string, clr:Color3, txt:string)
    pcall(function()
    if Players[playerName] == nil then return end
    local plr = Players[playerName]
    local color = clr or Color3.new(1,1,1)
    local text = txt or plr.Name
    local BoxQuad = Drawing.new("Quad")
    local nameText = Drawing.new("Text")
    -- // Text Settings \\ --
    nameText.Text = "Initializing..."
    nameText.Color = color
    nameText.Position = WTS(plr.Character:FindFirstChild("Head"))
    nameText.Size = 20.0
    nameText.Outline = true
    nameText.Center = true
    nameText.Visible = true
    -- // Box Settings \\ --
    BoxQuad.Visible = false
    BoxQuad.Color = color
    BoxQuad.PointA = Vector2.new(0, 0)
    BoxQuad.PointB = Vector2.new(0, 0)
    BoxQuad.PointC = Vector2.new(0, 0)
    BoxQuad.PointD = Vector2.new(0, 0)
    BoxQuad.Thickness = 1
    BoxQuad.Transparency = 1
    getgenv().PlayerESPs[plr.Name] = {BoxQuad, nameText, true}
    local function Update()
        renderstepconnection = game:GetService("RunService").RenderStepped:Connect(function()
            if not getgenv().PlayerESPs[plr.Name][3] then return renderstepconnection:Disconnect() end
            local Distance = (workspace.Camera.CFrame.Position - plr.Character:FindFirstChild("Head").Position).Magnitude
            nameText.Text = "["..math.round(Distance).."]\n"..text
            nameText.Position = WTS(plr.Character:FindFirstChild("Head"))
            if plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character.PrimaryPart ~= nil and plr.Character:FindFirstChild("Humanoid").Health > 0 then
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
                        BoxQuad.PointA = Vector2.new(Right.X, Top.Y)
                        BoxQuad.PointB = Vector2.new(Left.X, Top.Y)
                        BoxQuad.PointC = Vector2.new(Left.X, Bottom.Y)
                        BoxQuad.PointD = Vector2.new(Right.X, Bottom.Y)
                        nameText.Visible = true
                        BoxQuad.Visible = true
                    else
                        nameText.Visible = false
                        BoxQuad.Visible = false
                    end
                else
                    nameText.Visible = false
                    BoxQuad.Visible = false
                end
            else
                nameText.Visible = false
                BoxQuad.Visible = false
                if game.Players:FindFirstChild(plr.Name) == nil then
                    c:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(Update)()
    end)
end

function module.RemoveESP(playerName:string)
    pcall(function()
    getgenv().PlayerESPs[playerName][3] = nil
    getgenv().PlayerESPs[playerName][2]:Remove()
    getgenv().PlayerESPs[playerName][1]:Remove()
    getgenv().PlayerESPs[playerName][2] = nil
    getgenv().PlayerESPs[playerName][1] = nil
    end)
end

return module
