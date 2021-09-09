executescript(loadstring(game:HttpGet("http://scriptstream.xyz/ScriptStorage/ESPForArsenal.lua", true))())

local LocalPlayer = game.Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
Mouse.KeyDown:connect(function(KeyPressed)
    if KeyPressed == "x" then
        local props = game:GetService("Workspace").Debris.Props:GetDescendants() -- Grab everything in Folder.
        for i = 1, #props do -- Loop through everything to find what we need.
            local prop = props[i]
            if prop.Name == "Green" then -- GUI we are looking for.
                local PlayerCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
                if prop.Parent.Orientation.Y > -3162 then -- Bellow map check..
                    LocalPlayer.Character.HumanoidRootPart.CFrame = prop.Parent.CFrame + Vector3.new(0, 3, 0) -- Teleport Player to Prop (Their new check forces you to be near it to pick it up..)
                       wait(0.5) -- Wait for us to teleport.
                    game:GetService("ReplicatedStorage").Events.Loot:FireServer(prop.Parent) -- Parent of Green
                end
            end
        end
    end
end)

pcall(function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Herrtt/AimHot-v8/master/Main.lua", true))()
end)

executescript(loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))())

executescript(loadstring(game:HttpGet("https://raw.githubusercontent.com/choke-dev/RE-Script/main/MURDER/Clue%20ESP.lua?token=ALLESGTXUQFDT4ENNOTVJPTBF3DCG"))())
