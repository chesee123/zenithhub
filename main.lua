-- ZenithHub Custom GUI (ZapHub Style, Phone/PC Compatible)
-- Author: ты

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Whitelist check
local allowed = {
    [8428035106] = true,
}
if not allowed[LocalPlayer.UserId] then
    game:Shutdown()
    return
end

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "ZenithHub"
ScreenGui.ResetOnSpawn = false

-- Draggable Frame
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

-- Top Bar Branding
local TopLabel = Instance.new("TextLabel", MainFrame)
TopLabel.Size = UDim2.new(1, 0, 0, 35)
TopLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TopLabel.Text = "ZenithHub | Pet Simulator 99"
TopLabel.TextColor3 = Color3.new(1, 1, 1)
TopLabel.TextScaled = true
TopLabel.Font = Enum.Font.GothamBold

-- Sidebar (Tabs)
local SideBar = Instance.new("Frame", MainFrame)
SideBar.Size = UDim2.new(0, 150, 1, -35)
SideBar.Position = UDim2.new(0, 0, 0, 35)
SideBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local UIListLayout = Instance.new("UIListLayout", SideBar)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

-- Content Frame
local ContentFrame = Instance.new("Frame", MainFrame)
ContentFrame.Size = UDim2.new(1, -150, 1, -35)
ContentFrame.Position = UDim2.new(0, 150, 0, 35)
ContentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

-- Function to switch content
local function clearContent()
    for _, child in ipairs(ContentFrame:GetChildren()) do
        if not child:IsA("UICorner") then
            child:Destroy()
        end
    end
end

local function createTabButton(name, onClick)
    local Button = Instance.new("TextButton", SideBar)
    Button.Size = UDim2.new(1, -10, 0, 35)
    Button.Position = UDim2.new(0, 5, 0, 0)
    Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Button.TextColor3 = Color3.new(1, 1, 1)
    Button.Font = Enum.Font.GothamBold
    Button.Text = name
    Button.TextScaled = true
    Button.AutoButtonColor = true
    Button.MouseButton1Click:Connect(function()
        clearContent()
        onClick()
    end)
end

-- HOME tab content
createTabButton("Home", function()
    local DiscordBtn = Instance.new("TextButton", ContentFrame)
    DiscordBtn.Size = UDim2.new(0, 250, 0, 50)
    DiscordBtn.Position = UDim2.new(0, 20, 0, 20)
    DiscordBtn.Text = "ZenithHub Discord"
    DiscordBtn.Font = Enum.Font.GothamBold
    DiscordBtn.TextColor3 = Color3.new(1, 1, 1)
    DiscordBtn.TextScaled = true
    DiscordBtn.BackgroundColor3 = Color3.fromRGB(35, 60, 200)
    DiscordBtn.MouseButton1Click:Connect(function()
        setclipboard("https://discord.gg/yourlink")
    end)

    local SmallText1 = Instance.new("TextLabel", DiscordBtn)
    SmallText1.Size = UDim2.new(1, 0, 0, 15)
    SmallText1.Position = UDim2.new(0, 0, 1, 0)
    SmallText1.BackgroundTransparency = 1
    SmallText1.Text = "More news on our Discord server!"
    SmallText1.TextColor3 = Color3.fromRGB(180, 180, 180)
    SmallText1.Font = Enum.Font.Gotham
    SmallText1.TextScaled = true

    local PremiumBtn = Instance.new("TextButton", ContentFrame)
    PremiumBtn.Size = UDim2.new(0, 250, 0, 50)
    PremiumBtn.Position = UDim2.new(0, 20, 0, 90)
    PremiumBtn.Text = "ZenithHub Premium (soon)"
    PremiumBtn.Font = Enum.Font.GothamBold
    PremiumBtn.TextColor3 = Color3.new(1, 1, 1)
    PremiumBtn.TextScaled = true
    PremiumBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    PremiumBtn.MouseButton1Click:Connect(function()
        setclipboard("https://yourshop.link")
    end)

    local SmallText2 = Instance.new("TextLabel", PremiumBtn)
    SmallText2.Size = UDim2.new(1, 0, 0, 15)
    SmallText2.Position = UDim2.new(0, 0, 1, 0)
    SmallText2.BackgroundTransparency = 1
    SmallText2.Text = "Our premium version updates more often!"
    SmallText2.TextColor3 = Color3.fromRGB(180, 180, 180)
    SmallText2.Font = Enum.Font.Gotham
    SmallText2.TextScaled = true
end)

-- Добавим вкладки (пока без контента)
for _, tabName in ipairs({
    "Farming Event", "AutoFarm", "Egg", "MiniGames", "AutoRank (Soon...)",
    "Webhook", "Player", "Setting"
}) do
    createTabButton(tabName, function()
        local Label = Instance.new("TextLabel", ContentFrame)
        Label.Size = UDim2.new(1, -20, 1, -20)
        Label.Position = UDim2.new(0, 10, 0, 10)
        Label.BackgroundTransparency = 1
        Label.Text = tabName .. " content coming soon..."
        Label.TextColor3 = Color3.new(1, 1, 1)
        Label.Font = Enum.Font.Gotham
        Label.TextScaled = true
        Label.TextWrapped = true
    end)
end

-- Запуск Home по умолчанию
clearContent()
pcall(function()
    SideBar:GetChildren()[2].MouseButton1Click:Fire()
end)
