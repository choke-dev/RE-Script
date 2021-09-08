while wait() do
    pcall(function()
        local props = game:GetService("Workspace").Debris.Props:GetDescendants() -- Grab everything in Folder.
            for i = 1, #props do -- Loop through everything to find what we need.
                local prop = props[i]
                    if prop.Name == "Green" then -- Clues we are looking for
                        if prop.Parent.Orientation.Y > -3162 then -- Below map check.
                            if not prop:FindFirstChild("BoxHandleAdornment") then
                                local clues = Instance.new("BoxHandleAdornment")
                                    local BillboardGui = Instance.new("BillboardGui")
				                    local TextLabel = Instance.new("TextLabel")
                                    clues.Transparency = 0.3
                                    clues.Color = BrickColor.new(1020)
                                    clues.Parent = prop
                                    clues.Size = prop.Parent.Size
                                    clues.ZIndex = 0
                                    clues.Adornee = prop.Parent
                                    clues.AlwaysOnTop = true
				                    BillboardGui.Adornee = prop.Parent
				                    BillboardGui.Name = "Loot"
				                    BillboardGui.Parent = prop
				                    BillboardGui.Size = UDim2.new(0, 100, 0, 150)
				                    BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
				                    BillboardGui.AlwaysOnTop = true
				                    TextLabel.Parent = BillboardGui
				                    TextLabel.BackgroundTransparency = 1
				                    TextLabel.Position = UDim2.new(0, 0, 0, -50)
				                    TextLabel.Size = UDim2.new(0, 100, 0, 100)
				                    TextLabel.Font = Enum.Font.SourceSansSemibold
				                    TextLabel.TextSize = 20
			    	                TextLabel.TextColor3 = Color3.new(1, 1, 1)
			    	                TextLabel.TextStrokeTransparency = 0
			    	                TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
			    	                TextLabel.Text = 'Loot'
end
end
end
end
end)
end
