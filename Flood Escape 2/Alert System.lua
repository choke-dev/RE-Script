-- module.newAlert(<string>, <Color3>, <time>)

local module = {};

local l__LocalPlayer__19 = game.Players.LocalPlayer;
function loadGui(p2)
	local l__GuiBackup__27 = game.ReplicatedStorage:FindFirstChild("GuiBackup");
	if l__GuiBackup__27 then
		local v28 = l__GuiBackup__27:FindFirstChild(p2);
		if v28 then
			v28:Clone().Parent = l__LocalPlayer__19.PlayerGui;
		end;
	end;
end;
local function repeatFind(p3, p4, p5, p6)
	local v29 = tick();
	local v30 = p3:FindFirstChild(p4, p5);
	if not v30 then
		while true do
			wait();
			if v29 < tick() - 10 then
				v29 = tick();
				if p6 then
					loadGui(p4);
				end;
			end;
			v30 = p3:FindFirstChild(p4, p5);
			if not v30 then

			else
				break;
			end;		
		end;
	end;
	return v30;
end;
local v33 = repeatFind(l__LocalPlayer__19.PlayerGui, "GameGui", false, true);
local l__Alerts__39 = v33:WaitForChild("Alerts");
local u52 = {};
function handleAlert(p60, p61, p62)
	if p61.Parent == l__Alerts__39 then
		if not (4 < p60) then
			local v369 = p62 and p60 or p60 - 1;
		else
			v369 = p60 or p60 - 1;
		end;
		if not (4 < p60) then
			if p62 then
				local v370 = "In";
			else
				v370 = "Out";
			end;
		else
			v370 = "In";
		end;
		if not (4 < p60) then
			if p62 then
				p61.ZIndex = 0;
				table.remove(u52, p60);
				game:GetService("TweenService"):Create(p61.Alert, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
					TextTransparency = 1.1, 
					TextStrokeTransparency = 1
				}):Play();
				delay(0.3, function()
					p61:Destroy();
				end);
				return;
			else
				p61:TweenPosition(UDim2.new(0.5, 0, v369, 0), v370, "Sine", 0.325, true);
			end;
		else
			p61.ZIndex = 0;
			table.remove(u52, p60);
			game:GetService("TweenService"):Create(p61.Alert, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
				TextTransparency = 1.1, 
				TextStrokeTransparency = 1
			}):Play();
			delay(0.3, function()
				p61:Destroy();
			end);
			return;
		end;
	end;
end;
function module.newAlert(p63, p64, p65, p66, p67)
	local v371 = p65 or 4.5;
	if p66 == "event" then
		spawn(function()
			--updMapEventInfo(p63, p64, v371);
		end);
		return;
	end;
	local u53 = Instance.new("TextLabel");
	local u54 = Instance.new("Frame");
	local u55 = Instance.new("ImageLabel");
	delay(0, function()
		if p67 then
			u53.AutoLocalize = false;
		end;
		u54.Name = "Alert_Frame";
		u54.Size = UDim2.new(1, 0, 1, 0);
		u54.Position = UDim2.new(0.5, 0, -1, 0);
		u54.AnchorPoint = Vector2.new(0.5, 0);
		u54.BackgroundTransparency = 1;
		local v372 = Instance.new("UIScale");
		v372.Scale = 0;
		v372.Parent = u54;
		u55.Name = "Alert_Shadow";
		u55.BackgroundTransparency = 1;
		u55.Image = "rbxassetid://1057492965";
		u55.ImageTransparency = 0.5;
		u55.Size = UDim2.new(1, 0, 1, 0);
		u55.Parent = u54;
		game:GetService("TweenService"):Create(u55, TweenInfo.new(v371, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
			ImageTransparency = 1
		}):Play();
		u53.Name = "Alert";
		u53.ZIndex = 3;
		u53.Text = p63;
		u53.TextColor3 = p64 or Color3.new(1, 1, 1);
		u53.TextScaled = true;
		u53.Font = "Ubuntu";
		u53.TextStrokeTransparency = 0;
		u53.BackgroundTransparency = 1;
		u53.BackgroundColor3 = Color3.new();
		u53.BorderSizePixel = 0;
		u53.Size = UDim2.new(1, 0, 1, 0);
		local v373 = Instance.new("UIGradient");
		v373.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(159, 159, 159));
		v373.Rotation = 90;
		v373.Parent = u53;
		u53.Parent = u54;
		u54.Parent = l__Alerts__39;
		if 8 < v371 then
			local v374 = Instance.new("Frame", u53);
			v374.BorderSizePixel = 0;
			v374.BackgroundColor3 = p64;
			v374.AnchorPoint = Vector2.new(0.5, 0.5);
			v374.Position = UDim2.new(0.5);
			v374.Size = UDim2.new(1, 0, 0.1, 0);
			v374:TweenSize(UDim2.new(0, 0, 0.1, 0), "Out", "Linear", v371);
			local v375 = Instance.new("ImageLabel", v374);
			v375.Image = "rbxassetid://156579757";
			v375.Size = UDim2.new(1, 0, 1, 0);
			v375.BackgroundTransparency = 1;
			v375.ImageTransparency = 0.5;
		end;
		if p66 == "rainbow" then
			spawn(function()
				local v376 = 0;
				while true do
					if u53 then

					else
						break;
					end;
					if wait() then

					else
						break;
					end;
					if 1 < v376 then
						v376 = 0;
					end;
					u53.TextColor3 = Color3.fromHSV(v376, 1, 1);
					v376 = v376 + 0.008333333333333333;				
				end;
			end);
		end;
		table.insert(u52, 1, u54);
		local v377, v378, v379 = pairs(u52);
		while true do
			local v380, v381 = v377(v378, v379);
			if v380 then

			else
				break;
			end;
			v379 = v380;
			handleAlert(v380, v381);		
		end;
		local v382 = TweenInfo.new(0.325, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
		game:GetService("TweenService"):Create(u54.UIScale, v382, {
			Scale = 1
		}):Play();
		game:GetService("TweenService"):Create(u53, v382, {
			TextTransparency = 0, 
			TextStrokeTransparency = 0.1
		}):Play();
		wait(v371);
		if u54 then
			if u53 then
				if u53.TextTransparency <= 0 then
					local v383 = 1;
					local v384 = #u52;
					local v385 = 1 - 1;
					while true do
						if u52[v385] == u54 then
							v383 = v385;
							break;
						end;
						if 0 <= 1 then
							if v385 < v384 then

							else
								break;
							end;
						elseif v384 < v385 then

						else
							break;
						end;
						v385 = v385 + 1;					
					end;
					handleAlert(v383, u54, true);
				end;
			end;
		end;
		local v386, v387, v388 = pairs(u52);
		while true do
			local v389, v390 = v386(v387, v388);
			if v389 then

			else
				break;
			end;
			v388 = v389;
			handleAlert(v389, v390);		
		end;
	end);
    spawn(function()
        local insanesound = Instance.new("Sound", l__Alerts__39);
        insanesound.Playing = false
        insanesound.Volume = 5
        insanesound.SoundId = "rbxassetid://1044088048";
        insanesound:Play();
        task.wait(1.816)
        insanesound:Destroy()
    end)
	return u53;
end;

return module
