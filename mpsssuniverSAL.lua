local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local W = Fluent:CreateWindow({
	Title = "SPJ Reach",
	SubTitle = "by alr_dev",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Acrylic = true,
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.LeftControl
})
local Tabs = {
	Main = W:AddTab({ Title = "Main", Icon = "" }),
	Settings = W:AddTab({ Title = "Settings", Icon = "settings" })
}

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("SPJREACH")
SaveManager:SetFolder("SPJREACH/config")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
W:SelectTab(1)
Fluent:Notify({ Title = "SPJ Reach", Content = "The script has been loaded.", Duration = 8 })
SaveManager:LoadAutoloadConfig()

loadstring(game:HttpGet("https://raw.githubusercontent.com/x00x00-svg/XyZpQkz5uJ1b2vR-Rt9-0mN8yIq2/refs/heads/main/freewarning.luau"))()

local m = getrawmetatable(game)
local f = false
local p = game:GetService("Players")
local lp = p.LocalPlayer
local ch = lp.Character
local t = "secret-token"
local tok
local rLeg = 2
local lLeg = 2
local realSize = Vector3.new(2, 2, 2)
local fakeSize = Vector3.new(1, 2, 1)
local function d(msg) if f then print("[SPJ Reach] " .. tostring(msg)) end end

local tokenDD = Tabs.Main:AddDropdown("Token", {
	Title = "Token",
	Values = { t },
	Multi = false,
	Default = t,
})
tokenDD:OnChanged(function(val) tok = val end)
tokenDD:SetValue(t)
tok = t

local rSlider = Tabs.Main:AddSlider("RightLegSlider", {
	Title = "Right Leg Size",
	Default = rLeg,
	Min = 1,
	Max = 30,
	Rounding = 1,
	Callback = function(val)
		rLeg = val
		if tok == t then
			d("Token valid, setting Right Leg size to: Vector3.new(" .. rLeg .. ", 2, " .. rLeg .. ")")
			if ch:FindFirstChild("Right Leg") then
				ch["Right Leg"].Size = Vector3.new(rLeg, 2, rLeg)
			end
		else
			d("Invalid token for right leg size change.")
		end
	end
})
rSlider:OnChanged(function(val) rLeg = val end)
rSlider:SetValue(rLeg)

local lSlider = Tabs.Main:AddSlider("LeftLegSlider", {
    Title = "Left Leg Size",
    Default = lLeg,
    Min = 1,
    Max = 30,
    Rounding = 1,
    Callback = function(val)
        lLeg = val
        if tok == t then
            d("Token valid, setting Left Leg size to: Vector3.new(" .. lLeg .. ", 2, " .. lLeg .. ")")
            if ch:FindFirstChild("Left Leg") then
                ch["Left Leg"].Size = Vector3.new(lLeg, 2, lLeg)
            end
        else
            d("Invalid token for left leg size change.")
        end
    end
})
lSlider:OnChanged(function(val) lLeg = val end)
lSlider:SetValue(lLeg)
local rTransB = Tabs.Main:AddSlider("TransparencySliderR", {
    Title = "R Leg Transparency",
    Default = lLeg,
    Min = 0,
    Max = 1,
    Rounding = 0.1,
    Callback = function(val)
		if tok == t then
			d("Token valid, adjusting left leg transparency...")
			if ch:FindFirstChild("Left Leg") then
				ch["Right Leg"].Transparency = val
			end
		else
			d("Invalid token for left leg transparency change.")
		end
	end
})
           

local lTransB = Tabs.Main:AddSlider("TransparencySliderL", {
    Title = "L Leg Transparency",
    Default = rLeg,
    Min = 0,
    Max = 1,
    Rounding = 0.1,
    Callback = function(val)
		if tok == t then
			d("Token valid, adjusting left leg transparency...")
			if ch:FindFirstChild("Left Leg") then
				ch["Left Leg"].Transparency = val
			end
		else
			d("Invalid token for left leg transparency change.")
		end
	end
})
local masslessr = Tabs.Main:AddButton({
	Title = "Massless two legs",
	Callback = function()
            ch["Right Leg"].Massless = true
            ch["Left Leg"].Massless = true
	end
})
local antikick = Tabs.Main:AddButton({
	Title = "Anti Kick (just blocks localscripts and modulescripts from kicking you)",
	Callback = function()
        spawn(function()
            local mt = getrawmetatable(game)
            local oldNamecall = mt.__namecall
            setreadonly(mt, false)
            
            mt.__namecall = newcclosure(function(self, ...)
                local method = getnamecallmethod()
                if method == "Kick" and self == game.Players.LocalPlayer then
                    return
                end
                return oldNamecall(self, ...)
            end)
            setreadonly(mt, true)
            pcall(function()
                game:GetService("ReplicatedStorage").Events.X:Destroy()
            end)
        end)
        Fluent:Notify({ Title = "SPJ Reach", Content = "Anti-Kick enabled.", Duration = 8 })
	end
})
local function spoof()
	local rL = ch:WaitForChild("Right Leg")
	local lL = ch:WaitForChild("Left Leg")
	local oldIndex = m.__index
	local oldNewIndex = m.__newindex
	setreadonly(m, false)
	m.__index = newcclosure(function(a, b)
		if not checkcaller() and (a == rL or a == lL) and b == "Size" then
			d("Size intercepted (index)")
			return fakeSize
		end
		return oldIndex(a, b)
	end)
	m.__newindex = newcclosure(function(a, b, c)
		if not checkcaller() and (a == rL or a == lL) and b == "Size" then
			if tok == t then
				d("Token valid, applying size: " .. tostring(c))
				return oldNewIndex(a, b, c)
			else
				d("Invalid token, size change blocked")
				return oldNewIndex(a, b, realSize)
			end
		end
		return oldNewIndex(a, b, c)
	end)
	setreadonly(m, true)
	d("Configured spoofing for leg size. Fake size: " .. tostring(fakeSize) .. ", Real size: " .. tostring(realSize))
end

spoof()
p.LocalPlayer.CharacterAdded:Connect(function(newCh)
	ch = newCh
	task.wait(0.5)
	rLeg = 2
	lLeg = 2
	spoof()
end)
