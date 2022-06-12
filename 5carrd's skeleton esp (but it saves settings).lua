--[[ 
    New Ui Library: https://github.com/AlexR32/Roblox
]]
--// Locals //
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Targets = {}
local RS = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local Build = "2.7"
local LastColor = Color3.fromRGB(0, 255, 0)
local IgnoreList = {}

--// Settings //
local TeamCheck = false
local VisibilityCheck = false
local UseTeamColor = false
local Color = Color3.fromRGB(255,255,255)
local TracerThickness = 5
local Transparency = 0.5
local MaxDistance = 4000
local HideDead = false
local BoxType = "2D"

--// Save Toggles //
local Name = "BoneESP_Settings.json"

local DefaultSettings = {
    Tracer = false,
    Box = false,
    HealthBar = false,
    Bones = false,
    HeadDot = false,

    TeamCheck = false,
    HideDead = false,
    VisibilityCheck = false,

    BoxType = "2D",
    MaxDistance = 4000,
    TracerThickness = 5,
    Transparency = 1,

    Color = Color3.new(0,1,0),
    UseTeamColor = false
}

local Settings

if isfile(Name) then
    Settings = game:GetService('HttpService'):JSONDecode(readfile(Name))
else
    writefile(Name, game:GetService('HttpService'):JSONEncode(DefaultSettings))
end


--// Toggles //
local Tracer = Settings.Tracer
local Bones = Settings.Bones
local HeadDot = Settings.HeadDot
local Box = Settings.Box
local HealthBar = Settings.HealthBar

--// Main Script //
for _, v in next, Players:GetChildren() do
    Targets[v.Name] = {
        Line = Drawing.new("Line"),
        HeadDot = Drawing.new("Circle"),
        Bones = {
            R15 = {
                Head = Drawing.new("Line"),
                UpperTorso = Drawing.new("Line"),
                RightShoulder = Drawing.new("Line"),
                LeftShoulder = Drawing.new("Line"),
                RightUpperArm = Drawing.new("Line"),
                LeftUpperArm = Drawing.new("Line"),
                RightLowerArm = Drawing.new("Line"),
                LeftLowerArm = Drawing.new("Line"),
                RightGroin = Drawing.new("Line"),
                LeftGroin = Drawing.new("Line"),
                RightUpperLeg = Drawing.new("Line"),
                LeftUpperLeg = Drawing.new("Line"),
                RightLowerLeg = Drawing.new("Line"),
                LeftLowerLeg = Drawing.new("Line")
            },
            R6 = {
                Head = Drawing.new("Line"),
                Torso = Drawing.new("Line"),
                LeftShoulder = Drawing.new("Line"),
                RightShoulder = Drawing.new("Line"),
                LeftArm = Drawing.new("Line"),
                RightArm = Drawing.new("Line"),
                LeftGroin = Drawing.new("Line"),
                RightGroin = Drawing.new("Line"),
                LeftLeg = Drawing.new("Line"),
                RightLeg = Drawing.new("Line")
            }
        },
        Boxes = {
            DDD = {
                TopFront = Drawing.new("Line"),
                TopBack = Drawing.new("Line"),
                TopLeft = Drawing.new("Line"),
                TopRight = Drawing.new("Line"),
                FrontLeft = Drawing.new("Line"),
                FrontRight = Drawing.new("Line"),
                BackLeft = Drawing.new("Line"),
                BackRight = Drawing.new("Line"),
                BottonFront = Drawing.new("Line"),
                BottomBack = Drawing.new("Line"),
                BottomLeft = Drawing.new("Line"),
                BottomRight = Drawing.new("Line")
            },
            DD = {
                Top = Drawing.new("Line"),
                Left = Drawing.new("Line"),
                Right = Drawing.new("Line"),
                Bottom = Drawing.new("Line")
            }
        },
        HealthBar = {
            Back = Drawing.new("Line"),
            Front = Drawing.new("Line")
        }
    }
end

local function HideAllElements()
    for i, v in next, Targets do
        local function DynamicLoop(table)
            for i, v in pairs(table) do
                if (type(v) == "table" and v.ZIndex ~= 0) then
                    DynamicLoop(v)
                elseif type(v) == "table" then
                    v.Visible = false
                end
            end
        end
        DynamicLoop(v)
    end
end

local function DeleteTarget(index)
    local function DynamicLoop(table)
        for i, v in pairs(table) do
            if (type(v) == "table" and v.ZIndex ~= 0) then
                DynamicLoop(v)
            elseif type(v) == "table" then
                v:Remove()
            end
        end
    end
    DynamicLoop(Targets[index])
    Targets[index] = nil
end

