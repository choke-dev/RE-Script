local Players = game:GetService("Players")
local HTTP = game:GetService("HttpService")
if game.PlaceId ~= 8326774084 then return end
repeat wait() until game:IsLoaded()
repeat wait() until Players.LocalPlayer:WaitForChild("PlayerData").Number.Value ~= 0
if not getgenv().Loaded then
    task.wait(4)
end
getgenv().Loaded = true

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/choke-dev/RE-Script/main/UI%20Libs/Mercury.lua?token=GHSAT0AAAAAABNSALBCJMGK5FCI32E2CG5SYSL45DA"))()

local FakeNames = {}

for i,v in pairs(Players:GetChildren()) do
    local int = v.PlayerData.Number.Value
    local str = v.PlayerData.DisplayName.Value
    local role = v.PlayerData.Role.Value
    table.insert(FakeNames, "["..int.."] "..str.." | "..v.Name.." | "..role)
end

local gui = Library:create{
    Theme = Library.Themes.Serika,
    Link = "https://chokes.software/bloxston-mystery",
}
gui:set_status("[IDLE] Waiting for events...")

local tab = gui:tab{
    Icon = "rbxassetid://6034767607",
    Name = "Role List"
}

local Dropdown = tab:dropdown({
    Name = "Click me to view the role list.",
    StartingText = "Open...",
    Items = FakeNames
})
FakeNames = {} -- table no longer used, clearing it to save memory

local RefreshButton = tab:button({
    Name = "Refresh role list",
    Callback = function()
        Dropdown:Clear()
        task.wait(0.1)
        for i,v in pairs(Players:GetChildren()) do
            local int = v.PlayerData.Number.Value
            local str = v.PlayerData.DisplayName.Value
            local role = v.PlayerData.Role.Value
            Dropdown:AddItems({
                "["..int.."] "..str.." | "..v.Name.." | "..role
            })
            task.wait() -- necessary or the dropdown won't update and it'll just return an empty dropdown lol
        end
        gui:Notification{
            Title = "Success",
            Text = "Role list refreshed.",
            Duration = 2.5,
            Callback = function() end
        }
    end
})

Players.PlayerRemoving:Connect(function(player)
    local int = player.PlayerData.Number.Value
    local str = player.PlayerData.DisplayName.Value
    local role = player.PlayerData.Role.Value
    gui:set_status("[PLAYER LEAVE] Updating role list...")
    Dropdown:RemoveItems({
            "["..int.."] "..str.." | "..player.Name.." | "..role	-- just the names to get removed (upper/lower case ignored)
    })
    gui:set_status("[SUCCESS] Role list updated. | ["..int.."] "..str.." | "..role.." has been removed.")
end)

