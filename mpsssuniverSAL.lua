local v_0 = getrawmetatable(game)
local v_1 = false

local v_2 = game:GetService("Players")
local v_3 = v_2.LocalPlayer
local v_4 = v_3.Character or v_3.CharacterAdded:Wait()

local v_5 = "secret-token"
local v_6 = nil

local v_7 = 2
local v_8 = 2

local v_9 = Vector3.new(2, 2, 2)
local v_10 = Vector3.new(1, 2, 1)

local function f_0(v)
    if v_1 then
        print("[SPJ Reach] " .. tostring(v))
    end
end

local function f_1()
    local v_11 = Instance.new("ScreenGui")
    v_11.Parent = game:GetService("CoreGui")
    
    local v_12 = Instance.new("Frame")
    v_12.Name = "MainUI"
    v_12.Size = UDim2.new(0, 300, 0, 400)
    v_12.Position = UDim2.new(0.5, -150, 0.5, -200)
    v_12.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    v_12.Active = true
    v_12.Draggable = true
    v_12.Parent = v_11

    local v_13 = Instance.new("TextLabel")
    v_13.Size = UDim2.new(1, 0, 0, 40)
    v_13.Position = UDim2.new(0, 0, 0, 0)
    v_13.BackgroundTransparency = 1
    v_13.Text = "SPJ Reach"
    v_13.TextSize = 24
    v_13.TextColor3 = Color3.fromRGB(255, 255, 255)
    v_13.TextXAlignment = Enum.TextXAlignment.Center
    v_13.Parent = v_12

    local v_14 = Instance.new("TextLabel")
    v_14.Size = UDim2.new(1, 0, 0, 30)
    v_14.Position = UDim2.new(0, 0, 0, 50)
    v_14.Text = "Enter Token:"
    v_14.TextSize = 18
    v_14.TextColor3 = Color3.fromRGB(255, 255, 255)
    v_14.BackgroundTransparency = 1
    v_14.Parent = v_12

    local v_15 = Instance.new("TextBox")
    v_15.Size = UDim2.new(1, 0, 0, 30)
    v_15.Position = UDim2.new(0, 0, 0, 80)
    v_15.Text = ""
    v_15.TextSize = 18
    v_15.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v_15.Parent = v_12

    local v_16 = Instance.new("TextButton")
    v_16.Size = UDim2.new(1, 0, 0, 40)
    v_16.Position = UDim2.new(0, 0, 0, 120)
    v_16.Text = "Increase Right Leg Size"
    v_16.TextSize = 18
    v_16.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    v_16.Parent = v_12

    local v_17 = Instance.new("TextButton")
    v_17.Size = UDim2.new(1, 0, 0, 40)
    v_17.Position = UDim2.new(0, 0, 0, 170)
    v_17.Text = "Increase Left Leg Size"
    v_17.TextSize = 18
    v_17.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    v_17.Parent = v_12

    local v_18 = Instance.new("TextButton")
    v_18.Size = UDim2.new(1, 0, 0, 40)
    v_18.Position = UDim2.new(0, 0, 0, 220)
    v_18.Text = "Adjust Right Leg Transparency"
    v_18.TextSize = 18
    v_18.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    v_18.Parent = v_12

    local v_19 = Instance.new("TextButton")
    v_19.Size = UDim2.new(1, 0, 0, 40)
    v_19.Position = UDim2.new(0, 0, 0, 270)
    v_19.Text = "Adjust Left Leg Transparency"
    v_19.TextSize = 18
    v_19.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    v_19.Parent = v_12

    local v_20 = Instance.new("TextButton")
    v_20.Size = UDim2.new(0, 50, 0, 50)
    v_20.Position = UDim2.new(0, 10, 0, 10)
    v_20.Text = "X"
    v_20.TextSize = 24
    v_20.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    v_20.Parent = v_11
    v_20.Draggable = true

    v_20.MouseButton1Click:Connect(function()
        v_12.Visible = not v_12.Visible
        v_20.Text = v_12.Visible and "X" or "Show UI"
    end)

    v_16.MouseButton1Click:Connect(function()
        if v_15.Text == v_5 then
            v_6 = v_15.Text
            v_7 = v_7 + 1
            f_0("Token valid, setting Right Leg size to: Vector3.new(" .. v_7 .. ", 2, " .. v_7 .. ")")
            v_4["Right Leg"].Size = Vector3.new(v_7, 2, v_7)
        else
            f_0("Invalid token for right leg size change.")
        end
    end)

    v_17.MouseButton1Click:Connect(function()
        if v_15.Text == v_5 then
            v_6 = v_15.Text
            v_8 = v_8 + 1
            f_0("Token valid, setting Left Leg size to: Vector3.new(" .. v_8 .. ", 2, " .. v_8 .. ")")
            v_4["Left Leg"].Size = Vector3.new(v_8, 2, v_8)
        else
            f_0("Invalid token for left leg size change.")
        end
    end)

    v_18.MouseButton1Click:Connect(function()
        if v_15.Text == v_5 then
            v_6 = v_15.Text
            f_0("Token valid, adjusting right leg transparency...")
            v_4["Right Leg"].Transparency = 0.5
        else
            f_0("Invalid token for right leg transparency change.")
        end
    end)

    v_19.MouseButton1Click:Connect(function()
        if v_15.Text == v_5 then
            v_6 = v_15.Text
            f_0("Token valid, adjusting left leg transparency...")
            v_4["Left Leg"].Transparency = 0.5
        else
            f_0("Invalid token for left leg transparency change.")
        end
    end)
end

local function f_2()
    local v_21 = v_4:WaitForChild("Right Leg")
    local v_22 = v_4:WaitForChild("Left Leg")
    
    local v_23 = v_0.__index
    local v_24 = v_0.__newindex
    
    setreadonly(v_0, false)
    
    v_0.__index = newcclosure(function(a, b)
        if not checkcaller() and (a == v_21 or a == v_22) and b == "Size" then  
            f_0("Size intercepted (index)")
            return v_10
        end
        return v_23(a, b)
    end)
    
    v_0.__newindex = newcclosure(function(a, b, c)
        if not checkcaller() and (a == v_21 or a == v_22) and b == "Size" then  
            if v_6 == v_5 then
                f_0("Token valid, applying size: " .. tostring(c))
                return v_24(a, b, c)
            else
                f_0("Invalid token, size change blocked")
                return v_24(a, b, v_9)
            end
        end
        return v_24(a, b, c)
    end)
    
    setreadonly(v_0, true)
    f_0("Configured spoofing for leg size. Fake size: " .. tostring(v_10) .. ", Real size: " .. tostring(v_9))
end

spawn(function()
    while wait(0.1) do
        if not v_4["Right Leg"].Massless or not v_4["Left Leg"].Massless then
            v_4["Right Leg"].Massless = true
            v_4["Left Leg"].Massless = true
        end
    end
end)
f_1()
f_2()

v_2.LocalPlayer.CharacterAdded:Connect(function(v)
    v_4 = v
    task.wait(0.5)
    v_7 = 2
    v_8 = 2
    f_2()
end)
