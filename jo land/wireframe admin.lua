local Players = game:GetService("Players")
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local currentPlayer

function makeMsg(msg, clr)
    game.StarterGui:SetCore("ChatMakeSystemMessage", { 
        Text = "[ WIREFRAME ADMIN ] "..msg, 
        Color = clr, 
        Font = Enum.Font.SourceSansBold, 
        FontSize = Enum.FontSize.Size24,
        TextStrokeTransparency = 0.75
    })
end

function findPlayer(string)
    local lower = string:lower()
    for _, plr in next, game.Players:GetPlayers() do
        if plr.Name:sub(1,#string):lower() == lower then
            return plr
        end
    end
end

Players.LocalPlayer.Chatted:Connect(function(msg)
    local args = msg:split(" ")
    if args[1] == "/kill" then
        currentPlayer = findPlayer(args[2])
        local args = {
            [1] = Players[currentPlayer.Name].Character.Humanoid,
            [2] = 999999999999
        }
        
        game:GetService("ReplicatedStorage").dremote:FireServer(unpack(args))
        makeMsg("Killed "..currentPlayer.Name..".", Color3.new(1,0.3294117647058824,0.3294117647058824))
    elseif args[1] == "/god" then
        currentPlayer = findPlayer(args[2])
        local args = {
            [1] = Players[currentPlayer.Name].Character.Humanoid,
            [2] = -999999999
        }
        
        game:GetService("ReplicatedStorage").dremote:FireServer(unpack(args))
        makeMsg("Godded "..currentPlayer.Name..".", Color3.new(0.3607843137254902,1,0.596078431372549))
    elseif args[1] == "/ungod" then
        currentPlayer = findPlayer(args[2])
        local args = {
            [1] = Players[currentPlayer.Name].Character.Humanoid,
            [2] = 999999999
        }
        
        game:GetService("ReplicatedStorage").dremote:FireServer(unpack(args))
        makeMsg("Ungodded "..currentPlayer.Name..".", Color3.new(1,0.3294117647058824,0.3294117647058824))
    elseif args[1] == "/heal" then
        currentPlayer = findPlayer(args[2])
        local healthToAdd = 100 - Players[currentPlayer.Name].Character.Humanoid.Health
        local args = {
            [1] = Players[currentPlayer.Name].Character.Humanoid,
            [2] = healthToAdd
        }
        
        game:GetService("ReplicatedStorage").dremote:FireServer(unpack(args))
        makeMsg("Gave "..healthToTake.." health to "..currentPlayer.Name..".", Color3.new(0.3607843137254902,1,0.596078431372549))
    elseif args[1] == "/hurt" then
        currentPlayer = findPlayer(args[2])
        local healthToTake = args[3] or 10
        local args = {
            [1] = Players[currentPlayer.Name].Character.Humanoid,
            [2] = healthToTake
        }
        
        game:GetService("ReplicatedStorage").dremote:FireServer(unpack(args))
        makeMsg("Took "..healthToTake.." health away from "..currentPlayer.Name..".", Color3.new(1,0.3294117647058824,0.3294117647058824))
    end
end)

makeMsg("Initialized in \""..gameName.."\".", Color3.new(0.3607843137254902,1,0.596078431372549))
makeMsg("Loaded 5 Game-Specific Commands.", Color3.new(0.3607843137254902,1,0.596078431372549))