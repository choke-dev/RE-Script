while wait() do
  local props = game:GetService("Workspace").Debris.Props:GetDescendants() -- Grab everything in Folder.
    for i = 1, #props do -- Loop through everything to find what we need.
        local prop = props[i]
            if prop.Name == "Green" then -- Clues we are looking for
                if prop.Parent.Orientation.Y > -3162 then -- Below map check.
                  if not prop:FindFirstChild("BoxHandleAdornment") then
                    local clues = Instance.new("BoxHandleAdornment")
                    clues.Transparency = 0.3
                    clues.Color = BrickColor.new(1020)
                    clues.Parent = prop
                    clues.Size = prop.Parent.Size
                    clues.ZIndex = 0
                    clues.Adornee = prop.Parent
                    clues.AlwaysOnTop = true
                end
            end
        end
    end
end

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

-- ESP Function was not made by me.. It's been re-released a thousand times so I'm not sure who made it.
function Create(base, team, role, fakedname)
  local bb = Instance.new('BillboardGui', game.CoreGui)
  bb.Adornee = base
  bb.ExtentsOffset = Vector3.new(0,1,0)
  bb.AlwaysOnTop = true
  bb.Size = UDim2.new(0,5,0,5)
  bb.StudsOffset = Vector3.new(0,1,0)
  bb.Name = 'tracker'
  local frame = Instance.new('Frame',bb)
  frame.ZIndex = 10
  frame.BackgroundTransparency = 0.3
  frame.Size = UDim2.new(1,0,1,0)
  local txtlbl = Instance.new('TextLabel',bb)
  txtlbl.ZIndex = 10
  txtlbl.BackgroundTransparency = 1
  txtlbl.Position = UDim2.new(0,0,0,-35)
  txtlbl.Size = UDim2.new(1,0,10,0)
  txtlbl.Font = 'ArialBold'
  txtlbl.FontSize = 'Size12'
  txtlbl.Text = fakedname .. " - " .. role -- Add Role to Name
  txtlbl.TextStrokeTransparency = 0.5

  -- Change Color Via Role/Job
  if role == "Murderer" then
    txtlbl.TextColor3 = Color3.new(250,0,0)
    frame.BackgroundColor3 = Color3.new(250,0,0)
  else if role == "Sheriff" then
    txtlbl.TextColor3 = Color3.new(0,0,250)
    frame.BackgroundColor3 = Color3.new(0,0,250)
  else if role == "Bystander" then
    txtlbl.TextColor3 = Color3.new(128,128,128)
    frame.BackgroundColor3 = Color3.new(128,128,128)
  end
end
end

-- Clear our ESP out
function Clear()
for _,v in pairs(game.CoreGui:GetChildren()) do
  if v.Name == 'tracker' and v:isA('BillboardGui') then
    v:Destroy()
  end
end
end

-- User checking function
function Find()
Clear()
track = true
spawn(function()
while wait(1) do
  pcall(function() -- Error Catch
  local Players = game.Players:GetChildren() -- Get Current Players
  if track then
    Clear()
    for _,v in pairs(Players) do
      if v.Status.Role.Value == "Murderer" then
        if v and v.Character.Head then
          Create(v.Character.Head, false, "Murderer", v.Status.FakeName.Value)
        end
      else if v.Status.HasRevolver.Value == true then

        if v.Character and v.Character.Head then
          Create(v.Character.Head, false, "Sheriff", v.Status.FakeName.Value)
        end

      else if v.Character and v.Character.Head then
        Create(v.Character.Head, false, "Bystander", v.Status.FakeName.Value)
      end
    end
  end
end
end
wait(1)
end)
end
end)
end

-- Start everything
Clear()
Find()
-- HamstaGang on V3RM

pcall(function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Herrtt/AimHot-v8/master/Main.lua", true))()
end)
