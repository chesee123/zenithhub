-- ZenithHub GUI (OrionLib Adapted Version for Mobile & PC)
-- Author: ты

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Whitelist
local allowed = {
    [8428035106] = true,
}
if not allowed[LocalPlayer.UserId] then
    game:Shutdown()
    return
end

-- Notify
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "ZenithHub",
        Text = "Launching ZenithHub...",
        Duration = 4
    })
end)

-- Load OrionLib (адаптированная)
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nosssa/orion-mobile/main/orionmobile.lua"))()

local Window = OrionLib:MakeWindow({
    Name = "ZenithHub | Pet Simulator 99",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "ZenithHub",
    IntroEnabled = false
})

-- Мини-кнопка для повторного открытия
local guiVisible = true
local CoreGui = game:GetService("CoreGui")
local toggleBtn = Instance.new("TextButton")
toggleBtn.Text = "ZenithHub"
toggleBtn.Size = UDim2.new(0, 100, 0, 30)
toggleBtn.Position = UDim2.new(0, 10, 0, 10)
toggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.TextScaled = true
toggleBtn.Visible = false
toggleBtn.Parent = CoreGui:FindFirstChildOfClass("ScreenGui") or Instance.new("ScreenGui", CoreGui)

toggleBtn.MouseButton1Click:Connect(function()
    OrionLib:Toggle(true)
    toggleBtn.Visible = false
end)

-- Главная вкладка
local MainTab = Window:MakeTab({
    Name = "Home",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

MainTab:AddButton({
    Name = "– Minimize GUI",
    Callback = function()
        OrionLib:Toggle(false)
        toggleBtn.Visible = true
    end
})

MainTab:AddButton({
    Name = "ZenithHub Discord",
    Callback = function()
        setclipboard("https://discord.gg/yourlink")
    end
})
MainTab:AddParagraph("More news in our Discord server!")

MainTab:AddButton({
    Name = "ZenithHub Premium (soon)",
    Callback = function()
        setclipboard("https://yourshop.link")
    end
})
MainTab:AddParagraph("Our premium version will be updated more frequently than the free one.")

-- Остальные вкладки
local tabNames = {
    "Farming Event",
    "AutoFarm",
    "Egg",
    "MiniGames",
    "AutoRank (Soon...)",
    "Webhook",
    "Player",
    "Setting"
}

for _, tabName in ipairs(tabNames) do
    Window:MakeTab({
        Name = tabName,
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
end

-- Инициализация
OrionLib:Init()
