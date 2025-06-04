-- ZenithHub v1.0 

-- WhiteList по UserId
local allowed = {
    [8428035106] = true -- добавь других если надо
}
if not allowed[game.Players.LocalPlayer.UserId] then
    game:Shutdown()
    return
end

-- Уведомление при запуске
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "ZenithHub",
        Text = "Запуск кастомного GUI...",
        Duration = 4
    })
end)

-- Подключение Rayfield
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Настройки интерфейса
local Window = Rayfield:CreateWindow({
	Name = "ZenithHub | Pet Simulator 99",
	LoadingTitle = "ZenithHub",
	LoadingSubtitle = "Custom Zap-like UI by ты",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "ZenithHub",
		FileName = "zapstyle_ui"
	},
	Discord = {
		Enabled = false
	},
	KeySystem = false
})

-- Языки
local Languages = {
    ["RU"] = {
        Tabs = {
            Main = "Главная",
            Farm = "Фарм",
            Teleport = "Телепорт",
            Player = "Игрок",
            Misc = "Разное"
        },
        Notify = "Язык: Русский"
    },
    ["EN"] = {
        Tabs = {
            Main = "Home",
            Farm = "Farm",
            Teleport = "Teleport",
            Player = "Player",
            Misc = "Misc"
        },
        Notify = "Language: English"
    },
    ["UA"] = {
        Tabs = {
            Main = "Головна",
            Farm = "Фарм",
            Teleport = "Телепорт",
            Player = "Гравець",
            Misc = "Різне"
        },
        Notify = "Мова: Українська"
    }
}

-- Язык по умолчанию
local currentLang = "RU"
local lang = Languages[currentLang]

-- Создание вкладок
local tabs = {}
for key, name in pairs(lang.Tabs) do
    tabs[key] = Window:CreateTab(name, 4483345998)
end

-- Пример кнопки в Главной вкладке
tabs.Main:CreateButton({
	Name = "Сменить язык",
	Callback = function()
		Rayfield:Notify({
			Title = "ZenithHub",
			Content = "Напиши в чат: 1 - Рус, 2 - Англ, 3 - Укр",
			Duration = 5
		})

		local chatConnection
		chatConnection = game.Players.LocalPlayer.Chatted:Connect(function(msg)
			if msg == "1" then currentLang = "RU"
			elseif msg == "2" then currentLang = "EN"
			elseif msg == "3" then currentLang = "UA"
			else return end

			chatConnection:Disconnect()
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

-- Можешь добавлять свои функции вот так:
-- tabs.Farm:CreateToggle({...})
-- tabs.Teleport:CreateDropdown({...})

-- Добро пожаловать
Rayfield:Notify({
	Title = "ZenithHub",
	Content = "Интерфейс успешно загружен",
	Duration = 5
})
