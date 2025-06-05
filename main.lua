-- ZenithHub Custom GUI (PC + Mobile Friendly)
-- Author: ты

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

-- Whitelist (замени на нужные ID)
local allowed = {
    [8428035106] = true,
}

if not allowed[LocalPlayer.UserId] then
    game:Shutdown()
    return
end

-- UI Initialization
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "ZenithHubGUI"
ScreenGui.ResetOnSpawn = false

-- Main Frame
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 500, 0, 300)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

-- UICorner
local corner = Instance.new("UICorner", MainFrame)
corner.CornerRadius = UDim.new(0, 6)

-- Title
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "ZenithHub | Pet Simulator 99"
Title.TextColor3 = Color3.fromRGB(200, 200, 200)
Title.Font = Enum.Font.Gotham
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Right
Title.TextYAlignment = Enum.TextYAlignment.Center

-- Minimize Button
local MinBtn = Instance.new("TextButton", MainFrame)
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(0, 0, 0, 0)
MinBtn.Text = "-"
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 20
MinBtn.TextColor3 = Color3.new(1, 1, 1)
MinBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

-- Tab Buttons Frame
local TabFrame = Instance.new("ScrollingFrame", MainFrame)
TabFrame.Size = UDim2.new(0, 130, 1, -30)
TabFrame.Position = UDim2.new(0, 0, 0, 30)
TabFrame.CanvasSize = UDim2.new(0, 0, 0, 400)
TabFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TabFrame.BorderSizePixel = 0
TabFrame.ScrollBarThickness = 4

-- Content Frame
local ContentFrame = Instance.new("ScrollingFrame", MainFrame)
ContentFrame.Size = UDim2.new(1, -130, 1, -30)
ContentFrame.Position = UDim2.new(0, 130, 0, 30)
ContentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ContentFrame.BorderSizePixel = 0
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 300)
ContentFrame.ScrollBarThickness = 6

-- Tab Names
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

local currentTab = nil

-- Create Tabs
for i, name in ipairs(Tabs) do
    local btn = Instance.new("TextButton", TabFrame)
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.Position = UDim2.new(0, 5, 0, (i - 1) * 35)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.Text = name

    btn.MouseButton1Click:Connect(function()
        for _, c in pairs(ContentFrame:GetChildren()) do
            if c:IsA("GuiObject") then c:Destroy() end
        end
        if name == "Home" then
            local discordBtn = Instance.new("TextButton", ContentFrame)
            discordBtn.Size = UDim2.new(1, -20, 0, 60)
            discordBtn.Position = UDim2.new(0, 10, 0, 10)
            discordBtn.BackgroundColor3 = Color3.fromRGB(40, 60, 120)
            discordBtn.TextColor3 = Color3.new(1, 1, 1)
            discordBtn.Font = Enum.Font.GothamBold
            discordBtn.TextSize = 16
            discordBtn.Text = "ZenithHub Discord\nMore news on our Discord server!"
            discordBtn.TextWrapped = true
            discordBtn.TextYAlignment = Enum.TextYAlignment.Top
            discordBtn.MouseButton1Click:Connect(function()
                setclipboard("https://discord.gg/yourlink")
            end)

            local premiumBtn = Instance.new("TextButton", ContentFrame)
            premiumBtn.Size = UDim2.new(1, -20, 0, 60)
            premiumBtn.Position = UDim2.new(0, 10, 0, 80)
            premiumBtn.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
            premiumBtn.TextColor3 = Color3.new(1, 1, 1)
            premiumBtn.Font = Enum.Font.GothamBold
            premiumBtn.TextSize = 16
            premiumBtn.Text = "ZenithHub Premium (soon)\nOur premium version updates more often than the regular one!"
            premiumBtn.TextWrapped = true
            premiumBtn.TextYAlignment = Enum.TextYAlignment.Top
            premiumBtn.MouseButton1Click:Connect(function()
                setclipboard("https://yourshop.link")
            end)
        else
            local placeholder = Instance.new("TextLabel", ContentFrame)
            placeholder.Size = UDim2.new(1, 0, 0, 200)
            placeholder.Position = UDim2.new(0, 0, 0, 10)
            placeholder.BackgroundTransparency = 1
            placeholder.TextColor3 = Color3.fromRGB(180, 180, 180)
            placeholder.Font = Enum.Font.Gotham
            placeholder.TextSize = 18
            placeholder.Text = "Content coming soon..."
            placeholder.TextWrapped = true
        end
    end)

    if i == 1 then
        btn:MouseButton1Click()
    end
end

-- Collapse button action
MinBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    showBtn.Visible = true
end)

-- Reopen button
local showBtn = Instance.new("TextButton", ScreenGui)
showBtn.Size = UDim2.new(0, 100, 0, 30)
showBtn.Position = UDim2.new(0.5, -50, 0, 10)
showBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
showBtn.TextColor3 = Color3.new(1, 1, 1)
showBtn.Text = "ZenithHub"
showBtn.Font = Enum.Font.Gotham
showBtn.TextSize = 14
showBtn.Visible = false

showBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    showBtn.Visible = false
end)
