local CollectionService = game:GetService("CollectionService")
local ESPModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/choke-dev/RE-Script/main/Dependencies/ESP%20Module.lua"))()

while task.wait() do
    for i,v in pairs(workspace.Debris:GetChildren()) do
        if v.Name == "Revolver" and not CollectionService:HasTag(v.Handle, "3D_ESP") then
            ESPModule.Create3DESP(v.Handle, "Gun", Color3.fromRGB(0, 255, 255))
        elseif v.Name == "Knife" and not CollectionService:HasTag(v, "3D_ESP") then
            ESPModule.Create3DESP(v, "Knife", Color3.fromRGB(255, 81, 81))
        end
    end
end