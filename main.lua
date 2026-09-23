-- =====================================================
-- CUSTOM KEY SYSTEM + RAYFIELD HUB (Alles in einem)
-- Key: K7XQ-9M2P-V4ZT-8RWL   ← immer der gleiche
-- Discord: https://discord.gg/gFUUjh73vd
-- =====================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local CORRECT_KEY = "K7XQ-9M2P-V4ZT-8RWL"
local DISCORD_LINK = "https://discord.gg/gFUUjh73vd"

if PlayerGui:FindFirstChild("CustomKeySystem") then
    PlayerGui.CustomKeySystem:Destroy()
end

local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "CustomKeySystem"
KeyGui.ResetOnSpawn = false
KeyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
KeyGui.Parent = PlayerGui

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 380, 0, 230)
Main.Position = UDim2.new(0.5, -190, 0.5, -115)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.BorderSizePixel = 0
Main.Parent = KeyGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Main

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(60, 60, 60)
UIStroke.Thickness = 1.5
UIStroke.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "🔑 Key System"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.Parent = Main

local Note = Instance.new("TextLabel")
Note.Size = UDim2.new(1, -40, 0, 30)
Note.Position = UDim2.new(0, 20, 0, 50)
Note.BackgroundTransparency = 1
Note.Text = "Join Discord to get the key"
Note.TextColor3 = Color3.fromRGB(180, 180, 180)
Note.Font = Enum.Font.Gotham
Note.TextSize = 14
Note.Parent = Main

local InputBox = Instance.new("TextBox")
InputBox.Size = UDim2.new(1, -40, 0, 40)
InputBox.Position = UDim2.new(0, 20, 0, 90)
InputBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
InputBox.Text = ""
InputBox.PlaceholderText = "Enter Key..."
InputBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
InputBox.Font = Enum.Font.Gotham
InputBox.TextSize = 16
InputBox.ClearTextOnFocus = false
InputBox.Parent = Main

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = InputBox

local InputStroke = Instance.new("UIStroke")
InputStroke.Color = Color3.fromRGB(70, 70, 70)
InputStroke.Thickness = 1
InputStroke.Parent = InputBox

local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.45, -15, 0, 40)
GetKeyBtn.Position = UDim2.new(0, 20, 0, 150)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
GetKeyBtn.Text = "Get Key"
GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.TextSize = 15
GetKeyBtn.Parent = Main

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 8)
GetKeyCorner.Parent = GetKeyBtn

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0.45, -15, 0, 40)
SubmitBtn.Position = UDim2.new(0.55, 0, 0, 150)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
SubmitBtn.Text = "Submit"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 15
SubmitBtn.Parent = Main

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 8)
SubmitCorner.Parent = SubmitBtn

local function addHover(button, normalColor, hoverColor)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor}):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = normalColor}):Play()
    end)
end

addHover(GetKeyBtn, Color3.fromRGB(0, 120, 215), Color3.fromRGB(0, 145, 255))
addHover(SubmitBtn, Color3.fromRGB(40, 180, 80), Color3.fromRGB(50, 210, 100))

GetKeyBtn.MouseButton1Click:Connect(function()
    pcall(function()
        setclipboard(DISCORD_LINK)
    end)
    
    StarterGui:SetCore("SendNotification", {
        Title = "Key System",
        Text = "Discord Link kopiert!\n" .. DISCORD_LINK,
        Duration = 5
    })
end)

