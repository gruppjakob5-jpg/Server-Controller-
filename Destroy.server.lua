--[[
    SERVER CONTROLLER - MELOUN CLEAN-DESTRUCTION
    Modified for MelounczYT1
    Features: Heavy Destruction Logic (No Text/666 Labels)
]]

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")

-- Buttons
local AK47Btn = Instance.new("TextButton")
local LoadMelounBtn = Instance.new("TextButton")
local DestroyBtn = Instance.new("TextButton")
local MsgBtn = Instance.new("TextButton")
local DiscoBtn = Instance.new("TextButton")
local MusicBtn = Instance.new("TextButton")
local LaughBtn = Instance.new("TextButton")

-- Setup GUI
ScreenGui.Parent = game.CoreGui 
ScreenGui.Name = "ServerController_Meloun_Clean"

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 1
MainFrame.BorderColor3 = Color3.fromRGB(60, 60, 60)
MainFrame.Position = UDim2.new(0.4, 0, 0.25, 0)
MainFrame.Size = UDim2.new(0, 260, 0, 380) 
MainFrame.Active = true
MainFrame.Draggable = true 

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.Text = "SERVER CONTROLLER"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true

local function StyleButton(btn, pos, text)
    btn.Parent = MainFrame
    btn.Position = pos
    btn.Size = UDim2.new(0.9, 0, 0, 38)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextScaled = true
    btn.BorderSizePixel = 0
end

-- Layout Buttons
StyleButton(AK47Btn,      UDim2.new(0.05, 0, 0.11, 0), "LOAD AK-47")
StyleButton(LoadMelounBtn, UDim2.new(0.05, 0, 0.23, 0), "LOAD MELOUN GUI")
StyleButton(DestroyBtn,    UDim2.new(0.05, 0, 0.35, 0), "DESTROY SERVER")
StyleButton(MsgBtn,       UDim2.new(0.05, 0, 0.47, 0), "MELOUN MESSAGES")
StyleButton(DiscoBtn,     UDim2.new(0.05, 0, 0.59, 0), "DISCO MODE")
StyleButton(MusicBtn,     UDim2.new(0.05, 0, 0.71, 0), "2006 THEME")
StyleButton(LaughBtn,     UDim2.new(0.05, 0, 0.83, 0), "INFINITE LAUGH")

-- [[ LOGIK ]] --

-- 1. AK-47 Loader
AK47Btn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/ak47", true))()
end)

-- 2. Load Meloun GUI
LoadMelounBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gruppjakob5-jpg/Meloun-gui-v2---fe-bypass/3a5836a8da2b54646ec9ece670dee65114283433/Meloun%20gui%20FE%20bypass%20xester.Lua"))()
end)

-- 3. DESTROY SERVER (Clean & Brutal)
DestroyBtn.MouseButton1Click:Connect(function()
    local function applyDestruction(parent)
        for _, v in next, parent:GetChildren() do
            if v:IsA("BasePart") then
                -- Part Verwandlung
                v.BrickColor = BrickColor.new("Really black")
                v.TopSurface = Enum.SurfaceType.Smooth
                v.BottomSurface = Enum.SurfaceType.Smooth
                
                -- SelectionBox (Roter Rahmen)
                local s = Instance.new("SelectionBox", v)
                s.Adornee = v
                s.Color3 = Color3.new(1, 0, 0)
                s.LineThickness = 0.05
                
                -- Rotes Punktlicht
                local a = Instance.new("PointLight", v)
                a.Color = Color3.new(1, 0, 0)
                a.Range = 15
                a.Brightness = 5
                
                -- Feuer Effekt
                local f = Instance.new("Fire", v)
                f.Size = 20
                f.Heat = 25
                f.Color = Color3.new(1, 0, 0)
                f.SecondaryColor = Color3.new(0, 0, 0)
            end
            if #v:GetChildren() > 0 then applyDestruction(v) end
        end
    end
    
    -- Lighting (Dark & Red)
    game.Lighting.TimeOfDay = 0
    game.Lighting.Brightness = 0
    game.Lighting.ShadowColor = Color3.new(0, 0, 0)
    game.Lighting.Ambient = Color3.new(1, 0, 0)
    game.Lighting.OutdoorAmbient = Color3.new(0, 0, 0)
    game.Lighting.FogEnd = 200
    game.Lighting.FogColor = Color3.new(0, 0, 0)
    
    applyDestruction(game.Workspace)
end)

-- 4. Meloun Message Sequenz
MsgBtn.MouseButton1Click:Connect(function()
    spawn(function()
        while true do
            local m = Instance.new("Message", workspace)
            m.Text = "Team meloun hacked this game (:"
            task.wait(4)
            m.Text = "you will burn!"
            task.wait(3)
            m.Text = "I am MelounczYT1 the strongest of Team meloun"
            task.wait(6)
            m:Destroy()
            task.wait(1)
        end
    end)
end)

-- 5. Disco Mode
DiscoBtn.MouseButton1Click:Connect(function()
    spawn(function()
        while true do
            game.Lighting.Ambient = Color3.new(math.random(), math.random(), math.random())
            task.wait(0.25)
        end
    end)
end)

-- 6. 2006 Theme & 7. Laugh
MusicBtn.MouseButton1Click:Connect(function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://1839246711"
    s.Volume = 2
    s.Looped = true
    s:Play()
end)

LaughBtn.MouseButton1Click:Connect(function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://35935204"
    s.Volume = 3
    s:Play()
end)

print("Server Controller: 666 Labels removed. Destruction ready.")
