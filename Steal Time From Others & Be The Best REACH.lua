mt = getrawmetatable(game)
oldIndex = mt.__index
setreadonly(mt, false)

mt.__index = function(a,b)
  if a == "Weld" or b == "Weld" then
      return "Part"
  end
  return oldIndex(a,b)
end



local Player = game.Players.LocalPlayer
local Char = Player.Character
local KeyBindHigh = "q"
local IncreaseAmmount = 1
local KeyBindLow = "e"
local settings = {repeatamount = 2} -- Best to keep it at 2 so it doesnt cause lag or FPS drops
_G.Dist = 10
_G.SphereActivated = true --// If set to true it'll
setsimulationradius(math.huge,math.huge)


game:GetService("RunService").Stepped:Connect(function()
local Player = game.Players.LocalPlayer
local Char = Player.Character
pcall(function()
  for i,v in pairs(game.Players:GetPlayers()) do
      if v ~= Player then
          if v.Character.Humanoid.Health ~= 0 then
              if (v.Character.HumanoidRootPart.Position - Char.HumanoidRootPart.Position).Magnitude <= _G.Dist then
                      for _,x in pairs(v.Character:GetChildren()) do
                          if x:IsA("Part") then
                              for i = 1,settings.repeatamount do
                              firetouchinterest(Char:FindFirstChildOfClass("Tool").Handle, x, 0)
                              firetouchinterest(Char:FindFirstChildOfClass("Tool").Handle, x, 1)
                              end
                          end
                      end
                  end
              end
          end
      end
  end)
end)



Player:GetMouse().KeyDown:Connect(function(Key)
  if Key == KeyBindHigh then
      _G.Dist = _G.Dist + IncreaseAmmount
      game.StarterGui:SetCore("SendNotification", {
      Title = "TIM";
      Text = "tims hotness set to " .. _G.Dist;
      Icon = "";
      Duration = 1;})
  end
  if Key == KeyBindLow then
      _G.Dist = _G.Dist - IncreaseAmmount
      game.StarterGui:SetCore("SendNotification", {
      Title = "TIM";
      Text = "tims hotness set to " .. _G.Dist;
      Icon = "";
      Duration = 1;})
  end
end)



if _G.SphereActivated then
function Update()
  game.Players.LocalPlayer.Character.ChildAdded:Connect(function(tool)
      if tool:FindFirstChild("Handle") then
      Part = Instance.new("Part")
      Weld = Instance.new("Weld", workspace)
      Part.Parent = workspace
      Part.Transparency = 1
      Part.CanCollide = false
      Sphere = Instance.new("SelectionSphere",game:GetService("CoreGui").RobloxGui.Modules)
      Sphere.Transparency = 1
      Sphere.Name = "Sphere"
      Sphere.SurfaceTransparency = .5
      Sphere.Adornee = Part
      Part.Massless = true
      Part.Position = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle.Position
      Weld.Part0 = Part
      Weld.Part1 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle
       game:GetService("RunService").Stepped:Connect(function()
       Part.Size = Vector3.new(_G.Dist,_G.Dist,_G.Dist)
       end)
    end
  end)
end
function UnEquip()
  game.Players.LocalPlayer.Character.ChildRemoved:Connect(function(int)
      if int:FindFirstChild("Handle") then
          for i,v in pairs(game:GetService("CoreGui").RobloxGui.Modules:GetDescendants()) do
              if v.Name == 'Sphere' then
                  v:Destroy()
              end
          end
      end
  end)
end



Update()
UnEquip()

game.Players.LocalPlayer.CharacterAdded:Connect(Update)
game.Players.LocalPlayer.CharacterAdded:Connect(UnEquip)    
end
