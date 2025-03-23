-- Util.lua Güncellenmiş Versiyon

local RankId = 250 
local GroupId = 3468086 

local Util = {}

function Util:CheckStaff(Player)
    return Player:GetRankInGroup(GroupId) >= RankId
end

function Util:Variables()
    if getgenv().Activated then
        pcall(function()
            for _, conn in pairs(getgenv().Connections) do
                if conn then conn:Disconnect() end
            end
        end)
    end

    getgenv().Activated = true
    getgenv().GameVariables = nil
    getgenv().Connections = {
        Input_Began = nil,
        Stepped_RunService = nil,
        Staff_Notification = nil,
        Player_Notification = nil,
    }

    getgenv().Toggles = {
        Infinite_Magrail = false,
        Infinite_Grappler = false,
        Infinite_Adrenaline = false,
        Flow_Active = false,
        Combo_Level = false,
        Infinite_Wallrun = false,
        Infinite_Wallboost = false,
        Infinite_Charge = false,
        Auto_CatchZipline = false,
        Ammo_Reset = false,
        Slide_Speed = false,
        Walk_Speed = false,
        God_Mode = false,
        Anti_Trail = false,
        Anti_Dunce = false,
        Staff_Notifications = false,
        Player_Notifications = false,
        Bag_Notifications = false,
    }

    getgenv().Sliders = {
        Walk_Speed = 1,
        Slide_Speed = 1,
        Combo_Level = 1,
    }

    getgenv().ACB = {
        BanRemotes = {
            "LoadString",
            "HighCombo",
            "FF",
            "SubmitCombo",
            "UpdateCombo",
            "LowCombo",
            "FinishTimeTrial",
            "UpdateDunceList",
        },
        Remotes = {},
    }

    getgenv().Other = {
        Stimmed = false,
        CanZipline = true,
    }
end

return Util