local function UpdateTargets()
    local Current = Targets
    for i, _ in next, Targets do
        if not Players:FindFirstChild(tostring(i)) then
            DeleteTarget(i)
        end
    end
    for _, v in next, Players:GetChildren() do
        if not Current[v.Name] then
            Current[v.Name] = {
                JoinTime = (os.date("%Y-%m-%d %H:%M:%S")),
                Line = Drawing.new("Line"),
                HeadDot = Drawing.new("Circle"),
                Bones = {
                    R15 = {
                        Head = Drawing.new("Line"),
                        UpperTorso = Drawing.new("Line"),
                        RightShoulder = Drawing.new("Line"),
                        LeftShoulder = Drawing.new("Line"),
                        RightUpperArm = Drawing.new("Line"),
                        LeftUpperArm = Drawing.new("Line"),
                        RightLowerArm = Drawing.new("Line"),
                        LeftLowerArm = Drawing.new("Line"),
                        RightGroin = Drawing.new("Line"),
                        LeftGroin = Drawing.new("Line"),
                        RightUpperLeg = Drawing.new("Line"),
                        LeftUpperLeg = Drawing.new("Line"),
                        RightLowerLeg = Drawing.new("Line"),
                        LeftLowerLeg = Drawing.new("Line")
                    },
                    R6 = {
                        Head = Drawing.new("Line"),
                        Torso = Drawing.new("Line"),
                        LeftShoulder = Drawing.new("Line"),
                        RightShoulder = Drawing.new("Line"),
                        LeftArm = Drawing.new("Line"),
                        RightArm = Drawing.new("Line"),
                        LeftGroin = Drawing.new("Line"),
                        RightGroin = Drawing.new("Line"),
                        LeftLeg = Drawing.new("Line"),
                        RightLeg = Drawing.new("Line")
                    }
                },
                Boxes = {
                    DDD = {
                        TopFront = Drawing.new("Line"),
                        TopBack = Drawing.new("Line"),
                        TopLeft = Drawing.new("Line"),
                        TopRight = Drawing.new("Line"),
                        FrontLeft = Drawing.new("Line"),
                        FrontRight = Drawing.new("Line"),
                        BackLeft = Drawing.new("Line"),
                        BackRight = Drawing.new("Line"),
                        BottonFront = Drawing.new("Line"),
                        BottomBack = Drawing.new("Line"),
                        BottomLeft = Drawing.new("Line"),
                        BottomRight = Drawing.new("Line")
                    },
                    DD = {
                        Top = Drawing.new("Line"),
                        Left = Drawing.new("Line"),
                        Right = Drawing.new("Line"),
                        Bottom = Drawing.new("Line")
                    }
                },
                HealthBar = {
                    Back = Drawing.new("Line"),
                    Front = Drawing.new("Line")
                }
            }
        end
    end
    Targets = Current
end

local function GetCorners(part)
    local cf = part.CFrame
    local size = part.Size
    local corners = {}

    local frontFaceCenter = (cf + cf.LookVector * size.Z / 2)
    local backFaceCenter = (cf - cf.LookVector * size.Z / 2)

    local topFrontEdgeCenter = frontFaceCenter + frontFaceCenter.UpVector * size.Y / 2
    local bottomFrontEdgeCenter = frontFaceCenter - frontFaceCenter.UpVector * size.Y / 2
    local topBackEdgeCenter = backFaceCenter + backFaceCenter.UpVector * size.Y / 2
    local bottomBackEdgeCenter = backFaceCenter - backFaceCenter.UpVector * size.Y / 2

    corners.topFrontRight = (topFrontEdgeCenter + topFrontEdgeCenter.RightVector * size.X / 2).Position
    corners.topFrontLeft = (topFrontEdgeCenter - topFrontEdgeCenter.RightVector * size.X / 2).Position

    corners.bottomFrontRight = (bottomFrontEdgeCenter + bottomFrontEdgeCenter.RightVector * size.X / 2).Position
    corners.bottomFrontLeft = (bottomFrontEdgeCenter - bottomFrontEdgeCenter.RightVector * size.X / 2).Position

    corners.topBackRight = (topBackEdgeCenter + topBackEdgeCenter.RightVector * size.X / 2).Position
    corners.topBackLeft = (topBackEdgeCenter - topBackEdgeCenter.RightVector * size.X / 2).Position

    corners.bottomBackRight = (bottomBackEdgeCenter + bottomBackEdgeCenter.RightVector * size.X / 2).Position
    corners.bottomBackLeft = (bottomBackEdgeCenter - bottomBackEdgeCenter.RightVector * size.X / 2).Position

    return corners
end

