local a = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local b = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local c = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local d = a:CreateWindow({
	Title = "SPJ Reach",
	SubTitle = "",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Acrylic = true,
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.LeftControl
})
local e = {
	f = d:AddTab({ Title = "Main", Icon = "" }),
	g = d:AddTab({ Title = "Settings", Icon = "settings" }),
	h = d:AddTab({ Title = "Bypass", Icon = "settings" })
}

b:SetLibrary(a)
c:SetLibrary(a)
b:IgnoreThemeSettings()
b:SetIgnoreIndexes({})
c:SetFolder("SPJREACH")
b:SetFolder("SPJREACH/config")
c:BuildInterfaceSection(e.g)
b:BuildConfigSection(e.g)
d:SelectTab(1)
a:Notify({ Title = "SPJ Reach", Content = "The script has been loaded.", Duration = 8 })
b:LoadAutoloadConfig()

loadstring(game:HttpGet("https://raw.githubusercontent.com/x00x00-svg/XyZpQkz5uJ1b2vR-Rt9-0mN8yIq2/refs/heads/main/freewarning.luau"))()

local mt = getrawmetatable(game)
local f1 = false
local g1 = game:GetService("Players")
local h1 = g1.LocalPlayer
local i1 = h1.Character or h1.CharacterAdded:Wait()

local function j1(k1)
	local l1 = false
	local m1, n1, o1, p1, q1
	if k1:FindFirstChild("UpperTorso") then
		l1 = true
		m1 = k1:WaitForChild("UpperTorso")
		n1 = k1:WaitForChild("RightUpperArm")
		o1 = k1:WaitForChild("LeftUpperArm")
		p1 = k1:WaitForChild("RightUpperLeg")
		q1 = k1:WaitForChild("LeftUpperLeg")
	else
		m1 = k1:WaitForChild("Torso")
		n1 = k1:WaitForChild("Right Arm")
		o1 = k1:WaitForChild("Left Arm")
		p1 = k1:WaitForChild("Right Leg")
		q1 = k1:WaitForChild("Left Leg")
	end
	return l1, m1, n1, o1, p1, q1
end

local r1, s1, t1, u1, v1, w1 = j1(i1)

local x1 = 2
local y1 = 2
local z1 = 2
local a2 = 1

local b2 = Vector3.new(1, 2, 1)
local c2 = Vector3.new(2, 2, 1)
local d2 = Vector3.new(1, 2, 1)
local e2 = v1.Size
local f2 = s1.Size
local g2 = t1.Size

local function h2(i2)
	if f1 then print("[SPJ Reach] " .. tostring(i2)) end
end

local j2 = "secret-token"
local k2
local l2 = e.f:AddDropdown("Token", {
	Title = "Token",
	Values = { j2 },
	Multi = false,
	Default = j2,
})
l2:OnChanged(function(i3) k2 = i3 end)
l2:SetValue(j2)
k2 = j2

local m2 = e.f:AddSlider("RightLegSlider", {
	Title = "Right Leg Size",
	Default = x1,
	Min = 1,
	Max = 30,
	Rounding = 1,
	Callback = function(i3)
		x1 = i3
		if k2 == j2 then
			h2("Valid token, setting RL: Vector3.new(" .. x1 .. ", 2, " .. x1 .. ")")
			if v1 then v1.Size = Vector3.new(x1, 2, x1) end
		else
			h2("Invalid token for RL change.")
		end
	end
})
m2:OnChanged(function(i3) x1 = i3 end)
m2:SetValue(x1)

local n2 = e.f:AddSlider("LeftLegSlider", {
	Title = "Left Leg Size",
	Default = y1,
	Min = 1,
	Max = 30,
	Rounding = 1,
	Callback = function(i3)
		y1 = i3
		if k2 == j2 then
			h2("Valid token, setting LL: Vector3.new(" .. y1 .. ", 2, " .. y1 .. ")")
			if w1 then w1.Size = Vector3.new(y1, 2, y1) end
		else
			h2("Invalid token for LL change.")
		end
	end
})
n2:OnChanged(function(i3) y1 = i3 end)
n2:SetValue(y1)

