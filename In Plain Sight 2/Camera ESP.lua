local ESPModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/choke-dev/RE-Script/main/Dependencies/ESP%20Module.lua"))()
local CollectionService = game:GetService("CollectionService")
local cams = {"Camera1", "Camera2"}

local function isCamera(object)
    if table.find(cams, object.Name) then
        return true
    end
end

for i,v in pairs(workspace.Map:GetDescendants()) do
    pcall(function()
        if v.Name == "Attachment" or "Attatchment" and isCamera(v.Parent) and not CollectionService:HasTag(v.Parent.Part, "3D_ESP") then
            ESPModule.Create3DESP(v.Parent.Part, v.Parent.Name, Color3.fromRGB(255, 0, 0))
        end
    end)
end
