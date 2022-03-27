BeforeLoad = tick()
getgenv().values = {}
local a = loadstring(game:HttpGet("https://raw.githubusercontent.com/CatzCode/PikaHub/main/Libraries/UI/bruh.lua")()
a:CreateWatermark("damonhook | pasted | BUILD: public")
a.theme.accentcolor = Color3.fromRGB(0, 0, 0)
a.theme.accentcolor2 = Color3.fromRGB(0, 0, 0)
a.theme.topheight = 45
a.theme.TextColor = Color3.fromRGB(0, 0, 0)
local a = {}
local b = loadstring(game:HttpGet("https://raw.githubusercontent.com/Quenty/NevermoreEngine/version2/Modules/Shared/Events/Signal.lua"))()
local c = loadstring(game:HttpGet("https://raw.githubusercontent.com/Blissful4992/ESPs/main/3D%20Drawing%20Api.lua"))()
local d = b.new("ConfigSave")
local e = b.new("ConfigLoad")
underground = false
local f = game:GetService("TextService")
local g = game:GetService("TweenService")
function a:Tween(...)
    g:Create(...):Play()
end
local h = "damonhook/"
makefolder("damonhook")
local i = Vector2.new
local j = Vector3.new
local k = CFrame.new
local l = Instance.new
local m = Color3.new
local n = Color3.fromRGB
local o = Color3.fromHSV
local p = math.clamp
local q = math.deg
local r = math.floor
local s = math.acos
local t = math.random
local u = math.atan2
local w = math.huge
local x = math.rad
local y = math.min
local z = math.pow
local A = UDim2.new
local B = CFrame.Angles
local C = string.find
local D = string.len
local E = string.sub
local F = string.gsub
local G = Ray.new
local H = table.insert
local I = table.find
local J = table.remove
local K = table.sort
local L = n(255, 189, 222)
function rgbtotbl(M)
    return {R = M.R, G = M.G, B = M.B}
end
function tbltorgb(N)
    return m(N.R, N.G, N.B)
end
local function O(P)
    local Q = {}
    for R, v in pairs(P) do
        if type(v) == "table" then
            v = O(v)
        end
        Q[R] = v
    end
    return Q
end
function a:ConfigFix(S)
    local Q = game:GetService("HttpService"):JSONDecode(readfile(h .. S .. ".txt"))
    for T, U in pairs(Q) do
        for T, V in pairs(U) do
            for T, W in pairs(V) do
                if W.Color ~= nil then
                    local X = W.Color
                    W.Color = tbltorgb(X)
                end
            end
        end
    end
    return Q
end
function a:SaveConfig(S)
    local Q = O(values)
    for T, U in pairs(Q) do
        for T, V in pairs(U) do
            for T, W in pairs(V) do
                if W.Color ~= nil then
                    W.Color = {R = W.Color.R, G = W.Color.G, B = W.Color.B}
                end
            end
        end
    end
    writefile(h .. S .. ".txt", game:GetService("HttpService"):JSONEncode(Q))
end
function a:New(Y)
    local Z = {}
    local _ = l("ScreenGui")
    local a0 = l("ImageLabel")
    local a1 = l("TextLabel")
    local a2 = l("Frame")
    local a3 = l("UIListLayout")
    local U = l("Frame")
    _.Name = "SJ_LOVES_MEN"
    _.ResetOnSpawn = false
    _.ZIndexBehavior = "Global"
    _.DisplayOrder = 420133769
    local a4 = l("UIScale")
    a4.Parent = _
    function Z:SetScale(a5)
        a4.Scale = a5
    end
    local a6 = l("TextButton")
    a6.Modal = true
    a6.Text = ""
    a6.BackgroundTransparency = 1
    a6.Parent = _
    local a7 = l("ImageLabel")
    a7.Name = "cursor"
    a7.Parent = _
    a7.BackgroundTransparency = 1
    a7.Size = A(0, 17, 0, 17)
    a7.Image = "rbxassetid://518398610"
    a7.ZIndex = 1000
    a7.ImageColor3 = n(155, 0, 255)
    local a8 = game:GetService("Players")
    local a9 = a8.LocalPlayer
    local aa = a9:GetMouse()
    game:GetService("RunService").RenderStepped:connect(
        function()
            a7.Visible = _.Enabled
            a7.Position = A(0, aa.X - 3, 0, aa.Y + 1)
        end
    )
    a0.Name = "Menu"
    a0.Parent = _
    a0.BackgroundColor3 = n(15, 15, 15)
    a0.Position = A(0.5, -300, 0.5, -300)
    a0.Size = A(0, 600, 0, 610)
    a0.Image = "http://www.roblox.com/asset/?id=7604907071"
    a0.BorderSizePixel = 0
    a.uiopen = true
    game:GetService("UserInputService").InputBegan:Connect(
        function(ab)
            if ab.KeyCode == getgenv().Keybind then
                _.Enabled = not _.Enabled
                a.uiopen = _.Enabled
            end
        end
    )
    local ac = Instance.new("ScreenGui")
    do
        local a1 = Instance.new("TextLabel")
        local ad = Instance.new("Frame")
        local a3 = Instance.new("UIListLayout")
        local ae = Instance.new("ImageLabel")
        local af = Instance.new("UIGradient")
        local ag = Instance.new("Frame")
        ac.Name = "KeybindList"
        ac.ZIndexBehavior = Enum.ZIndexBehavior.Global
        ac.Enabled = false
        ae.Parent = ac
        ae.Image = "rbxassetid://7856811676"
        ae.Size = UDim2.new(0, 198, 0, 20)
        ae.ZIndex = 2
        ae.Position = UDim2.new(0, 1, 0.300000012, 0)
        af.Color =
            ColorSequence.new {
            ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 146, 110)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(9, 84, 59))
        }
        af.Rotation = 90
        af.Parent = ag
        ag.Parent = ae
        ag.BorderSizePixel = 0
        ag.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        ag.BackgroundTransparency = 0.000
        ag.Position = UDim2.new(0, -1, -0.17500012, 0)
        ag.Size = UDim2.new(0, 200, 0, 20)
        a1.Parent = ac
        a1.BackgroundTransparency = 1.00
        a1.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        a1.BorderColor3 = Color3.fromRGB(255, 189, 222)
        a1.Position = UDim2.new(0, 1, 0.300000012, 0)
        a1.Size = UDim2.new(0, 200, 0, 20)
        a1.ZIndex = 3
        a1.Font = Enum.Font.Code
        a1.Text = "keybinds"
        a1.TextColor3 = Color3.fromRGB(255, 189, 222)
        a1.TextSize = 14.000
        a1.TextStrokeTransparency = 0.590
        a1.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        ad.Parent = a1
        ad.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ad.BackgroundTransparency = 1.000
        ad.Position = UDim2.new(0, 0, 1, 1)
        ad.Size = UDim2.new(1, 0, 1, 0)
        a3.Parent = ad
        a3.HorizontalAlignment = Enum.HorizontalAlignment.Center
        a3.SortOrder = Enum.SortOrder.LayoutOrder
        ac.Parent = game.CoreGui
    end
    function keybindadd(ah)
        if not ac.TextLabel.Frame:FindFirstChild(ah) then
            local a1 = Instance.new("TextLabel")
            a1.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            a1.BorderSizePixel = 0
            a1.Size = UDim2.new(0, 200, 0, 20)
            a1.ZIndex = 2
            a1.Font = Enum.Font.Code
            a1.Text = ah
            a1.TextColor3 = Color3.fromRGB(255, 189, 222)
            a1.TextStrokeTransparency = 0.00
            a1.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            a1.TextSize = 14.000
            a1.Name = ah
            a1.BackgroundTransparency = 1.00
            a1.Parent = ac.TextLabel.Frame
        end
    end
    function keybindadd(ah)
        if not ac.TextLabel.Frame:FindFirstChild(ah) then
            local a1 = Instance.new("TextLabel")
            a1.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            a1.BorderSizePixel = 0
            a1.Size = UDim2.new(0, 200, 0, 20)
            a1.ZIndex = 2
            a1.Font = Enum.Font.Code
            a1.Text = ah
            a1.TextColor3 = Color3.fromRGB(255, 189, 222)
            a1.TextStrokeTransparency = 0.00
            a1.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            a1.TextSize = 14.000
            a1.Name = ah
            a1.BackgroundTransparency = 1.00
            a1.Parent = ac.TextLabel.Frame
        end
    end
    function keybindremove(ah)
        if ac.TextLabel.Frame:FindFirstChild(ah) then
            ac.TextLabel.Frame:FindFirstChild(ah):Destroy()
        end
    end
    function a:SetKeybindVisible(ai)
        ac.Enabled = ai
    end
    a.dragging = false
    do
        local aj = game:GetService("UserInputService")
        local X = a0
        local ak
        local al
        local am
        local function an(ao)
            local ap = ao.Position - al
            X.Position = UDim2.new(am.X.Scale, am.X.Offset + ap.X, am.Y.Scale, am.Y.Offset + ap.Y)
        end
        X.InputBegan:Connect(
            function(ao)
                if ao.UserInputType == Enum.UserInputType.MouseButton1 or ao.UserInputType == Enum.UserInputType.Touch then
                    a.dragging = true
                    al = ao.Position
                    am = X.Position
                    ao.Changed:Connect(
                        function()
                            if ao.UserInputState == Enum.UserInputState.End then
                                a.dragging = false
                            end
                        end
                    )
                end
            end
        )
        X.InputChanged:Connect(
            function(ao)
                if ao.UserInputType == Enum.UserInputType.MouseMovement or ao.UserInputType == Enum.UserInputType.Touch then
                    ak = ao
                end
            end
        )
        aj.InputChanged:Connect(
            function(ao)
                if ao == ak and a.dragging then
                    an(ao)
                end
            end
        )
    end
    a1.Parent = a0
    a1.BackgroundColor3 = n(1, 1, 1)
    a1.BackgroundTransparency = 1
    a1.Position = A(0, 7, 0, 0)
    a1.Size = A(0, 0, 0, 29)
    a1.Size = A(0, f:GetTextSize(Y, 15, Enum.Font.SourceSansSemibold, i(700, a1.AbsoluteSize.Y)).X, 0, 29)
    a1.Font = Enum.Font.SourceSansSemibold
    a1.Text = Y
    a1.TextColor3 = n(255, 189, 222)
    a1.TextSize = 15.000
    a1.TextXAlignment = Enum.TextXAlignment.Left
    a2.Name = "TabButtons"
    a2.Parent = a0
    a2.BackgroundColor3 = n()
    a2.BackgroundTransparency = 1
    a2.Position = A(a1.Size.X.Scale, a1.Size.X.Offset + 10, 0, 0)
    a2.Size = A(a1.Size.X.Scale, 590 - a1.Size.X.Offset, 0, 29)
    a3.Parent = a2
    a3.FillDirection = Enum.FillDirection.Horizontal
    a3.SortOrder = Enum.SortOrder.LayoutOrder
    a3.VerticalAlignment = Enum.VerticalAlignment.Center
    U.Name = "Tabs"
    U.Parent = a0
    U.BackgroundColor3 = n(1, 1, 1)
    U.BackgroundTransparency = 1.000
    U.Position = A(0, 0, 0, 32)
    U.Size = A(0, 600, 0, 568)
    local aq = true
    local ar
    function Z:Tab(ah)
        local as
        as = ah
        local at = {}
        values[as] = {}
        local au = l("TextButton")
        au.BackgroundColor3 = n(255, 189, 222)
        au.BackgroundTransparency = 1
        au.Size = A(0, f:GetTextSize(ah, 15, Enum.Font.SourceSansSemibold, i(700, 700)).X + 12, 1, 0)
        au.Font = Enum.Font.SourceSansSemibold
        au.Text = ah
        au.TextColor3 = n(255, 189, 222)
        au.TextSize = 15.000
        au.Parent = a2
        local av = l("Frame")
        local aw = l("Frame")
        local a3 = l("UIListLayout")
        local ax = l("Frame")
        local ay = l("UIListLayout")
        av.Name = "TabGui"
        av.Parent = U
        av.BackgroundColor3 = n(255, 189, 222)
        av.BackgroundTransparency = 1.000
        av.Size = A(1, 0, 1, 0)
        av.Visible = false
        aw.Name = "Left"
        aw.Parent = av
        aw.BackgroundColor3 = n(255, 189, 222)
        aw.BackgroundTransparency = 1.000
        aw.Position = A(0, 15, 0, 11)
        aw.Size = A(0, 279, 0, 543)
        a3.Parent = aw
        a3.HorizontalAlignment = Enum.HorizontalAlignment.Center
        a3.SortOrder = Enum.SortOrder.LayoutOrder
        a3.Padding = UDim.new(0, 10)
        ax.Name = "Right"
        ax.Parent = av
        ax.BackgroundColor3 = n(255, 189, 222)
        ax.BackgroundTransparency = 1.000
        ax.Position = A(0, 303, 0, 11)
        ax.Size = A(0, 279, 0, 543)
        ay.Parent = ax
        ay.HorizontalAlignment = Enum.HorizontalAlignment.Center
        ay.SortOrder = Enum.SortOrder.LayoutOrder
        ay.Padding = UDim.new(0, 10)
        if aq then
            au.TextColor3 = n(255, 189, 222)
            ar = ah
            av.Visible = true
            aq = false
        end
        au.MouseButton1Down:Connect(
            function()
                if ar ~= ah then
                    for T, v in pairs(a2:GetChildren()) do
                        if v:IsA("TextButton") then
                            a:Tween(
                                v,
                                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {TextColor3 = n(200, 200, 200)}
                            )
                        end
                    end
                    for T, v in pairs(U:GetChildren()) do
                        v.Visible = false
                    end
                    a:Tween(
                        au,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = n(30, 115, 255)}
                    )
                    ar = ah
                    av.Visible = true
                end
            end
        )
        function at:MSector(ah, az)
            local aA = ah
            local aB = {}
            values[as][ah] = {}
            local aC = l("Frame")
            local aD = l("TextLabel")
            local aE = l("Frame")
            local aF = l("Frame")
            local ay = l("UIListLayout")
            aC.Name = "Section"
            aC.Parent = av[az]
            aC.BackgroundColor3 = n(0, 0, 0)
            aC.BorderColor3 = n(0, 0, 0)
            aC.BorderSizePixel = 0
            aC.Size = A(1, 0, 0, 33)
            aD.Name = "SectionText"
            aD.Parent = aC
            aD.BackgroundColor3 = n(255, 255, 255)
            aD.BackgroundTransparency = 1.000
            aD.Position = A(0, 7, 0, -12)
            aD.Size = A(0, 270, 0, 19)
            aD.ZIndex = 2
            aD.Font = Enum.Font.SourceSansSemibold
            aD.Text = ah
            aD.TextColor3 = n(255, 255, 255)
            aD.TextSize = 15.000
            aD.TextXAlignment = Enum.TextXAlignment.Left
            aE.Name = "Inner"
            aE.Parent = aC
            aE.BackgroundColor3 = n(0, 0, 0)
            aE.BorderColor3 = n(0, 0, 0)
            aE.BorderSizePixel = 0
            aE.Position = A(0, 1, 0, 1)
            aE.Size = A(1, -2, 1, -9)
            aF.Name = "sectiontabs"
            aF.Parent = aC
            aF.BackgroundColor3 = n(255, 255, 255)
            aF.BackgroundTransparency = 1.000
            aF.Position = A(0, 0, 0, 6)
            aF.Size = A(1, 0, 0, 22)
            ay.Parent = aF
            ay.FillDirection = Enum.FillDirection.Horizontal
            ay.HorizontalAlignment = Enum.HorizontalAlignment.Center
            ay.SortOrder = Enum.SortOrder.LayoutOrder
            ay.Padding = UDim.new(0, 4)
            local aG = true
            local aH
            function aB:Tab(ah)
                local aI = {}
                values[as][aA][ah] = {}
                local aJ = ah
                local aK = A(1, 0, 0, 44)
                local aL = l("Frame")
                local aM = l("UIPadding")
                local a3 = l("UIListLayout")
                local au = l("TextButton")
                aL.Name = ah
                aL.Parent = aE
                aL.BackgroundColor3 = n(0, 0, 0)
                aL.BorderColor3 = n(27, 27, 35)
                aL.BorderSizePixel = 0
                aL.Position = A(0, 0, 0, 30)
                aL.Size = A(1, 0, 1, -21)
                aL.Name = ah
                aL.Visible = false
                aM.Parent = aL
                aM.PaddingTop = UDim.new(0, 0)
                a3.Parent = aL
                a3.HorizontalAlignment = Enum.HorizontalAlignment.Center
                a3.SortOrder = Enum.SortOrder.LayoutOrder
                a3.Padding = UDim.new(0, 1)
                au.Parent = aF
                au.BackgroundColor3 = n(255, 255, 255)
                au.BackgroundTransparency = 1.000
                au.Size = A(0, f:GetTextSize(ah, 14, Enum.Font.SourceSansSemibold, i(700, 700)).X + 2, 1, 0)
                au.Font = Enum.Font.SourceSansSemibold
                au.Text = ah
                au.TextColor3 = n(200, 200, 200)
                au.TextSize = 14.000
                au.Name = ah
                au.MouseButton1Down:Connect(
                    function()
                        for T, v in pairs(aE:GetChildren()) do
                            v.Visible = false
                        end
                        for T, v in pairs(aF:GetChildren()) do
                            if v:IsA("TextButton") then
                                a:Tween(
                                    v,
                                    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {TextColor3 = n(200, 200, 200)}
                                )
                            end
                        end
                        aC.Size = aK
                        aL.Visible = true
                        a:Tween(
                            au,
                            TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {TextColor3 = n(255, 255, 255)}
                        )
                    end
                )
                function aI:Element(type, ah, aN, aO)
                    local aP = {}
                    aN = aN or {}
                    aO = aO or function()
                        end
                    values[as][aA][aJ][ah] = {}
                    if type == "Jumbobox" then
                        aK = aK + A(0, 0, 0, 39)
                        aP.value = {Jumbobox = {}}
                        aN.options = aN.options or {}
                        local aQ = l("Frame")
                        local aR = l("TextButton")
                        local a1 = l("TextLabel")
                        local aS = l("ScrollingFrame")
                        local aT = l("TextButton")
                        local aU = l("TextLabel")
                        local a3 = l("UIListLayout")
                        local ae = l("ImageLabel")
                        local aV = l("TextLabel")
                        aQ.Name = "Dropdown"
                        aQ.Parent = aL
                        aQ.BackgroundColor3 = n(255, 255, 255)
                        aQ.BackgroundTransparency = 1.000
                        aQ.Position = A(0, 0, 0.255102038, 0)
                        aQ.Size = A(1, 0, 0, 39)
                        aR.Name = "Button"
                        aR.Parent = aQ
                        aR.BackgroundColor3 = n(0, 0, 0)
                        aR.BorderColor3 = n(27, 27, 35)
                        aR.Position = A(0, 30, 0, 16)
                        aR.Size = A(0, 175, 0, 17)
                        aR.AutoButtonColor = false
                        aR.Font = Enum.Font.SourceSans
                        aR.Text = ""
                        aR.TextColor3 = n(0, 0, 0)
                        aR.TextSize = 14.000
                        a1.Parent = aR
                        a1.BackgroundColor3 = n(255, 255, 255)
                        a1.BackgroundTransparency = 1.000
                        a1.BorderColor3 = n(27, 42, 53)
                        a1.Position = A(0, 5, 0, 0)
                        a1.Size = A(-0.21714285, 208, 1, 0)
                        a1.Font = Enum.Font.SourceSansSemibold
                        a1.Text = "..."
                        a1.TextColor3 = n(200, 200, 200)
                        a1.TextSize = 14.000
                        a1.TextXAlignment = Enum.TextXAlignment.Left
                        local aW = a1
                        aS.Name = "Drop"
                        aS.Parent = aR
                        aS.Active = true
                        aS.BackgroundColor3 = n(0, 0, 0)
                        aS.BorderColor3 = n(27, 27, 35)
                        aS.Position = A(0, 0, 1, 1)
                        aS.Size = A(1, 0, 0, 20)
                        aS.Visible = false
                        aS.BottomImage = "http://www.roblox.com/asset/?id=6724808282"
                        aS.CanvasSize = A(1, 1, 1, 1)
                        aS.ScrollBarThickness = 0
                        aS.TopImage = "http://www.roblox.com/asset/?id=6724808282"
                        aS.MidImage = "http://www.roblox.com/asset/?id=6724808282"
                        aS.AutomaticCanvasSize = "Y"
                        aS.ZIndex = 5
                        aS.ScrollBarImageColor3 = L
                        a3.Parent = aS
                        a3.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        a3.SortOrder = Enum.SortOrder.LayoutOrder
                        values[as][aA][aJ][ah] = aP.value
                        local aX = #aN.options
                        if aX > 5 then
                            aS.Size = A(1, 0, 0, 85)
                        else
                            aS.Size = A(1, 0, 0, 17 * aX)
                        end
                        local aq = true
                        local function aY()
                            local aZ = {}
                            for T, v in ipairs(aN.options) do
                                if I(aP.value.Jumbobox, v) then
                                    H(aZ, v)
                                else
                                end
                            end
                            local a_ = ""
                            if #aZ == 0 then
                                a_ = "..."
                            else
                                if #aZ == 1 then
                                    a_ = aZ[1]
                                else
                                    for T, v in ipairs(aZ) do
                                        if T == 1 then
                                            a_ = v
                                        else
                                            if T > 2 then
                                                if T < 4 then
                                                    a_ = a_ .. ",  ..."
                                                end
                                            else
                                                a_ = a_ .. ",  " .. v
                                            end
                                        end
                                    end
                                end
                            end
                            aW.Text = a_
                        end
                        for T, v in ipairs(aN.options) do
                            do
                                local aR = l("TextButton")
                                local a1 = l("TextLabel")
                                aR.Name = v
                                aR.Parent = aS
                                aR.BackgroundColor3 = n(35, 35, 47)
                                aR.BorderColor3 = n(27, 27, 35)
                                aR.Position = A(0, 30, 0, 16)
                                aR.Size = A(0, 175, 0, 17)
                                aR.AutoButtonColor = false
                                aR.Font = Enum.Font.SourceSans
                                aR.Text = ""
                                aR.TextColor3 = n(0, 0, 0)
                                aR.TextSize = 14.000
                                aR.BorderSizePixel = 0
                                aR.ZIndex = 6
                                a1.Parent = aR
                                a1.BackgroundColor3 = n(255, 255, 255)
                                a1.BackgroundTransparency = 1.000
                                a1.BorderColor3 = n(27, 42, 53)
                                a1.Position = A(0, 5, 0, -1)
                                a1.Size = A(-0.21714285, 208, 1, 0)
                                a1.Font = Enum.Font.SourceSansSemibold
                                a1.Text = v
                                a1.TextColor3 = n(200, 200, 200)
                                a1.TextSize = 14.000
                                a1.TextXAlignment = Enum.TextXAlignment.Left
                                a1.ZIndex = 6
                                aR.MouseButton1Down:Connect(
                                    function()
                                        if I(aP.value.Jumbobox, v) then
                                            for T, X in pairs(aP.value.Jumbobox) do
                                                if X == v then
                                                    J(aP.value.Jumbobox, T)
                                                end
                                            end
                                            a:Tween(
                                                a1,
                                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                                {TextColor3 = n(255, 255, 255)}
                                            )
                                        else
                                            H(aP.value.Jumbobox, v)
                                            a:Tween(
                                                a1,
                                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                                {TextColor3 = L}
                                            )
                                        end
                                        aY()
                                        values[as][aA][aJ][ah] = aP.value
                                        aO(aP.value)
                                    end
                                )
                                aR.MouseEnter:Connect(
                                    function()
                                        if not I(aP.value.Jumbobox, v) then
                                            a:Tween(
                                                a1,
                                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                                {TextColor3 = n(255, 255, 255)}
                                            )
                                        end
                                    end
                                )
                                aR.MouseLeave:Connect(
                                    function()
                                        if not I(aP.value.Jumbobox, v) then
                                            a:Tween(
                                                a1,
                                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                                {TextColor3 = n(200, 200, 200)}
                                            )
                                        end
                                    end
                                )
                                aq = false
                            end
                        end
                        function aP:SetValue(b0)
                            aP.value = b0
                            for T, v in pairs(aS:GetChildren()) do
                                if v.Name ~= "UIListLayout" then
                                    if I(b0.Jumbobox, v.Name) then
                                        v.TextLabel.TextColor3 = n(175, 175, 175)
                                    else
                                        v.TextLabel.TextColor3 = n(200, 200, 200)
                                    end
                                end
                            end
                            aY()
                            values[as][aA][aJ][ah] = aP.value
                            aO(b0)
                        end
                        if aN.default then
                            aP:SetValue(aN.default)
                        end
                        ae.Parent = aR
                        ae.BackgroundColor3 = n(255, 255, 255)
                        ae.BackgroundTransparency = 1.000
                        ae.Position = A(0, 165, 0, 6)
                        ae.Size = A(0, 6, 0, 4)
                        ae.Image = "http://www.roblox.com/asset/?id=6724771531"
                        aV.Parent = aQ
                        aV.BackgroundColor3 = n(200, 200, 200)
                        aV.BackgroundTransparency = 1.000
                        aV.Position = A(0, 32, 0, -1)
                        aV.Size = A(0.111913361, 208, 0.382215232, 0)
                        aV.Font = Enum.Font.SourceSansSemibold
                        aV.Text = ah
                        aV.TextColor3 = L
                        aV.TextSize = 14.000
                        aV.TextXAlignment = Enum.TextXAlignment.Left
                        aR.MouseButton1Down:Connect(
                            function()
                                aS.Visible = not aS.Visible
                                if not aS.Visible then
                                    aS.CanvasPosition = i(0, 0)
                                end
                            end
                        )
                        local b1 = false
                        local b2 = false
                        aS.MouseEnter:Connect(
                            function()
                                b1 = true
                            end
                        )
                        aS.MouseLeave:Connect(
                            function()
                                b1 = false
                            end
                        )
                        aR.MouseEnter:Connect(
                            function()
                                b2 = true
                            end
                        )
                        aR.MouseLeave:Connect(
                            function()
                                b2 = false
                            end
                        )
                        game:GetService("UserInputService").InputBegan:Connect(
                            function(ao)
                                if
                                    ao.UserInputType == Enum.UserInputType.MouseButton1 or
                                        ao.UserInputType == Enum.UserInputType.MouseButton2
                                 then
                                    if aS.Visible == true and not b1 and not b2 then
                                        aS.Visible = false
                                        aS.CanvasPosition = i(0, 0)
                                    end
                                end
                            end
                        )
                    elseif type == "TextBox" then
                    elseif type == "ToggleKeybind" then
                        aK = aK + A(0, 0, 0, 16)
                        aP.value = {
                            Toggle = aN.default and aN.default.Toggle or false,
                            Key,
                            Type = "Always",
                            Active = true
                        }
                        local b3 = l("Frame")
                        local aR = l("TextButton")
                        local b4 = l("Frame")
                        local a1 = l("TextLabel")
                        b3.Name = "Toggle"
                        b3.Parent = aL
                        b3.BackgroundColor3 = n(255, 255, 255)
                        b3.BackgroundTransparency = 1.000
                        b3.Size = A(1, 0, 0, 15)
                        aR.Name = "Button"
                        aR.Parent = b3
                        aR.BackgroundColor3 = n(255, 255, 255)
                        aR.BackgroundTransparency = 1.000
                        aR.Size = A(1, 0, 1, 0)
                        aR.Font = Enum.Font.SourceSans
                        aR.Text = ""
                        aR.TextColor3 = n(0, 0, 0)
                        aR.TextSize = 14.000
                        b4.Name = "Color"
                        b4.Parent = aR
                        b4.BackgroundColor3 = n(0, 0, 0)
                        b4.BorderColor3 = n(27, 3275, 35)
                        b4.Position = A(0, 15, 0.5, -5)
                        b4.Size = A(0, 8, 0, 8)
                        local b5 = false
                        a1.Parent = aR
                        a1.BackgroundColor3 = n(255, 255, 255)
                        a1.BackgroundTransparency = 1.000
                        a1.Position = A(0, 32, 0, -1)
                        a1.Size = A(0.111913361, 208, 1, 0)
                        a1.Font = Enum.Font.SourceSansSemibold
                        a1.Text = ah
                        a1.TextColor3 = n(200, 200, 200)
                        a1.TextSize = 14.000
                        a1.TextXAlignment = Enum.TextXAlignment.Left
                        local function an()
                            if aP.value.Toggle then
                                tween =
                                    a:Tween(
                                    b4,
                                    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {BackgroundColor3 = L}
                                )
                                a:Tween(
                                    a1,
                                    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {TextColor3 = n(255, 255, 255)}
                                )
                            else
                                keybindremove(ah)
                                tween =
                                    a:Tween(
                                    b4,
                                    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {BackgroundColor3 = n(0, 0, 0)}
                                )
                                a:Tween(
                                    a1,
                                    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {TextColor3 = n(200, 200, 200)}
                                )
                            end
                            values[as][aA][aJ][ah] = aP.value
                            aO(aP.value)
                        end
                        aR.MouseButton1Down:Connect(
                            function()
                                if not b5 then
                                    aP.value.Toggle = not aP.value.Toggle
                                    an()
                                    values[as][aA][aJ][ah] = aP.value
                                    aO(aP.value)
                                end
                            end
                        )
                        if aN.default then
                            an()
                        end
                        values[as][aA][aJ][ah] = aP.value
                        do
                            local b6 = l("TextButton")
                            local ad = l("Frame")
                            local b7 = l("TextButton")
                            local a3 = l("UIListLayout")
                            local b8 = l("TextButton")
                            local b3 = l("TextButton")
                            b6.Name = "Keybind"
                            b6.Parent = aR
                            b6.BackgroundColor3 = n(0, 0, 0)
                            b6.BorderColor3 = n(27, 27, 35)
                            b6.Position = A(0, 270, 0.5, -6)
                            b6.Text = "NONE"
                            b6.Size = A(0, 43, 0, 12)
                            b6.Size =
                                A(0, f:GetTextSize("NONE", 14, Enum.Font.SourceSansSemibold, i(700, 12)).X + 5, 0, 12)
                            b6.AutoButtonColor = false
                            b6.Font = Enum.Font.SourceSansSemibold
                            b6.TextColor3 = n(200, 200, 200)
                            b6.TextSize = 14.000
                            b6.AnchorPoint = i(1, 0)
                            b6.ZIndex = 3
                            ad.Parent = b6
                            ad.BackgroundColor3 = n(0, 0, 0)
                            ad.BorderColor3 = n(27, 27, 35)
                            ad.Position = A(1, -49, 0, 1)
                            ad.Size = A(0, 49, 0, 49)
                            ad.Visible = false
                            ad.ZIndex = 3
                            b7.Name = "Always"
                            b7.Parent = ad
                            b7.BackgroundColor3 = n(0, 0, 0)
                            b7.BackgroundTransparency = 1.000
                            b7.BorderColor3 = n(27, 27, 35)
                            b7.Position = A(-3.03289485, 231, 0.115384616, -6)
                            b7.Size = A(1, 0, 0, 16)
                            b7.AutoButtonColor = false
                            b7.Font = Enum.Font.SourceSansBold
                            b7.Text = "Always"
                            b7.TextColor3 = L
                            b7.TextSize = 14.000
                            b7.ZIndex = 3
                            a3.Parent = ad
                            a3.HorizontalAlignment = Enum.HorizontalAlignment.Center
                            a3.SortOrder = Enum.SortOrder.LayoutOrder
                            b8.Name = "Hold"
                            b8.Parent = ad
                            b8.BackgroundColor3 = n(0, 0, 0)
                            b8.BackgroundTransparency = 1.000
                            b8.BorderColor3 = n(27, 27, 35)
                            b8.Position = A(-3.03289485, 231, 0.115384616, -6)
                            b8.Size = A(1, 0, 0, 16)
                            b8.AutoButtonColor = false
                            b8.Font = Enum.Font.SourceSansSemibold
                            b8.Text = "Hold"
                            b8.TextColor3 = n(200, 200, 200)
                            b8.TextSize = 14.000
                            b8.ZIndex = 3
                            b3.Name = "Toggle"
                            b3.Parent = ad
                            b3.BackgroundColor3 = n(0, 0, 0)
                            b3.BackgroundTransparency = 1.000
                            b3.BorderColor3 = n(27, 27, 35)
                            b3.Position = A(-3.03289485, 231, 0.115384616, -6)
                            b3.Size = A(1, 0, 0, 16)
                            b3.AutoButtonColor = false
                            b3.Font = Enum.Font.SourceSansSemibold
                            b3.Text = "Toggle"
                            b3.TextColor3 = n(200, 200, 200)
                            b3.TextSize = 14.000
                            b3.ZIndex = 3
                            for b9, ba in pairs(ad:GetChildren()) do
                                if ba:IsA("TextButton") then
                                    ba.MouseButton1Down:Connect(
                                        function()
                                            aP.value.Type = ba.Text
                                            ad.Visible = false
                                            aP.value.Active = aP.value.Type == "Always" and true or false
                                            if aP.value.Type == "Always" then
                                                keybindremove(ah)
                                            end
                                            for b9, ba in pairs(ad:GetChildren()) do
                                                if ba:IsA("TextButton") and ba.Text ~= aP.value.Type then
                                                    ba.Font = Enum.Font.SourceSansSemibold
                                                    a:Tween(
                                                        ba,
                                                        TweenInfo.new(
                                                            0.1,
                                                            Enum.EasingStyle.Quad,
                                                            Enum.EasingDirection.Out
                                                        ),
                                                        {TextColor3 = n(200, 200, 200)}
                                                    )
                                                end
                                            end
                                            ba.Font = Enum.Font.SourceSansBold
                                            ba.TextColor3 = n(60, 0, 90)
                                            values[as][aA][aJ][ah] = aP.value
                                            aO(aP.value)
                                        end
                                    )
                                    ba.MouseEnter:Connect(
                                        function()
                                            if aP.value.Type ~= ba.Text then
                                                a:Tween(
                                                    ba,
                                                    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                                    {TextColor3 = n(255, 255, 255)}
                                                )
                                            end
                                        end
                                    )
                                    ba.MouseLeave:Connect(
                                        function()
                                            if aP.value.Type ~= ba.Text then
                                                a:Tween(
                                                    ba,
                                                    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                                    {TextColor3 = n(200, 200, 200)}
                                                )
                                            end
                                        end
                                    )
                                end
                            end
                            b6.MouseButton1Down:Connect(
                                function()
                                    if not b5 then
                                        wait()
                                        b5 = true
                                        b6.Text = "..."
                                        b6.Size =
                                            A(
                                            0,
                                            f:GetTextSize("...", 14, Enum.Font.SourceSansSemibold, i(700, 12)).X + 4,
                                            0,
                                            12
                                        )
                                    end
                                end
                            )
                            b6.MouseButton2Down:Connect(
                                function()
                                    if not b5 then
                                        ad.Visible = not ad.Visible
                                    end
                                end
                            )
                            local Player = game.Players.LocalPlayer
                            local aa = Player:GetMouse()
                            local bb = false
                            ad.MouseEnter:Connect(
                                function()
                                    bb = true
                                end
                            )
                            ad.MouseLeave:Connect(
                                function()
                                    bb = false
                                end
                            )
                            local bc = false
                            b6.MouseEnter:Connect(
                                function()
                                    bc = true
                                end
                            )
                            b6.MouseLeave:Connect(
                                function()
                                    bc = false
                                end
                            )
                            game:GetService("UserInputService").InputBegan:Connect(
                                function(ao)
                                    if
                                        ao.UserInputType == Enum.UserInputType.MouseButton1 or
                                            ao.UserInputType == Enum.UserInputType.MouseButton2 and not b5
                                     then
                                        if ad.Visible == true and not bb and not bc then
                                            ad.Visible = false
                                        end
                                    end
                                    if b5 then
                                        b5 = false
                                        b6.Text =
                                            ao.KeyCode.Name ~= "Unknown" and ao.KeyCode.Name:upper() or
                                            ao.UserInputType.Name:upper()
                                        b6.Size =
                                            A(
                                            0,
                                            f:GetTextSize(b6.Text, 14, Enum.Font.SourceSansSemibold, i(700, 12)).X + 5,
                                            0,
                                            12
                                        )
                                        aP.value.Key =
                                            ao.KeyCode.Name ~= "Unknown" and ao.KeyCode.Name or ao.UserInputType.Name
                                        if ao.KeyCode.Name == "Backspace" then
                                            b6.Text = "NONE"
                                            b6.Size =
                                                A(
                                                0,
                                                f:GetTextSize(b6.Text, 14, Enum.Font.SourceSansSemibold, i(700, 12)).X +
                                                    4,
                                                0,
                                                12
                                            )
                                            aP.value.Key = nil
                                        end
                                    else
                                        if aP.value.Key ~= nil then
                                            if C(aP.value.Key, "Mouse") then
                                                if ao.UserInputType == Enum.UserInputType[aP.value.Key] then
                                                    if aP.value.Type == "Hold" then
                                                        aP.value.Active = true
                                                        if aP.value.Active and aP.value.Toggle then
                                                            keybindadd(ah)
                                                        else
                                                            keybindremove(ah)
                                                        end
                                                    elseif aP.value.Type == "Toggle" then
                                                        aP.value.Active = not aP.value.Active
                                                        if aP.value.Active and aP.value.Toggle then
                                                            keybindadd(ah)
                                                        else
                                                            keybindremove(ah)
                                                        end
                                                    end
                                                end
                                            else
                                                if ao.KeyCode == Enum.KeyCode[aP.value.Key] then
                                                    if aP.value.Type == "Hold" then
                                                        aP.value.Active = true
                                                        if aP.value.Active and aP.value.Toggle then
                                                            keybindadd(ah)
                                                        else
                                                            keybindremove(ah)
                                                        end
                                                    elseif aP.value.Type == "Toggle" then
                                                        aP.value.Active = not aP.value.Active
                                                        if aP.value.Active and aP.value.Toggle then
                                                            keybindadd(ah)
                                                        else
                                                            keybindremove(ah)
                                                        end
                                                    end
                                                end
                                            end
                                        else
                                            aP.value.Active = true
                                        end
                                    end
                                    values[as][aA][aJ][ah] = aP.value
                                    aO(aP.value)
                                end
                            )
                            game:GetService("UserInputService").InputEnded:Connect(
                                function(ao)
                                    if aP.value.Key ~= nil then
                                        if C(aP.value.Key, "Mouse") then
                                            if ao.UserInputType == Enum.UserInputType[aP.value.Key] then
                                                if aP.value.Type == "Hold" then
                                                    aP.value.Active = false
                                                    if aP.value.Active and aP.value.Toggle then
                                                        keybindadd(ah)
                                                    else
                                                        keybindremove(ah)
                                                    end
                                                end
                                            end
                                        else
                                            if ao.KeyCode == Enum.KeyCode[aP.value.Key] then
                                                if aP.value.Type == "Hold" then
                                                    aP.value.Active = false
                                                    if aP.value.Active and aP.value.Toggle then
                                                        keybindadd(ah)
                                                    else
                                                        keybindremove(ah)
                                                    end
                                                end
                                            end
                                        end
                                    end
                                    values[as][aA][aJ][ah] = aP.value
                                    aO(aP.value)
                                end
                            )
                        end
                        function aP:SetValue(bd)
                            aP.value = bd
                            an()
                        end
                    elseif type == "Toggle" then
                        aK = aK + A(0, 0, 0, 16)
                        aP.value = {Toggle = aN.default and aN.default.Toggle or false}
                        local b3 = l("Frame")
                        local aR = l("TextButton")
                        local b4 = l("Frame")
                        local a1 = l("TextLabel")
                        b3.Name = "Toggle"
                        b3.Parent = aL
                        b3.BackgroundColor3 = n(255, 255, 255)
                        b3.BackgroundTransparency = 1.000
                        b3.Size = A(1, 0, 0, 15)
                        aR.Name = "Button"
                        aR.Parent = b3
                        aR.BackgroundColor3 = n(255, 255, 255)
                        aR.BackgroundTransparency = 1.000
                        aR.Size = A(1, 0, 1, 0)
                        aR.Font = Enum.Font.SourceSans
                        aR.Text = ""
                        aR.TextColor3 = n(0, 0, 0)
                        aR.TextSize = 14.000
                        b4.Name = "Color"
                        b4.Parent = aR
                        b4.BackgroundColor3 = n(0, 0, 0)
                        b4.BorderColor3 = n(27, 27, 35)
                        b4.Position = A(0, 15, 0.5, -5)
                        b4.Size = A(0, 8, 0, 8)
                        a1.Parent = aR
                        a1.BackgroundColor3 = n(255, 255, 255)
                        a1.BackgroundTransparency = 1.000
                        a1.Position = A(0, 32, 0, -1)
                        a1.Size = A(0.111913361, 208, 1, 0)
                        a1.Font = Enum.Font.SourceSansSemibold
                        a1.Text = ah
                        a1.TextColor3 = n(200, 200, 200)
                        a1.TextSize = 14.000
                        a1.TextXAlignment = Enum.TextXAlignment.Left
                        local function an()
                            if aP.value.Toggle then
                                tween =
                                    a:Tween(
                                    b4,
                                    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {BackgroundColor3 = L}
                                )
                                a:Tween(
                                    a1,
                                    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {TextColor3 = n(255, 255, 255)}
                                )
                            else
                                keybindremove(ah)
                                tween =
                                    a:Tween(
                                    b4,
                                    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {BackgroundColor3 = n(0, 0, 0)}
                                )
                                a:Tween(
                                    a1,
                                    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {TextColor3 = n(200, 200, 200)}
                                )
                            end
                            values[as][aA][aJ][ah] = aP.value
                        end
                        aR.MouseButton1Down:Connect(
                            function()
                                aP.value.Toggle = not aP.value.Toggle
                                an()
                                values[as][aA][aJ][ah] = aP.value
                                aO(aP.value)
                            end
                        )
                        if aN.default then
                            an()
                        end
                        values[as][aA][aJ][ah] = aP.value
                        function aP:SetValue(bd)
                            aP.value = bd
                            values[as][aA][aJ][ah] = aP.value
                            an()
                            aO(aP.value)
                        end
                    elseif type == "ToggleColor" then
                        aK = aK + A(0, 0, 0, 16)
                        aP.value = {
                            Toggle = aN.default and aN.default.Toggle or false,
                            Color = aN.default and aN.default.Color or n(255, 255, 255)
                        }
                        local b3 = l("Frame")
                        local aR = l("TextButton")
                        local b4 = l("Frame")
                        local a1 = l("TextLabel")
                        b3.Name = "Toggle"
                        b3.Parent = aL
                        b3.BackgroundColor3 = n(255, 255, 255)
                        b3.BackgroundTransparency = 1.000
                        b3.Size = A(1, 0, 0, 15)
                        aR.Name = "Button"
                        aR.Parent = b3
                        aR.BackgroundColor3 = n(255, 255, 255)
                        aR.BackgroundTransparency = 1.000
                        aR.Size = A(1, 0, 1, 0)
                        aR.Font = Enum.Font.SourceSans
                        aR.Text = ""
                        aR.TextColor3 = n(0, 0, 0)
                        aR.TextSize = 14.000
                        b4.Name = "Color"
                        b4.Parent = aR
                        b4.BackgroundColor3 = n(0, 0, 0)
                        b4.BorderColor3 = n(27, 27, 35)
                        b4.Position = A(0, 15, 0.5, -5)
                        b4.Size = A(0, 8, 0, 8)
                        a1.Parent = aR
                        a1.BackgroundColor3 = n(255, 255, 255)
                        a1.BackgroundTransparency = 1.000
                        a1.Position = A(0, 32, 0, -1)
                        a1.Size = A(0.111913361, 208, 1, 0)
                        a1.Font = Enum.Font.SourceSansSemibold
                        a1.Text = ah
                        a1.TextColor3 = n(200, 200, 200)
                        a1.TextSize = 14.000
                        a1.TextXAlignment = Enum.TextXAlignment.Left
                        local function an()
                            if aP.value.Toggle then
                                tween =
                                    a:Tween(
                                    b4,
                                    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {BackgroundColor3 = n(155, 155, 155)}
                                )
                                a:Tween(
                                    a1,
                                    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {TextColor3 = n(255, 255, 255)}
                                )
                            else
                                tween =
                                    a:Tween(
                                    b4,
                                    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {BackgroundColor3 = n(0, 0, 0)}
                                )
                                a:Tween(
                                    a1,
                                    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {TextColor3 = n(200, 200, 200)}
                                )
                            end
                            values[as][aA][aJ][ah] = aP.value
                            aO(aP.value)
                        end
                        local be, bf, bg
                        local bh = l("TextButton")
                        local ad = l("Frame")
                        local bi = l("ImageButton")
                        local bj = l("Frame")
                        local bk = l("ImageButton")
                        local bl = l("Frame")
                        bh.Name = "ColorP"
                        bh.Parent = aR
                        bh.AnchorPoint = i(1, 0)
                        bh.BackgroundColor3 = n(255, 0, 0)
                        bh.BorderColor3 = n(27, 27, 35)
                        bh.Position = A(0, 270, 0.5, -4)
                        bh.Size = A(0, 18, 0, 8)
                        bh.AutoButtonColor = false
                        bh.Font = Enum.Font.SourceSansSemibold
                        bh.Text = ""
                        bh.TextColor3 = n(200, 200, 200)
                        bh.TextSize = 14.000
                        ad.Parent = bh
                        ad.BackgroundColor3 = n(0, 0, 0)
                        ad.BorderColor3 = n(27, 27, 35)
                        ad.Position = A(-0.666666687, -170, 1.375, 0)
                        ad.Size = A(0, 200, 0, 170)
                        ad.Visible = false
                        ad.ZIndex = 3
                        bi.Name = "Colorpick"
                        bi.Parent = ad
                        bi.BackgroundColor3 = n(255, 255, 255)
                        bi.BorderColor3 = n(27, 27, 35)
                        bi.ClipsDescendants = false
                        bi.Position = A(0, 40, 0, 10)
                        bi.Size = A(0, 150, 0, 150)
                        bi.AutoButtonColor = false
                        bi.Image = "rbxassetid://4155801252"
                        bi.ImageColor3 = n(255, 0, 0)
                        bi.ZIndex = 3
                        bj.Name = "ColorDrag"
                        bj.Parent = bi
                        bj.AnchorPoint = i(0.5, 0.5)
                        bj.BackgroundColor3 = n(255, 255, 255)
                        bj.BorderColor3 = n(27, 27, 35)
                        bj.Size = A(0, 4, 0, 4)
                        bj.ZIndex = 3
                        bk.Name = "Huepick"
                        bk.Parent = ad
                        bk.BackgroundColor3 = n(255, 255, 255)
                        bk.BorderColor3 = n(27, 27, 35)
                        bk.ClipsDescendants = false
                        bk.Position = A(0, 10, 0, 10)
                        bk.Size = A(0, 20, 0, 150)
                        bk.AutoButtonColor = false
                        bk.Image = "rbxassetid://3641079629"
                        bk.ImageColor3 = n(255, 0, 0)
                        bk.ImageTransparency = 1
                        bk.BackgroundTransparency = 0
                        bk.ZIndex = 3
                        local bm = l("UIGradient")
                        bm.Rotation = 90
                        bm.Name = "HueFrameGradient"
                        bm.Parent = bk
                        bm.Color =
                            ColorSequence.new {
                            ColorSequenceKeypoint.new(0.00, n(255, 0, 0)),
                            ColorSequenceKeypoint.new(0.17, n(255, 0, 255)),
                            ColorSequenceKeypoint.new(0.33, n(0, 0, 255)),
                            ColorSequenceKeypoint.new(0.50, n(0, 255, 255)),
                            ColorSequenceKeypoint.new(0.67, n(0, 255, 0)),
                            ColorSequenceKeypoint.new(0.83, n(255, 255, 0)),
                            ColorSequenceKeypoint.new(1.00, n(255, 0, 0))
                        }
                        bl.Name = "Huedrag"
                        bl.Parent = bk
                        bl.BackgroundColor3 = n(255, 255, 255)
                        bl.BorderColor3 = n(27, 27, 35)
                        bl.Size = A(1, 0, 0, 2)
                        bl.ZIndex = 3
                        bh.MouseButton1Down:Connect(
                            function()
                                ad.Visible = not ad.Visible
                            end
                        )
                        local bn = false
                        local bo = false
                        bh.MouseEnter:Connect(
                            function()
                                bn = true
                            end
                        )
                        bh.MouseLeave:Connect(
                            function()
                                bn = false
                            end
                        )
                        ad.MouseEnter:Connect(
                            function()
                                bo = true
                            end
                        )
                        ad.MouseLeave:Connect(
                            function()
                                bo = false
                            end
                        )
                        be = p(bl.AbsolutePosition.Y - bk.AbsolutePosition.Y, 0, bk.AbsoluteSize.Y) / bk.AbsoluteSize.Y
                        bf =
                            1 -
                            p(bj.AbsolutePosition.X - bi.AbsolutePosition.X, 0, bi.AbsoluteSize.X) / bi.AbsoluteSize.X
                        bg =
                            1 -
                            p(bj.AbsolutePosition.Y - bi.AbsolutePosition.Y, 0, bi.AbsoluteSize.Y) / bi.AbsoluteSize.Y
                        if aN.default.Color ~= nil then
                            be, bf, bg = aN.default.Color:ToHSV()
                            be = p(be, 0, 1)
                            bf = p(bf, 0, 1)
                            bg = p(bg, 0, 1)
                            bj.Position = A(1 - bf, 0, 1 - bg, 0)
                            bi.ImageColor3 = o(be, 1, 1)
                            bh.BackgroundColor3 = o(be, bf, bg)
                            bl.Position = A(0, 0, 1 - be, -1)
                        end
                        local bp = a9:GetMouse()
                        game:GetService("UserInputService").InputBegan:Connect(
                            function(ao)
                                if
                                    ao.UserInputType == Enum.UserInputType.MouseButton1 or
                                        ao.UserInputType == Enum.UserInputType.MouseButton2
                                 then
                                    if not dragging and not bn and not bo then
                                        ad.Visible = false
                                    end
                                end
                            end
                        )
                        local function bq()
                            local br = p(bp.X - bi.AbsolutePosition.X, 0, bi.AbsoluteSize.X) / bi.AbsoluteSize.X
                            local bs = p(bp.Y - bi.AbsolutePosition.Y, 0, bi.AbsoluteSize.Y) / bi.AbsoluteSize.Y
                            bj.Position = A(br, 0, bs, 0)
                            bf = 1 - br
                            bg = 1 - bs
                            bi.ImageColor3 = o(be, 1, 1)
                            bh.BackgroundColor3 = o(be, bf, bg)
                            values[as][aA][aJ][ah] = aP.value
                            aP.value.Color = o(be, bf, bg)
                            aO(aP.value)
                        end
                        local function bt()
                            local bu = p(bp.Y - bk.AbsolutePosition.Y, 0, 148)
                            bl.Position = A(0, 0, 0, bu)
                            hue = bu / 148
                            be = 1 - hue
                            bi.ImageColor3 = o(be, 1, 1)
                            bh.BackgroundColor3 = o(be, bf, bg)
                            values[as][aA][aJ][ah] = aP.value
                            aP.value.Color = o(be, bf, bg)
                            aO(aP.value)
                        end
                        bi.MouseButton1Down:Connect(
                            function()
                                bq()
                                moveconnection =
                                    bp.Move:Connect(
                                    function()
                                        bq()
                                    end
                                )
                                releaseconnection =
                                    game:GetService("UserInputService").InputEnded:Connect(
                                    function(aa)
                                        if aa.UserInputType == Enum.UserInputType.MouseButton1 then
                                            bq()
                                            moveconnection:Disconnect()
                                            releaseconnection:Disconnect()
                                        end
                                    end
                                )
                            end
                        )
                        bk.MouseButton1Down:Connect(
                            function()
                                bt()
                                moveconnection =
                                    bp.Move:Connect(
                                    function()
                                        bt()
                                    end
                                )
                                releaseconnection =
                                    game:GetService("UserInputService").InputEnded:Connect(
                                    function(aa)
                                        if aa.UserInputType == Enum.UserInputType.MouseButton1 then
                                            bt()
                                            moveconnection:Disconnect()
                                            releaseconnection:Disconnect()
                                        end
                                    end
                                )
                            end
                        )
                        aR.MouseButton1Down:Connect(
                            function()
                                aP.value.Toggle = not aP.value.Toggle
                                an()
                                values[as][aA][aJ][ah] = aP.value
                                aO(aP.value)
                            end
                        )
                        if aN.default then
                            an()
                        end
                        values[as][aA][aJ][ah] = aP.value
                        function aP:SetValue(bd)
                            aP.value = bd
                            local bv = m(bd.Color.R, bd.Color.G, bd.Color.B)
                            be, bf, bg = bv:ToHSV()
                            be = p(be, 0, 1)
                            bf = p(bf, 0, 1)
                            bg = p(bg, 0, 1)
                            bj.Position = A(1 - bf, 0, 1 - bg, 0)
                            bi.ImageColor3 = o(be, 1, 1)
                            bh.BackgroundColor3 = o(be, bf, bg)
                            an()
                            bl.Position = A(0, 0, 1 - be, -1)
                        end
                    elseif type == "ToggleTrans" then
                        aK = aK + A(0, 0, 0, 16)
                        aP.value = {
                            Toggle = aN.default and aN.default.Toggle or false,
                            Color = aN.default and aN.default.Color or n(255, 255, 255),
                            Transparency = aN.default and aN.default.Transparency or 0
                        }
                        local b3 = l("Frame")
                        local aR = l("TextButton")
                        local b4 = l("Frame")
                        local a1 = l("TextLabel")
                        b3.Name = "Toggle"
                        b3.Parent = aL
                        b3.BackgroundColor3 = n(255, 255, 255)
                        b3.BackgroundTransparency = 1.000
                        b3.Size = A(1, 0, 0, 15)
                        aR.Name = "Button"
                        aR.Parent = b3
                        aR.BackgroundColor3 = n(255, 255, 255)
                        aR.BackgroundTransparency = 1.000
                        aR.Size = A(1, 0, 1, 0)
                        aR.Font = Enum.Font.SourceSans
                        aR.Text = ""
                        aR.TextColor3 = n(0, 0, 0)
                        aR.TextSize = 14.000
                        b4.Name = "Color"
                        b4.Parent = aR
                        b4.BackgroundColor3 = n(0, 0, 0)
                        b4.BorderColor3 = n(27, 27, 35)
                        b4.Position = A(0, 15, 0.5, -5)
                        b4.Size = A(0, 8, 0, 8)
                        a1.Parent = aR
                        a1.BackgroundColor3 = n(255, 255, 255)
                        a1.BackgroundTransparency = 1.000
                        a1.Position = A(0, 32, 0, -1)
                        a1.Size = A(0.111913361, 208, 1, 0)
                        a1.Font = Enum.Font.SourceSansSemibold
                        a1.Text = ah
                        a1.TextColor3 = n(200, 200, 200)
                        a1.TextSize = 14.000
                        a1.TextXAlignment = Enum.TextXAlignment.Left
                        local function an()
                            if aP.value.Toggle then
                                tween =
                                    a:Tween(
                                    b4,
                                    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {BackgroundColor3 = n(155, 155, 155)}
                                )
                                a:Tween(
                                    a1,
                                    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {TextColor3 = n(255, 255, 255)}
                                )
                            else
                                tween =
                                    a:Tween(
                                    b4,
                                    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {BackgroundColor3 = n(0, 0, 0)}
                                )
                                a:Tween(
                                    a1,
                                    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {TextColor3 = n(200, 200, 200)}
                                )
                            end
                            values[as][aA][aJ][ah] = aP.value
                            aO(aP.value)
                        end
                        local be, bf, bg
                        local bh = l("TextButton")
                        local ad = l("Frame")
                        local bi = l("ImageButton")
                        local bj = l("Frame")
                        local bk = l("ImageButton")
                        local bl = l("Frame")
                        bh.Name = "ColorP"
                        bh.Parent = aR
                        bh.AnchorPoint = i(1, 0)
                        bh.BackgroundColor3 = n(255, 0, 0)
                        bh.BorderColor3 = n(27, 27, 35)
                        bh.Position = A(0, 270, 0.5, -4)
                        bh.Size = A(0, 18, 0, 8)
                        bh.AutoButtonColor = false
                        bh.Font = Enum.Font.SourceSansSemibold
                        bh.Text = ""
                        bh.TextColor3 = n(200, 200, 200)
                        bh.TextSize = 14.000
                        ad.Parent = bh
                        ad.BackgroundColor3 = n(0, 0, 0)
                        ad.BorderColor3 = n(27, 27, 35)
                        ad.Position = A(-0.666666687, -170, 1.375, 0)
                        ad.Size = A(0, 200, 0, 190)
                        ad.Visible = false
                        ad.ZIndex = 3
                        bi.Name = "Colorpick"
                        bi.Parent = ad
                        bi.BackgroundColor3 = n(255, 255, 255)
                        bi.BorderColor3 = n(27, 27, 35)
                        bi.ClipsDescendants = false
                        bi.Position = A(0, 40, 0, 10)
                        bi.Size = A(0, 150, 0, 150)
                        bi.AutoButtonColor = false
                        bi.Image = "rbxassetid://4155801252"
                        bi.ImageColor3 = n(255, 0, 0)
                        bi.ZIndex = 3
                        bj.Name = "ColorDrag"
                        bj.Parent = bi
                        bj.AnchorPoint = i(0.5, 0.5)
                        bj.BackgroundColor3 = n(255, 255, 255)
                        bj.BorderColor3 = n(27, 27, 35)
                        bj.Size = A(0, 4, 0, 4)
                        bj.ZIndex = 3
                        bk.Name = "Huepick"
                        bk.Parent = ad
                        bk.BackgroundColor3 = n(255, 255, 255)
                        bk.BorderColor3 = n(27, 27, 35)
                        bk.ClipsDescendants = true
                        bk.Position = A(0, 10, 0, 10)
                        bk.Size = A(0, 20, 0, 150)
                        bk.AutoButtonColor = false
                        bk.Image = "rbxassetid://3641079629"
                        bk.ImageColor3 = n(255, 0, 0)
                        bk.ImageTransparency = 1
                        bk.BackgroundTransparency = 0
                        bk.ZIndex = 3
                        local bm = l("UIGradient")
                        bm.Rotation = 90
                        bm.Name = "HueFrameGradient"
                        bm.Parent = bk
                        bm.Color =
                            ColorSequence.new {
                            ColorSequenceKeypoint.new(0.00, n(100, 255, 100)),
                            ColorSequenceKeypoint.new(1.00, n(0, 255, 255))
                        }
                        bl.Name = "Huedrag"
                        bl.Parent = bk
                        bl.BackgroundColor3 = n(255, 255, 255)
                        bl.BorderColor3 = n(27, 27, 35)
                        bl.Size = A(1, 0, 0, 2)
                        bl.ZIndex = 3
                        local bw = l("ImageButton")
                        local bx = l("ImageLabel")
                        local by = l("Frame")
                        bw.Name = "Transpick"
                        bw.Parent = ad
                        bw.BackgroundColor3 = n(255, 255, 255)
                        bw.BorderColor3 = n(27, 27, 35)
                        bw.Position = A(0, 10, 0, 167)
                        bw.Size = A(0, 180, 0, 15)
                        bw.AutoButtonColor = false
                        bw.Image = "rbxassetid://3887014957"
                        bw.ScaleType = Enum.ScaleType.Tile
                        bw.TileSize = A(0, 10, 0, 10)
                        bw.ZIndex = 3
                        bx.Name = "Transcolor"
                        bx.Parent = bw
                        bx.BackgroundColor3 = n(255, 255, 255)
                        bx.BackgroundTransparency = 1.000
                        bx.Size = A(1, 0, 1, 0)
                        bx.Image = "rbxassetid://3887017050"
                        bx.ImageColor3 = n(255, 0, 4)
                        bx.ZIndex = 3
                        by.Name = "Transdrag"
                        by.Parent = bx
                        by.BackgroundColor3 = n(255, 255, 255)
                        by.BorderColor3 = n(27, 27, 35)
                        by.Position = A(0, -1, 0, 0)
                        by.Size = A(0, 2, 1, 0)
                        by.ZIndex = 3
                        bh.MouseButton1Down:Connect(
                            function()
                                ad.Visible = not ad.Visible
                            end
                        )
                        local bn = false
                        local bo = false
                        bh.MouseEnter:Connect(
                            function()
                                bn = true
                            end
                        )
                        bh.MouseLeave:Connect(
                            function()
                                bn = false
                            end
                        )
                        ad.MouseEnter:Connect(
                            function()
                                bo = true
                            end
                        )
                        ad.MouseLeave:Connect(
                            function()
                                bo = false
                            end
                        )
                        be = p(bl.AbsolutePosition.Y - bk.AbsolutePosition.Y, 0, bk.AbsoluteSize.Y) / bk.AbsoluteSize.Y
                        bf =
                            1 -
                            p(bj.AbsolutePosition.X - bi.AbsolutePosition.X, 0, bi.AbsoluteSize.X) / bi.AbsoluteSize.X
                        bg =
                            1 -
                            p(bj.AbsolutePosition.Y - bi.AbsolutePosition.Y, 0, bi.AbsoluteSize.Y) / bi.AbsoluteSize.Y
                        if aN.default.Color ~= nil then
                            be, bf, bg = aN.default.Color:ToHSV()
                            be = p(be, 0, 1)
                            bf = p(bf, 0, 1)
                            bg = p(bg, 0, 1)
                            bj.Position = A(1 - bf, 0, 1 - bg, 0)
                            bi.ImageColor3 = o(be, 1, 1)
                            bx.ImageColor3 = o(be, 1, 1)
                            bh.BackgroundColor3 = o(be, bf, bg)
                            bl.Position = A(0, 0, 1 - be, -1)
                        end
                        if aN.default.Transparency ~= nil then
                            by.Position = A(aN.default.Transparency, -1, 0, 0)
                        end
                        local bp = a9:GetMouse()
                        game:GetService("UserInputService").InputBegan:Connect(
                            function(ao)
                                if
                                    ao.UserInputType == Enum.UserInputType.MouseButton1 or
                                        ao.UserInputType == Enum.UserInputType.MouseButton2
                                 then
                                    if not dragging and not bn and not bo then
                                        ad.Visible = false
                                    end
                                end
                            end
                        )
                        local function bq()
                            local br = p(bp.X - bi.AbsolutePosition.X, 0, bi.AbsoluteSize.X) / bi.AbsoluteSize.X
                            local bs = p(bp.Y - bi.AbsolutePosition.Y, 0, bi.AbsoluteSize.Y) / bi.AbsoluteSize.Y
                            bj.Position = A(br, 0, bs, 0)
                            bf = 1 - br
                            bg = 1 - bs
                            bi.ImageColor3 = o(be, 1, 1)
                            bh.BackgroundColor3 = o(be, bf, bg)
                            bx.ImageColor3 = o(be, 1, 1)
                            values[as][aA][aJ][ah] = aP.value
                            aP.value.Color = o(be, bf, bg)
                            aO(aP.value)
                        end
                        local function bt()
                            local bu = p(bp.Y - bk.AbsolutePosition.Y, 0, 148)
                            bl.Position = A(0, 0, 0, bu)
                            hue = bu / 148
                            be = 1 - hue
                            bi.ImageColor3 = o(be, 1, 1)
                            bx.ImageColor3 = o(be, 1, 1)
                            bh.BackgroundColor3 = o(be, bf, bg)
                            values[as][aA][aJ][ah] = aP.value
                            aP.value.Color = o(be, bf, bg)
                            aO(aP.value)
                        end
                        local function bz()
                            local bA = p(bp.X - bw.AbsolutePosition.X, 0, 178)
                            by.Position = A(0, bA, 0, 0)
                            aP.value.Transparency = bA / 178
                            values[as][aA][aJ][ah] = aP.value
                            aO(aP.value)
                        end
                        bw.MouseButton1Down:Connect(
                            function()
                                bz()
                                moveconnection =
                                    bp.Move:Connect(
                                    function()
                                        bz()
                                    end
                                )
                                releaseconnection =
                                    game:GetService("UserInputService").InputEnded:Connect(
                                    function(aa)
                                        if aa.UserInputType == Enum.UserInputType.MouseButton1 then
                                            bz()
                                            moveconnection:Disconnect()
                                            releaseconnection:Disconnect()
                                        end
                                    end
                                )
                            end
                        )
                        bi.MouseButton1Down:Connect(
                            function()
                                bq()
                                moveconnection =
                                    bp.Move:Connect(
                                    function()
                                        bq()
                                    end
                                )
                                releaseconnection =
                                    game:GetService("UserInputService").InputEnded:Connect(
                                    function(aa)
                                        if aa.UserInputType == Enum.UserInputType.MouseButton1 then
                                            bq()
                                            moveconnection:Disconnect()
                                            releaseconnection:Disconnect()
                                        end
                                    end
                                )
                            end
                        )
                        bk.MouseButton1Down:Connect(
                            function()
                                bt()
                                moveconnection =
                                    bp.Move:Connect(
                                    function()
                                        bt()
                                    end
                                )
                                releaseconnection =
                                    game:GetService("UserInputService").InputEnded:Connect(
                                    function(aa)
                                        if aa.UserInputType == Enum.UserInputType.MouseButton1 then
                                            bt()
                                            moveconnection:Disconnect()
                                            releaseconnection:Disconnect()
                                        end
                                    end
                                )
                            end
                        )
                        aR.MouseButton1Down:Connect(
                            function()
                                aP.value.Toggle = not aP.value.Toggle
                                an()
                                values[as][aA][aJ][ah] = aP.value
                                aO(aP.value)
                            end
                        )
                        if aN.default then
                            an()
                        end
                        values[as][aA][aJ][ah] = aP.value
                        function aP:SetValue(bd)
                            aP.value = bd
                            local bv = m(bd.Color.R, bd.Color.G, bd.Color.B)
                            be, bf, bg = bv:ToHSV()
                            be = p(be, 0, 1)
                            bf = p(bf, 0, 1)
                            bg = p(bg, 0, 1)
                            bj.Position = A(1 - bf, 0, 1 - bg, 0)
                            bi.ImageColor3 = o(be, 1, 1)
                            bh.BackgroundColor3 = o(be, bf, bg)
                            an()
                            bl.Position = A(0, 0, 1 - be, -1)
                        end
                    elseif type == "Dropdown" then
                        aK = aK + A(0, 0, 0, 39)
                        aP.value = {Dropdown = aN.options[1]}
                        local aQ = l("Frame")
                        local aR = l("TextButton")
                        local a1 = l("TextLabel")
                        local aS = l("ScrollingFrame")
                        local aT = l("TextButton")
                        local aU = l("TextLabel")
                        local a3 = l("UIListLayout")
                        local ae = l("ImageLabel")
                        local aV = l("TextLabel")
                        aQ.Name = "Dropdown"
                        aQ.Parent = aL
                        aQ.BackgroundColor3 = n(255, 255, 255)
                        aQ.BackgroundTransparency = 1.000
                        aQ.Position = A(0, 0, 0.255102038, 0)
                        aQ.Size = A(1, 0, 0, 39)
                        aR.Name = "Button"
                        aR.Parent = aQ
                        aR.BackgroundColor3 = n(0, 0, 0)
                        aR.BorderColor3 = n(27, 27, 35)
                        aR.Position = A(0, 30, 0, 16)
                        aR.Size = A(0, 175, 0, 17)
                        aR.AutoButtonColor = false
                        aR.Font = Enum.Font.SourceSans
                        aR.Text = ""
                        aR.TextColor3 = n(0, 0, 0)
                        aR.TextSize = 14.000
                        a1.Parent = aR
                        a1.BackgroundColor3 = n(255, 255, 255)
                        a1.BackgroundTransparency = 1.000
                        a1.BorderColor3 = n(27, 42, 53)
                        a1.Position = A(0, 5, 0, 0)
                        a1.Size = A(-0.21714285, 208, 1, 0)
                        a1.Font = Enum.Font.SourceSansSemibold
                        a1.Text = aP.value.Dropdown
                        a1.TextColor3 = n(200, 200, 200)
                        a1.TextSize = 14.000
                        a1.TextXAlignment = Enum.TextXAlignment.Left
                        local aW = a1
                        aS.Name = "Drop"
                        aS.Parent = aR
                        aS.Active = true
                        aS.BackgroundColor3 = n(0, 0, 0)
                        aS.BorderColor3 = n(27, 27, 35)
                        aS.Position = A(0, 0, 1, 1)
                        aS.Size = A(1, 0, 0, 20)
                        aS.Visible = false
                        aS.BottomImage = "http://www.roblox.com/asset/?id=6724808282"
                        aS.CanvasSize = A(1, 1, 1, 1)
                        aS.ScrollBarThickness = 0
                        aS.MidImage = "http://www.roblox.com/asset/?id=6724808282"
                        aS.TopImage = "http://www.roblox.com/asset/?id=6724808282"
                        aS.AutomaticCanvasSize = "Y"
                        aS.ZIndex = 5
                        aS.ScrollBarImageColor3 = L
                        a3.Parent = aS
                        a3.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        a3.SortOrder = Enum.SortOrder.LayoutOrder
                        local aX = #aN.options
                        if aX > 5 then
                            aS.Size = A(1, 0, 0, 85)
                        else
                            aS.Size = A(1, 0, 0, 17 * aX)
                        end
                        aS.CanvasSize = A(1, 0, 0, 17 * aX)
                        local aq = true
                        for T, v in ipairs(aN.options) do
                            do
                                local aR = l("TextButton")
                                local a1 = l("TextLabel")
                                aR.Name = v
                                aR.Parent = aS
                                aR.BackgroundColor3 = n(0, 0, 0)
                                aR.BorderColor3 = n(27, 27, 35)
                                aR.Position = A(0, 30, 0, 16)
                                aR.Size = A(0, 175, 0, 17)
                                aR.AutoButtonColor = false
                                aR.Font = Enum.Font.SourceSans
                                aR.Text = ""
                                aR.TextColor3 = n(0, 0, 0)
                                aR.TextSize = 14.000
                                aR.BorderSizePixel = 0
                                aR.ZIndex = 6
                                a1.Parent = aR
                                a1.BackgroundColor3 = n(255, 255, 255)
                                a1.BackgroundTransparency = 1.000
                                a1.BorderColor3 = n(27, 42, 53)
                                a1.Position = A(0, 5, 0, -1)
                                a1.Size = A(-0.21714285, 208, 1, 0)
                                a1.Font = Enum.Font.SourceSansSemibold
                                a1.Text = v
                                a1.TextColor3 = n(200, 200, 200)
                                a1.TextSize = 14.000
                                a1.TextXAlignment = Enum.TextXAlignment.Left
                                a1.ZIndex = 6
                                aR.MouseButton1Down:Connect(
                                    function()
                                        aS.Visible = false
                                        aP.value.Dropdown = v
                                        aW.Text = v
                                        values[as][aA][aJ][ah] = aP.value
                                        aO(aP.value)
                                        aS.CanvasPosition = i(0, 0)
                                    end
                                )
                                aR.MouseEnter:Connect(
                                    function()
                                        a:Tween(
                                            a1,
                                            TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                            {TextColor3 = n(255, 255, 255)}
                                        )
                                    end
                                )
                                aR.MouseLeave:Connect(
                                    function()
                                        a:Tween(
                                            a1,
                                            TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                            {TextColor3 = n(200, 200, 200)}
                                        )
                                    end
                                )
                                aq = false
                            end
                        end
                        function aP:SetValue(b0)
                            aP.value = b0
                            aW.Text = b0.Dropdown
                            values[as][aA][aJ][ah] = aP.value
                            aO(b0)
                        end
                        ae.Parent = aR
                        ae.BackgroundColor3 = n(255, 255, 255)
                        ae.BackgroundTransparency = 1.000
                        ae.Position = A(0, 165, 0, 6)
                        ae.Size = A(0, 6, 0, 4)
                        ae.Image = "http://www.roblox.com/asset/?id=6724771531"
                        aV.Parent = aQ
                        aV.BackgroundColor3 = n(255, 255, 255)
                        aV.BackgroundTransparency = 1.000
                        aV.Position = A(0, 32, 0, -1)
                        aV.Size = A(0.111913361, 208, 0.382215232, 0)
                        aV.Font = Enum.Font.SourceSansSemibold
                        aV.Text = ah
                        aV.TextColor3 = n(200, 200, 200)
                        aV.TextSize = 14.000
                        aV.TextXAlignment = Enum.TextXAlignment.Left
                        aR.MouseButton1Down:Connect(
                            function()
                                aS.Visible = not aS.Visible
                                if not aS.Visible then
                                    aS.CanvasPosition = i(0, 0)
                                end
                            end
                        )
                        local b1 = false
                        local b2 = false
                        aS.MouseEnter:Connect(
                            function()
                                b1 = true
                            end
                        )
                        aS.MouseLeave:Connect(
                            function()
                                b1 = false
                            end
                        )
                        aR.MouseEnter:Connect(
                            function()
                                b2 = true
                            end
                        )
                        aR.MouseLeave:Connect(
                            function()
                                b2 = false
                            end
                        )
                        game:GetService("UserInputService").InputBegan:Connect(
                            function(ao)
                                if
                                    ao.UserInputType == Enum.UserInputType.MouseButton1 or
                                        ao.UserInputType == Enum.UserInputType.MouseButton2
                                 then
                                    if aS.Visible == true and not b1 and not b2 then
                                        aS.Visible = false
                                        aS.CanvasPosition = i(0, 0)
                                    end
                                end
                            end
                        )
                        values[as][aA][aJ][ah] = aP.value
                    elseif type == "Slider" then
                        aK = aK + A(0, 0, 0, 25)
                        local bB = l("Frame")
                        local a1 = l("TextLabel")
                        local aR = l("TextButton")
                        local ad = l("Frame")
                        local bC = l("UIGradient")
                        local bD = l("TextLabel")
                        bB.Name = "Slider"
                        bB.Parent = aL
                        bB.BackgroundColor3 = n(255, 255, 255)
                        bB.BackgroundTransparency = 1.000
                        bB.Position = A(0, 0, 0.653061211, 0)
                        bB.Size = A(1, 0, 0, 25)
                        a1.Parent = bB
                        a1.BackgroundColor3 = n(255, 255, 255)
                        a1.BackgroundTransparency = 1.000
                        a1.Position = A(0, 32, 0, -2)
                        a1.Size = A(0, 100, 0, 15)
                        a1.Font = Enum.Font.SourceSansSemibold
                        a1.Text = ah
                        a1.TextColor3 = n(200, 200, 200)
                        a1.TextSize = 14.000
                        a1.TextXAlignment = Enum.TextXAlignment.Left
                        aR.Name = "Button"
                        aR.Parent = bB
                        aR.BackgroundColor3 = n(0, 0, 0)
                        aR.BorderColor3 = n(27, 27, 35)
                        aR.Position = A(0, 30, 0, 15)
                        aR.Size = A(0, 175, 0, 5)
                        aR.AutoButtonColor = false
                        aR.Font = Enum.Font.SourceSans
                        aR.Text = ""
                        aR.TextColor3 = n(0, 0, 0)
                        aR.TextSize = 14.000
                        ad.Parent = aR
                        ad.BackgroundColor3 = n(255, 255, 255)
                        ad.BorderSizePixel = 0
                        ad.Size = A(0.5, 0, 1, 0)
                        bC.Color = ColorSequence.new {ColorSequenceKeypoint.new(0, L), ColorSequenceKeypoint.new(1, L)}
                        bC.Rotation = 90
                        bC.Parent = ad
                        bD.Name = "Value"
                        bD.Parent = bB
                        bD.BackgroundColor3 = n(255, 255, 255)
                        bD.BackgroundTransparency = 1.000
                        bD.Position = A(0, 150, 0, -1)
                        bD.Size = A(0, 55, 0, 15)
                        bD.Font = Enum.Font.SourceSansSemibold
                        bD.Text = "50"
                        bD.TextColor3 = n(200, 200, 200)
                        bD.TextSize = 14.000
                        bD.TextXAlignment = Enum.TextXAlignment.Right
                        local bE, bF, bG = aN.min or 0, aN.max or 100, aN.default or 0
                        aP.value = {Slider = bG}
                        function aP:SetValue(bd)
                            aP.value = bd
                            local X
                            if bE > 0 then
                                X = (aP.value.Slider - bE) / (bF - bE)
                            else
                                X = (aP.value.Slider - bE) / (bF - bE)
                            end
                            bD.Text = aP.value.Slider
                            ad.Size = A(X, 0, 1, 0)
                            values[as][aA][aJ][ah] = aP.value
                            aO(bd)
                        end
                        local X
                        if bE > 0 then
                            X = (aP.value.Slider - bE) / (bF - bE)
                        else
                            X = (aP.value.Slider - bE) / (bF - bE)
                        end
                        bD.Text = aP.value.Slider
                        ad.Size = A(X, 0, 1, 0)
                        values[as][aA][aJ][ah] = aP.value
                        local bH = game:GetService("UserInputService")
                        local bp = game.Players.LocalPlayer:GetMouse()
                        local b0
                        aR.MouseButton1Down:Connect(
                            function()
                                ad.Size = A(0, p(bp.X - ad.AbsolutePosition.X, 0, 175), 0, 5)
                                b0 = r((tonumber(bF) - tonumber(bE)) / 175 * ad.AbsoluteSize.X + tonumber(bE)) or 0
                                bD.Text = b0
                                aP.value.Slider = b0
                                values[as][aA][aJ][ah] = aP.value
                                aO(aP.value)
                                moveconnection =
                                    bp.Move:Connect(
                                    function()
                                        ad.Size = A(0, p(bp.X - ad.AbsolutePosition.X, 0, 175), 0, 5)
                                        b0 = r((tonumber(bF) - tonumber(bE)) / 175 * ad.AbsoluteSize.X + tonumber(bE))
                                        bD.Text = b0
                                        aP.value.Slider = b0
                                        values[as][aA][aJ][ah] = aP.value
                                        aO(aP.value)
                                    end
                                )
                                releaseconnection =
                                    bH.InputEnded:Connect(
                                    function(aa)
                                        if aa.UserInputType == Enum.UserInputType.MouseButton1 then
                                            ad.Size = A(0, p(bp.X - ad.AbsolutePosition.X, 0, 175), 0, 5)
                                            b0 =
                                                r(
                                                (tonumber(bF) - tonumber(bE)) / 175 * ad.AbsoluteSize.X + tonumber(bE)
                                            )
                                            values[as][aA][aJ][ah] = aP.value
                                            aO(aP.value)
                                            moveconnection:Disconnect()
                                            releaseconnection:Disconnect()
                                        end
                                    end
                                )
                            end
                        )
                    elseif type == "Button" then
                        aK = aK + A(0, 0, 0, 24)
                        local aR = l("Frame")
                        local aT = l("TextButton")
                        local a1 = l("TextLabel")
                        aR.Name = "Button"
                        aR.Parent = aL
                        aR.BackgroundColor3 = n(255, 255, 255)
                        aR.BackgroundTransparency = 1.000
                        aR.Position = A(0, 0, 0.236059487, 0)
                        aR.Size = A(1, 0, 0, 24)
                        aT.Name = "Button"
                        aT.Parent = aR
                        aT.BackgroundColor3 = n(0, 0, 0)
                        aT.BorderColor3 = n(27, 27, 35)
                        aT.Position = A(0, 30, 0.5, -9)
                        aT.Size = A(0, 175, 0, 18)
                        aT.AutoButtonColor = false
                        aT.Font = Enum.Font.SourceSans
                        aT.Text = ""
                        aT.TextColor3 = n(0, 0, 0)
                        aT.TextSize = 14.000
                        a1.Parent = aT
                        a1.BackgroundColor3 = n(255, 255, 255)
                        a1.BackgroundTransparency = 1.000
                        a1.BorderColor3 = n(27, 42, 53)
                        a1.Size = A(1, 0, 1, 0)
                        a1.Font = Enum.Font.SourceSansSemibold
                        a1.Text = ah
                        a1.TextColor3 = n(200, 200, 200)
                        a1.TextSize = 14.000
                        function aP:SetValue()
                        end
                        aT.MouseButton1Down:Connect(
                            function()
                                a1.TextColor3 = L
                                a:Tween(
                                    a1,
                                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {TextColor3 = n(200, 200, 200)}
                                )
                                aO()
                            end
                        )
                        aT.MouseEnter:Connect(
                            function()
                                a:Tween(
                                    a1,
                                    TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {TextColor3 = n(255, 255, 255)}
                                )
                            end
                        )
                        aT.MouseLeave:Connect(
                            function()
                                a:Tween(
                                    a1,
                                    TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {TextColor3 = n(200, 200, 200)}
                                )
                            end
                        )
                    end
                    e:Connect(
                        function(S)
                            local bI = a:ConfigFix(S)
                            if bI[as][aA][aJ][ah] ~= nil then
                                aP:SetValue(bI[as][aA][aJ][ah])
                            end
                        end
                    )
                    return aP
                end
                if aG then
                    coroutine.wrap(
                        function()
                            game:GetService("RunService").RenderStepped:Wait()
                            aC.Size = aK
                        end
                    )()
                    aH = ah
                    au.TextColor3 = n(255, 255, 255)
                    aL.Visible = true
                    aG = false
                end
                return aI
            end
            return aB
        end
        function at:Sector(ah, az)
            local aA = ah
            local bJ = {}
            values[as][ah] = {}
            local aC = l("Frame")
            local aD = l("TextLabel")
            local aE = l("Frame")
            local a3 = l("UIListLayout")
            aC.Name = "Section"
            aC.Parent = av[az]
            aC.BackgroundColor3 = n(0, 0, 0)
            aC.BorderColor3 = n(0, 0, 0)
            aC.BorderSizePixel = 0
            aC.Position = A(0.00358422939, 0, 0, 0)
            aC.Size = A(1, 0, 0, 22)
            aD.Name = "SectionText"
            aD.Parent = aC
            aD.BackgroundColor3 = n(255, 255, 255)
            aD.BackgroundTransparency = 1.000
            aD.Position = A(0, 7, 0, -12)
            aD.Size = A(0, 270, 0, 19)
            aD.ZIndex = 2
            aD.Font = Enum.Font.SourceSansSemibold
            aD.Text = ah
            aD.TextColor3 = n(255, 255, 255)
            aD.TextSize = 15.000
            aD.TextXAlignment = Enum.TextXAlignment.Left
            aE.Name = "Inner"
            aE.Parent = aC
            aE.BackgroundColor3 = n(0, 0, 0)
            aE.BorderColor3 = n(0, 0, 0)
            aE.BorderSizePixel = 0
            aE.Position = A(0, 1, 0, 1)
            aE.Size = A(1, -2, 1, -2)
            local aM = l("UIPadding")
            aM.Parent = aE
            aM.PaddingTop = UDim.new(0, 10)
            a3.Parent = aE
            a3.HorizontalAlignment = Enum.HorizontalAlignment.Center
            a3.SortOrder = Enum.SortOrder.LayoutOrder
            a3.Padding = UDim.new(0, 1)
            function bJ:Element(type, ah, aN, aO)
                local aP = {}
                aN = aN or {}
                aO = aO or function()
                    end
                values[as][aA][ah] = {}
                if type == "ScrollDrop" then
                    aC.Size = aC.Size + A(0, 0, 0, 39)
                    aP.value = {Scroll = {}, Dropdown = ""}
                    for T, v in pairs(aN.options) do
                        aP.value.Scroll[T] = v[1]
                    end
                    local bK = {}
                    if aN.alphabet then
                        local Q = {}
                        for T, v in pairs(aN.options) do
                            H(Q, T)
                        end
                        K(
                            Q,
                            function(X, bL)
                                return X < bL
                            end
                        )
                        bK = Q
                    else
                        for T, v in pairs(aN.options) do
                            H(bK, T)
                        end
                    end
                    local aQ = l("Frame")
                    local aR = l("TextButton")
                    local a1 = l("TextLabel")
                    local aS = l("ScrollingFrame")
                    local aT = l("TextButton")
                    local aU = l("TextLabel")
                    local a3 = l("UIListLayout")
                    local ae = l("ImageLabel")
                    local aV = l("TextLabel")
                    aQ.Name = "Dropdown"
                    aQ.Parent = aE
                    aQ.BackgroundColor3 = n(255, 255, 255)
                    aQ.BackgroundTransparency = 1.000
                    aQ.Position = A(0, 0, 0, 0)
                    aQ.Size = A(1, 0, 0, 39)
                    aR.Name = "Button"
                    aR.Parent = aQ
                    aR.BackgroundColor3 = n(0, 0, 0)
                    aR.BorderColor3 = n(27, 27, 35)
                    aR.Position = A(0, 30, 0, 16)
                    aR.Size = A(0, 175, 0, 17)
                    aR.AutoButtonColor = false
                    aR.Font = Enum.Font.SourceSans
                    aR.Text = ""
                    aR.TextColor3 = n(0, 0, 0)
                    aR.TextSize = 14.000
                    local a1 = l("TextLabel")
                    a1.Parent = aR
                    a1.BackgroundColor3 = n(255, 255, 255)
                    a1.BackgroundTransparency = 1.000
                    a1.BorderColor3 = n(27, 42, 53)
                    a1.Position = A(0, 5, 0, 0)
                    a1.Size = A(-0.21714285, 208, 1, 0)
                    a1.Font = Enum.Font.SourceSansSemibold
                    a1.Text = "lol"
                    a1.TextColor3 = n(200, 200, 200)
                    a1.TextSize = 14.000
                    a1.TextXAlignment = Enum.TextXAlignment.Left
                    local aW = a1
                    aS.Name = "Drop"
                    aS.Parent = aR
                    aS.Active = true
                    aS.BackgroundColor3 = n(0, 0, 0)
                    aS.BorderColor3 = n(27, 27, 35)
                    aS.Position = A(0, 0, 1, 1)
                    aS.Size = A(1, 0, 0, 20)
                    aS.Visible = false
                    aS.BottomImage = "http://www.roblox.com/asset/?id=6724808282"
                    aS.CanvasSize = A(1, 1, 1, 1)
                    aS.ScrollBarThickness = 0
                    aS.TopImage = "http://www.roblox.com/asset/?id=6724808282"
                    aS.MidImage = "http://www.roblox.com/asset/?id=6724808282"
                    aS.AutomaticCanvasSize = "Y"
                    aS.ZIndex = 5
                    aS.ScrollBarImageColor3 = L
                    a3.Parent = aS
                    a3.HorizontalAlignment = Enum.HorizontalAlignment.Center
                    a3.SortOrder = Enum.SortOrder.LayoutOrder
                    local bM = aN.Amount or 6
                    aC.Size = aC.Size + A(0, 0, 0, bM * 16 + 8)
                    local aX = #bK
                    if aX > 5 then
                        aS.Size = A(1, 0, 0, 85)
                    else
                        aS.Size = A(1, 0, 0, 17 * aX)
                    end
                    local aq = true
                    for T, v in ipairs(bK) do
                        do
                            local bN = v
                            local bO = l("Frame")
                            local bP = aN.options[v]
                            local aR = l("TextButton")
                            local a1 = l("TextLabel")
                            aR.Name = v
                            aR.Parent = aS
                            aR.BackgroundColor3 = n(0, 0, 0)
                            aR.BorderColor3 = n(27, 27, 35)
                            aR.Position = A(0, 30, 0, 16)
                            aR.Size = A(0, 175, 0, 17)
                            aR.AutoButtonColor = false
                            aR.Font = Enum.Font.SourceSans
                            aR.Text = ""
                            aR.TextColor3 = n(0, 0, 0)
                            aR.TextSize = 14.000
                            aR.BorderSizePixel = 0
                            aR.ZIndex = 6
                            a1.Parent = aR
                            a1.BackgroundColor3 = n(255, 255, 255)
                            a1.BackgroundTransparency = 1.000
                            a1.BorderColor3 = n(27, 42, 53)
                            a1.Position = A(0, 5, 0, -1)
                            a1.Size = A(-0.21714285, 208, 1, 0)
                            a1.Font = Enum.Font.SourceSansSemibold
                            a1.Text = v
                            a1.TextColor3 = n(200, 200, 200)
                            a1.TextSize = 14.000
                            a1.TextXAlignment = Enum.TextXAlignment.Left
                            a1.ZIndex = 6
                            aR.MouseButton1Down:Connect(
                                function()
                                    aS.Visible = false
                                    aS.CanvasPosition = i(0, 0)
                                    aW.Text = v
                                    for T, v in pairs(bO.Parent:GetChildren()) do
                                        if v:IsA("Frame") then
                                            v.Visible = false
                                        end
                                    end
                                    aP.value.Dropdown = v
                                    bO.Visible = true
                                    aO(aP.value)
                                end
                            )
                            aR.MouseEnter:Connect(
                                function()
                                    a:Tween(
                                        a1,
                                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                        {TextColor3 = n(255, 255, 255)}
                                    )
                                end
                            )
                            aR.MouseLeave:Connect(
                                function()
                                    a:Tween(
                                        a1,
                                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                        {TextColor3 = n(200, 200, 200)}
                                    )
                                end
                            )
                            if aq then
                                aW.Text = v
                                aP.value.Dropdown = v
                            end
                            local ad = l("ScrollingFrame")
                            local a3 = l("UIListLayout")
                            bO.Name = "Scroll"
                            bO.Parent = aQ
                            bO.BackgroundColor3 = n(255, 255, 255)
                            bO.BackgroundTransparency = 1.000
                            bO.Position = A(0, 0, 0, 0)
                            bO.Size = A(1, 0, 0, bM * 16 + 8)
                            bO.Visible = aq
                            bO.Name = v
                            ad.Name = "Frame"
                            ad.Parent = bO
                            ad.Active = true
                            ad.BackgroundColor3 = n(0, 0, 0)
                            ad.BorderColor3 = n(27, 27, 35)
                            ad.Position = A(0, 30, 0, 40)
                            ad.Size = A(0, 175, 0, 16 * bM)
                            ad.BottomImage = "http://www.roblox.com/asset/?id=6724808282"
                            ad.CanvasSize = A(1, 1, 1, 1)
                            ad.MidImage = "http://www.roblox.com/asset/?id=6724808282"
                            ad.ScrollBarThickness = 0
                            ad.TopImage = "http://www.roblox.com/asset/?id=6724808282"
                            ad.AutomaticCanvasSize = "Y"
                            ad.ScrollBarImageColor3 = L
                            a3.Parent = ad
                            a3.HorizontalAlignment = Enum.HorizontalAlignment.Center
                            a3.SortOrder = Enum.SortOrder.LayoutOrder
                            local bQ = true
                            for T, v in ipairs(bP) do
                                local aR = l("TextButton")
                                local a1 = l("TextLabel")
                                aR.Name = v
                                aR.Parent = ad
                                aR.BackgroundColor3 = n(0, 0, 0)
                                aR.BorderColor3 = n(27, 27, 35)
                                aR.BorderSizePixel = 0
                                aR.Position = A(0, 30, 0, 16)
                                aR.Size = A(1, 0, 0, 16)
                                aR.AutoButtonColor = false
                                aR.Font = Enum.Font.SourceSans
                                aR.Text = ""
                                aR.TextColor3 = n(0, 0, 0)
                                aR.TextSize = 14.000
                                a1.Parent = aR
                                a1.BackgroundColor3 = n(255, 255, 255)
                                a1.BackgroundTransparency = 1.000
                                a1.BorderColor3 = n(27, 42, 53)
                                a1.Position = A(0, 4, 0, -1)
                                a1.Size = A(1, 1, 1, 1)
                                a1.Font = Enum.Font.SourceSansSemibold
                                a1.Text = v
                                a1.TextColor3 = n(200, 200, 200)
                                a1.TextSize = 14.000
                                a1.TextXAlignment = Enum.TextXAlignment.Left
                                if bQ then
                                    bQ = false
                                    a1.TextColor3 = L
                                end
                                aR.MouseButton1Down:Connect(
                                    function()
                                        for T, v in pairs(ad:GetChildren()) do
                                            if v:IsA("TextButton") then
                                                a:Tween(
                                                    v.TextLabel,
                                                    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                                    {TextColor3 = n(200, 200, 200)}
                                                )
                                            end
                                        end
                                        a:Tween(
                                            a1,
                                            TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                            {TextColor3 = n(255, 255, 255)}
                                        )
                                        aP.value.Scroll[bN] = v
                                        values[as][aA][ah] = aP.value
                                        aO(aP.value)
                                    end
                                )
                                aR.MouseEnter:Connect(
                                    function()
                                        if aP.value.Scroll[bN] ~= v then
                                            a:Tween(
                                                a1,
                                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                                {TextColor3 = n(255, 255, 255)}
                                            )
                                        end
                                    end
                                )
                                aR.MouseLeave:Connect(
                                    function()
                                        if aP.value.Scroll[bN] ~= v then
                                            a:Tween(
                                                a1,
                                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                                {TextColor3 = n(200, 200, 200)}
                                            )
                                        end
                                    end
                                )
                            end
                            aq = false
                        end
                    end
                    ae.Parent = aR
                    ae.BackgroundColor3 = n(255, 255, 255)
                    ae.BackgroundTransparency = 1.000
                    ae.Position = A(0, 165, 0, 6)
                    ae.Size = A(0, 6, 0, 4)
                    ae.Image = "http://www.roblox.com/asset/?id=6724771531"
                    aV.Parent = aQ
                    aV.BackgroundColor3 = n(255, 255, 255)
                    aV.BackgroundTransparency = 1.000
                    aV.Position = A(0, 32, 0, -1)
                    aV.Size = A(0.111913361, 208, 0.382215232, 0)
                    aV.Font = Enum.Font.SourceSansSemibold
                    aV.Text = ah
                    aV.TextColor3 = n(200, 200, 200)
                    aV.TextSize = 14.000
                    aV.TextXAlignment = Enum.TextXAlignment.Left
                    aR.MouseButton1Down:Connect(
                        function()
                            aS.Visible = not aS.Visible
                            if not aS.Visible then
                                aS.CanvasPosition = i(0, 0)
                            end
                        end
                    )
                    local b1 = false
                    local b2 = false
                    aS.MouseEnter:Connect(
                        function()
                            b1 = true
                        end
                    )
                    aS.MouseLeave:Connect(
                        function()
                            b1 = false
                        end
                    )
                    aR.MouseEnter:Connect(
                        function()
                            b2 = true
                        end
                    )
                    aR.MouseLeave:Connect(
                        function()
                            b2 = false
                        end
                    )
                    game:GetService("UserInputService").InputBegan:Connect(
                        function(ao)
                            if
                                ao.UserInputType == Enum.UserInputType.MouseButton1 or
                                    ao.UserInputType == Enum.UserInputType.MouseButton2
                             then
                                if aS.Visible == true and not b1 and not b2 then
                                    aS.Visible = false
                                    aS.CanvasPosition = i(0, 0)
                                end
                            end
                        end
                    )
                    function aP:SetValue(N)
                        aP.value = N
                        aW.Text = N.Dropdown
                        values[as][aA][ah] = aP.value
                        for T, v in pairs(aQ:GetChildren()) do
                            if v:IsA("Frame") then
                                if v.Name == aP.value.Dropdown then
                                    v.Visible = true
                                else
                                    v.Visible = false
                                end
                                for b9, bR in pairs(v.Frame:GetChildren()) do
                                    if bR:IsA("TextButton") then
                                        bR.TextLabel.TextColor3 = n(200, 200, 200)
                                        if bR.Name == aP.value.Scroll[v.Name] then
                                            bR.TextLabel.TextColor3 = L
                                        end
                                    end
                                end
                            end
                        end
                    end
                    if aN.default then
                        aP:SetValue(aN.default)
                    end
                    values[as][aA][ah] = aP.value
                elseif type == "Scroll" then
                    local bM = aN.Amount or 6
                    aC.Size = aC.Size + A(0, 0, 0, bM * 16 + 8)
                    if aN.alphabet then
                        K(
                            aN.options,
                            function(X, bL)
                                return X < bL
                            end
                        )
                    end
                    aP.value = {Scroll = aN.default and aN.default.Scroll or aN.options[1]}
                    local bO = l("Frame")
                    local ad = l("ScrollingFrame")
                    local a3 = l("UIListLayout")
                    bO.Name = "Scroll"
                    bO.Parent = aE
                    bO.BackgroundColor3 = n(255, 255, 255)
                    bO.BackgroundTransparency = 1.000
                    bO.Position = A(0, 0, 00, 0)
                    bO.Size = A(1, 0, 0, bM * 16 + 8)
                    ad.Name = "Frame"
                    ad.Parent = bO
                    ad.Active = true
                    ad.BackgroundColor3 = n(0, 0, 0)
                    ad.BorderColor3 = n(27, 27, 35)
                    ad.Position = A(0, 30, 0, 0)
                    ad.Size = A(0, 175, 0, 16 * bM)
                    ad.BottomImage = "http://www.roblox.com/asset/?id=6724808282"
                    ad.CanvasSize = A(1, 1, 1, 1)
                    ad.MidImage = "http://www.roblox.com/asset/?id=6724808282"
                    ad.ScrollBarThickness = 0
                    ad.TopImage = "http://www.roblox.com/asset/?id=6724808282"
                    ad.AutomaticCanvasSize = "Y"
                    ad.ScrollBarImageColor3 = L
                    a3.Parent = ad
                    a3.HorizontalAlignment = Enum.HorizontalAlignment.Center
                    a3.SortOrder = Enum.SortOrder.LayoutOrder
                    local aq = true
                    for T, v in ipairs(aN.options) do
                        local aR = l("TextButton")
                        local a1 = l("TextLabel")
                        aR.Name = v
                        aR.Parent = ad
                        aR.BackgroundColor3 = n(0, 0, 0)
                        aR.BorderColor3 = n(27, 27, 35)
                        aR.BorderSizePixel = 0
                        aR.Position = A(0, 30, 0, 16)
                        aR.Size = A(1, 0, 0, 16)
                        aR.AutoButtonColor = false
                        aR.Font = Enum.Font.SourceSans
                        aR.Text = ""
                        aR.TextColor3 = n(0, 0, 0)
                        aR.TextSize = 14.000
                        a1.Parent = aR
                        a1.BackgroundColor3 = n(255, 255, 255)
                        a1.BackgroundTransparency = 1.000
                        a1.BorderColor3 = n(27, 42, 53)
                        a1.Position = A(0, 4, 0, -1)
                        a1.Size = A(1, 1, 1, 1)
                        a1.Font = Enum.Font.SourceSansSemibold
                        a1.Text = v
                        a1.TextColor3 = n(200, 200, 200)
                        a1.TextSize = 14.000
                        a1.TextXAlignment = Enum.TextXAlignment.Left
                        if aq then
                            aq = false
                            a1.TextColor3 = L
                        end
                        aR.MouseButton1Down:Connect(
                            function()
                                for T, v in pairs(ad:GetChildren()) do
                                    if v:IsA("TextButton") then
                                        a:Tween(
                                            v.TextLabel,
                                            TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                            {TextColor3 = n(200, 200, 200)}
                                        )
                                    end
                                end
                                a:Tween(
                                    a1,
                                    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {TextColor3 = n(255, 255, 255)}
                                )
                                aP.value.Scroll = v
                                values[as][aA][ah] = aP.value
                                aO(aP.value)
                            end
                        )
                        aR.MouseEnter:Connect(
                            function()
                                if aP.value.Scroll ~= v then
                                    a:Tween(
                                        a1,
                                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                        {TextColor3 = n(255, 255, 255)}
                                    )
                                end
                            end
                        )
                        aR.MouseLeave:Connect(
                            function()
                                if aP.value.Scroll ~= v then
                                    a:Tween(
                                        a1,
                                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                        {TextColor3 = n(200, 200, 200)}
                                    )
                                end
                            end
                        )
                    end
                    function aP:SetValue(b0)
                        aP.value = b0
                        for T, v in pairs(ad:GetChildren()) do
                            if v:IsA("TextButton") then
                                a:Tween(
                                    v.TextLabel,
                                    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {TextColor3 = n(200, 200, 200)}
                                )
                            end
                        end
                        a:Tween(
                            ad[aP.value.Scroll].TextLabel,
                            TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {TextColor3 = n(255, 255, 255)}
                        )
                        values[as][aA][ah] = aP.value
                        aO(aP.value)
                    end
                    values[as][aA][ah] = aP.value
                elseif type == "Jumbobox" then
                    aC.Size = aC.Size + A(0, 0, 0, 39)
                    aP.value = {Jumbobox = {}}
                    aN.options = aN.options or {}
                    local aQ = l("Frame")
                    local aR = l("TextButton")
                    local a1 = l("TextLabel")
                    local aS = l("ScrollingFrame")
                    local aT = l("TextButton")
                    local aU = l("TextLabel")
                    local a3 = l("UIListLayout")
                    local ae = l("ImageLabel")
                    local aV = l("TextLabel")
                    aQ.Name = "Dropdown"
                    aQ.Parent = aE
                    aQ.BackgroundColor3 = n(33, 35, 255)
                    aQ.BackgroundTransparency = 1.000
                    aQ.Position = A(0, 0, 0.255102038, 0)
                    aQ.Size = A(1, 0, 0, 39)
                    aR.Name = "Button"
                    aR.Parent = aQ
                    aR.BackgroundColor3 = n(0, 0, 0)
                    aR.BorderColor3 = n(27, 27, 35)
                    aR.Position = A(0, 30, 0, 16)
                    aR.Size = A(0, 175, 0, 17)
                    aR.AutoButtonColor = false
                    aR.Font = Enum.Font.SourceSans
                    aR.Text = ""
                    aR.TextColor3 = n(0, 0, 0)
                    aR.TextSize = 14.000
                    a1.Parent = aR
                    a1.BackgroundColor3 = n(255, 255, 255)
                    a1.BackgroundTransparency = 1.000
                    a1.BorderColor3 = n(27, 42, 53)
                    a1.Position = A(0, 5, 0, 0)
                    a1.Size = A(-0.21714285, 208, 1, 0)
                    a1.Font = Enum.Font.SourceSansSemibold
                    a1.Text = "..."
                    a1.TextColor3 = n(200, 200, 200)
                    a1.TextSize = 14.000
                    a1.TextXAlignment = Enum.TextXAlignment.Left
                    local aW = a1
                    aS.Name = "Drop"
                    aS.Parent = aR
                    aS.Active = true
                    aS.BackgroundColor3 = n(0, 0, 0)
                    aS.BorderColor3 = n(27, 27, 35)
                    aS.Position = A(0, 0, 1, 1)
                    aS.Size = A(1, 0, 0, 20)
                    aS.Visible = false
                    aS.BottomImage = "http://www.roblox.com/asset/?id=6724808282"
                    aS.CanvasSize = A(1, 1, 1, 1)
                    aS.ScrollBarThickness = 0
                    aS.TopImage = "http://www.roblox.com/asset/?id=6724808282"
                    aS.MidImage = "http://www.roblox.com/asset/?id=6724808282"
                    for T, v in pairs(aN.options) do
                        aS.CanvasSize = aS.CanvasSize + A(0, 0, 0, 17)
                    end
                    aS.ZIndex = 5
                    aS.ScrollBarImageColor3 = L
                    a3.Parent = aS
                    a3.HorizontalAlignment = Enum.HorizontalAlignment.Center
                    a3.SortOrder = Enum.SortOrder.LayoutOrder
                    values[as][aA][ah] = aP.value
                    local aX = #aN.options
                    if aX > 5 then
                        aS.Size = A(1, 0, 0, 85)
                    else
                        aS.Size = A(1, 0, 0, 17 * aX)
                    end
                    local aq = true
                    local function aY()
                        local aZ = {}
                        for T, v in ipairs(aN.options) do
                            if I(aP.value.Jumbobox, v) then
                                H(aZ, v)
                            else
                            end
                        end
                        local a_ = ""
                        if #aZ == 0 then
                            a_ = "..."
                        else
                            if #aZ == 1 then
                                a_ = aZ[1]
                            else
                                for T, v in ipairs(aZ) do
                                    if T == 1 then
                                        a_ = v
                                    else
                                        if T > 2 then
                                            if T < 4 then
                                                a_ = a_ .. ",  ..."
                                            end
                                        else
                                            a_ = a_ .. ",  " .. v
                                        end
                                    end
                                end
                            end
                        end
                        aW.Text = a_
                    end
                    for T, v in ipairs(aN.options) do
                        do
                            local aR = l("TextButton")
                            local a1 = l("TextLabel")
                            aR.Name = v
                            aR.Parent = aS
                            aR.BackgroundColor3 = n(0, 0, 0)
                            aR.BorderColor3 = n(27, 27, 35)
                            aR.Position = A(0, 30, 0, 16)
                            aR.Size = A(0, 175, 0, 17)
                            aR.AutoButtonColor = false
                            aR.Font = Enum.Font.SourceSans
                            aR.Text = ""
                            aR.TextColor3 = n(0, 0, 0)
                            aR.TextSize = 14.000
                            aR.BorderSizePixel = 0
                            aR.ZIndex = 6
                            a1.Parent = aR
                            a1.BackgroundColor3 = n(255, 255, 255)
                            a1.BackgroundTransparency = 1.000
                            a1.BorderColor3 = n(27, 42, 53)
                            a1.Position = A(0, 5, 0, -1)
                            a1.Size = A(-0.21714285, 208, 1, 0)
                            a1.Font = Enum.Font.SourceSansSemibold
                            a1.Text = v
                            a1.TextColor3 = n(200, 200, 200)
                            a1.TextSize = 14.000
                            a1.TextXAlignment = Enum.TextXAlignment.Left
                            a1.ZIndex = 6
                            aR.MouseButton1Down:Connect(
                                function()
                                    if I(aP.value.Jumbobox, v) then
                                        for T, X in pairs(aP.value.Jumbobox) do
                                            if X == v then
                                                J(aP.value.Jumbobox, T)
                                            end
                                        end
                                        a:Tween(
                                            a1,
                                            TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                            {TextColor3 = n(255, 255, 255)}
                                        )
                                    else
                                        H(aP.value.Jumbobox, v)
                                        a:Tween(
                                            a1,
                                            TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                            {TextColor3 = L}
                                        )
                                    end
                                    aY()
                                    values[as][aA][ah] = aP.value
                                    aO(aP.value)
                                end
                            )
                            aR.MouseEnter:Connect(
                                function()
                                    if not I(aP.value.Jumbobox, v) then
                                        a:Tween(
                                            a1,
                                            TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                            {TextColor3 = n(255, 255, 255)}
                                        )
                                    end
                                end
                            )
                            aR.MouseLeave:Connect(
                                function()
                                    if not I(aP.value.Jumbobox, v) then
                                        a:Tween(
                                            a1,
                                            TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                            {TextColor3 = n(200, 200, 200)}
                                        )
                                    end
                                end
                            )
                            aq = false
                        end
                    end
                    function aP:SetValue(b0)
                        aP.value = b0
                        for T, v in pairs(aS:GetChildren()) do
                            if v.Name ~= "UIListLayout" then
                                if I(b0.Jumbobox, v.Name) then
                                    v.TextLabel.TextColor3 = L
                                else
                                    v.TextLabel.TextColor3 = n(200, 200, 200)
                                end
                            end
                        end
                        aY()
                        values[as][aA][ah] = aP.value
                        aO(b0)
                    end
                    if aN.default then
                        aP:SetValue(aN.default)
                    end
                    ae.Parent = aR
                    ae.BackgroundColor3 = n(255, 255, 255)
                    ae.BackgroundTransparency = 1.000
                    ae.Position = A(0, 165, 0, 6)
                    ae.Size = A(0, 6, 0, 4)
                    ae.Image = "http://www.roblox.com/asset/?id=6724771531"
                    aV.Parent = aQ
                    aV.BackgroundColor3 = n(255, 255, 255)
                    aV.BackgroundTransparency = 1.000
                    aV.Position = A(0, 32, 0, -1)
                    aV.Size = A(0.111913361, 208, 0.382215232, 0)
                    aV.Font = Enum.Font.SourceSansSemibold
                    aV.Text = ah
                    aV.TextColor3 = n(200, 200, 200)
                    aV.TextSize = 14.000
                    aV.TextXAlignment = Enum.TextXAlignment.Left
                    aR.MouseButton1Down:Connect(
                        function()
                            aS.Visible = not aS.Visible
                            if not aS.Visible then
                                aS.CanvasPosition = i(0, 0)
                            end
                        end
                    )
                    local b1 = false
                    local b2 = false
                    aS.MouseEnter:Connect(
                        function()
                            b1 = true
                        end
                    )
                    aS.MouseLeave:Connect(
                        function()
                            b1 = false
                        end
                    )
                    aR.MouseEnter:Connect(
                        function()
                            b2 = true
                        end
                    )
                    aR.MouseLeave:Connect(
                        function()
                            b2 = false
                        end
                    )
                    game:GetService("UserInputService").InputBegan:Connect(
                        function(ao)
                            if
                                ao.UserInputType == Enum.UserInputType.MouseButton1 or
                                    ao.UserInputType == Enum.UserInputType.MouseButton2
                             then
                                if aS.Visible == true and not b1 and not b2 then
                                    aS.Visible = false
                                    aS.CanvasPosition = i(0, 0)
                                end
                            end
                        end
                    )
                elseif type == "ToggleKeybind" then
                    aC.Size = aC.Size + A(0, 0, 0, 16)
                    aP.value = {Toggle = aN.default and aN.default.Toggle or false, Key, Type = "Always", Active = true}
                    local b3 = l("Frame")
                    local aR = l("TextButton")
                    local b4 = l("Frame")
                    local a1 = l("TextLabel")
                    b3.Name = "Toggle"
                    b3.Parent = aE
                    b3.BackgroundColor3 = n(255, 255, 255)
                    b3.BackgroundTransparency = 1.000
                    b3.Size = A(1, 0, 0, 15)
                    aR.Name = "Button"
                    aR.Parent = b3
                    aR.BackgroundColor3 = n(255, 255, 255)
                    aR.BackgroundTransparency = 1.000
                    aR.Size = A(1, 0, 1, 0)
                    aR.Font = Enum.Font.SourceSans
                    aR.Text = ""
                    aR.TextColor3 = n(0, 0, 0)
                    aR.TextSize = 14.000
                    b4.Name = "Color"
                    b4.Parent = aR
                    b4.BackgroundColor3 = n(0, 0, 0)
                    b4.BorderColor3 = n(27, 27, 35)
                    b4.Position = A(0, 15, 0.5, -5)
                    b4.Size = A(0, 8, 0, 8)
                    local b5 = false
                    a1.Parent = aR
                    a1.BackgroundColor3 = n(255, 255, 255)
                    a1.BackgroundTransparency = 1.000
                    a1.Position = A(0, 32, 0, -1)
                    a1.Size = A(0.111913361, 208, 1, 0)
                    a1.Font = Enum.Font.SourceSansSemibold
                    a1.Text = ah
                    a1.TextColor3 = n(200, 200, 200)
                    a1.TextSize = 14.000
                    a1.TextXAlignment = Enum.TextXAlignment.Left
                    local function an()
                        if aP.value.Toggle then
                            tween =
                                a:Tween(
                                b4,
                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {BackgroundColor3 = L}
                            )
                            a:Tween(
                                a1,
                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {TextColor3 = n(255, 255, 255)}
                            )
                        else
                            keybindremove(ah)
                            tween =
                                a:Tween(
                                b4,
                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {BackgroundColor3 = n(0, 0, 0)}
                            )
                            a:Tween(
                                a1,
                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {TextColor3 = n(200, 200, 200)}
                            )
                        end
                        values[as][aA][ah] = aP.value
                        aO(aP.value)
                    end
                    aR.MouseButton1Down:Connect(
                        function()
                            if not b5 then
                                aP.value.Toggle = not aP.value.Toggle
                                an()
                                values[as][aA][ah] = aP.value
                                aO(aP.value)
                            end
                        end
                    )
                    if aN.default then
                        an()
                    end
                    values[as][aA][ah] = aP.value
                    do
                        local b6 = l("TextButton")
                        local ad = l("Frame")
                        local b7 = l("TextButton")
                        local a3 = l("UIListLayout")
                        local b8 = l("TextButton")
                        local b3 = l("TextButton")
                        b6.Name = "Keybind"
                        b6.Parent = aR
                        b6.BackgroundColor3 = n(0, 0, 0)
                        b6.BorderColor3 = n(27, 27, 35)
                        b6.Position = A(0, 270, 0.5, -6)
                        b6.Text = "NONE"
                        b6.Size = A(0, 43, 0, 12)
                        b6.Size = A(0, f:GetTextSize("NONE", 14, Enum.Font.SourceSansSemibold, i(700, 12)).X + 5, 0, 12)
                        b6.AutoButtonColor = false
                        b6.Font = Enum.Font.SourceSansSemibold
                        b6.TextColor3 = n(200, 200, 200)
                        b6.TextSize = 14.000
                        b6.AnchorPoint = i(1, 0)
                        b6.ZIndex = 3
                        ad.Parent = b6
                        ad.BackgroundColor3 = n(0, 0, 0)
                        ad.BorderColor3 = n(27, 27, 35)
                        ad.Position = A(1, -49, 0, 1)
                        ad.Size = A(0, 49, 0, 49)
                        ad.Visible = false
                        ad.ZIndex = 3
                        b7.Name = "Always"
                        b7.Parent = ad
                        b7.BackgroundColor3 = n(0, 0, 0)
                        b7.BackgroundTransparency = 1.000
                        b7.BorderColor3 = n(27, 27, 35)
                        b7.Position = A(-3.03289485, 231, 0.115384616, -6)
                        b7.Size = A(1, 0, 0, 16)
                        b7.AutoButtonColor = false
                        b7.Font = Enum.Font.SourceSansBold
                        b7.Text = "Always"
                        b7.TextColor3 = n(173, 24, 72)
                        b7.TextSize = 14.000
                        b7.ZIndex = 3
                        a3.Parent = ad
                        a3.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        a3.SortOrder = Enum.SortOrder.LayoutOrder
                        b8.Name = "Hold"
                        b8.Parent = ad
                        b8.BackgroundColor3 = n(0, 0, 0)
                        b8.BackgroundTransparency = 1.000
                        b8.BorderColor3 = n(27, 27, 35)
                        b8.Position = A(-3.03289485, 231, 0.115384616, -6)
                        b8.Size = A(1, 0, 0, 16)
                        b8.AutoButtonColor = false
                        b8.Font = Enum.Font.SourceSansSemibold
                        b8.Text = "Hold"
                        b8.TextColor3 = n(200, 200, 200)
                        b8.TextSize = 14.000
                        b8.ZIndex = 3
                        b3.Name = "Toggle"
                        b3.Parent = ad
                        b3.BackgroundColor3 = n(0, 0, 0)
                        b3.BackgroundTransparency = 1.000
                        b3.BorderColor3 = n(27, 27, 35)
                        b3.Position = A(-3.03289485, 231, 0.115384616, -6)
                        b3.Size = A(1, 0, 0, 16)
                        b3.AutoButtonColor = false
                        b3.Font = Enum.Font.SourceSansSemibold
                        b3.Text = "Toggle"
                        b3.TextColor3 = n(200, 200, 200)
                        b3.TextSize = 14.000
                        b3.ZIndex = 3
                        for b9, ba in pairs(ad:GetChildren()) do
                            if ba:IsA("TextButton") then
                                ba.MouseButton1Down:Connect(
                                    function()
                                        aP.value.Type = ba.Text
                                        ad.Visible = false
                                        if aP.value.Active ~= (aP.value.Type == "Always" and true or false) then
                                            aP.value.Active = aP.value.Type == "Always" and true or false
                                            aO(aP.value)
                                        end
                                        if ba.Text == "Always" then
                                            keybindremove(ah)
                                        end
                                        for b9, ba in pairs(ad:GetChildren()) do
                                            if ba:IsA("TextButton") and ba.Text ~= aP.value.Type then
                                                ba.Font = Enum.Font.SourceSansSemibold
                                                a:Tween(
                                                    ba,
                                                    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                                    {TextColor3 = n(200, 200, 200)}
                                                )
                                            end
                                        end
                                        ba.Font = Enum.Font.SourceSansBold
                                        ba.TextColor3 = L
                                        values[as][aA][ah] = aP.value
                                    end
                                )
                                ba.MouseEnter:Connect(
                                    function()
                                        if aP.value.Type ~= ba.Text then
                                            a:Tween(
                                                ba,
                                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                                {TextColor3 = n(255, 255, 255)}
                                            )
                                        end
                                    end
                                )
                                ba.MouseLeave:Connect(
                                    function()
                                        if aP.value.Type ~= ba.Text then
                                            a:Tween(
                                                ba,
                                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                                {TextColor3 = n(200, 200, 200)}
                                            )
                                        end
                                    end
                                )
                            end
                        end
                        b6.MouseButton1Down:Connect(
                            function()
                                if not b5 then
                                    wait()
                                    b5 = true
                                    b6.Text = "..."
                                    b6.Size =
                                        A(
                                        0,
                                        f:GetTextSize("...", 14, Enum.Font.SourceSansSemibold, i(700, 12)).X + 4,
                                        0,
                                        12
                                    )
                                end
                            end
                        )
                        b6.MouseButton2Down:Connect(
                            function()
                                if not b5 then
                                    ad.Visible = not ad.Visible
                                end
                            end
                        )
                        local Player = game.Players.LocalPlayer
                        local aa = Player:GetMouse()
                        local bb = false
                        ad.MouseEnter:Connect(
                            function()
                                bb = true
                            end
                        )
                        ad.MouseLeave:Connect(
                            function()
                                bb = false
                            end
                        )
                        local bc = false
                        b6.MouseEnter:Connect(
                            function()
                                bc = true
                            end
                        )
                        b6.MouseLeave:Connect(
                            function()
                                bc = false
                            end
                        )
                        game:GetService("UserInputService").InputBegan:Connect(
                            function(ao)
                                if
                                    ao.UserInputType == Enum.UserInputType.MouseButton1 or
                                        ao.UserInputType == Enum.UserInputType.MouseButton2 and not b5
                                 then
                                    if ad.Visible == true and not bb and not bc then
                                        ad.Visible = false
                                    end
                                end
                                if b5 then
                                    b5 = false
                                    b6.Text =
                                        ao.KeyCode.Name ~= "Unknown" and ao.KeyCode.Name:upper() or
                                        ao.UserInputType.Name:upper()
                                    b6.Size =
                                        A(
                                        0,
                                        f:GetTextSize(b6.Text, 14, Enum.Font.SourceSansSemibold, i(700, 12)).X + 5,
                                        0,
                                        12
                                    )
                                    aP.value.Key =
                                        ao.KeyCode.Name ~= "Unknown" and ao.KeyCode.Name or ao.UserInputType.Name
                                    if ao.KeyCode.Name == "Backspace" then
                                        b6.Text = "NONE"
                                        b6.Size =
                                            A(
                                            0,
                                            f:GetTextSize(b6.Text, 14, Enum.Font.SourceSansSemibold, i(700, 12)).X + 4,
                                            0,
                                            12
                                        )
                                        aP.value.Key = nil
                                        aP.value.Active = true
                                    end
                                    aO(aP.value)
                                else
                                    if aP.value.Key ~= nil then
                                        if C(aP.value.Key, "Mouse") then
                                            if ao.UserInputType == Enum.UserInputType[aP.value.Key] then
                                                if aP.value.Type == "Hold" then
                                                    aP.value.Active = true
                                                    aO(aP.value)
                                                    if aP.value.Active and aP.value.Toggle then
                                                        keybindadd(ah)
                                                    else
                                                        keybindremove(ah)
                                                    end
                                                elseif aP.value.Type == "Toggle" then
                                                    aP.value.Active = not aP.value.Active
                                                    aO(aP.value)
                                                    if aP.value.Active and aP.value.Toggle then
                                                        keybindadd(ah)
                                                    else
                                                        keybindremove(ah)
                                                    end
                                                end
                                            end
                                        else
                                            if ao.KeyCode == Enum.KeyCode[aP.value.Key] then
                                                if aP.value.Type == "Hold" then
                                                    aP.value.Active = true
                                                    aO(aP.value)
                                                    if aP.value.Active and aP.value.Toggle then
                                                        keybindadd(ah)
                                                    else
                                                        keybindremove(ah)
                                                    end
                                                elseif aP.value.Type == "Toggle" then
                                                    aP.value.Active = not aP.value.Active
                                                    aO(aP.value)
                                                    if aP.value.Active and aP.value.Toggle then
                                                        keybindadd(ah)
                                                    else
                                                        keybindremove(ah)
                                                    end
                                                end
                                            end
                                        end
                                    else
                                        aP.value.Active = true
                                    end
                                end
                                values[as][aA][ah] = aP.value
                            end
                        )
                        game:GetService("UserInputService").InputEnded:Connect(
                            function(ao)
                                if aP.value.Key ~= nil then
                                    if C(aP.value.Key, "Mouse") then
                                        if ao.UserInputType == Enum.UserInputType[aP.value.Key] then
                                            if aP.value.Type == "Hold" then
                                                aP.value.Active = false
                                                aO(aP.value)
                                                if aP.value.Active then
                                                    keybindadd(ah)
                                                else
                                                    keybindremove(ah)
                                                end
                                            end
                                        end
                                    else
                                        if ao.KeyCode == Enum.KeyCode[aP.value.Key] then
                                            if aP.value.Type == "Hold" then
                                                aP.value.Active = false
                                                aO(aP.value)
                                                if aP.value.Active then
                                                    keybindadd(ah)
                                                else
                                                    keybindremove(ah)
                                                end
                                            end
                                        end
                                    end
                                end
                                values[as][aA][ah] = aP.value
                            end
                        )
                    end
                    function aP:SetValue(bd)
                        aP.value = bd
                        an()
                    end
                elseif type == "Toggle" then
                    aC.Size = aC.Size + A(0, 0, 0, 16)
                    aP.value = {Toggle = aN.default and aN.default.Toggle or false}
                    local b3 = l("Frame")
                    local aR = l("TextButton")
                    local b4 = l("Frame")
                    local a1 = l("TextLabel")
                    b3.Name = "Toggle"
                    b3.Parent = aE
                    b3.BackgroundColor3 = n(255, 255, 255)
                    b3.BackgroundTransparency = 1.000
                    b3.Size = A(1, 0, 0, 15)
                    aR.Name = "Button"
                    aR.Parent = b3
                    aR.BackgroundColor3 = n(255, 255, 255)
                    aR.BackgroundTransparency = 1.000
                    aR.Size = A(1, 0, 1, 0)
                    aR.Font = Enum.Font.SourceSans
                    aR.Text = ""
                    aR.TextColor3 = n(0, 0, 0)
                    aR.TextSize = 14.000
                    b4.Name = "Color"
                    b4.Parent = aR
                    b4.BackgroundColor3 = n(0, 0, 0)
                    b4.BorderColor3 = n(27, 27, 35)
                    b4.Position = A(0, 15, 0.5, -5)
                    b4.Size = A(0, 8, 0, 8)
                    a1.Parent = aR
                    a1.BackgroundColor3 = n(255, 255, 255)
                    a1.BackgroundTransparency = 1.000
                    a1.Position = A(0, 32, 0, -1)
                    a1.Size = A(0.111913361, 208, 1, 0)
                    a1.Font = Enum.Font.SourceSansSemibold
                    a1.Text = ah
                    a1.TextColor3 = n(200, 200, 200)
                    a1.TextSize = 14.000
                    a1.TextXAlignment = Enum.TextXAlignment.Left
                    local function an()
                        if aP.value.Toggle then
                            tween =
                                a:Tween(
                                b4,
                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {BackgroundColor3 = L}
                            )
                            a:Tween(
                                a1,
                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {TextColor3 = n(255, 255, 255)}
                            )
                        else
                            tween =
                                a:Tween(
                                b4,
                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {BackgroundColor3 = n(0, 0, 0)}
                            )
                            a:Tween(
                                a1,
                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {TextColor3 = n(200, 200, 200)}
                            )
                        end
                        values[as][aA][ah] = aP.value
                    end
                    aR.MouseButton1Down:Connect(
                        function()
                            aP.value.Toggle = not aP.value.Toggle
                            an()
                            values[as][aA][ah] = aP.value
                            aO(aP.value)
                        end
                    )
                    if aN.default then
                        an()
                    end
                    values[as][aA][ah] = aP.value
                    function aP:SetValue(bd)
                        aP.value = bd
                        values[as][aA][ah] = aP.value
                        an()
                        aO(aP.value)
                    end
                elseif type == "ToggleColor" then
                    aC.Size = aC.Size + A(0, 0, 0, 16)
                    aP.value = {
                        Toggle = aN.default and aN.default.Toggle or false,
                        Color = aN.default and aN.default.Color or n(255, 255, 255)
                    }
                    local b3 = l("Frame")
                    local aR = l("TextButton")
                    local b4 = l("Frame")
                    local a1 = l("TextLabel")
                    b3.Name = "Toggle"
                    b3.Parent = aE
                    b3.BackgroundColor3 = n(255, 255, 255)
                    b3.BackgroundTransparency = 1.000
                    b3.Size = A(1, 0, 0, 15)
                    aR.Name = "Button"
                    aR.Parent = b3
                    aR.BackgroundColor3 = n(255, 255, 255)
                    aR.BackgroundTransparency = 1.000
                    aR.Size = A(1, 0, 1, 0)
                    aR.Font = Enum.Font.SourceSans
                    aR.Text = ""
                    aR.TextColor3 = n(0, 0, 0)
                    aR.TextSize = 14.000
                    b4.Name = "Color"
                    b4.Parent = aR
                    b4.BackgroundColor3 = n(0, 0, 0)
                    b4.BorderColor3 = n(27, 27, 35)
                    b4.Position = A(0, 15, 0.5, -5)
                    b4.Size = A(0, 8, 0, 8)
                    a1.Parent = aR
                    a1.BackgroundColor3 = n(255, 255, 255)
                    a1.BackgroundTransparency = 1.000
                    a1.Position = A(0, 32, 0, -1)
                    a1.Size = A(0.111913361, 208, 1, 0)
                    a1.Font = Enum.Font.SourceSansSemibold
                    a1.Text = ah
                    a1.TextColor3 = n(200, 200, 200)
                    a1.TextSize = 14.000
                    a1.TextXAlignment = Enum.TextXAlignment.Left
                    local function an()
                        if aP.value.Toggle then
                            tween =
                                a:Tween(
                                b4,
                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {BackgroundColor3 = L}
                            )
                            a:Tween(
                                a1,
                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {TextColor3 = n(255, 255, 255)}
                            )
                        else
                            tween =
                                a:Tween(
                                b4,
                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {BackgroundColor3 = n(0, 0, 0)}
                            )
                            a:Tween(
                                a1,
                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {TextColor3 = n(200, 200, 200)}
                            )
                        end
                        values[as][aA][ah] = aP.value
                    end
                    local be, bf, bg
                    local bh = l("TextButton")
                    local ad = l("Frame")
                    local bi = l("ImageButton")
                    local bj = l("Frame")
                    local bk = l("ImageButton")
                    local bl = l("Frame")
                    bh.Name = "ColorP"
                    bh.Parent = aR
                    bh.AnchorPoint = i(1, 0)
                    bh.BackgroundColor3 = n(255, 0, 0)
                    bh.BorderColor3 = n(27, 27, 35)
                    bh.Position = A(0, 270, 0.5, -4)
                    bh.Size = A(0, 18, 0, 8)
                    bh.AutoButtonColor = false
                    bh.Font = Enum.Font.SourceSansSemibold
                    bh.Text = ""
                    bh.TextColor3 = n(200, 200, 200)
                    bh.TextSize = 14.000
                    ad.Parent = bh
                    ad.BackgroundColor3 = n(0, 0, 0)
                    ad.BorderColor3 = n(27, 27, 35)
                    ad.Position = A(-0.666666687, -170, 1.375, 0)
                    ad.Size = A(0, 200, 0, 170)
                    ad.Visible = false
                    ad.ZIndex = 3
                    bi.Name = "Colorpick"
                    bi.Parent = ad
                    bi.BackgroundColor3 = n(255, 255, 255)
                    bi.BorderColor3 = n(27, 27, 35)
                    bi.ClipsDescendants = false
                    bi.Position = A(0, 40, 0, 10)
                    bi.Size = A(0, 150, 0, 150)
                    bi.AutoButtonColor = false
                    bi.Image = "rbxassetid://4155801252"
                    bi.ImageColor3 = n(255, 0, 0)
                    bi.ZIndex = 3
                    bj.Name = "ColorDrag"
                    bj.Parent = bi
                    bj.AnchorPoint = i(0.5, 0.5)
                    bj.BackgroundColor3 = n(255, 255, 255)
                    bj.BorderColor3 = n(27, 27, 35)
                    bj.Size = A(0, 4, 0, 4)
                    bj.ZIndex = 3
                    bk.Name = "Huepick"
                    bk.Parent = ad
                    bk.BackgroundColor3 = n(255, 255, 255)
                    bk.BorderColor3 = n(27, 27, 35)
                    bk.ClipsDescendants = false
                    bk.Position = A(0, 10, 0, 10)
                    bk.Size = A(0, 20, 0, 150)
                    bk.AutoButtonColor = false
                    bk.Image = "rbxassetid://3641079629"
                    bk.ImageColor3 = n(255, 0, 0)
                    bk.ImageTransparency = 1
                    bk.BackgroundTransparency = 0
                    bk.ZIndex = 3
                    local bm = l("UIGradient")
                    bm.Rotation = 90
                    bm.Name = "HueFrameGradient"
                    bm.Parent = bk
                    bm.Color =
                        ColorSequence.new {
                        ColorSequenceKeypoint.new(0.00, n(255, 0, 0)),
                        ColorSequenceKeypoint.new(0.17, n(255, 0, 255)),
                        ColorSequenceKeypoint.new(0.33, n(0, 0, 255)),
                        ColorSequenceKeypoint.new(0.50, n(0, 255, 255)),
                        ColorSequenceKeypoint.new(0.67, n(0, 255, 0)),
                        ColorSequenceKeypoint.new(0.83, n(255, 255, 0)),
                        ColorSequenceKeypoint.new(1.00, n(255, 0, 0))
                    }
                    bl.Name = "Huedrag"
                    bl.Parent = bk
                    bl.BackgroundColor3 = n(255, 255, 255)
                    bl.BorderColor3 = n(27, 27, 35)
                    bl.Size = A(1, 0, 0, 2)
                    bl.ZIndex = 3
                    bh.MouseButton1Down:Connect(
                        function()
                            ad.Visible = not ad.Visible
                        end
                    )
                    local bn = false
                    local bo = false
                    bh.MouseEnter:Connect(
                        function()
                            bn = true
                        end
                    )
                    bh.MouseLeave:Connect(
                        function()
                            bn = false
                        end
                    )
                    ad.MouseEnter:Connect(
                        function()
                            bo = true
                        end
                    )
                    ad.MouseLeave:Connect(
                        function()
                            bo = false
                        end
                    )
                    be = p(bl.AbsolutePosition.Y - bk.AbsolutePosition.Y, 0, bk.AbsoluteSize.Y) / bk.AbsoluteSize.Y
                    bf = 1 - p(bj.AbsolutePosition.X - bi.AbsolutePosition.X, 0, bi.AbsoluteSize.X) / bi.AbsoluteSize.X
                    bg = 1 - p(bj.AbsolutePosition.Y - bi.AbsolutePosition.Y, 0, bi.AbsoluteSize.Y) / bi.AbsoluteSize.Y
                    if aN.default and aN.default.Color ~= nil then
                        be, bf, bg = aN.default.Color:ToHSV()
                        be = p(be, 0, 1)
                        bf = p(bf, 0, 1)
                        bg = p(bg, 0, 1)
                        bj.Position = A(1 - bf, 0, 1 - bg, 0)
                        bi.ImageColor3 = o(be, 1, 1)
                        bh.BackgroundColor3 = o(be, bf, bg)
                        bl.Position = A(0, 0, 1 - be, -1)
                        values[as][aA][ah] = aN.default.Color
                    end
                    local bp = a9:GetMouse()
                    game:GetService("UserInputService").InputBegan:Connect(
                        function(ao)
                            if
                                ao.UserInputType == Enum.UserInputType.MouseButton1 or
                                    ao.UserInputType == Enum.UserInputType.MouseButton2
                             then
                                if not dragging and not bn and not bo then
                                    ad.Visible = false
                                end
                            end
                        end
                    )
                    local function bq()
                        local br = p(bp.X - bi.AbsolutePosition.X, 0, bi.AbsoluteSize.X) / bi.AbsoluteSize.X
                        local bs = p(bp.Y - bi.AbsolutePosition.Y, 0, bi.AbsoluteSize.Y) / bi.AbsoluteSize.Y
                        bj.Position = A(br, 0, bs, 0)
                        bf = 1 - br
                        bg = 1 - bs
                        bi.ImageColor3 = o(be, 1, 1)
                        bh.BackgroundColor3 = o(be, bf, bg)
                        values[as][aA][ah] = aP.value
                        aP.value.Color = o(be, bf, bg)
                        aO(aP.value)
                    end
                    local function bt()
                        local bu = p(bp.Y - bk.AbsolutePosition.Y, 0, 148)
                        bl.Position = A(0, 0, 0, bu)
                        hue = bu / 148
                        be = 1 - hue
                        bi.ImageColor3 = o(be, 1, 1)
                        bh.BackgroundColor3 = o(be, bf, bg)
                        values[as][aA][ah] = aP.value
                        aP.value.Color = o(be, bf, bg)
                        aO(aP.value)
                    end
                    bi.MouseButton1Down:Connect(
                        function()
                            bq()
                            moveconnection =
                                bp.Move:Connect(
                                function()
                                    bq()
                                end
                            )
                            releaseconnection =
                                game:GetService("UserInputService").InputEnded:Connect(
                                function(aa)
                                    if aa.UserInputType == Enum.UserInputType.MouseButton1 then
                                        bq()
                                        moveconnection:Disconnect()
                                        releaseconnection:Disconnect()
                                    end
                                end
                            )
                        end
                    )
                    bk.MouseButton1Down:Connect(
                        function()
                            bt()
                            moveconnection =
                                bp.Move:Connect(
                                function()
                                    bt()
                                end
                            )
                            releaseconnection =
                                game:GetService("UserInputService").InputEnded:Connect(
                                function(aa)
                                    if aa.UserInputType == Enum.UserInputType.MouseButton1 then
                                        bt()
                                        moveconnection:Disconnect()
                                        releaseconnection:Disconnect()
                                    end
                                end
                            )
                        end
                    )
                    aR.MouseButton1Down:Connect(
                        function()
                            aP.value.Toggle = not aP.value.Toggle
                            an()
                            values[as][aA][ah] = aP.value
                            aO(aP.value)
                        end
                    )
                    if aN.default then
                        an()
                    end
                    values[as][aA][ah] = aP.value
                    function aP:SetValue(bd)
                        aP.value = bd
                        local bv = m(bd.Color.R, bd.Color.G, bd.Color.B)
                        be, bf, bg = bv:ToHSV()
                        be = p(be, 0, 1)
                        bf = p(bf, 0, 1)
                        bg = p(bg, 0, 1)
                        bj.Position = A(1 - bf, 0, 1 - bg, 0)
                        bi.ImageColor3 = o(be, 1, 1)
                        bh.BackgroundColor3 = o(be, bf, bg)
                        an()
                        bl.Position = A(0, 0, 1 - be, -1)
                        aO(bd)
                    end
                elseif type == "ToggleTrans" then
                    aC.Size = aC.Size + A(0, 0, 0, 16)
                    aP.value = {
                        Toggle = aN.default and aN.default.Toggle or false,
                        Color = aN.default and aN.default.Color or n(255, 255, 255),
                        Transparency = aN.default and aN.default.Transparency or 0
                    }
                    local b3 = l("Frame")
                    local aR = l("TextButton")
                    local b4 = l("Frame")
                    local a1 = l("TextLabel")
                    b3.Name = "Toggle"
                    b3.Parent = aE
                    b3.BackgroundColor3 = n(255, 255, 255)
                    b3.BackgroundTransparency = 1.000
                    b3.Size = A(1, 0, 0, 15)
                    aR.Name = "Button"
                    aR.Parent = b3
                    aR.BackgroundColor3 = n(255, 255, 255)
                    aR.BackgroundTransparency = 1.000
                    aR.Size = A(1, 0, 1, 0)
                    aR.Font = Enum.Font.SourceSans
                    aR.Text = ""
                    aR.TextColor3 = n(0, 0, 0)
                    aR.TextSize = 14.000
                    b4.Name = "Color"
                    b4.Parent = aR
                    b4.BackgroundColor3 = n(0, 0, 0)
                    b4.BorderColor3 = n(27, 27, 35)
                    b4.Position = A(0, 15, 0.5, -5)
                    b4.Size = A(0, 8, 0, 8)
                    a1.Parent = aR
                    a1.BackgroundColor3 = n(255, 255, 255)
                    a1.BackgroundTransparency = 1.000
                    a1.Position = A(0, 32, 0, -1)
                    a1.Size = A(0.111913361, 208, 1, 0)
                    a1.Font = Enum.Font.SourceSansSemibold
                    a1.Text = ah
                    a1.TextColor3 = n(200, 200, 200)
                    a1.TextSize = 14.000
                    a1.TextXAlignment = Enum.TextXAlignment.Left
                    local function an()
                        if aP.value.Toggle then
                            tween =
                                a:Tween(
                                b4,
                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {BackgroundColor3 = n(155, 155, 155)}
                            )
                            a:Tween(
                                a1,
                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {TextColor3 = n(255, 255, 255)}
                            )
                        else
                            tween =
                                a:Tween(
                                b4,
                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {BackgroundColor3 = n(0, 0, 0)}
                            )
                            a:Tween(
                                a1,
                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {TextColor3 = n(200, 200, 200)}
                            )
                        end
                        values[as][aA][ah] = aP.value
                        aO(aP.value)
                    end
                    local be, bf, bg
                    local bh = l("TextButton")
                    local ad = l("Frame")
                    local bi = l("ImageButton")
                    local bj = l("Frame")
                    local bk = l("ImageButton")
                    local bl = l("Frame")
                    bh.Name = "ColorP"
                    bh.Parent = aR
                    bh.AnchorPoint = i(1, 0)
                    bh.BackgroundColor3 = n(255, 0, 0)
                    bh.BorderColor3 = n(27, 27, 35)
                    bh.Position = A(0, 270, 0.5, -4)
                    bh.Size = A(0, 18, 0, 8)
                    bh.AutoButtonColor = false
                    bh.Font = Enum.Font.SourceSansSemibold
                    bh.Text = ""
                    bh.TextColor3 = n(200, 200, 200)
                    bh.TextSize = 14.000
                    ad.Parent = bh
                    ad.BackgroundColor3 = n(0, 0, 0)
                    ad.BorderColor3 = n(27, 27, 35)
                    ad.Position = A(-0.666666687, -170, 1.375, 0)
                    ad.Size = A(0, 200, 0, 190)
                    ad.Visible = false
                    ad.ZIndex = 3
                    bi.Name = "Colorpick"
                    bi.Parent = ad
                    bi.BackgroundColor3 = n(255, 255, 255)
                    bi.BorderColor3 = n(27, 27, 35)
                    bi.ClipsDescendants = false
                    bi.Position = A(0, 40, 0, 10)
                    bi.Size = A(0, 150, 0, 150)
                    bi.AutoButtonColor = false
                    bi.Image = "rbxassetid://4155801252"
                    bi.ImageColor3 = n(255, 0, 0)
                    bi.ZIndex = 3
                    bj.Name = "ColorDrag"
                    bj.Parent = bi
                    bj.AnchorPoint = i(0.5, 0.5)
                    bj.BackgroundColor3 = n(255, 255, 255)
                    bj.BorderColor3 = n(27, 27, 35)
                    bj.Size = A(0, 4, 0, 4)
                    bj.ZIndex = 3
                    bk.Name = "Huepick"
                    bk.Parent = ad
                    bk.BackgroundColor3 = n(255, 255, 255)
                    bk.BorderColor3 = n(27, 27, 35)
                    bk.ClipsDescendants = true
                    bk.Position = A(0, 10, 0, 10)
                    bk.Size = A(0, 20, 0, 150)
                    bk.AutoButtonColor = false
                    bk.Image = "rbxassetid://3641079629"
                    bk.ImageColor3 = n(255, 0, 0)
                    bk.ImageTransparency = 1
                    bk.BackgroundTransparency = 0
                    bk.ZIndex = 3
                    local bm = l("UIGradient")
                    bm.Rotation = 90
                    bm.Name = "HueFrameGradient"
                    bm.Parent = bk
                    bm.Color =
                        ColorSequence.new {
                        ColorSequenceKeypoint.new(0.00, n(255, 0, 0)),
                        ColorSequenceKeypoint.new(0.17, n(255, 0, 255)),
                        ColorSequenceKeypoint.new(0.33, n(0, 0, 255)),
                        ColorSequenceKeypoint.new(0.50, n(0, 255, 255)),
                        ColorSequenceKeypoint.new(0.67, n(0, 255, 0)),
                        ColorSequenceKeypoint.new(0.83, n(255, 255, 0)),
                        ColorSequenceKeypoint.new(1.00, n(255, 0, 0))
                    }
                    bl.Name = "Huedrag"
                    bl.Parent = bk
                    bl.BackgroundColor3 = n(255, 255, 255)
                    bl.BorderColor3 = n(27, 27, 35)
                    bl.Size = A(1, 0, 0, 2)
                    bl.ZIndex = 3
                    local bw = l("ImageButton")
                    local bx = l("ImageLabel")
                    local by = l("Frame")
                    bw.Name = "Transpick"
                    bw.Parent = ad
                    bw.BackgroundColor3 = n(255, 255, 255)
                    bw.BorderColor3 = n(27, 27, 35)
                    bw.Position = A(0, 10, 0, 167)
                    bw.Size = A(0, 180, 0, 15)
                    bw.AutoButtonColor = false
                    bw.Image = "rbxassetid://3887014957"
                    bw.ScaleType = Enum.ScaleType.Tile
                    bw.TileSize = A(0, 10, 0, 10)
                    bw.ZIndex = 3
                    bx.Name = "Transcolor"
                    bx.Parent = bw
                    bx.BackgroundColor3 = n(255, 255, 255)
                    bx.BackgroundTransparency = 1.000
                    bx.Size = A(1, 0, 1, 0)
                    bx.Image = "rbxassetid://3887017050"
                    bx.ImageColor3 = n(255, 0, 4)
                    bx.ZIndex = 3
                    by.Name = "Transdrag"
                    by.Parent = bx
                    by.BackgroundColor3 = n(255, 255, 255)
                    by.BorderColor3 = n(27, 27, 35)
                    by.Position = A(0, -1, 0, 0)
                    by.Size = A(0, 2, 1, 0)
                    by.ZIndex = 3
                    bh.MouseButton1Down:Connect(
                        function()
                            ad.Visible = not ad.Visible
                        end
                    )
                    local bn = false
                    local bo = false
                    bh.MouseEnter:Connect(
                        function()
                            bn = true
                        end
                    )
                    bh.MouseLeave:Connect(
                        function()
                            bn = false
                        end
                    )
                    ad.MouseEnter:Connect(
                        function()
                            bo = true
                        end
                    )
                    ad.MouseLeave:Connect(
                        function()
                            bo = false
                        end
                    )
                    be = p(bl.AbsolutePosition.Y - bk.AbsolutePosition.Y, 0, bk.AbsoluteSize.Y) / bk.AbsoluteSize.Y
                    bf = 1 - p(bj.AbsolutePosition.X - bi.AbsolutePosition.X, 0, bi.AbsoluteSize.X) / bi.AbsoluteSize.X
                    bg = 1 - p(bj.AbsolutePosition.Y - bi.AbsolutePosition.Y, 0, bi.AbsoluteSize.Y) / bi.AbsoluteSize.Y
                    if aN.default and aN.default.Color ~= nil then
                        be, bf, bg = aN.default.Color:ToHSV()
                        be = p(be, 0, 1)
                        bf = p(bf, 0, 1)
                        bg = p(bg, 0, 1)
                        bj.Position = A(1 - bf, 0, 1 - bg, 0)
                        bi.ImageColor3 = o(be, 1, 1)
                        bx.ImageColor3 = o(be, 1, 1)
                        bh.BackgroundColor3 = o(be, bf, bg)
                        bl.Position = A(0, 0, 1 - be, -1)
                    end
                    if aN.default and aN.default.Transparency ~= nil then
                        by.Position = A(aN.default.Transparency, -1, 0, 0)
                    end
                    local bp = a9:GetMouse()
                    game:GetService("UserInputService").InputBegan:Connect(
                        function(ao)
                            if
                                ao.UserInputType == Enum.UserInputType.MouseButton1 or
                                    ao.UserInputType == Enum.UserInputType.MouseButton2
                             then
                                if not dragging and not bn and not bo then
                                    ad.Visible = false
                                end
                            end
                        end
                    )
                    local function bq()
                        local br = p(bp.X - bi.AbsolutePosition.X, 0, bi.AbsoluteSize.X) / bi.AbsoluteSize.X
                        local bs = p(bp.Y - bi.AbsolutePosition.Y, 0, bi.AbsoluteSize.Y) / bi.AbsoluteSize.Y
                        bj.Position = A(br, 0, bs, 0)
                        bf = 1 - br
                        bg = 1 - bs
                        bi.ImageColor3 = o(be, 1, 1)
                        bh.BackgroundColor3 = o(be, bf, bg)
                        bx.ImageColor3 = o(be, 1, 1)
                        values[as][aA][ah] = aP.value
                        aP.value.Color = o(be, bf, bg)
                        aO(aP.value)
                    end
                    local function bt()
                        local bu = p(bp.Y - bk.AbsolutePosition.Y, 0, 148)
                        bl.Position = A(0, 0, 0, bu)
                        hue = bu / 148
                        be = 1 - hue
                        bi.ImageColor3 = o(be, 1, 1)
                        bx.ImageColor3 = o(be, 1, 1)
                        bh.BackgroundColor3 = o(be, bf, bg)
                        values[as][aA][ah] = aP.value
                        aP.value.Color = o(be, bf, bg)
                        aO(aP.value)
                    end
                    local function bz()
                        local bA = p(bp.X - bw.AbsolutePosition.X, 0, 178)
                        by.Position = A(0, bA, 0, 0)
                        aP.value.Transparency = bA / 178
                        values[as][aA][ah] = aP.value
                        aO(aP.value)
                    end
                    bw.MouseButton1Down:Connect(
                        function()
                            bz()
                            moveconnection =
                                bp.Move:Connect(
                                function()
                                    bz()
                                end
                            )
                            releaseconnection =
                                game:GetService("UserInputService").InputEnded:Connect(
                                function(aa)
                                    if aa.UserInputType == Enum.UserInputType.MouseButton1 then
                                        bz()
                                        moveconnection:Disconnect()
                                        releaseconnection:Disconnect()
                                    end
                                end
                            )
                        end
                    )
                    bi.MouseButton1Down:Connect(
                        function()
                            bq()
                            moveconnection =
                                bp.Move:Connect(
                                function()
                                    bq()
                                end
                            )
                            releaseconnection =
                                game:GetService("UserInputService").InputEnded:Connect(
                                function(aa)
                                    if aa.UserInputType == Enum.UserInputType.MouseButton1 then
                                        bq()
                                        moveconnection:Disconnect()
                                        releaseconnection:Disconnect()
                                    end
                                end
                            )
                        end
                    )
                    bk.MouseButton1Down:Connect(
                        function()
                            bt()
                            moveconnection =
                                bp.Move:Connect(
                                function()
                                    bt()
                                end
                            )
                            releaseconnection =
                                game:GetService("UserInputService").InputEnded:Connect(
                                function(aa)
                                    if aa.UserInputType == Enum.UserInputType.MouseButton1 then
                                        bt()
                                        moveconnection:Disconnect()
                                        releaseconnection:Disconnect()
                                    end
                                end
                            )
                        end
                    )
                    aR.MouseButton1Down:Connect(
                        function()
                            aP.value.Toggle = not aP.value.Toggle
                            an()
                            values[as][aA][ah] = aP.value
                            aO(aP.value)
                        end
                    )
                    if aN.default then
                        if aP.value.Toggle then
                            tween =
                                a:Tween(
                                b4,
                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {BackgroundColor3 = n(155, 155, 155)}
                            )
                            a:Tween(
                                a1,
                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {TextColor3 = n(255, 255, 255)}
                            )
                        else
                            tween =
                                a:Tween(
                                b4,
                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {BackgroundColor3 = n(0, 0, 0)}
                            )
                            a:Tween(
                                a1,
                                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {TextColor3 = n(200, 200, 200)}
                            )
                        end
                        values[as][aA][ah] = aP.value
                    end
                    values[as][aA][ah] = aP.value
                    function aP:SetValue(bd)
                        aP.value = bd
                        local bv = m(bd.Color.R, bd.Color.G, bd.Color.B)
                        be, bf, bg = bv:ToHSV()
                        be = p(be, 0, 1)
                        bf = p(bf, 0, 1)
                        bg = p(bg, 0, 1)
                        bj.Position = A(1 - bf, 0, 1 - bg, 0)
                        bi.ImageColor3 = o(be, 1, 1)
                        bh.BackgroundColor3 = o(be, bf, bg)
                        an()
                        bl.Position = A(0, 0, 1 - be, -1)
                    end
                elseif type == "TextBox" then
                    aC.Size = aC.Size + A(0, 0, 0, 30)
                    aP.value = {Text = aN.default and aN.default.text or ""}
                    local bS = l("Frame")
                    local bT = l("TextBox")
                    bS.Name = "Box"
                    bS.Parent = aE
                    bS.BackgroundColor3 = n(255, 255, 255)
                    bS.BackgroundTransparency = 1.000
                    bS.Position = A(0, 0, 0.542059898, 0)
                    bS.Size = A(1, 0, 0, 30)
                    bT.Parent = bS
                    bT.BackgroundColor3 = n(0, 0, 0)
                    bT.BorderColor3 = n(27, 27, 35)
                    bT.Position = A(0.108303241, 0, 0.224465579, 0)
                    bT.Size = A(0, 175, 0, 20)
                    bT.Font = Enum.Font.SourceSans
                    bT.PlaceholderText = aN.placeholder
                    bT.Text = aP.value.Text
                    bT.TextColor3 = n(255, 255, 255)
                    bT.TextSize = 14.000
                    values[as][aA][ah] = aP.value
                    bT:GetPropertyChangedSignal("Text"):Connect(
                        function()
                            if D(bT.Text) > 10 then
                                bT.Text = E(bT.Text, 1, 10)
                            end
                            aP.value.Text = bT.Text
                            values[as][aA][ah] = aP.value
                            aO(aP.value)
                        end
                    )
                    function aP:SetValue(bd)
                        aP.value = bd
                        values[as][aA][ah] = aP.value
                        bT.Text = aP.value.Text
                    end
                elseif type == "Dropdown" then
                    aC.Size = aC.Size + A(0, 0, 0, 39)
                    aP.value = {Dropdown = aN.options[1]}
                    local aQ = l("Frame")
                    local aR = l("TextButton")
                    local a1 = l("TextLabel")
                    local aS = l("ScrollingFrame")
                    local aT = l("TextButton")
                    local aU = l("TextLabel")
                    local a3 = l("UIListLayout")
                    local ae = l("ImageLabel")
                    local aV = l("TextLabel")
                    aQ.Name = "Dropdown"
                    aQ.Parent = aE
                    aQ.BackgroundColor3 = n(255, 255, 255)
                    aQ.BackgroundTransparency = 1.000
                    aQ.Position = A(0, 0, 0.255102038, 0)
                    aQ.Size = A(1, 0, 0, 39)
                    aR.Name = "Button"
                    aR.Parent = aQ
                    aR.BackgroundColor3 = n(0, 0, 0)
                    aR.BorderColor3 = n(27, 27, 35)
                    aR.Position = A(0, 30, 0, 16)
                    aR.Size = A(0, 175, 0, 17)
                    aR.AutoButtonColor = false
                    aR.Font = Enum.Font.SourceSans
                    aR.Text = ""
                    aR.TextColor3 = n(0, 0, 0)
                    aR.TextSize = 14.000
                    a1.Parent = aR
                    a1.BackgroundColor3 = n(255, 255, 255)
                    a1.BackgroundTransparency = 1.000
                    a1.BorderColor3 = n(27, 42, 53)
                    a1.Position = A(0, 5, 0, 0)
                    a1.Size = A(-0.21714285, 208, 1, 0)
                    a1.Font = Enum.Font.SourceSansSemibold
                    a1.Text = aP.value.Dropdown
                    a1.TextColor3 = n(200, 200, 200)
                    a1.TextSize = 14.000
                    a1.TextXAlignment = Enum.TextXAlignment.Left
                    local aW = a1
                    aS.Name = "Drop"
                    aS.Parent = aR
                    aS.Active = true
                    aS.BackgroundColor3 = n(0, 0, 0)
                    aS.BorderColor3 = n(27, 27, 35)
                    aS.Position = A(0, 0, 1, 1)
                    aS.Size = A(1, 0, 0, 20)
                    aS.Visible = false
                    aS.BottomImage = "http://www.roblox.com/asset/?id=6724808282"
                    aS.CanvasSize = A(1, 1, 1, 1)
                    aS.ScrollBarThickness = 0
                    aS.TopImage = "http://www.roblox.com/asset/?id=6724808282"
                    aS.MidImage = "http://www.roblox.com/asset/?id=6724808282"
                    aS.AutomaticCanvasSize = "Y"
                    aS.ZIndex = 5
                    aS.ScrollBarImageColor3 = L
                    a3.Parent = aS
                    a3.HorizontalAlignment = Enum.HorizontalAlignment.Center
                    a3.SortOrder = Enum.SortOrder.LayoutOrder
                    local aX = #aN.options
                    if aX > 5 then
                        aS.Size = A(1, 0, 0, 85)
                    else
                        aS.Size = A(1, 0, 0, 17 * aX)
                    end
                    local aq = true
                    for T, v in ipairs(aN.options) do
                        do
                            local aR = l("TextButton")
                            local a1 = l("TextLabel")
                            aR.Name = v
                            aR.Parent = aS
                            aR.BackgroundColor3 = n(0, 0, 0)
                            aR.BorderColor3 = n(27, 27, 35)
                            aR.Position = A(0, 30, 0, 16)
                            aR.Size = A(0, 175, 0, 17)
                            aR.AutoButtonColor = false
                            aR.Font = Enum.Font.SourceSans
                            aR.Text = ""
                            aR.TextColor3 = n(0, 0, 0)
                            aR.TextSize = 14.000
                            aR.BorderSizePixel = 0
                            aR.ZIndex = 6
                            a1.Parent = aR
                            a1.BackgroundColor3 = n(255, 255, 255)
                            a1.BackgroundTransparency = 1.000
                            a1.BorderColor3 = n(27, 42, 53)
                            a1.Position = A(0, 5, 0, -1)
                            a1.Size = A(-0.21714285, 208, 1, 0)
                            a1.Font = Enum.Font.SourceSansSemibold
                            a1.Text = v
                            a1.TextColor3 = n(200, 200, 200)
                            a1.TextSize = 14.000
                            a1.TextXAlignment = Enum.TextXAlignment.Left
                            a1.ZIndex = 6
                            aR.MouseButton1Down:Connect(
                                function()
                                    aS.Visible = false
                                    aP.value.Dropdown = v
                                    aW.Text = v
                                    values[as][aA][ah] = aP.value
                                    aO(aP.value)
                                    aS.CanvasPosition = i(0, 0)
                                end
                            )
                            aR.MouseEnter:Connect(
                                function()
                                    a:Tween(
                                        a1,
                                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                        {TextColor3 = n(255, 255, 255)}
                                    )
                                end
                            )
                            aR.MouseLeave:Connect(
                                function()
                                    a:Tween(
                                        a1,
                                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                        {TextColor3 = n(200, 200, 200)}
                                    )
                                end
                            )
                            aq = false
                        end
                    end
                    function aP:SetValue(b0)
                        aP.value = b0
                        aW.Text = b0.Dropdown
                        values[as][aA][ah] = aP.value
                        aO(b0)
                    end
                    ae.Parent = aR
                    ae.BackgroundColor3 = n(255, 255, 255)
                    ae.BackgroundTransparency = 1.000
                    ae.Position = A(0, 165, 0, 6)
                    ae.Size = A(0, 6, 0, 4)
                    ae.Image = "http://www.roblox.com/asset/?id=6724771531"
                    aV.Parent = aQ
                    aV.BackgroundColor3 = n(255, 255, 255)
                    aV.BackgroundTransparency = 1.000
                    aV.Position = A(0, 32, 0, -1)
                    aV.Size = A(0.111913361, 208, 0.382215232, 0)
                    aV.Font = Enum.Font.SourceSansSemibold
                    aV.Text = ah
                    aV.TextColor3 = n(200, 200, 200)
                    aV.TextSize = 14.000
                    aV.TextXAlignment = Enum.TextXAlignment.Left
                    aR.MouseButton1Down:Connect(
                        function()
                            aS.Visible = not aS.Visible
                            if not aS.Visible then
                                aS.CanvasPosition = i(0, 0)
                            end
                        end
                    )
                    local b1 = false
                    local b2 = false
                    aS.MouseEnter:Connect(
                        function()
                            b1 = true
                        end
                    )
                    aS.MouseLeave:Connect(
                        function()
                            b1 = false
                        end
                    )
                    aR.MouseEnter:Connect(
                        function()
                            b2 = true
                        end
                    )
                    aR.MouseLeave:Connect(
                        function()
                            b2 = false
                        end
                    )
                    game:GetService("UserInputService").InputBegan:Connect(
                        function(ao)
                            if
                                ao.UserInputType == Enum.UserInputType.MouseButton1 or
                                    ao.UserInputType == Enum.UserInputType.MouseButton2
                             then
                                if aS.Visible == true and not b1 and not b2 then
                                    aS.Visible = false
                                    aS.CanvasPosition = i(0, 0)
                                end
                            end
                        end
                    )
                    values[as][aA][ah] = aP.value
                elseif type == "Slider" then
                    aC.Size = aC.Size + A(0, 0, 0, 25)
                    local bB = l("Frame")
                    local a1 = l("TextLabel")
                    local aR = l("TextButton")
                    local ad = l("Frame")
                    local bC = l("UIGradient")
                    local bD = l("TextLabel")
                    bB.Name = "Slider"
                    bB.Parent = aE
                    bB.BackgroundColor3 = n(255, 255, 255)
                    bB.BackgroundTransparency = 1.000
                    bB.Position = A(0, 0, 0.653061211, 0)
                    bB.Size = A(1, 0, 0, 25)
                    a1.Parent = bB
                    a1.BackgroundColor3 = n(255, 255, 255)
                    a1.BackgroundTransparency = 1.000
                    a1.Position = A(0, 32, 0, -2)
                    a1.Size = A(0, 100, 0, 15)
                    a1.Font = Enum.Font.SourceSansSemibold
                    a1.Text = ah
                    a1.TextColor3 = n(200, 200, 200)
                    a1.TextSize = 14.000
                    a1.TextXAlignment = Enum.TextXAlignment.Left
                    aR.Name = "Button"
                    aR.Parent = bB
                    aR.BackgroundColor3 = n(0, 0, 0)
                    aR.BorderColor3 = n(27, 27, 35)
                    aR.Position = A(0, 30, 0, 15)
                    aR.Size = A(0, 175, 0, 5)
                    aR.AutoButtonColor = false
                    aR.Font = Enum.Font.SourceSans
                    aR.Text = ""
                    aR.TextColor3 = n(0, 0, 0)
                    aR.TextSize = 14.000
                    ad.Parent = aR
                    ad.BackgroundColor3 = n(255, 255, 255)
                    ad.BorderSizePixel = 0
                    ad.Size = A(0.5, 0, 1, 0)
                    bC.Color = ColorSequence.new {ColorSequenceKeypoint.new(0, L), ColorSequenceKeypoint.new(1, L)}
                    bC.Rotation = 90
                    bC.Parent = ad
                    bD.Name = "Value"
                    bD.Parent = bB
                    bD.BackgroundColor3 = n(255, 255, 255)
                    bD.BackgroundTransparency = 1.000
                    bD.Position = A(0, 150, 0, -1)
                    bD.Size = A(0, 55, 0, 15)
                    bD.Font = Enum.Font.SourceSansSemibold
                    bD.Text = "50"
                    bD.TextColor3 = n(200, 200, 200)
                    bD.TextSize = 14.000
                    bD.TextXAlignment = Enum.TextXAlignment.Right
                    local bE, bF, bG = aN.min or 0, aN.max or 100, aN.default or 0
                    aP.value = {Slider = bG}
                    function aP:SetValue(bd)
                        aP.value = bd
                        local X
                        if bE > 0 then
                            X = (aP.value.Slider - bE) / (bF - bE)
                        else
                            X = (aP.value.Slider - bE) / (bF - bE)
                        end
                        bD.Text = aP.value.Slider
                        ad.Size = A(X, 0, 1, 0)
                        values[as][aA][ah] = aP.value
                        aO(bd)
                    end
                    local X
                    if bE > 0 then
                        X = (aP.value.Slider - bE) / (bF - bE)
                    else
                        X = (aP.value.Slider - bE) / (bF - bE)
                    end
                    bD.Text = aP.value.Slider
                    ad.Size = A(X, 0, 1, 0)
                    values[as][aA][ah] = aP.value
                    local bH = game:GetService("UserInputService")
                    local bp = game.Players.LocalPlayer:GetMouse()
                    local b0
                    aR.MouseButton1Down:Connect(
                        function()
                            ad.Size = A(0, p(bp.X - ad.AbsolutePosition.X, 0, 175), 0, 5)
                            b0 = r((tonumber(bF) - tonumber(bE)) / 175 * ad.AbsoluteSize.X + tonumber(bE)) or 0
                            bD.Text = b0
                            aP.value.Slider = b0
                            values[as][aA][ah] = aP.value
                            aO(aP.value)
                            moveconnection =
                                bp.Move:Connect(
                                function()
                                    ad.Size = A(0, p(bp.X - ad.AbsolutePosition.X, 0, 175), 0, 5)
                                    b0 = r((tonumber(bF) - tonumber(bE)) / 175 * ad.AbsoluteSize.X + tonumber(bE))
                                    bD.Text = b0
                                    aP.value.Slider = b0
                                    values[as][aA][ah] = aP.value
                                    aO(aP.value)
                                end
                            )
                            releaseconnection =
                                bH.InputEnded:Connect(
                                function(aa)
                                    if aa.UserInputType == Enum.UserInputType.MouseButton1 then
                                        ad.Size = A(0, p(bp.X - ad.AbsolutePosition.X, 0, 175), 0, 5)
                                        b0 = r((tonumber(bF) - tonumber(bE)) / 175 * ad.AbsoluteSize.X + tonumber(bE))
                                        values[as][aA][ah] = aP.value
                                        aO(aP.value)
                                        moveconnection:Disconnect()
                                        releaseconnection:Disconnect()
                                    end
                                end
                            )
                        end
                    )
                elseif type == "Button" then
                    aC.Size = aC.Size + A(0, 0, 0, 24)
                    local aR = l("Frame")
                    local aT = l("TextButton")
                    local a1 = l("TextLabel")
                    aR.Name = "Button"
                    aR.Parent = aE
                    aR.BackgroundColor3 = n(255, 255, 255)
                    aR.BackgroundTransparency = 1.000
                    aR.Position = A(0, 0, 0.236059487, 0)
                    aR.Size = A(1, 0, 0, 24)
                    aT.Name = "Button"
                    aT.Parent = aR
                    aT.BackgroundColor3 = n(0, 0, 0)
                    aT.BorderColor3 = n(27, 27, 35)
                    aT.Position = A(0, 30, 0.5, -9)
                    aT.Size = A(0, 175, 0, 18)
                    aT.AutoButtonColor = false
                    aT.Font = Enum.Font.SourceSans
                    aT.Text = ""
                    aT.TextColor3 = n(0, 0, 0)
                    aT.TextSize = 14.000
                    a1.Parent = aT
                    a1.BackgroundColor3 = n(255, 255, 255)
                    a1.BackgroundTransparency = 1.000
                    a1.BorderColor3 = n(27, 42, 53)
                    a1.Size = A(1, 0, 1, 0)
                    a1.Font = Enum.Font.SourceSansSemibold
                    a1.Text = ah
                    a1.TextColor3 = n(200, 200, 200)
                    a1.TextSize = 14.000
                    function aP:SetValue()
                    end
                    aT.MouseButton1Down:Connect(
                        function()
                            a1.TextColor3 = L
                            a:Tween(
                                a1,
                                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {TextColor3 = n(200, 200, 200)}
                            )
                            aO()
                        end
                    )
                    aT.MouseEnter:Connect(
                        function()
                            a:Tween(
                                a1,
                                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {TextColor3 = n(255, 255, 255)}
                            )
                        end
                    )
                    aT.MouseLeave:Connect(
                        function()
                            a:Tween(
                                a1,
                                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {TextColor3 = n(200, 200, 200)}
                            )
                        end
                    )
                end
                e:Connect(
                    function(S)
                        pcall(
                            function()
                                local bI = a:ConfigFix(S)
                                if bI[as][aA][ah] ~= nil then
                                    aP:SetValue(bI[as][aA][ah])
                                end
                            end
                        )
                    end
                )
                return aP
            end
            return bJ
        end
        return at
    end
    _.Parent = game.CoreGui
    return Z
end
local aj = game:GetService("UserInputService")
local bU = game:GetService("ReplicatedStorage")
local bV = game:GetService("RunService")
local bW = game:GetService("Lighting")
local a8 = game:GetService("Players")
local a9 = a8.LocalPlayer
local bX = a9.PlayerGui
local aa = a9:GetMouse()
local bY = workspace.CurrentCamera
local bZ = a9.PlayerGui.Client
local b_ = getsenv(bZ)
local c0 = getsenv(a9.PlayerGui.GUI.Main.Chats.DisplayChat)
repeat
    bV.RenderStepped:Wait()
until game:IsLoaded()
local c1 = bX.GUI.Crosshairs
local c2 = bX.GUI.Crosshairs.Crosshair
local c3 = b_.createbullethole
local c4, c5, c6, c7, c8, c9
local ca = {}
local cb = {}
local cc = bU.Viewmodels
local cd = bU.Weapons
local ce = k(0, 0, 0)
local cf = {}
local cg = {}
local ch = workspace.Ray_Ignore
local ci
local cj = require(game.ReplicatedStorage.GetIcon)
local ck = l("BodyVelocity")
ck.MaxForce = j(w, 0, w)
local cl = {bY, workspace.Ray_Ignore, workspace.Debris}
local cm = l("Folder", workspace)
cm.Name = "Fakelag"
local cn = l("Animation", workspace)
cn.AnimationId = "rbxassetid://0"
local co = bU.Gloves
if co:FindFirstChild("ImageLabel") then
    co.ImageLabel:Destroy()
end
local cp = co.Models
local cq = {
    ["Head"] = 4,
    ["FakeHead"] = 4,
    ["HeadHB"] = 4,
    ["UpperTorso"] = 1,
    ["LowerTorso"] = 1.25,
    ["LeftUpperArm"] = 1,
    ["LeftLowerArm"] = 1,
    ["LeftHand"] = 1,
    ["RightUpperArm"] = 1,
    ["RightLowerArm"] = 1,
    ["RightHand"] = 1,
    ["LeftUpperLeg"] = 0.75,
    ["LeftLowerLeg"] = 0.75,
    ["LeftFoot"] = 0.75,
    ["RightUpperLeg"] = 0.75,
    ["RightLowerLeg"] = 0.75,
    ["RightFoot"] = 0.75
}
local cr = {}
local cs = {
    ["nebula"] = {
        SkyboxLf = "rbxassetid://159454286",
        SkyboxBk = "rbxassetid://159454299",
        SkyboxDn = "rbxassetid://159454296",
        SkyboxFt = "rbxassetid://159454293",
        SkyboxLf = "rbxassetid://159454286",
        SkyboxRt = "rbxassetid://159454300",
        SkyboxUp = "rbxassetid://159454288"
    },
    ["vaporwave"] = {
        SkyboxLf = "rbxassetid://1417494402",
        SkyboxBk = "rbxassetid://1417494030",
        SkyboxDn = "rbxassetid://1417494146",
        SkyboxFt = "rbxassetid://1417494253",
        SkyboxLf = "rbxassetid://1417494402",
        SkyboxRt = "rbxassetid://1417494499",
        SkyboxUp = "rbxassetid://1417494643"
    },
    ["clouds"] = {
        SkyboxLf = "rbxassetid://570557620",
        SkyboxBk = "rbxassetid://570557514",
        SkyboxDn = "rbxassetid://570557775",
        SkyboxFt = "rbxassetid://570557559",
        SkyboxLf = "rbxassetid://570557620",
        SkyboxRt = "rbxassetid://570557672",
        SkyboxUp = "rbxassetid://570557727"
    },
    ["twilight"] = {
        SkyboxLf = "rbxassetid://264909758",
        SkyboxBk = "rbxassetid://264908339",
        SkyboxDn = "rbxassetid://264907909",
        SkyboxFt = "rbxassetid://264909420",
        SkyboxLf = "rbxassetid://264909758",
        SkyboxRt = "rbxassetid://264908886",
        SkyboxUp = "rbxassetid://264907379"
    },
    ["Dababy"] = {
        SkyboxLf = "rbxassetid://7245418472",
        SkyboxBk = "rbxassetid://7245418472",
        SkyboxDn = "rbxassetid://7245418472",
        SkyboxFt = "rbxassetid://7245418472",
        SkyboxLf = "rbxassetid://7245418472",
        SkyboxRt = "rbxassetid://7245418472",
        SkyboxUp = "rbxassetid://7245418472"
    },
    ["MC"] = {
        SkyboxLf = "rbxassetid://1876543392",
        SkyboxBk = "rbxassetid://1876545003",
        SkyboxDn = "rbxassetid://1876544331",
        SkyboxFt = "rbxassetid://1876542941",
        SkyboxLf = "rbxassetid://1876543392",
        SkyboxRt = "rbxassetid://1876543764",
        SkyboxUp = "rbxassetid://1876544642"
    },
    ["Chill"] = {
        SkyboxLf = "rbxassetid://5103948542",
        SkyboxBk = "rbxassetid://5084575798",
        SkyboxDn = "rbxassetid://5084575916",
        SkyboxFt = "rbxassetid://5103949679",
        SkyboxLf = "rbxassetid://5103948542",
        SkyboxRt = "rbxassetid://5103948784",
        SkyboxUp = "rbxassetid://5084576400"
    }
}
local ct
do
    local cu = l("ScreenGui")
    local ad = l("Frame")
    local cv = l("Frame")
    cu.Enabled = false
    cu.ZIndexBehavior = Enum.ZIndexBehavior.Global
    cu.IgnoreGuiInset = true
    ad.Parent = cu
    ad.BackgroundColor3 = n(0, 0, 0)
    ad.BorderSizePixel = 0
    ad.Position = A(0, 0, 0.5, 0)
    ad.Size = A(1, 0, 0, 1)
    cv.Parent = cu
    cv.BackgroundColor3 = n(0, 0, 0)
    cv.BorderSizePixel = 0
    cv.Position = A(0.5, 0, 0, 0)
    cv.Size = A(0, 1, 1, 0)
    cu.Parent = game.CoreGui
    ct = cu
end
local cw
local function cx(cy)
    return j(cy.R, cy.G, cy.B)
end
local function cz(Y, cA)
    local cB = l(Y)
    for T, v in pairs(cA) do
        if T ~= "Parent" then
            cB[T] = v
        end
    end
    if cA["Parent"] ~= nil then
        cB.Parent = cA["Parent"]
    end
end
local function cC(cD)
    cD.Material = values.visuals.effects["accessory material"].Dropdown == "Smooth" and "SmoothPlastic" or "ForceField"
    cD.Mesh.VertexColor = cx(values.visuals.effects["accessory chams"].Color)
    cD.Color = values.visuals.effects["accessory chams"].Color
    cD.Transparency = values.visuals.effects["accessory chams"].Transparency
    if values.visuals.effects["accessory material"].Dropdown ~= "ForceField" then
        cD.Mesh.TextureId = ""
    else
        cD.Mesh.TextureId = cD.StringValue.Value
    end
end
local function cE(cD)
    cD.Material = "SmoothPlastic"
    cD.Mesh.VertexColor = j(1, 1, 1)
    cD.Mesh.TextureId = cD.StringValue.Value
    cD.Transparency = 0
end
local function cF(cB)
    local aH = values.visuals.effects["weapon material"].Dropdown
    if cB:IsA("MeshPart") then
        cB.TextureID = ""
    end
    if cB:IsA("Part") and cB:FindFirstChild("Mesh") and not cB:IsA("BlockMesh") then
        cB.Mesh.VertexColor = cx(values.visuals.effects["weapon chams"].Color)
        if aH == "Smooth" or aH == "Glass" then
            cB.Mesh.TextureId = ""
        else
            pcall(
                function()
                    cB.Mesh.TextureId = cB.Mesh.OriginalTexture.Value
                    cB.Mesh.TextureID = cB.Mesh.OriginalTexture.Value
                end
            )
        end
    end
    cB.Color = values.visuals.effects["weapon chams"].Color
    cB.Material =
        aH == "Smooth" and "SmoothPlastic" or aH == "Flat" and "Neon" or aH == "ForceField" and "ForceField" or "Glass"
    cB.Reflectance = values.visuals.effects["reflectance"].Slider / 10
    cB.Transparency = values.visuals.effects["weapon chams"].Transparency
end
local cG = bU.Skins
local function cH(cI, cJ, cK)
    if cK ~= nil then
        for b9, cL in pairs(cK) do
            local cM = bY.Arms:FindFirstChild(cL.Name)
            if cM ~= nil and cM.Transparency ~= 1 then
                cM.TextureId = cL.Value
            end
        end
    else
        local cN = cG:FindFirstChild(cI):FindFirstChild(cJ)
        if not cN:FindFirstChild("Animated") then
            for b9, cL in pairs(cN:GetChildren()) do
                local cM = bY.Arms:FindFirstChild(cL.Name)
                if cM ~= nil and cM.Transparency ~= 1 then
                    if cM:FindFirstChild("Mesh") then
                        cM.Mesh.TextureId = v.Value
                    elseif not cM:FindFirstChild("Mesh") then
                        cM.TextureID = cL.Value
                    end
                end
            end
        end
    end
end
local function cO(cP)
    for b9, cQ in pairs(a9.Character:GetChildren()) do
        if cQ:IsA("Accessory") then
            cQ:Destroy()
        end
        if cQ:IsA("BasePart") then
            if cP:FindFirstChild(cQ.Name) then
                cQ.Color = cP:FindFirstChild(cQ.Name).Color
                cQ.Transparency = cP:FindFirstChild(cQ.Name).Transparency
            end
            if cQ.Name == "FakeHead" then
                cQ.Color = cP:FindFirstChild("Head").Color
                cQ.Transparency = cP:FindFirstChild("Head").Transparency
            end
        end
        if
            (cQ.Name == "Head" or cQ.Name == "FakeHead") and cQ:FindFirstChildOfClass("Decal") and
                cP.Head:FindFirstChildOfClass("Decal")
         then
            cQ:FindFirstChildOfClass("Decal").Texture = cP.Head:FindFirstChildOfClass("Decal").Texture
        end
    end
    if cP:FindFirstChildOfClass("Shirt") then
        if a9.Character:FindFirstChildOfClass("Shirt") then
            a9.Character:FindFirstChildOfClass("Shirt"):Destroy()
        end
        local cR = cP:FindFirstChildOfClass("Shirt"):Clone()
        cR.Parent = a9.Character
    end
    if cP:FindFirstChildOfClass("Pants") then
        if a9.Character:FindFirstChildOfClass("Pants") then
            a9.Character:FindFirstChildOfClass("Pants"):Destroy()
        end
        local cR = cP:FindFirstChildOfClass("Pants"):Clone()
        cR.Parent = a9.Character
    end
    for b9, cQ in pairs(cP:GetChildren()) do
        if cQ:IsA("Accessory") then
            local cR = cQ:Clone()
            for b9, cS in pairs(cR.Handle:GetChildren()) do
                if cS:IsA("Weld") and cS.Part1 ~= nil then
                    cS.Part1 = a9.Character[cS.Part1.Name]
                end
            end
            cR.Parent = a9.Character
        end
    end
    if a9.Character:FindFirstChildOfClass("Shirt") then
        local cT = l("StringValue")
        cT.Name = "OriginalTexture"
        cT.Value = a9.Character:FindFirstChildOfClass("Shirt").ShirtTemplate
        cT.Parent = a9.Character:FindFirstChildOfClass("Shirt")
        if I(values.visuals.effects.removals.Jumbobox, "clothes") then
            a9.Character:FindFirstChildOfClass("Shirt").ShirtTemplate = ""
        end
    end
    if a9.Character:FindFirstChildOfClass("Pants") then
        local cT = l("StringValue")
        cT.Name = "OriginalTexture"
        cT.Value = a9.Character:FindFirstChildOfClass("Pants").PantsTemplate
        cT.Parent = a9.Character:FindFirstChildOfClass("Pants")
        if I(values.visuals.effects.removals.Jumbobox, "clothes") then
            a9.Character:FindFirstChildOfClass("Pants").PantsTemplate = ""
        end
    end
    for T, v in pairs(a9.Character:GetChildren()) do
        if v:IsA("BasePart") and v.Transparency ~= 1 then
            H(cb, v)
            local b4 = l("Color3Value")
            b4.Name = "OriginalColor"
            b4.Value = v.Color
            b4.Parent = v
            local cT = l("StringValue")
            cT.Name = "OriginalMaterial"
            cT.Value = v.Material.Name
            cT.Parent = v
        elseif v:IsA("Accessory") and v.Handle.Transparency ~= 1 then
            H(cb, v.Handle)
            local b4 = l("Color3Value")
            b4.Name = "OriginalColor"
            b4.Value = v.Handle.Color
            b4.Parent = v.Handle
            local cT = l("StringValue")
            cT.Name = "OriginalMaterial"
            cT.Value = v.Handle.Material.Name
            cT.Parent = v.Handle
        end
    end
    if values.visuals.self["self chams"].Toggle then
        for b9, cB in pairs(cb) do
            if cB.Parent ~= nil then
                cB.Material = values.visuals.self["self chams material"].Dropdown
                cB.Color = values.visuals.self["self chams"].Color
                cB.Transparency = values.visuals.self["self chams transparency"].Slider / 10
            end
        end
    end
end
local function cU(cV, cW)
    local cX = cV.LookVector
    local cY = k(cV.Position, cW).LookVector
    local cZ = s(cX:Dot(cY))
    local c_ = q(cZ)
    return c_
end
local d0 = game.Stats.PerformanceStats.Ping:GetValue()
for T, v in pairs(cc:GetChildren()) do
    if v:FindFirstChild("HumanoidRootPart") and v.HumanoidRootPart.Transparency ~= 1 then
        v.HumanoidRootPart.Transparency = 1
    end
end
local d1 = game:GetObjects("rbxassetid://7285197035")[1]
repeat
    wait()
until d1 ~= nil
local d2 = game:GetObjects("rbxassetid://7951832105")[1]
repeat
    wait()
until d2 ~= nil
local d3 = {
    "CT Knife",
    "T Knife",
    "Banana",
    "Bayonet",
    "Bearded Axe",
    "Butterfly Knife",
    "Cleaver",
    "Crowbar",
    "Falchion Knife",
    "Flip Knife",
    "Gut Knife",
    "Huntsman Knife",
    "Karambit",
    "Sickle"
}
local d4 = {}
for b9, d5 in pairs(co:GetChildren()) do
    if d5 ~= cp and d5.Name ~= "Racer" then
        d4[d5.Name] = {}
        for d6, d7 in pairs(d5:GetChildren()) do
            H(d4[d5.Name], d7.Name)
        end
    end
end
for T, v in pairs(d1.Knives:GetChildren()) do
    H(d3, v.Name)
end
local d8 = {}
local d9 = {}
local da = {}
for T, v in pairs(d2:GetChildren()) do
    H(da, v.Name)
end
local db = {
    {["Weapon"] = "AWP", ["SkinName"] = "Bot", ["Skin"] = {["Scope"] = "6572594838", ["Handle"] = "6572594077"}}
}
for b9, dc in pairs(db) do
    local dd = l("Folder")
    dd.Name = dc["SkinName"]
    dd.Parent = cG[dc["Weapon"]]
    for b9, de in pairs(dc["Skin"]) do
        local b0 = l("StringValue")
        b0.Name = b9
        b0.Value = "rbxassetid://" .. de
        b0.Parent = dd
    end
end
for T, v in pairs(cG:GetChildren()) do
    H(d9, v.Name)
end
K(
    d9,
    function(X, bL)
        return X < bL
    end
)
for T, v in ipairs(d9) do
    d8[v] = {}
    H(d8[v], "Inventory")
    for b9, df in pairs(cG[v]:GetChildren()) do
        if not df:FindFirstChild("Animated") then
            H(d8[v], df.Name)
        end
    end
end
makefolder("swansterlua")
bV.RenderStepped:Wait()
local dg = a:New("damonhook")
local dh = dg:Tab("legit")
local di = dg:Tab("rage")
local dj = dg:Tab("visuals")
local dk = dg:Tab("misc")
local dl = dg:Tab("griefing")
local db = dg:Tab("skins")
getgenv().api = {}
api.newtab = function(Y)
    return dg:Tab(Y)
end
api.newsection = function(aI, Y, az)
    return aI:Sector(Y, az)
end
api.newelement = function(dm, type, Y, aN, aO)
    dm:Element(type, Y, aN, aO)
end
local dn = db:Sector("knife", "Left")
dn:Element("Toggle", "knife changer")
dn:Element("Scroll", "model", {options = d3, Amount = 15})
local dp = db:Sector("glove", "Left")
dp:Element("Toggle", "glove changer")
dp:Element("ScrollDrop", "model", {options = d4, Amount = 9})
local dc = db:Sector("skins", "Right")
dc:Element("Toggle", "skin changer")
dc:Element("ScrollDrop", "skin", {options = d8, Amount = 15, alphabet = true})
local dq = db:Sector("characters", "Right")
dq:Element(
    "Toggle",
    "character changer",
    nil,
    function(N)
        if N.Toggle then
            if a9.Character and a9.Character:FindFirstChild("Gun") then
                cO(d2:FindFirstChild(values.skins.characters.skin.Scroll))
            end
        end
    end
)
dq:Element(
    "Scroll",
    "skin",
    {options = da, Amount = 9, alphabet = true},
    function(N)
        if values.skins.characters["character changer"].Toggle then
            if a9.Character and a9.Character:FindFirstChild("Gun") then
                cO(d2:FindFirstChild(N.Scroll))
            end
        end
    end
)
local dr = dh:Sector("aimbot", "Left")
dr:Element("ToggleKeybind", "aim assist")
dr:Element("ToggleKeybind", "silent aim")
dr:Element("ToggleKeybind", "triggerbot")
local ds = dh:MSector("main", "Left")
local bG = ds:Tab("default")
local dt = ds:Tab("pistol")
local du = ds:Tab("smg")
local dv = ds:Tab("rifle")
local dw = ds:Tab("sniper")
local function dx(at)
    at:Element("Jumbobox", "conditions", {options = {"visible", "standing", "blind", "smoke"}})
    at:Element("Dropdown", "target", {options = {"crosshair", "health", "distance"}})
    at:Element("Dropdown", "hitbox", {options = {"closest", "head", "chest"}})
    at:Element("Slider", "field of view", {min = 30, max = 420, default = 120})
    at:Element("Slider", "smoothing", {min = 1, max = 50, default = 1})
    at:Element("Toggle", "silent aim")
    at:Element("Slider", "hitchance", {min = 1, max = 100, default = 100})
    at:Element("Dropdown", "priority", {options = {"closest", "head", "chest"}})
    at:Element("Toggle", "triggerbot")
    at:Element("Slider", "delay (ms)", {min = 0, max = 300, default = 200})
    at:Element("Slider", "minimum dmg", {min = 0, max = 100, default = 15})
end
dx(bG)
dt:Element("Toggle", "override default")
dx(dt)
du:Element("Toggle", "override default")
dx(du)
dv:Element("Toggle", "override default")
dx(dv)
dw:Element("Toggle", "override default")
dx(dw)
local dy = dh:Sector("settings", "Right")
dy:Element("Toggle", "free for all")
dy:Element("Toggle", "forcefield check")
dy:Element("ToggleColor", "draw fov")
local dr = di:Sector("aimbot", "Left")
dr:Element("Toggle", "enabled")
dr:Element("Dropdown", "origin", {options = {"character", "camera"}})
dr:Element("Toggle", "silent aim")
dr:Element("Dropdown", "automatic fire", {options = {"off", "standard", "hitpart"}})
dr:Element("Toggle", "automatic penetration")
dr:Element("Jumbobox", "resolver", {options = {"Pitch", "Roll", "Animation"}})
dr:Element("Toggle", "delay shot")
dr:Element("Toggle", "force hit")
dr:Element("Dropdown", "prediction", {options = {"off", "cframe", "velocity"}})
dr:Element("Toggle", "sex package")
dr:Element("Toggle", "teammates")
dr:Element("Toggle", "auto baim")
dr:Element("Toggle", "knifebot")
dr:Element("Slider", "prediction hitchance", {min = 0, max = 400, default = 50})
local dz = di:MSector("weapons", "Left")
local bG = dz:Tab("default")
local dt = dz:Tab("pistol")
local dv = dz:Tab("rifle")
local dA = dz:Tab("scout")
local dB = dz:Tab("awp")
local dC = dz:Tab("auto")
local function dD(at)
    at:Element("Jumbobox", "hitboxes", {options = {"head", "torso", "pelvis"}})
    at:Element("Toggle", "prefer body")
    at:Element("Slider", "minimum damage", {min = -100, max = 100, default = 20})
    at:Element("Slider", "max fov", {min = 1, max = 180, default = 180})
end
dD(bG)
dt:Element("Toggle", "override default")
dD(dt)
dv:Element("Toggle", "override default")
dD(dv)
dA:Element("Toggle", "override default")
dD(dA)
dB:Element("Toggle", "override default")
dD(dB)
dC:Element("Toggle", "override default")
dD(dC)
local dE = di:Sector("angles", "Right")
dE:Element("Toggle", "enabled")
local b_ = getsenv(game.Players.LocalPlayer.PlayerGui.Client)
fakeduckloop = false
dE:Element(
    "Toggle",
    "fake duck",
    {},
    function(N)
        fakeduckloop = N.Toggle
        while fakeduckloop and syn do
            pcall(
                function()
                    wait(1)
                    local b_ = getsenv(game.Players.LocalPlayer.PlayerGui.Client)
                    local dF = nil
                    for T, v in pairs(debug.getupvalues(b_.setcharacter)) do
                        if type(v) == "userdata" and v.ClassName == "AnimationTrack" and v.Name == "Idle" then
                            dF = v
                        end
                    end
                    dF:Play()
                end
            )
        end
    end
)
dE:Element("Dropdown", "yaw base", {options = {"camera", "targets", "spin", "random"}})
dE:Element("Slider", "yaw offset", {min = -180, max = 180, default = 0})
dE:Element("Toggle", "jitter")
dE:Element("Slider", "jitter offset", {min = -180, max = 180, default = 0})
dE:Element(
    "Dropdown",
    "pitch",
    {
        options = {
            "None",
            "Up",
            "Down",
            "Huge",
            "Custom",
            "Zero",
            "180",
            "Random AA",
            "Swindler",
            "God",
            "Sus_down",
            "wtf",
            "glitch",
            "sussy",
            "fucker"
        }
    }
)
dE:Element("Slider", "pitch angle", {min = -100, max = 100, default = 0})
dE:Element("Toggle", "extend pitch")
dE:Element("Toggle", "underground aa")
dE:Element("Slider", "underground pos", {min = -200, max = 200, default = 4})
dE:Element("Dropdown", "body roll", {options = {"off", "180", "spin"}})
dE:Element("Slider", "spin speed", {min = 1, max = 48, default = 4})
local dG = di:Sector("others", "Right")
dG:Element("Toggle", "remove head")
dG:Element("Toggle", "no animations")
dG:Element("Dropdown", "leg movement", {options = {"off", "slide"}})
local dH = 0
local dI = di:Sector("fakelag", "Right")
dI:Element(
    "Toggle",
    "enabled",
    {default = {Toggle = false}},
    function(N)
        if N.Toggle then
        else
            cm:ClearAllChildren()
            game:GetService("NetworkClient"):SetOutgoingKBPSLimit(9e9)
        end
    end
)
dI:Element("Dropdown", "amount", {options = {"static", "dynamic"}})
dI:Element("Slider", "limit", {min = 1, max = 16, default = 8})
dI:Element(
    "ToggleColor",
    "visualize lag",
    {default = {Toggle = false, Color = n(255, 255, 255)}},
    function(N)
        if N.Toggle then
            for b9, cB in pairs(cm:GetChildren()) do
                cB.Color = N.Color
            end
        else
            cm:ClearAllChildren()
        end
    end
)
dI:Element("Dropdown", "visualize lag material", {options = {"Neon", "ForceField", "SmoothPlastic"}})
dI:Element("Slider", "visualize lag transparency", {min = 0, max = 10, default = 0})
dI:Element("ToggleKeybind", "ping spike")
coroutine.wrap(
    function()
        while wait(1 / 16) do
            dH = p(dH + 1, 0, values.rage.fakelag.limit.Slider)
            if a9.Character and a9.Character:FindFirstChild("UpperTorso") and values.rage.fakelag.enabled.Toggle then
                if
                    dH ==
                        (values.rage.fakelag.amount.Dropdown == "static" and values.rage.fakelag.limit.Slider or
                            t(1, values.rage.fakelag.limit.Slider))
                 then
                    game:GetService("NetworkClient"):SetOutgoingKBPSLimit(9e9)
                    cm:ClearAllChildren()
                    dH = 0
                    if values.rage.fakelag["visualize lag"].Toggle then
                        for b9, dJ in pairs(a9.Character:GetChildren()) do
                            if dJ:IsA("BasePart") and dJ.Name ~= "HumanoidRootPart" then
                                local dK = l("Part")
                                dK.CFrame = dJ.CFrame
                                dK.Anchored = true
                                dK.CanCollide = false
                                dK.Material = values.rage.fakelag["visualize lag material"].Dropdown
                                dK.Color = values.rage.fakelag["visualize lag"].Color
                                dK.Name = dJ.Name
                                dK.Transparency = values.rage.fakelag["visualize lag transparency"].Slider / 10
                                dK.Size = dJ.Size
                                dK.Parent = cm
                            end
                        end
                    end
                else
                    if values.rage.fakelag.enabled.Toggle then
                        game:GetService("NetworkClient"):SetOutgoingKBPSLimit(1)
                    end
                end
            else
                cm:ClearAllChildren()
                game:GetService("NetworkClient"):SetOutgoingKBPSLimit(9e9)
            end
        end
    end
)()
Peek = false
local dL = di:Sector("exploits", "Left")
dL:Element("ToggleKeybind", "triple tap")
dL:Element("ToggleKeybind", "kill all")
dL:Element("Slider", "quick peek vertical pos", {min = -500, max = 500, default = 200})
dL:Element(
    "ToggleKeybind",
    "quick peek",
    {},
    function(N)
        if N.Toggle and N.Active and a9.Character and Peek == false then
            if values.rage.exploits["loop peek"].Toggle == true and values.rage.exploits["quick peek"].Active == true then
                while values.rage.exploits["loop peek"].Toggle == true do
                    Peek = true
                    a9.Character.HumanoidRootPart.CFrame =
                        a9.Character.HumanoidRootPart.CFrame +
                        Vector3.new(0, values.rage.exploits["quick peek vertical pos"].Slider, 0)
                    wait(0.2)
                    Peek = false
                    a9.Character.HumanoidRootPart.CFrame =
                        a9.Character.HumanoidRootPart.CFrame -
                        Vector3.new(0, values.rage.exploits["quick peek vertical pos"].Slider, 0)
                    wait(0.2)
                end
            else
                Peek = true
                a9.Character.HumanoidRootPart.CFrame =
                    a9.Character.HumanoidRootPart.CFrame +
                    Vector3.new(0, values.rage.exploits["quick peek vertical pos"].Slider, 0)
                wait(0.2)
                Peek = false
                a9.Character.HumanoidRootPart.CFrame =
                    a9.Character.HumanoidRootPart.CFrame -
                    Vector3.new(0, values.rage.exploits["quick peek vertical pos"].Slider, 0)
            end
        elseif not N.Active then
            Peek = false
        end
    end
)
dL:Element("Toggle", "loop peek")
dL:Element(
    "Toggle",
    "debris clear",
    {},
    function(N)
        while values.rage.exploits["debris clear"].Toggle == true do
            wait(1)
            for T, v in pairs(workspace.Debris:GetDescendants()) do
                game:GetService("ReplicatedStorage").Events.DestroyObject:FireServer(v)
            end
        end
    end
)
local dM = {OldPeekPosition = CFrame.new()}
dL:Element(
    "ToggleKeybind",
    "auto peek",
    {},
    function(N)
        spawn(
            function()
                if N.Toggle and N.Active and a9.Character then
                    dM.OldPeekPosition = a9.Character.HumanoidRootPart.CFrame
                end
            end
        )
    end
)
dL:Element(
    "ToggleKeybind",
    "fakeframe",
    {},
    function(N)
        spawn(
            function()
                while values.rage.exploits["fakeframe"].Toggle == true and
                    values.rage.exploits["fakeframe"].Active == true do
                    wait()
                    game:GetService("NetworkClient"):SetOutgoingKBPSLimit(1)
                end
                game:GetService("NetworkClient"):SetOutgoingKBPSLimit(9e9)
            end
        )
    end
)
OldClientFireBullet = b_.firebullet
b_.firebullet = function(...)
    if values.rage.exploits["auto peek"].Toggle and values.rage.exploits["auto peek"].Active and a9.Character then
        a9.Character.HumanoidRootPart.CFrame = dM.OldPeekPosition
    end
    return OldClientFireBullet(...)
end
local dN = dj:Sector("players", "Left")
dN:Element("Toggle", "teammates")
dN:Element("ToggleColor", "box", {default = {Color = n(255, 255, 255)}})
dN:Element("ToggleColor", "name", {default = {Color = n(255, 255, 255)}})
dN:Element("Toggle", "health")
dN:Element("ToggleColor", "weapon", {default = {Color = n(255, 255, 255)}})
dN:Element("ToggleColor", "weapon icon", {default = {Color = n(255, 255, 255)}})
dN:Element("Jumbobox", "indicators", {options = {"armor"}})
dN:Element("Jumbobox", "outlines", {options = {"drawings", "text"}, default = {Jumbobox = {"drawings", "text"}}})
dN:Element("Dropdown", "font", {options = {"Plex", "Monospace", "System", "UI"}})
dN:Element("Slider", "size", {min = 12, max = 16, default = 13})
dN:Element(
    "ToggleColor",
    "chams",
    nil,
    function(N)
        for b9, Player in pairs(a8:GetPlayers()) do
            if Player.Character then
                for d6, cM in pairs(Player.Character:GetDescendants()) do
                    if cM.Name == "VisibleCham" or cM.Name == "WallCham" then
                        cM.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle
                        if N.Toggle then
                            if values.visuals.players.teammates.Toggle or Player.Team ~= a9.Team then
                                cM.Visible = true
                            else
                                cM.Visible = false
                            end
                        else
                            cM.Visible = false
                        end
                        cM.Color3 = N.Color
                    end
                end
            end
        end
    end
)
dN:Element("Toggle", "invisible chams")
local dO = dj:Sector("effects", "Right")
dO:Element(
    "ToggleTrans",
    "weapon chams",
    {default = {Color = n(255, 255, 255), Transparency = 0}},
    function(N)
        if ca == nil then
            return
        end
        if N.Toggle then
            for T, v in pairs(ca) do
                cF(v)
            end
        else
            for T, v in pairs(ca) do
                if v:IsA("MeshPart") then
                    v.TextureID = v.OriginalTexture.Value
                end
                if v:IsA("Part") and v:FindFirstChild("Mesh") and not v:IsA("BlockMesh") then
                    v.Mesh.TextureId = v.Mesh.OriginalTexture.Value
                    v.Mesh.VertexColor = j(1, 1, 1)
                end
                v.Color = v.OriginalColor.Value
                v.Material = v.OriginalMaterial.Value
                v.Transparency = 0
            end
        end
    end
)
dO:Element(
    "Dropdown",
    "weapon material",
    {options = {"Smooth", "Flat", "ForceField", "Glass"}},
    function(N)
        if ca == nil then
            return
        end
        if values.visuals.effects["weapon chams"].Toggle then
            for T, v in pairs(ca) do
                cF(v)
            end
        end
    end
)
dO:Element(
    "Slider",
    "reflectance",
    {min = 0, max = 100, default = 0},
    function(N)
        if values.visuals.effects["weapon chams"].Toggle then
            for T, v in pairs(ca) do
                cF(v)
            end
        end
    end
)
dO:Element(
    "ToggleTrans",
    "accessory chams",
    {default = {Color = n(255, 255, 255)}},
    function(b0)
        if c8 == nil or c9 == nil then
            return
        end
        if b0.Toggle then
            if c5 ~= nil then
                cC(c5)
            end
            if c7 ~= nil then
                cC(c7)
            end
            if c4 ~= nil then
                cC(c4)
            end
            if c6 ~= nil then
                cC(c6)
            end
        else
            if c5 then
                cE(c5)
            end
            if c4 then
                cE(c4)
            end
            if c7 then
                cE(c7)
            end
            if c6 then
                cE(c6)
            end
        end
    end
)
dO:Element(
    "Dropdown",
    "accessory material",
    {options = {"Smooth", "ForceField"}},
    function(b0)
        if c8 == nil or c9 == nil then
            return
        end
        if values.visuals.effects["accessory chams"].Toggle then
            if c5 ~= nil then
                cC(c5)
            end
            if c7 ~= nil then
                cC(c7)
            end
            if c4 ~= nil then
                cC(c4)
            end
            if c6 ~= nil then
                cC(c6)
            end
        end
    end
)
dO:Element(
    "ToggleTrans",
    "arm chams",
    {default = {Color = n(255, 255, 255)}},
    function(b0)
        if c8 == nil then
            return
        end
        if c9 == nil then
            return
        end
        if b0.Toggle then
            c8.Color = b0.Color
            c9.Color = b0.Color
            c8.Transparency = b0.Transparency
            c9.Transparency = b0.Transparency
        else
            c8.Color = c8.Color3Value.Value
            c9.Color = c8.Color3Value.Value
            c8.Transparency = 0
            c9.Transparency = 0
        end
    end
)
dO:Element(
    "Jumbobox",
    "removals",
    {options = {"scope", "scope lines", "flash", "smoke", "decals", "shadows", "clothes"}},
    function(b0)
        local N = b0.Jumbobox
        if I(N, "decals") then
            b_.createbullethole = function()
            end
            for T, v in pairs(workspace.Debris:GetChildren()) do
                if v.Name == "Bullet" or v.Name == "SurfaceGui" then
                    v:Destroy()
                end
            end
        else
            b_.createbullethole = c3
        end
        if I(N, "clothes") then
            if a9.Character and a9.Character:FindFirstChild("UpperTorso") then
                if a9.Character:FindFirstChild("Shirt") then
                    a9.Character:FindFirstChild("Shirt").ShirtTemplate = ""
                end
                if a9.Character:FindFirstChild("Pants") then
                    a9.Character:FindFirstChild("Pants").PantsTemplate = ""
                end
            end
        else
            if a9.Character and a9.Character:FindFirstChild("UpperTorso") then
                if a9.Character:FindFirstChild("Shirt") then
                    a9.Character:FindFirstChild("Shirt").ShirtTemplate =
                        a9.Character:FindFirstChild("Shirt").OriginalTexture.Value
                end
                if a9.Character:FindFirstChild("Pants") then
                    a9.Character:FindFirstChild("Pants").PantsTemplate =
                        a9.Character:FindFirstChild("Pants").OriginalTexture.Value
                end
            end
        end
        if I(N, "scope") then
            c1.Scope.ImageTransparency = 1
            c1.Scope.Scope.ImageTransparency = 1
            c1.Frame1.Transparency = 1
            c1.Frame2.Transparency = 1
            c1.Frame3.Transparency = 1
            c1.Frame4.Transparency = 1
        else
            c1.Scope.ImageTransparency = 0
            c1.Scope.Scope.ImageTransparency = 0
            c1.Frame1.Transparency = 0
            c1.Frame2.Transparency = 0
            c1.Frame3.Transparency = 0
            c1.Frame4.Transparency = 0
        end
        bX.Blnd.Enabled = not I(N, "flash") and true or false
        bW.GlobalShadows = not I(N, "shadows") and true or false
        if ch:FindFirstChild("Smokes") then
            if I(N, "smoke") then
                for T, dP in pairs(ch.Smokes:GetChildren()) do
                    dP.ParticleEmitter.Rate = 0
                end
            else
                for T, dP in pairs(ch.Smokes:GetChildren()) do
                    dP.ParticleEmitter.Rate = dP.OriginalRate.Value
                end
            end
        end
    end
)
dO:Element("Toggle", "force crosshair")
dO:Element(
    "ToggleColor",
    "world color",
    {default = {Color = n(255, 255, 255)}},
    function(b0)
        if b0.Toggle then
            bY.ColorCorrection.TintColor = b0.Color
        else
            bY.ColorCorrection.TintColor = n(255, 255, 255)
        end
    end
)
dO:Element(
    "ToggleColor",
    "Ambient",
    {default = {Color = n(255, 255, 255)}},
    function(b0)
        if b0.Toggle then
            game.Lighting.ColorShift_Bottom = b0.Color
            game.Lighting.ColorShift_Top = b0.Color
            game.Lighting.OutdoorAmbient = b0.Color
            game.Lighting.ColorShift_Bottom = b0.Color
            game.Lighting.ColorShift_Top = b0.Color
        else
            game.Lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
            game.Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
            game.Lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
            game.Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
        end
    end
)
dO:Element(
    "Toggle",
    "shadowmap technology",
    nil,
    function(b0)
        sethiddenproperty(bW, "Technology", b0.Toggle and "ShadowMap" or "Legacy")
    end
)
local self = dj:Sector("self", "Right")
self:Element(
    "ToggleKeybind",
    "third person",
    {},
    function(N)
        if a9.Character and a9.Character:FindFirstChild("Humanoid") then
            if N.Toggle then
                if N.Active then
                    a9.CameraMaxZoomDistance = values.visuals.self.distance.Slider
                    a9.CameraMinZoomDistance = values.visuals.self.distance.Slider
                    a9.CameraMaxZoomDistance = values.visuals.self.distance.Slider
                    a9.CameraMinZoomDistance = values.visuals.self.distance.Slider
                else
                    a9.CameraMaxZoomDistance = 0
                    a9.CameraMinZoomDistance = 0
                    a9.CameraMaxZoomDistance = 0
                    a9.CameraMinZoomDistance = 0
                end
            else
                a9.CameraMaxZoomDistance = 0
                a9.CameraMinZoomDistance = 0
            end
        end
    end
)
self:Element(
    "Slider",
    "distance",
    {min = 6, max = 18, default = 12},
    function(N)
        if a9.Character and a9.Character:FindFirstChild("Humanoid") then
            if values.visuals.self["third person"].Toggle then
                if values.visuals.self["third person"].Active then
                    a9.CameraMaxZoomDistance = N.Slider
                    a9.CameraMinZoomDistance = N.Slider
                    a9.CameraMaxZoomDistance = N.Slider
                    a9.CameraMinZoomDistance = N.Slider
                else
                    a9.CameraMaxZoomDistance = 0
                    a9.CameraMinZoomDistance = 0
                end
            else
                a9.CameraMaxZoomDistance = 0
                a9.CameraMinZoomDistance = 0
            end
        end
    end
)
a9:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(
    function(dQ)
        if values.visuals.self["third person"].Toggle then
            if values.visuals.self["third person"].Active then
                if dQ ~= values.visuals.self.distance.Slider then
                    a9.CameraMinZoomDistance = values.visuals.self.distance.Slider
                end
            end
        end
    end
)
self:Element(
    "Slider",
    "fov changer",
    {min = 0, max = 120, default = 80},
    function(bd)
        bV.RenderStepped:Wait()
        if a9.Character == nil then
            return
        end
        if fov == bd.Slider then
            return
        end
        if values.visuals.self["on scope"].Toggle or not a9.Character:FindFirstChild("AIMING") then
            bY.FieldOfView = bd.Slider
        end
    end
)
self:Element("Toggle", "on scope")
self:Element("Toggle", "viewmodel changer")
self:Element(
    "Slider",
    "viewmodel x",
    {min = -30, max = 30},
    function(b0)
        ce =
            k(
            values.visuals.self["viewmodel x"].Slider / 7,
            values.visuals.self["viewmodel y"].Slider / 7,
            values.visuals.self["viewmodel z"].Slider / 7
        ) * B(0, 0, values.visuals.self.roll.Slider / 50)
    end
)
self:Element(
    "Slider",
    "viewmodel y",
    {min = -30, max = 30},
    function(b0)
        ce =
            k(
            values.visuals.self["viewmodel x"].Slider / 7,
            values.visuals.self["viewmodel y"].Slider / 7,
            values.visuals.self["viewmodel z"].Slider / 7
        ) * B(0, 0, values.visuals.self.roll.Slider / 50)
    end
)
self:Element(
    "Slider",
    "viewmodel z",
    {min = -30, max = 30},
    function(b0)
        ce =
            k(
            values.visuals.self["viewmodel x"].Slider / 7,
            values.visuals.self["viewmodel y"].Slider / 7,
            values.visuals.self["viewmodel z"].Slider / 7
        ) * B(0, 0, values.visuals.self.roll.Slider / 50)
    end
)
self:Element(
    "Slider",
    "roll",
    {min = -100, max = 100},
    function(b0)
        ce =
            k(
            values.visuals.self["viewmodel x"].Slider / 7,
            values.visuals.self["viewmodel y"].Slider / 7,
            values.visuals.self["viewmodel z"].Slider / 7
        ) * B(0, 0, values.visuals.self.roll.Slider / 50)
    end
)
self:Element(
    "ToggleColor",
    "self chams",
    {default = {Color = n(255, 255, 255)}},
    function(N)
        if N.Toggle then
            for b9, cB in pairs(cb) do
                if cB.Parent ~= nil then
                    cB.Material = values.visuals.self["self chams material"].Dropdown
                    cB.Color = values.visuals.self["self chams"].Color
                    cB.Transparency = values.visuals.self["self chams transparency"].Slider / 10
                end
            end
        else
            for b9, cB in pairs(cb) do
                if cB.Parent ~= nil then
                    cB.Material = values.visuals.self["self chams material"].Dropdown
                    cB.Color = values.visuals.self["self chams"].Color
                    cB.Transparency = values.visuals.self["self chams transparency"].Slider / 10
                end
            end
        end
    end
)
self:Element("Dropdown", "self chams material", {options = {"ForceField", "Neon", "SmoothPlastic"}})
self:Element("Slider", "self chams transparency", {min = 0, max = 10})
self:Element("Slider", "scope blend", {min = 0, max = 100, default = 0})
local dR = b_.updateads
b_.updateads = function(self, ...)
    local dS = {...}
    coroutine.wrap(
        function()
            wait()
            if a9.Character ~= nil then
                for b9, dK in pairs(a9.Character:GetDescendants()) do
                    if dK:IsA("Part") or dK:IsA("MeshPart") then
                        if dK.Transparency ~= 1 then
                            dK.Transparency =
                                a9.Character:FindFirstChild("AIMING") and
                                values.visuals.self["scope blend"].Slider / 100 or
                                0
                        end
                    end
                    if dK:IsA("Accessory") then
                        dK.Handle.Transparency =
                            a9.Character:FindFirstChild("AIMING") and values.visuals.self["scope blend"].Slider / 100 or
                            0
                    end
                end
            end
        end
    )()
    return dR(self, ...)
end
local dT = dj:Sector("world", "Left")
dT:Element(
    "ToggleTrans",
    "molly radius",
    {default = {Color = n(255, 0, 0)}},
    function(N)
        if ch:FindFirstChild("Fires") == nil then
            return
        end
        if N.Toggle then
            for T, dU in pairs(ch:FindFirstChild("Fires"):GetChildren()) do
                dU.Transparency = N.Transparency
                dU.Color = N.Color
            end
        else
            for T, dU in pairs(ch:FindFirstChild("Fires"):GetChildren()) do
                dU.Transparency = 1
            end
        end
    end
)
dT:Element(
    "ToggleColor",
    "smoke radius",
    {default = {Color = n(0, 255, 0)}},
    function(N)
        if ch:FindFirstChild("Smokes") == nil then
            return
        end
        if N.Toggle then
            for T, dP in pairs(ch:FindFirstChild("Smokes"):GetChildren()) do
                dP.Transparency = 0
                dP.Color = N.Color
            end
        else
            for T, dP in pairs(ch:FindFirstChild("Smokes"):GetChildren()) do
                dP.Transparency = 1
            end
        end
    end
)
dT:Element("ToggleColor", "bullet tracers", {default = {Color = n(0, 0, 255)}})
dT:Element("Dropdown", "bullet tracers type", {options = {"Normal", "Drawing"}})
dT:Element("ToggleColor", "impacts", {default = {Color = n(255, 0, 0)}})
dT:Element("ToggleColor", "hit chams", {default = {Color = n(0, 0, 255)}})
dT:Element(
    "Dropdown",
    "hitsound",
    {
        options = {
            "none",
            "skeet",
            "neverlose",
            "rust",
            "bag",
            "baimware",
            "osu",
            "Tf2",
            "Tf2 pan",
            "M55solix",
            "Slap",
            "1",
            "Minecraft",
            "jojo",
            "vibe",
            "supersmash",
            "epic",
            "retro",
            "quek"
        }
    }
)
dT:Element("Slider", "sound volume", {min = 1, max = 5, default = 3})
dT:Element(
    "Dropdown",
    "skybox",
    {options = {"none", "nebula", "vaporwave", "clouds", "MC", "Dababy", "Rezero", "Chill"}},
    function(N)
        local dV = N.Dropdown
        if dV ~= "none" then
            if bW:FindFirstChildOfClass("Sky") then
                bW:FindFirstChildOfClass("Sky"):Destroy()
            end
            local dW = l("Sky")
            dW.SkyboxLf = cs[dV].SkyboxLf
            dW.SkyboxBk = cs[dV].SkyboxBk
            dW.SkyboxDn = cs[dV].SkyboxDn
            dW.SkyboxFt = cs[dV].SkyboxFt
            dW.SkyboxRt = cs[dV].SkyboxRt
            dW.SkyboxUp = cs[dV].SkyboxUp
            dW.Name = "override"
            dW.Parent = bW
        else
            if bW:FindFirstChildOfClass("Sky") then
                bW:FindFirstChildOfClass("Sky"):Destroy()
            end
            if cw ~= nil then
                cw:Clone().Parent = bW
            end
        end
    end
)
dT:Element(
    "ToggleColor",
    "item esp",
    {default = {Color = n(255, 255, 255)}},
    function(N)
        for T, dX in pairs(workspace.Debris:GetChildren()) do
            if dX:IsA("BasePart") and cd:FindFirstChild(dX.Name) then
                dX.BillboardGui.ImageLabel.Visible =
                    N.Toggle and I(values.visuals.world["types"].Jumbobox, "icon") and true or false
            end
        end
    end
)
dT:Element(
    "Jumbobox",
    "types",
    {options = {"icon"}},
    function(N)
        for T, dX in pairs(workspace.Debris:GetChildren()) do
            if dX:IsA("BasePart") and cd:FindFirstChild(dX.Name) then
                dX.BillboardGui.ImageLabel.Visible =
                    values.visuals.world["item esp"].Toggle and I(N.Jumbobox, "icon") and true or false
                dX.BillboardGui.ImageLabel.ImageColor3 = values.visuals.world["item esp"].Color
            end
        end
    end
)
local dY = dk:Sector("configs", "Left")
dY:Element("TextBox", "config", {placeholder = "config name"})
dY:Element(
    "Button",
    "save",
    {},
    function()
        if values.misc.configs.config.Text ~= "" then
            a:SaveConfig(values.misc.configs.config.Text)
        end
    end
)
dY:Element(
    "Button",
    "load",
    {},
    function()
        if values.misc.configs.config.Text ~= "" then
            e:Fire(values.misc.configs.config.Text)
        end
    end
)
dY:Element(
    "Toggle",
    "keybind list",
    nil,
    function(N)
        a:SetKeybindVisible(N.Toggle)
    end
)
local dZ = dk:Sector("crosshair editor", "Right")
local function d_()
    if values.misc["crosshair editor"].enabled.Toggle then
        local e0 = values.misc["crosshair editor"].length.Slider
        c2.LeftFrame.Size = A(0, e0, 0, 2)
        c2.RightFrame.Size = A(0, e0, 0, 2)
        c2.TopFrame.Size = A(0, 2, 0, e0)
        c2.BottomFrame.Size = A(0, 2, 0, e0)
        for b9, e1 in pairs(c2:GetChildren()) do
            if C(e1.Name, "Frame") then
                e1.BorderColor3 = m(0, 0, 0)
                if values.misc["crosshair editor"].border.Toggle then
                    e1.BorderSizePixel = 1
                else
                    e1.BorderSizePixel = 0
                end
            end
        end
    else
        c2.LeftFrame.Size = A(0, 10, 0, 2)
        c2.RightFrame.Size = A(0, 10, 0, 2)
        c2.TopFrame.Size = A(0, 2, 0, 10)
        c2.BottomFrame.Size = A(0, 2, 0, 10)
        for b9, e1 in pairs(c2:GetChildren()) do
            if C(e1.Name, "Frame") then
                e1.BorderSizePixel = 0
            end
        end
    end
end
dZ:Element("Toggle", "enabled", nil, d_)
dZ:Element("Slider", "length", {min = 1, max = 15, default = 10}, d_)
dZ:Element("Toggle", "border", nil, d_)
local e2 = dk:Sector("client", "Right")
e2:Element(
    "Toggle",
    "infinite cash",
    nil,
    function(N)
        if N.Toggle then
            a9.Cash.Value = 8000
        end
    end
)
e2:Element("Toggle", "infinite crouch")
e2:Element("Jumbobox", "damage bypass", {options = {"fire", "fall"}})
e2:Element(
    "Jumbobox",
    "gun modifiers",
    {options = {"recoil", "spread", "reload", "equip", "ammo", "automatic", "penetration", "firerate"}}
)
e2:Element(
    "Toggle",
    "remove killers",
    {},
    function(N)
        if N.Toggle then
            if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("Killers") then
                local e3 = workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Clone()
                e3.Name = "KillersClone"
                e3.Parent = workspace:FindFirstChild("Map")
                workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Destroy()
            end
        else
            if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("KillersClone") then
                workspace:FindFirstChild("Map"):FindFirstChild("KillersClone").Name = "Killers"
            end
        end
    end
)
e2:Element("ToggleColor", "hitmarker", {default = {Color = n(255, 255, 255)}})
e2:Element("Toggle", "buy any grenade")
e2:Element("Toggle", "chat alive")
e2:Element("Jumbobox", "shop", {options = {"inf time", "anywhere"}})
e2:Element("Toggle", "anti spectate")
e2:Element("Toggle", "upside down spectate")
local e4 = Instance.new("ColorCorrectionEffect", workspace.CurrentCamera)
e2:Element(
    "Toggle",
    "Boost Saturation",
    {},
    function(N)
        if N.Toggle then
            e4.Saturation = 1.4
        else
            e4.Saturation = 0
        end
    end
)
e2:Element(
    "Toggle",
    "specators list",
    {},
    function(N)
        if N.Toggle then
            local e5 = Instance.new("ScreenGui")
            local e6 = Instance.new("Frame")
            local e7 = Instance.new("Frame")
            local aM = Instance.new("UIPadding")
            local e8 = Instance.new("TextLabel")
            local a8 = Instance.new("TextLabel")
            local e9 = Instance.new("Frame")
            local bC = Instance.new("UIGradient")
            local b4 = Instance.new("Frame")
            local ea = Instance.new("UIGradient")
            e5.Parent = game.CoreGui
            e5.Name = "SpectatorsList"
            e5.Enabled = true
            e6.Name = "Spectators"
            e6.Parent = e5
            e6.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
            e6.BackgroundTransparency = 1.000
            e6.BorderColor3 = Color3.fromRGB(255, 189, 222)
            e6.Position = UDim2.new(0.00800000038, 0, 0.400000006, 49)
            e6.Size = UDim2.new(0, 200, 0, 20)
            e7.Name = "Container"
            e7.Parent = e6
            e7.BackgroundTransparency = 1.000
            e7.BorderSizePixel = 0
            e7.Position = UDim2.new(0, 0, 0, 4)
            e7.Size = UDim2.new(1, 0, 0, 14)
            e7.ZIndex = 3
            aM.Parent = e7
            aM.PaddingLeft = UDim.new(0, 4)
            e8.Name = "Text"
            e8.Parent = e7
            e8.BackgroundTransparency = 1.000
            e8.Size = UDim2.new(1, 0, 1, 0)
            e8.ZIndex = 4
            e8.Font = Enum.Font.Code
            e8.Text = "spectators"
            e8.TextColor3 = Color3.fromRGB(65025, 65025, 65025)
            e8.TextSize = 13.000
            e8.TextStrokeTransparency = 0.000
            a8.Name = "Players"
            a8.Parent = e7
            a8.BackgroundTransparency = 1.000
            a8.Position = UDim2.new(0.0196080022, 0, 1.44285719, 0)
            a8.Size = UDim2.new(0.980391979, 0, 1.14285719, 0)
            a8.ZIndex = 4
            a8.Font = Enum.Font.Code
            a8.Text = "loading"
            a8.TextColor3 = Color3.fromRGB(65025, 65025, 65025)
            a8.TextSize = 12.000
            a8.TextStrokeTransparency = 0.000
            a8.TextYAlignment = Enum.TextYAlignment.Top
            e9.Name = "Background"
            e9.Parent = e6
            e9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            e9.BorderColor3 = Color3.fromRGB(255, 189, 222)
            e9.Size = UDim2.new(1, 0, 1, 0)
            bC.Color =
                ColorSequence.new {
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 22, 22)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(22, 22, 22))
            }
            bC.Rotation = 90
            bC.Parent = e9
            b4.Name = "Color"
            b4.Parent = e6
            b4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            b4.BorderSizePixel = 0
            b4.Size = UDim2.new(1, 0, 0, 2)
            b4.ZIndex = 2
            ea.Color =
                ColorSequence.new {
                ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 146, 110)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(9, 84, 59))
            }
            ea.Rotation = 90
            ea.Parent = b4
            function GetSpectators()
                local eb = ""
                for T, v in pairs(game.Players:GetChildren()) do
                    pcall(
                        function()
                            if v ~= game.Players.LocalPlayer then
                                if not v.Character then
                                    if (v.CameraCF.Value.p - game.Workspace.CurrentCamera.CFrame.p).Magnitude < 10 then
                                        if eb == "" then
                                            eb = v.Name
                                        else
                                            eb = eb .. "\n" .. v.Name
                                        end
                                    end
                                end
                            end
                        end
                    )
                end
                return eb
            end
            spawn(
                function()
                    while wait(0.1) do
                        if e5.Enabled then
                            a8.Text = GetSpectators()
                        end
                    end
                end
            )
            local function ec()
                local ed = Instance.new("LocalScript", e6)
                local dg = ed.Parent
                dg.Draggable = true
                dg.Active = true
            end
            coroutine.wrap(ec)()
        else
            game.CoreGui.SpectatorsList:Destroy()
        end
    end
)
e2:Element(
    "Toggle",
    "keystrokes",
    {},
    function(N)
        if N.Toggle then
            local ee = Instance.new("ScreenGui")
            local ef = Instance.new("TextLabel")
            local eg = Instance.new("TextLabel")
            local eh = Instance.new("TextLabel")
            local ei = Instance.new("TextLabel")
            local ej = Instance.new("TextLabel")
            local ek = Instance.new("TextLabel")
            local b9 = Instance.new("TextLabel")
            local d6 = Instance.new("TextLabel")
            local el = Instance.new("TextLabel")
            local em = Instance.new("TextLabel")
            local en = Instance.new("TextLabel")
            local eo = Instance.new("TextLabel")
            ee.Parent = game.CoreGui
            ee.Name = "keystrokess"
            ef.Name = "W"
            ef.Parent = ee
            ef.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ef.BackgroundTransparency = 1.000
            ef.Position = UDim2.new(0.488053292, 0, 0.728395104, 0)
            ef.Size = UDim2.new(0, 29, 0, 28)
            ef.Visible = false
            ef.Font = Enum.Font.Code
            ef.Text = "W"
            ef.TextColor3 = Color3.fromRGB(255, 255, 255)
            ef.TextSize = 14.000
            ef.TextStrokeTransparency = 0.000
            b9.Name = "_"
            b9.Parent = ee
            b9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            b9.BackgroundTransparency = 1.000
            b9.Position = UDim2.new(0.488053292, 0, 0.728395104, 0)
            b9.Size = UDim2.new(0, 29, 0, 28)
            b9.Visible = true
            b9.Font = Enum.Font.Code
            b9.Text = "_"
            b9.TextColor3 = Color3.fromRGB(255, 255, 255)
            b9.TextSize = 14.000
            b9.TextStrokeTransparency = 0.000
            eg.Name = "A"
            eg.Parent = ee
            eg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            eg.BackgroundTransparency = 1.000
            eg.Position = UDim2.new(0.453584045, 0, 0.777777791, 0)
            eg.Size = UDim2.new(0, 29, 0, 28)
            eg.Visible = false
            eg.Font = Enum.Font.Code
            eg.Text = "A"
            eg.TextColor3 = Color3.fromRGB(255, 255, 255)
            eg.TextSize = 14.000
            eg.TextStrokeTransparency = 0.000
            d6.Name = "_2"
            d6.Parent = ee
            d6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            d6.BackgroundTransparency = 1.000
            d6.Position = UDim2.new(0.453584045, 0, 0.777777791, 0)
            d6.Size = UDim2.new(0, 29, 0, 28)
            d6.Visible = true
            d6.Font = Enum.Font.Code
            d6.Text = "_"
            d6.TextColor3 = Color3.fromRGB(255, 255, 255)
            d6.TextSize = 14.000
            d6.TextStrokeTransparency = 0.000
            eh.Name = "S"
            eh.Parent = ee
            eh.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            eh.BackgroundTransparency = 1.000
            eh.Position = UDim2.new(0.488053292, 0, 0.777777791, 0)
            eh.Size = UDim2.new(0, 29, 0, 28)
            eh.Visible = false
            eh.Font = Enum.Font.Code
            eh.Text = "S"
            eh.TextColor3 = Color3.fromRGB(255, 255, 255)
            eh.TextSize = 14.000
            eh.TextStrokeTransparency = 0.000
            el.Name = "_3"
            el.Parent = ee
            el.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            el.BackgroundTransparency = 1.000
            el.Position = UDim2.new(0.488053292, 0, 0.777777791, 0)
            el.Size = UDim2.new(0, 29, 0, 28)
            el.Visible = true
            el.Font = Enum.Font.Code
            el.Text = "_"
            el.TextColor3 = Color3.fromRGB(255, 255, 255)
            el.TextSize = 14.000
            el.TextStrokeTransparency = 0.000
            ei.Name = "D"
            ei.Parent = ee
            ei.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ei.BackgroundTransparency = 1.000
            ei.Position = UDim2.new(0.522522688, 0, 0.777777791, 0)
            ei.Size = UDim2.new(0, 29, 0, 28)
            ei.Visible = false
            ei.Font = Enum.Font.Code
            ei.Text = "D"
            ei.TextColor3 = Color3.fromRGB(255, 255, 255)
            ei.TextSize = 14.000
            ei.TextStrokeTransparency = 0.000
            em.Name = "_4"
            em.Parent = ee
            em.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            em.BackgroundTransparency = 1.000
            em.Position = UDim2.new(0.522522688, 0, 0.777777791, 0)
            em.Size = UDim2.new(0, 29, 0, 28)
            em.Visible = true
            em.Font = Enum.Font.Code
            em.Text = "_"
            em.TextColor3 = Color3.fromRGB(255, 255, 255)
            em.TextSize = 14.000
            em.TextStrokeTransparency = 0.000
            ej.Name = "E"
            ej.Parent = ee
            ej.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ej.BackgroundTransparency = 1.000
            ej.Position = UDim2.new(0.453584045, 0, 0.728395045, 0)
            ej.Size = UDim2.new(0, 29, 0, 28)
            ej.Visible = false
            ej.Font = Enum.Font.Code
            ej.Text = "C"
            ej.TextColor3 = Color3.fromRGB(255, 255, 255)
            ej.TextSize = 14.000
            ej.TextStrokeTransparency = 0.000
            en.Name = "_5"
            en.Parent = ee
            en.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            en.BackgroundTransparency = 1.000
            en.Position = UDim2.new(0.453584045, 0, 0.728395045, 0)
            en.Size = UDim2.new(0, 29, 0, 28)
            en.Visible = true
            en.Font = Enum.Font.Code
            en.Text = "_"
            en.TextColor3 = Color3.fromRGB(255, 255, 255)
            en.TextSize = 14.000
            en.TextStrokeTransparency = 0.000
            ek.Name = "R"
            ek.Parent = ee
            ek.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ek.BackgroundTransparency = 1.000
            ek.Position = UDim2.new(0.522522688, 0, 0.728395045, 0)
            ek.Size = UDim2.new(0, 29, 0, 28)
            ek.Visible = false
            ek.Font = Enum.Font.Code
            ek.Text = "J"
            ek.TextColor3 = Color3.fromRGB(255, 255, 255)
            ek.TextSize = 14.000
            ek.TextStrokeTransparency = 0.000
            eo.Name = "_6"
            eo.Parent = ee
            eo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            eo.BackgroundTransparency = 1.000
            eo.Position = UDim2.new(0.522522688, 0, 0.728395045, 0)
            eo.Size = UDim2.new(0, 29, 0, 28)
            eo.Visible = true
            eo.Font = Enum.Font.Code
            eo.Text = "_"
            eo.TextColor3 = Color3.fromRGB(255, 255, 255)
            eo.TextSize = 14.000
            eo.TextStrokeTransparency = 0.000
            local aj = game:GetService("UserInputService")
            local ep = Enum.KeyCode.W
            local eq = Enum.KeyCode.A
            local er = Enum.KeyCode.S
            local es = Enum.KeyCode.D
            local et = Enum.KeyCode.LeftControl
            local eu = Enum.KeyCode.R
            local ev = Enum.KeyCode.Space
            aj.InputBegan:Connect(
                function(ao)
                    if ao.KeyCode == ep then
                        ef.Visible = true
                        b9.Visible = false
                    elseif ao.KeyCode == eq then
                        eg.Visible = true
                        d6.Visible = false
                    elseif ao.KeyCode == er then
                        eh.Visible = true
                        el.Visible = false
                    elseif ao.KeyCode == es then
                        ei.Visible = true
                        em.Visible = false
                    elseif ao.KeyCode == et then
                        ej.Visible = true
                        en.Visible = false
                    elseif ao.KeyCode == ev then
                        ek.Visible = true
                        eo.Visible = false
                    end
                end
            )
            aj.InputEnded:Connect(
                function(ao)
                    if ao.KeyCode == ep then
                        ef.Visible = false
                        b9.Visible = true
                    elseif ao.KeyCode == eq then
                        eg.Visible = false
                        d6.Visible = true
                    elseif ao.KeyCode == er then
                        eh.Visible = false
                        el.Visible = true
                    elseif ao.KeyCode == es then
                        ei.Visible = false
                        em.Visible = true
                    elseif ao.KeyCode == et then
                        ej.Visible = false
                        en.Visible = true
                    elseif ao.KeyCode == ev then
                        ek.Visible = false
                        eo.Visible = true
                    end
                end
            )
        else
            game.CoreGui.keystrokess:Destroy()
        end
    end
)
e2:Element(
    "Toggle",
    "velocity graph",
    {},
    function(N)
        if N.Toggle then
            local a8 = game:GetService("Players")
            local bV = game:GetService("RunService")
            local a9 = a8.LocalPlayer
            local ew = workspace.CurrentCamera
            local graphLines = {}
            local ex = workspace.CurrentCamera.ViewportSize.Y - 100
            local ey = ex
            local ez = 0
            local VelocityCounter = Drawing.new("Text")
            VelocityCounter.Text = ""
            VelocityCounter.Center = true
            VelocityCounter.Outline = true
            VelocityCounter.Color = Color3.new(1, 1, 1)
            VelocityCounter.Font = 3
            VelocityCounter.Position = Vector2.new(ew.ViewportSize.X / 2, ew.ViewportSize.Y - 90)
            VelocityCounter.Size = 20
            VelocityCounter.Visible = true
            while true do
                bV.RenderStepped:Wait()
                ex = ew.ViewportSize.Y - 100
                VelocityCounter.Position = Vector2.new(ew.ViewportSize.X / 2, ew.ViewportSize.Y - 90)
                if a9.Character and a9.Character.PrimaryPart then
                    if #graphLines >= 1 then
                        local bF = 100
                        if #graphLines >= bF then
                            graphLines[1]:Remove()
                            local eA = 0
                            for T = 2, 6 do
                                eA = eA + 1.8
                                graphLines[T].Transparency = 1 - eA / 10
                            end
                            graphLines[2].Transparency = 0.1
                            graphLines[3].Transparency = 0.2
                            graphLines[4].Transparency = 0.4
                            graphLines[5].Transparency = 0.6
                            graphLines[6].Transparency = 0.8
                            table.remove(graphLines, 1)
                        end
                        for T, v in pairs(graphLines) do
                            v.To = v.To - Vector2.new(2, 0)
                            v.From = v.From - Vector2.new(2, 0)
                        end
                    end
                    local eB = (a9.Character.PrimaryPart.Velocity * Vector3.new(1, 0, 1)).magnitude
                    local eC = eB * 14.85
                    VelocityCounter.Color = Color3.new(1, 1, 1)
                    if math.floor(eB) < ez then
                        VelocityCounter.Color = Color3.new(1, 0.5, 0.3)
                    end
                    if math.floor(eB) > ez then
                        VelocityCounter.Color = Color3.new(0.5, 1, 0.3)
                    end
                    local eD = Color3.new(1, 1, 1)
                    local eE = Drawing.new("Line")
                    table.insert(graphLines, eE)
                    eE.Color = eD
                    eE.Thickness = 2
                    eE.From = Vector2.new(ew.ViewportSize.X / 2 + 98, ey)
                    eE.To = Vector2.new(ew.ViewportSize.X / 2 + 100, ex - eC / 6.5)
                    eE.Transparency = 0
                    eE.Visible = true
                    if #graphLines >= 8 then
                        graphLines[#graphLines - 1].Transparency = graphLines[#graphLines - 1].Transparency + 0.2
                        graphLines[#graphLines - 2].Transparency = graphLines[#graphLines - 2].Transparency + 0.2
                        graphLines[#graphLines - 3].Transparency = graphLines[#graphLines - 3].Transparency + 0.2
                        graphLines[#graphLines - 4].Transparency = graphLines[#graphLines - 4].Transparency + 0.2
                        graphLines[#graphLines - 5].Transparency = graphLines[#graphLines - 5].Transparency + 0.2
                        graphLines[#graphLines - 7].Transparency = 1
                    end
                    VelocityCounter.Text = tostring(math.floor(eC))
                    ey = ex - eC / 6.5
                    ez = math.floor(eB)
                end
            end
        else
            VelocityCounter.Visible = false
            graphLines.Visble = false
            print("nigerian test")
        end
    end
)
local eF = b_.grenadeallowed
b_.grenadeallowed = function(...)
    if values.misc.client["buy any grenade"].Toggle then
        return true
    end
    return eF(...)
end
local eG = dk:Sector("movement", "Left")
eG:Element("Toggle", "bunny hop")
eG:Element("Dropdown", "direction", {options = {"forward", "directional", "directional 2"}})
eG:Element("Dropdown", "type", {options = {"gyro", "cframe"}})
eG:Element("Slider", "speed", {min = 0, max = 100, default = 40})
eG:Element("ToggleKeybind", "jump bug")
eG:Element("ToggleKeybind", "edge jump")
eG:Element("ToggleKeybind", "edge bug")
eG:Element(
    "ToggleKeybind",
    "noclip",
    {},
    function(N)
        spawn(
            function()
                while values.misc.movement["noclip"].Toggle and values.misc.movement["noclip"].Active do
                    game:GetService("RunService").Stepped:Wait()
                    if a9.Character then
                        for T, v in pairs(a9.Character:GetDescendants()) do
                            if v:IsA("BasePart") then
                                v.CanCollide = false
                            end
                        end
                    end
                end
            end
        )
    end
)
local eH = dk:Sector("chat", "Left")
eH:Element(
    "Toggle",
    "chat spam",
    nil,
    function(N)
        if N.Toggle then
            while values.misc.chat["chat spam"].Toggle do
                game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(
                    values.misc.chat.type.Dropdown == "Winning	" and "Join the winning team! damonhook!!" or
                        values.misc.chat.type.Dropdown == "damon" and "$$$ Im Using damonhook $$$" or
                        values.misc.chat.type.Dropdown == "Discord" and "$$$ https://discord.gg/yNjpFzXD $$$" or
                        values.misc.chat.type.Dropdown == "MOM" and "I FUCKED UR MOM I FUCKED UR MOM I FUCKED UR MOM" or
                        values.misc.chat.type.Dropdown == "Semi" and
                            "🐀 RATTED BY SEMI  🐀 ❌ DONT FUCK ❌ WITH 👾BLOXSENSE 👾👨‍🦲USERS👨‍🦲",
                    false,
                    "Innocent",
                    false,
                    true
                )
                wait(values.misc.chat["speed (ms)"].Slider / 1000)
            end
        end
    end
)
eH:Element("Dropdown", "type", {options = {"winning", "damonhook", "Discord", "MOM", "SEMI"}})
eH:Element("Slider", "speed (ms)", {min = 150, max = 1000, default = 500})
eH:Element("Toggle", "kill say")
eH:Element("TextBox", "message", {placeholder = "message"})
eH:Element("Toggle", "no filter")
local eI = Instance.new("ScreenGui")
local eJ = Instance.new("Frame")
local a3 = Instance.new("UIListLayout")
local eK = Instance.new("TextLabel")
eI.Name = "MX_ONHIT"
eI.Parent = game.CoreGui
eI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
eJ.Parent = eI
eJ.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
eJ.BackgroundTransparency = 1.000
eJ.Position = UDim2.new(1, -300, 0, 0)
eJ.Size = UDim2.new(0, 300, 0, 500)
a3.Parent = eJ
a3.SortOrder = Enum.SortOrder.LayoutOrder
eK.Name = "SampleLabel"
eK.Parent = eJ
eK.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
eK.BackgroundTransparency = 1.000
eK.BorderSizePixel = 0
eK.Size = UDim2.new(1, 0, 0, 18)
eK.Font = Enum.Font.SourceSansLight
eK.Text = "Hit SamplePlayer in HeadHB "
eK.TextColor3 = Color3.fromRGB(255, 255, 255)
eK.TextSize = 16.000
eK.TextStrokeTransparency = 0.000
eK.TextTransparency = 1.000
eK.TextXAlignment = Enum.TextXAlignment.Right
local function eL(ah, eM)
    spawn(
        function()
            local eN = eK:Clone()
            eN.Text = ah
            eN.Parent = eI.Frame
            eN.TextTransparency = 0
            eN.TextColor3 = eM
            wait(5)
            eN:Destroy()
        end
    )
end
local eO = dk:Sector("grenades", "Right")
eO:Element("ToggleKeybind", "spam grenades")
coroutine.wrap(
    function()
        while true do
            wait(0.5)
            if values.misc.grenades["spam grenades"].Toggle and values.misc.grenades["spam grenades"].Active then
                local eP = game:GetService("ReplicatedStorage").Weapons[values.misc.grenades.grenade.Dropdown].Model
                local eQ = 25
                local eR = 35
                local oh6 = ""
                local oh7 = ""
                game:GetService("ReplicatedStorage").Events.ThrowGrenade:FireServer(
                    eP,
                    nil,
                    eQ,
                    eR,
                    j(0, -100, 0),
                    oh6,
                    oh7
                )
            end
        end
    end
)()
eO:Element("Dropdown", "grenade", {options = {"Flashbang", "Smoke Grenade", "Molotov", "HE Grenade", "Decoy Grenade"}})
eO:Element(
    "Button",
    "crash server",
    {},
    function()
        eL("Crashing server..", Color3.new(1, 0.5, 0.5))
        while true do
            pcall(
                function()
                    game:GetService("RunService").RenderStepped:Wait()
                    for T = 1, 100, 1 do
                        game:GetService("ReplicatedStorage").Events.DropMag:FireServer(a9.Character.Gun.Mag)
                    end
                end
            )
        end
    end
)
eO:Element(
    "ToggleKeybind",
    "ping exploit",
    {Type = "Toggle", Key = "T"},
    function(N)
        spawn(
            function()
                while values.misc.grenades["ping exploit"].Toggle and values.misc.grenades["ping exploit"].Active do
                    pcall(
                        function()
                            game:GetService("RunService").RenderStepped:Wait()
                            for T = 1, values.misc.grenades["ping limit"].Slider, 1 do
                                game:GetService("ReplicatedStorage").Events.DropMag:FireServer(a9.Character.Gun.Mag)
                                for T, v in pairs(workspace["Ray_Ignore"]:GetChildren()) do
                                    if v.Name == "MagDrop" then
                                        v:Destroy()
                                    end
                                end
                            end
                        end
                    )
                end
            end
        )
    end
)
eO:Element("Slider", "ping limit", {min = 1, max = 4, default = 2})
eO:Element(
    "Toggle",
    "anti-ping",
    {},
    function(N)
        spawn(
            function()
                while values.misc.grenades["anti-ping"].Toggle do
                    pcall(
                        function()
                            game:GetService("RunService").RenderStepped:Wait()
                            for T, v in pairs(workspace["Ray_Ignore"]:GetChildren()) do
                                if v.Name == "MagDrop" then
                                    v:Destroy()
                                end
                            end
                        end
                    )
                end
            end
        )
    end
)
local eS = l("Animation")
eS.AnimationId = "rbxassetid://5917459365"
local eT
local eU = dk:Sector("animations", "Right")
eU:Element(
    "ToggleKeybind",
    "enabled",
    nil,
    function(N)
        pcall(
            function()
                eT:Stop()
            end
        )
        if not N.Toggle or N.Toggle and not N.Active then
        else
            if a9.Character and a9.Character:FindFirstChild("Humanoid") then
                eT = a9.Character.Humanoid:LoadAnimation(eS)
                eT.Priority = Enum.AnimationPriority.Action
                eT:Play()
            end
        end
    end
)
eU:Element(
    "Dropdown",
    "animation",
    {
        options = {
            "Fake swim",
            "Fake walk",
            "Fake jump",
            "Fake sit",
            "Default",
            "Floss",
            "Dolphin",
            "Monkey",
            "Around Town",
            "Baby Dance",
            "Old Town Road",
            "Line Dance",
            "Happy",
            "Dorky Dance",
            "Hero Landing",
            "Jacks"
        }
    },
    function(N)
        eS.AnimationId =
            N.Dropdown == "Fake swim" and "rbxassetid://63716636630 i" or
            N.Dropdown == "Fake walk" and "rbxassetid://1330180905" or
            N.Dropdown == "Fake sit" and "rbxassetid://507768133" or
            N.Dropdown == "Fake jump" and "rbxassetid://896586529" or
            N.Dropdown == "Default" and "rbxassetid://3732699835" or
            N.Dropdown == "Floss" and "rbxassetid://5917459365" or
            N.Dropdown == "Fake jump" and "rbxassetid://896586529" or
            N.Dropdown == "Default" and "rbxassetid://3732699835" or
            N.Dropdown == "Dolphin" and "rbxassetid://5918726674" or
            N.Dropdown == "Monkey" and "rbxassetid://3333499508" or
            N.Dropdown == "Around Town" and "rbxassetid://3303391864" or
            N.Dropdown == "Baby Dance" and "rbxassetid://4265725525" or
            N.Dropdown == "Old Town Road" and "rbxassetid://5937560570" or
            N.Dropdown == "Line Dance" and "rbxassetid://4049037604" or
            N.Dropdown == "Happy" and "rbxassetid://4841405708" or
            N.Dropdown == "Dorky Dance" and "rbxassetid://4212455378" or
            N.Dropdown == "Hero Landing" and "rbxassetid://5104344710" or
            N.Dropdown == "Jacks" and "rbxassetid://3338066331"
        pcall(
            function()
                eT:Stop()
            end
        )
        if values.misc.animations.enabled.Toggle and values.misc.animations.enabled.Active then
            if a9.Character and a9.Character:FindFirstChild("Humanoid") then
                eT = a9.Character.Humanoid:LoadAnimation(eS)
                eT.Priority = Enum.AnimationPriority.Action
                eT:Play()
            end
        end
    end
)
local eV = dk:Sector("ui", "Left")
eV:Element("Toggle", "scaling")
eV:Element("Slider", "amount", {min = 5, max = 11, default = 10})
local eW = Instance.new("ScreenGui")
local eX = Instance.new("TextButton")
local ad = Instance.new("Frame")
eW.Name = "RifthookTK"
eW.Parent = game.CoreGui
eW.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
eX.Size = UDim2.new(0, 200, 0, 40)
eX.Transparency = 1
eX.Parent = eW
ad.Parent = eX
ad.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ad.BackgroundTransparency = 1.000
ad.BorderSizePixel = 0
ad.Size = UDim2.new(1, -20, 1, -35)
ad.Position = UDim2.new(0, 10, 0, 25)
local eY = dl:Sector("griefing", "Left")
eY:Element(
    "Button",
    "set health to 1hp",
    {},
    function()
        game.ReplicatedStorage.Events.FallDamage:FireServer(a9.Character.Humanoid.Health - 1)
    end
)
TeamDamage = false
eY:Element(
    "Toggle",
    "show team damage",
    {},
    function(N)
        TeamDamage = N.Toggle
        eW.Enabled = TeamDamage
        spawn(
            function()
                while TeamDamage do
                    pcall(
                        function()
                            local a3 = Instance.new("UIListLayout")
                            a3.Parent = ad
                            a3:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
                                function()
                                    if a3.AbsoluteContentSize.Y == 0 then
                                        eX.Size = UDim2.new(0, 200, 0, 40)
                                    else
                                        eX.Size = UDim2.new(0, 200, 0, a3.AbsoluteContentSize.Y + 34)
                                    end
                                end
                            )
                            wait()
                            for T, v in pairs(ad:GetChildren()) do
                                v:Destroy()
                            end
                            for T, v in pairs(game.Players:GetChildren()) do
                                if v.Team == a9.Team then
                                    local eN = Instance.new("TextLabel")
                                    eN.Name = v.Name
                                    eN.BackgroundTransparency = 1
                                    eN.Size = UDim2.new(1, 0, 0, 18)
                                    if v == a9 then
                                        eN.Text =
                                            "You | Kills: " ..
                                            tostring(math.floor(v.TeamKills.value)) ..
                                                " | Damage: " .. tostring(math.floor(v.TeamDamage.value))
                                        eN.TextColor3 = Color3.new(0.3, 1, 0.3)
                                    else
                                        eN.Text =
                                            v.Name ..
                                            " | Kills: " ..
                                                tostring(math.floor(v.TeamKills.value)) ..
                                                    " | Damage: " .. tostring(math.floor(v.TeamDamage.value))
                                        eN.TextColor3 = Color3.new(1, 1, 1)
                                    end
                                    eN.Parent = ad
                                    eN.TextXAlignment = "Left"
                                    eN.TextStrokeTransparency = 0
                                end
                            end
                        end
                    )
                end
            end
        )
    end
)
local eZ = {}
local e_ = {}
do
    e_.default = {
        Line = {Thickness = 1.5, Color = n(255, 255, 255), Visible = false},
        Text = {
            Size = 13,
            Center = true,
            Outline = true,
            Font = Drawing.Fonts.Plex,
            Color = n(255, 255, 255),
            Visible = false
        },
        Square = {Thickness = 1.5, Filled = false, Color = n(255, 255, 255), Visible = false}
    }
    function e_.create(type, f0)
        local f1 = Drawing.new(type)
        for T, v in pairs(e_.default[type]) do
            f1[T] = v
        end
        if f0 then
            f1.Color = m(0, 0, 0)
            f1.Thickness = 3
        end
        return f1
    end
    function e_.add(f2)
        if not eZ[f2] then
            eZ[f2] = {
                Name = e_.create("Text"),
                Weapon = e_.create("Text"),
                Armor = e_.create("Text"),
                BoxOutline = e_.create("Square", true),
                Box = e_.create("Square"),
                HealthOutline = e_.create("Line", true),
                Health = e_.create("Line")
            }
        end
    end
    for b9, f2 in pairs(a8:GetPlayers()) do
        if Player ~= a9 then
            e_.add(f2)
        end
    end
    a8.PlayerAdded:Connect(e_.add)
    a8.PlayerRemoving:Connect(
        function(f2)
            wait()
            if eZ[f2] then
                for T, v in pairs(eZ[f2]) do
                    if type(v) == "userdata" then
                        v:Remove()
                    else
                        for f3, df in pairs(v) do
                            if v then
                                v:Remove()
                            end
                        end
                    end
                end
                eZ[f2] = nil
            end
        end
    )
end
local f4 = l("ScreenGui")
f4.Name = "Items"
f4.Parent = game.CoreGui
f4.ResetOnSpawn = false
f4.ZIndexBehavior = "Global"
do
    function add(f2)
        local ae = l("ImageLabel")
        ae.BackgroundColor3 = n(255, 255, 255)
        ae.BackgroundTransparency = 1.000
        ae.Size = A(0, 62, 0, 25)
        ae.Visible = false
        ae.Image = "rbxassetid://1784884358"
        ae.ScaleType = Enum.ScaleType.Fit
        ae.Name = f2.Name
        ae.AnchorPoint = i(0.5, 0.5)
        ae.Parent = f4
    end
    for b9, f2 in pairs(a8:GetPlayers()) do
        if Player ~= a9 then
            add(f2)
        end
    end
    a8.PlayerAdded:Connect(add)
    a8.PlayerRemoving:Connect(
        function(f2)
            wait()
            f4[f2.Name]:Destroy()
        end
    )
end
local f5 = {}
workspace.Debris.ChildAdded:Connect(
    function(cB)
        if cB:IsA("BasePart") and cd:FindFirstChild(cB.Name) then
            bV.RenderStepped:Wait()
            local f6 = l("BillboardGui")
            f6.AlwaysOnTop = true
            f6.Size = A(0, 40, 0, 40)
            f6.Adornee = cB
            local ae = l("ImageLabel")
            ae.Parent = f6
            ae.BackgroundTransparency = 1
            ae.Size = A(1, 0, 1, 0)
            ae.ImageColor3 = values.visuals.world["item esp"].Color
            ae.Image = cj.getWeaponOfKiller(cB.Name)
            ae.ScaleType = Enum.ScaleType.Fit
            ae.Visible =
                values.visuals.world["item esp"].Toggle and I(values.visuals.world["types"].Jumbobox, "icon") and true or
                false
            f6.Parent = cB
        end
    end
)
for b9, cB in pairs(workspace.Debris:GetChildren()) do
    if cB:IsA("BasePart") and cd:FindFirstChild(cB.Name) then
        bV.RenderStepped:Wait()
        local f6 = l("BillboardGui")
        f6.AlwaysOnTop = true
        f6.Size = A(0, 40, 0, 40)
        f6.Adornee = cB
        local ae = l("ImageLabel")
        ae.Parent = f6
        ae.BackgroundTransparency = 1
        ae.Size = A(1, 0, 1, 0)
        ae.ImageColor3 = values.visuals.world["item esp"].Color
        ae.Image = cj.getWeaponOfKiller(cB.Name)
        ae.ScaleType = Enum.ScaleType.Fit
        ae.Visible =
            values.visuals.world["item esp"].Toggle and I(values.visuals.world["types"].Jumbobox, "icon") and true or
            false
        f6.Parent = cB
    end
end
local function f7(f8)
    local bA, bu, f9 = f8:ToOrientation()
    return k(f8.Position) * B(0, bu, 0)
end
local function fa(f8)
    local bA, bu, f9 = f8:ToOrientation()
    return k(f8.Position) * B(bA, bu, 0)
end
local fb = {
    Pistol = {"USP", "P2000", "Glock", "DualBerettas", "P250", "FiveSeven", "Tec9", "CZ", "DesertEagle", "R8"},
    SMG = {"MP9", "MAC10", "MP7", "UMP", "P90", "Bizon"},
    Rifle = {"M4A4", "M4A1", "AK47", "Famas", "Galil", "AUG", "SG"},
    Sniper = {"AWP", "Scout", "G3SG1"}
}
local fc = {
    Pistol = {"USP", "P2000", "Glock", "DualBerettas", "P250", "FiveSeven", "Tec9", "CZ", "DesertEagle", "R8"},
    SMG = {"MP9", "MAC10", "MP7", "UMP", "P90", "Bizon"},
    Rifle = {"M4A4", "M4A1", "AK47", "Famas", "Galil", "AUG", "SG"},
    Sniper = {"AWP", "Scout", "G3SG1"}
}
local function fd(dX)
    return I(fb.Pistol, dX) and "pistol" or I(fb.Rifle, dX) and "rifle" or dX == "AWP" and "awp" or
        dX == "G3SG1" and "auto" or
        dX == "Scout" and "scout" or
        "default"
end
local function fe(dX)
    if dX == "default" then
        return values.rage.weapons.default
    else
        if values.rage.weapons[dX]["override default"].Toggle then
            return values.rage.weapons[dX]
        else
            return values.rage.weapons.default
        end
    end
end
local function ff(dX)
    return I(fc.Pistol, dX) and "pistol" or I(fc.Rifle, dX) and "rifle" or I(fc.SMG, dX) and "smg" or
        I(fc.Sniper, dX) and "sniper" or
        "default"
end
local function fg(dX)
    if dX == "default" then
        return values.legit.main.default
    else
        if values.legit.main[dX]["override default"].Toggle then
            return values.legit.main[dX]
        else
            return values.legit.main.default
        end
    end
end
local fh = false
local fi = 0
local ci
local fj = false
local fk
local fl = false
local fm = false
local fn = Drawing.new("Circle")
fn.Filled = true
fn.Color = n(15, 15, 15)
fn.Transparency = 0.5
fn.Position = i(aa.X, aa.Y + 16)
fn.Radius = 120
bV.RenderStepped:Connect(
    function(fo)
        fn.Visible = false
        fk = fo
        d0 = game.Stats.PerformanceStats.Ping:GetValue()
        ci = nil
        local fp = bY.CFrame
        local fq = fp.LookVector
        local fr = false
        local fs = a9.Character
        ci = nil
        fi = p(fi + values.rage.angles["spin speed"].Slider, 0, 360)
        if fi == 360 then
            fi = 0
        end
        if
            a9.Character and a9.Character:FindFirstChild("Humanoid") and
                a9.Character:FindFirstChild("Humanoid").Health > 0 and
                a9.Character:FindFirstChild("UpperTorso")
         then
            fr = true
        end
        for T, v in pairs(cr) do
            if v.Parent == nil then
                J(cr, T)
            end
        end
        fn.Position = i(bY.ViewportSize.X / 2, bY.ViewportSize.Y / 2)
        if fr then
            local SelfVelocity = a9.Character.HumanoidRootPart.Velocity
            if values.rage.fakelag["ping spike"].Toggle and values.rage.fakelag["ping spike"].Active then
                for ft = 1, 20 do
                    game:GetService("ReplicatedStorage").Events.RemoteEvent:FireServer(
                        {[1] = "createparticle", [2] = "bullethole", [3] = a9.Character.Head, [4] = j(0, 0, 0)}
                    )
                end
            end
            local fu = a9.Character.HumanoidRootPart
            if values.misc.client["infinite crouch"].Toggle then
                b_.crouchcooldown = 0
            end
            if I(values.misc.client["gun modifiers"].Jumbobox, "firerate") then
                b_.DISABLED = false
            end
            if
                values.rage.exploits["kill all"].Toggle and values.rage.exploits["kill all"].Active and
                    a9.Character:FindFirstChild("UpperTorso") and
                    a9.Character:FindFirstChild("Gun")
             then
                for b9, Player in pairs(a8:GetPlayers()) do
                    if Player.Character and Player.Team ~= a9.Team and Player.Character:FindFirstChild("UpperTorso") then
                        local eP = Player.Character.Head
                        local fv = Player.Character.Head.CFrame.p
                        local eQ = b_.gun.Name
                        local eR = 4096
                        local fw = a9.Character.Gun
                        local fx = 15
                        local fy = false
                        local fz = false
                        local fA = j(0, 0, 0)
                        local fB = 16868
                        local fC = j(0, 0, 0)
                        game:GetService("ReplicatedStorage").Events.HitPart:FireServer(
                            eP,
                            fv,
                            eQ,
                            eR,
                            fw,
                            oh6,
                            oh7,
                            fx,
                            fy,
                            fz,
                            fA,
                            fB,
                            fC
                        )
                    end
                end
            end
            if I(values.visuals.effects.removals.Jumbobox, "scope lines") then
                ct.Enabled = a9.Character:FindFirstChild("AIMING") and true or false
                c1.Scope.Visible = false
            else
                ct.Enabled = false
            end
            local fD
            if workspace:FindFirstChild("Map") and b_.gun ~= "none" and b_.gun.Name ~= "C4" then
                if values.rage.aimbot.enabled.Toggle then
                    local fE =
                        values.rage.aimbot.origin.Dropdown == "character" and
                        a9.Character.LowerTorso.Position + j(0, 2.5, 0) or
                        fp.p
                    local fF = fe(fd(b_.gun.Name))
                    for b9, Player in pairs(a8:GetPlayers()) do
                        if I(values.misc.client["gun modifiers"].Jumbobox, "firerate") then
                            b_.DISABLED = false
                        end
                        spawn(
                            function()
                                if
                                    Player.Character and Player.Character:FindFirstChild("Humanoid") and
                                        Player.Character:FindFirstChild("Humanoid").Health > 0 and
                                        Player.Team ~= "TTT" and
                                        Player ~= a9
                                 then
                                    if I(values.rage.aimbot.resolver.Jumbobox, "Pitch") then
                                        Player.Character.UpperTorso.Waist.C0 = B(0, 0, 0)
                                        Player.Character.LowerTorso.Root.C0 = B(0, 0, 0)
                                        Player.Character.Head.Neck.C0 = CFrame.new(0, 5, 0) * B(0, 0, 0)
                                    end
                                    if I(values.rage.aimbot.resolver.Jumbobox, "Roll") then
                                        Player.Character.Humanoid.MaxSlopeAngle = 0
                                    end
                                    if I(values.rage.aimbot.resolver.Jumbobox, "Animation") then
                                        for f3, fG in pairs(Player.Character.Humanoid:GetPlayingAnimationTracks()) do
                                            fG:Stop()
                                        end
                                    end
                                end
                            end
                        )
                        if
                            Player.Character and Player.Character:FindFirstChild("Humanoid") and not b_.DISABLED and
                                Player.Character:FindFirstChild("Humanoid").Health > 0 and
                                Player.Team ~= "TTT" and
                                not Player.Character:FindFirstChildOfClass("ForceField") and
                                cU(fp, Player.Character.Head.Position) <= fF["max fov"].Slider and
                                Player ~= a9
                         then
                            if
                                Player.Team ~= a9.Team or
                                    values.rage.aimbot.teammates.Toggle and Player:FindFirstChild("Status") and
                                        Player.Status.Team.Value ~= a9.Status.Team.Value and
                                        Player.Status.Alive.Value
                             then
                                if b_.gun:FindFirstChild("Melee") and values.rage.aimbot["knifebot"].Toggle then
                                    local fH = {unpack(cl)}
                                    H(fH, workspace.Map.Clips)
                                    H(fH, workspace.Map.SpawnPoints)
                                    H(fH, a9.Character)
                                    H(fH, Player.Character.HumanoidRootPart)
                                    if Player.Character:FindFirstChild("BackC4") then
                                        H(fH, Player.Character.BackC4)
                                    end
                                    if Player.Character:FindFirstChild("Gun") then
                                        H(fH, Player.Character.Gun)
                                    end
                                    local Ray = G(fE, (Player.Character.Head.Position - fE).unit * 20)
                                    local fI, fJ = workspace:FindPartOnRayWithIgnoreList(Ray, fH, false, true)
                                    if fI and fI.Parent == Player.Character then
                                        fD = fI
                                        ci = fI
                                        if not values.rage.aimbot["silent aim"].Toggle then
                                            bY.CFrame = k(fp.Position, fI.Position)
                                        end
                                        fj = true
                                        b_.firebullet()
                                        fj = false
                                        local fK = {
                                            [1] = fI,
                                            [2] = fI.Position,
                                            [3] = b_.gun.Name,
                                            [4] = 4096,
                                            [5] = a9.Character.Gun,
                                            [8] = 1,
                                            [9] = false,
                                            [10] = false,
                                            [11] = j(),
                                            [12] = 16868,
                                            [13] = j()
                                        }
                                        game.ReplicatedStorage.Events.HitPart:FireServer(unpack(fK))
                                    end
                                else
                                    local fH = {unpack(cl)}
                                    H(fH, workspace.Map.Clips)
                                    H(fH, workspace.Map.SpawnPoints)
                                    H(fH, a9.Character)
                                    H(fH, Player.Character.HumanoidRootPart)
                                    if Player.Character:FindFirstChild("BackC4") then
                                        H(fH, Player.Character.BackC4)
                                    end
                                    if Player.Character:FindFirstChild("Gun") then
                                        H(fH, Player.Character.Gun)
                                    end
                                    local fL = {}
                                    for b9, fM in ipairs(fF.hitboxes.Jumbobox) do
                                        if fF["prefer body"].Toggle then
                                            if
                                                fM == "head" and
                                                    (not values.rage.aimbot["auto baim"].Toggle or
                                                        Player.Character:FindFirstChild("FakeHead"))
                                             then
                                                H(fL, Player.Character.Head)
                                            elseif fM == "torso" then
                                                H(fL, Player.Character.UpperTorso)
                                            else
                                                H(fL, Player.Character.LowerTorso)
                                            end
                                        else
                                            if fM == "torso" then
                                                H(fL, Player.Character.UpperTorso)
                                            elseif fM == "pelvis" then
                                                H(fL, Player.Character.LowerTorso)
                                            elseif
                                                not values.rage.aimbot["auto baim"].Toggle or
                                                    Player.Character:FindFirstChild("FakeHead")
                                             then
                                                H(fL, Player.Character.Head)
                                            end
                                        end
                                    end
                                    for b9, fM in ipairs(fL) do
                                        local fN = {unpack(fH)}
                                        for b9, cQ in pairs(Player.Character:GetChildren()) do
                                            if cQ ~= fM then
                                                H(fN, cQ)
                                            end
                                        end
                                        if values.rage.aimbot["automatic penetration"].Toggle then
                                            local fO = {}
                                            local EndHit, fI, fJ
                                            local fP = b_.gun.Penetration.Value * 0.8
                                            local fQ = G(fE, (fM.Position - fE).unit * (fM.Position - fE).magnitude)
                                            repeat
                                                fI, fJ = workspace:FindPartOnRayWithIgnoreList(fQ, fN, false, true)
                                                if fI ~= nil and fI.Parent ~= nil then
                                                    if fI and cq[fI.Name] ~= nil then
                                                        EndHit = fI
                                                    else
                                                        H(fN, fI)
                                                        H(fO, {["Position"] = fJ, ["Hit"] = fI})
                                                    end
                                                end
                                            until EndHit ~= nil or #fO >= 4 or fI == nil
                                            if EndHit ~= nil and cq[EndHit.Name] ~= nil and #fO <= 4 then
                                                if #fO == 0 then
                                                    local fR = b_.gun.DMG.Value * cq[EndHit.Name]
                                                    if Player:FindFirstChild("Kevlar") then
                                                        if C(EndHit.Name, "Head") then
                                                            if Player:FindFirstChild("Helmet") then
                                                                fR = fR / 100 * b_.gun.ArmorPenetration.Value
                                                            end
                                                        else
                                                            fR = fR / 100 * b_.gun.ArmorPenetration.Value
                                                        end
                                                    end
                                                    fR =
                                                        fR * b_.gun.RangeModifier.Value /
                                                        100 ^ ((fE - EndHit.Position).Magnitude / 500) /
                                                        100
                                                    if fR >= fF["minimum damage"].Slider then
                                                        fD = EndHit
                                                        ci = EndHit
                                                        if not values.rage.aimbot["silent aim"].Toggle then
                                                            bY.CFrame = k(fp.Position, EndHit.Position)
                                                        end
                                                        fj = true
                                                        if values.rage.aimbot["automatic fire"].Dropdown == "standard" then
                                                            b_.firebullet()
                                                            if
                                                                values.rage.exploits["triple tap"].Toggle and
                                                                    values.rage.exploits["triple tap"].Active
                                                             then
                                                                b_.firebullet()
                                                                b_.firebullet()
                                                            end
                                                            eL(
                                                                "Hit " ..
                                                                    EndHit.Parent.Name .. " in the " .. EndHit.Name,
                                                                Color3.new(1, 1, 1)
                                                            )
                                                        elseif
                                                            values.rage.aimbot["automatic fire"].Dropdown == "hitpart"
                                                         then
                                                            b_.firebullet()
                                                            local fK = {
                                                                [1] = EndHit,
                                                                [2] = EndHit.Position,
                                                                [3] = a9.Character.EquippedTool.Value,
                                                                [4] = 100,
                                                                [5] = a9.Character.Gun,
                                                                [8] = 1,
                                                                [9] = false,
                                                                [10] = false,
                                                                [11] = j(),
                                                                [12] = 100,
                                                                [13] = j()
                                                            }
                                                            game.ReplicatedStorage.Events.HitPart:FireServer(unpack(fK))
                                                            if
                                                                values.rage.exploits["triple tap"].Toggle and
                                                                    values.rage.exploits["triple tap"].Active
                                                             then
                                                                b_.firebullet()
                                                                local fK = {
                                                                    [1] = EndHit,
                                                                    [2] = EndHit.Position,
                                                                    [3] = a9.Character.EquippedTool.Value,
                                                                    [4] = 100,
                                                                    [5] = a9.Character.Gun,
                                                                    [8] = 1,
                                                                    [9] = false,
                                                                    [10] = false,
                                                                    [11] = j(),
                                                                    [12] = 100,
                                                                    [13] = j()
                                                                }
                                                                game.ReplicatedStorage.Events.HitPart:FireServer(
                                                                    unpack(fK)
                                                                )
                                                                b_.firebullet()
                                                                local fK = {
                                                                    [1] = EndHit,
                                                                    [2] = EndHit.Position,
                                                                    [3] = a9.Character.EquippedTool.Value,
                                                                    [4] = 100,
                                                                    [5] = a9.Character.Gun,
                                                                    [8] = 1,
                                                                    [9] = false,
                                                                    [10] = false,
                                                                    [11] = j(),
                                                                    [12] = 100,
                                                                    [13] = j()
                                                                }
                                                                game.ReplicatedStorage.Events.HitPart:FireServer(
                                                                    unpack(fK)
                                                                )
                                                            end
                                                            eL(
                                                                "Hit " ..
                                                                    EndHit.Parent.Name .. " in the " .. EndHit.Name,
                                                                Color3.new(1, 1, 1)
                                                            )
                                                        end
                                                        fj = false
                                                        break
                                                    end
                                                else
                                                    local fS = b_.gun.Penetration.Value * 0.8
                                                    local fT = 0
                                                    local fU = 1
                                                    for T = 1, #fO do
                                                        local aN = fO[T]
                                                        local dK = aN["Hit"]
                                                        local fV = aN["Position"]
                                                        local fW = 1
                                                        if dK.Material == Enum.Material.DiamondPlate then
                                                            fW = 1
                                                        end
                                                        if
                                                            dK.Material == Enum.Material.CorrodedMetal or
                                                                dK.Material == Enum.Material.Metal or
                                                                dK.Material == Enum.Material.Concrete or
                                                                dK.Material == Enum.Material.Brick
                                                         then
                                                            fW = 0.3
                                                        end
                                                        if
                                                            dK.Name == "Grate" or dK.Material == Enum.Material.Wood or
                                                                dK.Material == Enum.Material.WoodPlanks
                                                         then
                                                            fW = 0.05
                                                        end
                                                        if dK.Name == "nowallbang" then
                                                            fW = 100
                                                        end
                                                        if dK:FindFirstChild("PartModifier") then
                                                            fW = dK.PartModifier.Value
                                                        end
                                                        if
                                                            dK.Transparency == 1 or dK.CanCollide == false or
                                                                dK.Name == "Glass" or
                                                                dK.Name == "Cardboard"
                                                         then
                                                            fW = 0
                                                        end
                                                        local fX =
                                                            (fM.Position - fV).unit * p(b_.gun.Range.Value, 1, 100)
                                                        local fY = G(fV + fX * 1, fX * -2)
                                                        local b9, fZ =
                                                            workspace:FindPartOnRayWithWhitelist(fY, {dK}, true)
                                                        local f_ = (fZ - fV).Magnitude
                                                        f_ = f_ * fW
                                                        fT = y(fS, fT + f_)
                                                        fU = 1 - fT / fS
                                                    end
                                                    local fR = b_.gun.DMG.Value * cq[EndHit.Name] * fU
                                                    if Player:FindFirstChild("Kevlar") then
                                                        if C(EndHit.Name, "Head") then
                                                            if Player:FindFirstChild("Helmet") then
                                                                fR = fR / 100 * b_.gun.ArmorPenetration.Value
                                                            end
                                                        else
                                                            fR = fR / 100 * b_.gun.ArmorPenetration.Value
                                                        end
                                                    end
                                                    fR =
                                                        fR * b_.gun.RangeModifier.Value /
                                                        100 ^ ((fE - EndHit.Position).Magnitude / 500) /
                                                        100
                                                    if fR >= fF["minimum damage"].Slider then
                                                        fD = EndHit
                                                        ci = EndHit
                                                        if not values.rage.aimbot["silent aim"].Toggle then
                                                            bY.CFrame = k(fp.Position, EndHit.Position)
                                                        end
                                                        fj = true
                                                        if values.rage.aimbot["automatic fire"].Dropdown == "standard" then
                                                            b_.firebullet()
                                                            b_.firebullet()
                                                            if
                                                                values.rage.exploits["triple tap"].Toggle and
                                                                    values.rage.exploits["triple tap"].Active
                                                             then
                                                                b_.firebullet()
                                                                b_.firebullet()
                                                            end
                                                            eL(
                                                                "Hit " ..
                                                                    EndHit.Parent.Name .. " in the " .. EndHit.Name,
                                                                Color3.new(1, 1, 1)
                                                            )
                                                        elseif
                                                            values.rage.aimbot["automatic fire"].Dropdown == "hitpart"
                                                         then
                                                            b_.firebullet()
                                                            local fK = {
                                                                [1] = EndHit,
                                                                [2] = EndHit.Position,
                                                                [3] = a9.Character.EquippedTool.Value,
                                                                [4] = 100,
                                                                [5] = a9.Character.Gun,
                                                                [8] = 1,
                                                                [9] = false,
                                                                [10] = false,
                                                                [11] = j(),
                                                                [12] = 100,
                                                                [13] = j()
                                                            }
                                                            game.ReplicatedStorage.Events.HitPart:FireServer(unpack(fK))
                                                            b_.firebullet()
                                                            local fK = {
                                                                [1] = EndHit,
                                                                [2] = EndHit.Position,
                                                                [3] = a9.Character.EquippedTool.Value,
                                                                [4] = 100,
                                                                [5] = a9.Character.Gun,
                                                                [8] = 1,
                                                                [9] = false,
                                                                [10] = false,
                                                                [11] = j(),
                                                                [12] = 100,
                                                                [13] = j()
                                                            }
                                                            game.ReplicatedStorage.Events.HitPart:FireServer(unpack(fK))
                                                            eL(
                                                                "Hit " ..
                                                                    EndHit.Parent.Name .. " in the " .. EndHit.Name,
                                                                Color3.new(1, 1, 1)
                                                            )
                                                            if
                                                                values.rage.exploits["triple tap"].Toggle and
                                                                    values.rage.exploits["triple tap"].Active
                                                             then
                                                                b_.firebullet()
                                                                local fK = {
                                                                    [1] = EndHit,
                                                                    [2] = EndHit.Position,
                                                                    [3] = a9.Character.EquippedTool.Value,
                                                                    [4] = 100,
                                                                    [5] = a9.Character.Gun,
                                                                    [8] = 1,
                                                                    [9] = false,
                                                                    [10] = false,
                                                                    [11] = j(),
                                                                    [12] = 100,
                                                                    [13] = j()
                                                                }
                                                                game.ReplicatedStorage.Events.HitPart:FireServer(
                                                                    unpack(fK)
                                                                )
                                                                b_.firebullet()
                                                                local fK = {
                                                                    [1] = EndHit,
                                                                    [2] = EndHit.Position,
                                                                    [3] = a9.Character.EquippedTool.Value,
                                                                    [4] = 100,
                                                                    [5] = a9.Character.Gun,
                                                                    [8] = 1,
                                                                    [9] = false,
                                                                    [10] = false,
                                                                    [11] = j(),
                                                                    [12] = 100,
                                                                    [13] = j()
                                                                }
                                                                game.ReplicatedStorage.Events.HitPart:FireServer(
                                                                    unpack(fK)
                                                                )
                                                            end
                                                        end
                                                        fj = false
                                                        break
                                                    end
                                                end
                                            end
                                        else
                                            local Ray = G(fE, (fM.Position - fE).unit * (fM.Position - fE).magnitude)
                                            local fI, fJ = workspace:FindPartOnRayWithIgnoreList(Ray, fN, false, true)
                                            if fI and cq[fI.Name] ~= nil then
                                                local fR = b_.gun.DMG.Value * cq[fI.Name]
                                                if Player:FindFirstChild("Kevlar") then
                                                    if C(fI.Name, "Head") then
                                                        if Player:FindFirstChild("Helmet") then
                                                            fR = fR / 100 * b_.gun.ArmorPenetration.Value
                                                        end
                                                    else
                                                        fR = fR / 100 * b_.gun.ArmorPenetration.Value
                                                    end
                                                end
                                                fR =
                                                    fR * b_.gun.RangeModifier.Value /
                                                    100 ^ ((fE - fI.Position).Magnitude / 500)
                                                if fR >= fF["minimum damage"].Slider then
                                                    fD = fI
                                                    ci = fI
                                                    if not values.rage.aimbot["silent aim"].Toggle then
                                                        bY.CFrame = k(fp.Position, fI.Position)
                                                    end
                                                    fj = true
                                                    if values.rage.aimbot["automatic fire"].Dropdown == "standard" then
                                                        b_.firebullet()
                                                        b_.firebullet()
                                                        if
                                                            values.rage.exploits["triple tap"].Toggle and
                                                                values.rage.exploits["triple tap"].Active
                                                         then
                                                            b_.firebullet()
                                                            b_.firebullet()
                                                            b_.firebullet()
                                                        end
                                                        eL(
                                                            "Hit " .. EndHit.Parent.Name .. " in the " .. EndHit.Name,
                                                            Color3.new(1, 1, 1)
                                                        )
                                                    elseif values.rage.aimbot["automatic fire"].Dropdown == "hitpart" then
                                                        eL(
                                                            "Hit " .. EndHit.Parent.Name .. " in the " .. EndHit.Name,
                                                            Color3.new(1, 1, 1)
                                                        )
                                                        b_.firebullet()
                                                        b_.firebullet()
                                                        local fK = {
                                                            [1] = EndHit,
                                                            [2] = EndHit.Position,
                                                            [3] = a9.Character.EquippedTool.Value,
                                                            [4] = 100,
                                                            [5] = a9.Character.Gun,
                                                            [8] = 1,
                                                            [9] = false,
                                                            [10] = false,
                                                            [11] = j(),
                                                            [12] = 100,
                                                            [13] = j()
                                                        }
                                                        game.ReplicatedStorage.Events.HitPart:FireServer(unpack(fK))
                                                        b_.firebullet()
                                                        local fK = {
                                                            [1] = EndHit,
                                                            [2] = EndHit.Position,
                                                            [3] = a9.Character.EquippedTool.Value,
                                                            [4] = 100,
                                                            [5] = a9.Character.Gun,
                                                            [8] = 1,
                                                            [9] = false,
                                                            [10] = false,
                                                            [11] = j(),
                                                            [12] = 100,
                                                            [13] = j()
                                                        }
                                                        game.ReplicatedStorage.Events.HitPart:FireServer(unpack(fK))
                                                        if
                                                            values.rage.exploits["triple tap"].Toggle and
                                                                values.rage.exploits["triple tap"].Active
                                                         then
                                                            b_.firebullet()
                                                            local fK = {
                                                                [1] = EndHit,
                                                                [2] = EndHit.Position,
                                                                [3] = a9.Character.EquippedTool.Value,
                                                                [4] = 100,
                                                                [5] = a9.Character.Gun,
                                                                [8] = 1,
                                                                [9] = false,
                                                                [10] = false,
                                                                [11] = j(),
                                                                [12] = 100,
                                                                [13] = j()
                                                            }
                                                            game.ReplicatedStorage.Events.HitPart:FireServer(unpack(fK))
                                                            b_.firebullet()
                                                            local fK = {
                                                                [1] = EndHit,
                                                                [2] = EndHit.Position,
                                                                [3] = a9.Character.EquippedTool.Value,
                                                                [4] = 100,
                                                                [5] = a9.Character.Gun,
                                                                [8] = 1,
                                                                [9] = false,
                                                                [10] = false,
                                                                [11] = j(),
                                                                [12] = 100,
                                                                [13] = j()
                                                            }
                                                            game.ReplicatedStorage.Events.HitPart:FireServer(unpack(fK))
                                                        end
                                                    end
                                                    fj = false
                                                    break
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                elseif
                    values.legit.aimbot["aim assist"].Toggle and values.legit.aimbot["aim assist"].Active and
                        not a.uiopen
                 then
                    local fF = fg(ff(b_.gun.Name))
                    local fH = {a9.Character, bY, workspace.Map.Clips, workspace.Map.SpawnPoints, workspace.Debris}
                    local g0 = 9999
                    local g1
                    fn.Radius = fF["field of view"].Slider
                    fn.Visible = values.legit.settings["draw fov"].Toggle
                    fn.Color = values.legit.settings["draw fov"].Color
                    if not I(fF.conditions.Jumbobox, "smoke") then
                        H(fH, workspace.Ray_Ignore)
                    end
                    if not I(fF.conditions.Jumbobox, "blind") or a9.PlayerGui.Blnd.Blind.BackgroundTransparency > 0.9 then
                        if not I(fF.conditions.Jumbobox, "standing") or SelfVelocity.Magnitude < 3 then
                            for b9, Player in pairs(a8:GetPlayers()) do
                                if
                                    Player.Character and Player.Character:FindFirstChild("Humanoid") and
                                        Player.Character:FindFirstChild("Humanoid").Health > 0
                                 then
                                    if
                                        not values.legit.settings["forcefield check"].Toggle or
                                            not Player.Character:FindFirstChildOfClass("ForceField")
                                     then
                                        if Player.Team ~= a9.Team or values.legit.settings["free for all"].Toggle then
                                            local fJ, g2 =
                                                bY:WorldToViewportPoint(Player.Character.HumanoidRootPart.Position)
                                            if g2 then
                                                local g3 = (i(fJ.X, fJ.Y) - i(aa.X, aa.Y)).Magnitude
                                                if g3 < fF["field of view"].Slider then
                                                    local fM =
                                                        fF.hitbox.Dropdown == "head" and Player.Character.Head or
                                                        fF.hitbox.Dropdown == "chest" and Player.Character.UpperTorso
                                                    if fF.hitbox.Dropdown == "closest" then
                                                        local g4 =
                                                            bY:WorldToViewportPoint(Player.Character.Head.Position)
                                                        local g5 =
                                                            bY:WorldToViewportPoint(
                                                            Player.Character.UpperTorso.Position
                                                        )
                                                        local g6 = (i(g4.X, g4.Y) - i(aa.X, aa.Y)).Magnitude
                                                        local g7 = (i(g5.X, g5.Y) - i(aa.X, aa.Y)).Magnitude
                                                        if g6 < g7 then
                                                            fM = Player.Character.Head
                                                        else
                                                            fM = Player.Character.UpperTorso
                                                        end
                                                    end
                                                    if fM ~= nil then
                                                        if not I(fF.conditions.Jumbobox, "visible") then
                                                            g1 = fM
                                                        else
                                                            local fQ =
                                                                G(
                                                                bY.CFrame.Position,
                                                                (fM.Position - bY.CFrame.Position).unit *
                                                                    (fM.Position - bY.CFrame.Position).magnitude
                                                            )
                                                            local fI, fJ =
                                                                workspace:FindPartOnRayWithIgnoreList(
                                                                fQ,
                                                                fH,
                                                                false,
                                                                true
                                                            )
                                                            if fI and fI:FindFirstAncestor(Player.Name) then
                                                                g1 = fM
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    if g1 ~= nil then
                        local fJ = bY:WorldToScreenPoint(g1.Position)
                        local g3 = i(fJ.X - aa.X, fJ.Y - aa.Y)
                        mousemoverel(g3.x / fF.smoothing.Slider, g3.y / fF.smoothing.Slider)
                    end
                end
                if
                    not values.rage.aimbot.enabled.Toggle and values.legit.aimbot["triggerbot"].Toggle and
                        values.legit.aimbot["triggerbot"].Active and
                        not fl
                 then
                    local fF = fg(ff(b_.gun.Name))
                    if fF.triggerbot.Toggle then
                        if
                            not I(fF.conditions.Jumbobox, "blind") or
                                a9.PlayerGui.Blnd.Blind.BackgroundTransparency > 0.9
                         then
                            if not I(fF.conditions.Jumbobox, "standing") or SelfVelocity.Magnitude < 3 then
                                if
                                    aa.Target and aa.Target.Parent and a8:GetPlayerFromCharacter(aa.Target.Parent) and
                                        cq[aa.Target.Name] ~= nil and
                                        b_.gun.DMG.Value * cq[aa.Target.Name] >= fF["minimum dmg"].Slider
                                 then
                                    local g8 = aa.Target
                                    local Player = a8:GetPlayerFromCharacter(aa.Target.Parent)
                                    if Player.Team ~= a9.Team or values.legit.settings["free for all"].Toggle then
                                        coroutine.wrap(
                                            function()
                                                fl = true
                                                wait(fF["delay (ms)"].Slider / 1000)
                                                repeat
                                                    bV.RenderStepped:Wait()
                                                    if not b_.DISABLED then
                                                        b_.firebullet()
                                                    end
                                                until aa.Target == nil or
                                                    Player ~= a8:GetPlayerFromCharacter(aa.Target.Parent)
                                                fl = false
                                            end
                                        )()
                                    end
                                end
                            end
                        end
                    end
                end
            end
            ck:Destroy()
            ck = l("BodyVelocity")
            ck.MaxForce = j(w, 0, w)
            if aj:IsKeyDown("Space") and values.misc.movement["bunny hop"].Toggle then
                local add = 0
                if
                    values.misc.movement.direction.Dropdown == "directional" or
                        values.misc.movement.direction.Dropdown == "directional 2"
                 then
                    if aj:IsKeyDown("A") then
                        add = 90
                    end
                    if aj:IsKeyDown("S") then
                        add = 180
                    end
                    if aj:IsKeyDown("D") then
                        add = 270
                    end
                    if aj:IsKeyDown("A") and aj:IsKeyDown("W") then
                        add = 45
                    end
                    if aj:IsKeyDown("D") and aj:IsKeyDown("W") then
                        add = 315
                    end
                    if aj:IsKeyDown("D") and aj:IsKeyDown("S") then
                        add = 225
                    end
                    if aj:IsKeyDown("A") and aj:IsKeyDown("S") then
                        add = 145
                    end
                end
                local g9 = f7(fp) * B(0, x(add), 0)
                ck.Parent = a9.Character.UpperTorso
                a9.Character.Humanoid.Jump = true
                ck.Velocity = j(g9.LookVector.X, 0, g9.LookVector.Z) * values.misc.movement["speed"].Slider * 2
                if add == 0 and values.misc.movement.direction.Dropdown == "directional" and not aj:IsKeyDown("W") then
                    ck:Destroy()
                else
                    if values.misc.movement.type.Dropdown == "cframe" then
                        ck:Destroy()
                        fu.CFrame =
                            fu.CFrame +
                            j(g9.LookVector.X, 0, g9.LookVector.Z) * values.misc.movement["speed"].Slider / 50
                    end
                end
            end
            if values.misc.movement["edge jump"].Toggle and values.misc.movement["edge jump"].Active then
                if
                    a9.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall and
                        a9.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Jumping
                 then
                    coroutine.wrap(
                        function()
                            bV.RenderStepped:Wait()
                            if
                                a9.Character ~= nil and a9.Character:FindFirstChild("Humanoid") and
                                    a9.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall and
                                    a9.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Jumping
                             then
                                a9.Character.Humanoid:ChangeState("Jumping")
                            end
                        end
                    )()
                end
            end
            fh = not fh
            a9.Character.Humanoid.AutoRotate = false
            if values.rage.angles.enabled.Toggle and not fm then
                local ga = -u(fq.Z, fq.X) + x(-90)
                if values.rage.angles["yaw base"].Dropdown == "spin" then
                    ga = ga + x(fi)
                end
                if values.rage.angles["yaw base"].Dropdown == "random" then
                    ga = ga + x(t(0, 360))
                end
                local gb =
                    x(
                    -values.rage.angles["yaw offset"].Slider -
                        (values.rage.angles.jitter.Toggle and fh and values.rage.angles["jitter offset"].Slider or 0)
                )
                local gc = k(fu.Position) * B(0, ga + gb, 0)
                if values.rage.angles["yaw base"].Dropdown == "targets" then
                    local dK
                    local gd = 9999
                    for b9, f2 in pairs(a8:GetPlayers()) do
                        if
                            f2.Character and f2.Character:FindFirstChild("Humanoid") and
                                f2.Character:FindFirstChild("Humanoid").Health > 0 and
                                f2.Team ~= a9.Team
                         then
                            local fV, g2 = bY:WorldToViewportPoint(f2.Character.HumanoidRootPart.Position)
                            local ge = (i(fV.X, fV.Y) - i(aa.X, aa.Y)).Magnitude
                            if gd > ge then
                                dK = f2.Character.HumanoidRootPart
                                gd = ge
                            end
                        end
                    end
                    if dK ~= nil then
                        gc = k(fu.Position, dK.Position) * B(0, gb, 0)
                    end
                end
                fu.CFrame = f7(gc)
                if values.rage.angles["body roll"].Dropdown == "180" then
                    fu.CFrame = fu.CFrame * B(values.rage.angles["body roll"].Dropdown == "180" and x(180) or 0, 1, 0)
                    a9.Character.Humanoid.HipHeight = 4
                elseif values.rage.angles["body roll"].Dropdown == "spin" then
                    a9.Character.LowerTorso.Root.C0 =
                        a9.Character.LowerTorso.Root.C0 * CFrame.Angles(0, 0, math.pi / 10) * CFrame.new(0, 0, 0)
                else
                    a9.Character.Humanoid.HipHeight = 2
                end
                if values.rage.angles["underground aa"].Toggle == true and underground == false then
                    a9.Character.LowerTorso.Root.C0 =
                        a9.Character.LowerTorso.Root.C0 * CFrame.Angles(0, 0, 0) *
                        CFrame.new(0, values.rage.angles["underground pos"].Slider, 0)
                    underground = true
                end
                local gf =
                    values.rage.angles["pitch"].Dropdown == "Sus_down" and -3 or
                    values.rage.angles["pitch"].Dropdown == "None" and fq.Y or
                    values.rage.angles["pitch"].Dropdown == "Swindler" and -129433 or
                    values.rage.angles["pitch"].Dropdown == "Up" and 1 or
                    values.rage.angles["pitch"].Dropdown == "Down" and -1.3 or
                    values.rage.angles["pitch"].Dropdown == "Zero" and 0 or
                    values.rage.angles["pitch"].Dropdown == "Random AA" and t(-1362, 2337) / 5078 or
                    values.rage.angles["pitch"].Dropdown == "Huge" and math.huge or
                    values.rage.angles["pitch"].Dropdown == "Custom" and values.rage.angles["pitch angle"].Slider or
                    2.5 or
                    values.rage.angles["pitch"].Dropdown == "wtf" and
                        99999999999999999999999999999999999999999999999999999999 or
                    values.rage.angles["pitch"].Dropdown == "glitch" and 0 + -5 or
                    values.rage.angles["pitch"].Dropdown == "God" and 15 or
                    values.rage.angles["pitch"].Dropdown == "fucker" and -13 or
                    values.rage.angles["pitch"].Dropdown == "sussy" and math.huge - 1 / 0 - 5
                if
                    values.rage.angles["extend pitch"].Toggle and
                        (values.rage.angles["pitch"].Dropdown == "up" or values.rage.angles["pitch"].Dropdown == "down" or
                            values.rage.angles["pitch"].Dropdown == "negative" or
                            values.rage.angles["pitch"].Dropdown == "glitch" or
                            values.rage.angles["pitch"].Dropdown == "Sus_down" or
                            values.rage.angles["pitch"].Dropdown == "180" or
                            values.rage.angles["pitch"].Dropdown == "fucker")
                 then
                    gf = gf * 2 / 1.6
                end
                game.ReplicatedStorage.Events.ControlTurn:FireServer(
                    gf,
                    a9.Character:FindFirstChild("Climbing") and true or false
                )
            else
                a9.Character.Humanoid.HipHeight = 2
                fu.CFrame = k(fu.Position) * B(0, -u(fq.Z, fq.X) + x(270), 0)
                game.ReplicatedStorage.Events.ControlTurn:FireServer(
                    fq.Y,
                    a9.Character:FindFirstChild("Climbing") and true or false
                )
            end
            if values.rage.others["remove head"].Toggle then
                if a9.Character:FindFirstChild("FakeHead") then
                    a9.Character.FakeHead:Destroy()
                end
                if a9.Character:FindFirstChild("HeadHB") then
                    a9.Character.HeadHB:Destroy()
                end
            end
            if I(values.misc.client["gun modifiers"].Jumbobox, "recoil") then
                b_.resetaccuracy()
                b_.RecoilX = 0
                b_.RecoilY = 0
            end
        else
            underground = false
        end
        for b9, Player in pairs(a8:GetPlayers()) do
            if
                Player.Character and Player ~= a9 and Player.Character:FindFirstChild("HumanoidRootPart") and
                    Player.Character.HumanoidRootPart:FindFirstChild("OldPosition")
             then
                coroutine.wrap(
                    function()
                        local gg = Player.Character.HumanoidRootPart.Position
                        bV.RenderStepped:Wait()
                        if Player.Character and Player ~= a9 and Player.Character:FindFirstChild("HumanoidRootPart") then
                            if Player.Character.HumanoidRootPart:FindFirstChild("OldPosition") then
                                Player.Character.HumanoidRootPart.OldPosition.Value = gg
                            else
                                local bD = l("Vector3Value")
                                bD.Name = "OldPosition"
                                bD.Value = gg
                                bD.Parent = Player.Character.HumanoidRootPart
                            end
                        end
                    end
                )()
            end
        end
        for b9, Player in pairs(a8:GetPlayers()) do
            local N = eZ[Player]
            if N == nil then
                return
            end
            if
                Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Team ~= "TTT" and
                    (Player.Team ~= a9.Team or values.visuals.players.teammates.Toggle) and
                    Player.Character:FindFirstChild("Gun") and
                    Player.Character:FindFirstChild("Humanoid") and
                    Player ~= a9
             then
                local gh = Player.Character.HumanoidRootPart
                local gi = gh.Position
                local fJ, gj = bY:WorldToViewportPoint(gi)
                local gk =
                    (bY:WorldToViewportPoint(gi - j(0, 3, 0)).Y - bY:WorldToViewportPoint(gi + j(0, 2.6, 0)).Y) / 2
                local gl, e8 =
                    I(values.visuals.players.outlines.Jumbobox, "drawings") ~= nil,
                    I(values.visuals.players.outlines.Jumbobox, "text") ~= nil
                N.Box.Color = values.visuals.players.box.Color
                N.Box.Size = i(gk * 1.5, gk * 1.9)
                N.Box.Position = i(fJ.X - gk * 1.5 / 2, fJ.Y - gk * 1.6 / 2)
                if values.visuals.players.box.Toggle then
                    N.Box.Visible = gj
                    if gl then
                        N.BoxOutline.Size = N.Box.Size
                        N.BoxOutline.Position = N.Box.Position
                        N.BoxOutline.Visible = gj
                    else
                        N.BoxOutline.Visible = false
                    end
                else
                    N.Box.Visible = false
                    N.BoxOutline.Visible = false
                end
                if values.visuals.players.health.Toggle then
                    N.Health.Color = m(0, 1, 0)
                    N.Health.From = i(N.Box.Position.X - 5, N.Box.Position.Y + N.Box.Size.Y)
                    N.Health.To =
                        i(
                        N.Health.From.X,
                        N.Health.From.Y -
                            p(Player.Character.Humanoid.Health / Player.Character.Humanoid.MaxHealth, 0, 1) *
                                N.Box.Size.Y
                    )
                    N.Health.Visible = gj
                    if gl then
                        N.HealthOutline.From = i(N.Health.From.X, N.Box.Position.Y + N.Box.Size.Y + 1)
                        N.HealthOutline.To = i(N.Health.From.X, N.Health.From.Y - 1 * N.Box.Size.Y - 1)
                        N.HealthOutline.Visible = gj
                    else
                        N.HealthOutline.Visible = false
                    end
                else
                    N.Health.Visible = false
                    N.HealthOutline.Visible = false
                end
                if values.visuals.players.weapon.Toggle then
                    N.Weapon.Color = values.visuals.players.weapon.Color
                    N.Weapon.Text = Player.Character.EquippedTool.Value
                    N.Weapon.Position = i(N.Box.Size.X / 2 + N.Box.Position.X, N.Box.Size.Y + N.Box.Position.Y + 1)
                    N.Weapon.Font = Drawing.Fonts[values.visuals.players.font.Dropdown]
                    N.Weapon.Outline = e8
                    N.Weapon.Size = values.visuals.players.size.Slider
                    N.Weapon.Visible = gj
                else
                    N.Weapon.Visible = false
                end
                if values.visuals.players["weapon icon"].Toggle then
                    f4[Player.Name].ImageColor3 = values.visuals.players["weapon icon"].Color
                    f4[Player.Name].Image = cj.getWeaponOfKiller(Player.Character.EquippedTool.Value)
                    f4[Player.Name].Position =
                        A(
                        0,
                        N.Box.Size.X / 2 + N.Box.Position.X,
                        0,
                        N.Box.Size.Y + N.Box.Position.Y + (values.visuals.players.weapon.Toggle and -10 or -22)
                    )
                    f4[Player.Name].Visible = gj
                else
                    f4[Player.Name].Visible = false
                end
                if values.visuals.players.name.Toggle then
                    N.Name.Color = values.visuals.players.name.Color
                    N.Name.Text = Player.Name
                    N.Name.Position = i(N.Box.Size.X / 2 + N.Box.Position.X, N.Box.Position.Y - 16)
                    N.Name.Font = Drawing.Fonts[values.visuals.players.font.Dropdown]
                    N.Name.Outline = e8
                    N.Name.Size = values.visuals.players.size.Slider
                    N.Name.Visible = gj
                else
                    N.Name.Visible = false
                end
                local gm = N.Box.Position.Y - 1
                if I(values.visuals.players.indicators.Jumbobox, "armor") and Player:FindFirstChild("Kevlar") then
                    N.Armor.Color = n(0, 150, 255)
                    N.Armor.Text = Player:FindFirstChild("Helmet") and "HK" or "K"
                    N.Armor.Position = i(N.Box.Size.X + N.Box.Position.X + 12, gm)
                    N.Armor.Font = Drawing.Fonts[values.visuals.players.font.Dropdown]
                    N.Armor.Outline = e8
                    N.Armor.Size = values.visuals.players.size.Slider
                    N.Armor.Visible = gj
                    gm = gm + values.visuals.players.size.Slider
                else
                    N.Armor.Visible = false
                end
            else
                if Player.Name ~= a9.Name then
                    f4[Player.Name].Visible = false
                    for T, v in pairs(N) do
                        v.Visible = false
                    end
                end
            end
        end
        if values.misc.ui.scaling.Toggle then
            dg:SetScale(values.misc.ui.amount.Slider / 10)
        else
            dg:SetScale(1)
        end
    end
)
local gn = getrawmetatable(game)
local go = gn.__namecall
local gp = gn.__index
local gq = gn.__newindex
setreadonly(gn, false)
gn.__namecall = function(self, ...)
    local gr = tostring(getnamecallmethod())
    local dS = {...}
    if gr == "SetPrimaryPartCFrame" and self.Name == "Arms" then
        if values.visuals.self["third person"].Toggle and values.visuals.self["third person"].Active and a9.Character then
            dS[1] = dS[1] * k(99, 99, 99)
        else
            if values.visuals.self["viewmodel changer"].Toggle then
                dS[1] = dS[1] * ce
            end
        end
    end
    if gr == "SetPrimaryPartCFrame" and self.Name ~= "Arms" then
        dS[1] = dS[1] + j(0, 3, 0)
        coroutine.wrap(
            function()
                fm = true
                wait(2)
                fm = false
            end
        )()
    end
    if gr == "Kick" then
        return
    end
    if gr == "FireServer" then
        if D(self.Name) == 38 then
            return
        elseif
            self.Name == "FallDamage" and I(values.misc.client["damage bypass"].Jumbobox, "fall") or
                values.misc.movement["jump bug"].Toggle and values.misc.movement["jump bug"].Active
         then
            return
        elseif self.Name == "BURNME" and I(values.misc.client["damage bypass"].Jumbobox, "fire") then
            return
        elseif self.Name == "ControlTurn" and not checkcaller() then
            return
        end
        if self.Name == "PlayerChatted" and values.misc.client["chat alive"].Toggle then
            dS[2] = false
            dS[3] = "Innocent"
            dS[4] = false
            dS[5] = false
        end
        if self.Name == "ReplicateCamera" and values.misc.client["anti spectate"].Toggle then
            dS[1] = k()
        end
        if self.Name == "ReplicateCamera" and values.misc.client["upside down spectate"].Toggle then
            dS[1] = dS[1] * CFrame.Angles(0, 0, math.rad(180))
        end
    end
    if gr == "FindPartOnRayWithWhitelist" and not checkcaller() and b_.gun ~= "none" and b_.gun.Name ~= "C4" then
        if #dS[2] == 1 and dS[2][1].Name == "SpawnPoints" then
            local gs = a9.Status.Team.Value
            if I(values.misc.client.shop.Jumbobox, "anywhere") then
                return gs == "T" and dS[2][1].BuyArea or dS[2][1].BuyArea2
            end
        end
    end
    if gr == "FindPartOnRayWithIgnoreList" and dS[2][1] == workspace.Debris then
        if not checkcaller() or fj then
            if I(values.misc.client["gun modifiers"].Jumbobox, "penetration") then
                H(dS[2], workspace.Map)
            end
            if I(values.misc.client["gun modifiers"].Jumbobox, "spread") then
                dS[1] = G(bY.CFrame.p, bY.CFrame.LookVector * b_.gun.Range.Value)
            end
            local fF = fg(ff(b_.gun.Name))
            if
                values.legit.aimbot["silent aim"].Toggle and values.legit.aimbot["silent aim"].Active and
                    fF["silent aim"].Toggle
             then
                local fH = {a9.Character, bY, workspace.Map.Clips, workspace.Map.SpawnPoints, workspace.Debris}
                local g0 = 9999
                local g1
                if not I(fF.conditions.Jumbobox, "smoke") then
                    H(fH, workspace.Ray_Ignore)
                end
                coroutine.wrap(
                    function()
                        if
                            not I(fF.conditions.Jumbobox, "blind") or
                                a9.PlayerGui.Blnd.Blind.BackgroundTransparency > 0.9
                         then
                            if not I(fF.conditions.Jumbobox, "blind") or SelfVelocity.Magnitude < 3 then
                                for b9, Player in pairs(a8:GetPlayers()) do
                                    if
                                        Player.Character and Player.Character:FindFirstChild("Humanoid") and
                                            Player.Character:FindFirstChild("Humanoid").Health > 0
                                     then
                                        if
                                            not values.legit.settings["forcefield check"].Toggle or
                                                not Player.Character:FindFirstChildOfClass("ForceField")
                                         then
                                            if Player.Team ~= a9.Team or values.legit.settings["free for all"].Toggle then
                                                local fJ, g2 =
                                                    bY:WorldToViewportPoint(Player.Character.HumanoidRootPart.Position)
                                                if g2 then
                                                    local g3 = (i(fJ.X, fJ.Y) - i(aa.X, aa.Y)).Magnitude
                                                    if g3 < fF["field of view"].Slider then
                                                        local fM =
                                                            fF.priority.Dropdown == "head" and Player.Character.Head or
                                                            fF.priority.Dropdown == "chest" and
                                                                Player.Character.UpperTorso
                                                        if fF.priority.Dropdown == "closest" then
                                                            local g4 =
                                                                bY:WorldToViewportPoint(Player.Character.Head.Position)
                                                            local g5 =
                                                                bY:WorldToViewportPoint(
                                                                Player.Character.UpperTorso.Position
                                                            )
                                                            local g6 = (i(g4.X, g4.Y) - i(aa.X, aa.Y)).Magnitude
                                                            local g7 = (i(g5.X, g5.Y) - i(aa.X, aa.Y)).Magnitude
                                                            if g6 < g7 then
                                                                fM = Player.Character.Head
                                                            else
                                                                fM = Player.Character.UpperTorso
                                                            end
                                                        end
                                                        if fM ~= nil then
                                                            if not I(fF.conditions.Jumbobox, "visible") then
                                                                g1 = fM
                                                            else
                                                                local fQ =
                                                                    G(
                                                                    bY.CFrame.Position,
                                                                    (fM.Position - bY.CFrame.Position).unit *
                                                                        (fM.Position - bY.CFrame.Position).magnitude
                                                                )
                                                                local fI, fJ =
                                                                    workspace:FindPartOnRayWithIgnoreList(
                                                                    fQ,
                                                                    fH,
                                                                    false,
                                                                    true
                                                                )
                                                                if fI and fI:FindFirstAncestor(Player.Name) then
                                                                    g1 = fM
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        local fI = t(1, 100) <= fF.hitchance.Slider
                        if g1 ~= nil and fI then
                            dS[1] =
                                G(
                                bY.CFrame.Position,
                                (g1.Position - bY.CFrame.Position).unit * (g1.Position - bY.CFrame.Position).magnitude
                            )
                        end
                    end
                )()
            end
            if ci ~= nil then
                local fE =
                    values.rage.aimbot.origin.Dropdown == "character" and
                    a9.Character.LowerTorso.Position + j(0, 2.5, 0) or
                    bY.CFrame.p
                if values.rage.aimbot["delay shot"].Toggle then
                    spawn(
                        function()
                            dS[1] = G(fE, (ci.Position - fE).unit * (ci.Position - fE).magnitude)
                        end
                    )
                else
                    dS[1] = G(fE, (ci.Position - fE).unit * (ci.Position - fE).magnitude)
                end
            end
        end
    end
    if gr == "InvokeServer" then
        if self.Name == "Moolah" then
            return
        elseif self.Name == "Hugh" then
            return
        elseif self.Name == "Filter" and values.misc.chat["no filter"].Toggle then
            return dS[1]
        end
    end
    if gr == "LoadAnimation" and self.Name == "Humanoid" then
        if values.rage.others["leg movement"].Dropdown == "slide" then
            if C(dS[1].Name, "Run") or C(dS[1].Name, "Jump") then
                dS[1] = cn
            end
        end
        if values.rage.others["no animations"].Toggle then
            dS[1] = cn
        end
    end
    if gr == "FireServer" and self.Name == "HitPart" then
        if values.visuals.world["bullet tracers"].Toggle then
            if values.visuals.world["bullet tracers type"].Dropdown == "Normal" then
                coroutine.wrap(
                    function()
                        beam = l("Part")
                        beam.Anchored = true
                        beam.CanCollide = false
                        beam.Material = "ForceField"
                        beam.Color = values.visuals.world["bullet tracers"].Color
                        beam.Size = j(0.1, 0.1, (bY.CFrame.Position - dS[2]).Magnitude)
                        beam.CFrame = k(bY.CFrame.Position, dS[2]) * k(0, 0, -beam.Size.Z / 2)
                        beam.Parent = workspace.Debris
                        a:Tween(
                            beam,
                            TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Transparency = 1}
                        )
                        wait(3)
                        beam:Destroy()
                    end
                )()
            else
                coroutine.wrap(
                    function()
                        pcall(
                            function()
                                local gt = c:New3DLine()
                                gt.Visible = true
                                gt.ZIndex = 3
                                gt.Transparency = 1
                                gt.Color = values.visuals.world["bullet tracers"].Color
                                gt.Thickness = 1
                                gt.From = bY.CFrame.Position
                                gt.To = dS[2]
                                wait(3)
                                gt:Remove()
                            end
                        )
                    end
                )()
            end
        end
        if values.rage.aimbot["force hit"].Toggle then
            dS[1] = ci
            dS[2] = ci.Position
        end
        if values.rage.aimbot["prediction"].Dropdown ~= "off" and ci ~= nil then
            coroutine.wrap(
                function()
                    if a8:GetPlayerFromCharacter(dS[1].Parent) or dS[1] == ci then
                        if values.rage.aimbot["prediction"].Dropdown == "cframe" then
                            if a8:GetPlayerFromCharacter(dS[1].Parent) or dS[1] == ci then
                                local gu = ci.Parent.HumanoidRootPart.Position
                                local gv = ci.Parent.HumanoidRootPart.OldPosition.Value
                                local gw = (j(gu.X, 0, gu.Z) - j(gv.X, 0, gv.Z)) / fk
                                local gx = j(gw.X / gw.magnitude, 0, gw.Z / gw.magnitude)
                                dS[2] = dS[2] + gx * d0 / z(d0, 1.5) * gx / (gx / 2)
                                dS[4] = 0
                                dS[12] = dS[12] - 500
                            end
                        else
                            local gy = ci.Parent.HumanoidRootPart.Velocity
                            local gz = Vector3.new(gy.X / gy.magnitude, 0, gy.Z / gy.magnitude)
                            if gy.magnitude >= 8 then
                                dS[2] = dS[2] + gz * gy.magnitude * d0 / 1000 * (d0 > 200 and 1.5 or 2)
                                dS[4] = 0
                                dS[12] = dS[12] - 500
                            end
                        end
                    end
                end
            )()
        end
        if values.rage.aimbot["sex package"].Toggle and ci ~= nil then
            coroutine.wrap(
                function()
                    if a8:GetPlayerFromCharacter(dS[1].Parent) or dS[1] == ci then
                        local gu = ci.Parent.HumanoidRootPart.Position
                        local gv = ci.Parent.HumanoidRootPart.OldPosition.Value
                        local gw = (j(gu.X, 0, gu.Z) - j(gv.X, 0, gv.Z)) / fk
                        local gx = j(gw.X / gw.magnitude, 0, gw.Z / gw.magnitude)
                        dS[2] = dS[2] + gx * d0 / z(d0, 1.5) * gx / (gx / 2)
                        dS[4] = 0
                        dS[12] = dS[12] - 500
                    end
                end
            )()
        end
        if values.visuals.world["impacts"].Toggle then
            coroutine.wrap(
                function()
                    local gA = l("Part")
                    gA.Transparency = 1
                    gA.Anchored = true
                    gA.CanCollide = false
                    gA.Size = j(0.3, 0.3, 0.3)
                    gA.Position = dS[2]
                    local gB = l("SelectionBox")
                    gB.LineThickness = 0
                    gB.SurfaceTransparency = 0.5
                    gB.Color3 = values.visuals.world["impacts"].Color
                    gB.SurfaceColor3 = values.visuals.world["impacts"].Color
                    gB.Parent = gA
                    gB.Adornee = gA
                    gA.Parent = workspace.Debris
                    wait(5.9)
                    a:Tween(
                        gB,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {SurfaceTransparency = 1}
                    )
                    gA:Destroy()
                end
            )()
            if values.visuals.world["hit chams"].Toggle then
                coroutine.wrap(
                    function()
                        if
                            a8:GetPlayerFromCharacter(dS[1].Parent) and
                                a8:GetPlayerFromCharacter(dS[1].Parent).Team ~= a9.Team
                         then
                            for b9, dJ in pairs(dS[1].Parent:GetChildren()) do
                                if dJ:IsA("BasePart") or dJ.Name == "Head" then
                                    coroutine.wrap(
                                        function()
                                            local dK = l("Part")
                                            dK.CFrame = dJ.CFrame
                                            dK.Anchored = true
                                            dK.CanCollide = false
                                            dK.Material = Enum.Material.ForceField
                                            dK.Color = values.visuals.world["hit chams"].Color
                                            dK.Size = dJ.Size
                                            dK.Parent = workspace.Debris
                                            a:Tween(
                                                dK,
                                                TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                                {Transparency = 1}
                                            )
                                            wait(2)
                                            dK:Destroy()
                                        end
                                    )()
                                end
                            end
                        end
                    end
                )()
            end
        end
    end
    return go(self, unpack(dS))
end
local gp
gp =
    hookmetamethod(
    game,
    "__index",
    function(self, ab)
        local gC = getcallingscript()
        if not checkcaller() and self == cc and a9.Character ~= nil and a9.Character:FindFirstChild("UpperTorso") then
            local gD = F(ab, "v_", "")
            if not C(gD, "Arms") then
                if cd[gD]:FindFirstChild("Melee") and values.skins.knife["knife changer"].Toggle then
                    if cc:FindFirstChild("v_" .. values.skins.knife.model.Scroll) then
                        return cc:FindFirstChild("v_" .. values.skins.knife.model.Scroll)
                    else
                        local cR = d1.Knives[values.skins.knife.model.Scroll]:Clone()
                        return cR
                    end
                end
            end
        end
        if ab == "Value" then
            if self.Name == "Auto" and I(values.misc.client["gun modifiers"].Jumbobox, "automatic") then
                return true
            elseif self.Name == "ReloadTime" and I(values.misc.client["gun modifiers"].Jumbobox, "reload") then
                return 0.001
            elseif self.Name == "EquipTime" and I(values.misc.client["gun modifiers"].Jumbobox, "equip") then
                return 0.001
            elseif self.Name == "BuyTime" and I(values.misc.client.shop.Jumbobox, "inf time") then
                return 5
            end
        end
        return gp(self, ab)
    end
)
if a9.PlayerGui:FindFirstChild("Performance") then
    local gE = a9.PlayerGui.Performance.Perf
end
gn.__newindex = function(self, T, v)
    if self:IsA("Humanoid") and T == "JumpPower" and not checkcaller() then
        if values.misc.movement["jump bug"].Toggle and values.misc.movement["jump bug"].Active then
            v = 24
        end
        if values.misc.movement["edge bug"].Toggle and values.misc.movement["edge bug"].Active then
            v = 0
        end
    elseif self:IsA("Humanoid") and T == "CameraOffset" then
        if
            values.rage.angles.enabled.Toggle and
                (values.rage.angles["body roll"].Dropdown == "180" or values.rage.angles["body roll"].Dropdown == "spin") and
                not fm
         then
            v = v + j(0, -3.5, 0)
        end
    end
    return gq(self, T, v)
end
c1.Scope:GetPropertyChangedSignal("Visible"):Connect(
    function(dQ)
        if not I(values.visuals.effects.removals.Jumbobox, "scope lines") then
            return
        end
        if dQ ~= false then
            c1.Scope.Visible = false
        end
    end
)
c2:GetPropertyChangedSignal("Visible"):Connect(
    function(dQ)
        if not a9.Character then
            return
        end
        if not values.visuals.effects["force crosshair"].Toggle then
            return
        end
        if a9.Character:FindFirstChild("AIMING") then
            return
        end
        c2.Visible = true
    end
)
a9.Additionals.TotalDamage:GetPropertyChangedSignal("Value"):Connect(
    function(dQ)
        if dQ == 0 then
            return
        end
        coroutine.wrap(
            function()
                if values.misc.client.hitmarker.Toggle then
                    local gt = Drawing.new("Line")
                    local gF = Drawing.new("Line")
                    local gG = Drawing.new("Line")
                    local gH = Drawing.new("Line")
                    local bA, bu = bY.ViewportSize.X / 2, bY.ViewportSize.Y / 2
                    gt.From = i(bA + 4, bu + 4)
                    gt.To = i(bA + 10, bu + 10)
                    gt.Color = values.misc.client.hitmarker.Color
                    gt.Visible = true
                    gF.From = i(bA + 4, bu - 4)
                    gF.To = i(bA + 10, bu - 10)
                    gF.Color = values.misc.client.hitmarker.Color
                    gF.Visible = true
                    gG.From = i(bA - 4, bu - 4)
                    gG.To = i(bA - 10, bu - 10)
                    gG.Color = values.misc.client.hitmarker.Color
                    gG.Visible = true
                    gH.From = i(bA - 4, bu + 4)
                    gH.To = i(bA - 10, bu + 10)
                    gH.Color = values.misc.client.hitmarker.Color
                    gH.Visible = true
                    gt.Transparency = 1
                    gF.Transparency = 1
                    gG.Transparency = 1
                    gH.Transparency = 1
                    gt.Thickness = 1
                    gF.Thickness = 1
                    gG.Thickness = 1
                    gH.Thickness = 1
                    wait(0.3)
                    for T = 1, 0, -0.1 do
                        wait()
                        gt.Transparency = T
                        gF.Transparency = T
                        gG.Transparency = T
                        gH.Transparency = T
                    end
                    gt:Remove()
                    gF:Remove()
                    gG:Remove()
                    gH:Remove()
                end
            end
        )()
        if values.visuals.world.hitsound.Dropdown == "none" then
            return
        end
        local gI = l("Sound")
        gI.Parent = game:GetService("SoundService")
        gI.SoundId =
            values.visuals.world.hitsound.Dropdown == "skeet" and "rbxassetid://5447626464" or
            values.visuals.world.hitsound.Dropdown == "neverlose" and "rbxassetid://5043539486" or
            values.visuals.world.hitsound.Dropdown == "rust" and "rbxassetid://5043539486" or
            values.visuals.world.hitsound.Dropdown == "bag" and "rbxassetid://364942410" or
            values.visuals.world.hitsound.Dropdown == "baimware" and "rbxassetid://6607339542" or
            values.visuals.world.hitsound.Dropdown == "osu" and "rbxassetid://7149919358" or
            values.visuals.world.hitsound.Dropdown == "Tf2" and "rbxassetid://296102734" or
            values.visuals.world.hitsound.Dropdown == "Tf2 pan" and "rbxassetid://3431749479" or
            values.visuals.world.hitsound.Dropdown == "M55solix" and "rbxassetid://364942410" or
            values.visuals.world.hitsound.Dropdown == "Slap" and "rbxassetid://4888372697" or
            values.visuals.world.hitsound.Dropdown == "1" and "rbxassetid://7349055654" or
            values.visuals.world.hitsound.Dropdown == "Minecraft" and "rbxassetid://7273736372" or
            values.visuals.world.hitsound.Dropdown == "jojo" and "rbxassetid://6787514780" or
            values.visuals.world.hitsound.Dropdown == "vibe" and "rbxassetid://1848288500" or
            values.visuals.world.hitsound.Dropdown == "supersmash" and "rbxassetid://2039907664" or
            values.visuals.world.hitsound.Dropdown == "epic" and "rbxassetid://7344303740" or
            values.visuals.world.hitsound.Dropdown == "retro" and "rbxassetid://3466984142" or
            values.visuals.world.hitsound.Dropdown == "quek" and "rbxassetid://4868633804" or
            values.visuals.world.hitsound.Dropdown
        gI.Volume = values.visuals.world["sound volume"].Slider
        gI.PlayOnRemove = true
        gI:Destroy()
    end
)
a9.Status.Kills:GetPropertyChangedSignal("Value"):Connect(
    function(dQ)
        if dQ == 0 then
            return
        end
        if values.misc.chat["kill say"].Toggle then
            game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(
                values.misc.chat["message"].Text ~= "Super Idol" and values.misc.chat["message"].Text or
                    "The smile of Super Idol is not as sweet as yours. The sun at noon in August is not as dazzling as you. I love you at 105 °C. Drops of pure distilled water",
                false,
                "Innocent",
                false,
                true
            )
        end
    end
)
ch.ChildAdded:Connect(
    function(cB)
        if cB.Name == "Fires" then
            cB.ChildAdded:Connect(
                function(dU)
                    if values.visuals.world["molly radius"].Toggle then
                        dU.Transparency = values.visuals.world["molly radius"].Transparency
                        dU.Color = values.visuals.world["molly radius"].Color
                    end
                end
            )
        end
        if cB.Name == "Smokes" then
            cB.ChildAdded:Connect(
                function(dP)
                    bV.RenderStepped:Wait()
                    local gJ = l("NumberValue")
                    gJ.Value = dP.ParticleEmitter.Rate
                    gJ.Name = "OriginalRate"
                    gJ.Parent = dP
                    if I(values.visuals.effects.removals.Jumbobox, "smokes") then
                        dP.ParticleEmitter.Rate = 0
                    end
                    dP.Material = Enum.Material.ForceField
                    if values.visuals.world["smoke radius"].Toggle then
                        dP.Transparency = 0
                        dP.Color = values.visuals.world["smoke radius"].Color
                    end
                end
            )
        end
    end
)
if ch:FindFirstChild("Fires") then
    ch:FindFirstChild("Fires").ChildAdded:Connect(
        function(dU)
            if values.visuals.world["molly radius"].Toggle then
                dU.Transparency = values.visuals.world["molly radius"].Transparency
                dU.Color = values.visuals.world["molly radius"].Color
            end
        end
    )
end
if ch:FindFirstChild("Smokes") then
    for b9, dP in pairs(ch:FindFirstChild("Smokes"):GetChildren()) do
        local gJ = l("NumberValue")
        gJ.Value = dP.ParticleEmitter.Rate
        gJ.Name = "OriginalRate"
        gJ.Parent = dP
        dP.Material = Enum.Material.ForceField
    end
    ch:FindFirstChild("Smokes").ChildAdded:Connect(
        function(dP)
            bV.RenderStepped:Wait()
            local gJ = l("NumberValue")
            gJ.Value = dP.ParticleEmitter.Rate
            gJ.Name = "OriginalRate"
            gJ.Parent = dP
            if I(values.visuals.effects.removals.Jumbobox, "smokes") then
                dP.ParticleEmitter.Rate = 0
            end
            dP.Material = Enum.Material.ForceField
            if values.visuals.world["smoke radius"].Toggle then
                dP.Transparency = 0
                dP.Color = values.visuals.world["smoke radius"].Color
            end
        end
    )
end
bY.ChildAdded:Connect(
    function(cB)
        if I(values.misc.client["gun modifiers"].Jumbobox, "ammo") then
            b_.ammocount = 999999
            b_.primarystored = 999999
            b_.ammocount2 = 999999
            b_.secondarystored = 999999
        end
        bV.RenderStepped:Wait()
        if cB.Name ~= "Arms" then
            return
        end
        local gK
        for T, v in pairs(cB:GetChildren()) do
            if v:IsA("Model") and (v:FindFirstChild("Right Arm") or v:FindFirstChild("Left Arm")) then
                gK = v
            end
        end
        if gK == nil then
            return
        end
        for T, v in pairs(cB:GetChildren()) do
            if (v:IsA("BasePart") or v:IsA("Part")) and v.Transparency ~= 1 and v.Name ~= "Flash" then
                local gL = true
                if v:IsA("Part") and v:FindFirstChild("Mesh") and not v:IsA("BlockMesh") then
                    gL = false
                    local gM, gN =
                        pcall(
                        function()
                            local gO = l("StringValue")
                            gO.Value = v.Mesh.TextureId
                            gO.Name = "OriginalTexture"
                            gO.Parent = v.Mesh
                        end
                    )
                    local gP, gQ =
                        pcall(
                        function()
                            local gO = l("StringValue")
                            gO.Value = v.Mesh.TextureID
                            gO.Name = "OriginalTexture"
                            gO.Parent = v.Mesh
                        end
                    )
                    if gM or gP then
                        gL = true
                    end
                end
                for f3, df in pairs(v:GetChildren()) do
                    if df:IsA("BasePart") or df:IsA("Part") then
                        H(ca, df)
                    end
                end
                if gL then
                    H(ca, v)
                end
            end
        end
        local gR =
            b_.gun ~= "none" and values.skins.knife["knife changer"].Toggle and b_.gun:FindFirstChild("Melee") and
            values.skins.knife.model.Scroll or
            b_.gun ~= "none" and b_.gun.Name
        if values.skins.skins["skin changer"].Toggle and gR ~= nil and cG:FindFirstChild(gR) then
            if values.skins.skins.skin.Scroll[gR] ~= "Inventory" then
                cH(gR, values.skins.skins.skin.Scroll[gR])
            end
        end
        for b9, v in pairs(ca) do
            if v:IsA("MeshPart") then
                local gO = l("StringValue")
                gO.Value = v.TextureID
                gO.Name = "OriginalTexture"
                gO.Parent = v
            end
            local gS = l("Color3Value")
            gS.Value = v.Color
            gS.Name = "OriginalColor"
            gS.Parent = v
            local gT = l("StringValue")
            gT.Value = v.Material.Name
            gT.Name = "OriginalMaterial"
            gT.Parent = v
            if values.visuals.effects["weapon chams"].Toggle then
                cF(v)
            end
        end
        c8 = gK:FindFirstChild("Right Arm")
        c9 = gK:FindFirstChild("Left Arm")
        if c8 then
            local gS = l("Color3Value")
            gS.Value = c8.Color
            gS.Name = "Color3Value"
            gS.Parent = c8
            if values.visuals.effects["arm chams"].Toggle then
                c8.Color = values.visuals.effects["arm chams"].Color
                c8.Transparency = values.visuals.effects["arm chams"].Transparency
            end
            c5 = c8:FindFirstChild("Glove") or c8:FindFirstChild("RGlove")
            if values.skins.glove["glove changer"].Toggle and b_.gun ~= "none" then
                if c5 then
                    c5:Destroy()
                end
                c5 = cp[values.skins.glove.model.Dropdown].RGlove:Clone()
                c5.Mesh.TextureId =
                    co[values.skins.glove.model.Dropdown][
                    values.skins.glove.model.Scroll[values.skins.glove.model.Dropdown]
                ].Textures.TextureId
                c5.Parent = c8
                c5.Transparency = 0
                c5.Welded.Part0 = c8
            end
            if c5.Transparency == 1 then
                c5:Destroy()
                c5 = nil
            else
                local gU = l("StringValue")
                gU.Value = c5.Mesh.TextureId
                gU.Name = "StringValue"
                gU.Parent = c5
                if values.visuals.effects["accessory chams"].Toggle then
                    cC(c5)
                end
            end
            c7 = c8:FindFirstChild("Sleeve")
            if c7 ~= nil then
                local gV = l("StringValue")
                gV.Value = c7.Mesh.TextureId
                gV.Name = "StringValue"
                gV.Parent = c7
                if values.visuals.effects["arm chams"].Toggle then
                    c9.Color = values.visuals.effects["arm chams"].Color
                end
                if values.visuals.effects["accessory chams"].Toggle then
                    cC(c7)
                end
            end
        end
        if c9 then
            local gS = l("Color3Value")
            gS.Value = c9.Color
            gS.Name = "Color3Value"
            gS.Parent = c9
            if values.visuals.effects["arm chams"].Toggle then
                c9.Color = values.visuals.effects["arm chams"].Color
                c9.Transparency = values.visuals.effects["arm chams"].Transparency
            end
            c4 = c9:FindFirstChild("Glove") or c9:FindFirstChild("LGlove")
            if values.skins.glove["glove changer"].Toggle and b_.gun ~= "none" then
                if c4 then
                    c4:Destroy()
                end
                c4 = cp[values.skins.glove.model.Dropdown].LGlove:Clone()
                c4.Mesh.TextureId =
                    co[values.skins.glove.model.Dropdown][
                    values.skins.glove.model.Scroll[values.skins.glove.model.Dropdown]
                ].Textures.TextureId
                c4.Transparency = 0
                c4.Parent = c9
                c4.Welded.Part0 = c9
            end
            if c4.Transparency == 1 then
                c4:Destroy()
                c4 = nil
            else
                local gU = l("StringValue")
                gU.Value = c4.Mesh.TextureId
                gU.Name = "StringValue"
                gU.Parent = c4
                if values.visuals.effects["accessory chams"].Toggle then
                    cC(c4)
                end
            end
            c6 = c9:FindFirstChild("Sleeve")
            if c6 ~= nil then
                local gV = l("StringValue")
                gV.Value = c6.Mesh.TextureId
                gV.Name = "StringValue"
                gV.Parent = c6
                if values.visuals.effects["accessory chams"].Toggle then
                    cC(c6)
                end
            end
        end
    end
)
bY.ChildAdded:Connect(
    function(cB)
        if cB.Name == "Arms" then
            c8, c9, c5, c7, c4, c6 = nil, nil, nil, nil, nil, nil
            ca = {}
        end
    end
)
bY:GetPropertyChangedSignal("FieldOfView"):Connect(
    function(fov)
        if a9.Character == nil then
            return
        end
        if fov == values.visuals.self["fov changer"].Slider then
            return
        end
        if values.visuals.self["on scope"].Toggle or not a9.Character:FindFirstChild("AIMING") then
            bY.FieldOfView = values.visuals.self["fov changer"].Slider
        end
    end
)
a9.Cash:GetPropertyChangedSignal("Value"):Connect(
    function(gW)
        if values.misc.client["infinite cash"].Toggle and gW ~= 8000 then
            a9.Cash.Value = 8000
        end
    end
)
if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("Origin") then
    if
        workspace.Map.Origin.Value == "de_cache" or workspace.Map.Origin.Value == "de_vertigo" or
            workspace.Map.Origin.Value == "de_nuke" or
            workspace.Map.Origin.Value == "de_aztec"
     then
        cw = bW:FindFirstChildOfClass("Sky"):Clone()
    end
end
workspace.ChildAdded:Connect(
    function(cB)
        if cB.Name == "Map" then
            wait(5)
            if values.misc.client["remove killers"].Toggle then
                if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("Killers") then
                    local e3 = workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Clone()
                    e3.Name = "KillersClone"
                    e3.Parent = workspace:FindFirstChild("Map")
                    workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Destroy()
                end
            end
            if cw ~= nil then
                cw:Destroy()
                cw = nil
            end
            local fE = workspace.Map:WaitForChild("Origin")
            if
                workspace.Map.Origin.Value == "de_cache" or workspace.Map.Origin.Value == "de_vertigo" or
                    workspace.Map.Origin.Value == "de_nuke" or
                    workspace.Map.Origin.Value == "de_aztec"
             then
                cw = bW:FindFirstChildOfClass("Sky"):Clone()
                local dV = values.visuals.world.skybox.Dropdown
                if dV ~= "none" then
                    bW:FindFirstChildOfClass("Sky"):Destroy()
                    local dW = l("Sky")
                    dW.SkyboxLf = cs[dV].SkyboxLf
                    dW.SkyboxBk = cs[dV].SkyboxBk
                    dW.SkyboxDn = cs[dV].SkyboxDn
                    dW.SkyboxFt = cs[dV].SkyboxFt
                    dW.SkyboxRt = cs[dV].SkyboxRt
                    dW.SkyboxUp = cs[dV].SkyboxUp
                    dW.Name = "override"
                    dW.Parent = bW
                end
            else
                local dV = values.visuals.world.skybox.Dropdown
                if dV ~= "none" then
                    local dW = l("Sky")
                    dW.SkyboxLf = cs[dV].SkyboxLf
                    dW.SkyboxBk = cs[dV].SkyboxBk
                    dW.SkyboxDn = cs[dV].SkyboxDn
                    dW.SkyboxFt = cs[dV].SkyboxFt
                    dW.SkyboxRt = cs[dV].SkyboxRt
                    dW.SkyboxUp = cs[dV].SkyboxUp
                    dW.Name = "override"
                    dW.Parent = bW
                end
            end
        end
    end
)
bW.ChildAdded:Connect(
    function(cB)
        if cB:IsA("Sky") and cB.Name ~= "override" then
            cw = cB:Clone()
        end
    end
)
local function gX(cB)
    if cB:IsA("Accessory") then
        H(cl, cB)
    end
    if cB:IsA("Part") then
        if cB.Name == "HeadHB" or cB.Name == "FakeHead" then
            H(cl, cB)
        end
    end
end
a9.CharacterAdded:Connect(
    function(gY)
        repeat
            bV.RenderStepped:Wait()
        until gY:FindFirstChild("Gun")
        cb = {}
        if values.skins.characters["character changer"].Toggle then
            cO(d2:FindFirstChild(values.skins.characters.skin.Scroll))
        end
        if gY:FindFirstChildOfClass("Shirt") then
            local cT = l("StringValue")
            cT.Name = "OriginalTexture"
            cT.Value = gY:FindFirstChildOfClass("Shirt").ShirtTemplate
            cT.Parent = gY:FindFirstChildOfClass("Shirt")
            if I(values.visuals.effects.removals.Jumbobox, "clothes") then
                gY:FindFirstChildOfClass("Shirt").ShirtTemplate = ""
            end
        end
        if gY:FindFirstChildOfClass("Pants") then
            local cT = l("StringValue")
            cT.Name = "OriginalTexture"
            cT.Value = gY:FindFirstChildOfClass("Pants").PantsTemplate
            cT.Parent = gY:FindFirstChildOfClass("Pants")
            if I(values.visuals.effects.removals.Jumbobox, "clothes") then
                gY:FindFirstChildOfClass("Pants").PantsTemplate = ""
            end
        end
        for T, v in pairs(gY:GetChildren()) do
            if v:IsA("BasePart") and v.Transparency ~= 1 then
                H(cb, v)
                local b4 = l("Color3Value")
                b4.Name = "OriginalColor"
                b4.Value = v.Color
                b4.Parent = v
                local cT = l("StringValue")
                cT.Name = "OriginalMaterial"
                cT.Value = v.Material.Name
                cT.Parent = v
            elseif v:IsA("Accessory") and v.Handle.Transparency ~= 1 then
                H(cb, v.Handle)
                local b4 = l("Color3Value")
                b4.Name = "OriginalColor"
                b4.Value = v.Handle.Color
                b4.Parent = v.Handle
                local cT = l("StringValue")
                cT.Name = "OriginalMaterial"
                cT.Value = v.Handle.Material.Name
                cT.Parent = v.Handle
            end
        end
        if values.visuals.self["self chams"].Toggle then
            for b9, cB in pairs(cb) do
                if cB.Parent ~= nil then
                    cB.Material = values.visuals.self["self chams material"].Dropdown
                    cB.Color = values.visuals.self["self chams"].Color
                    cB.Transparency = values.visuals.self["self chams transparency"].Slider / 10
                end
            end
        end
        a9.Character.ChildAdded:Connect(
            function(gZ)
                if gZ:IsA("Accessory") and gZ.Handle.Transparency ~= 1 then
                    H(cb, gZ.Handle)
                    local b4 = l("Color3Value")
                    b4.Name = "OriginalColor"
                    b4.Value = gZ.Handle.Color
                    b4.Parent = gZ.Handle
                    local cT = l("StringValue")
                    cT.Name = "OriginalMaterial"
                    cT.Value = gZ.Handle.Material.Name
                    cT.Parent = gZ.Handle
                    if values.visuals.self["self chams"].Toggle then
                        for b9, cB in pairs(cb) do
                            if cB.Parent ~= nil then
                                cB.Material = values.visuals.self["self chams material"].Dropdown
                                cB.Color = values.visuals.self["self chams"].Color
                                cB.Transparency = values.visuals.self["self chams transparency"].Slider / 10
                            end
                        end
                    end
                end
            end
        )
        if values.misc.animations.enabled.Toggle and values.misc.animations.enabled.Active then
            eT = a9.Character.Humanoid:LoadAnimation(eS)
            eT.Priority = Enum.AnimationPriority.Action
            eT:Play()
        end
    end
)
if a9.Character ~= nil then
    for T, v in pairs(a9.Character:GetChildren()) do
        if v:IsA("BasePart") and v.Transparency ~= 1 then
            H(cb, v)
            local b4 = l("Color3Value")
            b4.Name = "OriginalColor"
            b4.Value = v.Color
            b4.Parent = v
            local cT = l("StringValue")
            cT.Name = "OriginalMaterial"
            cT.Value = v.Material.Name
            cT.Parent = v
        elseif v:IsA("Accessory") and v.Handle.Transparency ~= 1 then
            H(cb, v.Handle)
            local b4 = l("Color3Value")
            b4.Name = "OriginalColor"
            b4.Value = v.Handle.Color
            b4.Parent = v.Handle
            local cT = l("StringValue")
            cT.Name = "OriginalMaterial"
            cT.Value = v.Handle.Material.Name
            cT.Parent = v.Handle
        end
    end
    if values.visuals.self["self chams"].Toggle then
        for b9, cB in pairs(cb) do
            if cB.Parent ~= nil then
                cB.Material = values.visuals.self["self chams material"].Dropdown
                cB.Color = values.visuals.self["self chams"].Color
                cB.Transparency = values.visuals.self["self chams transparency"].Slider / 10
            end
        end
    end
    a9.Character.ChildAdded:Connect(
        function(gZ)
            if gZ:IsA("Accessory") and gZ.Handle.Transparency ~= 1 then
                H(cb, gZ.Handle)
                local b4 = l("Color3Value")
                b4.Name = "OriginalColor"
                b4.Value = gZ.Handle.Color
                b4.Parent = gZ.Handle
                local cT = l("StringValue")
                cT.Name = "OriginalMaterial"
                cT.Value = gZ.Handle.Material.Name
                cT.Parent = gZ.Handle
                if values.visuals.self["self chams"].Toggle then
                    for b9, cB in pairs(cb) do
                        if cB.Parent ~= nil then
                            cB.Material = values.visuals.self["self chams material"].Dropdown
                            cB.Color = values.visuals.self["self chams"].Color
                            cB.Transparency = values.visuals.self["self chams transparency"].Slider / 10
                        end
                    end
                end
            end
        end
    )
end
a8.PlayerAdded:Connect(
    function(Player)
        Player:GetPropertyChangedSignal("Team"):Connect(
            function(cz)
                wait()
                if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                    for d6, cM in pairs(Player.Character:GetDescendants()) do
                        if cM.Name == "VisibleCham" or cM.Name == "WallCham" then
                            if values.visuals.players.chams.Toggle then
                                if values.visuals.players.teammates.Toggle or Player.Team ~= a9.Team then
                                    cM.Visible = true
                                else
                                    cM.Visible = false
                                end
                            else
                                cM.Visible = false
                            end
                            cM.Color3 = values.visuals.players.chams.Color
                        end
                    end
                end
            end
        )
        Player.CharacterAdded:Connect(
            function(fs)
                fs.ChildAdded:Connect(
                    function(cB)
                        wait(1)
                        gX(cB)
                    end
                )
                wait(1)
                if fs ~= nil then
                    local bD = l("Vector3Value")
                    bD.Name = "OldPosition"
                    bD.Value = fs.HumanoidRootPart.Position
                    bD.Parent = fs.HumanoidRootPart
                    for b9, cB in pairs(fs:GetChildren()) do
                        if
                            cB:IsA("BasePart") and Player ~= a9 and cB.Name ~= "HumanoidRootPart" and cB.Name ~= "Head" and
                                cB.Name ~= "BackC4" and
                                cB.Name ~= "HeadHB"
                         then
                            local VisibleCham = l("BoxHandleAdornment")
                            VisibleCham.Name = "VisibleCham"
                            VisibleCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle
                            VisibleCham.ZIndex = 8
                            VisibleCham.Size = cB.Size + j(0.1, 0.1, 0.1)
                            VisibleCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle
                            VisibleCham.Transparency = 0
                            local WallCham = l("BoxHandleAdornment")
                            WallCham.Name = "WallCham"
                            WallCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle
                            WallCham.ZIndex = 5
                            WallCham.Size = cB.Size + j(0.1, 0.1, 0.1)
                            WallCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle
                            WallCham.Transparency = 0.7
                            if values.visuals.players.chams.Toggle then
                                if values.visuals.players.teammates.Toggle or Player.Team ~= a9.Team then
                                    VisibleCham.Visible = true
                                    WallCham.Visible = true
                                else
                                    VisibleCham.Visible = false
                                    WallCham.Visible = false
                                end
                            else
                                VisibleCham.Visible = false
                                WallCham.Visible = false
                            end
                            H(cr, VisibleCham)
                            H(cr, WallCham)
                            VisibleCham.Color3 = values.visuals.players.chams.Color
                            WallCham.Color3 = values.visuals.players.chams.Color
                            WallCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle
                            VisibleCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle
                            VisibleCham.AdornCullingMode = "Never"
                            WallCham.AdornCullingMode = "Never"
                            VisibleCham.Adornee = cB
                            VisibleCham.Parent = cB
                            WallCham.Adornee = cB
                            WallCham.Parent = cB
                        end
                    end
                end
            end
        )
    end
)
for b9, Player in pairs(a8:GetPlayers()) do
    if Player ~= a9 then
        Player:GetPropertyChangedSignal("Team"):Connect(
            function(cz)
                wait()
                if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                    for d6, cM in pairs(Player.Character:GetDescendants()) do
                        if cM.Name == "VisibleCham" or cM.Name == "WallCham" then
                            if values.visuals.players.chams.Toggle then
                                if values.visuals.players.teammates.Toggle or Player.Team ~= a9.Team then
                                    cM.Visible = true
                                else
                                    cM.Visible = false
                                end
                            else
                                cM.Visible = false
                            end
                            cM.Color3 = values.visuals.players.chams.Color
                        end
                    end
                end
            end
        )
    else
        a9:GetPropertyChangedSignal("Team"):Connect(
            function(cz)
                wait()
                for b9, Player in pairs(a8:GetPlayers()) do
                    if Player.Character then
                        for d6, cM in pairs(Player.Character:GetDescendants()) do
                            if cM.Name == "VisibleCham" or cM.Name == "WallCham" then
                                if values.visuals.players.chams.Toggle then
                                    if values.visuals.players.teammates.Toggle or Player.Team ~= a9.Team then
                                        cM.Visible = true
                                    else
                                        cM.Visible = false
                                    end
                                else
                                    cM.Visible = false
                                end
                                cM.Color3 = values.visuals.players.chams.Color
                            end
                        end
                    end
                end
            end
        )
    end
    Player.CharacterAdded:Connect(
        function(fs)
            fs.ChildAdded:Connect(
                function(cB)
                    wait(1)
                    gX(cB)
                end
            )
            wait(1)
            if Player.Character ~= nil and Player.Character:FindFirstChild("HumanoidRootPart") then
                local bD = l("Vector3Value")
                bD.Value = Player.Character.HumanoidRootPart.Position
                bD.Name = "OldPosition"
                bD.Parent = Player.Character.HumanoidRootPart
                for b9, cB in pairs(Player.Character:GetChildren()) do
                    if
                        cB:IsA("BasePart") and Player ~= a9 and cB.Name ~= "HumanoidRootPart" and cB.Name ~= "Head" and
                            cB.Name ~= "BackC4" and
                            cB.Name ~= "HeadHB"
                     then
                        local VisibleCham = l("BoxHandleAdornment")
                        VisibleCham.Name = "VisibleCham"
                        VisibleCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle
                        VisibleCham.ZIndex = 5
                        VisibleCham.Size = cB.Size + j(0.1, 0.1, 0.1)
                        VisibleCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle
                        VisibleCham.Transparency = 0
                        local WallCham = l("BoxHandleAdornment")
                        WallCham.Name = "WallCham"
                        WallCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle
                        WallCham.ZIndex = 5
                        WallCham.Size = cB.Size + j(0.1, 0.1, 0.1)
                        WallCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle
                        WallCham.Transparency = 0.7
                        if values.visuals.players.chams.Toggle then
                            if values.visuals.players.teammates.Toggle or Player.Team ~= a9.Team then
                                VisibleCham.Visible = true
                                WallCham.Visible = true
                            else
                                VisibleCham.Visible = false
                                WallCham.Visible = false
                            end
                        else
                            VisibleCham.Visible = false
                            WallCham.Visible = false
                        end
                        H(cr, VisibleCham)
                        H(cr, WallCham)
                        VisibleCham.Color3 = values.visuals.players.chams.Color
                        WallCham.Color3 = values.visuals.players.chams.Color
                        VisibleCham.AdornCullingMode = "Never"
                        WallCham.AdornCullingMode = "Never"
                        VisibleCham.Adornee = cB
                        VisibleCham.Parent = cB
                        WallCham.Adornee = cB
                        WallCham.Parent = cB
                    end
                end
            end
        end
    )
    if Player.Character ~= nil and Player.Character:FindFirstChild("UpperTorso") then
        local bD = l("Vector3Value")
        bD.Name = "OldPosition"
        bD.Value = Player.Character.HumanoidRootPart.Position
        bD.Parent = Player.Character.HumanoidRootPart
        for b9, cB in pairs(Player.Character:GetChildren()) do
            gX(cB)
            if
                cB:IsA("BasePart") and Player ~= a9 and cB.Name ~= "HumanoidRootPart" and cB.Name ~= "Head" and
                    cB.Name ~= "BackC4" and
                    cB.Name ~= "HeadHB"
             then
                VisibleCham = l("BoxHandleAdornment")
                VisibleCham.Name = "VisibleCham"
                VisibleCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle
                VisibleCham.ZIndex = 5
                VisibleCham.Size = cB.Size + j(0.1, 0.1, 0.1)
                VisibleCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle
                VisibleCham.Transparency = 0
                WallCham = l("BoxHandleAdornment")
                WallCham.Name = "WallCham"
                WallCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle
                WallCham.ZIndex = 5
                WallCham.Size = cB.Size + j(0.1, 0.1, 0.1)
                WallCham.AlwaysOnTop = values.visuals.players["invisible chams"].Toggle
                WallCham.Transparency = 0.7
                if values.visuals.players.chams.Toggle then
                    if values.visuals.players.teammates.Toggle or Player.Team ~= a9.Team then
                        VisibleCham.Visible = true
                        WallCham.Visible = true
                    else
                        VisibleCham.Visible = false
                        WallCham.Visible = false
                    end
                else
                    VisibleCham.Visible = false
                    WallCham.Visible = false
                end
                H(cr, VisibleCham)
                H(cr, WallCham)
                VisibleCham.Color3 = values.visuals.players.chams.Color
                WallCham.Color3 = values.visuals.players.chams.Color
                VisibleCham.AdornCullingMode = "Never"
                WallCham.AdornCullingMode = "Never"
                VisibleCham.Adornee = cB
                VisibleCham.Parent = cB
                WallCham.Adornee = cB
                WallCham.Parent = cB
            end
        end
    end
end
eL("Success!", Color3.new(0, 1, 0))
c0.moveOldMessages()
c0.createNewMessage("damonhook", "damonhook is Successfully 100% Loaded", L, Color3.new(1, 1, 1), 0.01, nil)
c0.moveOldMessages()
c0.createNewMessage("damonhook", "Thank you for Using damonhook :D", L, Color3.new(1, 1, 1), 0.01, nil)
c0.moveOldMessages()
c0.createNewMessage("damonhook", "Version Indev", L, Color3.new(1, 1, 1), 0.01, nil)
c0.moveOldMessages()
c0.createNewMessage(
    "damonhook",
    "Credits to Rainy.solution, Mexican Hook, LunarSense, Neptunium.cc, For Giving me Permissions <3",
    L,
    Color3.new(1, 1, 1),
    0.01,
    nil
)
