function inviscam()
	game:GetService("Players").LocalPlayer.DevCameraOcclusionMode = "Invisicam"
end

function invite(discordcode)
	if not syn and not getgenv().CompatibilityEnabled then
		loadstring(game:HttpGet("https://irisapp.ca/api/Scripts/IrisBetterCompat.lua"))()
		getgenv().CompatibilityEnabled = true
	end
	syn.request({
	Url = "http://127.0.0.1:6463/rpc?v=1",
	Method = "POST",
	Headers = {
		["Content-Type"] = "application/json",
		["Origin"] = "https://discord.com"
	},
	Body = game:GetService("HttpService"):JSONEncode({
		cmd = "INVITE_BROWSER",
		args = {
			code = tostring(discordcode)
		},
		nonce = game:GetService("HttpService"):GenerateGUID(false)
   }),
})
end
