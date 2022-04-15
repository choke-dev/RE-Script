local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/choke-dev/RE-Script/main/UI%20Libs/Mercury.lua", true))()
local event = game:GetService("ReplicatedStorage").DeleteCar
local Players = game:GetService("Players")
local GUI = Mercury:Create{
    Name = "Mercury",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/choke-dev/RE-Script"
}

local Tab = GUI:Tab{
	Name = "Kick Panel",
	Icon = "rbxassetid://7743875629"
}

local MyDropdown = Tab:Dropdown{
	Name = "Kick a player",
	StartingText = "Select a player...",
	Description = "Removes the player from the game.",
	Items = {},
	Callback = function(item) 
        event:FireServer(Players[item])
        MyDropdown:RemoveItems({
            item
        })
    end
}

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
    MyDropdown:AddItems({
        v.Name
    })
end

Players.PlayerAdded:Connect(function(plr)
    MyDropdown:AddItems({
        plr.Name
    })
end)

Players.PlayerRemoving:Connect(function(plr)
    MyDropdown:RemoveItems({
        plr.Name
    })
end)