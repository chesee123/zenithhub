-- ZenithHub v2.0 (на базе OrionLib, кастомный стиль)
-- Автор: ты

-- WhiteList по UserId
local allowed = {
    [8428035106] = true -- добавь сюда других, если нужно
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

-- Подключение OrionLib
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Настройки языка
local Languages = {
    ["RU"] = {
        Home = "Главная",
        Discord = "ZenithHub Discord",
        DiscordDesc = "Больше новостей в нашем Discord сервере!",
        Premium = "ZenithHub Premium (скоро)",
        PremiumDesc = "Премиум будет обновляться чаще обычной версии!",
        Language = "Сменить язык",
        RU = "Русский",
        EN = "Английский",
        UA = "Украинский"
    },
    ["EN"] = {
        Home = "Home",
        Discord = "ZenithHub Discord",
        DiscordDesc = "Join our Discord for more news!",
        Premium = "ZenithHub Premium (soon)",
        PremiumDesc = "Premium version updates faster than free!",
        Language = "Change Language",
        RU = "Russian",
        EN = "English",
        UA = "Ukrainian"
    },
    ["UA"] = {
        Home = "Головна",
        Discord = "ZenithHub Discord",
        DiscordDesc = "Долучайтесь до Discord, щоб дізнатись більше!",
        Premium = "ZenithHub Premium (незабаром)",
        PremiumDesc = "Преміум оновлюється частіше звичайного!",
        Language = "Змінити мову",
        RU = "Російська",
        EN = "Англійська",
        UA = "Українська"
    }
}

local currentLang = "RU"
local lang = Languages[currentLang]

-- Создание окна
local Window = OrionLib:MakeWindow({
    Name = "ZenithHub",
    HidePremium = true,
    SaveConfig = false,
    IntroText = "ZenithHub"
})

-- Главная вкладка
local HomeTab = Window:MakeTab({
    Name = lang.Home,
    Icon = "",
    PremiumOnly = false
})

-- Кликабельный Discord текст (имитирован как кнопка без рамки)
HomeTab:AddParagraph(lang.Discord, lang.DiscordDesc)
HomeTab:AddButton({
    Name = " ",
    Callback = function()
        setclipboard("https://your-discord-link")
        OrionLib:MakeNotification({
            Name = "ZenithHub",
            Content = "Ссылка на Discord скопирована!",
            Time = 3
        })
    end
})

-- Премиум блок
HomeTab:AddParagraph(lang.Premium, lang.PremiumDesc)
HomeTab:AddButton({
    Name = " ",
    Callback = function()
        setclipboard("https://your-premium-link")
        OrionLib:MakeNotification({
            Name = "ZenithHub",
            Content = "Ссылка на Premium скопирована!",
            Time = 3
        })
    end
})

-- Вкладка настроек
local SettingsTab = Window:MakeTab({
    Name = "Settings",
    Icon = "",
    PremiumOnly = false
})

-- Меню смены языка (мини подменю)
SettingsTab:AddDropdown({
    Name = lang.Language,
    Options = {"RU", "EN", "UA"},
    CurrentOption = currentLang,
    Callback = function(option)
        currentLang = option
        lang = Languages[currentLang]
        OrionLib:MakeNotification({
            Name = "ZenithHub",
            Content = "Язык обновлён: " .. lang[option],
            Time = 3
        })
        wait(1)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cheese123/zenithhub/main/main.lua"))()
    end
})
