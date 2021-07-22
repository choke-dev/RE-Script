local start = tick();
local constant = {
	pi = math.pi,
	tau = math.pi * 2,
	e = math.exp(1),
	MAX_LENIENCY_FIREPOS = 10.5,
	MAX_LENIENCY_HITBOX = 4,
    gvaccel = Vector3.new(0, -196.2, 0),
    discordinv = "KbcMV3tCg6"
};
local replicatedfirst = game:GetService("ReplicatedFirst");
local replicatedstorage = game:GetService("ReplicatedStorage");
local inputservice = game:GetService("UserInputService")
local players = game:GetService("Players");
local runservice = game:GetService("RunService");


local camera = workspace.CurrentCamera;
local localplayer = players.LocalPlayer;
local mouse = localplayer:GetMouse();



local vector3new = Vector3.new;
local vector2new = Vector2.new;
local cframenew = CFrame.new;
local atan = math.atan;
local tan = math.tan;
local deg = math.deg;
local atan2 = math.atan2;
local asin = math.asin;
local rad = math.rad;


local findfirstchild = game.FindFirstChild;
local waitforchild = game.WaitForChild;

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LittleDyingDuck/Tree-Hook-V2/main/Janlib.lua"))()

local function approxsin(x) --thx axisangle
    return x * (1 - 1 / 6 * x * x);
end

local function approxatan(x) --
    return x / 1 + 0.28086 * x * x;
end

local function trajectory(o, t, v, a)
    local ox, oy, oz = o.x, o.y, o.z;
    local rx, rz = t.x - ox, t.z - oz;
    local tx2 = rx * rx + rz * rz;
    local ty = t.y - oy;
    if tx2 > 0 then
        local v2 = v * v;
        local c0 = tx2 / (2 * (tx2 + ty * ty));
        local c1 = a * ty + v2;
        local c22 = v2 * (2 * a * ty + v2) - a * a * tx2;
        if c22 > 0 then
            local c2 = c22 ^ 0.5;
            local t0x2 = c0 * (c1 + c2);
            local t1x2 = c0 * (c1 - c2);
            local tx, t0x, t1x = tx2 ^ 0.5, t0x2 ^ 0.5, t1x2 ^ 0.5;
            local v0x, v0y, v0z = rx / tx * t0x, (v2 - t0x2) ^ 0.5, rz / tx * t0x;
            local v1x, v1y, v1z = rx / tx * t1x, (v2 - t1x2) ^ 0.5, rz / tx * t1x;
            local v0 = Vector3.new(v0x, ty > a * tx2 / (2 * v2) and v0y or -v0y, v0z);
            local v1 = Vector3.new(v1x, v1y, v1z);

            return v0, v1;
        else
            return nil, nil, Vector3.new(rx, (tx2 ^ 0.5), rz).Unit * v;
        end
    else
        local vv = Vector3.new(0, v * math.sign(ty), 0);
        return vv, vv;
    end
