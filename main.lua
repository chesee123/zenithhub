-- ZenithHub GUI (OrionLib Adapted for PC and Mobile)
-- Author: ты

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Whitelist check
local allowed = {
    [8428035106] = true,
}
if not allowed[LocalPlayer.UserId] then
    game:Shutdown()
    return
end

repeat task.wait() until game:IsLoaded()

-- Load OrionLib
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Mini reopen button (invisible by default)
local openGuiBtn = Instance.new("TextButton")
openGuiBtn.Text = "ZenithHub"
openGuiBtn.Size = UDim2.new(0, 90, 0, 25)
openGuiBtn.Position = UDim2.new(0, 10, 1, -40)
openGuiBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
openGuiBtn.TextColor3 = Color3.new(1, 1, 1)
openGuiBtn.Visible = false
openGuiBtn.ZIndex = 9999
openGuiBtn.Parent = game:GetService("CoreGui")

-- Create main window
local Window = OrionLib:MakeWindow({
    Name = "ZenithHub | Pet Simulator 99",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "ZenithHub",
    IntroText = "ZenithHub Loaded!",
    IntroEnabled = true,
    Centered = true,
    Size = UDim2.new(0, 500, 0, 350),
    CloseCallback = function()
        openGuiBtn.Visible = true
    end
})

-- Tabs list
local tabNames = {
    "Home",
    "Farming Event",
    "AutoFarm",
    "Egg",
    "MiniGames",
    "AutoRank (Soon...)",
    "Webhook",
    "Player",
    "Setting"
}

-- Tabs init
local Tabs = {}
for _, name in ipairs(tabNames) do
    Tabs[name] = Window:MakeTab({
        Name = name,
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
end

-- HOME tab
Tabs["Home"]:AddButton({
    Name = "ZenithHub Discord",
    Callback = function()
        setclipboard("https://discord.gg/yourlink")
    end
})
Tabs["Home"]:AddParagraph("More news on our Discord server!", "")

Tabs["Home"]:AddButton({
    Name = "ZenithHub Premium (soon)",
    Callback = function()
        setclipboard("https://yourshop.link")
    end
})
Tabs["Home"]:AddParagraph("Our premium version updates more often than the regular one!", "")

-- SETTINGS tab
Tabs["Setting"]:AddDropdown({
    Name = "Select Language",
    Default = "EN",
    Options = {"EN", "RU", "UA"},
    Callback = function(Value)
        warn("Selected language: " .. Value)
    end
})

Tabs["Setting"]:AddButton({
    Name = "- Close ZenithHub",
    Callback = function()
        OrionLib:Destroy()
        openGuiBtn.Visible = true
    end
})

-- Restore GUI on button click
openGuiBtn.MouseButton1Click:Connect(function()
    OrionLib:Init()
    openGuiBtn.Visible = false
end)
