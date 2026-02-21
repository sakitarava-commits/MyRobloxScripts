--// YT-PUBGXALİ V17 (HAVADA ZIPLAMA FIX)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

local lp = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local CorrectKey = "31hehahe"

--// RGB STİL
local function ApplyRGB(obj)
    local s = Instance.new("UIStroke", obj)
    s.Thickness = 3
    local c = Instance.new("UICorner", obj)
    c.CornerRadius = UDim.new(0, 10)
    task.spawn(function()
        while task.wait() do
            s.Color = Color3.fromHSV(tick() % 5 / 5, 0.8, 1)
        end
    end)
end

--// KEY EKRANI
local KeyFrame = Instance.new("Frame", ScreenGui)
KeyFrame.Size = UDim2.new(0, 300, 0, 180)
KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -90)
KeyFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
KeyFrame.Active = true
KeyFrame.Draggable = true
ApplyRGB(KeyFrame)

local KeyInput = Instance.new("TextBox", KeyFrame)
KeyInput.Size = UDim2.new(0.8, 0, 0, 40)
KeyInput.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyInput.PlaceholderText = "ANAHTARI GİR..."
KeyInput.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
KeyInput.TextColor3 = Color3.new(1,1,1)

local LoginBtn = Instance.new("TextButton", KeyFrame)
LoginBtn.Size = UDim2.new(0.6, 0, 0, 40)
LoginBtn.Position = UDim2.new(0.2, 0, 0.75, 0)
LoginBtn.Text = "BAŞLAT"
LoginBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
LoginBtn.TextColor3 = Color3.new(1,1,1)

--// YÜKLEME EKRANI
local LoadFrame = Instance.new("Frame", ScreenGui)
LoadFrame.Size = UDim2.new(1, 0, 1, 0)
LoadFrame.BackgroundColor3 = Color3.new(0,0,0)
LoadFrame.Visible = false
LoadFrame.ZIndex = 10000

local LoadLabel = Instance.new("TextLabel", LoadFrame)
LoadLabel.Size = UDim2.new(1, 0, 1, 0)
LoadLabel.Text = "OYUN HACKLENİYOR..."
LoadLabel.TextColor3 = Color3.fromRGB(0, 200, 0)
LoadLabel.TextSize = 40
LoadLabel.BackgroundTransparency = 1

--// ANA MENÜ
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 280, 0, 400)
MainFrame.Position = UDim2.new(0.5, -140, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
ApplyRGB(MainFrame)

local SpeedBox = Instance.new("TextBox", MainFrame)
SpeedBox.Size = UDim2.new(0.8, 0, 0, 40)
SpeedBox.Position = UDim2.new(0.1, 0, 0.15, 0)
SpeedBox.Text = "50"
SpeedBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SpeedBox.TextColor3 = Color3.new(1,1,1)

local JumpBox = Instance.new("TextBox", MainFrame)
JumpBox.Size = UDim2.new(0.8, 0, 0, 40)
JumpBox.Position = UDim2.new(0.1, 0, 0.3, 0)
JumpBox.Text = "100"
JumpBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
JumpBox.TextColor3 = Color3.new(1,1,1)

local FloatBtn = Instance.new("TextButton", MainFrame)
FloatBtn.Size = UDim2.new(0.8, 0, 0, 45)
FloatBtn.Position = UDim2.new(0.1, 0, 0.5, 0)
FloatBtn.Text = "SÜZÜLME: KAPALI"
FloatBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
FloatBtn.TextColor3 = Color3.new(1,1,1)

--// HİLE FONKSİYONU VE HAVADA ZIPLAMA FIX
local floatOn = false

-- Havada Zıplama Mantığı
UIS.JumpRequest:Connect(function()
    if floatOn and lp.Character and lp.Character:FindFirstChild("Humanoid") then
        -- Karakterin durumunu zıplamaya zorla
        lp.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if lp.Character and lp.Character:FindFirstChild("Humanoid") then
        lp.Character.Humanoid.WalkSpeed = tonumber(SpeedBox.Text) or 16
        lp.Character.Humanoid.JumpPower = tonumber(JumpBox.Text) or 50
        
        if floatOn and lp.Character:FindFirstChild("HumanoidRootPart") then
            -- Süzülme hızı (Yavaş düşüş)
            if lp.Character.HumanoidRootPart.Velocity.Y < -5 then
                lp.Character.HumanoidRootPart.Velocity = Vector3.new(
                    lp.Character.HumanoidRootPart.Velocity.X, 
                    -5, 
                    lp.Character.HumanoidRootPart.Velocity.Z
                )
            end
        end
    end
end)

FloatBtn.MouseButton1Click:Connect(function()
    floatOn = not floatOn
    FloatBtn.Text = floatOn and "SÜZÜLME: AÇIK" or "SÜZÜLME: KAPALI"
    FloatBtn.BackgroundColor3 = floatOn and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(40, 40, 40)
end)

LoginBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == CorrectKey then
        KeyFrame.Visible = false
        LoadFrame.Visible = true
        for i = 0, 100 do
            LoadLabel.Text = "OYUN HACKLENİYOR... %" .. i
            task.wait(0.03)
        end
        LoadFrame.Visible = false
        MainFrame.Visible = true
    end
end)
