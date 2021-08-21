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
