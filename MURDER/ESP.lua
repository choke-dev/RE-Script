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
