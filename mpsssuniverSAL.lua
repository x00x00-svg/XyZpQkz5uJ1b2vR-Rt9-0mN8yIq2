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
	f = d:AddTab({ Title = "Main", Icon = "folder" }),
	theme = d:AddTab({ Title = "Theme", Icon = "palette" }),
	ot = d:AddTab({ Title = "fun", Icon = "aperture" }),
	h = d:AddTab({ Title = "Bypass", Icon = "hammer" }),
	g = d:AddTab({ Title = "Settings", Icon = "settings" }),
	ff = d:AddTab({ Title = "firetouchinterest", Icon = "flame" }),
}

b:SetLibrary(a)
c:SetLibrary(a)
b:IgnoreThemeSettings()
b:SetIgnoreIndexes({})
c:SetFolder("SPJREACH")
b:SetFolder("SPJREACH/config")
c:BuildInterfaceSection(e.theme)
b:BuildConfigSection(e.g)
d:SelectTab(1)
a:Notify({ Title = "SPJ Reach", Content = "The script has been loaded.", Duration = 8 })
b:LoadAutoloadConfig()

local player = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local reach = 50 
local reachEnabled = true
local touchint = {}
local balls = {}
local lastRefreshTime = os.time()
local reachCircle = nil
local colorreach = Color3.fromRGB(96, 205, 255)
local toggleautoballs = false
local function getballs()
	if not toggleautoballs then return end
	local char = player.Character or player.CharacterAdded:Wait()
    local parts = {}
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") and not part.Anchored and not part:IsDescendantOf(char) then
            table.insert(parts, part)
        end
    end
    return parts
end
local function refreshBalls(force)
    if not force and lastRefreshTime + 1.5 > os.time() then return end
    table.clear(touchint)
    local character = player.Character
    if character then
        for _, v in pairs(character:GetDescendants()) do
            if v.Name == "TouchInterest" and v.Parent:IsA("BasePart") then
                table.insert(touchint, v)
            end
        end
    end
    lastRefreshTime = os.time()
    table.clear(balls)
        for _, v in pairs(Workspace:GetDescendants()) do
            local firstLetter = string.sub(v.Name, 1, 1)
			if v.Name == 'TPS' or
			v.Name == "AIFA" or v.Name == "MRS" or v.Name == 'CSF' or v.Name == "PRS" or v.Name == "MPS" or v.Name == "VFA" or
               v.Name == "fakeBallExploiter" or v.Name == "MPS" or v.Name == "VFA" or firstLetter == "{" then
                task.wait()
                table.insert(balls, v)
            end
        end
	    if toggleautoballs then
			local autoBalls = getballs()
			if autoBalls then
				for _, ball in pairs(autoBalls) do
					table.insert(balls, ball)
				end
			end
		end
    end

local function moveReachCircle(targetPosition)
    if not reachEnabled or not reachCircle then return end
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    local tweenGoal = {Position = targetPosition}
    local tween = TweenService:Create(reachCircle, tweenInfo, tweenGoal)
    tween:Play()
end

local function createReachCircle()
    if not reachCircle then
        reachCircle = Instance.new("Part")
        reachCircle.Name = "ReachCircle"
        reachCircle.Parent = Workspace
        reachCircle.Shape = Enum.PartType.Ball
        reachCircle.Size = Vector3.new(reach * 2, reach * 2, reach * 2)
        reachCircle.Anchored = true
        reachCircle.CanCollide = false
        reachCircle.Transparency = 0.7
        reachCircle.Material = Enum.Material.ForceField
        reachCircle.Color = colorreach

        RunService.RenderStepped:Connect(function()
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                moveReachCircle(character.HumanoidRootPart.Position)
            end
        end)
    else
        reachCircle.Size = Vector3.new(reach * 2, reach * 2, reach * 2)
    end
end

createReachCircle()


local reachSlider = e.ff:AddSlider("ReachSlider", {
    Title = "Adjust Reach",
    Description = "Set the reach distance (current: " .. reach .. ")",
    Default = reach,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Callback = function(Value)
         reach = Value
         createReachCircle()
    end
})


