local module = {}

local remote = game:GetService("ReplicatedStorage").Remote.Alert

function module.newAlert(text, color, textime, event, autoLocalize)
	for i,v in pairs(getconnections(remote.OnClientEvent)) do
	    v:Fire(text, color, textime, event, autoLocalize)
	end
end

return module