--if game.PlaceId ~= 5343994291 or game.PlaceId ~= 5765666934 then return end

local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
local Notify = AkaliNotif.Notify;
local CS = game:GetService("CollectionService")
local foundhints = 0

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
            local Distance = (workspace.Camera.CFrame.Position - part.Position).Magnitude
            --local Distance = (game:GetService("Players").LocalPlayer.Character.Head.Position - part.Position).Magnitude
            name.Text = "["..round(Distance).."] "..text
            local destroyed = not part:IsDescendantOf(workspace)
            if destroyed and name ~= nil then
                name:Remove()
                box:Remove()
                CS:RemoveTag(part, "ESP")
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

for i,v in pairs(workspace:GetDescendants()) do
    if v:IsA("TouchTransmitter") and v.Parent:IsA("MeshPart") and v.Parent.Parent:IsA("Model") and v.Parent.Parent.Parent:IsA("MeshPart") and v.Parent.Parent.Parent.Parent:IsA("Model") and not CS:HasTag(v, "ESP") then
        foundhints = foundhints + 1
        ESP(v.Parent, "Hint", Color3.fromRGB(0,255,0))
        CS:AddTag(v, "ESP")
        Notify({
            Title = "<b><font color=\"rgb(255, 0, 0)\">Wait...</font></b>";
            Description = "Teleporting hint...";
            Duration = 1;
        });
        --v.Parent.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    end
end

if foundhints ~= 0 then
    Notify({
        Title = "<b><font color=\"rgb(0, 255, 0)\">Success!</font></b>";
        Description = "Found <b><font color=\"rgb(97, 255, 126)\">"..foundhints.." hints</font></b>!";
        Duration = 5;
    });
elseif #game:GetService("Players"):GetPlayers() <= 5 then
    Notify({
        Title = "<b><font color=\"rgb(255, 0, 0)\">Error!</font></b>";
        Description = "Game needs 5+ players to spawn new <b><font color=\"rgb(97, 255, 126)\">hints</font></b>!\nCurrently, there are "..#game:GetService("Players"):GetPlayers().." players.";
        Duration = 5;
    });
elseif foundhints == 0 then
    Notify({
        Title = "<b><font color=\"rgb(255, 255, 0)\">Warning</font></b>";
        Description = "No <b><font color=\"rgb(97, 255, 126)\">hints</font></b> were found!";
        Duration = 5;
    });
end