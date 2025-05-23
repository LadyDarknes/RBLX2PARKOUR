-- Runtime.lua Güncellenmiş Versiyon

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")

local UI = loadstring(readfile("RBLX2PARKOUR/Modules/UI.lua"))()
local ACB = loadstring(readfile("RBLX2PARKOUR/Modules/ACB.lua"))()
local UI_Content = readfile("RBLX2PARKOUR/Modules/UI.lua")
if not UI_Content then error("UI.lua dosyası bulunamadı!") end
local UI = loadstring(UI_Content)()

local Player = Players.LocalPlayer
local PlayerGui = Player.PlayerGui

local Runtime = {}

function Runtime.Init()
    Util:Variables()
    task.wait(0.1)
    ACB.Init()
    UI.Init()

    getgenv().Connections.Stepped_RunService = RunService.RenderStepped:Connect(function()
        if Player.Character and Player.Character:FindFirstChild("Humanoid") then
            getgenv().GameVariables = getupvalue(getsenv(Player.Backpack:WaitForChild("Main")).resetAmmo, 1)

            if getgenv().Toggles.Anti_Dunce then
                local Shares = getrenv().shared
                Shares.dunces[Player.Name] = false
            end

            if getgenv().Toggles.Infinite_Magrail then
                getgenv().GameVariables.lastMagSlap = 0
            end

            if getgenv().Toggles.Combo_Level then
                getgenv().GameVariables.comboTime = 1000
                getgenv().GameVariables.comboHealth = 100
                getgenv().GameVariables.comboXp = 1
                getgenv().GameVariables.comboLevel = getgenv().Sliders.Combo_Level
            end

            if getgenv().Toggles.Flow_Active then
                getgenv().GameVariables.flowActive = true
                getgenv().GameVariables.flowDelta = 100
            end

            if getgenv().Toggles.Slide_Speed then
                getgenv().GameVariables.slidespeed = getgenv().Sliders.Slide_Speed
            end

            if getgenv().Toggles.Infinite_Wallrun then
                getgenv().GameVariables.recentWallruns = 0
                getgenv().GameVariables.lastWR = 0
                getgenv().GameVariables.maxWallrun = math.huge
                getgenv().GameVariables.numWallrun = math.huge
            end

            if getgenv().Toggles.Walk_Speed then
                getgenv().GameVariables.walkspeedMult = getgenv().Sliders.Walk_Speed
            end

            if getgenv().Toggles.Infinite_Wallboost then
                getgenv().GameVariables.numWallclimb = math.huge
                getgenv().GameVariables.lastWallClimb = 0
            end

            if getgenv().Toggles.Infinite_Charge then
                getgenv().GameVariables.chargeCooldown = 0
            else
                getgenv().GameVariables.chargeCooldown = 2
            end

            local Zipline_Text = PlayerGui.GameplayUI.Zipline
            local Zipline_Keybind = ReplicatedStorage.PlayerData[Player.Name].Settings.Keybinds.E
            local Shift_Keybind = ReplicatedStorage.PlayerData[Player.Name].Settings.Keybinds.Shift
            if getgenv().Toggles.Auto_CatchZipline then
                if not getgenv().GameVariables.ziplining and Zipline_Text.Visible and Player.Character.Humanoid.FloorMaterial == Enum.Material.Air and getgenv().Other.CanZipline then
                    task.spawn(function()
                        getgenv().Other.CanZipline = false
                        VirtualInputManager:SendKeyEvent(true, Shift_Keybind.Value, false, game)
                        task.wait(0.05)
                        VirtualInputManager:SendKeyEvent(true, Zipline_Keybind.Value, false, game)
                        task.wait(0.05)
                        VirtualInputManager:SendKeyEvent(false, Shift_Keybind.Value, false, game)
                        VirtualInputManager:SendKeyEvent(false, Zipline_Keybind.Value, false, game)
                    end)
                end
            end

            if Player.Character.Humanoid.FloorMaterial ~= Enum.Material.Air and not getgenv().GameVariables.ziplining then
                task.delay(1, function()
                    getgenv().Other.CanZipline = true
                end)
            end
        end
    end)

    getgenv().Connections.Input_Began = UserInputService.InputBegan:Connect(function(Input, Game_Processed)
        local Back_Gear_Key = PlayerGui.NewUI.Windows.Keybinds.Window.UseKit.Binding

        if Input.KeyCode == Enum.KeyCode[Back_Gear_Key.Text] and not Game_Processed then
            if not getgenv().Toggles.Infinite_Adrenaline then
                getgenv().Other.Stimmed = false
            else
                getgenv().Other.Stimmed = not getgenv().Other.Stimmed
                if getgenv().Other.Stimmed then
                    task.wait(0.2)
                    getgenv().GameVariables.adrenalineCooldown = math.huge
                else
                    getgenv().GameVariables.adrenalineCooldown = 30
                end
            end
        end
    end)

    getgenv().Connections.Staff_Notification = Players.PlayerAdded:Connect(function(PlayerInstance)
        if getgenv().Toggles.Staff_Notifications and Util:CheckStaff(PlayerInstance) then
            UI:Notify({
                Title = "Staff Joined",
                Content = "User: " .. PlayerInstance.Name,
                Duration = 10
            })
        end
    end)

    getgenv().Connections.Player_Notification = Players.PlayerAdded:Connect(function(PlayerInstance)
        if getgenv().Toggles.Player_Notifications then
            UI:Notify({
                Title = "Player Joined",
                Content = "User: " .. PlayerInstance.Name,
                Duration = 1.5
            })
        end
    end)
end

return Runtime
