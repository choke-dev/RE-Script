---@diagnostic disable: undefined-global
local Players = game:GetService("Players")
local Teams = game:GetService("Teams")

if game.PlaceId ~= 8326774084 then return end
if not getgenv().Loaded then
    repeat task.wait() until game:IsLoaded()
    repeat task.wait() until #Teams.Dead:GetPlayers() ~= 0 -- waits for all players to load in
    repeat task.wait() until #Teams.Dead:GetPlayers() == 0 -- waits for the game to start
end
getgenv().Loaded = true

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/choke-dev/RE-Script/main/UI%20Libs/Mercury.lua"))()

local gui = Library:create{
    Name = "BM GUI",
    Theme = Library.Themes.Rust,
    Link = "https://chokes.software/bloxston-mystery",
}
gui:set_status("GUI Version: 1.1 | Stable")

-- // Role List Tab

local tab = gui:tab{
    Icon = "rbxassetid://6034767607",
    Name = "Role List"
}

local Dropdown = tab:dropdown({
    Name = "Click me to view the role list.",
    Description = "A red text means that player is dead / communicating with the dead.",
    StartingText = "Open...",
    Items = {}
})

for i,v in pairs(Players:GetChildren()) do
    local int = v.PlayerData.Number.Value
    local str = v.PlayerData.DisplayName.Value
    local role = v.PlayerData.Role.Value
    if tostring(v.Team) == "Dead" then
        Dropdown:AddItems({
            "<b><font color=\"rgb(196, 77, 77)\">["..int.."] "..str.." | "..v.Name.." | "..role.."</font></b>"
        })
    else
        Dropdown:AddItems({
            "["..int.."] "..str.." | "..v.Name.." | "..role
        })
    end
    task.wait()
end

local RefreshButton = tab:button({
    Name = "Refresh role list",
    Callback = function()
        Dropdown:Clear()
        task.wait(0.1)
        for i,v in pairs(Players:GetChildren()) do
            local int = v.PlayerData.Number.Value
            local str = v.PlayerData.DisplayName.Value
            local role = v.PlayerData.Role.Value
            if tostring(v.Team) == "Dead" then
                Dropdown:AddItems({
                    "<b><font color=\"rgb(196, 77, 77)\">["..int.."] "..str.." | "..v.Name.." | "..role.."</font></b>"
                })
            else
                Dropdown:AddItems({
                    "["..int.."] "..str.." | "..v.Name.." | "..role
                })
        end
            task.wait() -- necessary or the dropdown won't update and it'll just return an empty dropdown lol
        end
        gui:Notification{
            Title = "Success",
            Text = "Role list refreshed.",
            Duration = 5,
            Callback = function() end
        }
    end
})

-- // Role List Tab

gui:Credit{
	Name = "choke",
	Description = "Script creator",
	V3rm = "https://v3rmillion.net/member.php?action=profile&uid=1773404",
	Discord = "choke#3588"
}

Players.PlayerRemoving:Connect(function(player)
    local int = player.PlayerData.Number.Value
    local str = player.PlayerData.DisplayName.Value
    local role = player.PlayerData.Role.Value
    gui:set_status("[PLAYER LEAVE] Updating role list...")
    if tostring(player.Team) == "Dead" then
        Dropdown:RemoveItems({
            "<b><font color=\"rgb(196, 77, 77)\">["..int.."] "..str.." | "..player.Name.." | "..role.."</font></b>"
        })
    else
        Dropdown:RemoveItems({
            "["..int.."] "..str.." | "..player.Name.." | "..role
        })
    end
    gui:set_status("[SUCCESS] Role list updated. | ["..int.."] "..str.." | "..role.." has been removed.")
end)