local function R6Bones(player)
    local positions = {
        head = {},
        torso = {},
        leftArm = {},
        rightArm = {},
        leftLeg = {},
        rightLeg = {}
    }

    local Head = GetCorners(player:FindFirstChild("Head"))
    local Torso = GetCorners(player:FindFirstChild("Torso"))
    local LeftArm = GetCorners(player:FindFirstChild("Left Arm"))
    local RightArm = GetCorners(player:FindFirstChild("Right Arm"))
    local LeftLeg = GetCorners(player:FindFirstChild("Left Leg"))
    local RightLeg = GetCorners(player:FindFirstChild("Right Leg"))

    positions.head.to = Camera:WorldToViewportPoint((Head.topFrontLeft + Head.bottomBackRight) / 2)
    positions.head.from = Camera:WorldToViewportPoint((Head.bottomFrontLeft + Head.bottomBackRight) / 2)

    positions.torso.to = Camera:WorldToViewportPoint((Torso.topFrontLeft + Torso.topBackRight) / 2)
    positions.torso.from = Camera:WorldToViewportPoint((Torso.bottomFrontLeft + Torso.bottomBackRight) / 2)

    positions.rightArm.to = Camera:WorldToViewportPoint((RightArm.topFrontLeft + RightArm.topBackRight) / 2)
    positions.rightArm.from = Camera:WorldToViewportPoint((RightArm.bottomFrontLeft + RightArm.bottomBackRight) / 2)

    positions.leftArm.to = Camera:WorldToViewportPoint((LeftArm.topFrontLeft + LeftArm.topBackRight) / 2)
    positions.leftArm.from = Camera:WorldToViewportPoint((LeftArm.bottomFrontLeft + LeftArm.bottomBackRight) / 2)

    positions.leftLeg.to = Camera:WorldToViewportPoint((LeftLeg.topFrontLeft + LeftLeg.topBackRight) / 2)
    positions.leftLeg.from = Camera:WorldToViewportPoint((LeftLeg.bottomFrontLeft + LeftLeg.bottomBackRight) / 2)

    positions.rightLeg.to = Camera:WorldToViewportPoint((RightLeg.topFrontLeft + RightLeg.topBackRight) / 2)
    positions.rightLeg.from = Camera:WorldToViewportPoint((RightLeg.bottomFrontLeft + RightLeg.bottomBackRight) / 2)

    return positions
end

local function R15Bones(player)
    local positions = {
        head = {},
        upperTorso = {},
        rightUpperArm = {},
        rightLowerArm = {},
        leftUpperArm = {},
        leftLowerArm = {},
        rightUpperLeg = {},
        rightLowerLeg = {},
        leftUpperLeg = {},
        leftLowerLeg = {},
        torso = {},
        leftArm = {},
        rightArm = {},
        leftLeg = {},
        rightLeg = {}
    }

    local Head = GetCorners(player:FindFirstChild("Head"))
    local UpperTorso = GetCorners(player:FindFirstChild("UpperTorso"))
    local RightUpperArm = GetCorners(player:FindFirstChild("RightUpperArm"))
    local RightLowerArm = GetCorners(player:FindFirstChild("RightLowerArm"))
    local LeftUpperArm = GetCorners(player:FindFirstChild("LeftUpperArm"))
    local LeftLowerArm = GetCorners(player:FindFirstChild("LeftLowerArm"))
    local RightUpperLeg = GetCorners(player:FindFirstChild("RightUpperLeg"))
    local RightLowerLeg = GetCorners(player:FindFirstChild("RightLowerLeg"))
    local LeftUpperLeg = GetCorners(player:FindFirstChild("LeftUpperLeg"))
    local LeftLowerLeg = GetCorners(player:FindFirstChild("LeftLowerLeg"))

    positions.head.to = Camera:WorldToViewportPoint((Head.topFrontLeft + Head.bottomBackRight) / 2)
    positions.head.from = Camera:WorldToViewportPoint((Head.bottomFrontLeft + Head.bottomBackRight) / 2)

    positions.upperTorso.to = Camera:WorldToViewportPoint((UpperTorso.topFrontLeft + UpperTorso.topBackRight) / 2)
    positions.upperTorso.from =
        Camera:WorldToViewportPoint((UpperTorso.bottomFrontLeft + UpperTorso.bottomBackRight) / 2)

    positions.rightUpperArm.to =
        Camera:WorldToViewportPoint((RightUpperArm.topFrontLeft + RightUpperArm.topBackRight) / 2)
    positions.rightUpperArm.from =
        Camera:WorldToViewportPoint((RightUpperArm.bottomFrontLeft + RightUpperArm.bottomBackRight) / 2)

    positions.rightLowerArm.to =
        Camera:WorldToViewportPoint((RightLowerArm.topFrontLeft + RightLowerArm.topBackRight) / 2)
    positions.rightLowerArm.from =
        Camera:WorldToViewportPoint((RightLowerArm.bottomFrontLeft + RightLowerArm.bottomBackRight) / 2)

    positions.leftUpperArm.to = Camera:WorldToViewportPoint((LeftUpperArm.topFrontLeft + LeftUpperArm.topBackRight) / 2)
    positions.leftUpperArm.from =
        Camera:WorldToViewportPoint((LeftUpperArm.bottomFrontLeft + LeftUpperArm.bottomBackRight) / 2)

    positions.leftLowerArm.to = Camera:WorldToViewportPoint((LeftLowerArm.topFrontLeft + LeftLowerArm.topBackRight) / 2)
    positions.leftLowerArm.from =
        Camera:WorldToViewportPoint((LeftLowerArm.bottomFrontLeft + LeftLowerArm.bottomBackRight) / 2)

    positions.rightUpperLeg.to =
        Camera:WorldToViewportPoint((RightUpperLeg.topFrontLeft + RightUpperLeg.topBackRight) / 2)
    positions.rightUpperLeg.from =
        Camera:WorldToViewportPoint((RightUpperLeg.bottomFrontLeft + RightUpperLeg.bottomBackRight) / 2)

    positions.rightLowerLeg.to =
        Camera:WorldToViewportPoint((RightLowerLeg.topFrontLeft + RightLowerLeg.topBackRight) / 2)
    positions.rightLowerLeg.from =
        Camera:WorldToViewportPoint((RightLowerLeg.bottomFrontLeft + RightLowerLeg.bottomBackRight) / 2)

    positions.leftUpperLeg.to = Camera:WorldToViewportPoint((LeftUpperLeg.topFrontLeft + LeftUpperLeg.topBackRight) / 2)
    positions.leftUpperLeg.from =
        Camera:WorldToViewportPoint((LeftUpperLeg.bottomFrontLeft + LeftUpperLeg.bottomBackRight) / 2)

    positions.leftLowerLeg.to = Camera:WorldToViewportPoint((LeftLowerLeg.topFrontLeft + LeftLowerLeg.topBackRight) / 2)
    positions.leftLowerLeg.from =
        Camera:WorldToViewportPoint((LeftLowerLeg.bottomFrontLeft + LeftLowerLeg.bottomBackRight) / 2)

    return positions
