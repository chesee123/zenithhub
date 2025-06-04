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

-- Подключение Rayfield UI
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Настройки языка
local Languages = {
    ["RU"] = {
        TabName = "Главная",
        ButtonName = "Переводчик",
        Notify = "Язык изменён на русский"
    },
    ["EN"] = {
        TabName = "Home",
        ButtonName = "Translator",
        Notify = "Language switched to English"
    },
    ["UA"] = {
        TabName = "Головна",
        ButtonName = "Перекладач",
        Notify = "Мову змінено на українську"
    }
}

-- Текущий язык
local currentLang = "RU"
local lang = Languages[currentLang]

-- Создание окна
local Window = Rayfield:CreateWindow({
	Name = "ZenithHub",
	LoadingTitle = "ZenithHub",
	LoadingSubtitle = "by ты",
	ConfigurationSaving = {
		Enabled = false
	},
	Discord = {
		Enabled = false
	},
	KeySystem = false
})

-- Главная вкладка
local MainTab = Window:CreateTab(lang.TabName, 4483345998)

-- Кнопка перевода
MainTab:CreateButton({
	Name = lang.ButtonName,
	Callback = function()
		Rayfield:Notify({
			Title = "ZenithHub",
			Content = "Выбери язык в чате: 1 - Рус, 2 - Англ, 3 - Укр",
			Duration = 6
		})

		local connection
		connection = game.Players.LocalPlayer.Chatted:Connect(function(msg)
			if msg == "1" then currentLang = "RU"
			elseif msg == "2" then currentLang = "EN"
			elseif msg == "3" then currentLang = "UA"
			else return end

			connection:Disconnect()
			Rayfield:Notify({
				Title = "ZenithHub",
				Content = Languages[currentLang].Notify,
				Duration = 4
			})
			wait(1)
			loadstring(game:HttpGet("https://raw.githubusercontent.com/cheese123/zenithhub/main/main.lua"))()
		end)
	end
})
