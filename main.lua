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
        Text = "Запускаем ZenithHub!",
        Duration = 4
    })
end)

-- Языки
local currentLang = "RU"
local Languages = {
    RU = {
        DiscordTitle = "ZenithHub Discord",
        DiscordDesc = "Больше новостей в нашем Discord сервере!",
        PremiumTitle = "ZenithHub Premium (soon)",
        PremiumDesc = "Наша премиум версия будет чаще обновляться чем обычная!",
        Tabs = {
            "Главная",
            "Фарминг Ивент",
            "АвтоФарм",
            "Яйца",
            "Миниигры",
            "АвтоРанг (Бета)",
            "Почта",
            "Автоматизация",
            "Вебхук",
            "Игрок",
            "Настройки"
        }
    }
}
local lang = Languages[currentLang]

-- Подключаем Kavo UI Mobile/PC адаптированную
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("ZenithHub | Pet Simulator 99", "DarkTheme")

-- Создаем вкладки
local Tabs = {}
for _, tabName in ipairs(lang.Tabs) do
    Tabs[tabName] = Window:NewTab(tabName)
end

-- Главная
local HomeSection = Tabs["Главная"]:NewSection("Информация")
HomeSection:NewButton(lang.DiscordTitle, lang.DiscordDesc, function()
    setclipboard("https://discord.gg/yourlink") -- вставь свою ссылку
end)
HomeSection:NewButton(lang.PremiumTitle, lang.PremiumDesc, function()
    setclipboard("https://yourshop.link") -- вставь свою ссылку
end)

-- Настройки
local SettingsSection = Tabs["Настройки"]:NewSection("Настройки GUI")
SettingsSection:NewDropdown("Сменить язык", "Выберите язык интерфейса", {"RU", "EN", "UA"}, function(selectedLang)
    print("Выбран язык:", selectedLang)
    -- Здесь можешь реализовать полную перезагрузку GUI
end)
