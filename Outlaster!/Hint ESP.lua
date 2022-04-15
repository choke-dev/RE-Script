local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
local Notify = AkaliNotif.Notify;
if game.PlaceId ~= 5765666934 then 
    Notify({
        Title = "<b><font color=\"rgb(255, 0, 0)\">❌  Error!</font></b>";
        Description = "You must join an Outlaster game to use this script!";
        Duration = 15;
    });
    return 
end

local CoSe = game:GetService("CollectionService")
local twodeeESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/choke-dev/RE-Script/main/Dependencies/Drawing%20Library%202D%20Box%20ESP.lua"))();
local ContextActionService = game:GetService("ContextActionService")
local contextButton = false


local function search()
    if contextButton then
        contextButton = false
        return
    else
        contextButton = true
    end

    local foundhints = 0

    for i,v in pairs(workspace:GetDescendants()) do
        if v:IsA("TouchTransmitter") and v.Parent:IsA("MeshPart") and v.Parent.Parent:IsA("Model") and v.Parent.Parent.Parent:IsA("MeshPart") and v.Parent.Parent.Parent.Parent:IsA("Model") and not CoSe:HasTag(v, "ESP") then
            twodeeESP.ESP(v.Parent, "Advantage Hint", Color3.fromRGB(0,255,0))
            CoSe:AddTag(v, "ESP")
            foundhints = foundhints + 1
        end
    end

    if foundhints ~= 0 then
        Notify({
            Title = "<b><font color=\"rgb(0, 255, 0)\">✓  Success!</font></b>";
            Description = "Found <b><font color=\"rgb(97, 255, 126)\">"..foundhints.." hints</font></b>!";
            Duration = 5;
        });
    else
        Notify({
            Title = "<b><font color=\"rgb(255, 255, 0)\">⚠️  Warning</font></b>";
            Description = "No new <b><font color=\"rgb(97, 255, 126)\">hints</font></b> were found!";
            Duration = 2.5;
        });
    end
end

ContextActionService:BindAction("V | Search", search, false, Enum.KeyCode.V)
Notify({
    Title = "<b><font color=\"rgb(56, 137, 196)\">ℹ  Notification</font></b>";
    Description = "Press <b><font color=\"rgb(255, 255, 0)\">[ V ]</font></b> to search for <b><font color=\"rgb(97, 255, 126)\">hints</font></b>!";
    Duration = 15;
});