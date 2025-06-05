-- ZenithHub GUI (OrionLib Adapted for PC and Mobile)
-- Author: ты

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Whitelist check
local allowed = {
    [8428035106] = true, -- твой UserId
}
if not allowed[LocalPlayer.UserId] then
    game:Shutdown()
    return
end

repeat task.wait() until game:IsLoaded()

-- Load OrionLib
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Main GUI
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

-- Show button when closed
local openGuiBtn = Instance.new("TextButton")
openGuiBtn.Text = "ZenithHub"
openGuiBtn.Size = UDim2.new(0, 100, 0, 30)
openGuiBtn.Position = UDim2.new(0, 10, 1, -40)
openGuiBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
openGuiBtn.TextColor3 = Color3.new(1, 1, 1)
openGuiBtn.Visible = false
openGuiBtn.Parent = game:GetService("CoreGui")

-- Tabs
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

local Tabs = {}
for _, name in ipairs(tabNames) do
    Tabs[name] = Window:MakeTab({
        Name = name,
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
end

-- HOME
Tabs["Home"]:AddButton({
    Name = "ZenithHub Discord",
    Callback = function()
        setclipboard("https://discord.gg/yourlink") -- вставь свою ссылку
    end
})
Tabs["Home"]:AddParagraph("More news on our Discord server!", "")

Tabs["Home"]:AddButton({
    Name = "ZenithHub Premium (soon)",
    Callback = function()
        setclipboard("https://yourshop.link") -- вставь свою ссылку
    end
})
Tabs["Home"]:AddParagraph("Our premium version updates more often than the regular one!", "")

-- SETTINGS
Tabs["Setting"]:AddDropdown({
    Name = "Select Language",
    Default = "EN",
    Options = {"EN", "RU", "UA"},
    Callback = function(Value)
        warn("Selected language: " .. Value)
        -- Здесь ты можешь добавить reload GUI
    end
})

-- CLOSE GUI BUTTON
Tabs["Setting"]:AddButton({
    Name = "- Close ZenithHub",
    Callback = function()
        OrionLib:Destroy()
        openGuiBtn.Visible = true
    end
})

-- REOPEN GUI BUTTON
openGuiBtn.MouseButton1Click:Connect(function()
    OrionLib:Init()
    openGuiBtn.Visible = false
end)
