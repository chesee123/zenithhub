-- ZenithHub 

-- WhiteList по UserId
local allowed = {
    [8428035106] = true -- добавь других при необходимости
}
if not allowed[game.Players.LocalPlayer.UserId] then
    game:Shutdown()
    return
end

-- Приветствие при запуске
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "ZenithHub",
        Text = "Запускаем ZenithHub!",
        Duration = 4
    })
end)

-- Перевод (на будущее, пока RU по умолчанию)
local currentLang = "RU"
local Lang = {
    ["RU"] = {
        Home = "Главная",
        Discord = "ZenithHub Discord",
        DiscordSub = "Больше новостей в нашем Дискорд сервере!",
        Premium = "ZenithHub Premium (soon)",
        PremiumSub = "Премиум версия будет обновляться чаще чем обычная версия!",
        ChangeLang = "Сменить язык"
    },
    ["EN"] = {
        Home = "Home",
        Discord = "ZenithHub Discord",
        DiscordSub = "More news on our Discord server!",
        Premium = "ZenithHub Premium (soon)",
        PremiumSub = "Premium version will update more frequently!",
        ChangeLang = "Change Language"
    },
    ["UA"] = {
        Home = "Головна",
        Discord = "ZenithHub Discord",
        DiscordSub = "Більше новин у нашому Discord сервері!",
        Premium = "ZenithHub Premium (soon)",
        PremiumSub = "Преміум версія оновлюється частіше!",
        ChangeLang = "Змінити мову"
    }
}
local text = Lang[currentLang]

-- GUI Elements (Custom)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ZenithHubUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0.75, 0, 0.75, 0)
MainFrame.Position = UDim2.new(0.125, 0, 0.125, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0.15, 0, 1, 0)
Sidebar.Position = UDim2.new(0, 0, 0, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Sidebar.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = Sidebar

-- Меню слева
local sections = {
    text.Home,
    "Farming Event",
    "AutoFarm",
    "Egg",
    "Minigames",
    "AutoRank (Beta)",
    "MailBox",
    "Automatic",
    "Webhook",
    "Player",
    "Setting"
}

for _, name in ipairs(sections) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18
    btn.Text = name
    btn.Parent = Sidebar
end

-- Вкладка Главная
local InfoText = Instance.new("TextLabel")
InfoText.Position = UDim2.new(0.2, 10, 0.05, 0)
InfoText.Size = UDim2.new(0.6, 0, 0.1, 0)
InfoText.Text = text.Discord
InfoText.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoText.Font = Enum.Font.SourceSansBold
InfoText.TextSize = 22
InfoText.BackgroundTransparency = 1
InfoText.TextXAlignment = Enum.TextXAlignment.Left
InfoText.Parent = MainFrame

InfoText.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        setclipboard("https://your-discord-link") -- сюда вставишь ссылку сам
    end
end)

local SubInfo = Instance.new("TextLabel")
SubInfo.Position = UDim2.new(0.2, 10, 0.12, 0)
SubInfo.Size = UDim2.new(0.6, 0, 0.05, 0)
SubInfo.Text = text.DiscordSub
SubInfo.TextColor3 = Color3.fromRGB(150, 150, 150)
SubInfo.Font = Enum.Font.SourceSans
SubInfo.TextSize = 16
SubInfo.BackgroundTransparency = 1
SubInfo.TextXAlignment = Enum.TextXAlignment.Left
SubInfo.Parent = MainFrame

-- Premium Блок
local Premium = Instance.new("TextLabel")
Premium.Position = UDim2.new(0.2, 10, 0.2, 0)
Premium.Size = UDim2.new(0.6, 0, 0.1, 0)
Premium.Text = text.Premium
Premium.TextColor3 = Color3.fromRGB(255, 255, 255)
Premium.Font = Enum.Font.SourceSansBold
Premium.TextSize = 22
Premium.BackgroundTransparency = 1
Premium.TextXAlignment = Enum.TextXAlignment.Left
Premium.Parent = MainFrame

Premium.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        setclipboard("https://your-premium-link") -- вставишь сам
    end
end)

local SubPrem = Instance.new("TextLabel")
SubPrem.Position = UDim2.new(0.2, 10, 0.27, 0)
SubPrem.Size = UDim2.new(0.6, 0, 0.05, 0)
SubPrem.Text = text.PremiumSub
SubPrem.TextColor3 = Color3.fromRGB(150, 150, 150)
SubPrem.Font = Enum.Font.SourceSans
SubPrem.TextSize = 16
SubPrem.BackgroundTransparency = 1
SubPrem.TextXAlignment = Enum.TextXAlignment.Left
SubPrem.Parent = MainFrame

-- TODO: Добавить смену языка через Setting
-- и остальной функционал под вкладки
