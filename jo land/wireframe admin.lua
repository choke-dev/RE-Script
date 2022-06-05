local Players = game:GetService("Players")
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local colorRed = Color3.new(1,0.3294117647058824,0.3294117647058824)
local colorGreen = Color3.new(0.3607843137254902,1,0.596078431372549)
local Prefix = "!"

function modifyPlayerHealth(playerName, health)
    task.spawn(function()
        repeat
            game:GetService("ReplicatedStorage").dremote:FireServer(Players[playerName].Character.Humanoid, 2, "flamethrower")
            task.wait()
        until Players[playerName].Character.Humanoid.Health == health
    end)
end

function newMessage(msg, clr)
    game.StarterGui:SetCore("ChatMakeSystemMessage", { 
        Text = "[ WIREFRAME ADMIN ] "..msg, 
        Color = clr, 
        Font = Enum.Font.SourceSansBold, 
        FontSize = Enum.FontSize.Size24,
        TextStrokeTransparency = 0.75
    })
end

function findPlayer(string)
    local lowercase = string:lower()
    local result
    for _, plr in next, Players:GetPlayers() do
        if plr.Name:sub(1,#string):lower() == lowercase then
            result = plr
            return plr
        end
    end
    if not result then
        return newMessage("Player not found!", colorRed)
    end
end

function checkPrefix(message)
    if message:sub(1,1) == Prefix then
        return true
    end
end

Commands = {}

-- // Commands \\ --
Commands.kill = function(...)
    local args = {...}
    local Target = findPlayer(args[1])
    modifyPlayerHealth(Target.Name, 0)
    newMessage("Killed "..Target.Name..".", colorRed)
end

Commands.god = function(...)
    local args = {...}
    local Target = findPlayer(args[1])
    modifyPlayerHealth(Target.Name, 100)
    newMessage(Target.Name.." is now immortal.", colorGreen)
end

Commands.ungod = function(...)
    local args = {...}
    local Target = findPlayer(args[1])
    modifyPlayerHealth(Target.Name, 1)
    newMessage(Target.Name.." is no longer immortal.", colorRed)
end

Commands.heal = function(...)
    local args = {...}
    local Target = findPlayer(args[1])
    local HealthToAdd = 100 - tonumber(args[2])
    modifyPlayerHealth(Target.Name, -HealthToAdd)
    newMessage("Gave "..HealthToAdd.." health to "..Target.Name..".", colorGreen)
end

Commands.hurt = function(...)
    local args = {...}
    local Target = findPlayer(args[1])
    local HealthToTake = 100 - tonumber(args[2])
    modifyPlayerHealth(Target.Name, HealthToTake)
    newMessage("Took "..HealthToTake.." health from "..Target.Name..".", colorRed)
end
newMessage("Loaded "..#Commands.." commands.", colorGreen)

-- // Command Handler \\ --
Players.LocalPlayer.Chatted:Connect(function(message)
    if not checkPrefix(message) then return end

    local args = string.split(message, " ")
    local RequestedCommand = args[1]:sub(2)

    if Commands[RequestedCommand] then
        Commands[RequestedCommand](table.concat(args, ' ', 2))
    else
        return newMessage("\""..RequestedCommand.."\" is not a valid command.", colorRed)
    end
end)