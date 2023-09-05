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
    Icon = "rbxassetid://12803526700",
    PremiumOnly = false
})

-- Main
function UI.Init()
    Combo_Tab:AddToggle({
        Name = "Flow'u ayarla",
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
        Name = "Sonsuz Charge, Ban riski!",
        Default = false,
        Callback = function(Value)
            getgenv().Toggles.Infinite_Charge = Value
        end    
    })

    Gearless_Tab:AddToggle({
        Name = "Otomatik Zipline tutucu",
        Default = false,
        Callback = function(Value)
            getgenv().Toggles.Auto_CatchZipline = Value
        end    
    })

    Gearless_Tab:AddBind({
        Name = "Safe Reset, Kullan!",
        Default = Enum.KeyCode.F,
        Hold = false,
        Callback = function()
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
			task.wait()
			game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Seated")
        end    
    })


    Gearless_Tab:AddBind({
        Name = "Kayma hızı, Ban!",
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
        Name = "Walk Speed, Ban!",
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
        Name = "Infinite Adrenaline, Ban riski!",
        Default = false,
        Callback = function(Value)
            getgenv().Toggles.Infinite_Adrenaline = Value
        end    
    })
    
    Misc_Tab:AddButton({
        Name = "Unlock Spawns, Ban!",
        Callback = function()

        end
    })
	ESP_Tab:AddButton({
        Name = "Player Esp",
        Callback = function()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/LadyDarknes/RBLX2PARKOUR/main/Modules/Player_esp.lua"))()
        end
    })
	ESP_Tab:AddButton({
        Name = "Bag+ Esp",
        Callback = function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/iK4oS/Parkour-Bag-ESP/master/source.lua"))()
        end
    })
    
    Misc_Tab:AddButton({
        Name = "Unlock Badges, Ban!",
        Callback = function()
            
        end
    })
    
    Misc_Tab:AddToggle({
        Name = "God Mode, Ban!",
        Default = false,
        Callback = function(Value)
            getgenv().Toggles.God_Mode = Value
        end    
    })

    Misc_Tab:AddToggle({
        Name = "Anti Dunce",
        Default = false,
        Callback = function(Value)
            getgenv().Toggles.Anti_Dunce = Value
        end    
    })
    
    Misc_Tab:AddToggle({
        Name = "Anti Trail",
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
        Name = "Bag Bildirimi = True",
        Default = false,
        Callback = function(Value)
           getgenv().Toggles.Bag_Notifications = Value
        end    
    })

    Magrail_Tab:AddToggle({
        Name = "Infinite Magrail",
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
