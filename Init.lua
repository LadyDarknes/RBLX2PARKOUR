-- Init.lua Güncellenmiş Versiyon

local function Import_Files()
    if isfolder("RBLX2PARKOUR") then
        delfolder("RBLX2PARKOUR")
        task.wait(0.1)
    end

    makefolder("RBLX2PARKOUR")
    makefolder("RBLX2PARKOUR/Modules")
    makefolder("RBLX2PARKOUR/Source")

    local files = {
        ["Modules/Util.lua"] = "https://raw.githubusercontent.com/LadyDarknes/RBLX2PARKOUR/main/Modules/Util.lua",
        ["Modules/UI.lua"] = "https://raw.githubusercontent.com/LadyDarknes/RBLX2PARKOUR/main/Modules/UI.lua",
        ["Modules/ACB.lua"] = "https://raw.githubusercontent.com/LadyDarknes/RBLX2PARKOUR/main/Modules/ACB.lua",
        ["Source/Runtime.lua"] = "https://raw.githubusercontent.com/LadyDarknes/RBLX2PARKOUR/main/Source/Runtime.lua"
    }

    for path, url in pairs(files) do
        local success, response = pcall(game.HttpGet, game, url)
        if success and response then
            writefile("RBLX2PARKOUR/" .. path, response)
        else
            warn("Dosya indirilemedi: " .. path)
        end
    end
end

local function Init()
    Import_Files()

    repeat
        task.wait()
    until isfile("RBLX2PARKOUR/Source/Runtime.lua")

    local success, Runtime = pcall(loadstring, readfile("RBLX2PARKOUR/Source/Runtime.lua"))
    if success and Runtime then
        Runtime.Init()
    else
        warn("Runtime.lua yüklenirken hata oluştu!")
    end
end

Init()