local reachColorPicker = e.ff:AddColorpicker("ReachColor", {
    Title = "Reach Circle Color",
    Default = colorreach
})
reachColorPicker:OnChanged(function()
    colorreach = reachColorPicker.Value
    if reachCircle then
        reachCircle.Color = colorreach
    end
end)
local autoballtoggle = e.ff:AddToggle("Auto Balls", {
	Title = "Auto Balls",
	Description = "Automatically detect balls",
	Default = toggleautoballs
})
autoballtoggle:OnChanged(function(Value)
	toggleautoballs = Value
end)




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
local z4 = e.h:AddButton({
	Title = "Bypass TPS street soccer anti-cheat",
	Callback = function()
        while true do
            for _, s in pairs(game:GetDescendants()) do
                if s:IsA("Script") or s:IsA("LocalScript") then
                    if tonumber(s.Name) and tonumber(s.Name) > 0 and tonumber(s.Name) <= 1000 then
                        s:Destroy()
                        print(tonumber(s.Name))
                        break
                    end
                end
            end
            wait(1)
        end
        game:GetService("StarterPlayer").StarterCharacterScripts[" "]:Destroy()
        a:Notify({ Title = "SPJ Reach", Content = "Bypassed TPS street soccer anti-cheat.", Duration = 8 })
    end
})
local range = 20
local force = 5000

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
local sliderforconfigforce = e.ot:AddSlider("Force", {
	Title = "Force",
	Description = "Set the force of the super shoot",
	Default = force,
	Min = 0,
	Max = 10000,
	Rounding = 1,
	Callback = function(Value)
		force = Value
	end
})
local sliderforconfigrange = e.ot:AddSlider("Range", {
	Title = "Range",
	Description = "Set the range of the super shoot",
	Default = range,
	Min = 0,
	Max = 100,
	Rounding = 1,
	Callback = function(Value)
		range = Value
	end
})
e.ot:AddButton({
    Title = "Super Shoot",
    Description = "",
    Callback = function()

        local char = player.Character or player.CharacterAdded:Wait()
        local rootPart = char:WaitForChild("HumanoidRootPart")

        local function getNearbyUnanchoredParts()
            local parts = {}
            for _, part in pairs(workspace:GetDescendants()) do
                if part:IsA("BasePart") and not part.Anchored and not part:IsDescendantOf(char) then
                    local dist = (part.Position - rootPart.Position).magnitude
                    if dist <= range then
                        table.insert(parts, part)
                    end
                end
            end
            return parts
        end

        local unanchoredParts = getNearbyUnanchoredParts()
        for _, part in pairs(unanchoredParts) do
            local direction = (part.Position - rootPart.Position)
            direction = Vector3.new(direction.X, 0, direction.Z).unit

            part:ApplyImpulse(direction * force)
        end
    end
})
local function ballhigh(part)
	return part:ApplyImpulse(Vector3.new(0, 5000, 0))
end
e.ot:AddButton({
	Title = "Ball High",
	Description = "make the ball go very high (make sure u have ball ownership)",
	Callback = function()
		local char = player.Character or player.CharacterAdded:Wait()
        local rootPart = char:WaitForChild("HumanoidRootPart")
        local function getNearbyUnanchoredParts()
            local parts = {}
            for _, part in pairs(workspace:GetDescendants()) do
                if part:IsA("BasePart") and not part.Anchored and not part:IsDescendantOf(char) then
                    local dist = (part.Position - rootPart.Position).magnitude
                    if dist <= range then
                        table.insert(parts, part)
                    end
                end
            end
            return parts
        end
		for _, part in pairs(getNearbyUnanchoredParts()) do
			ballhigh(part)
		end
	end
})
c4()

UserInputService.InputBegan:Connect(function(i, gameProcessedEvent)
    refreshBalls(false)
    for i,e in pairs(balls) do
if (e.Position - player.Character["Right Leg"].Position).magnitude <= reach then
        task.wait()
        for i,v in pairs(touchint) do
	if v.Parent == player.Character["Head"] then
		continue
	end
        task.spawn(function()
        firetouchinterest(e,v.Parent,0)
        firetouchinterest(e,v.Parent,1)
        end)
        end
end
end
end)
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
