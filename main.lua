-- ZenithHub v1.1
-- Автор:

-- WhiteList по UserId
local allowed = {
    [8428035106] = true -- добавляй других по необходимости
}
if not allowed[game.Players.LocalPlayer.UserId] then
    game:Shutdown()
    return
end

-- Уведомление при запуске
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "ZenithHub",
        Text = "Добро пожаловать!",
        Duration = 4
    })
end)

-- Подключение OrionLib
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Настройки языка
local Languages = {
    ["RU"] = {
        WindowName = "ZenithHub",
        TabName = "Главная",
        ButtonName = "Переводчик",
        Notify = "Язык изменён на русский"
    },
    ["EN"] = {
        WindowName = "ZenithHub",
        TabName = "Home",
        ButtonName = "Translator",
        Notify = "Language switched to English"
    },
    ["UA"] = {
        WindowName = "ZenithHub",
        TabName = "Головна",
        ButtonName = "Перекладач",
        Notify = "Мову змінено на українську"
    }
}

-- Текущий язык
local currentLang = "RU"
local lang = Languages[currentLang]

-- Создание окна
local Window = OrionLib:MakeWindow({
    Name = lang.WindowName,
    HidePremium = false,
    SaveConfig = false,
    IntroText = lang.WindowName
})

-- Главная вкладка
local Tab = Window:MakeTab({
	Name = lang.TabName,
	Icon = "",
	PremiumOnly = false
})

-- Переводчик
Tab:AddButton({
	Name = lang.ButtonName,
	Callback = function()
		OrionLib:MakeNotification({
			Name = "ZenithHub",
			Content = "Выбери язык:\n1 - Русский\n2 - English\n3 - Українська",
			Image = "",
			Time = 6
		})

		local player = game.Players.LocalPlayer
		local inputConnection
		inputConnection = player.Chatted:Connect(function(msg)
			if msg == "1" then
				currentLang = "RU"
			elseif msg == "2" then
				currentLang = "EN"
			elseif msg == "3" then
				currentLang = "UA"
			else
				return
			end

			inputConnection:Disconnect()
			OrionLib:MakeNotification({
				Name = "ZenithHub",
				Content = Languages[currentLang].Notify,
				Image = "",
				Time = 3
			})
			wait(1)
			loadstring(game:HttpGet("https://raw.githubusercontent.com/cheese123/zenithhub/main/main.lua"))()
		end)
	end
})
