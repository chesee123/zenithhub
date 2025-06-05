-- ZenithHub GUI (CatLib UI Version)
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

-- Language config
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

-- Подключаем CatLib UI безопасно
loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/CatLib/CatLib.lua"))()

repeat task.wait() until CatLib and CatLib.CreateWindow

-- Окно
local Window = CatLib:CreateWindow({
    Name = "ZenithHub | Pet Simulator 99",
    Theme = CatLib.Themes.Dark,
    Size = UDim2.new(0, 700, 0, 500),
    Position = UDim2.new(0.5, -350, 0.5, -250)
})

-- Табуляция
local Tabs = {}
for _, tabName in ipairs(lang.Tabs) do
    Tabs[tabName] = Window:CreateTab(tabName)
end

-- Главная вкладка
local HomeTab = Tabs["Главная"]
HomeTab:CreateLabel(lang.DiscordTitle, function()
    setclipboard("https://discord.gg/yourlink") -- ВСТАВЬ СВОЙ ЛИНК
end)
HomeTab:CreateParagraph(lang.DiscordDesc)
HomeTab:CreateLabel(lang.PremiumTitle, function()
    setclipboard("https://yourshop.link") -- ВСТАВЬ СВОЙ ЛИНК
end)
HomeTab:CreateParagraph(lang.PremiumDesc)

-- Настройки
local SettingsTab = Tabs["Настройки"]
SettingsTab:CreateLabel("Сменить язык")
SettingsTab:CreateDropdown({
    Title = "Выбери язык",
    Options = {"RU", "EN", "UA"},
    Callback = function(selectedLang)
        setclipboard("https://github.com/cheese123/zenithhub") -- можно перезагрузить с новым языком
        warn("Выбран язык:", selectedLang)
    end
})
