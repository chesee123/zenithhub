-- ZenithHub 
-- Author: 

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

-- Whitelist check
local allowed = {
    [8428035106] = true,
}
if not allowed[LocalPlayer.UserId] then
    game:Shutdown()
    return
end

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
    },
    -- Можешь добавить другие языки тут позже
}

local lang = Languages[currentLang]

-- UI Setup
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "ZenithHubUI"

-- Main frame
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 650, 0, 420)
MainFrame.Position = UDim2.new(0.5, -325, 0.5, -210)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Active = true
MainFrame.Draggable = true

-- Title bar
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "ZenithHub | Pet Simulator 99"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Position = UDim2.new(0, 10, 0, 5)

-- Side menu with scrolling
local SideMenu = Instance.new("ScrollingFrame", MainFrame)
SideMenu.Size = UDim2.new(0, 180, 1, -40)
SideMenu.Position = UDim2.new(0, 0, 0, 40)
SideMenu.CanvasSize = UDim2.new(0, 0, 0, 0)
SideMenu.ScrollBarThickness = 6
SideMenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SideMenu.BorderSizePixel = 0
SideMenu.AutomaticCanvasSize = Enum.AutomaticSize.Y
SideMenu.ClipsDescendants = true
SideMenu.Name = "TabList"

local UIListLayout = Instance.new("UIListLayout", SideMenu)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 6)

-- Content frame
local ContentFrame = Instance.new("Frame", MainFrame)
ContentFrame.Size = UDim2.new(1, -190, 1, -40)
ContentFrame.Position = UDim2.new(0, 190, 0, 40)
ContentFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ContentFrame.BorderSizePixel = 0
ContentFrame.Name = "ContentFrame"

for _, tabName in ipairs(lang.Tabs) do
    local TabButton = Instance.new("TextButton", SideMenu)
    TabButton.Size = UDim2.new(1, -10, 0, 32)
    TabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.Font = Enum.Font.Gotham
    TabButton.TextSize = 14
    TabButton.Text = tabName
    TabButton.BorderSizePixel = 0
    TabButton.Name = tabName:gsub("%s", "")

    TabButton.MouseButton1Click:Connect(function()
        for _, child in ipairs(ContentFrame:GetChildren()) do
            if child:IsA("Frame") then child.Visible = false end
        end
        local contentTab = ContentFrame:FindFirstChild(TabButton.Name)
        if contentTab then
            contentTab.Visible = true
        else
            local newTab = Instance.new("Frame", ContentFrame)
            newTab.Size = UDim2.new(1, 0, 1, 0)
            newTab.BackgroundTransparency = 1
            newTab.Name = TabButton.Name
            local label = Instance.new("TextLabel", newTab)
            label.Size = UDim2.new(1, 0, 1, 0)
            label.Text = "Пусто: " .. tabName
            label.TextColor3 = Color3.new(1,1,1)
            label.BackgroundTransparency = 1
            label.TextSize = 20
        end
    end)
end

-- Auto-select first tab
SideMenu:GetChildren()[2].MouseButton1Click:Invoke()

-- Discord section (Home tab)
local HomeFrame = Instance.new("Frame", ContentFrame)
HomeFrame.Size = UDim2.new(1, 0, 1, 0)
HomeFrame.BackgroundTransparency = 1
HomeFrame.Name = "Главная"

local DiscordLink = Instance.new("TextButton", HomeFrame)
DiscordLink.Text = lang.DiscordTitle
DiscordLink.Font = Enum.Font.GothamBold
DiscordLink.TextSize = 18
DiscordLink.TextColor3 = Color3.new(1, 1, 1)
DiscordLink.BackgroundTransparency = 1
DiscordLink.Position = UDim2.new(0, 0, 0, 0)
DiscordLink.Size = UDim2.new(0, 350, 0, 30)
DiscordLink.TextXAlignment = Enum.TextXAlignment.Left
DiscordLink.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/yourlink") -- ВСТАВЬ СВОЙ ДИСКОРД СЮДА
end)

local DiscordDesc = Instance.new("TextLabel", HomeFrame)
DiscordDesc.Text = lang.DiscordDesc
DiscordDesc.Font = Enum.Font.Gotham
DiscordDesc.TextSize = 13
DiscordDesc.TextColor3 = Color3.fromRGB(160,160,160)
DiscordDesc.BackgroundTransparency = 1
DiscordDesc.Position = UDim2.new(0, 0, 0, 30)
DiscordDesc.Size = UDim2.new(0, 350, 0, 20)
DiscordDesc.TextXAlignment = Enum.TextXAlignment.Left

local PremiumLink = Instance.new("TextButton", HomeFrame)
PremiumLink.Text = lang.PremiumTitle
PremiumLink.Font = Enum.Font.GothamBold
PremiumLink.TextSize = 18
PremiumLink.TextColor3 = Color3.new(1, 1, 1)
PremiumLink.BackgroundTransparency = 1
PremiumLink.Position = UDim2.new(0, 0, 0, 65)
PremiumLink.Size = UDim2.new(0, 350, 0, 30)
PremiumLink.TextXAlignment = Enum.TextXAlignment.Left
PremiumLink.MouseButton1Click:Connect(function()
    setclipboard("https://yourshop.link") -- ВСТАВЬ ССЫЛКУ НА ПРЕМИУМ
end)

local PremiumDesc = Instance.new("TextLabel", HomeFrame)
PremiumDesc.Text = lang.PremiumDesc
PremiumDesc.Font = Enum.Font.Gotham
PremiumDesc.TextSize = 13
PremiumDesc.TextColor3 = Color3.fromRGB(160,160,160)
PremiumDesc.BackgroundTransparency = 1
PremiumDesc.Position = UDim2.new(0, 0, 0, 95)
PremiumDesc.Size = UDim2.new(0, 350, 0, 20)
PremiumDesc.TextXAlignment = Enum.TextXAlignment.Left

-- Уведомление при запуске
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "ZenithHub",
        Text = "Запускаем ZenithHub!",
        Duration = 4
    })
end)
