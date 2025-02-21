loadstring(game:HttpGet("https://raw.githubusercontent.com/asldsaldle12/as22121/refs/heads/main/freewarning.lua"))()
spawn(function()
    local v_0 = getnilinstances()
    while wait(0.1) do
        for _, v_1 in ipairs(v_0) do
            if v_1:IsA("Script") or v_1:IsA("LocalScript") then
                v_1.Disabled = true
                task.wait(0.1)
                v_1:Destroy()
            end
        end
    end
end)
spawn(function()
    local v_2 = getrawmetatable(game)
    local v_3 = v_2.__namecall
    local v_4
    setreadonly(v_2, false)
    v_2.__namecall = newcclosure(function(self, ...)
        local v_5 = getnamecallmethod()
        if v_5 == "Kick" and self == game.Players.LocalPlayer then
            return
        end
        return v_3(self, ...)
    end)
    setreadonly(v_2, true)
end)
game:GetService("ReplicatedStorage").Events.X:Destroy()
local v_7 = getrawmetatable(game)
local v_8 = false
local v_9 = game:GetService("Players")
local v_10 = v_9.LocalPlayer
local v_11 = v_10.Character or v_10.CharacterAdded:Wait()
spawn(function()
    while wait(0.1) do
        if not v_11["Right Leg"].Massless or not v_11["Left Leg"].Massless then
            v_11["Right Leg"].Massless = true
            v_11["Left Leg"].Massless = true
        end
    end
end)
local v_12 = "secret-token"
local v_13 = nil
local v_14 = 2
local v_15 = 2
local v_16 = Vector3.new(2, 2, 2)
local v_17 = Vector3.new(1, 2, 1)
local function v_18(v_19)
    if v_8 then
        print("[SPJ Reach] " .. tostring(v_19))
    end
