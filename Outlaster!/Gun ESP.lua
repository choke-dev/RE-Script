local CollectionService = game:GetService("CollectionService")
local ESPModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/choke-dev/RE-Script/main/Dependencies/ESP%20Module.lua"))()

for i,v in pairs(workspace.Debris:GetChildren()) do
    if v.Name == "Revolver" and not CollectionService:HasTag(v.Handle, "3D_ESP") then
        ESPModule.Create3DESP(v.Handle, "Gun", Color3.fromRGB(0, 255, 255))
    end
end