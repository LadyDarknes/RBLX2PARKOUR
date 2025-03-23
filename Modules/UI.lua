-- Rayfield UI Kütüphanesi
local Library = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Library:CreateWindow({
    Name = "By LadyOfDarkness With Xgamerman626",
    LoadingTitle = "RBLX2PARKOUR Yükleniyor...",
    LoadingSubtitle = "Lütfen bekleyin...",
    ConfigurationSaving = {
       Enabled = false,
    },
    KeySystem = false,
})

-- Kombo Sekmesi
local Combo_Tab = Window:CreateTab("Kombo", 4483362458)
Combo_Tab:CreateToggle({
    Name = "Flow'u ayarla, Ban riski!",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().Toggles.Flow_Active = Value
    end
})

Combo_Tab:CreateToggle({
    Name = "Kombo'yu ayarla, Ban riski!",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().Toggles.Combo_Level = Value
    end
})

Combo_Tab:CreateSlider({
    Name = "Kombo Leveli",
    Range = {1, 5},
    Increment = 1,
    CurrentValue = 1,
    Callback = function(Value)
        getgenv().Sliders.Combo_Level = Value
    end
})

-- Gearless Sekmesi
local Gearless_Tab = Window:CreateTab("Gearless", 4483362458)
Gearless_Tab:CreateToggle({
    Name = "Sonsuz Wallrun, Ban riski!",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().Toggles.Infinite_Wallrun = Value
    end
})

Gearless_Tab:CreateToggle({
    Name = "Sonsuz Wallboost, Ban riski!",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().Toggles.Infinite_Wallboost = Value
    end
})

Gearless_Tab:CreateToggle({
    Name = "Sonsuz Charge, Safe!",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().Toggles.Infinite_Charge = Value
    end
})

Gearless_Tab:CreateToggle({
    Name = "Otomatik Zipline tutucu, Safe!",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().Toggles.Auto_CatchZipline = Value
    end
})

-- Adrenalin Sekmesi
local Adrenaline_Tab = Window:CreateTab("Adrenalin", 4483362458)
Adrenaline_Tab:CreateToggle({
    Name = "Infinite Adrenaline, Safe!",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().Toggles.Infinite_Adrenaline = Value
    end
})

-- Misc Sekmesi
local Misc_Tab = Window:CreateTab("MİSC", 4483362458)
Misc_Tab:CreateToggle({
    Name = "God Mode, Ban sebebi değil!",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().Toggles.God_Mode = Value
    end
})

Misc_Tab:CreateToggle({
    Name = "Anti Trail, Safe!",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().Toggles.Anti_Trail = Value
    end
})

-- Bildirim Sekmesi
local Notifications_Tab = Window:CreateTab("Bildirimler", 4483362458)
Notifications_Tab:CreateToggle({
    Name = "Staff Bildirimi",
    CurrentValue = true,
    Callback = function(Value)
        getgenv().Toggles.Staff_Notifications = Value
    end
})

Notifications_Tab:CreateToggle({
    Name = "Oyuncu Bildirimi",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().Toggles.Player_Notifications = Value
    end
})

Notifications_Tab:CreateToggle({
    Name = "Bag Bildirimi",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().Toggles.Bag_Notifications = Value
    end
})

-- UI Başlatma
Library:Notify({
    Title = "UI Yüklendi!",
    Content = "RBLX2PARKOUR başarıyla yüklendi.",
    Duration = 5,
    Image = 4483362458,
    Actions = {
        Ignore = {
            Name = "Tamam",
            Callback = function() end
        }
    }
})
