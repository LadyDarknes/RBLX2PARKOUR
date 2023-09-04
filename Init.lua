local RarityColours = {
    ["Common"] = Color3.fromRGB(73, 30, 30), -- Brown
    ["Uncommon"] = Color3.fromRGB(0, 214, 0), -- Green
    ["Rare"] = Color3.fromRGB(51, 18, 112), -- Purple
    ["Epic"] = Color3.fromRGB(5, 154, 168), -- Blue
    ["Legendary"] = Color3.fromRGB(254, 254, 0), -- Yellow
    ["Ultimate"] = Color3.fromRGB(255, 0, 0), -- Red
    ["Resplendent"] = Color3.fromRGB(255, 255, 255), -- White
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
        -- Making sure we're only looking at the bags
        if Bag.ClassName ~= "Model" then continue; end
        if not Bag:FindFirstChild("BagTouchScript") then continue; end

        -- Deleting the old BillboardGui if it exists
        if Bag.Main:FindFirstChild("BillboardGui") then 
            Bag.Main:FindFirstChild("BillboardGui"):Destroy(); 
        end

        if getgenv().enabled then
            AddBillboard(Bag.Main);
        end
    end

    wait(2);
end

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
