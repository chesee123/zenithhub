-- ZenithHub v1.1 (Custom GUI)
-- Автор: ты

-- WhiteList по UserId
local allowed = {
    [8428035106] = true -- добавь других, если нужно
}
if not allowed[game.Players.LocalPlayer.UserId] then
    game:Shutdown()
    return
end

-- Уведомление о запуске
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "ZenithHub",
        Text = "Запускаем ZenithHub!",
        Duration = 4
    })
end)

-- Сервис GUI
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Удаление предыдущего GUI (если есть)
if PlayerGui:FindFirstChild("ZenithHubUI") then
    PlayerGui.ZenithHubUI:Destroy()
end

-- Создание основного GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ZenithHubUI"
ScreenGui.Parent = PlayerGui

-- Создание главной рамки
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- UI Corner
local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 8)

-- ZenithHub Discord
local DiscordBtn = Instance.new("TextButton")
DiscordBtn.Size = UDim2.new(1, -20, 0, 40)
DiscordBtn.Position = UDim2.new(0, 10, 0, 10)
DiscordBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
DiscordBtn.Text = "ZenithHub Discord"
DiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordBtn.Font = Enum.Font.GothamBold
DiscordBtn.TextSize = 20
DiscordBtn.Parent = MainFrame
DiscordBtn.MouseButton1Click:Connect(function()
    setclipboard("ТУТ_ВСТАВЬ_ССЫЛКУ_НА_ДИС")
end)

-- Подтекст к Discord
local DiscordInfo = Instance.new("TextLabel")
DiscordInfo.Size = UDim2.new(1, -20, 0, 20)
DiscordInfo.Position = UDim2.new(0, 10, 0, 55)
DiscordInfo.BackgroundTransparency = 1
DiscordInfo.Text = "Заходите в наш Discord сервер чтоб узнать больше новостей!"
DiscordInfo.TextColor3 = Color3.fromRGB(160, 160, 160)
DiscordInfo.Font = Enum.Font.Gotham
DiscordInfo.TextSize = 12
DiscordInfo.TextXAlignment = Enum.TextXAlignment.Left
DiscordInfo.Parent = MainFrame

-- ZenithHub Premium
local PremiumBtn = Instance.new("TextButton")
PremiumBtn.Size = UDim2.new(1, -20, 0, 40)
PremiumBtn.Position = UDim2.new(0, 10, 0, 85)
PremiumBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
PremiumBtn.Text = "ZenithHub Premium (soon)"
PremiumBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PremiumBtn.Font = Enum.Font.GothamBold
PremiumBtn.TextSize = 20
PremiumBtn.Parent = MainFrame
PremiumBtn.MouseButton1Click:Connect(function()
    setclipboard("ТУТ_ВСТАВЬ_ССЫЛКУ_НА_ШОП")
end)

-- Подтекст к Premium
local PremiumInfo = Instance.new("TextLabel")
PremiumInfo.Size = UDim2.new(1, -20, 0, 20)
PremiumInfo.Position = UDim2.new(0, 10, 0, 130)
PremiumInfo.BackgroundTransparency = 1
PremiumInfo.Text = "Премиум версия будет обновляться чаще чем обычная версия!"
PremiumInfo.TextColor3 = Color3.fromRGB(160, 160, 160)
PremiumInfo.Font = Enum.Font.Gotham
PremiumInfo.TextSize = 12
PremiumInfo.TextXAlignment = Enum.TextXAlignment.Left
PremiumInfo.Parent = MainFrame

-- Кнопка Настройки
local SettingsBtn = Instance.new("TextButton")
SettingsBtn.Size = UDim2.new(0, 120, 0, 30)
SettingsBtn.Position = UDim2.new(1, -130, 1, -40)
SettingsBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SettingsBtn.Text = "Настройки"
SettingsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingsBtn.Font = Enum.Font.Gotham
SettingsBtn.TextSize = 14
SettingsBtn.Parent = MainFrame

-- Меню настроек
local SettingsFrame = Instance.new("Frame")
SettingsFrame.Size = UDim2.new(0, 200, 0, 100)
SettingsFrame.Position = UDim2.new(0.5, -100, 0.5, -50)
SettingsFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
SettingsFrame.Visible = false
SettingsFrame.Parent = MainFrame
local SettingsCorner = Instance.new("UICorner", SettingsFrame)
SettingsCorner.CornerRadius = UDim.new(0, 8)

-- Кнопка смены языка
local LangBtn = Instance.new("TextButton")
LangBtn.Size = UDim2.new(1, -20, 0, 30)
LangBtn.Position = UDim2.new(0, 10, 0, 10)
LangBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
LangBtn.Text = "Сменить язык"
LangBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LangBtn.Font = Enum.Font.Gotham
LangBtn.TextSize = 14
LangBtn.Parent = SettingsFrame
LangBtn.MouseButton1Click:Connect(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "ZenithHub",
        Text = "1 - Русский, 2 - English, 3 - Українська",
        Duration = 5
    })
    local conn
    conn = LocalPlayer.Chatted:Connect(function(msg)
        if msg == "1" then
            game.StarterGui:SetCore("SendNotification", {Title = "ZenithHub", Text = "Язык изменён на Русский", Duration = 3})
        elseif msg == "2" then
            game.StarterGui:SetCore("SendNotification", {Title = "ZenithHub", Text = "Language set to English", Duration = 3})
        elseif msg == "3" then
            game.StarterGui:SetCore("SendNotification", {Title = "ZenithHub", Text = "Мову змінено на Українську", Duration = 3})
        end
        conn:Disconnect()
    end)
end)

-- Открытие/закрытие настроек
SettingsBtn.MouseButton1Click:Connect(function()
    SettingsFrame.Visible = not SettingsFrame.Visible
end)
