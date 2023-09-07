local UI = {}

-- Variables çaldım helal et xgamerman626
local Library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = Library:MakeWindow({Name = "By LadyOfDarkness With Xgamerman626", HidePremium = true})

local Combo_Tab = Window:MakeTab({
    Name = "Kombo",
    Icon = "rbxassetid://3152629358",
    PremiumOnly = false
})

local Gearless_Tab = Window:MakeTab({
    Name = "Gearless",
    Icon = "rbxassetid://3152629574",
    PremiumOnly = false
})

local Grappler_Tab = Window:MakeTab({
    Name = "Grappler",
    Icon = string.format("rbxthumb://type=Asset&id=%s&w=420&h=420",tonumber(10493686822)),
    PremiumOnly = false
})

local Magrail_Tab = Window:MakeTab({
    Name = "Magrail",
    Icon = string.format("rbxthumb://type=Asset&id=%s&w=420&h=420",tonumber(10493687634)),
    PremiumOnly = false
})

local Paraglider_Tab = Window:MakeTab({
    Name = "Paraglider",
    Icon = string.format("rbxthumb://type=Asset&id=%s&w=420&h=420",tonumber(10493693841)),
    PremiumOnly = false
})

local Wingsuit_Tab = Window:MakeTab({
    Name = "Wingsuit",
    Icon = string.format("rbxthumb://type=Asset&id=%s&w=420&h=420",tonumber(10493701003)),
    PremiumOnly = false
})

local Cola_Tab = Window:MakeTab({
    Name = "Sarı Kula",
    Icon = "rbxassetid://9743223064",
    PremiumOnly = false
})

local Adrenaline_Tab = Window:MakeTab({
    Name = "Adrenalin",
    Icon = "rbxassetid://9744692070",
    PremiumOnly = false
})

local Audio_Tab = Window:MakeTab({
    Name = "Radyo",
    Icon = "rbxassetid://9743254397",
    PremiumOnly = false
})

local Misc_Tab = Window:MakeTab({
    Name = "MİSC",
    Icon = "rbxassetid://9405931578",
    PremiumOnly = false
})

local Automatic_Tab = Window:MakeTab({
    Name = "Automatic",
    Icon = "rbxassetid://9742968183",
    PremiumOnly = false
})

local Notifcations_Tab = Window:MakeTab({
    Name = "Bildirimler",
    Icon = "rbxassetid://9745241351",
    PremiumOnly = false
})

local ESP_Tab = Window:MakeTab({
    Name = "ESP",
    Icon = "rbxassetid://14706940859",
    PremiumOnly = false
})

