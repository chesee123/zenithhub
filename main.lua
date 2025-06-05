local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- Whitelist
if LocalPlayer.UserId ~= 8428035106 then
    game:Shutdown()
    return
end

-- GUI
local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "ZenithHubGUI"
ScreenGui.ResetOnSpawn = false

-- Main Frame
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 420, 0, 250)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 6)

-- Title (справа и меньше)
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, -35, 0, 25)
Title.Position = UDim2.new(0, 35, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "ZenithHub | Pet Simulator 99"
Title.TextColor3 = Color3.fromRGB(200, 200, 200)
Title.Font = Enum.Font.Gotham
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Right

-- Collapse Button
local MinBtn = Instance.new("TextButton", MainFrame)
MinBtn.Size = UDim2.new(0, 30, 0, 25)
MinBtn.Position = UDim2.new(0, 0, 0, 0)
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.new(1, 1, 1)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 16
MinBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

-- Tabs (слева)
local TabFrame = Instance.new("ScrollingFrame", MainFrame)
TabFrame.Size = UDim2.new(0, 120, 1, -25)
TabFrame.Position = UDim2.new(0, 0, 0, 25)
TabFrame.CanvasSize = UDim2.new(0, 0, 0, 400)
TabFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TabFrame.ScrollBarThickness = 4

-- Content
local ContentFrame = Instance.new("ScrollingFrame", MainFrame)
ContentFrame.Size = UDim2.new(1, -120, 1, -25)
ContentFrame.Position = UDim2.new(0, 120, 0, 25)
ContentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 300)
ContentFrame.ScrollBarThickness = 6

-- Reopen Button
local ReopenBtn = Instance.new("TextButton", ScreenGui)
ReopenBtn.Size = UDim2.new(0, 110, 0, 30)
ReopenBtn.Position = UDim2.new(0.5, -55, 0, 10)
ReopenBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ReopenBtn.TextColor3 = Color3.new(1, 1, 1)
ReopenBtn.Text = "ZenithHub"
ReopenBtn.Font = Enum.Font.Gotham
ReopenBtn.TextSize = 14
ReopenBtn.Visible = false
ReopenBtn.Active = true
ReopenBtn.Draggable = true

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

for i, name in ipairs(Tabs) do
    local btn = Instance.new("TextButton", TabFrame)
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.Position = UDim2.new(0, 5, 0, (i - 1) * 35)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 13
    btn.Text = name

    btn.MouseButton1Click:Connect(function()
        for _, c in pairs(ContentFrame:GetChildren()) do
            if c:IsA("GuiObject") then c:Destroy() end
        end

        if name == "Home" then
            local discordBtn = Instance.new("TextButton", ContentFrame)
            discordBtn.Size = UDim2.new(1, -20, 0, 70)
            discordBtn.Position = UDim2.new(0, 10, 0, 10)
            discordBtn.BackgroundColor3 = Color3.fromRGB(40, 60, 120)
            discordBtn.TextColor3 = Color3.new(1, 1, 1)
            discordBtn.Font = Enum.Font.GothamBold
            discordBtn.TextSize = 14
            discordBtn.TextWrapped = true
            discordBtn.Text = "ZenithHub Discord\nMore news on our Discord server!"
            discordBtn.TextYAlignment = Enum.TextYAlignment.Top
            discordBtn.MouseButton1Click:Connect(function()
                setclipboard("https://discord.gg/yourlink")
            end)

            local premiumBtn = Instance.new("TextButton", ContentFrame)
            premiumBtn.Size = UDim2.new(1, -20, 0, 70)
            premiumBtn.Position = UDim2.new(0, 10, 0, 90)
            premiumBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            premiumBtn.TextColor3 = Color3.new(1, 1, 1)
            premiumBtn.Font = Enum.Font.GothamBold
            premiumBtn.TextSize = 14
            premiumBtn.TextWrapped = true
            premiumBtn.Text = "ZenithHub Premium (soon)\nOur premium version updates more often than the regular one!"
            premiumBtn.TextYAlignment = Enum.TextYAlignment.Top
            premiumBtn.MouseButton1Click:Connect(function()
                setclipboard("https://yourshop.link")
            end)
        else
            local coming = Instance.new("TextLabel", ContentFrame)
            coming.Size = UDim2.new(1, -20, 0, 80)
            coming.Position = UDim2.new(0, 10, 0, 10)
            coming.BackgroundTransparency = 1
            coming.TextColor3 = Color3.fromRGB(180, 180, 180)
            coming.Font = Enum.Font.Gotham
            coming.TextSize = 14
            coming.TextWrapped = true
            coming.Text = "Content coming soon..."
        end
    end)

    if i == 1 then btn:MouseButton1Click() end
end

-- Collapse logic
MinBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    ReopenBtn.Visible = true
end)

ReopenBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    ReopenBtn.Visible = false
end)