end

local function UpdateEsp()
    UpdateTargets()
    local function UpdateLine(target, to, from, color, visible, thickness, transparency)
        local Line = target
        Line.Visible = visible
        Line.From = from
        Line.To = to
        Line.Color = color
        Line.Thickness = thickness
        Line.Transparency = transparency
    end
    local function UpdateCircle(target, position, color, visible, thickness, filled, transparency, numsides, radius)
        local Circle = target
        Circle.Visible = visible
        Circle.Position = position
        Circle.Color = color
        Circle.Thickness = thickness
        Circle.NumSides = numsides
        Circle.Radius = radius
        Circle.Filled = filled
        Circle.Transparency = transparency
    end
    for i, v in next, Targets do
        local Target = Players[i]
        if Target ~= Player and Target.Character and Target.Character:FindFirstChild("Head") then
            local LineVector, Visible = Camera:WorldToViewportPoint(Target.Character.Head.CFrame.Position)
            local LineVectorX = LineVector.X
            local LineVectorY = LineVector.Y
            local Head = Target.Character:FindFirstChild("Head")

            if UseTeamColor then
                Color = Players[i].TeamColor.Color
            end

            if VisibilityCheck then --// Kinda work - need to iron out kinks
                local InstanceList = {Player.Character, Camera}

                for _, v in pairs(IgnoreList) do
                    table.insert(InstanceList, v)
                end

                local raycastParams = RaycastParams.new()
                raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                raycastParams.FilterDescendantsInstances = InstanceList
                raycastParams.IgnoreWater = true

                local Origin = Camera.CFrame.Position
                local Direction = (Head.Position - Origin).unit * (Camera.CFrame.Position - Head.Position).Magnitude
                local ray = workspace:Raycast(Origin, Direction, raycastParams)
                if ray then
                    local hitPart = ray.Instance

                    if hitPart.Transparency >= .3 or not hitPart.CanCollide and hitPart.ClassName ~= Terrain then
                        IgnoreList[#IgnoreList + 1] = hitPart
                    end

                    if not hitPart:IsDescendantOf(Target.Character) then
                        Visible = false
                    end
                end
            end

            if TeamCheck and Players[i].Team == Player.Team then
                Visible = false
            end

            if (Camera.CFrame.Position - Head.Position).Magnitude > MaxDistance then
                Visible = false
            end

            if HideDead and Target.Character.Humanoid.Health <= 0 then
                Visible = false
            end

            if Tracer then
                UpdateLine(
                    v.Line,
                    Vector2.new(
                        math.clamp(LineVectorX, 0, Camera.ViewportSize.X),
                        math.clamp(LineVectorY, 0, Camera.ViewportSize.Y)
                    ),
                    Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y),
                    Color,
                    Visible,
                    TracerThickness,
                    Transparency
                )
            end

            if HeadDot then
                local HeadCorners = GetCorners(Target.Character.Head)

                local tfl = Camera:WorldToViewportPoint(HeadCorners.topFrontLeft)
                local bbr = Camera:WorldToViewportPoint(HeadCorners.bottomBackRight)
                local tfr = Camera:WorldToViewportPoint(HeadCorners.topFrontRight)
                local bbl = Camera:WorldToViewportPoint(HeadCorners.bottomBackLeft)
                local bfl = Camera:WorldToViewportPoint(HeadCorners.bottomFrontLeft)

                local radius1 = ((Vector2.new(tfl.X, tfl.Y) - Vector2.new(bbr.X, bbr.Y)).Magnitude) / 6
                local radius2 = ((Vector2.new(tfr.X, tfr.Y) - Vector2.new(bbl.X, bbl.Y)).Magnitude) / 6
                local radius3 = ((Vector2.new(tfr.X, tfr.Y) - Vector2.new(bfl.X, bfl.Y)).Magnitude) / 6
                local radius = (radius1 + radius2) / 2

                UpdateCircle(
                    v.HeadDot,
                    Vector2.new(
                        math.clamp(LineVectorX, 0, Camera.ViewportSize.X),
                        math.clamp(LineVectorY, 0, Camera.ViewportSize.Y)
                    ),
                    Color,
                    Visible,
                    1,
                    true,
                    Transparency,
                    12,
                    radius
                )
            end

            if Bones then
                local RigType = Target.Character.Humanoid.RigType.Name
                if RigType == "R15" then
                    local Positions = R15Bones(Target.Character)

                    UpdateLine(
                        v.Bones[RigType].Head,
                        Vector2.new(Positions.head.to.X, Positions.head.to.Y),
                        Vector2.new(Positions.upperTorso.to.X, Positions.upperTorso.to.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                    UpdateLine(
                        v.Bones[RigType].UpperTorso,
                        Vector2.new(Positions.upperTorso.to.X, Positions.upperTorso.to.Y),
                        Vector2.new(Positions.upperTorso.from.X, Positions.upperTorso.from.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                    UpdateLine(
                        v.Bones[RigType].RightShoulder,
                        Vector2.new(Positions.rightUpperArm.to.X, Positions.rightUpperArm.to.Y),
                        Vector2.new(Positions.upperTorso.to.X, Positions.upperTorso.to.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                    UpdateLine(
                        v.Bones[RigType].RightUpperArm,
                        Vector2.new(Positions.rightUpperArm.to.X, Positions.rightUpperArm.to.Y),
                        Vector2.new(Positions.rightUpperArm.from.X, Positions.rightUpperArm.from.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                    UpdateLine(
                        v.Bones[RigType].RightLowerArm,
                        Vector2.new(Positions.rightLowerArm.from.X, Positions.rightLowerArm.from.Y),
                        Vector2.new(Positions.rightUpperArm.from.X, Positions.rightUpperArm.from.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                    UpdateLine(
                        v.Bones[RigType].LeftShoulder,
                        Vector2.new(Positions.leftUpperArm.to.X, Positions.leftUpperArm.to.Y),
                        Vector2.new(Positions.upperTorso.to.X, Positions.upperTorso.to.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                    UpdateLine(
                        v.Bones[RigType].LeftUpperArm,
                        Vector2.new(Positions.leftUpperArm.to.X, Positions.leftUpperArm.to.Y),
                        Vector2.new(Positions.leftUpperArm.from.X, Positions.leftUpperArm.from.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                    UpdateLine(
                        v.Bones[RigType].LeftLowerArm,
                        Vector2.new(Positions.leftLowerArm.from.X, Positions.leftLowerArm.from.Y),
                        Vector2.new(Positions.leftUpperArm.from.X, Positions.leftUpperArm.from.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                    UpdateLine(
                        v.Bones[RigType].RightGroin,
                        Vector2.new(Positions.rightUpperLeg.to.X, Positions.rightUpperLeg.to.Y),
                        Vector2.new(Positions.upperTorso.from.X, Positions.upperTorso.from.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                    UpdateLine(
                        v.Bones[RigType].LeftGroin,
                        Vector2.new(Positions.leftUpperLeg.to.X, Positions.leftUpperLeg.to.Y),
                        Vector2.new(Positions.upperTorso.from.X, Positions.upperTorso.from.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                    UpdateLine(
                        v.Bones[RigType].RightUpperLeg,
                        Vector2.new(Positions.rightUpperLeg.to.X, Positions.rightUpperLeg.to.Y),
                        Vector2.new(Positions.rightUpperLeg.from.X, Positions.rightUpperLeg.from.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                    UpdateLine(
                        v.Bones[RigType].LeftUpperLeg,
                        Vector2.new(Positions.leftUpperLeg.to.X, Positions.leftUpperLeg.to.Y),
                        Vector2.new(Positions.leftUpperLeg.from.X, Positions.leftUpperLeg.from.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                    UpdateLine(
                        v.Bones[RigType].RightLowerLeg,
                        Vector2.new(Positions.rightLowerLeg.from.X, Positions.rightLowerLeg.from.Y),
                        Vector2.new(Positions.rightUpperLeg.from.X, Positions.rightUpperLeg.from.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                    UpdateLine(
                        v.Bones[RigType].LeftLowerLeg,
                        Vector2.new(Positions.leftLowerLeg.from.X, Positions.leftLowerLeg.from.Y),
                        Vector2.new(Positions.leftUpperLeg.from.X, Positions.leftUpperLeg.from.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                else
                    local Positions = R6Bones(Target.Character)

                    UpdateLine(
                        v.Bones[RigType].Head,
                        Vector2.new(Positions.head.to.X, Positions.head.to.Y),
                        Vector2.new(Positions.torso.to.X, Positions.torso.to.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                    UpdateLine(
                        v.Bones[RigType].Torso,
                        Vector2.new(Positions.torso.to.X, Positions.torso.to.Y),
                        Vector2.new(Positions.torso.from.X, Positions.torso.from.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                    UpdateLine(
                        v.Bones[RigType].RightShoulder,
                        Vector2.new(Positions.torso.to.X, Positions.torso.to.Y),
                        Vector2.new(Positions.rightArm.to.X, Positions.rightArm.to.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                    UpdateLine(
                        v.Bones[RigType].RightArm,
                        Vector2.new(Positions.rightArm.from.X, Positions.rightArm.from.Y),
                        Vector2.new(Positions.rightArm.to.X, Positions.rightArm.to.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                    UpdateLine(
                        v.Bones[RigType].LeftShoulder,
                        Vector2.new(Positions.torso.to.X, Positions.torso.to.Y),
                        Vector2.new(Positions.leftArm.to.X, Positions.leftArm.to.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                    UpdateLine(
                        v.Bones[RigType].LeftArm,
                        Vector2.new(Positions.leftArm.from.X, Positions.leftArm.from.Y),
                        Vector2.new(Positions.leftArm.to.X, Positions.leftArm.to.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                    UpdateLine(
                        v.Bones[RigType].LeftGroin,
                        Vector2.new(Positions.torso.from.X, Positions.torso.from.Y),
                        Vector2.new(Positions.leftLeg.to.X, Positions.leftLeg.to.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                    UpdateLine(
                        v.Bones[RigType].RightGroin,
                        Vector2.new(Positions.torso.from.X, Positions.torso.from.Y),
                        Vector2.new(Positions.rightLeg.to.X, Positions.rightLeg.to.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                    UpdateLine(
                        v.Bones[RigType].LeftLeg,
                        Vector2.new(Positions.leftLeg.from.X, Positions.leftLeg.from.Y),
                        Vector2.new(Positions.leftLeg.to.X, Positions.leftLeg.to.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                    UpdateLine(
                        v.Bones[RigType].RightLeg,
                        Vector2.new(Positions.rightLeg.from.X, Positions.rightLeg.from.Y),
                        Vector2.new(Positions.rightLeg.to.X, Positions.rightLeg.to.Y),
                        Color,
                        Visible,
                        1.5,
                        Transparency
                    )
                end
            end

            local function CFrametoVector2(cf)
                local vector = Camera:WorldToViewportPoint(cf)
                return Vector2.new(vector.X, vector.Y)
            end

            if HealthBar then
                local CF, S = Target.Character:GetBoundingBox()
                local CF = CFrame.new(CF.Position, Camera.CFrame.Position)
                local CharacterCorners = GetCorners({CFrame = CF, Size = S})

                local Top = CFrametoVector2((CharacterCorners.topFrontRight + CharacterCorners.topBackRight) / 2)
                local Bottom =
                    CFrametoVector2((CharacterCorners.bottomFrontRight + CharacterCorners.bottomBackRight) / 2)

                Top = Vector2.new(Top.X - 10, Top.Y)
                Bottom = Vector2.new(Top.X, Bottom.Y)

                UpdateLine(
                    v.HealthBar.Back,
                    Top,
                    Bottom,
                    Color3.new(1, 0, 0),
                    Visible,
                    (Camera.ViewportSize.X / 192),
                    1
                )

                local GamesHealth = {
                    ["286090429"] = {
                        Health = function()
                            return Target.NRPBS.Health.Value
                        end,
                        MaxHealth = function()
                            return Target.NRPBS.MaxHealth.Value
                        end
                    }
                }

                local TargetHealth = Target.Character.Humanoid.Health
                local TargetMaxHealth = Target.Character.Humanoid.MaxHealth

                if GamesHealth[tostring(game.PlaceId)] ~= nil then
                    TargetHealth = GamesHealth[tostring(game.PlaceId)].Health()
                    TargetMaxHealth = GamesHealth[tostring(game.PlaceId)].MaxHealth()
                end

                local Health = TargetHealth / TargetMaxHealth
                local Distance = ((Top - Bottom).Magnitude) * Health

                UpdateLine(
                    v.HealthBar.Front,
                    Vector2.new(Bottom.X, Bottom.Y - Distance),
                    Bottom,
                    Color3.new(0, 1, 0),
                    Visible,
                    (Camera.ViewportSize.X / 192),
                    1
                )
            end

            if Box and BoxType == "3D" then
                local CF, S = Target.Character:GetBoundingBox()
                local CharacterCorners = GetCorners({CFrame = CF, Size = S})

                UpdateLine(
                    v.Boxes.DDD.TopFront,
                    CFrametoVector2(CharacterCorners.topFrontLeft),
                    CFrametoVector2(CharacterCorners.topFrontRight),
                    Color,
                    Visible,
                    1.5,
                    Transparency
                )
                UpdateLine(
                    v.Boxes.DDD.TopLeft,
                    CFrametoVector2(CharacterCorners.topFrontLeft),
                    CFrametoVector2(CharacterCorners.topBackLeft),
                    Color,
                    Visible,
                    1.5,
                    Transparency
                )
                UpdateLine(
                    v.Boxes.DDD.TopRight,
                    CFrametoVector2(CharacterCorners.topFrontRight),
                    CFrametoVector2(CharacterCorners.topBackRight),
                    Color,
                    Visible,
                    1.5,
                    Transparency
                )
                UpdateLine(
                    v.Boxes.DDD.TopBack,
                    CFrametoVector2(CharacterCorners.topBackLeft),
                    CFrametoVector2(CharacterCorners.topBackRight),
                    Color,
                    Visible,
                    1.5,
                    Transparency
                )
                UpdateLine(
                    v.Boxes.DDD.FrontLeft,
                    CFrametoVector2(CharacterCorners.topFrontLeft),
                    CFrametoVector2(CharacterCorners.bottomFrontLeft),
                    Color,
                    Visible,
                    1.5,
                    Transparency
                )
                UpdateLine(
                    v.Boxes.DDD.FrontRight,
                    CFrametoVector2(CharacterCorners.topFrontRight),
                    CFrametoVector2(CharacterCorners.bottomFrontRight),
                    Color,
                    Visible,
                    1.5,
                    Transparency
                )
                UpdateLine(
                    v.Boxes.DDD.BackRight,
                    CFrametoVector2(CharacterCorners.topBackRight),
                    CFrametoVector2(CharacterCorners.bottomBackRight),
                    Color,
                    Visible,
                    1.5,
                    Transparency
                )
                UpdateLine(
                    v.Boxes.DDD.BackLeft,
                    CFrametoVector2(CharacterCorners.topBackLeft),
                    CFrametoVector2(CharacterCorners.bottomBackLeft),
                    Color,
                    Visible,
                    1.5,
                    Transparency
                )
                UpdateLine(
                    v.Boxes.DDD.BottonFront,
                    CFrametoVector2(CharacterCorners.bottomFrontLeft),
                    CFrametoVector2(CharacterCorners.bottomFrontRight),
                    Color,
                    Visible,
                    1.5,
                    Transparency
                )
                UpdateLine(
                    v.Boxes.DDD.BottomLeft,
                    CFrametoVector2(CharacterCorners.bottomFrontLeft),
                    CFrametoVector2(CharacterCorners.bottomBackLeft),
                    Color,
                    Visible,
                    1.5,
                    Transparency
                )
                UpdateLine(
                    v.Boxes.DDD.BottomRight,
                    CFrametoVector2(CharacterCorners.bottomFrontRight),
                    CFrametoVector2(CharacterCorners.bottomBackRight),
                    Color,
                    Visible,
                    1.5,
                    Transparency
                )
                UpdateLine(
                    v.Boxes.DDD.BottomBack,
                    CFrametoVector2(CharacterCorners.bottomBackLeft),
                    CFrametoVector2(CharacterCorners.bottomBackRight),
                    Color,
                    Visible,
                    1.5,
                    Transparency
                )
            elseif Box and BoxType == "2D" then
                local CF, S = Target.Character:GetBoundingBox()
                local CharacterCorners = GetCorners({CFrame = CF, Size = S})

                UpdateLine(
                    v.Boxes.DD.Top,
                    CFrametoVector2((CharacterCorners.topFrontLeft + CharacterCorners.topBackLeft) / 2),
                    CFrametoVector2((CharacterCorners.topFrontRight + CharacterCorners.topBackRight) / 2),
                    Color,
                    Visible,
                    1.5,
                    Transparency
                )
                UpdateLine(
                    v.Boxes.DD.Left,
                    CFrametoVector2((CharacterCorners.topFrontLeft + CharacterCorners.topBackLeft) / 2),
                    CFrametoVector2((CharacterCorners.bottomFrontLeft + CharacterCorners.bottomBackLeft) / 2),
                    Color,
                    Visible,
                    1.5,
                    Transparency
                )
                UpdateLine(
                    v.Boxes.DD.Right,
                    CFrametoVector2((CharacterCorners.topFrontRight + CharacterCorners.topBackRight) / 2),
                    CFrametoVector2((CharacterCorners.bottomFrontRight + CharacterCorners.bottomBackRight) / 2),
                    Color,
                    Visible,
                    1.5,
                    Transparency
                )
                UpdateLine(
                    v.Boxes.DD.Bottom,
                    CFrametoVector2((CharacterCorners.bottomFrontLeft + CharacterCorners.bottomBackLeft) / 2),
                    CFrametoVector2((CharacterCorners.bottomFrontRight + CharacterCorners.bottomBackRight) / 2),
                    Color,
                    Visible,
                    1.5,
                    Transparency
                )
            end
        end
    end
end

local Config = {
    WindowName = "5carr3d's Esp - v" .. Build,
    Color = Color3.fromRGB(255, 128, 64),
    Keybind = Enum.KeyCode.F2
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/BracketV3.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Main = Window:CreateTab("Main")
local Settings = Window:CreateTab("UI Settings / Misc")

local Toggles = Main:CreateSection("Toggles")
local Colors = Main:CreateSection("Colors")
local Options = Main:CreateSection("Options")
local Menu = Settings:CreateSection("Menu")
local Changelog = Settings:CreateSection("Changelog")

Toggles:CreateToggle(
    "Toggle ESP",
    true,
    function(value)
        if value then
            RS:BindToRenderStep("Player", 0, UpdateEsp)
        else
            RS:UnbindFromRenderStep("Player")
            for i, _ in next, Targets do
                DeleteTarget(i)
            end
        end
    end
)

Toggles:CreateToggle(
    "Toggle Tracer",
    Tracer,
    function(value)
        Tracer = value
        Settings.Tracer = value
        writefile(Name,game:GetService('HttpService'):JSONEncode(Settings))
        if not value then
            HideAllElements()
        end
    end
)

Toggles:CreateToggle(
    "Toggle Boxes",
    Box,
    function(value)
        Box = value
        Settings.Box = value
        writefile(Name,game:GetService('HttpService'):JSONEncode(Settings))
        if not value then
            HideAllElements()
        end
    end
)

Toggles:CreateToggle(
    "Toggle HealthBar",
    HealthBar,
    function(value)
        HealthBar = value
        Settings.HealthBar = value
        writefile(Name,game:GetService('HttpService'):JSONEncode(Settings))
        if not value then
            HideAllElements()
        end
    end
)

Toggles:CreateToggle(
    "Toggle Bones",
    Bones,
    function(value)
        Bones = value
        Settings.Bones = value
        writefile(Name,game:GetService('HttpService'):JSONEncode(Settings))
        if not value then
            HideAllElements()
        end
    end
)

Toggles:CreateToggle(
    "Toggle Head Dot",
    HeadDot,
    function(value)
        HeadDot = value
        Settings.HeadDot = value
        writefile(Name,game:GetService('HttpService'):JSONEncode(Settings))
        if not value then
            HideAllElements()
        end
    end
)

local Colorpicker1 =
    Colors:CreateColorpicker(
    "Color",
    function(value)
        Color = value
        LastColor = value
        Settings.Color = value
        writefile(Name,game:GetService('HttpService'):JSONEncode(Settings))
    end
)
Colorpicker1:UpdateColor(Color)

Colors:CreateToggle(
    "Use Team Color",
    UseTeamColor,
    function(value)
        UseTeamColor = value
        Settings.UseTeamColor = value
        writefile(Name,game:GetService('HttpService'):JSONEncode(Settings))
        if not value then
            Color = LastColor
        end
    end
)

Options:CreateToggle(
    "Toggle Team Check",
    TeamCheck,
    function(value)
        TeamCheck = value
        Settings.TeamCheck = value
        writefile(Name,game:GetService('HttpService'):JSONEncode(Settings))
    end
)

Options:CreateToggle(
    "Hide Dead",
    HideDead,
    function(value)
        HideDead = value
        Settings.HideDead = value
        writefile(Name,game:GetService('HttpService'):JSONEncode(Settings))
    end
)

Options:CreateToggle(
    "Toggle Visibility Check",
    VisibilityCheck,
    function(value)
        VisibilityCheck = value
        Settings.VisibilityCheck = value
        writefile(Name,game:GetService('HttpService'):JSONEncode(Settings))
    end
)

Options:CreateDropdown(
    "Select Box Type",
    {"2D", "3D"},
    function(value)
        BoxType = value
        Settings.BoxType = value
        writefile(Name,game:GetService('HttpService'):JSONEncode(Settings))
        HideAllElements()
    end,
    BoxType
)

Options:CreateSlider(
    "Max Distance",
    0,
    20000,
    MaxDistance,
    true,
    function(v)
        MaxDistance = v
        Settings.MaxDistance = v
        writefile(Name,game:GetService('HttpService'):JSONEncode(Settings))
    end
)

Options:CreateSlider(
    "Tracer Thickness",
    1,
    10,
    TracerThickness,
    true,
    function(v)
        TracerThickness = v
        Settings.TracerThickness = v
        writefile(Name,game:GetService('HttpService'):JSONEncode(Settings))
    end
)

Options:CreateSlider(
    "Transparency",
    0,
    1,
    Transparency,
    false,
    function(v)
        Transparency = v
        Settings.Transparency = v
        writefile(Name,game:GetService('HttpService'):JSONEncode(Settings))
    end
)

local Toggle3 =
    Menu:CreateToggle(
    "UI Toggle",
    nil,
    function(State)
        Window:Toggle(State)
    end
)
Toggle3:CreateKeybind(
    tostring(Config.Keybind):gsub("Enum.KeyCode.", ""),
    function(Key)
        Config.Keybind = Enum.KeyCode[Key]
    end
)
Toggle3:SetState(true)

local Colorpicker3 =
    Menu:CreateColorpicker(
    "UI Color",
    function(Color)
        Window:ChangeColor(Color)
    end
)
Colorpicker3:UpdateColor(Config.Color)

local ChangelogText = Changelog:CreateLabel("")
ChangelogText:UpdateText("v" .. Build .. "\n• Added HealthBar")

RS:BindToRenderStep("Player", 0, UpdateEsp)