-- Main
function UI.Init()
    Combo_Tab:AddToggle({
        Name = "Flow'u ayarla,Ban riski!",
        Default = false,
        Callback = function(Value)
            getgenv().Toggles.Flow_Active = Value
        end    
    })
    
    Combo_Tab:AddToggle({
        Name = "Kombo'yu ayarla, Ban riski!",
        Default = false,
        Callback = function(Value)
            getgenv().Toggles.Combo_Level = Value
        end    
    })
    
    Combo_Tab:AddSlider({
        Name = "Kombo Leveli",
        Min = 1,
        Max = 5,
        Default = 1,
        Color = Color3.fromRGB(255,255,255),
        Increment = 1,
        ValueName = nil,
        Callback = function(Value)
            getgenv().Sliders.Combo_Level = Value
        end    
    })

    Gearless_Tab:AddToggle({
        Name = "Sonsuz Wallrun, Ban riski!",
        Default = false,
        Callback = function(Value)
            getgenv().Toggles.Infinite_Wallrun = Value
        end    
    })

    Gearless_Tab:AddToggle({
        Name = "Sonsuz Wallboost, Ban riski!",
        Default = false,
        Callback = function(Value)
            getgenv().Toggles.Infinite_Wallboost = Value
        end    
    })

    Gearless_Tab:AddToggle({
        Name = "Sonsuz Charge, Safe!",
        Default = false,
        Callback = function(Value)
            getgenv().Toggles.Infinite_Charge = Value
        end    
    })

    Gearless_Tab:AddToggle({
        Name = "Otomatik Zipline tutucu, Safe!",
        Default = false,
        Callback = function(Value)
            getgenv().Toggles.Auto_CatchZipline = Value
        end    
    })

    Gearless_Tab:AddBind({
        Name = "Reset, Safe!",
        Default = Enum.KeyCode.F,
        Hold = false,
        Callback = function()
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
			task.wait()
			game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Seated")
        end    
    })


    Gearless_Tab:AddBind({
        Name = "Kayma hızı, Ban sebebi!",
        Default = Enum.KeyCode.C,
        Hold = false,
        Callback = function()
            if getgenv().Toggles.Slide_Speed == true then
                getgenv().Toggles.Slide_Speed = false
            elseif getgenv().Toggles.Slide_Speed == false then
                getgenv().Toggles.Slide_Speed = true
            end
        end    
    })

    Gearless_Tab:AddBind({
        Name = "Koşma hızı, Ban sebebi!",
        Default = Enum.KeyCode.V,
        Hold = false,
        Callback = function()
            if getgenv().Toggles.Walk_Speed == true then
                getgenv().Toggles.Walk_Speed = false
            elseif getgenv().Toggles.Walk_Speed == false then
                getgenv().Toggles.Walk_Speed = true
            end
        end    
    })

    Gearless_Tab:AddSlider({
        Name = "Kayma Hızı, Ban riski!",
        Min = 1,
        Max = 1000,
        Default = 1,
        Color = Color3.fromRGB(255,255,255),
        Increment = 5,
        ValueName = nil,
        Callback = function(Value)
            getgenv().Sliders.Slide_Speed = Value
        end    
    })

    Gearless_Tab:AddSlider({
        Name = "Koşma hızı, Ban riski!",
        Min = 1,
        Max = 20,
        Default = 1,
        Color = Color3.fromRGB(255,255,255),
        Increment = 1,
        ValueName = nil,
        Callback = function(Value)
            getgenv().Sliders.Walk_Speed = Value
        end    
    })
    
    
    Adrenaline_Tab:AddToggle({
        Name = "Infinite Adrenaline, Safe!",
        Default = false,
        Callback = function(Value)
            getgenv().Toggles.Infinite_Adrenaline = Value
        end    
    })
    
    Misc_Tab:AddButton({
        Name = "Unlock Spawns, Ban!",
        Callback = function()
sendNotification("Fixlenmiştir!.")
        end
    })
	ESP_Tab:AddButton({
        Name = "Player Esp, safe!",
        Callback = function()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/LadyDarknes/RBLX2PARKOUR/main/Modules/Player_esp.lua"))()
        end
    })
	ESP_Tab:AddButton({
        Name = "Bag+ Esp, safe!",
        Callback = function()
         local RarityColours = {
    ["Common"] = Color3.fromRGB(73, 30, 30), 
    ["Uncommon"] = Color3.fromRGB(0, 214, 0), 
    ["Rare"] = Color3.fromRGB(51, 18, 112),
    ["Epic"] = Color3.fromRGB(5, 154, 168), 
    ["Legendary"] = Color3.fromRGB(254, 254, 0), 
    ["Ultimate"] = Color3.fromRGB(255, 0, 0),
    ["Resplendent"] = Color3.fromRGB(255, 255, 255), 
};

local function AddBillboard(Part)
    local Colour = RarityColours[Part.Parent.Rarity.Value] or Color3.fromRGB(84, 84, 84);

    local BillboardGui = Instance.new("BillboardGui", Part);
    BillboardGui.Size = UDim2.new(15, 0, 15, 0);
    BillboardGui.LightInfluence = 1;
    BillboardGui.AlwaysOnTop = true;

    local Frame = Instance.new("Frame", BillboardGui);
    Frame.Size = UDim2.new(1, 0, 1, 0);
    Frame.BorderSizePixel = 0;
    Frame.BackgroundColor3 = Colour;
end

while true do
    for _, Bag in pairs(game.Workspace:GetChildren()) do
        if Bag.ClassName ~= "Model" then continue; end
        if not Bag:FindFirstChild("BagTouchScript") then continue; end

        if Bag.Main:FindFirstChild("BillboardGui") then 
            Bag.Main:FindFirstChild("BillboardGui"):Destroy(); 
        end

        if getgenv().enabled then
            AddBillboard(Bag.Main);
        end
    end

    wait(2);
end
        end
    })

	Misc_Tab:AddButton({
        Name = "Unlock Time travel TP, Ban!",
        Callback = function()
            local savedPosition = nil

local function sendNotification(message)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Konum İşlemi",
        Text = message,
        Duration = 2
    })
end

-- K tuşuna basıldığında
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.K then
        savedPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        sendNotification("Konum kaydedildi.")
    end
end)

-- L tuşuna basıldığında
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.L then
        if savedPosition then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedPosition)
            sendNotification("Kaydedilen konuma ışınlandınız.")
        else
            sendNotification("Kaydedilen konum bulunamadı.")
        end
    end
end)
        end
    })
    
    Misc_Tab:AddButton({
        Name = "Unlock Badges, Fix!",
        Callback = function()
            sendNotification("Fixlenmiştir!.")
        end
    })
    
    Misc_Tab:AddToggle({
        Name = "God Mode, Time Travel harici Admin yoksa ban sebebi değil!",
        Default = false,
        Callback = function(Value)
            getgenv().Toggles.God_Mode = Value
        end    
    })

    Misc_Tab:AddToggle({
        Name = "Anti Dunce, Safe!",
        Default = false,
        Callback = function(Value)
            getgenv().Toggles.Anti_Dunce = Value
        end    
    })
    
    Misc_Tab:AddToggle({
        Name = "Anti Trail, Safe!",
        Default = false,
        Callback = function(Value)
            getgenv().Toggles.Anti_Trail = Value
        end    
    })
    
    Notifcations_Tab:AddToggle({
        Name = "Staff Bildirimi",
        Default = true,
        Callback = function(Value)
            getgenv().Toggles.Staff_Notifications = Value
        end    
    })

    Notifcations_Tab:AddToggle({
        Name = "Oyuncu Bildirimi",
        Default = false,
        Callback = function(Value)
            getgenv().Toggles.Player_Notifications = Value
        end    
    })

    Notifcations_Tab:AddToggle({
        Name = "Bag Bildirimi",
        Default = false,
        Callback = function(Value)
           getgenv().Toggles.Bag_Notifications = Value
        end    
    })

    Magrail_Tab:AddToggle({
        Name = "Sonsuz Magrail, safe!",
        Default = false,
        Callback = function(Value)
            getgenv().Toggles.Infinite_Magrail = Value
        end    
    })
    
    Cola_Tab:AddLabel("Eklenecek")
    Automatic_Tab:AddLabel("Eklenecek")
    Grappler_Tab:AddLabel("Eklenecek")
    Paraglider_Tab:AddLabel("Eklenecek")
    Wingsuit_Tab:AddLabel("Eklenecek")
    Audio_Tab:AddLabel("Eklenecek")

    Library.Init()
end

function UI:Notify(Notification)
    Library:MakeNotification(Notification)
end


return UI
