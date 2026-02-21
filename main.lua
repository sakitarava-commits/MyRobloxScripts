--// YT-PUBGXALİ V19 (AYARLANABİLİR SÜZÜLME & HIZLI-YAVAŞ İNİŞ)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

local lp = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local CorrectKey = "31hehahe"

--// RGB TASARIM SİSTEMİ
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

--// 1. ANAHTAR GİRİŞİ
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
KeyInput.PlaceholderText = "KEY GİR..."
KeyInput.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
KeyInput.TextColor3 = Color3.new(1,1,1)

local LoginBtn = Instance.new("TextButton", KeyFrame)
LoginBtn.Size = UDim2.new(0.6, 0, 0, 40)
LoginBtn.Position = UDim2.new(0.2, 0, 0.75, 0)
LoginBtn.Text = "ERİŞİMİ AÇ"
LoginBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
LoginBtn.TextColor3 = Color3.new(1,1,1)

--// 2. HACK EKRANI (FULL SCREEN)
local LoadFrame = Instance.new("Frame", ScreenGui)
LoadFrame.Size = UDim2.new(1, 0, 1, 0)
LoadFrame.BackgroundColor3 = Color3.new(0,0,0)
LoadFrame.Visible = false
LoadFrame.ZIndex = 99999

local LoadLabel = Instance.new("TextLabel", LoadFrame)
LoadLabel.Size = UDim2.new(1, 0, 1, 0)
LoadLabel.Text = "HACKLENİYOR..."
LoadLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
LoadLabel.TextSize = 50
LoadLabel.Font = Enum.Font.Code
LoadLabel.BackgroundTransparency = 1

--// 3. ANA PANEL
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 550)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -275)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
ApplyRGB(MainFrame)

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "YT-PUBGXALİ V19"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextSize = 20
Title.BackgroundTransparency = 1

-- AYAR KUTULARI FONKSİYONU
local function CreateBox(placeholder, pos, default)
    local b = Instance.new("TextBox", MainFrame)
    b.Size = UDim2.new(0.8, 0, 0, 35)
    b.Position = pos
    b.Text = default
    b.PlaceholderText = placeholder
    b.BackgroundColor3 = Color3.fromRGB(30,30,30)
    b.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 5)
    return b
end

local SpeedBox = CreateBox("HIZ", UDim2.new(0.1, 0, 0.1, 0), "50")
local JumpBox = CreateBox("ZIPLAMA", UDim2.new(0.1, 0, 0.18, 0), "100")
local FloatPowerBox = CreateBox("SÜZÜLME GÜCÜ (1=Yavaş, 10=Hızlı)", UDim2.new(0.1, 0, 0.26, 0), "5")

local FloatBtn = Instance.new("TextButton", MainFrame)
FloatBtn.Size = UDim2.new(0.8, 0, 0, 40)
FloatBtn.Position = UDim2.new(0.1, 0, 0.36, 0)
FloatBtn.Text = "SÜZÜLME: KAPALI"
FloatBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FloatBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", FloatBtn).CornerRadius = UDim.new(0, 5)

-- BİLGİ KUTULARI
local function Info(txt, pos, color)
    local f = Instance.new("Frame", MainFrame)
    f.Size = UDim2.new(0.9, 0, 0, 45)
    f.Position = pos
    f.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 6)
    local l = Instance.new("TextLabel", f)
    l.Size = UDim2.new(1, 0, 1, 0)
    l.Text = txt
    l.TextColor3 = color
    l.TextSize = 11
    l.TextWrapped = true
    l.BackgroundTransparency = 1
end

Info("SÜZÜLME GÜCÜ: Sayıyı küçültürseniz çok yavaş inersiniz, büyütürseniz hızlı düşersiniz.", UDim2.new(0.05, 0, 0.48, 0), Color3.new(0, 1, 0.5))
Info("UÇMA: Süzülme açıkken Space tuşuna basılı tutarak yükselebilirsiniz.", UDim2.new(0.05, 0, 0.58, 0), Color3.new(1, 1, 0))
Info("DURUM: V19 stabil moddadır. Müzik sistemden tamamen silindi.", UDim2.new(0.05, 0, 0.68, 0), Color3.new(0, 0.7, 1))

--// HİLE KODU
local floatOn = false

UIS.JumpRequest:Connect(function()
    if floatOn and lp.Character and lp.Character:FindFirstChild("Humanoid") then
        lp.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if lp.Character and lp.Character:FindFirstChild("Humanoid") then
        lp.Character.Humanoid.WalkSpeed = tonumber(SpeedBox.Text) or 16
        lp.Character.Humanoid.JumpPower = tonumber(JumpBox.Text) or 50
        
        if floatOn and lp.Character:FindFirstChild("HumanoidRootPart") then
            local fallSpeed = tonumber(FloatPowerBox.Text) or 5
            local root = lp.Character.HumanoidRootPart
            if root.Velocity.Y < -fallSpeed then
                root.Velocity = Vector3.new(root.Velocity.X, -fallSpeed, root.Velocity.Z)
            end
        end
    end
end)

FloatBtn.MouseButton1Click:Connect(function()
    floatOn = not floatOn
    FloatBtn.Text = floatOn and "SÜZÜLME: AÇIK" or "SÜZÜLME: KAPALI"
    FloatBtn.BackgroundColor3 = floatOn and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(50, 50, 50)
end)

LoginBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == CorrectKey then
        KeyFrame.Visible = false
        LoadFrame.Visible = true
        for i = 0, 100 do
            LoadLabel.Text = "VERİLER ÇEKİLİYOR... %" .. i
            task.wait(0.03)
        end
        LoadFrame.Visible = false
        MainFrame.Visible = true
    end
end)
