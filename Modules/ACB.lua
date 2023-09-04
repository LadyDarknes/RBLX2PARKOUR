-- Services
local Players = game:GetService("Players")

-- Locals
local Player = Players.LocalPlayer

local Points_Script = Player.PlayerScripts.Points
local Points_Env = getsenv(Points_Script)
local Points_EnvIM = rawget(getrawmetatable(Points_Env), "__index")
local Points_Func = rawget(rawget(Points_EnvIM, "shared"), "triggerPointsFunction")

local GMT = getrawmetatable(game)
setreadonly(GMT, false)
local OLD = GMT.__namecall

-- ACB
local ACB = {}

function ACB.Init()
    if Points_Func and type(Points_Func) == 'function' then
        local FuncTable
        for _, Table in pairs(debug.getupvalues(Points_Func)) do
            if type(Table) == 'table' and rawget(Table, 'parkour') and rawget(Table, 'statAdd') and rawget(Table, 'missionTrigger') then
                FuncTable = Table
                break
            end
        end
    
        if FuncTable then
            for Name, Func in pairs(FuncTable) do
                for _, Remote in pairs(debug.getupvalues(Func)) do
                    if Remote.ClassName == 'RemoteEvent' then
                        getgenv().ACB.Remotes[Name] = Remote
                        break
                    end
                end
            end
        end
    end

    GMT.__namecall = newcclosure(function(self, ...)
        local Method = getnamecallmethod()

        if Method == "FireServer" and table.find(getgenv().ACB.BanRemotes, self.Name) then
            return nil
        elseif Method == "InvokeServer" and table.find(getgenv().ACB.BanRemotes, self.Name) then
            return nil
        elseif Method == "FireServer" and self == getgenv().ACB.Remotes.statAdd then
            return nil
        elseif Method == "FireServer" and self.Name == "SetTrail" and getgenv().Toggles.Anti_Trail == true then 
            return nil
        elseif Method == "TakeDamage" and self.ClassName and getgenv().Toggles.God_Mode == true then
            return nil 
        end

        return OLD(self, ...)
    end)
end

-- Return
return ACB