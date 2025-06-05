-- ZenithHub Custom GUI (Mobile + PC Compatible)
-- Author: ты

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- Whitelist check
local allowed = {
    [8428035106] = true,
}
if not allowed[LocalPlayer.UserId] then
    game:Shutdown()
    return
end

-- Wait for game to load
repeat task.wait() until game:IsLoaded()

-- Create main GUI
local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "ZenithHubUI"
ScreenGui.ResetOnSpawn = false

-- Draggable frame
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 500, 0, 400)
Frame.Position = UDim2.new(0.5, -250, 0.5, -200)
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

-- UI corner
local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 6)

-- Title
local Title = Instance.new("TextLabel", Frame)
Title.Text = "ZenithHub | Pet Simulator 99"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamSemibold
Title.TextSize = 18

-- Close ("-") button
local CloseBtn = Instance.new("TextButton", Frame)
CloseBtn.Text = "-"
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 0)
CloseBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 18

-- Reopen button (hidden at first)
local ReopenBtn = Instance.new("TextButton", ScreenGui)
ReopenBtn.Text = "ZenithHub"
ReopenBtn.Size = UDim2.new(0, 100, 0, 30)
ReopenBtn.Position = UDim2.new(0, 10, 1, -40)
ReopenBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ReopenBtn.TextColor3 = Color3.new(1, 1, 1)
ReopenBtn.Font = Enum.Font.GothamBold
ReopenBtn.TextSize = 14
ReopenBtn.Visible = false

-- Scrolling container
local Scroll = Instance.new("ScrollingFrame", Frame)
Scroll.Size = UDim2.new(1, -10, 1, -40)
Scroll.Position = UDim2.new(0, 5, 0, 35)
Scroll.CanvasSize = UDim2.new(0, 0, 0, 600)
Scroll.BackgroundTransparency = 1
Scroll.ScrollBarThickness = 4

-- UI list layout
local Layout = Instance.new("UIListLayout", Scroll)
Layout.Padding = UDim.new(0, 6)

-- Tabs
local Tabs = {
    "Home",
    "Farming Event",
    "AutoFarm",
    "Egg",
    "MiniGames",
    "AutoRank (Soon...)",
    "Webhook",
    "Player",
    "Setting"
}

for _, name in ipairs(Tabs) do
    local Button = Instance.new("TextButton", Scroll)
    Button.Text = name
    Button.Size = UDim2.new(1, -10, 0, 40)
    Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Button.TextColor3 = Color3.new(1, 1, 1)
    Button.Font = Enum.Font.Gotham
    Button.TextSize = 16
    local corner = Instance.new("UICorner", Button)
end

-- Home info
local function addParagraph(text, parent)
    local lbl = Instance.new("TextLabel", parent)
    lbl.Size = UDim2.new(1, -10, 0, 40)
    lbl.TextWrapped = true
    lbl.Text = text
    lbl.BackgroundTransparency = 1
    lbl.TextColor3 = Color3.new(1, 1, 1)
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 12
end

local DiscordBtn = Instance.new("TextButton", Scroll)
DiscordBtn.Text = "ZenithHub Discord"
DiscordBtn.Size = UDim2.new(1, -10, 0, 40)
DiscordBtn.BackgroundColor3 = Color3.fromRGB(70, 90, 255)
DiscordBtn.TextColor3 = Color3.new(1, 1, 1)
DiscordBtn.Font = Enum.Font.GothamBold
DiscordBtn.TextSize = 16
DiscordBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/yourlink")
end)
addParagraph("More news on our Discord server!", Scroll)

local PremiumBtn = Instance.new("TextButton", Scroll)
PremiumBtn.Text = "ZenithHub Premium (soon)"
PremiumBtn.Size = UDim2.new(1, -10, 0, 40)
PremiumBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
PremiumBtn.TextColor3 = Color3.new(0, 0, 0)
PremiumBtn.Font = Enum.Font.GothamBold
PremiumBtn.TextSize = 16
PremiumBtn.MouseButton1Click:Connect(function()
    setclipboard("https://yourshop.link")
end)
addParagraph("Our premium version updates more often than the regular one!", Scroll)

-- Button behavior
CloseBtn.MouseButton1Click:Connect(function()
    Frame.Visible = false
    ReopenBtn.Visible = true
end)

ReopenBtn.MouseButton1Click:Connect(function()
    Frame.Visible = true
    ReopenBtn.Visible = false
end)
