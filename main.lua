-- ZenithHub GUI 
-- by 

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

-- Языки
local currentLang = "RU"
local Languages = {
    RU = {
        DiscordTitle = "ZenithHub Discord",
        DiscordDesc = "Больше новостей в нашем Discord сервере!",
        PremiumTitle = "ZenithHub Premium (soon)",
        PremiumDesc = "Наша премиум версия будет чаще обновляться чем обычная!",
        Tabs = {
            "Главная", "Фарминг Ивент", "АвтоФарм", "Яйца",
            "Миниигры", "АвтоРанг (Бета)", "Почта",
            "Автоматизация", "Вебхук", "Игрок", "Настройки"
        }
    },
    EN = {
        DiscordTitle = "ZenithHub Discord",
        DiscordDesc = "More news in our Discord server!",
        PremiumTitle = "ZenithHub Premium (soon)",
        PremiumDesc = "Our premium version will update more often than the regular one!",
        Tabs = {
            "Home", "Farming Event", "AutoFarm", "Eggs",
            "Minigames", "AutoRank (Beta)", "MailBox",
            "Automation", "Webhook", "Player", "Settings"
        }
    },
    UA = {
        DiscordTitle = "ZenithHub Discord",
        DiscordDesc = "Більше новин на нашому Discord сервері!",
        PremiumTitle = "ZenithHub Premium (незабаром)",
        PremiumDesc = "Наша преміум версія буде оновлюватись частіше, ніж звичайна!",
        Tabs = {
            "Головна", "Івент Фармінг", "АвтоФарм", "Яйця",
            "Мініігри", "АвтоРанг (Бета)", "Пошта",
            "Автоматизація", "Вебхук", "Гравець", "Налаштування"
        }
    }
}
local lang = Languages[currentLang]

-- Уведомление при запуске
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "ZenithHub",
        Text = "Запускаем ZenithHub!",
        Duration = 4
    })
end)

-- Подключение CatLib
loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/CatLib/CatLib.lua"))()

local Window = CatLib:CreateWindow({
    Name = "ZenithHub | Pet Simulator 99",
    Theme = CatLib.Themes.Dark,
    Size = UDim2.new(0, 700, 0, 480),
    Position = UDim2.new(0.5, -350, 0.5, -240)
})

-- Таб-меню
local TabList = lang.Tabs
local Tabs = {}

for _, tabName in ipairs(TabList) do
    Tabs[tabName] = Window:CreateTab(tabName)
end

-- Главная
local HomeTab = Tabs[lang.Tabs[1]]
HomeTab:CreateLabel(lang.DiscordTitle, function()
    setclipboard("https://discord.gg/yourdiscord") -- ← вставь свой Discord
end)
HomeTab:CreateParagraph(lang.DiscordDesc)
HomeTab:CreateLabel(lang.PremiumTitle, function()
    setclipboard("https://yourshop.link") -- ← вставь свой фанпей/шоп
end)
HomeTab:CreateParagraph(lang.PremiumDesc)

-- Настройки
local SettingsTab = Tabs[lang.Tabs[#lang.Tabs]]
SettingsTab:CreateDropdown({
    Title = "Сменить язык",
    Options = {"RU", "EN", "UA"},
    Callback = function(selected)
        currentLang = selected
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cheese123/zenithhub/main/main.lua"))() -- загрузка с новым языком
    end
})