local o2 = e.f:AddSlider("Torso1", {
	Title = "Chest Size",
	Default = z1,
	Min = 1,
	Max = 30,
	Rounding = 1,
	Callback = function(i3)
		z1 = i3
		if k2 == j2 then
			h2("Valid token, setting Torso: Vector3.new(" .. z1 .. ", " .. z1 .. ", 1)")
			if s1 then s1.Size = Vector3.new(z1, z1, 1) end
		else
			h2("Invalid token for torso change.")
		end
	end
})
o2:OnChanged(function(i3) z1 = i3 end)
o2:SetValue(z1)

local p2 = e.f:AddSlider("LeftArm", {
	Title = "Left Arm Size",
	Default = a2,
	Min = 1,
	Max = 30,
	Rounding = 1,
	Callback = function(i3)
		a2 = i3
		if k2 == j2 then
			h2("Valid token, setting LA: Vector3.new(" .. a2 .. ", 2, " .. a2 .. ")")
			if u1 then u1.Size = Vector3.new(a2, 2, a2) end
		else
			h2("Invalid token for LA change.")
		end
	end
})
p2:OnChanged(function(i3) a2 = i3 end)
p2:SetValue(a2)

local q2 = e.f:AddSlider("RightArm", {
	Title = "Right Arm Size",
	Default = a2,
	Min = 1,
	Max = 30,
	Rounding = 1,
	Callback = function(i3)
		a2 = i3
		if k2 == j2 then
			h2("Valid token, setting RA: Vector3.new(" .. a2 .. ", 2, " .. a2 .. ")")
			if t1 then t1.Size = Vector3.new(a2, 2, a2) end
		else
			h2("Invalid token for RA change.")
		end
	end
})
q2:OnChanged(function(i3) a2 = i3 end)
q2:SetValue(a2)

local r2 = e.f:AddSlider("TransparencySliderR", {
	Title = "RL Transparency",
	Default = 0,
	Min = 0,
	Max = 1,
	Rounding = 0.1,
	Callback = function(i3)
		if k2 == j2 then
			h2("Valid token, adjusting RL transparency...")
			if v1 then v1.Transparency = i3 end
		else
			h2("Invalid token for RL transparency.")
		end
	end
})

local s2 = e.f:AddSlider("TransparencySliderL", {
	Title = "LL Transparency",
	Default = 0,
	Min = 0,
	Max = 1,
	Rounding = 0.1,
	Callback = function(i3)
		if k2 == j2 then
			h2("Valid token, adjusting LL transparency...")
			if w1 then w1.Transparency = i3 end
		else
			h2("Invalid token for LL transparency.")
		end
	end
})

local t2 = e.f:AddSlider("TransparencySliderT", {
	Title = "Torso Transparency",
	Default = 0,
	Min = 0,
	Max = 1,
	Rounding = 0.1,
	Callback = function(i3)
		if k2 == j2 then
			h2("Valid token, adjusting torso transparency...")
			if s1 then s1.Transparency = i3 end
		else
			h2("Invalid token for torso transparency.")
		end
	end
})

local u2 = e.f:AddSlider("TransparencySliderA", {
	Title = "Right Arm Transparency",
	Default = 0,
	Min = 0,
	Max = 1,
	Rounding = 0.1,
	Callback = function(i3)
		if k2 == j2 then
			h2("Valid token, adjusting RA transparency...")
			if t1 then t1.Transparency = i3 end
		else
			h2("Invalid token for RA transparency.")
		end
	end
})

local v2 = e.f:AddSlider("TransparencySliderA2", {
	Title = "Left Arm Transparency",
	Default = 0,
	Min = 0,
	Max = 1,
	Rounding = 0.1,
	Callback = function(i3)
		if k2 == j2 then
			h2("Valid token, adjusting LA transparency...")
			if u1 then u1.Transparency = i3 end
		else
			h2("Invalid token for LA transparency.")
		end
	end
})

