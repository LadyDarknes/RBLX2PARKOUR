-- ACB.lua Güncellenmiş Versiyon

-- Servisler
local Players = game:GetService("Players")

-- Lokal değişkenler
local Player = Players.LocalPlayer

local success, Points_Script = pcall(function()
    return Player.PlayerScripts:FindFirstChild("Points")
end)

if not success or not Points_Script then
    warn("Points scripti bulunamadı!")
    return
end

local success, Points_Env = pcall(getsenv, Points_Script)
if not success then
    warn("Points ortamı alınamadı!")
    return
end

local Points_EnvIM = rawget(getrawmetatable(Points_Env), "__index")
local Points_Func = Points_EnvIM and rawget(rawget(Points_EnvIM, "shared"), "triggerPointsFunction")

local GMT = getrawmetatable(game)
setreadonly(GMT, false)
local OLD = GMT.__namecall

-- Anti Cheat Bypass
local ACB = {}

function ACB.Init()
    if Points_Func and type(Points_Func) == "function" then
        local FuncTable
        for _, Table in pairs(debug.getupvalues(Points_Func)) do
            if type(Table) == "table" and rawget(Table, "parkour") and rawget(Table, "statAdd") and rawget(Table, "missionTrigger") then
                FuncTable = Table
                break
            end
        end

        if FuncTable then
            for Name, Func in pairs(FuncTable) do
                for _, Remote in pairs(debug.getupvalues(Func)) do
                    if typeof(Remote) == "Instance" and Remote:IsA("RemoteEvent") then
                        getgenv().ACB.Remotes[Name] = Remote
                        break
                    end
                end
            end
        end
    end

    GMT.__namecall = newcclosure(function(self, ...)
        local Method = getnamecallmethod()

        if Method == "FireServer" or Method == "InvokeServer" then
            if table.find(getgenv().ACB.BanRemotes, self.Name) then
                return nil
            end
        end

        if Method == "FireServer" then
            if self == getgenv().ACB.Remotes.statAdd then
                return nil
            elseif self.Name == "SetTrail" and getgenv().Toggles.Anti_Trail then
                return nil
            end
        end

        if Method == "TakeDamage" and self.ClassName and getgenv().Toggles.God_Mode then
            return nil
        end

        return OLD(self, ...)
    end)
end

return ACB