end
local function v_20()
    local v_21 = Instance.new("ScreenGui")
    v_21.Parent = game:GetService("CoreGui")
    local v_22 = Instance.new("Frame")
    v_22.Name = "MainUI"
    v_22.Size = UDim2.new(0, 300, 0, 400)
    v_22.Position = UDim2.new(0.5, -150, 0.5, -200)
    v_22.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    v_22.Active = true
    v_22.Draggable = true
    v_22.Parent = v_21
    local v_23 = Instance.new("TextLabel")
    v_23.Size = UDim2.new(1, 0, 0, 40)
    v_23.Position = UDim2.new(0, 0, 0, 0)
    v_23.BackgroundTransparency = 1
    v_23.Text = "SPJ Reach"
    v_23.TextSize = 24
    v_23.TextColor3 = Color3.fromRGB(255, 255, 255)
    v_23.TextXAlignment = Enum.TextXAlignment.Center
    v_23.Parent = v_22
    local v_24 = Instance.new("TextLabel")
    v_24.Size = UDim2.new(1, 0, 0, 30)
    v_24.Position = UDim2.new(0, 0, 0, 50)
    v_24.Text = "Enter Token:"
    v_24.TextSize = 18
    v_24.TextColor3 = Color3.fromRGB(255, 255, 255)
    v_24.BackgroundTransparency = 1
    v_24.Parent = v_22
    local v_25 = Instance.new("TextBox")
    v_25.Size = UDim2.new(1, 0, 0, 30)
    v_25.Position = UDim2.new(0, 0, 0, 80)
    v_25.Text = ""
    v_25.TextSize = 18
    v_25.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v_25.Parent = v_22
    local v_26 = Instance.new("TextButton")
    v_26.Size = UDim2.new(1, 0, 0, 40)
    v_26.Position = UDim2.new(0, 0, 0, 120)
    v_26.Text = "Increase Right Leg Size"
    v_26.TextSize = 18
    v_26.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    v_26.Parent = v_22
    local v_27 = Instance.new("TextButton")
    v_27.Size = UDim2.new(1, 0, 0, 40)
    v_27.Position = UDim2.new(0, 0, 0, 170)
    v_27.Text = "Increase Left Leg Size"
    v_27.TextSize = 18
    v_27.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    v_27.Parent = v_22
    local v_28 = Instance.new("TextButton")
    v_28.Size = UDim2.new(1, 0, 0, 40)
    v_28.Position = UDim2.new(0, 0, 0, 220)
    v_28.Text = "Adjust Right Leg Transparency"
    v_28.TextSize = 18
    v_28.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    v_28.Parent = v_22
    local v_29 = Instance.new("TextButton")
    v_29.Size = UDim2.new(1, 0, 0, 40)
    v_29.Position = UDim2.new(0, 0, 0, 270)
    v_29.Text = "Adjust Left Leg Transparency"
    v_29.TextSize = 18
    v_29.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    v_29.Parent = v_22
    local v_30 = Instance.new("TextButton")
    v_30.Size = UDim2.new(0, 50, 0, 50)
    v_30.Position = UDim2.new(0, 10, 0, 10)
    v_30.Text = "X"
    v_30.TextSize = 24
    v_30.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    v_30.Parent = v_21
    v_30.Draggable = true
    v_30.MouseButton1Click:Connect(function()
        v_22.Visible = not v_22.Visible
        v_30.Text = v_22.Visible and "X" or "Show UI"
    end)
    v_26.MouseButton1Click:Connect(function()
        if v_25.Text == v_12 then
            v_13 = v_25.Text
            v_14 = v_14 + 1
            v_18("Token valid, setting Right Leg size to: Vector3.new(" .. v_14 .. ", 2, " .. v_14 .. ")")
            v_11["Right Leg"].Size = Vector3.new(v_14, 2, v_14)
        else
            v_18("Invalid token for right leg size change.")
        end
    end)
    v_27.MouseButton1Click:Connect(function()
        if v_25.Text == v_12 then
            v_13 = v_25.Text
            v_15 = v_15 + 1
            v_18("Token valid, setting Left Leg size to: Vector3.new(" .. v_15 .. ", 2, " .. v_15 .. ")")
            v_11["Left Leg"].Size = Vector3.new(v_15, 2, v_15)
        else
            v_18("Invalid token for left leg size change.")
        end
    end)
    v_28.MouseButton1Click:Connect(function()
        if v_25.Text == v_12 then
            v_13 = v_25.Text
            v_18("Token valid, adjusting right leg transparency...")
            v_11["Right Leg"].Transparency = 0.5
        else
            v_18("Invalid token for right leg transparency change.")
        end
    end)
    v_29.MouseButton1Click:Connect(function()
        if v_25.Text == v_12 then
            v_13 = v_25.Text
            v_18("Token valid, adjusting left leg transparency...")
            v_11["Left Leg"].Transparency = 0.5
        else
            v_18("Invalid token for left leg transparency change.")
        end
    end)
end
local function v_31()
    local v_32 = v_11:WaitForChild("Right Leg")
    local v_33 = v_11:WaitForChild("Left Leg")
    local v_34 = v_7.__index
    local v_35 = v_7.__newindex
    setreadonly(v_7, false)
    v_7.__index = newcclosure(function(self, v_36)
        if not checkcaller() and (self == v_32 or self == v_33) and v_36 == "Size" then
            v_18("Size intercepted (index)")
            return v_17
        end
        return v_34(self, v_36)
    end)
    v_7.__newindex = newcclosure(function(self, v_37, v_38)
        if not checkcaller() and (self == v_32 or self == v_33) and v_37 == "Size" then
            if v_13 == v_12 then
                v_18("Token valid, applying size: " .. tostring(v_38))
                return v_35(self, v_37, v_38)
            else
                v_18("Invalid token, size change blocked")
                return v_35(self, v_37, v_16)
            end
        end
        return v_35(self, v_37, v_38)
    end)
    setreadonly(v_7, true)
    v_18("Configured spoofing for leg size. Fake size: " .. tostring(v_17) .. ", Real size: " .. tostring(v_16))
end
v_20()
v_31()
v_9.LocalPlayer.CharacterAdded:Connect(function(v_39)
    v_11 = v_39
    task.wait(0.5)
    v_14 = 2
    v_15 = 2
    v_31()
end)
