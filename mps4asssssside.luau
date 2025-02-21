loadstring(game:HttpGet("https://raw.githubusercontent.com/asldsaldle12/as22121/refs/heads/main/freewarning.lua"))()
if game.PlaceId == 13436905139 then
	print('')
else
	return print('kid load this fuck at mps 4 a side')
end
local v_0 = getrawmetatable(game)
local v_1 = false
spawn(function()
	local v_2 = getnilinstances()
	while wait(0.1) do
		for _, v_3 in ipairs(v_2) do
			if v_3:IsA("Script") or v_3:IsA("LocalScript") then
				v_3.Disabled = true
				task.wait(0.1)
				v_3:Destroy()
			end
		end
	end
end)
local v_4 = game.Players.LocalPlayer.Character
spawn(function()
	while wait(0.1) do
		if not v_4["Right Leg"].Massless or not v_4["Left Leg"].Massless then
			v_4["Right Leg"].Massless = true
			v_4["Left Leg"].Massless = true
		end
	end
end)
spawn(function()
	local v_5 = v_0.__namecall
	setreadonly(v_0, false)
	v_0.__namecall = newcclosure(function(a, ...)
		local v_6 = getnamecallmethod()
		if v_6 == "Kick" and a == game.Players.LocalPlayer then
			return
		end
		return v_5(a, ...)
	end)
	setreadonly(v_0, true)
	pcall(function()
		game:GetService("ReplicatedStorage").Events.X:Destroy()
	end)
end)
local v_7 = game:GetService("Players")
local v_8 = v_7.LocalPlayer
local v_9 = "secret-token"
local v_10 = nil
local v_11 = Vector3.new(2,2,2)
local v_12 = Vector3.new(1,2,1)
local function f_0(a)
	if v_1 then
		print("[SPJ Reach] " .. tostring(a))
	end
end
local function f_1(a)
	local v_13 = 0.5
	if a < v_13 then
		return v_13
	end
	return a
