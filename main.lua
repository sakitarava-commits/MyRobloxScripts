--// YT-PUBGXALİ V15 (ULTIMATE AUDIO BYPASS)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

local lp = game.Players.LocalPlayer
local CorrectKey = "31hehahe"

--// SES FONKSİYONU (Eğer ID1 çalışmazsa ID2'yi dener)
local function PlayHackSound()
    local s = Instance.new("Sound")
    s.Name = "AysikrimV15"
    -- 161273932 (Aysikrim) çalışmazsa diye Roblox'un genel bir sesini ekledim
    s.SoundId = "rbxassetid://161273932" 
    s.Volume = 4
    s.Looped = true
    
    -- Sesi duyulabilir kılmak için karakterin içine koyuyoruz
    if lp.Character and lp.Character:FindFirstChild("Head") then
        s.Parent = lp.Character.Head
    else
        s.Parent = game:GetService("SoundService")
    end
    
    s:Play()
    
    -- Ses çalmıyorsa (Loaded değilse) alternatif ID dene
    s.Loaded:Connect(function()
        if not s.IsLoaded then
            s.SoundId = "rbxassetid://5410086218" -- Alternatif Techno Ses
            s:Play()
        end
    end)
    return s
end

local CurrentSound = nil

--// RGB STİL
local function RGBEffect(obj)
    local s = Instance.new("UIStroke", obj)
    s.Thickness = 3
    task.spawn(function()
        while task.wait() do
            s.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
        end
    end)
end

--// KEY EKRANI
local KeyFrame = Instance.new("Frame", ScreenGui)
KeyFrame.Size = UDim2.new(0, 300, 0, 180)
KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -90)
KeyFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
KeyFrame.Active = true
KeyFrame.Draggable = true
RGBEffect(KeyFrame)

local KeyInput = Instance.new("TextBox", KeyFrame)
KeyInput.Size = UDim2.new(0.8, 0, 0, 40)
KeyInput.Position = UDim2.new(0.1, 0, 0.3, 0)
KeyInput.PlaceholderText = "ANAHTARI YAZ..."
KeyInput.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
KeyInput.TextColor3 = Color3.new(1,1,1)

local LoginBtn = Instance.new("TextButton", KeyFrame)
LoginBtn.Size = UDim2.new(0.6, 0, 0, 40)
LoginBtn.Position = UDim2.new(0.2, 0, 0.7, 0)
LoginBtn.Text = "BAŞLAT"
LoginBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
LoginBtn.TextColor3 = Color3.new(1,1,1)

--// HACKLENİYOR EKRANI
local LoadFrame = Instance.new("Frame", ScreenGui)
LoadFrame.Size = UDim2.new(1, 0, 1, 0)
LoadFrame.BackgroundColor3 = Color3.new(0,0,0)
LoadFrame.Visible = false
LoadFrame.ZIndex = 1000

local LoadLabel = Instance.new("TextLabel", LoadFrame)
LoadLabel.Size = UDim2.new(1, 0, 1, 0)
LoadLabel.Text = "OYUN HACKLENİYOR..."
LoadLabel.TextColor3 = Color3.fromRGB(0, 160, 0)
LoadLabel.TextSize = 40
LoadLabel.BackgroundTransparency = 1

--// MENÜ
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 280, 0, 400)
MainFrame.Position = UDim2.new(0.5, -140, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
RGBEffect(MainFrame)

local MusicBtn = Instance.new("TextButton", MainFrame)
MusicBtn.Size = UDim2.new(0.8, 0, 0, 40)
MusicBtn.Position = UDim2.new(0.1, 0, 0.7, 0)
MusicBtn.Text = "MÜZİĞİ ZORLA ÇAL"
MusicBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 150)
MusicBtn.TextColor3 = Color3.new(1,1,1)

--// GİRİŞ MANTIĞI
LoginBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == CorrectKey then
        KeyFrame.Visible = false
        LoadFrame.Visible = true
        
        -- Ses başlatma denemesi
        CurrentSound = PlayHackSound()
        
        for i = 0, 100 do
            task.wait(0.04)
            LoadLabel.Text = "OYUN HACKLENİYOR... %" .. i
        end
        
        LoadFrame.Visible = false
        MainFrame.Visible = true
    end
end)

MusicBtn.MouseButton1Click:Connect(function()
    if CurrentSound then
        CurrentSound:Stop()
        CurrentSound:Play()
    else
        CurrentSound = PlayHackSound()
    end
end)
