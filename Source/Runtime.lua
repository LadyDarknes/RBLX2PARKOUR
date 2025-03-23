-- Runtime.lua Güncellenmiş Versiyon

local function Import_Files()
    if isfolder("RBLX2PARKOUR") then
        delfolder("RBLX2PARKOUR")
        Import_Files()
        return
    end

    makefolder("RBLX2PARKOUR")
    makefolder("RBLX2PARKOUR/Modules")
    makefolder("RBLX2PARKOUR/Source")

    writefile("RBLX2PARKOUR/Modules/Util.lua", game:HttpGetAsync("https://raw.githubusercontent.com/LadyDarknes/RBLX2PARKOUR/main/Modules/Util.lua"))
    writefile("RBLX2PARKOUR/Modules/UI.lua", game:HttpGetAsync("https://raw.githubusercontent.com/LadyDarknes/RBLX2PARKOUR/main/Modules/UI.lua"))
    writefile("RBLX2PARKOUR/Modules/ACB.lua", game:HttpGetAsync("https://raw.githubusercontent.com/LadyDarknes/RBLX2PARKOUR/main/Modules/ACB.lua"))
    writefile("RBLX2PARKOUR/Source/Runtime.lua", game:HttpGetAsync("https://raw.githubusercontent.com/LadyDarknes/RBLX2PARKOUR/main/Source/Runtime.lua"))
end

local function Init()
    Import_Files()

    repeat
        task.wait()
    until isfile("RBLX2PARKOUR/Source/Runtime.lua")

    local Runtime = loadstring(readfile("RBLX2PARKOUR/Source/Runtime.lua"))()
    Runtime.Init()
end

Init()
