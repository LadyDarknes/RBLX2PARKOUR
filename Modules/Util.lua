
local RankId = 250 
local GroupId = 3468086 


local Util = {}

function Util:CheckStaff(Player)
    if Player:GetRankInGroup(GroupId) >= RankId then
        return true
    else
        return false
    end
end

function Util:Variables()
    if getgenv().Activated == true then
        pcall(function()
            getgenv().Connections.Input_Began:Disconnect()
            getgenv().Connections.Stepped_RunService:Disconnect()
            getgenv().Connections.Staff_Notification:Disconnect()
            getgenv().Connections.Player_Notification:Disconnect()
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

        -- Adrenalin
        Infinite_Adrenaline = false,

        -- kombo
        Flow_Active = false,
        Combo_Level = false,

        -- Gearless dash
        Infinite_Wallrun = false,
        Infinite_Wallboost = false,
        Infinite_Charge = false,
        Auto_CatchZipline = false,
        Ammo_Reset = false,
        Slide_Speed = false,
        Walk_Speed = false,

        -- Misc
        God_Mode = false,
        Anti_Trail = false,
        Anti_Dunce = false,

        -- bildirimler
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

-- Return
return Util
