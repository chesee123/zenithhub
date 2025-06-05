-- ZenithHub GUI (OrionLib Adapted for PC + Mobile)
-- Author: ты

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

repeat wait() until game:IsLoaded()

local allowed = {
    [8428035106] = true,
}
if not allowed[LocalPlayer.UserId] then
    game:Shutdown()
    return
end

local playerGui = LocalPlayer:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ZenithHubGUI"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.ScreenInsets = Enum.ScreenInsets.None
screenGui.Parent = playerGui

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local Window = OrionLib:MakeWindow({
    Name = "ZenithHub | Pet Simulator 99",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "ZenithHub",
    IntroEnabled = false,
    IntroText = "ZenithHub Loaded",
    CloseCallback = function()
        toggleButton.Visible = true
    end
})

local lang = {
    Tabs = {
        "Home",
        "Farming Event",
        "AutoFarm",
        "Egg",
        "MiniGames",
        "AutoRank (Soon...)",
        "Webhook",
        "Player",
        "Setting"
    },
    DiscordTitle = "ZenithHub Discord",
    DiscordDesc = "More news on our Discord server!",
    PremiumTitle = "ZenithHub Premium (soon)",
    PremiumDesc = "Our premium version will be updated more frequently than the free one."
}

local Tabs = {}
for _, name in ipairs(lang.Tabs) do
    Tabs[name] = Window:MakeTab({
        Name = name,
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
end

Tabs["Home"]:AddButton({
    Name = lang.DiscordTitle .. " - " .. lang.DiscordDesc,
    Callback = function()
        setclipboard("https://discord.gg/yourlink")
    end
})

Tabs["Home"]:AddButton({
    Name = lang.PremiumTitle .. " - " .. lang.PremiumDesc,
    Callback = function()
        setclipboard("https://yourshop.link")
    end
})

local toggleButton = Instance.new("TextButton")
toggleButton.Text = "ZenithHub"
toggleButton.Size = UDim2.new(0, 100, 0, 30)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.TextScaled = true
toggleButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Visible = false
toggleButton.Parent = screenGui

toggleButton.MouseButton1Click:Connect(function()
    toggleButton.Visible = false
    OrionLib:Init()
end)