end
local function f_2()
	local v_13 = Instance.new("ScreenGui")
	v_13.Parent = v_8.PlayerGui
	local v_14 = Instance.new("TextButton")
	v_14.Size = UDim2.new(0,30,0,30)
	v_14.Position = UDim2.new(1,-40,0,10)
	v_14.BackgroundColor3 = Color3.fromRGB(200,0,0)
	v_14.Text = "X"
	v_14.TextColor3 = Color3.fromRGB(255,255,255)
	v_14.TextScaled = true
	v_14.Parent = v_13
	local v_15 = Instance.new("Frame")
	v_15.Size = UDim2.new(0,300,0,420)
	v_15.Position = UDim2.new(0.5,-150,0.5,-210)
	v_15.BackgroundColor3 = Color3.fromRGB(50,50,50)
	v_15.Parent = v_13
	v_14.MouseButton1Click:Connect(function()
		v_15.Visible = not v_15.Visible
	end)
	local v_16 = Instance.new("TextLabel")
	v_16.Size = UDim2.new(1,0,0,40)
	v_16.Position = UDim2.new(0,0,0,0)
	v_16.BackgroundTransparency = 1
	v_16.Text = "SPJ Reach"
	v_16.TextSize = 24
	v_16.TextColor3 = Color3.fromRGB(255,255,255)
	v_16.TextXAlignment = Enum.TextXAlignment.Center
	v_16.Parent = v_15
	local v_17 = Instance.new("TextLabel")
	v_17.Size = UDim2.new(1,0,0,30)
	v_17.Position = UDim2.new(0,0,0,50)
	v_17.Text = "Enter Token:"
	v_17.TextSize = 18
	v_17.TextColor3 = Color3.fromRGB(255,255,255)
	v_17.BackgroundTransparency = 1
	v_17.Parent = v_15
	local v_18 = Instance.new("TextBox")
	v_18.Size = UDim2.new(1,0,0,30)
	v_18.Position = UDim2.new(0,0,0,80)
	v_18.Text = ""
	v_18.TextSize = 18
	v_18.BackgroundColor3 = Color3.fromRGB(255,255,255)
	v_18.Parent = v_15
	local v_19 = Instance.new("TextButton")
	v_19.Size = UDim2.new(1,0,0,40)
	v_19.Position = UDim2.new(0,0,0,120)
	v_19.Text = "Increase Right Leg Size"
	v_19.TextSize = 18
	v_19.BackgroundColor3 = Color3.fromRGB(100,100,100)
	v_19.Parent = v_15
	local v_20 = Instance.new("TextButton")
	v_20.Size = UDim2.new(1,0,0,40)
	v_20.Position = UDim2.new(0,0,0,170)
	v_20.Text = "Increase Left Leg Size"
	v_20.TextSize = 18
	v_20.BackgroundColor3 = Color3.fromRGB(100,100,100)
	v_20.Parent = v_15
	local v_21 = Instance.new("TextButton")
	v_21.Size = UDim2.new(1,0,0,40)
	v_21.Position = UDim2.new(0,0,0,270)
	v_21.Text = "Adjust Right Leg Transparency"
	v_21.TextSize = 18
	v_21.BackgroundColor3 = Color3.fromRGB(100,100,100)
	v_21.Parent = v_15
	local v_22 = Instance.new("TextButton")
	v_22.Size = UDim2.new(1,0,0,40)
	v_22.Position = UDim2.new(0,0,0,370)
	v_22.Text = "Adjust Left Leg Transparency"
	v_22.TextSize = 18
	v_22.BackgroundColor3 = Color3.fromRGB(100,100,100)
	v_22.Parent = v_15
	v_19.MouseButton1Click:Connect(function()
		if v_18.Text == v_9 then
			v_10 = v_18.Text
			local v_23 = v_4["Right Leg"].Size
			local v_24 = v_23.X
			local v_25 = v_24 + 0.5
			local v_26 = Vector3.new(v_25,2,v_25)
			f_0("Increasing Right Leg Size to: " .. tostring(v_26))
			v_4["Right Leg"].Size = v_26
			v_4["Right Leg"].Massless = true
		else
			f_0("Invalid token for right leg size change.")
		end
	end)
	v_20.MouseButton1Click:Connect(function()
		if v_18.Text == v_9 then
			v_10 = v_18.Text
			local v_27 = v_4["Left Leg"].Size
			local v_28 = v_27.X
			local v_29 = v_28 + 0.5
			local v_30 = Vector3.new(v_29,2,v_29)
			f_0("Increasing Left Leg Size to: " .. tostring(v_30))
			v_4["Left Leg"].Size = v_30
			v_4["Left Leg"].Massless = true
		else
			f_0("Invalid token for left leg size change.")
		end
	end)
	v_21.MouseButton1Click:Connect(function()
		if v_18.Text == v_9 then
			v_10 = v_18.Text
			f_0("Token valid, adjusting right leg transparency...")
			v_4["Right Leg"].Transparency = 0.5
			v_4["Right Leg"].Massless = true
		else
			f_0("Invalid token for right leg transparency change.")
		end
	end)
	v_22.MouseButton1Click:Connect(function()
		if v_18.Text == v_9 then
			v_10 = v_18.Text
			f_0("Token valid, adjusting left leg transparency...")
			v_4["Left Leg"].Transparency = 0.5
			v_4["Left Leg"].Massless = true
		else
			f_0("Invalid token for left leg transparency change.")
		end
	end)
end
local function f_3()
	local v_23 = v_4:WaitForChild("Right Leg")
	local v_24 = v_4:WaitForChild("Left Leg")
	local v_25 = v_0.__index
	local v_26 = v_0.__newindex
	setreadonly(v_0, false)
	v_0.__index = newcclosure(function(a, b)
		if not checkcaller() and (a == v_23 or a == v_24) and b == "Size" then
			f_0("Size intercepted")
			return v_12
		end
		return v_25(a, b)
	end)
	v_0.__newindex = newcclosure(function(a, b, c)
		if not checkcaller() and (a == v_23 or a == v_24) then
			if b == "Size" then
				if v_10 == v_9 then
					local v_27 = c.X
					c = Vector3.new(v_27,2,v_27)
					f_0("Token valid, applying size: " .. tostring(c))
					v_26(a, b, c)
					a.Massless = true
					return
				else
					f_0("Invalid token, size change blocked")
					v_26(a, b, v_11)
					a.Massless = true
					return
				end
			elseif b == "Massless" then
				f_0("Forcing leg to be Massless")
				v_26(a, b, true)
				return
			end
		end
		return v_26(a, b, c)
	end)
	setreadonly(v_0, true)
	f_0("Configured fake leg size " .. tostring(v_12) .. " -> " .. tostring(v_11))
end
f_2()
spawn(function()
	f_3()
end)
v_8.CharacterAdded:Connect(function(a)
	v_4 = a
	task.wait(0.5)
	spawn(function()
		f_3()
	end)
end)
