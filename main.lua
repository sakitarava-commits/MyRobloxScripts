--// YT-PUBGXALİ V16 (MÜZİKSİZ & BİLGİ ODAKLI)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

local lp = game.Players.LocalPlayer
local CorrectKey = "31hehahe"

--// MODERN RGB & STİL FONKSİYONU
local function ApplyStyle(obj)
    local s = Instance.new("UIStroke", obj)
    s.Thickness = 3
    local c = Instance.new("UICorner", obj)
    c.CornerRadius = UDim.new(0, 10)
    
    task.spawn(function()
        while task.wait() do
            local hue = tick() % 5 / 5
            s.Color = Color3.fromHSV(hue, 0.8, 1)
        end
    end)
end

--// 1. KEY EKRANI
local KeyFrame = Instance.new("Frame", ScreenGui)
KeyFrame.Size = UDim2.new(0, 300, 0, 180)
KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -90)
KeyFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
KeyFrame.Active = true
KeyFrame.Draggable = true
ApplyStyle(KeyFrame)

local KeyInput = Instance.new("TextBox", KeyFrame)
KeyInput.Size = UDim2.new(0.8, 0, 0, 40)
KeyInput.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyInput.PlaceholderText = "ANAHTARI GİRİN..."
KeyInput.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
KeyInput.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 6)

local LoginBtn = Instance.new("TextButton", KeyFrame)
LoginBtn.Size = UDim2.new(0.6, 0, 0, 40)
LoginBtn.Position = UDim2.new(0.2, 0, 0.75, 0)
LoginBtn.Text = "ERİŞİM SAĞLA"
LoginBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
LoginBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", LoginBtn).CornerRadius = UDim.new(0, 6)

--// 2. OYUN HACKLENİYOR EKRANI (GARANTİLİ GÖRÜNÜM)
local LoadFrame = Instance.new("Frame", ScreenGui)
LoadFrame.Size = UDim2.new(1, 0, 1, 0)
LoadFrame.BackgroundColor3 = Color3.new(0,0,0)
LoadFrame.Visible = false
LoadFrame.ZIndex = 10000 -- Her şeyin üstünde

local LoadLabel = Instance.new("TextLabel", LoadFrame)
LoadLabel.Size = UDim2.new(1, 0, 1, 0)
LoadLabel.Text = "SİSTEME SIZILIYOR...\nOYUN HACKLENİYOR..."
LoadLabel.TextColor3 = Color3.fromRGB(0, 200, 0)
LoadLabel.TextSize = 40
LoadLabel.Font = Enum.Font.GothamBold
LoadLabel.BackgroundTransparency = 1
LoadLabel.ZIndex = 10001

--// 3. MENÜ AÇMA BUTONU
local OpenBtn = Instance.new("TextButton", ScreenGui)
OpenBtn.Size = UDim2.new(0, 100, 0, 40)
OpenBtn.Position = UDim2.new(1, -110, 0.5, -20)
OpenBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
OpenBtn.Text = "HİLE PANELİ"
OpenBtn.TextColor3 = Color3.new(1,1,1)
OpenBtn.Visible = false
ApplyStyle(OpenBtn)

--// 4. ANA MENÜ
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 500)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
ApplyStyle(MainFrame)

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "YT-PUBGXALİ V16"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextSize = 22
Title.BackgroundTransparency = 1

-- BİLGİ KUTUCUKLARI FONKSİYONU
local function AddInfoBox(txt, pos, color)
    local f = Instance.new("Frame", MainFrame)
    f.Size = UDim2.new(0.9, 0, 0, 50)
    f.Position = pos
    f.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 6)
    
    local l = Instance.new("TextLabel", f)
    l.Size = UDim2.new(1, 0, 1, 0)
    l.Text = txt
    l.TextColor3 = color or Color3.new(1,1,1)
    l.TextSize = 12
    l.TextWrapped = true
    l.BackgroundTransparency = 1