SubmitBtn.MouseButton1Click:Connect(function()
    local entered = InputBox.Text:gsub("%s+", "")
    
    if entered == CORRECT_KEY then
        StarterGui:SetCore("SendNotification", {
            Title = "Success!",
            Text = "Key accepted. Loading script...",
            Duration = 3
        })
        
        TweenService:Create(Main, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
        for _, child in ipairs(Main:GetDescendants()) do
            if child:IsA("TextLabel") or child:IsA("TextBox") or child:IsA("TextButton") then
                TweenService:Create(child, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
            elseif child:IsA("UIStroke") then
                TweenService:Create(child, TweenInfo.new(0.4), {Transparency = 1}):Play()
            end
        end
        
        task.wait(0.45)
        KeyGui:Destroy()
        
        -- ====================== RAYFIELD HUB ======================
        local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
        
        local Window = Rayfield:CreateWindow({
           Name = "🔥 Example Script Hub | Game 🔫",
           LoadingTitle = "🔫 Gun Simulator 💥",
           LoadingSubtitle = "by 1_F0",
           ConfigurationSaving = {
              Enabled = false,
              FolderName = nil,
              FileName = "Example Hub"
           },
           Discord = {
              Enabled = true,
              Invite = "gFUUjh73vd",
              RememberJoins = true
           },
           KeySystem = false
        })
        
        local MainTab = Window:CreateTab("🏠 Home", nil)
        local MainSection = MainTab:CreateSection("Main")
        
        Rayfield:Notify({
           Title = "You executed the script",
           Content = "Very cool gui",
           Duration = 5,
           Image = 13047715178,
           Actions = {
              Ignore = {
                 Name = "Okay!",
                 Callback = function()
                    print("The user tapped Okay!")
                 end
              },
           },
        })
        
        local Button = MainTab:CreateButton({
           Name = "Infinite Jump Toggle",
           Callback = function()
              _G.infinjump = not _G.infinjump
        
              if _G.infinJumpStarted == nil then
                 _G.infinJumpStarted = true
                 game.StarterGui:SetCore("SendNotification", {
                    Title = "Youtube Hub",
                    Text = "Infinite Jump Activated!",
                    Duration = 5
                 })
        
                 local plr = game:GetService('Players').LocalPlayer
                 local m = plr:GetMouse()
                 m.KeyDown:Connect(function(k)
                    if _G.infinjump then
                       if k:byte() == 32 then
                          local humanoid = game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
                          if humanoid then
                             humanoid:ChangeState('Jumping')
                             task.wait()
                             humanoid:ChangeState('Seated')
                          end
                       end
                    end
                 end)
              end
           end,
        })
        
        local Slider = MainTab:CreateSlider({
           Name = "WalkSpeed Slider",
           Range = {1, 350},
           Increment = 1,
           Suffix = "Speed",
           CurrentValue = 16,
           Flag = "sliderws",
           Callback = function(Value)
              game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
           end,
        })
        
        local Slider2 = MainTab:CreateSlider({
           Name = "JumpPower Slider",
           Range = {1, 350},
           Increment = 1,
           Suffix = "Power",
           CurrentValue = 50,
           Flag = "sliderjp",
           Callback = function(Value)
              game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
           end,
        })
        
        local Dropdown = MainTab:CreateDropdown({
           Name = "Select Area",
           Options = {"Starter World", "Pirate Island", "Pineapple Paradise"},
           CurrentOption = {"Starter World"},
           MultipleOptions = false,
           Flag = "dropdownarea",
           Callback = function(Option)
              print(Option)
           end,
        })
        
        local Input = MainTab:CreateInput({
           Name = "Walkspeed",
           PlaceholderText = "1-500",
           RemoveTextAfterFocusLost = true,
           Callback = function(Text)
              game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(Text) or 16
           end,
        })
        
        local OtherSection = MainTab:CreateSection("Other")
        
        local Toggle = MainTab:CreateToggle({
           Name = "Auto Farm",
           CurrentValue = false,
           Flag = "Toggle1",
           Callback = function(Value)
              print("FARMING")
           end,
        })
        
        local TPTab = Window:CreateTab("🏝 Teleports", nil)
        
        local Button1 = TPTab:CreateButton({
           Name = "Starter Island",
           Callback = function()
              -- Teleport1
           end,
        })
        
        local Button2 = TPTab:CreateButton({
           Name = "Pirate Island",
           Callback = function()
              -- Teleport2
           end,
        })
        
        local Button3 = TPTab:CreateButton({
           Name = "Pineapple Paradise",
           Callback = function()
              -- Teleport3
           end,
        })
        
        local MiscTab = Window:CreateTab("🎲 Misc", nil)
        -- =========================================================
        
    else
        StarterGui:SetCore("SendNotification", {
            Title = "Wrong Key",
            Text = "Invalid key. Join Discord to get the correct one.",
            Duration = 4
        })
        
        local originalPos = Main.Position
        for i = 1, 6 do
            Main.Position = originalPos + UDim2.new(0, math.random(-8, 8), 0, 0)
            task.wait(0.04)
        end
        Main.Position = originalPos
    end
end)

InputBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        SubmitBtn.MouseButton1Click:Fire()
    end
end)