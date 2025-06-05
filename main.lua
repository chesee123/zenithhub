-- ZenithHub v1.1
-- Автор: ты

-- WhiteList по UserId
local allowed = {
    [8428035106] = true -- добавь сюда другие UserId при необходимости
}
if not allowed[game.Players.LocalPlayer.UserId] then
    game:Shutdown()
    return
end

-- Уведомление при запуске
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "ZenithHub",
        Text = "Запускаем ZenithHub!",
        Duration = 4
    })
end)

-- Подключение Rayfield UI
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Настройки языка
local Languages = {
    ["RU"] = {
        Home = "Главная",
        Setting = "Настройки",
        DiscordTitle = "ZenithHub Discord",
        DiscordDesc = "Больше новостей в нашем Дискорд сервере",
        PremiumTitle = "ZenithHub Premium (скоро)",
        PremiumDesc = "Наша премиум версия будет чаще обновляться чем обычная!",
        ChangeLang = "Сменить язык",
        RU = "Русский",
        EN = "Английский",
        UA = "Украинский"
    },
    ["EN"] = {
        Home = "Home",
        Setting = "Settings",
        DiscordTitle = "ZenithHub Discord",
        DiscordDesc = "Join our Discord server for more updates!",
        PremiumTitle = "ZenithHub Premium (soon)",
        PremiumDesc = "The premium version will update more frequently than the regular one!",
        ChangeLang = "Change Language",
        RU = "Russian",
        EN = "English",
        UA = "Ukrainian"
    },
    ["UA"] = {
        Home = "Головна",
        Setting = "Налаштування",
        DiscordTitle = "ZenithHub Discord",
        DiscordDesc = "Приєднуйтесь до нашого Discord серверу для новин!",
        PremiumTitle = "ZenithHub Premium (незабаром)",
        PremiumDesc = "Преміум версія оновлюватиметься частіше за звичайну!",
        ChangeLang = "Змінити мову",
        RU = "Російська",
        EN = "Англійська",
        UA = "Українська"
    }
}

-- Получаем текущий язык из _G, если установлен
local currentLang = _G.ZH_Lang or "RU"
local lang = Languages[currentLang]

-- Создание главного окна
local Window = Rayfield:CreateWindow({
    Name = "ZenithHub",
    LoadingTitle = "ZenithHub",
    LoadingSubtitle = "by ты",
    ConfigurationSaving = { Enabled = false },
    Discord = { Enabled = false },
    KeySystem = false
})

-- Вкладка Home
local Home = Window:CreateTab(lang.Home, 4483345998)
Home:CreateParagraph({
    Title = lang.DiscordTitle,
    Content = lang.DiscordDesc
})
Home:CreateButton({
    Name = lang.DiscordTitle,
    Callback = function()
        setclipboard("ВСТАВЬ_ССЫЛКУ_НА_DISCORD")
    end
})
Home:CreateParagraph({
    Title = lang.PremiumTitle,
    Content = lang.PremiumDesc
})
Home:CreateButton({
    Name = lang.PremiumTitle,
    Callback = function()
        setclipboard("ВСТАВЬ_ССЫЛКУ_НА_ПРЕМИУМ")
    end
})

-- Вкладка Settings
local Settings = Window:CreateTab(lang.Setting, 4483345998)
Settings:CreateDropdown({
    Name = lang.ChangeLang,
    Options = { lang.RU, lang.EN, lang.UA },
    CurrentOption = lang[currentLang],
    Callback = function(option)
        for key, value in pairs(Languages) do
            if value.RU == option or value.EN == option or value.UA == option then
                _G.ZH_Lang = key
                Rayfield:Notify({
                    Title = "ZenithHub",
                    Content = "Язык изменён. Перезапуск...",
                    Duration = 3
                })
                wait(1)
                loadstring(game:HttpGet("https://raw.githubusercontent.com/cheese123/zenithhub/main/main.lua"))()
                return
            end
        end
    end
})
