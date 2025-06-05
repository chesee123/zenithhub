-- ZenithHub GUI (Kavo UI Mobile/PC Version)
-- Author: ты

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Whitelist
local allowed = {
    [8428035106] = true,
}
if not allowed[LocalPlayer.UserId] then
    game:Shutdown()
    return
end

-- Notify at start
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "ZenithHub",
        Text = "Launching ZenithHub!",
        Duration = 4
    })
end)

-- English only
local TabsList = {
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

-- UI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("ZenithHub | Pet Simulator 99", "DarkTheme")

-- Tabs
local Tabs = {}
for _, tabName in ipairs(TabsList) do
    Tabs[tabName] = Window:NewTab(tabName)
end

-- Home
local HomeSection = Tabs["Home"]:NewSection("Information")
HomeSection:NewButton("ZenithHub Discord", "More news on our Discord server!", function()
    setclipboard("https://discord.gg/yourlink") -- вставь ссылку
end)
HomeSection:NewButton("ZenithHub Premium (soon)", "Premium gets more frequent updates!", function()
    setclipboard("https://yourshop.link") -- вставь ссылку
end)

-- Setting
local SettingsSection = Tabs["Setting"]:NewSection("Interface")
SettingsSection:NewDropdown("Change language", "Select interface language", {"RU", "EN", "UA"}, function(selectedLang)
    print("Language selected:", selectedLang)
    -- Здесь можно реализовать смену языка
end)