end

-- AYARLAR
local SpeedBox = Instance.new("TextBox", MainFrame)
SpeedBox.Size = UDim2.new(0.8, 0, 0, 40)
SpeedBox.Position = UDim2.new(0.1, 0, 0.12, 0)
SpeedBox.Text = "50"
SpeedBox.PlaceholderText = "HIZ DEĞERİ"
SpeedBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
SpeedBox.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", SpeedBox).CornerRadius = UDim.new(0, 6)

local JumpBox = Instance.new("TextBox", MainFrame)
JumpBox.Size = UDim2.new(0.8, 0, 0, 40)
JumpBox.Position = UDim2.new(0.1, 0, 0.22, 0)
JumpBox.Text = "100"
JumpBox.PlaceholderText = "ZIPLAMA DEĞERİ"
JumpBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
JumpBox.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", JumpBox).CornerRadius = UDim.new(0, 6)

local FloatBtn = Instance.new("TextButton", MainFrame)
FloatBtn.Size = UDim2.new(0.8, 0, 0, 45)
FloatBtn.Position = UDim2.new(0.1, 0, 0.35, 0)
FloatBtn.Text = "SÜZÜLME: KAPALI"
FloatBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FloatBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", FloatBtn).CornerRadius = UDim.new(0, 8)

-- BİLGİ KUTULARI (İSTEDİĞİN EKLEME)
AddInfoBox("HIZ BİLGİSİ: Değeri 100 üzerine çıkarırsanız oyundan atılabilirsiniz (Kick).", UDim2.new(0.05, 0, 0.5, 0), Color3.fromRGB(200, 200, 0))
AddInfoBox("SÜZÜLME BİLGİSİ: Havada asılı kalırken zıplama tuşuna basarak uçabilirsiniz.", UDim2.new(0.05, 0, 0.62, 0), Color3.fromRGB(0, 200, 0))
AddInfoBox("MENÜ BİLGİSİ: Menüyü kapatmak için sağdaki butona tekrar basın.", UDim2.new(0.05, 0, 0.74, 0), Color3.fromRGB(0, 150, 255))

--// HİLE DÖNGÜSÜ
local floatOn = false
game:GetService("RunService").Heartbeat:Connect(function()
    if lp.Character and lp.Character:FindFirstChild("Humanoid") then
        lp.Character.Humanoid.WalkSpeed = tonumber(SpeedBox.Text) or 16
        lp.Character.Humanoid.JumpPower = tonumber(JumpBox.Text) or 50
        
        if floatOn and lp.Character:FindFirstChild("HumanoidRootPart") then
            if lp.Character.HumanoidRootPart.Velocity.Y < -5 then
                lp.Character.HumanoidRootPart.Velocity = Vector3.new(lp.Character.HumanoidRootPart.Velocity.X, -5, lp.Character.HumanoidRootPart.Velocity.Z)
            end
        end
    end
end)

FloatBtn.MouseButton1Click:Connect(function()
    floatOn = not floatOn
    FloatBtn.Text = floatOn and "SÜZÜLME: AÇIK" or "SÜZÜLME: KAPALI"
    FloatBtn.BackgroundColor3 = floatOn and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(50, 50, 50)
end)

OpenBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

--// GİRİŞ VE YÜKLEME EKRANI
LoginBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == CorrectKey then
        KeyFrame.Visible = false
        LoadFrame.Visible = true
        
        -- Yükleme Efekti
        for i = 0, 100 do
            LoadLabel.Text = "SİSTEME SIZILIYOR...\nOYUN HACKLENİYOR... %" .. i
            task.wait(0.04)
        end
        
        LoadFrame.Visible = false
        OpenBtn.Visible = true
        MainFrame.Visible = true
    else
        KeyInput.Text = "HATALI KEY!"
        task.wait(1)
        KeyInput.Text = ""
    end
end)
