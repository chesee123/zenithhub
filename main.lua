-- ZenithHub GUI (Adapted OrionLib)
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

-- Уведомление при запуске
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "ZenithHub",
        Text = "Запускаем ZenithHub!",
        Duration = 4
    })
end)

-- Подключаем OrionLib адаптированную
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local Window = OrionLib:MakeWindow({
    Name = "ZenithHub | Pet Simulator 99",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "ZenithHubConfig",
    IntroText = "ZenithHub запускается...",
    IntroEnabled = true
})

-- Список вкладок (обновлён)
local Tabs = {
    "Home",
    "Farming Event",
    "AutoFarm",
    "Egg",
    "MiniGames",
    "AutoRank (Soon...)",
    -- "Gmail", -- удалена
    "Webhook",
    "Player",
    "Setting"
}

local TabObjects = {}
for _, name in ipairs(Tabs) do
    TabObjects[name] = Window:MakeTab({
        Name = name,
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
end

-- Главная
TabObjects["Home"]:AddButton({
    Name = "ZenithHub Discord\n> Больше новостей в нашем Discord сервере!",
    Callback = function()
        setclipboard("https://discord.gg/yourlink")
    end
})
TabObjects["Home"]:AddButton({
    Name = "ZenithHub Premium (soon)\n> Наша премиум версия будет чаще обновляться чем обычная!",
    Callback = function()
        setclipboard("https://yourshop.link")
    end
})

-- Настройки
TabObjects["Setting"]:AddDropdown({
    Name = "Change Language",
    Default = "RU",
    Options = {"RU", "EN", "UA"},
    Callback = function(value)
        print("Выбран язык: "..value)
    end
})

-- Кнопка закрытия и возврата
local minimized = false
local MiniGui = Instance.new("ScreenGui", game.CoreGui)
MiniGui.Name = "ZenithHubMini"

local Button = Instance.new("TextButton", MiniGui)
Button.Text = "ZenithHub"
Button.Size = UDim2.new(0, 90, 0, 25)
Button.Position = UDim2.new(0, 10, 1, -35)
Button.BackgroundColor3 = Color3.fromRGB(30,30,30)
Button.TextColor3 = Color3.fromRGB(255,255,255)
Button.Visible = false

OrionLib:MakeNotification({
    Name = "Готово!",
    Content = "GUI загружено успешно.",
    Image = "rbxassetid://4483345998",
    Time = 5
})

-- Закрыть
Window:MakeTab({
    Name = "-",
    Icon = "rbxassetid://7072719332",
    PremiumOnly = false
}):AddButton({
    Name = "Закрыть скрипт",
    Callback = function()
        for _, v in pairs(game.CoreGui:GetChildren()) do
            if v.Name:find("Orion") then
                v:Destroy()
            end
        end
        Button.Visible = true
    end
})

-- Вернуть окно
Button.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://yourcdn.com/zenithhub.lua"))() -- Укажи свой URL
end)