local w2 = e.f:AddButton({
	Title = "Massless all",
	Callback = function()
		if v1 then v1.Massless = true end
		if w1 then w1.Massless = true end
		if t1 then t1.Massless = true end
		if u1 then u1.Massless = true end
		if s1 then s1.Massless = true end
	end
})

local x2 = e.h:AddButton({
	Title = "Anti Kick",
	Callback = function()
		spawn(function()
			local y2 = getrawmetatable(game)
			local z2 = y2.__namecall
			setreadonly(y2, false)
			y2.__namecall = newcclosure(function(a3, b3, ...)
				local c3 = getnamecallmethod()
				if c3 == "Kick" and a3 == game.Players.LocalPlayer then
					return
				end
				return z2(a3, b3, ...)
			end)
			setreadonly(y2, true)
			pcall(function()
				game:GetService("ReplicatedStorage").Events.X:Destroy()
			end)
		end)
		a:Notify({ Title = "SPJ Reach", Content = "Anti-Kick enabled.", Duration = 8 })
	end
})

local z3 = e.h:AddButton({
	Title = "Delete nil scripts",
	Callback = function()
		spawn(function()
			local a4 = getnilinstances()
			while wait(0.1) do
				for _, b4 in ipairs(a4) do
					if b4:IsA("Script") or b4:IsA("LocalScript") then
						b4.Disabled = true
						task.wait(0.1)
						b4:Destroy()
					end
				end
			end
		end)
	end
})

local function c4()
	local d4 = mt.__index
	local e4 = mt.__newindex
	setreadonly(mt, false)
	mt.__index = newcclosure(function(f4, g4)
		if not checkcaller() and ((f4 == v1 or f4 == w1) and g4 == "Size") then
			h2("Leg size intercepted (index)")
			return b2
		elseif not checkcaller() and (f4 == s1 and g4 == "Size") then
			h2("Torso size intercepted (index)")
			return c2
		elseif not checkcaller() and ((f4 == t1 or f4 == u1) and g4 == "Size") then
			h2("Arm size intercepted (index)")
			return d2
		end
		return d4(f4, g4)
	end)
	mt.__newindex = newcclosure(function(f4, g4, h4)
		if not checkcaller() and ((f4 == v1 or f4 == w1) and g4 == "Size") then
			if k2 == j2 then
				h2("Valid token, applying leg size: " .. tostring(h4))
				return e4(f4, g4, h4)
			else
				h2("Invalid token, leg size change blocked")
				return e4(f4, g4, e2)
			end
		elseif not checkcaller() and (f4 == s1 and g4 == "Size") then
			if k2 == j2 then
				h2("Valid token, applying torso size: " .. tostring(h4))
				return e4(f4, g4, h4)
			else
				h2("Invalid token, torso size change blocked")
				return e4(f4, g4, f2)
			end
		elseif not checkcaller() and ((f4 == t1 or f4 == u1) and g4 == "Size") then
			if k2 == j2 then
				h2("Valid token, applying arm size: " .. tostring(h4))
				return e4(f4, g4, h4)
			else
				h2("Invalid token, arm size change blocked")
				return e4(f4, g4, g2)
			end
		end
		return e4(f4, g4, h4)
	end)
	setreadonly(mt, true)
end

c4()

g1.LocalPlayer.CharacterAdded:Connect(function(i4)
	i1 = i4
	task.wait(0.5)
	local r2, s2, t2, u2, v2, w2 = j1(i4)
	s1 = s2
	t1 = t2
	u1 = u2
	v1 = v2
	w1 = w2
	e2 = v1.Size
	f2 = s1.Size
	g2 = t1.Size
	x1 = 2
	y1 = 2
	z1 = 2
	a2 = 1
	c4()
end)
