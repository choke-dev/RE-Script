for i,v in next, getgc() do
if type(v) == "function" and debug.getinfo(v).name == "firebullet" then
local a = getfenv(v);
while wait() do
a.ammocount = math.huge
a.currentspread = 0
debug.setconstant(v, 42, 9999)
a.Spread = 0
a.recoil = 0
a.mode = "automatic"
a.DISABLED = false
a.RecoilControl = 0
a.Food = math.huge
a.primarystored = math.huge
a.secondarystored = math.huge
a.spreadmodifier = 0
a.metal = 200
a.maxmetal = 200
a.cooldowntimer = 0
a.baseballs = math.huge
end
end
end