end
local function init()
    local client = {};
	local gc = getgc();
    for i = 1, #gc do
        local v = gc[i];
        if type(v) == "function" then
            if islclosure(v) then
                --local info, upvals = debug.getinfo(v), debug.getupvalues(v);
                local info, upvals = {}, debug.getupvalues(v);
                --[[if info.name == "loadplayer" and not client.loadplayer then
                    client.loadplayer = v;
                end]] --temp until 3ds fixes getinfo (fuck you)
                if getfenv(v).script == replicatedfirst.Framework then
                    if upvals[1] == localplayer then
                        local const = debug.getconstants(v);
                        if table.find(const, "EqualizerSoundEffect") and table.find(const, "SoundGroup") then
                            client.loadplayer = v; 
                        end
                    end
                end
                --[[if info.name == "trajectory" then
                    client.trajectory = v;
                end]]

                for j = 1, #upvals do
                    local k = upvals[j];
                    if type(k) == "table" then
                        if rawget(k, "updateammo") then
                            client.hud = k;
                        end
                        if rawget(k, "getbodyparts") then
                            client.replication = k;
                            client.chartbl0 = debug.getupvalue(k.getbodyparts, 1);
                            client.chartbl1 = debug.getupvalue(k.getplayerhit, 1);
                        end
                        if rawget(k, "jump") then
                            client.char = k;
                        end
                        if rawget(k, "gammo") then
                            client.gamelogic = k;
                        end
                        if rawget(k, "lock") then
                            client.roundsystem = k;
                        end
                        if rawget(k, "PlaySoundId") then
                            client.sound = k;
                        end
                        if rawget(k, "toanglesyx") then
                            client.vector = k;
                        end
                        if rawget(k, "getscale") then
                            client.uiscaler = k;
                        end
                    end
                end
            end
        end
        if (
            client.hud and client.replication
            and client.chartbl0 and client.char1
            and client.trajectory and client.loadplayer
            and client.gamelogic and client.char
            and client.roundsystem and client.sound
            and client.vector
            )
        then
            print("Finished");
			break;
		end
    end
    client.effects = require(replicatedfirst.ClientModules.Old.framework.effects);
    client.physics = require(replicatedfirst.SharedModules.Old.Utilities.Math.physics:Clone());
    client.camera = require(replicatedfirst.ClientModules.Old.framework.camera);
    client.network = require(replicatedfirst.ClientModules.Old.framework.network);
    client.remoteevent = debug.getupvalue(client.network.send, 1);
    client.netfuncs = debug.getupvalue(getconnections(client.remoteevent.OnClientEvent)[1].Function, 1);
    client.raycast = require(replicatedfirst.SharedModules.Utilities.Geometry.Raycast);
    client.particle = require(replicatedfirst.ClientModules.Old.framework.particle);
    client.oldbulletcheck = require(replicatedfirst.SharedModules.Old.BulletCheck);
    client.publicsettings = require(replicatedfirst.SharedModules.SharedConfigs.PublicSettings)
    client.dot = Vector3.new().Dot;
    client.newinstance = Instance.new;
    client.lastblink = {};
    client.godmodlist = {};
    client.tpcache = {};
    client.whitelist = table.create(players.MaxPlayers);
    client.oldsend = client.network.send;
    client.oldparticle = client.particle.new;
    client.updaterholder = debug.getupvalue(client.replication.getupdater, 1);
    client.oldcamstep = client.camera.step
    client.trajectory = client.physics.trajectory;
    local function ignoreinst(inst)
        return not inst.CanCollide or inst.Transparency == 1 or inst.Name == "Window" or inst.Name == "killbullet";
    end
    local function isdirtyfloat(n)
        return n ~= n or math.abs(n) == 1 / 0;
    end
    client.cacheignore = {workspace.Ignore, workspace.Terrain, workspace.Players, camera};
    function client:bulletcheck(origin, target, velocity, acceleration, penetrationdepth, fps)
        if library.flags.autowallver == "Old" then
            fps = fps or 30;
            local ignorelist = {workspace.Terrain, workspace.Players, workspace.Ignore, camera};
            local timepassed = 0;
            local canpen = true;
            local origin0 = origin;
            local penetrationdepth0 = penetrationdepth;
            local time = client.physics.timehit(origin0, velocity, acceleration, target);
            if isdirtyfloat(time) or time == 0 then
                return false;
            end
            while timepassed < time do
                local dt = math.min(time - timepassed, 1 / fps);
                --local bulletpos = dt * velocity + dt * dt / 2 * acceleration;
                local bulletpos = dt * velocity + 0.5 * acceleration * dt * dt;
                local ret = client.raycast.raycast(origin0, bulletpos, ignorelist, ignoreinst, true);
                if ret then
                    local hit = ret.Instance;
                    local enter = ret.Position;
                    local unit = bulletpos.Unit;
                    local ret1 = client.raycast.raycastSingleExit(enter, hit.Size.Magnitude * unit, hit);
                    if ret1 then
                        local dist = client.dot(unit, ret1.Position - enter);
                        local truedt = client.dot(bulletpos, enter - origin0) / client.dot(bulletpos, bulletpos) * dt;
                        origin0 = enter + 0.01 * unit;
                        velocity += truedt * acceleration;
                        timepassed += truedt;
                        if not (dist < penetrationdepth0) then
                            canpen = false;
                            break;
                        end
                        penetrationdepth0 -= dist;
                    else
                        origin0 += bulletpos;
                        velocity += dt * acceleration;
                        timepassed += dt;
                    end
                    ignorelist[#ignorelist + 1] = hit;
                else
                    origin0 += bulletpos;
                    velocity += dt * acceleration;
                    timepassed += dt;
                end
            end
            return canpen;
        elseif library.flags.autowallver == "New" then
            local time = self.physics.timehit(origin, velocity, acceleration, target);
            if isdirtyfloat(time) or time <= 0 then
                return false;
            end
            local ignorelist = {self.cacheignore};
            local canpen = true;
            local timepassed = 0;
            fps = fps and (1 / fps) or 1 / 30;
            local origin0 = origin;
            local velocity0 = velocity;
            local penetrationdepth0 = penetrationdepth;
            while timepassed < time do
                local dt = time - timepassed;
                if fps < dt then
                    dt = fps;
                end
                --local bulletdir = dt * velocity0 + dt * dt / 2 * acceleration;
                local bulletdir = dt * velocity0 + 0.5 * acceleration * dt * dt;
                local ret0 = self.raycast.raycast(origin0, bulletdir, ignorelist, ignoreinst, true);
                if ret0 then
                    local hit, enter = ret0.Instance, ret0.Position;
                    local normalized = bulletdir.Unit;
                    local ret1 = self.raycast.raycastSingleExit(enter, hit.Size.Magnitude * normalized, hit);
                    if ret1 then
                        local dist = normalized:Dot(ret1.Position - enter);
                        if not (dist < penetrationdepth0) then
                            canpen = false;
                            break;
                        end
                        penetrationdepth0 = penetrationdepth0 - dist;
                    end
                    local truedt = bulletdir:Dot(enter - origin0) / bulletdir:Dot(bulletdir) * dt;
                    origin0 = enter + 0.01 * normalized;
                    velocity0 = velocity0 + truedt * acceleration;
                    timepassed = timepassed + truedt;
                    ignorelist[#ignorelist + 1] = hit;
                else
                    origin0 = origin0 + bulletdir;
                    velocity0 = velocity0 + dt * acceleration;
                    timepassed = timepassed + dt;
                    
                end
            end
            --print(penetrationdepth0);
            return canpen;
        end
    end
    function client:fastbulletcheck(origin, target, penetrationdepth)
        if penetrationdepth < 0 then
            return false;
        end
        local dir = target - origin;
        local hit, enter = workspace:FindPartOnRayWithIgnoreList(Ray.new(origin, dir.Unit * dir.Magnitude), {workspace.Terrain, workspace.Ignore, workspace.Players, camera}, false, true);
        if hit then
            local unit = dir.Unit;
            origin = enter + 0.01 * unit;
            if hit.CanCollide and hit.Transparency ~= 1 and hit.Name ~= "Window" or hit.Name ~= "killbullet" then
                local maxextent = hit.Size.Magnitude * unit;
                local _, exit = workspace:FindPartOnRayWithWhitelist(Ray.new(enter + maxextent, -maxextent), {hit}, true);
                local dist = self.dot(unit, exit - enter);
                if not (dist < penetrationdepth) then
                    return false;
                end
                penetrationdepth = penetrationdepth - dist;
            end
            return self:fastbulletcheck(origin, target, penetrationdepth);
        else
            return true;
        end
    end
    function client:gettracerpos(origin, velocity, acceleration, penetrationdepth, bulletspeed)
        local time = velocity.Magnitude / bulletspeed;
        if isdirtyfloat(time) then
            return origin + velocity;
        end
        local ignorelist = {self.cacheignore};
        local timepassed = 0;
        local origin0 = origin;
        local velocity0 = velocity;
        local penetrationdepth0 = penetrationdepth;
        local wallhit;
        while timepassed < time do
            local dt = time - timepassed;
            if (1 / 30) < dt then
                dt = 1 / 30;
            end
            local bulletdir = dt * velocity0 + dt * dt / 2 * acceleration;
            local ret0 = self.raycast.raycast(origin0, bulletdir, ignorelist, ignoreinst, true);
            if ret0 then
                local hit, enter = ret0.Instance, ret0.Position;
                local normalized = bulletdir.Unit;
                local ret1 = self.raycast.raycastSingleExit(enter, hit.Size.Magnitude * normalized, hit);
                if ret1 then
                    wallhit = ret1.Position;
                    local dist = normalized:Dot(ret1.Position - enter);
                    if not (dist < penetrationdepth0) then
                        break;
                    end
                    penetrationdepth0 -= dist;
                end
                local truedt = bulletdir:Dot(enter - origin0) / bulletdir:Dot(bulletdir) * dt;
                origin0 = enter + 0.01 * normalized;
                velocity0 += truedt * acceleration;
                timepassed += truedt;
                ignorelist[#ignorelist + 1] = hit;
            else
                origin0 += bulletdir;
                velocity0 += dt * acceleration;
                timepassed += dt;
            end
        end
        if wallhit then
            local dir = self.physics.trajectory(origin, acceleration, wallhit, bulletspeed);
            print(trajectory(origin, wallhit, bulletspeed, -196.2));
            print(dir);
            if not dir then
                return origin + velocity;
            end
            local dist = (wallhit - origin).Magnitude;
            dir = dir.Unit * dist;
            return origin + dir;
        end
        return origin + velocity;
    end
    function client:algo(x)
        return math.sin(math.acos(math.cos(x))) * 2 * math.pi;
    end
    function client:bullettracer(origin, velocity)
        local currentgun = self.gamelogic.currentgun;
        if not (currentgun and currentgun.data) then return; end
        local pos = self:gettracerpos(origin, velocity, constant.gvaccel, currentgun.data.penetrationdepth, currentgun.data.bulletspeed);
        local time = (pos - origin).Magnitude / currentgun.data.bulletspeed;
        local attach0, attach1 = self.newinstance("Attachment"), self.newinstance("Attachment");
        local beam: Beam = self.newinstance("Beam");
        attach0.CFrame = cframenew(origin);
        attach0.Parent = workspace.Terrain;
        attach1.CFrame = cframenew(pos);
        attach1.Parent = workspace.Terrain;
        beam.Attachment0 = attach0;
        beam.Attachment1 = attach1;
        beam.Color = ColorSequence.new(library.flags.enablelightningtracer and Color3.new(0.466666, 0.819607, 0.772549) or library.flags.bullettracercolor);
        beam.Transparency = NumberSequence.new(library.flags["bullettracercolor Transparency"]);
        beam.FaceCamera = true;
        beam.Width0 = library.flags.enablelightningtracer and 1 or 0.07;
        beam.Width1 = library.flags.enablelightningtracer and 1 or 0.07;
        beam.Segments = 1;
        if library.flags.enablelightningtracer then
            --beam.Segments = 10;
            beam.Texture = "http://www.roblox.com/asset/?id=446111271";
            --beam.Texture = "rbxassetid://1429966185";
            beam.TextureMode = Enum.TextureMode.Wrap;
            --beam.TextureMode = Enum.TextureMode.Static;
            --beam.TextureLength = 3.5;
            beam.TextureLength = 50;
            beam.TextureSpeed = 1.5;
            --beam.TextureSpeed = 0;
        end
        beam.LightEmission = 1;
        beam.LightInfluence = 0;
        beam.Parent = workspace.Terrain;
        coroutine.wrap(function()
            local t = 0;
            repeat
                t = t + runservice.Heartbeat:Wait();
            until t >= library.flags.bullettracertime + time;
            if library.flags.bullettracersmoothfading then
                for i = (library.flags["bullettracercolor Transparency"]), 1, 0.0125 do
                    beam.Transparency = NumberSequence.new(i);
                    runservice.Heartbeat:Wait();
                end
            end
            beam:Destroy();
            attach0:Destroy();
            attach1:Destroy();
        end)();
    end
    function client:getserverinfos(character)
        return self.lastblink[character];
    end




    local lookanglesid, equipid, equipknifeid, killfeedid, updatecharid; do
        for key,func in pairs(client.netfuncs) do
            local const = debug.getconstants(func);
            local upvals = debug.getupvalues(func);
            if table.find(const, "setlookangles") then
                lookanglesid = key;
            end
            if table.find(const, "updatecharacter") and type(upvals[1]) == "function" then
                updatecharid = key;
            end
            if table.find(const, "equip") and type(upvals[1]) == "function" then
                equipid = key;
            end
            if table.find(const, "equipknife") and type(upvals[1]) == "function" then
                equipknifeid = key;
            end
            if table.find(const, "Dist: ") then
                killfeedid = key;
            end
        end
    end
    client.oldkillfeed = client.netfuncs[killfeedid];
    client.netfuncs[killfeedid] = function(killer, victim, ...)
        if library.flags.revengenade then
            if victim == localplayer and killer ~= localplayer then
                local char = client.chartbl0[killer];
                if char and char.torso then
                    client.oldsend(client.network, "newgrenade", "FRAG", {
                        time = tick(),
                        blowuptime = 0,
                        frames = {
                            {
                                t0 = 0,
                                p0 = camera.CFrame.Position,
                                v0 = camera.CFrame.LookVector,
                                offset = vector3new(),
                                a = vector3new(0, -80, 0),
                                rot0 = camera.CFrame - camera.CFrame.Position,
                                rotv = (camera.CFrame - camera.CFrame.Position) * vector3new(19.539, -5, 0),
                                glassbreaks = {}
                            },
                            {
                                t0 = 0,
                                p0 = char.torso.Position,
                                v0 = vector3new(),
                                offset = vector3new(),
                                a = vector3new(),
                                rot0 = cframenew(),
                                rotv = vector3new(),
                                glassbreaks = {}
                            }
                        }
                    });
                end
            end
        end
        if library.flags.autonade then
            if killer ~= localplayer and victim == localplayer then
                client.previouskiller = killer;
                print("got the killer");
            end
        end
        return client.oldkillfeed(killer, victim, ...);
    end
    client.weapons = {};
    library:AddConnection(client.remoteevent.OnClientEvent, function(key, ...)
        local args = {...};
        if key == lookanglesid then
            local plr = args[1];
            if client.chartbl0[plr] then
                local charmodel = client.chartbl0[plr].torso.Parent;
                local infos = {
                    lasttick = tick(),
                    angle = args[2]
                };
                for i,v in pairs(client.chartbl0[plr]) do
                    infos[i] = v.Position;
                end
                client.lastblink[charmodel] = infos;
                client.godmodlist[charmodel] = nil;
            end
        end
        if key == equipid or key == equipknifeid then
            client.weapons[args[1]] = args[2];
        end
        if key == killfeedid then
            if client.weapons[args[2]] then
                client.weapons[args[2]] = "???";
            end
        end
    end);

    function client:getplrweapon(plr)
        local wep;
        if client.weapons[plr] and client.weapons[plr] ~= "???" then
            wep = client.weapons[plr];
        elseif client.weapons[plr] == nil then
            wep = "???";
        end
        return wep;
    end

    local isinchatting = false;
    library:AddConnection(runservice.Heartbeat, function()
        for char,info in pairs(client.lastblink) do
            if char.Parent and (tick() - info.lasttick) >= 2.25 then
                client.godmodlist[char] = true;
                if library.flags.trashtalkgodmod then
                    local plr = client.chartbl1[char];
                    if plr and not isinchatting then
                        isinchatting = true;
                        coroutine.wrap(function()
                            client.network:send("chatted", "GUYS LAUGH " .. plr.Name .. " IS USING GODMOD XD " .. tostring(math.random(1, 1000000)));
                            local t = 0;
                            repeat
                                t = t + runservice.Heartbeat:Wait();
                            until t >= 2.25;
                            isinchatting = false;
                        end)();
                    end
                end
            end
        end
    end);
    function client:toanglesyx(dir)
        return atan2(dir.Y, (dir.X * dir.X + dir.Z * dir.Z) ^ 0.5), atan2(-dir.X, -dir.Z);
    end
    --[[function client:applyarmchams(coloured)
        if coloured then
            local la = camera:WaitForChild("Left Arm")
            local ra = camera:WaitForChild("Right Arm")
            if la and ra then
                for i, t in next, la:GetDescendants() do
                    if t:IsA("BasePart") then
                        t.Material = Enum.Material[library.flags.handmaterial]
                        t.Color = library.flags.handcolour
                    end
                    if t:IsA("UnionOperation") then
                        t.UsePartColor = true
                    end
                end
                for i, t in next, ra:GetDescendants() do
                    if t:IsA("BasePart") then
                        t.Material = Enum.Material[library.flags.handmaterial]
                        t.Color = library.flags.handcolour
                    end
                    if t:IsA("UnionOperation") then
                        t.UsePartColor = true
                    end
                end
            end
        else
            local la = game.ReplicatedStorage.Character["Left Arm"]:Clone()
            local ra = game.ReplicatedStorage.Character["Right Arm"]:Clone()
            client.char:loadarms(la, ra, "Arm", "Arm")
        end
    end]]
    function client:applyarmchams(toggle, material, color)
        if not toggle then
            local la = replicatedstorage.Character["Left Arm"]:Clone();
            local ra = replicatedstorage.Character["Right Arm"]:Clone();
            self.char:loadarms(la, ra, "Arm", "Arm");

        else
            if not (self.char.alive and self.gamelogic.currentgun) then
                return;
            end
            local la, ra = camera:WaitForChild("Left Arm"), camera:WaitForChild("Right Arm");
            if la and ra then
                local child0, child1 = la:GetDescendants(), ra:GetDescendants();
                for i = 1, #child0 do
                    local inst = child0[i];
                    if inst:IsA("BasePart") then
                        inst.Material = Enum.Material[material];
                        inst.Color = color;
                    end
                    if inst:IsA("UnionOperation") then
                        inst.UsePartColor = true;
                    end
                end
                for i = 1, #child1 do
                    local inst = child1[i];
                    if inst:IsA("BasePart") then
                        inst.Material = Enum.Material[material];
                        inst.Color = color;
                    end
                    if inst:IsA("UnionOperation") then
                        inst.UsePartColor = true;
                    end
                end
            end
        end
    end
    function client:customrequire(mod)
        local old = syn.get_thread_identity();
        syn.set_thread_identity(2);
        local ret = require(mod);
        syn.set_thread_identity(old);
        return ret;
    end
    function client:hitboxscan(char)
        local serverinfos = self:getserverinfos(char);
        if not serverinfos then
            return;
        end
        local centerpos = serverinfos.rootpart;
        if self.oldoffsethitbox then
            centerpos = centerpos + self.oldoffsethitbox;
            local origin = self.camera.cframe.p;
            --local vel = self.trajectory(origin, constant.gvaccel, centerpos, self.gamelogic.currentgun.data.bulletspeed);
            if self:fastbulletcheck(origin, centerpos, self.gamelogic.currentgun.data.penetrationdepth) then
                return centerpos;
            end
        end
        local old = syn.get_thread_identity();
        syn.set_thread_identity(6);
        local pingcorrection = math.clamp(stats().PerformanceStats.Ping:GetValue() / 1000, 0, 1.5);
        syn.set_thread_identity(old);
        local points = {
            vector3new(constant.MAX_LENIENCY_HITBOX - pingcorrection, 0, 0), --right
            vector3new(-constant.MAX_LENIENCY_HITBOX - pingcorrection, 0, 0), --left,
            vector3new(0, constant.MAX_LENIENCY_HITBOX - pingcorrection, 0), --up
            vector3new(0, -constant.MAX_LENIENCY_HITBOX - pingcorrection, 0), --down
            vector3new(0, 0, -constant.MAX_LENIENCY_HITBOX - pingcorrection), --front
            vector3new(0, 0, constant.MAX_LENIENCY_HITBOX - pingcorrection) --back
        };
        for i = 1, #points do
            local offset = points[i];
            local newpos = centerpos + offset;
            if (newpos - serverinfos.rootpart).Magnitude > 4.5 then
                local dir = newpos - serverinfos.rootpart;
                newpos = centerpos + dir.Unit * 4.5;
            end
            --local newvel = self.trajectory(self.camera.cframe.p, constant.gvaccel, newpos, self.gamelogic.currentgun.data.bulletspeed);
            if self:fastbulletcheck(self.camera.cframe.p, newpos, self.gamelogic.currentgun.data.penetrationdepth) then
                self.oldoffsethitbox = offset;
                return newpos;
            end
        end
        table.clear(points);
        return centerpos;
    end
    function client:getorigin(char, theirvelocity)
        local pos = self:hitboxscan(char);
        if not pos then
            return self.gamelogic.currentgun.barrel.Position;
        end
        if not library.flags.positionscan then
            return self.gamelogic.currentgun.barrel.Position;
        end
        local currentgun = self.gamelogic.currentgun;
        local firstorigin = currentgun.barrel.Position;
        if library.flags.saveoldpos then
            if self.oldorigin and (self.oldorigin - self.pfcam.cframe.p).Magnitude < constant.MAX_LENIENCY_FIREPOS then
                firstorigin = self.oldorigin;
            end
        end
        if library.flags.saveoldoffset then
            if self.oldoffset and ((self.oldoffset + firstorigin) - self.pfcam.cframe.p).Magnitude < constant.MAX_LENIENCY_FIREPOS then
                firstorigin = firstorigin + self.oldoffset;
            end
        end
        local velocity = self.trajectory(firstorigin, constant.gvaccel, pos, currentgun.data.bulletspeed);
        if self:bulletcheck(firstorigin, pos, velocity, constant.gvaccel, currentgun.data.penetrationdepth, library.flags.autowallfps) then
            self.oldorigin = firstorigin;
            return firstorigin;
        end
        if theirvelocity.Magnitude > 0 then
            firstorigin = self.camera.cframe.p + (theirvelocity.Unit * library.flags.posradius);
            velocity = self.trajectory(firstorigin, constant.gvaccel, pos, currentgun.data.bulletspeed);
            if self:bulletcheck(firstorigin, pos, velocity, constant.gvaccel, currentgun.data.penetrationdepth, library.flags.autowallfps) then
                self.oldorigin = firstorigin;
                return firstorigin;
            end
        end
        firstorigin = self.camera.basecframe.p;
        local points = {
            vector3new(0, library.flags.posradius, 0),
            vector3new(library.flags.posradius, 0, 0),
            vector3new(-library.flags.posradius, 0, 0),
            vector3new(0, library.flags.posradius, 0),
            vector3new(0, -library.flags.posradius, 0),
            vector3new(0, 0, library.flags.posradius),
            vector3new(0, 0, -library.flags.posradius)
        };
        for i = 1, #points do
            local offset = points[i];
            local neworigin = firstorigin + offset;
            local newvelocity = self.trajectory(neworigin, constant.gvaccel, pos, currentgun.data.bulletspeed);
            if self:bulletcheck(neworigin, pos, newvelocity, constant.gvaccel, currentgun.data.penetrationdepth, library.flags.autowallfps) then
                self.oldoffset = offset;
                self.oldorigin = neworigin;
                return neworigin;
            end
        end
        table.clear(points);
        return currentgun.barrel.Position;
    end
    function client:gettporigin(char)
        -- gonna make it scan to the left and right later
        local params = RaycastParams.new()
        params.FilterDescendantsInstances = {localplayer.Character, camera}
        local origin = self.camera.cframe.p 
        for time, pos in next, client.tpcache do
            if tick()-time > 3 then
                client.tpcache[time] = nil
                continue
            end
            local trj = self.trajectory(pos, constant.gvaccel, char.Head.Position, self.gamelogic.currentgun.data.bulletspeed)
            local check = self:bulletcheck(pos, char.Head.Position, trj, constant.gvaccel, self.gamelogic.currentgun.data.penetrationdepth, library.flags.autowallfps)
            if check then
                return pos, false, time
            end
        end
        for i = 1, math.floor((library.flags.tpradius/library.flags.tpstep)+.5) do
            local mod = library.flags.tpradius % library.flags.tpstep
            local inc = library.flags.tpstep*(i-1)+(mod > 0 and mod or library.flags.tpstep)
            local incvec = origin+Vector3.new(0, inc, 0)
            local trj = self.trajectory(incvec, constant.gvaccel, char.Head.Position, self.gamelogic.currentgun.data.bulletspeed)
            local check = self:bulletcheck(incvec, char.Head.Position, trj, constant.gvaccel, self.gamelogic.currentgun.data.penetrationdepth, library.flags.autowallfps)
            if check then
                return incvec, true, tick()
            end
        end
    end
    function client.hitdetection(self, hit, pos, normal, pos2, normal2, initpos, initvel, t)
        if hit.Parent.Name == "Dead" then
            client.effects:bloodhit(pos);
            return;
        end
        if hit.Anchored then
            if hit.Name == "Window" then
                client.effects:breakwindow(hit, pos, normal, self.velocity, vector3new(), t, initpos, initvel);
            end
            if hit.Name == "Hitmark" then
                client.hud:firehitmarker();
            elseif hit.Name == "HitmarkHead" then
                client.hud:firehitmarker(true);
            end
            client.effects:bullethit(hit, pos, normal, pos2, normal2, self.velocity, true, true, math.random(0, 2));
        end
    end
    function client:shoot(plr, origin, velocity, pos, part, needsteleport, teleporttick)
        --[[if self.roundsystem.lock then
            return;
        end]]
        client.shootqueue = true;
        local currentgun = self.gamelogic.currentgun;
        local gldata = currentgun.data;
        local fireround = debug.getupvalue(currentgun.step, #debug.getupvalues(currentgun.step));
        local id = debug.getupvalue(fireround, 42);
        local spare, mag = debug.getupvalue(currentgun.reload, 4), debug.getupvalue(currentgun.reload, 5);
        local rdata = require(replicatedstorage.GunModules[currentgun.name]);
        mag = mag - 1;
        if mag == 0 then
            if spare < rdata.magsize then
                mag = spare;
                spare = 0;
            else
                mag = rdata.magsize;
                spare = spare - mag;
            end
        end
        debug.setupvalue(currentgun.reload, 4, spare);
        debug.setupvalue(currentgun.reload, 5, mag);
        self.hud:updateammo(mag, spare);
        local data = {
            firepos = origin,
            camerapos = self.camera.basecframe.p,
            bullets = {}
        };
        for i = 1, gldata.type == "SHOTGUN" and gldata.pelletcount or 1 do
            id = id + 1;
            debug.setupvalue(fireround, 42, id);
            data.bullets[i] = {velocity, id};
            if library.flags.bullettracer then
                self:bullettracer(origin, velocity);
            end
        end
        if library.flags.tpscan then
            local addtocache = needsteleport
            data.camerapos = origin 
            if needsteleport then
                coroutine.wrap(function()
                    for i = 1, 10 do
                        self.oldsend(self.network, "repupdate", origin, Vector2.new())
                    end
                end)()
            end
            self.oldsend(self.network, "newbullets", data, needstoteleport and tick() or teleporttick);
            for i = 1, 10 do
                self.oldsend(self.network, "repupdate", origin, Vector2.new())
            end
            if addtocache then
                self.tpcache[tick()] = origin
            end
        else
            self.oldsend(self.network, "newbullets", data, "ඞ ඞ ඞ ඞ ඞ ඞ ඞ ඞ ඞ ඞ ඞ ඞ");
        end
        for i = 1, #data.bullets do
            self.oldsend(self.network, "bullethit", plr, pos, part, data.bullets[i][2]);
            local stats = {
                position = origin,
                velocity = data.bullets[i][1],
                acceleration = self.publicsettings.bulletAcceleration,
                color = currentgun.data.bulletcolor or Color3.new(0.7843137254901961, 0.27450980392156865, 0.27450980392156865),
                size = 0.2,
                bloom = 0.005,
                brightness = 400,
                life = self.publicsettings.bulletLifeTime,
                visualorigin = currentgun.barrel.Position,
                physicsignore = self.cacheignore,
                dt = tick(),
                penetrationdepth = currentgun.data.penetrationdepth,
                ontouch = function(self, hit, pos, normal, pos2, normal2, player)
                    if not hit then return; end
                    client.hitdetection(self, hit, pos, normal, pos2, normal2, origin, data.bullets[i][1], tick());
                end
            };
            client.oldparticle(stats);
            client.hud:firehitmarker(part.Name == "Head");
            client.sound.PlaySound("hitmarker", nil, 1, 1.5);
        end
        self.sound.PlaySoundId(gldata.firesoundid, gldata.firevolume, gldata.firepitch, nil, nil, 0, 0.05);
        if gldata.animations and gldata.animations.onfire and currentgun.playanimation then
            --currentgun:playanimation("onfire");
        end
        local firerate = type(rdata.firerate) == "table" and rdata.firerate[1] or rdata.firerate;
        wait(60 / firerate);
        self.shootqueue = false;
    end
    function client:mousemove(x, y)
        local coef = self.camera.sensitivity * self.camera.sensitivitymult * atan(tan(deg(self.camera.basefov)) / constant.e ^ self.camera.magspring.p) / (32 / constant.pi);
        local newx = self.camera.angles.x - coef * y * self.camera.xinvert;
        local newangles = vector3new(math.clamp(newx, self.camera.minangle, self.camera.maxangle), self.camera.angles.y - coef * x);
        self.camera.delta = (newangles - self.camera.angles) / 0.016666666666666666;
        self.camera.angles = newangles;
    end
    function client:getnadeclosest()
        local max, close = 1 / 0;
        for i,v in pairs(self.chartbl0) do
            if (library.flags.nadetpteamcheck and i.Team ~= localplayer.Team or not library.flags.nadetpteamcheck) then
                local pos = self:getserverinfos(v.torso.Parent);
                if pos then
                    local trg = pos.torso;
                    local distance;
                    if library.flags.nadetpoption == "Closest To Cursor" then
                        local ppos, onscreen = camera:WorldToScreenPoint(trg);
                        if onscreen then
                            distance = vector2new(ppos.X - mouse.X, ppos.Y - mouse.Y).Magnitude;
                        end
                    elseif library.flags.nadetpoption == "Closest To Character" then
                        if localplayer.Character and findfirstchild(localplayer.Character, "HumanoidRootPart") then
                            distance = (trg - localplayer.Character.HumanoidRootPart.Position).Magnitude;
                        end
                    end
                    if distance then
                        if distance < max then
                            max = distance;
                            close = i;
                        end
                    end
                end
            end
        end
        return close;
    end
    function client:newparticle(pos, dir, ontouch)
        local currentgun = self.gamelogic.currentgun;
        if not currentgun then return; end
        client.particle.new{
            position = pos,
            velocity = dir,
            acceleration = client.publicsettings.bulletAcceleration,
            color = currentgun.data.bulletcolor or Color3.new(0.7843137254901961, 0.27450980392156865, 0.27450980392156865),
            size = 0.2,
            bloom = 0.005,
            brightness = 400,
            life = client.publicsettings.bulletLifeTime,
            visualorigin = pos,
            physicsignore = {localplayer.Character, workspace.Terrain, workspace.Ignore, camera},
            dt = tick(),
            penetrationdepth = currentgun.data.penetrationdepth,
            ontouch = ontouch,
            iscum = true
        };
    end
    function client:getlegittarget()
        -- Guess I'm doing the gay #shits
        --its not gay numerical forloop is the fastest
        local plrs = players:GetPlayers();
        local closest, closestc
        local dist = math.huge
        for i = 1, #plrs do
            local plr = plrs[i]
            local chr = self.chartbl0[plr]
            if plr ~= localplayer and plr.Team ~= localplayer.Team and self.hud:isplayeralive(plr) and chr and self.gamelogic.currentgun and self.gamelogic.currentgun then
                local wts, onscreen = camera:WorldToViewportPoint(chr.head.Position)
                local mag = (Vector2.new(wts.x, wts.y)-inputservice:GetMouseLocation()).magnitude
                if onscreen and mag <= dist then
                    dist = mag
                    closest = plrs[i]
                    closestc = chr
                end
            end
        end
        if closestc then
            return {
                plr = closest,
                chr = closestc,
                part = closestc.head
            }
        end
    end
    function client:getragetarget()
        local plrs = players:GetPlayers();
        for i = 1, #plrs do
            local plr = plrs[i];
            if plr == localplayer then
                continue;
            end
            if plr.Team == localplayer.Team then
                continue;
            end
            if not self.hud:isplayeralive(plr) then
                --print("n alive");
                continue;
            end
            --[[if table.find(self.whitelist, plr.Name) then
                print("ok so hes whitelisted");
                continue;
            end]]
            if not (self.gamelogic.currentgun and self.gamelogic.currentgun.data) then
                --print("no gamelogic?");
                continue;
            end
            local char = self.chartbl0[plr];
            if not char then
                --print("he not alive??");
                continue;
            end
            local charmodel = char.torso.Parent;
            if not findfirstchild(charmodel, "HumanoidRootPart") then
                --print("what(hrp faled???)");
                continue;
            end
            local pos = library.flags.tpscan and char.head.Position or self:hitboxscan(charmodel);
            if not pos then
                --print("what(hitboxscan)");
                continue;
            end
            local origin, tp, tptick 
            if library.flags.tpscan then
                origin, tp, tptick = self:gettporigin(charmodel)
            else
                origin = self:getorigin(charmodel, charmodel.HumanoidRootPart.Velocity);
            end
            if not origin then
                --print("what(origin)");
                continue;
            end
            local velocity = self.trajectory(origin, constant.gvaccel, pos, self.gamelogic.currentgun.data.bulletspeed);
            if not velocity then
                --print("what(traject)");
                continue; --this pussy using invis
            end
            if self:bulletcheck(origin, pos, velocity, constant.gvaccel, self.gamelogic.currentgun.data.penetrationdepth, library.flags.autowallfps) then
                return {
                    plr = plr,
                    origin = origin,
                    target = pos,
                    velocity = velocity,
                    tp = tp,
                    tptick = tptick
                };
            end
        end
    end
    do--main ragebot logic
        client.ragebotstep = 0;
        library:AddConnection(runservice.Heartbeat, function(dt)
            if library.flags.enablerage and library.flags.autoshoot and not client.shootqueue then
                local target = client:getragetarget();
                if target then
                    local chr = client.chartbl0[target.plr];
                    if chr and chr.head then
                        print("ok");
                        client.blocknewbullets = true;
                        client:shoot(target.plr, target.origin, target.velocity, target.target, chr.head, target.tp, target.tptick);
                    end
                end
            else
                client.blocknewbullets = false;
            end
        end);
    end
    do --esp
        client.espstorage = {};
        client.chamstorage = {};
        function client:getboundingbox(char) --thx ligaballs (using this cuz getboundingbox ugly and custom ones loop each char which is laggy)
            local torso = char.Torso;
            local head = char.Head;
            local feet = char["Right Leg"];

            local m_top = (function()
                local tophead = head.Position + vector3new(0, (head.Size.Y * 0.5) + 0.45, 0);
                local dist = (tophead - torso.Position).Magnitude;
                return torso.Position + (torso.CFrame.UpVector * (dist - 1)) + camera.CFrame.UpVector;
            end)();
            local m_bottom = (function()
                local bottomfeet = feet.Position - vector3new(0, (feet.Size.Y * 0.5) + 0.25, 0);
                local dist = (torso.Position - bottomfeet).Magnitude;
                return torso.Position - (torso.CFrame.UpVector * dist);
            end)();
            local top = camera:WorldToViewportPoint(m_top);
            local bottom = camera:WorldToViewportPoint(m_bottom);
            local width = library.round(math.abs(top.X - bottom.X));
            local height = library.round(math.max(math.abs(bottom.Y - top.Y), width * 0.6));
            local size = vector2new(library.round(math.max(height / 1.7, width * 1.8)), height);
            local pos = library.round(vector2new(top.X * 0.5 + bottom.X * 0.5 - size.X * 0.5, math.min(top.Y, bottom.Y)));
            local isvis = select(2, camera:WorldToViewportPoint(torso.Position));
            return pos, size, isvis;
        end
        function client:ischarvis(char)
            local torso = char.Torso;
            local idir = (torso.Position - camera.CFrame.Position);
            local dir = idir.Unit * idir.Magnitude;
            local ray = Ray.new(camera.CFrame.Position, dir);
            local ignorelist = {workspace.Ignore, workspace.Terrain, camera};
            local hit = workspace:FindPartOnRayWithIgnoreList(ray, ignorelist);
            return hit == nil;
        end
        function client:isvis(origin, target)
            local ignorelist = {self.cacheignore};
            local direction = target - origin;
            local unit = direction.Unit;
            local hit, enter = workspace:FindPartOnRayWithIgnoreList(Ray.new(origin, direction), ignorelist, false, true);
            if hit then
                if not hit.CanCollide and hit.Transparency == 1 then
                    return self:isvis(enter + 0.01 * unit, target);
                else
                    return false;
                end
            else
                return true;
            end
        end
        function client:applychams(char)
            local objects = {};
            for i, p in next, char:GetChildren() do
                if p:IsA("BasePart") and p.Transparency ~= 1 then
                    local ishead = p.Name == "Head"
                    local adorn = client.newinstance(ishead and "CylinderHandleAdornment" or "BoxHandleAdornment");
                    adorn.AlwaysOnTop = not library.flags.chamsvischeck;
                    adorn.Color3 = library.flags.chamscolour;
                    adorn.Transparency = library.flags["chamscolour Transparency"];
                    adorn.Adornee = p;
                    adorn.Parent = p;
                    adorn.ZIndex = 1;

                    local adornouter = client.newinstance(ishead and "CylinderHandleAdornment" or "BoxHandleAdornment");
                    adornouter.Color3 = library.flags.chamsoutcolour;
                    adornouter.Transparency = library.flags["chamsoutcolour Transparency"];
                    adornouter.Adornee = p;
                    adornouter.Parent = p;
                    adornouter.Name = "Outline"

                    if ishead then
                        --adorn.Radius = .75;
                        adorn.Radius = p.Size.X * 0.5 + 0.2;
                        --adorn.Height = p.Size.Y;
                        adorn.Height = p.Size.Y + 0.42;
                        adorn.CFrame = CFrame.Angles(math.rad(90), 0, 0)
                        --adornouter.Radius = .85;
                        adornouter.Radius = adorn.Radius + 0.1;
                        --adornouter.Height = p.Size.Y*1.25;
                        adornouter.Height = adorn.Height * 1.25;
                        adornouter.CFrame = CFrame.Angles(math.rad(90), 0, 0)
                    else
                        adorn.Size = p.Size;
                        adornouter.Size = p.Size*1.1;
                    end
                    table.insert(objects, adorn)
                    table.insert(objects, adornouter)
                end
            end
            client.chamstorage[char] = objects
            return objects;
        end
        function client.updatechams()
            for chr, objects in next, client.chamstorage do
                for i, obj in next, objects do
                    if obj.Name ~= "Outline" then
                        obj.AlwaysOnTop = not library.flags.chamsvischeck; 
                    end
                    obj.Transparency = obj.Name == "Outline" and library.flags["chamsoutcolour Transparency"] or library.flags["chamscolour Transparency"]
                    obj.Color3 = obj.Name == "Outline" and library.flags.chamsoutcolour or library.flags.chamscolour
                end
            end
        end
        function client:trimspace(txt)
            return (" " .. txt):gsub("%s%a", string.upper):sub(2);
        end
        function client:applyesp(plr)
            if plr == localplayer then
                return;
            end
            local s = {obj = {}};
            s.obj.mainbox = library:Create("Square", {
                Thickness = 1,
                Transparency = 1,
                Filled = false,
                Color = library.flags.useteamscolor and plr.TeamColor.Color or library.flags.boxcolor;
            });
            s.obj.boxoutline1 = library:Create("Square", {
                Thickness = 1,
                Filled = false,
                Transparency = 1
            });
            s.obj.boxoutline2 = library:Create("Square", {
                Thickness = 1,
                Filled = false,
                Transparency = 1
            });
            s.obj.healthbar = library:Create("Square", {
                Thickness = 1,
                Filled = true,
                Color = library.flags.highhp;
            });
            s.obj.healthoutline1 = library:Create("Square", {
                Thickness = 1,
                Filled = false,
                Transparency = 1
            });
            s.obj.hptext = library:Create("Text", {
                Font = library.flags.textfont,
                Size = library.flags.textsize,
                Center = true,
                Outline = true,
                Color = library.flags.useteamscolor and plr.TeamColor.Color or library.flags.textcolor
            });
            s.obj.nametext = library:Create("Text", {
                Text = library.flags.textmode == "Normal" and plr.Name or library.flags.textmode == "UPPERCASE" and plr.Name:upper() or library.flags.textmode == "lowercase" and plr.Name:lower(),
                Font = library.flags.textfont,
                Size = library.flags.textsize,
                Center = true,
                Outline = true,
                Color = library.flags.useteamscolor and plr.TeamColor.Color or library.flags.textcolor
            });
            local h = client:getplrweapon(plr);
            s.obj.weapontext = library:Create("Text", {
                Text = library.flags.textmode == "Normal" and self:trimspace(h:lower()) or library.flags.textmode == "UPPERCASE" and h or library.flags.textmode == "lowercase" and h:lower(),
                Font = library.flags.textfont,
                Size = library.flags.textsize,
                Center = true,
                Outline = true,
                Color = library.flags.useteamscolor and plr.TeamColor.Color or library.flags.textcolor
            });
            s.stepc = 0;
            s.step = runservice.RenderStepped:Connect(function(dt)
                s.stepc = s.stepc + dt;
                local cancontinue = false;
                if (s.stepc >= 1 / library.flags.espstep) or (not library.flags.esplimitstep) then
                    cancontinue = true;
                    s.stepc = 0;
                end
                if not cancontinue then
                    return;
                end
                local character = client.chartbl0[plr] and client.chartbl0[plr].torso and client.chartbl0[plr].torso.Parent;
                if client.hud:isplayeralive(plr) and character and findfirstchild(character, "Torso") and library.flags.espenable and (library.flags.espteamcheck and plr.Team ~= localplayer.Team or not library.flags.espteamcheck) and (library.flags.espvisiblecheck and self:ischarvis(character) or not library.flags.espvisiblecheck) then
                    --fuck you gas
                    -- I'll fuck you first
                    
                    if library.flags.chamsenabled and not s.chams and not client.chamstorage[character] then
                        s.chams = client:applychams(character)
                    elseif not library.flags.chamsenabled and client.chamstorage[character] then
                        for i, t in next, s.chams do
                            t:Destroy()
                        end
                        client.chamstorage[character] = nil 
                        s.chams = nil
                    end
                    local hppercent = math.clamp(client.hud:getplayerhealth(plr) / 100, 0, 1);
                    local pos, size, onscreen = client:getboundingbox(character);
                    s.obj.nametext.Text = library.flags.textmode == "Normal" and plr.Name or library.flags.textmode == "UPPERCASE" and plr.Name:upper() or library.flags.textmode == "lowercase" and plr.Name:lower();
                    local w = client:getplrweapon(plr);
                    s.obj.weapontext.Text = library.flags.textmode == "Normal" and self:trimspace(w:lower()) or library.flags.textmode == "UPPERCASE" and w or library.flags.textmode == "lowercase" and w:lower();
                    
                    if onscreen then
                        if library.flags.name then
                            s.obj.nametext.Position = vector2new(pos.x + size.x/2, pos.y - s.obj.nametext.TextBounds.Y - 1);
                            s.obj.nametext.Visible = true;
                        else
                            s.obj.nametext.Visible = false;
                        end
                        if library.flags.box then
                            s.obj.mainbox.Size = size;
                            s.obj.mainbox.Position = pos;
                            s.obj.boxoutline1.Size = vector2new(size.X + 2, size.Y + 2);
                            s.obj.boxoutline1.Position = vector2new(pos.X - 1, pos.Y - 1);
                            s.obj.boxoutline2.Size = vector2new(size.X - 2, size.Y - 2);
                            s.obj.boxoutline2.Position = vector2new(pos.X + 1, pos.Y + 1);
                            s.obj.mainbox.Visible = true;
                            s.obj.boxoutline1.Visible = true;
                            s.obj.boxoutline2.Visible = true;
                        else
                            s.obj.mainbox.Visible = false;
                            s.obj.boxoutline1.Visible = false;
                            s.obj.boxoutline2.Visible = false;
                        end
                        if library.flags.healthbar then
                            s.obj.healthbar.Color = library.flags.lowhp:Lerp(library.flags.highhp, hppercent);
                            s.obj.healthbar.Size = library.round(vector2new(2, (-size.Y * hppercent)));
                            s.obj.healthbar.Position = vector2new(pos.X - ((s.obj.healthbar.Size.X * 2) + 1), pos.Y + size.Y);
                            s.obj.healthoutline1.Size = vector2new(s.obj.healthbar.Size.X + 2, size.Y + 2);
                            s.obj.healthoutline1.Position = vector2new(s.obj.healthbar.Position.X - 1, pos.Y - 1);
                            s.obj.healthbar.Visible = true;
                            s.obj.healthoutline1.Visible = library.flags.box;
                        else
                            s.obj.healthbar.Visible = false;
                            s.obj.healthoutline1.Visible = false;
                        end

                        if library.flags.healthbar and library.flags.healthtext and hppercent < 1 then
                            s.obj.hptext.Text = tostring(library.round(hppercent * 100));
                            s.obj.hptext.Position = library.round(vector2new(s.obj.healthbar.Position.X, s.obj.healthbar.Position.Y + s.obj.healthbar.Size.Y - s.obj.hptext.TextBounds.Y));
                            s.obj.hptext.Visible = true;
                        else
                            s.obj.hptext.Visible = false;
                        end

                        if library.flags.weaponname then
                            s.obj.weapontext.Position = library.round(vector2new((pos.X - 1) + ((size.X + 2) / 2), (pos.Y - 1) + (size.Y + 2)));
                            s.obj.weapontext.Visible = true;
                        else
                            s.obj.weapontext.Visible = false;
                        end
                    else
                        for i,v in pairs(s.obj) do
                            v.Visible = false;
                        end
                    end
                else
                    for i,v in pairs(s.obj) do
                        v.Visible = false;
                    end
                    if s.chams then
                        local character = client.chartbl0[plr] and client.chartbl0[plr].torso and client.chartbl0[plr].torso.Parent
                        for i, t in next, s.chams do
                            t:Destroy()
                        end
                        if character then
                            client.chamstorage[character] = nil 
                        end 
                        s.chams = nil
                    end
                end
            end);
            client.espstorage[plr] = s;
        end
        function client:removeplr(plr)
            if self.espstorage[plr] then
                self.espstorage[plr].step:Disconnect();
                for i,v in pairs(self.espstorage[plr].obj) do
                    v:Remove();
                end
                self.espstorage[plr] = nil;
            end
        end
        local plrs = players:GetPlayers();
        for i = 1, #plrs do
            coroutine.wrap(client.applyesp)(client, plrs[i]);
        end
        library:AddConnection(players.PlayerRemoving, function(plr)
            client:removeplr(plr);
            --chams
        end);
        library:AddConnection(players.PlayerAdded, function(plr)
            client:applyesp(plr);
            --chams
        end);
    end
    do-- notif
        client.chatcache = {};
        local a = waitforchild(replicatedstorage.Misc, "MsgerMain");
        local gchat = waitforchild(waitforchild(localplayer.PlayerGui, "ChatGame"), "GlobalChat");
        function client:console(text)
            local c = a:Clone();
            c.Text = "[fartware]: ";
            c.Msg.Text = tostring(text);
            c.Parent = gchat;
            c.Msg.Position = UDim2.new(0, c.TextBounds.X / self.uiscaler.getscale(), 0, 0);
            self.chatcache[#self.chatcache + 1] = c;
        end
        library:AddConnection(runservice.Heartbeat, function(dt)
            for i = 1, #client.chatcache do
                local p = client.chatcache[i];
                if p.Parent == gchat then
                    --p.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1);
                    p.TextColor3 = Color3.fromHSV(math.abs(math.sin(tick() % 5)), 1, 1);
                end
            end
        end);
    end

    do --gunmods
        client.oldgunstats = {};
        local childs = replicatedstorage.GunModules:GetChildren();
        for i = 1, #childs do
            local mod = childs[i];
            client.oldgunstats[mod.Name] = {};
            for j,v in pairs(require(mod)) do
                client.oldgunstats[mod.Name][j] = v;
            end
        end
    end

    do -- hooks
        client.fakeplr = Instance.new("Player");
        client.oldcamstep = hookfunction(client.camera.step, function(dt)
            if client.oldgunstats and library.flags.lefthand and client.gamelogic.currentgun and client.gamelogic.currentgun.step then
                local i = 24;
                local cframe = client.oldgunstats[client.gamelogic.currentgun.name].mainoffset or CFrame.new(2, 0, 0);
                debug.setupvalue(client.gamelogic.currentgun.step, i, CFrame.new(-cframe.X, select(2, cframe:GetComponents())));
            end
            client.oldcamstep(dt)
            if client.char.alive then
                localplayer.Character.Torso.Pant.Transparency = (client.canthirdperson and not library.flags.changematerial) and 0 or 1;
            end
        end);
        library:AddConnection(localplayer.CharacterAdded, function(char)
            client.materials = {};
            client.originalcolors = {};
            client.originalgunmaterials = {};
            client.originalguncolors = {};
            client.originaltexture = {};
            char:WaitForChild("Humanoid");
            char:WaitForChild("HumanoidRootPart");
            debug.setupvalue(client.loadplayer, 1, client.fakeplr);
            client.loadplayer(localplayer);
            local updater = client.replication.getupdater(localplayer);
            debug.setupvalue(client.loadplayer, 1, localplayer);
            char.Humanoid.NameDisplayDistance = 0;
            char.HumanoidRootPart.CanCollide = true;
            char.Head.CanCollide = true;
            char.Torso.CanCollide = true;
            debug.getupvalue(updater.step, 24).makesound = false;
            debug.getupvalue(updater.step, 4).s = 999999999;
            debug.getupvalue(updater.step, 6).s = 999999999;
            debug.getupvalue(updater.step, 12).s = 6.5;
            debug.getupvalue(updater.step, 16).s = 999999999;
            client.localupdater = updater;
            for i,v in pairs(char:GetChildren()) do
                if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
                    client.materials[v] = v.Material;
                    client.originalcolors[v] = v.Color;
                end
            end
            client.charitemadded = char.DescendantAdded:Connect(function(item)
                if item:IsA("BasePart") and item.Name ~= "HumanoidRootPart" then
                    client.materials[item] = item.Material;
                    client.originalcolors[item] = item.Color;
                end
            end);
            coroutine.wrap(function()
                repeat
                    runservice.Heartbeat:Wait();
                until client.gamelogic.currentgun and findfirstchild(camera, client.gamelogic.currentgun.name);
                local childs = camera[client.gamelogic.currentgun.name]:GetChildren();
                for i = 1, #childs do
                    local part = childs[i];
                    if part:IsA("BasePart") and part.Transparency ~= 1 then
                        client.originalgunmaterials[part] = part.Material;
                        client.originalguncolors[part] = part.Color;
                        if part.ClassName == "MeshPart" then
                            client.originaltexture[part] = part.TextureID;
                        end
                    end
                end
            end)();
            client.weaponremoving = camera.ChildRemoved:Connect(function(potential)
		        --[[repeat
                    runservice.Heartbeat:Wait();
                until client.gamelogic.currentgun;]]
                if findfirstchild(replicatedstorage.GunModules, potential.Name) then
                    client.originalgunmaterials = nil;
                    client.originalguncolors = nil
                    client.originaltexture = nil;
                end
            end);
            client.weaponadded = camera.ChildAdded:Connect(function(potential)
                --[[repeat
                    runservice.Heartbeat:Wait();
                until client.gamelogic.currentgun;]]
                if findfirstchild(replicatedstorage.GunModules, potential.Name) then
                    client.originalgunmaterials = {};
                    client.originalguncolors = {};
                    client.originaltexture = {};
                    local achilds = potential:GetChildren();
                    for i = 1, #achilds do
                        local part = achilds[i];
                        if part:IsA("BasePart") and part.Transparency ~= 1 then
                            client.originalgunmaterials[part] = part.Material;
                            client.originalguncolors[part] = part.Color;
                            if part.ClassName == "MeshPart" then
                                client.originaltexture[part] = part.TextureID;
                            end
                        end
                    end
                end
            end)
            --camera:WaitForChild("Left Arm");
            client:applyarmchams(library.flags.enablehandmaterial, library.flags.handmaterial, library.flags.handcolor);
        end);
        library:AddConnection(localplayer.CharacterRemoving, function()
            client.spawnposition = nil;
            client.localupdater = nil;
            client.materials = nil;
            client.originalcolors = nil;
            client.originalhandmaterials = nil;
            client.originalgunmaterials = nil;
            client.originalguncolors = nil;
            client.originaltexture = nil;
            client.charitemadded:Disconnect();
            client.charitemadded = nil;
            client.weaponadded:Disconnect();
            client.weaponadded = nil;
            client.weaponremoving:Disconnect();
            client.weaponremoving = nil;
            client.tpcache = {};
        end);

        client.olddespawn = client.char.despawn;
        client.dontblock = false;

        function client.char:despawn()
            client.dontblock = true;
            client.olddespawn(client.char);
            client.dontblock = false;
        end

        function client.particle.new(tbl)
            if library.flags.enablelegit and library.flags.legitsilent and not tbl.iscum then
                return
            end
            return client.oldparticle(tbl)
        end

        function client.network:send(name, ...)
            local args = {...};
            if name == "debug" then
                return;
            end
            if name == "newbullets" then
                if client.blocknewbullets then
                    return;
                end
                if library.flags.enablelegit and library.flags.legitsilent then
                    local target = client:getlegittarget();
                    if target then
                        local character = client.chartbl0[target.plr]
                        local dir = client.trajectory(args[1].firepos, constant.gvaccel, target.part.Position, client.gamelogic.currentgun.data.bulletspeed)
                        for i, b in next, args[1].bullets do
                            b[1] = dir
                        end
                        args[2] = "ඞ ඞ ඞ ඞ ඞ ඞ ඞ ඞ ඞ ඞ ඞ ඞ";
                        client.oldsend(self, name, unpack(args))
                        for i, b in next, args[1].bullets do
                            client:newparticle(args[1].firepos, dir, function(particle, hit, pos, normal, pos2, normal2, player)
                                if player then
                                    client.oldsend(self, "bullethit", player, target.part.Position, target.part, b[2])
                                    client.hud:firehitmarker(hit.Name == "Head")
                                    client.sound.PlaySound("hitmarker", nil, 1, 1.5);
                                end
                            end)
                        end
                        return;
                    end
                end
                if library.flags.enablerage then
                    local target = client:getragetarget();
                    if target then
                        args[2] = "ඞ ඞ ඞ ඞ ඞ ඞ ඞ ඞ ඞ ඞ ඞ ඞ";
                        args[1].firepos = target.origin;
                        for i = 1, #args[1].bullets do
                            args[1].bullets[i][1] = target.velocity;
                        end
                        local root = client.chartbl0[target.plr] and client.chartbl0[target.plr].rootpart;
                        if root then
                            client.oldsend(client.network, "newbullets", unpack(args));
                            for i = 1, #args[1].bullets do
                                client.oldsend(client.network, "bullethit", target.plr, target.target, root, args[1].bullets[i][2]);
                            end
                            return;
                        end
                    end
                end
                if library.flags.bullettracer then
                    for i = 1, #args[1].bullets do
                        client:bullettracer(args[1].firepos, args[1].bullets[i][1]);
                    end
                end
            end
            if name == "spawn" then
                coroutine.wrap(function()
                    repeat
                        runservice.Heartbeat:Wait();
                    until localplayer.Character and findfirstchild(localplayer.Character, "HumanoidRootPart") and findfirstchild(localplayer.Character, "Humanoid") and client.gamelogic.currentgun;
                    client.spawnposition = client.camera.cframe.p;
                    if library.flags.autonade then
                        if client.gamelogic.gammo > 0 then
                            if client.previouskiller then
                                local char = client.chartbl0[client.previouskiller];
                                if char and char.torso then
                                    for i = 1, client.gamelogic.gammo do
                                        local campos = camera.CFrame.Position;
                                        client.oldsend(client.network, "newgrenade", "FRAG", {
                                            time = tick(),
                                            blowuptime = 0,
                                            frames = {
                                                {
                                                    t0 = 0,
                                                    p0 = camera.CFrame.Position,
                                                    v0 = camera.CFrame.LookVector,
                                                    offset = vector3new(),
                                                    a = vector3new(0, -80, 0),
                                                    rot0 = camera.CFrame - camera.CFrame.Position,
                                                    rotv = (camera.CFrame - camera.CFrame.Position) * vector3new(19.539, -5, 0),
                                                    glassbreaks = {}
                                                },
                                                {
                                                    t0 = 0,
                                                    p0 = char.torso.Position,
                                                    v0 = vector3new(),
                                                    offset = vector3new(),
                                                    a = vector3new(),
                                                    rot0 = cframenew(),
                                                    rotv = vector3new(),
                                                    glassbreaks = {}
                                                }
                                            }
                                        });
                                    end
                                end
                            end
                        end
                    end
                end)();
            end
            if name == "newgrenade" then
                if library.flags.nadetp then
                    local char = client.chartbl0[client:getnadeclosest()];
                    if char and char.torso then
                        args[2].blowuptime = library.flags.nadetptime;
                        args[2].frames[#args[2].frames + 1] = {
                            v0 = vector3new(),
                            glassbreaks = {},
                            t0 = 0,
                            offset = vector3new(),
                            rot0 = cframenew(),
                            a = vector3new(),
                            p0 = char.torso.Position,
                            rotv = vector3new()
                        };
                        --[[client.oldsend(client.network, "newgrenade", "FRAG", {
                            time = tick(),
                            blowuptime = 0,
                            frames = {
                                {
                                    t0 = 0,
                                    p0 = camera.CFrame.Position,
                                    v0 = camera.CFrame.LookVector,
                                    offset = vector3new(),
                                    a = vector3new(0, -80, 0),
                                    rot0 = camera.CFrame - camera.CFrame.Position,
                                    rotv = (camera.CFrame - camera.CFrame.Position) * vector3new(19.539, -5, 0),
                                    glassbreaks = {}
                                },
                                {
                                    t0 = 0,
                                    p0 = char.torso.Position,
                                    v0 = vector3new(),
                                    offset = vector3new(),
                                    a = vector3new(),
                                    rot0 = cframenew(),
                                    rotv = vector3new(),
                                    glassbreaks = {}
                                }
                            }
                        });
                        return;]]
                    end
                end
            end
            if name == "forcereset" then
                if not client.dontblock then
                    return;
                end
            end
            if name == "falldamage" then
                if library.flags.blockfalldamage or library.flags.bhop then
                    return;
                end
            end
            if name == "repupdate" then
                if library.flags.godmod then
                    return;
                end
                if library.flags.returnrep then
                    return;
                end
                local character = localplayer.Character;
                if character then
                    if findfirstchild(character, "Humanoid") then
                        character.Humanoid.HipHeight = library.flags.underground and -1.825 or 0;
                    end
                end
                if library.flags.enableantiaim and character then
                    local cframe = camera.CFrame;
                    local direction;
                    if library.flags.aayaw == "Random" then
                        local points = {
                            cframe.LookVector,
                            -cframe.LookVector,
                            cframe.RightVector,
                            -cframe.RightVector,
                            cframe:VectorToWorldSpace(vector3new(-1, 0, 1)).Unit,
                            cframe:VectorToWorldSpace(vector3new(1, 0, -1)).Unit,
                            cframe:VectorToWorldSpace(vector3new(1, 0, 1)).Unit,
                            cframe:VectorToWorldSpace(vector3new(-1, 0, 1)).Unit
                        };
                        direction = points[math.random(#points)];
                    elseif library.flags.aayaw == "At Target" then
                        local max, close = 1 / 0;
                        for i,v in pairs(client.chartbl0) do
                            if i.Team ~= localplayer.Team then
                                local pos = camera:WorldToViewportPoint(v.head.Position);
                                local dist = vector2new(pos.X - (camera.ViewportSize.X / 2), pos.Y - (camera.ViewportSize.Y / 2)).Magnitude;
                                if dist < max then
                                    max = dist;
                                    close = v;
                                end
                            end
                        end
                        if close then
                            direction = CFrame.lookAt(close.head.Position, camera.CFrame.Position).LookVector;
                        end
                    elseif library.flags.aayaw == "Back" then
                        direction = -cframe.LookVector;
                    elseif library.flags.aayaw == "Right" then
                        direction = cframe.RightVector;
                    elseif library.flags.aayaw == "Left" then
                        direction = -cframe.RightVector;
                    end
                    local yaw;
                    if direction then
                        _, yaw = client.vector.toanglesyx(direction);
                    else
                        yaw = (atan2(client.camera.lookvector.X, client.camera.lookvector.Z) + rad(library.flags.customaayaw));
                    end
                    local pitch = rad(
                        library.flags.aapitch == "Up" and 85
                        or
                        library.flags.aapitch == "Down" and -85
                        or
                        library.flags.aapitch == "Zero" and 0
                        or
                        library.flags.aapitch == "Random" and math.random(-85, 85)
                        or
                        library.flags.aapitch == "Custom" and library.flags.customaapitch
                    );
                    if library.flags.aayaw == "Crazy" then
                        yaw = client:algo(tick());
                    end
                    yaw = yaw ~= yaw and 0 or yaw;
                    pitch = pitch ~= pitch and 0 or pitch;
                    args[2] = vector2new(pitch, yaw);
                end
                if library.flags.enablethirdperson then
                    if client.localupdater then
                        client.localupdater.setlookangles(args[2]);
                    end
                end
            end
            if name == "equip" then
                if library.flags.fakeequip then
                    args[1] = library.flags.fakeequipweapon == "Primary" and 1 or library.flags.fakeequipweapon == "Secondary" and 2 or library.flags.fakeequipweapon == "Melee" and 3;
                end
                if library.flags.enablethirdperson then
                    if client.localupdater and client.gamelogic.currentgun then
                        local gunmodel = replicatedstorage.ExternalModels[client.gamelogic.currentgun.name];
                        local gundata = client:customrequire(replicatedstorage.GunModules[client.gamelogic.currentgun.name]);
                        if gunmodel and gundata then
                            client.localupdater[client.gamelogic.currentgun.type == "KNIFE" and "equipknife" or "equip"](gundata, gunmodel);
                        end
                    end
                end
            end
            if name == "stance" then
                if library.flags.forcestance then
                    args[1] = library.flags.stance:lower();
                end
                if library.flags.enablethirdperson then
                    if client.localupdater then
                        client.localupdater.setstance(args[1]);
                    end
                end
            end
            if name == "aim" then
                if library.flags.tilthead then
                    args[1] = true;
                end
                if library.flags.enablethirdperson then
                    if client.localupdater then
                        client.localupdater.setaim(args[1]);
                    end
                end
            end
            if name == "sprint" then
                if library.flags.lowerhand then
                    args[1] = true;
                end
                if library.flags.enablethirdperson then
                    if client.localupdater then
                        client.localupdater.setsprint(args[1]);
                    end
                end
            end
            return client.oldsend(client.network, name, unpack(args));
        end
        library:AddConnection(runservice.Stepped, function()
            local character = localplayer.Character;
            if not character then return; end
            --[[do
                local child = character:GetChildren();
                for i = 1, #child do
                    local p = child[i];
                    if p:IsA("BasePart") then
                        if p.Name == "HumanoidRootPart" then
                            p.CanCollide = false;
                        else
                            p.CanCollide = true;
                        end
                    end
                end
            end]]
            local currentgun = client.gamelogic.currentgun;
            if client.localupdater and currentgun then
                local childs = character:GetChildren();
                for i = 1, #childs do
                    local part = childs[i];
                    if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                        part.Transparency = client.canthirdperson and 0 or 1;
                    end
                end
                character.Head.Face.Transparency = client.canthirdperson and 0 or 1;
                character.Torso.Pant.Transparency = client.canthirdperson and 0 or 1;
                if client.localupdater and client.localupdater.getweapon() then --hide gun model
                    local modelchilds = client.localupdater.getweapon():GetChildren();
                    for i = 1, #modelchilds do
                        local part = modelchilds[i];
                        if part:IsA("BasePart") then
                            part.Transparency = not client.canthirdperson and 1 or 0;
                        end
                    end
                end
                --hide arms and gun
                local left = findfirstchild(camera, "Left Arm");
                local right = findfirstchild(camera, "Right Arm");
                if left and right then
                    local leftp = left:GetChildren();
                    local rightp = right:GetChildren();
                    for i = 1, #leftp do
                        local part = leftp[i];
                        if part:IsA("BasePart") then
                            part.Transparency = client.canthirdperson and 1 or 0;
                        end
                    end
                    for i = 1, #rightp do
                        local part = rightp[i];
                        if part:IsA("BasePart") then
                            part.Transparency = client.canthirdperson and 1 or 0;
                        end
                    end
                    if currentgun.hide and currentgun.show then
                        --dumb hake but works so stfu
                        debug.setupvalue(currentgun.show, 1, client.canthirdperson);
                        debug.setupvalue(currentgun.hide, 1, not client.canthirdperson);
                        (client.canthirdperson and currentgun.hide or currentgun.show)(currentgun, client.canthirdperson or nil);
                    end
                end
                local charchilds = character:GetChildren();
                for i = 1, #charchilds do
                    local v = charchilds[i];
                    if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" and client.materials and client.materials[v] and client.originalcolors and client.originalcolors[v] then
                        v.Material = library.flags.changematerial and Enum.Material[library.flags.thirdpersonmaterial] or client.materials[v];
                        v.Color = library.flags.changecolor and library.flags.thirdpersoncolor or client.originalcolors[v];
                    end
                end
            end
            local gun = client.gamelogic.currentgun and findfirstchild(camera, client.gamelogic.currentgun.name);
            if gun then
                local childs = gun:GetChildren();
                for i = 1, #childs do
                    local part = childs[i];
                    if part:IsA("BasePart") and part.Transparency ~= 1 and client.originalgunmaterials and client.originalgunmaterials[part] then
                        part.Material = library.flags.enablegunmaterial and Enum.Material[library.flags.gunmaterial] or client.originalgunmaterials[part];
                        part.Color = library.flags.enablegunmaterial and library.flags.guncolour or client.originalguncolors[part] or Color3.new()
                        if part:IsA("UnionOperation") then
                            part.UsePartColor = true
                        end
                    end
                    if client.originaltexture and client.originaltexture[part] then
                        part.TextureID = library.flags.enablegunmaterial and "rbxassetid://" .. 5843010904 or client.originaltexture[part];
                    end
                end
            end
        end);
        client.mt = getrawmetatable(game);
        client.oldnewindex = hookmetamethod(game, "__newindex", function(...)
            local self = ...;
            local key = select(2, ...);
            local value = select(3, ...);
            if self == camera and key == "CFrame" then
                client.canthirdperson = library.flags.enablethirdperson  and client.gamelogic.currentgun and library.flags.thirdpersonbind and (not client.gamelogic.currentgun.isaiming());
                local vecoffset = client.canthirdperson and cframenew(0, 0, library.flags.thirdpersondistance) or cframenew();
                local n = library.flags.camdistort and library.flags.camvertical or 1;
                local o = library.flags.camdistort and library.flags.camhorizontal or 1;
                local newcf = cframenew(0, 0, 0, n, 0, 0, 0, o, 0, 0, 0, 1);
                value = value * vecoffset * newcf;
                local character = localplayer.Character;
                if character then
                    
                end
            end
            if key == "CanCollide" then
                local character = localplayer.Character;
                if not character then return; end
                do
                    local child = character:GetChildren();
                    for i = 1, #child do
                        local p = child[i];
                        if p:IsA("BasePart") then
                            if self == p then
                                value = true;
                            end
                        end
                    end
                end
            end
            return client.oldnewindex(self, key, value);
        end);
        do --updater hook
            for plr,list in pairs(client.updaterholder) do
                if plr ~= localplayer then
                    if list.updater and list.updater.setstance and list.updater.setlookangles then
                        local setstance = list.updater.setstance;
                        local setlookangles = list.updater.setlookangles;
                        list.updater.setstance = function(stance)
                            stance = library.flags.forceothersstance and library.flags.otherstance:lower() or stance;
                            return setstance(stance);
                        end
                        list.updater.setlookangles = function(angle)
                            if not library.flags.forceotherspitch then
                                return setlookangles(angle);
                            end
                            local newpitch, newyaw = angle.X, angle.Y;
                            newpitch = rad(
                                library.flags.otherspitch == "Up" and 85
                                or
                                library.flags.otherspitch == "Down" and -85
                                or
                                library.flags.otherspitch == "Zero" and 0
                                or
                                library.flags.otherspitch == "Random" and math.random(-85, 85)
                                or
                                library.flags.otherspitch == "Custom" and library.flags.customotherspitch
                                or 0
                            );
                            if library.flags.otherspitch == "Look At Me" then
                                local head = list.updater.gethead();
                                if head then
                                    local cframe = CFrame.lookAt(head.Position, camera.CFrame.Position);
                                    newpitch, newyaw = client:toanglesyx(cframe.LookVector);
                                end
                            end
                            return setlookangles(vector2new(newpitch, newyaw));
                        end
                    end
                end
            end
            client.oldloadplr = debug.getupvalue(client.replication.getupdater, 2);
            debug.setupvalue(client.replication.getupdater, 2, function(plr)
                local ret = client.oldloadplr(plr);
                if plr == localplayer then
                    return ret;
                end
                local setstance = ret.setstance;
                local setlookangles = ret.setlookangles;
                ret.setstance = function(stance)
                    stance = library.flags.forceothersstance and library.flags.otherstance:lower() or stance;
                    return setstance(stance);
                end
                ret.setlookangles = function(angle)
                    if not library.flags.forceotherspitch then
                        return setlookangles(angle);
                    end
                    local newpitch, newyaw = angle.X, angle.Y;
                    newpitch = rad(
                        library.flags.otherspitch == "Up" and 85
                        or
                        library.flags.otherspitch == "Down" and -85
                        or
                        library.flags.otherspitch == "Zero" and 0
                        or
                        library.flags.otherspitch == "Random" and math.random(-85, 85)
                        or
                        library.flags.otherspitch == "Custom" and library.flags.customotherspitch
                        or 0
                    );
                    if library.flags.otherspitch == "Look At Me" then
                        local head = ret.gethead();
                        if head then
                            local cframe = CFrame.lookAt(head.Position, camera.CFrame.Position);
                            newpitch, newyaw = client:toanglesyx(cframe.LookVector);
                        end
                    end
                    return setlookangles(vector2new(newpitch, newyaw));
                end
                return ret;
            end);
        end

    end

    return client;
end
local suc, client = coroutine.resume(coroutine.create(init));
assert(suc, client);


coroutine.wrap(function()
    do--ui
        local legittab = library:AddTab("Legit");
        local ragetab = library:AddTab("Rage");
        local gunmodtab = library:AddTab("Gun Mods");
        local chartab = library:AddTab("Character");
        local visualstab = library:AddTab("Visuals");
        local misctab = library:AddTab("Misc");

        local legitcolunm1 = legittab:AddColumn();
        local legitcolunm2 = legittab:AddColumn();
        local legitmain = legitcolunm1:AddSection("Main")
        local legithb = legitcolunm2:AddSection("Hitbox Expander")

        local ragecolumn = ragetab:AddColumn();
        local ragecolumn1 = ragetab:AddColumn();
        local ragemain = ragecolumn:AddSection("Main");
        local knifeaurasec = ragecolumn:AddSection("Knife Aura");
        local nadetpsec = ragecolumn1:AddSection("Nades");
        local antiaimsec = ragecolumn1:AddSection("Anti Aim");

        local gunmodcolumn = gunmodtab:AddColumn();
        local gunmodmain = gunmodcolumn:AddSection("Main");

        local charcolumn = chartab:AddColumn();
        local charmain = charcolumn:AddSection("Main");

        local visualscolumn = visualstab:AddColumn();
        local visualscolumn1 = visualstab:AddColumn();
        local espsec = visualscolumn:AddSection("ESP");
        local chamssec = visualscolumn:AddSection("Chams");
        local thirdpersonsec = visualscolumn1:AddSection("Third Person");
        local bulltracsec = visualscolumn1:AddSection("Bullet Tracer");
        local miscvisualssec = visualscolumn1:AddSection("Misc");

        do -- SEXY LEGIT BOT (I CUMMED ON INTEGER)

            -- Main
            legitmain:AddToggle{text = "Enable", flag = "enablelegit"}
            legitmain:AddToggle{text = "Aimbot", flag = "legitab"}
            legitmain:AddToggle{text = "Silent Aim", flag = "legitsilent"}
            legitmain:AddSlider{text = "Aimbot FOV", flag = "fovab", min = 0, max = 180, value = 5}
            legitmain:AddSlider{text = "Aimbot Smoothness", flag = "fovab", float = .1, min = 0, max = 1, value = 0}
            legitmain:AddSlider{text = "Silent FOV", flag = "fovsilent", min = 0, max = 180, value = 5}
            legitmain:AddSlider{text = "Silent Priority Hitchance", flag = "silentphitchance", min = 0, max = 100, value = 85}
            legitmain:AddSlider{text = "Silent Hitchance", flag = "silenthitchance", min = 0, max = 100, value = 85}

            -- HB Expanda
            legithb:AddToggle{text = "Enabled", flag = "hbenable"}
            legithb:AddSlider{text = "Expansion", flag = "hbexpansion", float = .05, min = 0, max = 4, value = 1.75}
        end

        do --rage
            ragemain:AddToggle({text = "Enable", flag = "enablerage"});
            ragemain:AddToggle({text = "Auto Shoot", flag = "autoshoot"});
            ragemain:AddToggle({text = "Position Scanning", flag = "positionscan"});
            ragemain:AddToggle({text = "TP Scanning", flag = "tpscan"});
            ragemain:AddToggle({text = "Save Old Position", flag = "saveoldpos"});
            ragemain:AddToggle({text = "Save Old Offset", flag = "saveoldoffset"});
            ragemain:AddSlider({text = "Radius", flag = "posradius", float = 0.25, min = 1, max = 10, value = 1});
            ragemain:AddSlider({text = "TP Radius", flag = "tpradius", float = 1, min = 25, max = 500, value = 100});
            ragemain:AddSlider({text = "TP Step", flag = "tpstep", float = 1, min = 25, max = 100, value = 25});
            ragemain:AddList({text = "Autowall Version", flag = "autowallver", values = {"Old", "New"}, value = "Old"});
            ragemain:AddSlider({text = "Autowall Fps", flag = "autowallfps", float = 0.5, min = 10, max = 60, value = 10});

            ragemain:AddList({
                text = "Whitelist Player",
                flag = "whitelistplayer",
                max = 5,
                values = (function()
                    local ret = table.create(players.MaxPlayers);
                    for i,v in pairs(players:GetPlayers()) do
                        if v ~= localplayer then
                            ret[#ret + 1] = v.Name;
                        end
                    end
                    return ret;
                end)(),
                canInit = false,
                callback = function(plrname)
                    if not table.find(client.whitelist, plrname) then
                        --to avoid duplicates
                        client.whitelist[#client.whitelist + 1] = plrname;
                    end
                end
            });
        end
        do ---knifaura
            knifeaurasec:AddToggle({text = "Enable", flag = "enableknifeaura"});
            knifeaurasec:AddToggle({text = "Wall Check", flag = "knifeaurawallcheck"});
            knifeaurasec:AddToggle({text = "Requires Knife", flag = "knifeaurarequiresknife"});
            knifeaurasec:AddSlider({text = "Max Distance", flag = "knifeauradist", min = 0, max = 25, value = 0});
            do --i hate this code
                function client.knifeaurastep()
                    local target;
                    local plrs = players:GetPlayers();
                    for i = 1, #plrs do
                        local plr = plrs[i];
                        if plr ~= localplayer and localplayer.Team ~= plr.Team and localplayer.Character and findfirstchild(localplayer.Character, "HumanoidRootPart") then
                            local char = client.chartbl0[plr];
                            if char then
                                local hrp = localplayer.Character.HumanoidRootPart;
                                local dist = localplayer:DistanceFromCharacter(char.head.Position);
                                if dist <= library.flags.knifeauradist then
                                    local ray = Ray.new(hrp.Position, (char.head.Position - hrp.Position).Unit * library.flags.knifeauradist);
                                    local hit = workspace:FindPartOnRayWithIgnoreList(ray, client.cacheignore);
                                    if (library.flags.knifeaurawallcheck and (not hit) or not library.flags.knifeaurawallcheck) then
                                        target = plr;
                                    end
                                end
                            end
                        end
                    end
                    if target and client.chartbl0[target] and client.chartbl0[target].head then
                        if not library.flags.knifeaurarequiresknife then
                            if client.gamelogic.currentgun then
                                local old = client.gamelogic.currentgun.gunnumber;
                                client.oldsend(client.network, "equip", 3);
                                client.oldsend(client.network, "knifehit", target, tick(), client.chartbl0[target].head);
                                client.oldsend(client.network, "equip", old);
                            end
                        else
                            if client.gamelogic.currentgun and client.gamelogic.currentgun.type ~= "KNIFE" then
                                return;
                            end
                            client.oldsend(client.network, "knifehit", target, tick(), client.chartbl0[target].head);
                        end
                    end
                end
                library:AddConnection(runservice.Heartbeat, client.knifeaurastep);
            end
        end
        do --nade tp
            nadetpsec:AddToggle({text = "Nade Tp", flag = "nadetp"});
            nadetpsec:AddToggle({text = "Team Check", flag = "nadetpteamcheck"});
            nadetpsec:AddList({text = "Target Selection", flag = "nadetpoption", max = 2, values = {"Closest To Cursor", "Closest To Character"}});
            nadetpsec:AddSlider({text = "Blowup Time", flag = "nadetptime", min = 0, max = 5, float = 0.25, value = 0, suffix = "s"});
            nadetpsec:AddToggle({text = "Revenge Nade", flag = "revengenade"});
            nadetpsec:AddToggle({text = "Auto Nade", flag = "autonade"});
        end
        do --anti aim
            antiaimsec:AddDivider("Main");
            antiaimsec:AddToggle({text = "Enable", flag = "enableantiaim"});
            antiaimsec:AddList({text = "Pitch", flag = "aapitch", value = "Down", values = {"Up", "Zero", "Down", "Random", "Custom"}});
            antiaimsec:AddList({text = "Yaw", flag = "aayaw", value = "Back", values = {"Back", "Right", "Left", "Random", "At Target", "Custom", "Crazy"}});
            antiaimsec:AddSlider({text = "Custom Pitch", flag = "customaapitch", min = -85, max = 85, float = 0.01, value = 0, suffix = "°"});
            antiaimsec:AddSlider({text = "Custom Yaw", flag = "customaayaw", min = -180, max = 180, float = 0.01, value = 0, suffix = "°"});

            antiaimsec:AddToggle({text = "Force Local Stance", flag = "forcestance", callback = function(bool)
                if bool and library.flags.stance then
                    coroutine.wrap(function()
                        repeat
                            runservice.Heartbeat:Wait();
                        until client.char.alive;
                        client.oldsend(client.network, "stance", library.flags.stance:lower());
                    end)();
                end
            end});
            antiaimsec:AddToggle({text = "Force Others Stance", flag = "forceothersstance"});
            antiaimsec:AddToggle({text = "Force Others Pitch", flag = "forceotherspitch"});
            antiaimsec:AddList({text = "Locals Stance", flag = "stance", value = "Stand", values = {"Stand", "Crouch", "Prone"}, callback = function(stance)
                if library.flags.forcestance then
                    coroutine.wrap(function()
                        repeat
                            runservice.Heartbeat:Wait();
                        until client.char.alive;
                        client.oldsend(client.network, "stance", stance:lower());
                    end)();
                end
            end});
            antiaimsec:AddList({text = "Others Stance", flag = "otherstance", value = "Stand", values = {"Stand", "Crouch", "Prone"}, callback = function(stance)
                for plr,list in pairs(client.updaterholder) do
                    if list.updater and list.updater ~= client.localupdater and list.updater.setstance then
                        list.updater.setstance(stance:lower());
                    end
                end
            end});
            antiaimsec:AddList({text = "Others Pitch", flag = "otherspitch", value = "Down", values = {"Up", "Down", "Zero", "Random", "Look At Me", "Custom"}, callback = function()
                for plr,list in pairs(client.updaterholder) do
                    if list.updater and list.updater ~= client.localupdater and list.updater.setlookangles then
                        list.updater.setlookangles(vector2new());
                    end
                end
            end});
            antiaimsec:AddSlider({text = "Custom Pitch", flag = "customotherspitch", min = -85, max = 85, float = 0.01, value = 0, suffix = "°", callback = function()
                for plr,list in pairs(client.updaterholder) do
                    if list.updater and list.updater ~= client.localupdater and list.updater.setlookangles then
                        list.updater.setlookangles(vector2new());
                    end
                end
            end});
            antiaimsec:AddDivider("Misc");
            antiaimsec:AddToggle({text = "Underground", flag = "underground"});
            antiaimsec:AddToggle({text = "Tilt Head", flag = "tilthead", callback = function(bool)
                coroutine.wrap(function()
                    repeat
                        runservice.Heartbeat:Wait();
                    until client.char.alive;
                    client.network:send("aim", bool);
                end)();
            end});
            antiaimsec:AddToggle({text = "Lower Hand", flag = "lowerhand", callback = function(bool)
                coroutine.wrap(function()
                    repeat
                        runservice.Heartbeat:Wait();
                    until client.char.alive;
                    client.network:send("sprint", bool);
                end)();
            end});
            antiaimsec:AddToggle({text = "Fake Equip", flag = "fakeequip", callback = function(bool)
                if bool then
                    client.network:send("equip", library.flags.fakeequipweapon == "Primary" and 1 or library.flags.fakeequipweapon == "Secondary" and 2 or library.flags.fakeequipweapon == "Melee" and 3);
                end
            end});
            antiaimsec:AddList({text = "Weapon", flag = "fakeequipweapon", values = {"Primary", "Secondary", "Melee"}, value = "Primary", max = 3, callback = function(val)
                if library.flags.fakeequip then
                    client.network:send("equip", val == "Primary" and 1 or val == "Secondary" and 2 or val == "Melee" and 3);
                end
            end});
        end

        do --espsec
            espsec:AddDivider("Main");
            espsec:AddToggle({text = "Enable", flag = "espenable"});
            espsec:AddToggle({text = "Name", flag = "name"});
            --espsec:AddToggle({text = "Chams", flag = "chamsenabled"});
            espsec:AddToggle({text = "Box", flag = "box"});
            espsec:AddToggle({text = "Health Bar", flag = "healthbar"});
            espsec:AddToggle({text = "Health Text", flag = "healthtext"});
            espsec:AddToggle({text = "Weapon Name", flag = "weaponname"});
            espsec:AddDivider("Color");
            espsec:AddToggle({text = "Use Teams Color", flag = "useteamscolor", callback = function(bool)
                for i,v in pairs(client.espstorage) do
                    if v.obj and v.obj.mainbox and v.obj.hptext and v.obj.weapontext and v.obj.nametext then
                        local c = bool and i.TeamColor.Color or library.flags.textcolor;
                        v.obj.mainbox.Color = c;
                        v.obj.hptext.Color = c;
                        v.obj.weapontext.Color = c;
                        v.obj.nametext.Color = c;
                    end
                end
            end});
            espsec:AddColor({text = "Text Color", flag = "textcolor", color = Color3.new(1, 1, 1), callback = function(color)
                for i,v in pairs(client.espstorage) do
                    if v.obj and v.obj.nametext and v.obj.hptext and v.obj.weapontext then
                        local c = library.flags.useteamscolor and i.TeamColor.Color or color;
                        v.obj.nametext.Color = c;
                        v.obj.hptext.Color = c;
                        v.obj.weapontext.Color = c;
                    end
                end
            end});
            espsec:AddColor({text = "Box Color", flag = "boxcolor", color = Color3.new(1, 1, 1), callback = function(color)
                for i,v in pairs(client.espstorage) do
                    if v.obj and v.obj.mainbox then
                        v.obj.mainbox.Color = library.flags.useteamscolor and i.TeamColor.Color or color;
                    end
                end
            end});
            espsec:AddColor({text = "High Health Color", flag = "highhp", color = Color3.new(0, 1, 0)});
            espsec:AddColor({text = "Low Health Color", flag = "lowhp", color = Color3.new(1, 0, 0)});
            --espsec:AddColor({text = "Chams Color", flag = "chamscolour", trans = .3, color = Color3.new(1, 1, 1), callback = client.updatechams, calltrans = client.updatechams});
            --espsec:AddColor({text = "Chams Outline Color", flag = "chamsoutcolour", trans = .95, color = Color3.new(1, 0, 1)});
            espsec:AddDivider("Misc");
            espsec:AddToggle({text = "Team Check", flag = "espteamcheck"});
            espsec:AddToggle({text = "Visible Check", flag = "espvisiblecheck"});
            espsec:AddSlider({text = "Font", flag = "textfont", min = 0, max = 3, value = 0, callback = function(f)
                for i,v in pairs(client.espstorage) do
                    if v.obj and v.obj.nametext and v.obj.hptext and v.obj.weapontext then
                        v.obj.nametext.Font = f;
                        v.obj.hptext.Font = f;
                        v.obj.weapontext.Font = f;
                    end
                end
            end});
            espsec:AddSlider({text = "Text Size", flag = "textsize", min = 10, max = 20, value = 10, callback = function(f)
                for i,v in pairs(client.espstorage) do
                    if v.obj and v.obj.nametext and v.obj.hptext and v.obj.weapontext then
                        v.obj.nametext.Size = f;
                        v.obj.hptext.Size = f;
                        v.obj.weapontext.Size = f;
                    end
                end
            end});
            espsec:AddList({text = "Text Mode", flag = "textmode", values = {"Normal", "UPPERCASE", "lowercase"}, value = "Normal"});
            espsec:AddToggle({text = "Limit Step Fps", flag = "esplimitstep"}):AddSlider({flag = "espstep", float = 0.1, min = 10, max = 100, value = 10});
        end
        do--chams
            chamssec:AddToggle({text = "Chams", flag = "chamsenabled"});
            chamssec:AddToggle({text = "Visible Check", flag = "chamsvischeck", callback = client.updatechams});
            chamssec:AddColor({text = "Chams Color", flag = "chamscolour", trans = .3, color = Color3.new(1, 1, 1), callback = client.updatechams, calltrans = client.updatechams});
            chamssec:AddColor({text = "Chams Outline Color", flag = "chamsoutcolour", trans = .95, color = Color3.new(1, 0, 1)});
        end
        do --bulltracer
            bulltracsec:AddToggle({text = "Enable", flag = "bullettracer"}):AddColor({flag = "bullettracercolor", trans = 1, color = Color3.new(1, 1, 1)});
            bulltracsec:AddToggle({text = "Smooth Fading", flag = "bullettracersmoothfading"});
            bulltracsec:AddSlider({text = "Max Time", flag = "bullettracertime", min = 1, max = 10, value = 1, float = 0.5});
            bulltracsec:AddToggle({text = "Lightning Tracer", flag = "enablelightningtracer"});
        end

        do --thirdperson
            local toggle = thirdpersonsec:AddToggle({text = "Enable", flag = "enablethirdperson"});
            toggle:AddBind({
                flag = "thirdpersonbind"
            });
            toggle:AddSlider({
                flag = "thirdpersondistance",
                float = 0.1,
                min = 5,
                max = 20,
                value = 5
            });
            thirdpersonsec:AddToggle({text = "Change Material", flag = "changematerial"}):AddList({flag = "thirdpersonmaterial", values = {"ForceField", "SmoothPlastic"}, value = "", max = 2});
            thirdpersonsec:AddToggle({text = "Change Color", flag = "changecolor"}):AddColor({flag = "thirdpersoncolor", color = Color3.new(1, 1, 1)});
        end

        do --gunchamsnhand
            miscvisualssec:AddDivider("Player");
            local gunmaterial = miscvisualssec:AddToggle({text = "Gun Material", flag = "enablegunmaterial"})
            gunmaterial:AddColor({flag = "guncolour", color = Color3.new(1, 1, 1)});
            gunmaterial:AddList({flag = "gunmaterial", values = {"ForceField", "SmoothPlastic"}, value = "ForceField"});
            local handmaterial = miscvisualssec:AddToggle({text = "Hand Material", flag = "enablehandmaterial", callback = function(bool)
                --[[if client.char.alive and client.gamelogic.currentgun then
                    client:applyarmchams(bool)
                end]]
                if not (client.char.alive and client.gamelogic.currentgun) then
                    return;
                end
                client:applyarmchams(bool, library.flags.handmaterial, library.flags.handcolor);
            end});
            handmaterial:AddColor({flag = "handcolor", color = Color3.new(1, 1, 1), callback = function(color)
                client:applyarmchams(library.flags.enablehandmaterial, library.flags.handmaterial, color);
            end});
            handmaterial:AddList({flag = "handmaterial", values = {"ForceField", "SmoothPlastic"}, value = "ForceField", callback = function(material)
                client:applyarmchams(library.flags.enablehandmaterial, material, library.flags.handcolor);
            end});
            miscvisualssec:AddDivider("World");
            miscvisualssec:AddToggle({text = "Ambient", flag = "ambient"}):AddColor({flag = "ambientcolor", color = game.Lighting.Ambient, callback = function(color)
                game.Lighting.Ambient = color;
            end});
            miscvisualssec:AddToggle({text = "Better Shadow", flag = "bettershow", callback = function(bool)
                if not sethiddenproperty then
                    return;
                end
                sethiddenproperty(game.Lighting, "Technology", bool and Enum.Technology.ShadowMap or Enum.Technology.Compatibility);
            end});
            miscvisualssec:AddDivider("Camera");
            miscvisualssec:AddToggle({text = "Camera Distortion", flag = "camdistort"});
            miscvisualssec:AddSlider({text = "Horizontal", flag = "camhorizontal", min = 0.1, max = 1, float = 0.01, value = 1});
            miscvisualssec:AddSlider({Text = "Vertical", flag = "camvertical", min = 0.1, max = 1, float = 0.01, value = 1});
            library:AddConnection(game.Lighting:GetPropertyChangedSignal("Ambient"), function()
                if library.flags.ambient then
                    game.Lighting.Ambient = library.flags.ambientcolor;
                end
            end);
        end
        library:AddConnection(players.PlayerAdded, function(plr)
            library.options.whitelistplayer:AddValue(plr.Name);
        end);

        library:AddConnection(players.PlayerRemoving, function(plr)
            library.options.whitelistplayer:RemoveValue(plr.Name);
        end);
        do --char bullshit
            local fly = charmain:AddToggle({text = "Enable Fly", flag = "fly", callback = function(bool)
                if bool and library.flags.flybind then
                    return;
                end
                if localplayer.Character and findfirstchild(localplayer.Character, "HumanoidRootPart") then
                    local bodyvel = localplayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity");
                    if bodyvel then
                        bodyvel.MaxForce = vector3new();
                    end
                end
            end});
            fly:AddBind({flag = "flybind"});
            fly:AddSlider({flag = "flyspeed", min = 50, max = 150, value = 50, float = 0.1});
            
            charmain:AddToggle({text = "Enable Bhop", flag = "bhop"}):AddSlider({flag = "bhopspeed", min = 25, max = 50, value = 25, float = 0.1});
            charmain:AddToggle({text = "Super Speed", flag = "enablesuperspeed", callback = function(bool)
                if bool then
                    return;
                end
                if localplayer.Character and findfirstchild(localplayer.Character, "HumanoidRootPart") then
                    local bodyvel = localplayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity");
                    if bodyvel then
                        if library.flags.fly or library.flags.bhop then
                            return;
                        end
                        bodyvel.MaxForce = vector3new();
                    end
                end
            end}):AddSlider({flag = "superspeed", min = 10, max = 100, value = 10});
            charmain:AddToggle({text = "No Fall Damage", flag = "blockfalldamage"});
            do
                --i hate this code so much
                local isholding = {w = false, a = false, s = false, d = false, space = false, ctrl = false};
                library:AddConnection(game:GetService("UserInputService").InputBegan, function(key, gp)
                    if gp then return; end
                    if key.KeyCode == Enum.KeyCode.W then
                        isholding.w = true;
                    end
                    if key.KeyCode == Enum.KeyCode.A then
                        isholding.a = true;
                    end
                    if key.KeyCode == Enum.KeyCode.S then
                        isholding.s = true;
                    end
                    if key.KeyCode == Enum.KeyCode.D then
                        isholding.d = true;
                    end
                    if key.KeyCode == Enum.KeyCode.Space then
                        isholding.space = true;
                    end
                    if key.KeyCode == Enum.KeyCode.LeftControl then
                        isholding.ctrl = true;
                    end
                end);
                library:AddConnection(game:GetService("UserInputService").InputEnded, function(key, gp)
                    if gp then return; end
                    if key.KeyCode == Enum.KeyCode.W then
                        isholding.w = false;
                    end
                    if key.KeyCode == Enum.KeyCode.A then
                        isholding.a = false;
                    end
                    if key.KeyCode == Enum.KeyCode.S then
                        isholding.s = false;
                    end
                    if key.KeyCode == Enum.KeyCode.D then
                        isholding.d = false;
                    end
                    if key.KeyCode == Enum.KeyCode.Space then
                        isholding.space = false;
                    end
                    if key.KeyCode == Enum.KeyCode.LeftControl then
                        isholding.ctrl = false;
                    end
                end);
                library:AddConnection(runservice.Stepped, function()
                    local character = localplayer.Character;
                    local hrp = character and findfirstchild(character, "HumanoidRootPart");
                    if hrp then
                        local velocity = vector3new();
                        local cframe = camera.CFrame;
                        if isholding.w then
                            velocity = vector3new(cframe.LookVector.X, 0, cframe.LookVector.Z);
                        end
                        if isholding.s then
                            velocity = -vector3new(cframe.LookVector.X, 0, cframe.LookVector.Z);
                        end
                        if isholding.d then
                            velocity = vector3new(cframe.RightVector.X, 0, cframe.RightVector.Z);
                        end
                        if isholding.a then
                            velocity = -vector3new(cframe.RightVector.X, 0, cframe.RightVector.Z);
                        end
                        if isholding.a and isholding.w then
                            velocity = cframe:VectorToWorldSpace(Vector3.new(-1, 0, -1));
                        end
                        if isholding.d and isholding.w then
                            velocity = cframe:VectorToWorldSpace(Vector3.new(1, 0, -1));
                        end
                        if isholding.d and isholding.s then
                            velocity = cframe:VectorToWorldSpace(Vector3.new(1, 0, 1));
                        end
                        if isholding.a and isholding.s then
                            velocity = cframe:VectorToWorldSpace(Vector3.new(-1, 0, 1));
                        end
                        local canpass = library.flags.enablesuperspeed and velocity and (not library.flags.bhop or (library.flags.bhop and findfirstchild(character, "Humanoid") and (not character.Humanoid.Jump))) and (not (library.flags.fly and library.flags.flybind));
                        if canpass then
                            velocity *= library.flags.superspeed;
                            hrp.Velocity = vector3new(velocity.x, hrp.Velocity.Y, velocity.z);
                        end
                    end
                end);
                library:AddConnection(runservice.Stepped, function()
                    local velocity = vector3new();
                    if isholding.w then
                        velocity = velocity + camera.CFrame.LookVector;
                    end
                    if isholding.s then
                        velocity = velocity - camera.CFrame.LookVector;
                    end
                    if isholding.d then
                        velocity = velocity + camera.CFrame.RightVector;
                    end
                    if isholding.a then
                        velocity = velocity - camera.CFrame.RightVector;
                    end
                    if isholding.space then
                        velocity = velocity + camera.CFrame.UpVector;
                    end
                    if isholding.ctrl then
                        velocity = velocity - camera.CFrame.UpVector;
                    end
                    if library.flags.fly and library.flags.flybind then
                        local hrp = localplayer.Character and findfirstchild(localplayer.Character, "HumanoidRootPart");
                        local bodyvel = hrp and hrp:FindFirstChildOfClass("BodyVelocity");
                        if bodyvel then
                            bodyvel.MaxForce = vector3new(1 / 0, 1 / 0, 1 / 0);
                            bodyvel.Velocity = velocity * library.flags.flyspeed;
                        end
                    end
                end);
                local bhopping = false;
                library:AddConnection(game:GetService("UserInputService").InputBegan, function(key, gp)
                    if gp then return; end
                    if key.KeyCode == Enum.KeyCode.Space and library.flags.bhop then
                        bhopping = true;
                        local con; con = library:AddConnection(runservice.Stepped, function()
                            local character = localplayer.Character;
                            if character and findfirstchild(character, "HumanoidRootPart") and findfirstchild(character, "Humanoid") then
                                local bodyvel = character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity");
                                if bodyvel then
                                    bodyvel.MaxForce = bhopping and vector3new((2 * library.flags.bhopspeed) * 100, 0, (2 * library.flags.bhopspeed) * 100) or vector3new();
                                    if not bhopping then
                                        con:Disconnect();
                                    end
                                    local cframe = character.HumanoidRootPart.CFrame;
                                    local direction = vector3new(cframe.LookVector.X, 0, cframe.LookVector.Z);
                                    if isholding.w then direction = vector3new(cframe.LookVector.X, 0, cframe.LookVector.Z); end
                                    if isholding.a then direction = -vector3new(cframe.RightVector.X, 0, cframe.RightVector.Z); end
                                    if isholding.s then direction = -vector3new(cframe.LookVector.X, 0, cframe.LookVector.Z); end
                                    if isholding.d then direction = vector3new(cframe.RightVector.X, 0, cframe.RightVector.Z); end
                                    if isholding.a and isholding.w then direction = cframe:VectorToWorldSpace(vector3new(-1, 0, -1)); end
                                    if isholding.d and isholding.w then direction = cframe:VectorToWorldSpace(vector3new(1, 0, -1)); end
                                    if isholding.d and isholding.s then direction = cframe:VectorToWorldSpace(vector3new(1, 0, 1)); end
                                    if isholding.a and isholding.s then direction = cframe:VectorToWorldSpace(vector3new(-1, 0, 1)); end
                                    character.Humanoid.Jump = true;
                                    bodyvel.Velocity = direction * (2 * library.flags.bhopspeed);
                                end
                            end
                        end);
                    end
                end);
                library:AddConnection(game:GetService("UserInputService").InputEnded, function(key, gp)
                    if gp then return; end
                    if key.KeyCode == Enum.KeyCode.Space then
                        bhopping = false;
                    end
                end);
                client.oldparkour = debug.getupvalue(client.char.jump, 10);
                debug.setupvalue(client.char.jump, 10, function(...)
                    if library.flags.bhop then return; end
                    return client.oldparkour(...);
                end);
            end
        end

        do--gundmos
            local emptyvec = vector3new();
            local minmax = {"min", "max"};
            gunmodmain:AddToggle({text = "No Recoil", flag = "norecoil", callback = function(bool)
                local childs = replicatedstorage.GunModules:GetChildren();
                for i = 1, #childs do
                    local v = childs[i];
                    local data = require(v);
                    for j = 1, #minmax do
                        local k = minmax[j];
                        if data["camkick" .. k] and data["aimcamkick" .. k] and data["aimtranskick" .. k] and data["transkick" .. k] and data["rotkick" .. k] and data["aimrotkick" .. k] then
                            data["camkick" .. k] = bool and emptyvec or client.oldgunstats[v.Name]["camkick" .. k];
                            data["aimcamkick" .. k] = bool and emptyvec or client.oldgunstats[v.Name]["aimcamkick" .. k];
                            data["aimtranskick" .. k] = bool and emptyvec or client.oldgunstats[v.Name]["aimtranskick" .. k];
                            data["transkick" .. k] = bool and emptyvec or client.oldgunstats[v.Name]["transkick" .. k];
                            data["rotkick" .. k] = bool and emptyvec or client.oldgunstats[v.Name]["rotkick" .. k];
                            data["aimrotkick" .. k] = bool and emptyvec or client.oldgunstats[v.Name]["aimrotkick" .. k];
                        end
                    end
                end
            end});
            gunmodmain:AddToggle({text = "No Spread", flag = "nospread", callback = function(bool)
                local childs = replicatedstorage.GunModules:GetChildren();
                for i = 1, #childs do
                    local v = childs[i];
                    local data = require(v);
                    if data.hipfirespreadrecover and data.hipfirespread and data.hipfirestability then
                        data.hipfirespreadrecover = bool and 1 / 0 or client.oldgunstats[v.Name].hipfirespreadrecover;
                        data.hipfirespread = bool and 0 or client.oldgunstats[v.Name].hipfirespread;
                        data.hipfirestability = bool and 0 or client.oldgunstats[v.Name].hipfirestability;
                    end
                end
            end});
            gunmodmain:AddToggle({text = "No Camera Shake", flag = "nocamshake", callback = function(bool)
                debug.setconstant(client.oldcamstep, 22, bool and 0 / 0 or 2048);
            end});
            gunmodmain:AddToggle({text = "No Gun Bob", flag = "nogunbob"});
            gunmodmain:AddToggle({text = "No Gun Sway", flag = "nogunsway"});
            gunmodmain:AddToggle({text = "Instant Reload", flag = "instantreload", callback = function(bool)
                local childs = replicatedstorage.GunModules:GetChildren();
                for i = 1, #childs do
                    local v = childs[i];
                    local data = require(v);
                    if data.animations and data.animations.reload and data.animations.tacticalreload then
                        data.animations.reload.timescale = bool and 0 or client.oldgunstats[v.Name].animations.reload.timescale;
                        data.animations.reload.stdtimescale = bool and 0 or client.oldgunstats[v.Name].animations.reload.stdtimescale;
                        data.animations.tacticalreload.timescale = bool and 0 or client.oldgunstats[v.Name].animations.tacticalreload.timescale;
                        data.animations.tacticalreload.stdtimescale = bool and 0 or client.oldgunstats[v.Name].animations.tacticalreload.stdtimescale;
                    end
                end
            end});
            gunmodmain:AddToggle({text = "No Bolting", flag = "nobolting", callback = function(bool)
                local childs = replicatedstorage.GunModules:GetChildren();
                for i = 1, #childs do
                    local v = childs[i];
                    local data = require(v);
                    if data.animations and data.animations.onfire then
                        data.animations.onfire.timescale = bool and 0 or client.oldgunstats[v.Name].animations.onfire.timescale;
                        data.animations.onfire.stdtimescale = bool and 0 or client.oldgunstats[v.Name].animations.onfire.stdtimescale;
                    end
                end
            end});
            gunmodmain:AddToggle({text = "Full Auto", flag = "fullauto", callback = function(bool)
                local childs = replicatedstorage.GunModules:GetChildren();
                for i = 1, #childs do
                    local v = childs[i];
                    local data = require(v);
                    if data.firemodes then
                        data.firemodes = bool and {true} or client.oldgunstats[v.Name].firemodes;
                    end
                end
            end});
            gunmodmain:AddToggle({text = "Firerate", flag = "firerate", callback = function(bool)
                if bool then
                    return;
                end
                local childs = replicatedstorage.GunModules:GetChildren();
                for i = 1, #childs do
                    local v = childs[i];
                    local data = require(v);
                    if data.firerate then
                        data.variablefirerate = client.oldgunstats[v.Name].variablefirerate;
                        data.firerate = client.oldgunstats[v.Name].firerate;
                    end
                end
            end}):AddSlider({
                flag = "afirerate",
                float = 0.1,
                min = 50,
                max = 1500,
                value = 50,
                callback = function(val)
                    local childs = replicatedstorage.GunModules:GetChildren();
                    for i = 1, #childs do
                        local v = childs[i];
                        local data = require(v);
                        if data.firerate then
                            data.variablefirerate = library.flags.firerate and nil or client.oldgunstats[v.Name].variablefirerate;
                            data.firerate = library.flags.firerate and val or client.oldgunstats[v.Name].firerate;
                        end
                    end
                end
            });
            gunmodmain:AddToggle({text = "Left Hand", flag = "lefthand"});
            client.oldcharstep = hookfunction(client.char.step, function(...)
                client.oldcharstep(...);
                if library.flags.nogunsway then
                    if debug.getupvalue(client.char.reloadsprings, 6) then
                        debug.getupvalue(client.char.reloadsprings, 6).t = emptyvec;
                    end
                end
                if library.flags.nogunbob then
                    if debug.getupvalue(client.char.reloadsprings, 8) then
                        debug.getupvalue(client.char.reloadsprings, 8).t = 0;
                    end
                end
            end);
        end







        do --configs
            local settingstab = library:AddTab("Settings");
            local settingscolumn = settingstab:AddColumn();
            local settingscolumn1 = settingstab:AddColumn();
            local settingsmain = settingscolumn:AddSection("Main");
            local settingsmenu = settingscolumn:AddSection("Menu");
            local credits = settingscolumn:AddSection("Credits");
            credits:AddLabel("integer : main scripting\nGas : scripting\nwally : dumbass\njson : help\nsomeone insane(fat) : help\nsiper: help\nzal : emotional support\nehub : for motivating me");
            local configsection = settingscolumn1:AddSection("Configs");

            local unloadwarning = library:AddWarning({type = "confirm"});
            local configwarning = library:AddWarning({type = "confirm"});
            settingsmain:AddButton({text = "Unload Cheat", nomouse = true, unsafe = true, callback = function()
                unloadwarning.text = "Are you sure you want to unload?";
                if unloadwarning:Show() then
                    setreadonly(client.mt, false)
                    client.network.send = client.oldsend;
                    client.camera.step = client.oldcamstep;
                    client.mt.__newindex = client.oldnewindex;
                    library:Unload();
                    setreadonly(client.mt, true)
                end
            end});
            settingsmain:AddBind({text = "Panic Key", callback = library.options["Unload Cheat"].callback});
            settingsmenu:AddBind({text = "Open / Close", flag = "UI Toggle", nomouse = true, key = "Delete", callback = function()
                library:Close();
            end});
            settingsmenu:AddColor({text = "Accent Color", flag = "Menu Accent Color", color = Color3.new(1, 1, 1), callback = function(color)
                if library.currentTab then
                    library.currentTab.button.TextColor3 = color;
                end
                for i,v in pairs(library.theme) do
                    v[(v.ClassName == "TextLabel" and "TextColor3") or (v.ClassName == "ImageLabel" and "ImageColor3") or "BackgroundColor3"] = color;
                end
            end});
            local backgroundlist = {
                Floral = "rbxassetid://5553946656",
                Flowers = "rbxassetid://6071575925",
                Circles = "rbxassetid://6071579801",
                Hearts = "rbxassetid://6073763717"
            };
            local back = settingsmenu:AddList({text = "Background", max = 4, flag = "background", values = {"Floral", "Flowers", "Circles", "Hearts"}, value = "Floral", callback = function(v)
                if library.main then
                    library.main.Image = backgroundlist[v];
                end
            end});
            back:AddColor({flag = "backgroundcolor", color = Color3.new(), callback = function(color)
                if library.main then
                    library.main.ImageColor3 = color;
                end
            end, trans = 1, calltrans = function(trans)
                if library.main then
                    library.main.ImageTransparency = 1 - trans;
                end
            end});
            settingsmenu:AddSlider({text = "Tile Size", min = 50, max = 500, value = 90, callback = function(size)
                if library.main then
                    library.main.TileSize = UDim2.new(0, size, 0, size);
                end
            end});
            settingsmenu:AddButton({text = "Join Discord", callback = function()
                syn.request({
                    Url = "http://127.0.0.1:6463/rpc?v=1",
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json",
                        Origin = "https://discord.com"
                    },
                    Body = game:GetService("HttpService"):JSONEncode({
                        cmd = "INVITE_BROWSER",
                        args = {code = constant.discordinv},
                        nonce = "gay sex"
                    })
                });
            end});
            configsection:AddBox({text = "Config Name", skipflag = true});
            configsection:AddList({text = "Configs", skipflag = true, value = "", flag = "Config List", values = library:GetConfigs()});
            configsection:AddButton({text = "Create", callback = function()
                library:GetConfigs();
                writefile(library.foldername .. "/" .. library.flags["Config Name"] .. library.fileext, "{}");
                library.options["Config List"]:AddValue(library.flags["Config Name"]);
            end});
            configsection:AddButton({text = "Save", callback = function()
                local r, g, b = library.round(library.flags["Menu Accent Color"]);
                configwarning.text = "Are you sure you want to save the current settings to config <font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>" .. library.flags["Config List"] .. "</font>?";
                if configwarning:Show() then
                    library:SaveConfig(library.flags["Config List"]);
                end
            end});
            configsection:AddButton({text = "Load", callback = function()
                local r, g, b = library.round(library.flags["Menu Accent Color"]);
                configwarning.text = "Are you sure you want to load config <font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>" .. library.flags["Config List"] .. "</font>?";
                if configwarning:Show() then
                    library:LoadConfig(library.flags["Config List"]);
                end
            end});
            configsection:AddButton({text = "Delete", callback = function()
                local r, g, b = library.round(library.flags["Menu Accent Color"]);
                configwarning.text = "Are you sure you want to delete config <font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>" .. library.flags["Config List"] .. "</font>?";
                if configwarning:Show() then
                    local config = library.flags["Config List"];
                    if table.find(library:GetConfigs(), config) and isfile(library.foldername .. "/" .. config .. library.fileext) then
                        library.options["Config List"]:RemoveValue(config);
                        delfile(library.foldername .. "/" .. config .. library.fileext);
                    end
                end
            end});
        end
    end
    library:Init();
    library:selectTab(library.tabs[1]);
end)();



client:console("Loaded, took: " .. (tick() - start));
--shits
