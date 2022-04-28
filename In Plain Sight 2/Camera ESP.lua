if not NEON then if not isfile('neon/init.lua')then makefolder('neon')local a='https://raw.githubusercontent.com/%s/%s/master/init.lua'writefile('neon/init.lua',game:HttpGet(a:format('belkworks','neon')))end;pcall(loadfile('neon/init.lua'))end
synlog = NEON:github('belkworks', 'synlog')
local ESPModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/choke-dev/RE-Script/main/Dependencies/ESP%20Module.lua"))()
local CollectionService = game:GetService("CollectionService")
local cams = {"Camera1", "Camera2"}
local foundcams = 0


local function isCamera(object)
    if table.find(cams, object.Name) then
        return true
    end
end

for i,v in pairs(workspace.Map:GetDescendants()) do
    pcall(function()
        if v.Name == "Attachment" or "Attatchment" and isCamera(v.Parent) and not CollectionService:HasTag(v.Parent.Part, "3D_ESP") then
            ESPModule.Create3DESP(v.Parent.Part, v.Parent.Name, Color3.fromRGB(255, 0, 0))
            foundcams = foundcams + 1
        end
    end)
end

if foundcams == 0 then
    synlog:warn("No cameras found!")
else
    synlog:success("Found "..foundcams.." cameras!")
end
