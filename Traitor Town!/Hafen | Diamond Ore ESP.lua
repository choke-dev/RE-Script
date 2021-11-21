local diamond = game:GetService("Workspace").Items

for __,v in pairs(diamond:GetChildren()) do
    if v:IsA("Model") and v.Name == "Prop_Custom_DiamondOre" then
        local BillboardGui = Instance.new("BillboardGui",v)
        local TextLabel = Instance.new("TextLabel",v)
        local Box = Instance.new("BoxHandleAdornment",v)

        Box.Transparency = 0.5
        Box.Color = BrickColor.new(23)
        Box.Size = v.Handle.Size
        Box.ZIndex = 0
        Box.Adornee = v.Handle
        Box.AlwaysOnTop = true

        BillboardGui.Adornee = v
        BillboardGui.Name = "BillNye"
        BillboardGui.Parent = v.Handle
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
        TextLabel.Text = 'Diamond Ore'
    end
end
