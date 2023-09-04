
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")

local UI = loadstring(readfile("RBLX2PARKOUR/Modules/UI.lua"))()
local ACB = loadstring(readfile("RBLX2PARKOUR/Modules/ACB.lua"))()
local Util = loadstring(readfile("RBLX2PARKOUR/Modules/Util.lua"))()


local Player = Players.LocalPlayer
local PlayerGui = Player.PlayerGui


local Runtime = {}

function Runtime.Init()

    Util:Variables()

    task.wait(.1)

 
    ACB.Init()

 
    UI.Init()

   
    getgenv().Connections.Stepped_RunService = RunService.RenderStepped:Connect(function()      
        if Player.Character:FindFirstChild("Humanoid") then           
            getgenv().GameVariables = getupvalue(getsenv(Player.Backpack:WaitForChild("Main")).resetAmmo, 1)

           
            if getgenv().Toggles.Anti_Dunce == true then           
                local Shares = getrenv().shared
                Shares.dunces[Player.Name] = false
            end

            if getgenv().Toggles.Infinite_Magrail then
                getgenv().GameVariables.lastMagSlap = 0
            end

            if getgenv().Toggles.Combo_Level == true then
                getgenv().GameVariables.comboTime = 1000
                getgenv().GameVariables.comboHealth = 100
                getgenv().GameVariables.comboXp = 1
                getgenv().GameVariables.comboLevel = getgenv().Sliders.Combo_Level
            end

            if getgenv().Toggles.Flow_Active == true then
                getgenv().GameVariables.flowActive = true;
                getgenv().GameVariables.flowDelta = 100;
            end

            if getgenv().Toggles.Slide_Speed == true then
                getgenv().GameVariables.slidespeed = getgenv().Sliders.Slide_Speed
            end

            if getgenv().Toggles.Infinite_Wallrun == true then
                getgenv().GameVariables.recentWallruns = 0
                getgenv().GameVariables.lastWR = 0
                getgenv().GameVariables.maxWallrun = math.huge
                getgenv().GameVariables.numWallrun = math.huge
            end

            if getgenv().Toggles.Walk_Speed == true then
                getgenv().GameVariables.walkspeedMult = getgenv().Sliders.Walk_Speed
            end

            if getgenv().Toggles.Infinite_Wallboost == true then
                getgenv().GameVariables.numWallclimb = math.huge
                getgenv().GameVariables.lastWallClimb = 0
            end

            if getgenv().Toggles.Infinite_Charge == true then
                getgenv().GameVariables.chargeCooldown = 0
            else
                getgenv().GameVariables.chargeCooldown = 2
            end

            local Zipline_Text = PlayerGui.GameplayUI.Zipline
            local Zipline_Keybind = ReplicatedStorage.PlayerData[Player.Name].Settings.Keybinds.E
            local Shift_Keybind = ReplicatedStorage.PlayerData[Player.Name].Settings.Keybinds.Shift
            -- sinir bozucu xD
            if getgenv().Toggles.Auto_CatchZipline == true then
                if getgenv().GameVariables.ziplining == false then
                    if Zipline_Text.Visible == true then
                        if Player.Character.Humanoid.FloorMaterial == Enum.Material.Air then
                            if getgenv().Other.CanZipline == true then
                                task.spawn(function()
                                    getgenv().Other.CanZipline = false
                                    VirtualInputManager:SendKeyEvent(true, Shift_Keybind.Value, false, game)
                                    task.wait(0.05)
                                    VirtualInputManager:SendKeyEvent(true, Zipline_Keybind.Value, false, game)
                                    task.wait(.05)
                                    VirtualInputManager:SendKeyEvent(false, Shift_Keybind.Value, false, game)
                                    VirtualInputManager:SendKeyEvent(false, Zipline_Keybind.Value, false, game)
                                end)
                            end
                        end
                    end
                end
            end

            if Player.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
              
                if getgenv().GameVariables.ziplining == false then
                    task.delay(1, function()
                        getgenv().Other.CanZipline = true 
                    end)
                end
            end

        end
    end)

    getgenv().Connections.Input_Began = UserInputService.InputBegan:Connect(function(Input, Game_Processed)
        local Back_Gear_Key = Player.PlayerGui.NewUI.Windows.Keybinds.Window.UseKit.Binding

        if Input.KeyCode == Enum.KeyCode[Back_Gear_Key.Text] and not Game_Processed then
            if getgenv().Toggles.Infinite_Adrenaline == false then 
                getgenv().Other.Stimmed = false
                return 
            else
                if getgenv().Other.Stimmed == true then
                    -- Unstim
                    getgenv().Other.Stimmed = false
                    getgenv().GameVariables.adrenalineCooldown = 30
                elseif getgenv().Other.Stimmed == false then
                    -- Stim
                    getgenv().Other.Stimmed = true
                    task.wait(.2) -- Wait a tiny second for the animiation to play
                    getgenv().GameVariables.adrenalineCooldown = math.huge
                end
            end
        end   
    end)

    getgenv().Connections.Staff_Notification = Players.PlayerAdded:Connect(function(PlayerInstance)
        
        if getgenv().Toggles.Staff_Notifications == true then
            if Util:CheckStaff(Player) == true then
                UI:MakeNotification({
                    Name = "Staff Joined",
                    Content = "User: "..PlayerInstance.Name,
                    Image = "rbxassetid://9745241351",
                    Time = 10
                })
            end
        
        end
    end)

    
    getgenv().Connections.Player_Notification = Players.PlayerAdded:Connect(function(PlayerInstance)
        
        if getgenv().Toggles.Player_Notifications == true then
            UI:MakeNotification({
                Name = "Player Joined",
                Content = "User: "..PlayerInstance.Name,
                Image = "rbxassetid://9745241351",
                Time = 1.5
            })
        
        end
    end)
end

return Runtime
