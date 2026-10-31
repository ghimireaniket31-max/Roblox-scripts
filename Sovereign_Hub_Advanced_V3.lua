--[[
    SOVEREIGN HUB - ADVANCED RESPONSIVE UI (V3)
    Roblox LuaU interface inspired by the supplied black/red reference.
    No game automation, teleporting, remote calls, or exploit actions are included.

    Run as a client-side script in an environment where LocalPlayer is available.
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
if not player then
    warn("[Sovereign Hub] LocalPlayer was not found. Run this on the client.")
    return
end

local playerGui = player:WaitForChild("PlayerGui")

-- Remove an older copy.
local old = playerGui:FindFirstChild("SovereignHubUI")
if old then
    old:Destroy()
end

local C = {
    bg = Color3.fromRGB(5, 5, 7),
    panel = Color3.fromRGB(12, 10, 12),
    panel2 = Color3.fromRGB(19, 16, 18),
    panel3 = Color3.fromRGB(28, 22, 24),
    red = Color3.fromRGB(225, 15, 38),
    red2 = Color3.fromRGB(255, 35, 54),
    redDark = Color3.fromRGB(105, 5, 20),
    white = Color3.fromRGB(245, 242, 243),
    muted = Color3.fromRGB(155, 148, 151),
    green = Color3.fromRGB(65, 235, 95),
    line = Color3.fromRGB(70, 24, 31),
    gray = Color3.fromRGB(75, 72, 75),
}

--[[
    ASSET CONFIGURATION
    Put numeric Roblox image asset IDs here (numbers only, no URL).
    Leave a value as 0 to use the built-in text/icon fallback.
    Example: Logo = 1234567890
]]
local ASSETS = {
    Logo = 0,
    Background = 0,
    FeedItem = 0,
    SidebarLogs = 0,
    SidebarHistory = 0,
    SidebarStatus = 0,
    SidebarSettings = 0,
}

local function assetUri(value)
    local id = tostring(value or ""):match("%d+")
    if not id or id == "0" then
        return ""
    end
    return "rbxassetid://" .. id
end

local function corner(parent, radius)
    local u = Instance.new("UICorner")
    u.CornerRadius = UDim.new(0, radius or 10)
    u.Parent = parent
    return u
end

local function stroke(parent, color, thickness, transparency)
    local s = Instance.new("UIStroke")
    s.Color = color or C.red
    s.Thickness = thickness or 1
    s.Transparency = transparency or 0
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Parent = parent
    return s
end

local function gradient(parent, a, b, rotation)
    local g = Instance.new("UIGradient")
    g.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, a),
        ColorSequenceKeypoint.new(1, b),
    })
    g.Rotation = rotation or 0
    g.Parent = parent
    return g
end

local function make(className, props, parent)
    local obj = Instance.new(className)
    for k, v in pairs(props or {}) do
        obj[k] = v
    end
    obj.Parent = parent
    return obj
end

local function tween(obj, duration, props, style)
    local info = TweenInfo.new(duration, style or Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    local t = TweenService:Create(obj, info, props)
    t:Play()
    return t
end

local function label(parent, text, size, color, font, xAlign)
    return make("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = color or C.white,
        TextSize = size or 14,
        Font = font or Enum.Font.Gotham,
        TextXAlignment = xAlign or Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        TextTruncate = Enum.TextTruncate.AtEnd,
    }, parent)
end

local function button(parent, text, size, color, textColor)
    local b = make("TextButton", {
        AutoButtonColor = false,
        Text = text,
        TextColor3 = textColor or C.white,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        BackgroundColor3 = color or C.panel2,
        Size = size,
    }, parent)
    corner(b, 9)
    stroke(b, C.red, 1.2, 0.12)
    b.MouseEnter:Connect(function()
        tween(b, 0.14, {BackgroundColor3 = C.panel3})
    end)
    b.MouseLeave:Connect(function()
        tween(b, 0.14, {BackgroundColor3 = color or C.panel2})
    end)
    b.MouseButton1Down:Connect(function()
        tween(b, 0.08, {Size = UDim2.new(size.X.Scale, size.X.Offset - 2, size.Y.Scale, size.Y.Offset - 2)})
    end)
    b.MouseButton1Up:Connect(function()
        tween(b, 0.12, {Size = size})
    end)
    return b
end

local gui = make("ScreenGui", {
    Name = "SovereignHubUI",
    ResetOnSpawn = false,
    IgnoreGuiInset = true,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    DisplayOrder = 999,
}, playerGui)

local main = make("Frame", {
    Name = "Main",
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.52),
    Size = UDim2.fromOffset(790, 485),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, gui)
corner(main, 20)
stroke(main, C.red, 2.2, 0)
gradient(main, Color3.fromRGB(12, 8, 11), Color3.fromRGB(2, 2, 3), 35)

local mainScale = make("UIScale", {Scale = 1}, main)

-- Subtle diagonal red accents.
local accent1 = make("Frame", {
    BackgroundColor3 = C.red,
    BackgroundTransparency = 0.72,
    BorderSizePixel = 0,
    Rotation = -34,
    Position = UDim2.new(0, -90, 1, -80),
    Size = UDim2.fromOffset(310, 18),
    ZIndex = 1,
}, main)
gradient(accent1, C.redDark, C.red2, 0)

local accent2 = make("Frame", {
    BackgroundColor3 = C.red,
    BackgroundTransparency = 0.82,
    BorderSizePixel = 0,
    Rotation = -34,
    Position = UDim2.new(1, -160, 0, 20),
    Size = UDim2.fromOffset(240, 12),
    ZIndex = 1,
}, main)
gradient(accent2, C.redDark, C.red2, 0)

-- Optional custom background image (configured through ASSETS.Background).
local backgroundImage = make("ImageLabel", {
    Name = "CustomBackground",
    BackgroundTransparency = 1,
    Image = assetUri(ASSETS.Background),
    ImageTransparency = 0.32,
    ScaleType = Enum.ScaleType.Crop,
    Size = UDim2.fromScale(1, 1),
    Visible = assetUri(ASSETS.Background) ~= "",
    ZIndex = 1,
}, main)

-- Darken the artwork slightly so the foreground cards and labels stay readable.
local backgroundShade = make("Frame", {
    Name = "BackgroundShade",
    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    BackgroundTransparency = 0.42,
    BorderSizePixel = 0,
    Size = UDim2.fromScale(1, 1),
    Visible = assetUri(ASSETS.Background) ~= "",
    ZIndex = 2,
}, main)

-- Header.
local header = make("Frame", {
    Name = "Header",
    BackgroundTransparency = 1,
    Position = UDim2.fromOffset(18, 10),
    Size = UDim2.new(1, -36, 0, 48),
    ZIndex = 5,
}, main)

local crown = label(header, "♛", 36, C.red2, Enum.Font.GothamBlack)
crown.Size = UDim2.fromOffset(48, 44)
crown.TextXAlignment = Enum.TextXAlignment.Center

local logoImage = make("ImageLabel", {
    Name = "CustomLogo",
    BackgroundTransparency = 1,
    Image = assetUri(ASSETS.Logo),
    ScaleType = Enum.ScaleType.Fit,
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.fromOffset(42, 40),
    Visible = assetUri(ASSETS.Logo) ~= "",
    ZIndex = 6,
}, header)
if logoImage.Visible then crown.Visible = false end

local title = label(header, "Sovereign", 25, C.white, Enum.Font.GothamBlack)
title.Position = UDim2.fromOffset(48, 0)
title.Size = UDim2.fromOffset(142, 44)

local titleHub = label(header, "Hub", 25, C.red2, Enum.Font.GothamBlack)
titleHub.Position = UDim2.fromOffset(187, 0)
titleHub.Size = UDim2.fromOffset(65, 44)

local statusDot = make("Frame", {
    BackgroundColor3 = C.green,
    Position = UDim2.fromOffset(5, 49),
    Size = UDim2.fromOffset(9, 9),
    ZIndex = 5,
}, header)
corner(statusDot, 10)

local connectionText = label(header, "Connected  •  UI Preview", 13, C.white)
connectionText.Position = UDim2.fromOffset(21, 42)
connectionText.Size = UDim2.fromOffset(210, 22)

local minimize = button(header, "—", UDim2.fromOffset(38, 34), C.panel2, C.red2)
minimize.Position = UDim2.new(1, -82, 0, 4)
minimize.TextSize = 22

local close = button(header, "×", UDim2.fromOffset(38, 34), C.panel2, C.red2)
close.Position = UDim2.new(1, -38, 0, 4)
close.TextSize = 25

-- Main layout.
local sidebar = make("Frame", {
    Name = "Sidebar",
    BackgroundColor3 = Color3.fromRGB(8, 7, 9),
    BackgroundTransparency = 0.1,
    Position = UDim2.fromOffset(12, 72),
    Size = UDim2.new(0, 166, 1, -86),
    ZIndex = 3,
}, main)
corner(sidebar, 14)

local sideLine = make("Frame", {
    BackgroundColor3 = C.redDark,
    BorderSizePixel = 0,
    Position = UDim2.new(1, 0, 0, 8),
    Size = UDim2.new(0, 1, 1, -16),
    ZIndex = 4,
}, sidebar)

local content = make("Frame", {
    Name = "Content",
    BackgroundTransparency = 1,
    Position = UDim2.fromOffset(190, 72),
    Size = UDim2.new(1, -204, 1, -86),
    ZIndex = 3,
}, main)

local navItems = {
    {name = "Logs", icon = "∿"},
    {name = "History", icon = "◴"},
    {name = "Status", icon = "⌁"},
    {name = "Settings", icon = "⚙"},
}
local pages = {}
local navButtons = {}
local activeTab = "Logs"

local function notify(message)
    local toast = make("Frame", {
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.new(1, -14, 1, -14),
        Size = UDim2.fromOffset(245, 42),
        BackgroundColor3 = C.panel2,
        ZIndex = 30,
    }, main)
    corner(toast, 10)
    stroke(toast, C.red, 1.3)
    local t = label(toast, message, 12, C.white, Enum.Font.GothamMedium)
    t.Position = UDim2.fromOffset(12, 0)
    t.Size = UDim2.new(1, -24, 1, 0)
    toast.BackgroundTransparency = 1
    t.TextTransparency = 1
    tween(toast, 0.18, {BackgroundTransparency = 0})
    tween(t, 0.18, {TextTransparency = 0})
    task.delay(2, function()
        if toast.Parent then
            tween(toast, 0.2, {BackgroundTransparency = 1})
            tween(t, 0.2, {TextTransparency = 1})
            task.wait(0.22)
            toast:Destroy()
        end
    end)
end

local function setTab(name)
    activeTab = name
    for tabName, page in pairs(pages) do
        page.Visible = (tabName == name)
    end
    for tabName, b in pairs(navButtons) do
        local selected = tabName == name
        tween(b, 0.16, {
            BackgroundColor3 = selected and Color3.fromRGB(75, 8, 19) or C.panel,
        })
        local s = b:FindFirstChildOfClass("UIStroke")
        if s then
            tween(s, 0.16, {Transparency = selected and 0 or 0.55, Thickness = selected and 1.7 or 1})
        end
    end
end

for i, item in ipairs(navItems) do
    local b = button(sidebar, "", UDim2.new(1, -16, 0, 49), C.panel, C.white)
    b.Name = item.name .. "Button"
    b.Position = UDim2.fromOffset(8, 18 + (i - 1) * 59)
    b.Text = ""
    local icon = label(b, item.icon, 25, C.red2, Enum.Font.GothamBold)
    icon.Position = UDim2.fromOffset(10, 0)
    icon.Size = UDim2.fromOffset(32, 49)
    icon.TextXAlignment = Enum.TextXAlignment.Center
    local txt = label(b, item.name, 15, C.white, Enum.Font.GothamMedium)
    txt.Position = UDim2.fromOffset(51, 0)
    txt.Size = UDim2.new(1, -57, 1, 0)
    navButtons[item.name] = b
    b.MouseButton1Click:Connect(function()
        setTab(item.name)
    end)
end

local hideButton = button(sidebar, "×   Hide", UDim2.new(1, -18, 0, 48), C.panel2, C.white)
hideButton.Position = UDim2.new(0, 9, 1, -59)
hideButton.TextSize = 15
hideButton.MouseButton1Click:Connect(function()
    main.Visible = false
    local reopen = make("TextButton", {
        Name = "SovereignReopen",
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 14, 0.5, 0),
        Size = UDim2.fromOffset(58, 58),
        BackgroundColor3 = C.bg,
        Text = "♛",
        TextColor3 = C.red2,
        TextSize = 31,
        Font = Enum.Font.GothamBlack,
        AutoButtonColor = false,
        ZIndex = 50,
    }, gui)
    corner(reopen, 18)
    stroke(reopen, C.red, 2)
    reopen.MouseButton1Click:Connect(function()
        main.Visible = true
        reopen:Destroy()
        main.Size = UDim2.fromOffset(760, 465)
        tween(main, 0.25, {Size = UDim2.fromOffset(790, 485)})
    end)
end)

-- Pages.
local function newPage(name)
    local pageClass = name == "Settings" and "ScrollingFrame" or "Frame"
    local pageProps = {
        Name = name .. "Page",
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Visible = false,
    }
    if name == "Settings" then
        pageProps.CanvasSize = UDim2.new()
        pageProps.AutomaticCanvasSize = Enum.AutomaticSize.Y
        pageProps.ScrollBarThickness = 3
        pageProps.ScrollBarImageColor3 = C.red
        pageProps.BorderSizePixel = 0
    end
    local p = make(pageClass, pageProps, content)
    pages[name] = p
    return p
end

local logsPage = newPage("Logs")

local function makeToggle(parent, text, position, defaultValue)
    local holder = make("Frame", {
        Name = text:gsub("%s+", "") .. "Toggle",
        BackgroundColor3 = C.panel2,
        Position = position,
        Size = UDim2.fromOffset(220, 52),
        ZIndex = 5,
    }, parent)
    corner(holder, 13)
    stroke(holder, C.red, 1.4, 0.12)
    local name = label(holder, text, 14, C.white, Enum.Font.GothamBold)
    name.Position = UDim2.fromOffset(14, 0)
    name.Size = UDim2.new(1, -80, 1, 0)

    local track = make("TextButton", {
        AutoButtonColor = false,
        Text = "",
        BackgroundColor3 = defaultValue and C.red or C.gray,
        Position = UDim2.new(1, -65, 0.5, -15),
        Size = UDim2.fromOffset(52, 30),
        ZIndex = 7,
    }, holder)
    corner(track, 20)
    local knob = make("Frame", {
        BackgroundColor3 = C.white,
        Position = defaultValue and UDim2.new(1, -27, 0, 3) or UDim2.fromOffset(3, 3),
        Size = UDim2.fromOffset(24, 24),
        ZIndex = 8,
    }, track)
    corner(knob, 20)
    local enabled = defaultValue
    track.MouseButton1Click:Connect(function()
        enabled = not enabled
        tween(track, 0.18, {BackgroundColor3 = enabled and C.red or C.gray})
        tween(knob, 0.18, {Position = enabled and UDim2.new(1, -27, 0, 3) or UDim2.fromOffset(3, 3)})
        notify(text .. (enabled and " enabled (preview)" or " disabled"))
    end)
    return holder
end

makeToggle(logsPage, "Auto-Join", UDim2.fromOffset(12, 4), false)
makeToggle(logsPage, "Auto-Force", UDim2.new(0, 246, 0, 4), false)

local feedHeader = make("Frame", {
    BackgroundTransparency = 1,
    Position = UDim2.fromOffset(12, 66),
    Size = UDim2.new(1, -24, 0, 30),
}, logsPage)

local liveDot = make("Frame", {
    BackgroundColor3 = C.red2,
    Position = UDim2.fromOffset(1, 10),
    Size = UDim2.fromOffset(10, 10),
}, feedHeader)
corner(liveDot, 10)
local liveText = label(feedHeader, "LIVE FEED", 14, C.white, Enum.Font.GothamBold)
liveText.Position = UDim2.fromOffset(19, 0)
liveText.Size = UDim2.fromOffset(110, 30)

local searchBox = make("TextBox", {
    Name = "FeedSearch",
    PlaceholderText = "Search feed...",
    PlaceholderColor3 = C.muted,
    Text = "",
    ClearTextOnFocus = false,
    TextColor3 = C.white,
    TextSize = 11,
    Font = Enum.Font.Gotham,
    TextXAlignment = Enum.TextXAlignment.Left,
    BackgroundColor3 = C.panel2,
    Position = UDim2.fromOffset(126, 1),
    Size = UDim2.fromOffset(145, 28),
}, feedHeader)
corner(searchBox, 8)
stroke(searchBox, C.line, 1)

local detected = label(feedHeader, "4 detected", 13, C.muted, Enum.Font.Gotham)
detected.AnchorPoint = Vector2.new(1, 0)
detected.Position = UDim2.new(1, -88, 0, 0)
detected.Size = UDim2.fromOffset(110, 30)
detected.TextXAlignment = Enum.TextXAlignment.Right

local clearButton = button(feedHeader, "Clear", UDim2.fromOffset(65, 29), C.panel2, C.white)
clearButton.AnchorPoint = Vector2.new(1, 0)
clearButton.Position = UDim2.new(1, 0, 0, 0)
clearButton.TextSize = 12

local feed = make("ScrollingFrame", {
    Name = "LiveFeed",
    BackgroundColor3 = Color3.fromRGB(7, 6, 8),
    BackgroundTransparency = 0.1,
    BorderSizePixel = 0,
    Position = UDim2.fromOffset(8, 103),
    Size = UDim2.new(1, -16, 1, -111),
    CanvasSize = UDim2.new(),
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    ScrollBarThickness = 4,
    ScrollBarImageColor3 = C.red,
}, logsPage)
corner(feed, 13)
stroke(feed, C.line, 1)
local feedPadding = make("UIPadding", {
    PaddingTop = UDim.new(0, 8),
    PaddingBottom = UDim.new(0, 8),
    PaddingLeft = UDim.new(0, 8),
    PaddingRight = UDim.new(0, 8),
}, feed)
local feedLayout = make("UIListLayout", {
    Padding = UDim.new(0, 7),
    SortOrder = Enum.SortOrder.LayoutOrder,
}, feed)

local sampleItems = {
    {name = "World Burner", rate = "$118.2B/s", detail = "7/5  •  Divine  •  2:51"},
    {name = "World Burner", rate = "$90.3B/s", detail = "7/2  •  Divine  •  3:29"},
    {name = "World Burner", rate = "$61.7B/s", detail = "7/6  •  Divine  •  3:50"},
    {name = "World Burner", rate = "$45.7B/s", detail = "7/6  •  Divine  •  3:50"},
}

local feedCards = {}
local feedCardParts = {}
local isCompact = false
local isPhone = false
local function addFeedCard(data, index)
    local card = make("Frame", {
        Name = "FeedCard" .. index,
        BackgroundColor3 = C.panel,
        Size = UDim2.new(1, -2, 0, 82),
        LayoutOrder = index,
    }, feed)
    corner(card, 12)
    stroke(card, C.line, 1.2, 0.05)

    local bar = make("Frame", {
        BackgroundColor3 = index % 2 == 0 and C.red2 or Color3.fromRGB(255, 150, 155),
        Position = UDim2.fromOffset(8, 9),
        Size = UDim2.new(0, 7, 1, -18),
    }, card)
    corner(bar, 5)

    local itemIcon = label(card, "◆", 27, C.red2, Enum.Font.GothamBlack)
    itemIcon.Position = UDim2.fromOffset(25, 0)
    itemIcon.Size = UDim2.fromOffset(62, 82)
    itemIcon.TextXAlignment = Enum.TextXAlignment.Center

    local itemImage = make("ImageLabel", {
        Name = "ItemAsset",
        BackgroundTransparency = 1,
        Image = assetUri(ASSETS.FeedItem),
        ScaleType = Enum.ScaleType.Fit,
        Position = UDim2.fromOffset(25, 8),
        Size = UDim2.fromOffset(62, 66),
        Visible = assetUri(ASSETS.FeedItem) ~= "",
    }, card)
    if itemImage.Visible then itemIcon.Visible = false end

    local name = label(card, data.name .. "  [ " .. data.rate .. " ]", 15, C.white, Enum.Font.GothamBold)
    name.Name = "ItemName"
    name.Position = UDim2.fromOffset(95, 13)
    name.Size = UDim2.new(1, -315, 0, 25)

    local detail = label(card, data.detail, 12, C.muted, Enum.Font.GothamMedium)
    detail.Name = "ItemDetail"
    detail.Position = UDim2.fromOffset(95, 42)
    detail.Size = UDim2.new(1, -315, 0, 22)

    local join = button(card, "JOIN", UDim2.fromOffset(76, 39), Color3.fromRGB(75, 5, 17), C.white)
    join.Name = "JoinButton"
    join.AnchorPoint = Vector2.new(1, 0.5)
    join.Position = UDim2.new(1, -104, 0.5, 0)
    join.TextSize = 13
    join.MouseButton1Click:Connect(function()
        notify("JOIN is a UI preview only")
    end)

    local force = button(card, "FORCE", UDim2.fromOffset(76, 39), C.panel2, C.muted)
    force.Name = "ForceButton"
    force.AnchorPoint = Vector2.new(1, 0.5)
    force.Position = UDim2.new(1, -12, 0.5, 0)
    force.TextSize = 13
    force.MouseButton1Click:Connect(function()
        notify("FORCE is a UI preview only")
    end)

    table.insert(feedCards, card)
    feedCardParts[card] = {
        icon = itemIcon,
        image = itemImage,
        name = name,
        detail = detail,
        join = join,
        force = force,
    }
end

for i, item in ipairs(sampleItems) do
    addFeedCard(item, i)
end

clearButton.MouseButton1Click:Connect(function()
    for _, card in ipairs(feedCards) do
        if card.Parent then card:Destroy() end
    end
    table.clear(feedCards)
    detected.Text = "0 detected"
    notify("Feed cleared")
end)

-- History page.
local historyPage = newPage("History")
local function pageTitle(parent, text, subtitle)
    local h = label(parent, text, 21, C.white, Enum.Font.GothamBlack)
    h.Position = UDim2.fromOffset(14, 8)
    h.Size = UDim2.new(1, -28, 0, 32)
    local sub = label(parent, subtitle, 12, C.muted, Enum.Font.Gotham)
    sub.Position = UDim2.fromOffset(14, 42)
    sub.Size = UDim2.new(1, -28, 0, 24)
end
pageTitle(historyPage, "History", "Your recent feed activity will appear here.")
local historyPanel = make("Frame", {
    BackgroundColor3 = C.panel,
    Position = UDim2.fromOffset(12, 80),
    Size = UDim2.new(1, -24, 0, 92),
}, historyPage)
corner(historyPanel, 12)
stroke(historyPanel, C.line, 1)
local historyMsg = label(historyPanel, "No saved history yet", 14, C.muted, Enum.Font.GothamMedium)
historyMsg.Size = UDim2.fromScale(1, 1)
historyMsg.TextXAlignment = Enum.TextXAlignment.Center

-- Status page.
local statusPage = newPage("Status")
pageTitle(statusPage, "System Status", "Live interface diagnostics.")
local statusRows = {
    {"Interface", "Operational", C.green},
    {"Animations", "Enabled", C.green},
    {"Device", UserInputService.TouchEnabled and "Touch / Mobile" or "Desktop", C.white},
    {"Game actions", "Not connected", C.muted},
}
for i, row in ipairs(statusRows) do
    local r = make("Frame", {
        BackgroundColor3 = C.panel,
        Position = UDim2.fromOffset(12, 80 + (i - 1) * 57),
        Size = UDim2.new(1, -24, 0, 47),
    }, statusPage)
    corner(r, 10)
    stroke(r, C.line, 1)
    local l = label(r, row[1], 13, C.white, Enum.Font.GothamMedium)
    l.Position = UDim2.fromOffset(14, 0)
    l.Size = UDim2.new(0.55, -14, 1, 0)
    local v = label(r, row[2], 12, row[3], Enum.Font.GothamBold)
    v.AnchorPoint = Vector2.new(1, 0)
    v.Position = UDim2.new(1, -14, 0, 0)
    v.Size = UDim2.new(0.45, 0, 1, 0)
    v.TextXAlignment = Enum.TextXAlignment.Right
end

-- Settings page.
local settingsPage = newPage("Settings")
pageTitle(settingsPage, "Settings", "Customize the interface experience.")
local settingOptions = {
    {"Interface glow", "Red neon borders and accents"},
    {"Motion effects", "Smooth transitions and feedback"},
    {"Mobile layout", "Automatically scale for smaller screens"},
}
for i, row in ipairs(settingOptions) do
    local r = make("Frame", {
        BackgroundColor3 = C.panel,
        Position = UDim2.fromOffset(12, 80 + (i - 1) * 67),
        Size = UDim2.new(1, -24, 0, 56),
    }, settingsPage)
    corner(r, 10)
    stroke(r, C.line, 1)
    local l = label(r, row[1], 13, C.white, Enum.Font.GothamBold)
    l.Position = UDim2.fromOffset(13, 5)
    l.Size = UDim2.new(1, -26, 0, 23)
    local sub = label(r, row[2], 11, C.muted, Enum.Font.Gotham)
    sub.Position = UDim2.fromOffset(13, 28)
    sub.Size = UDim2.new(1, -26, 0, 20)
end

-- Advanced customization: live asset ID inputs and theme presets.
local assetHeading = label(settingsPage, "ASSET CUSTOMIZATION", 12, C.red2, Enum.Font.GothamBold)
assetHeading.Position = UDim2.fromOffset(12, 286)
assetHeading.Size = UDim2.new(1, -24, 0, 22)

local logoIdBox = make("TextBox", {
    Name = "LogoAssetId",
    PlaceholderText = "Logo image asset ID",
    Text = ASSETS.Logo ~= 0 and tostring(ASSETS.Logo) or "",
    ClearTextOnFocus = false,
    TextColor3 = C.white,
    PlaceholderColor3 = C.muted,
    TextSize = 12,
    Font = Enum.Font.Gotham,
    TextXAlignment = Enum.TextXAlignment.Left,
    BackgroundColor3 = C.panel2,
    Position = UDim2.fromOffset(12, 312),
    Size = UDim2.new(0.48, -8, 0, 38),
}, settingsPage)
corner(logoIdBox, 8)
stroke(logoIdBox, C.line, 1)

local backgroundIdBox = make("TextBox", {
    Name = "BackgroundAssetId",
    PlaceholderText = "Background image asset ID",
    Text = ASSETS.Background ~= 0 and tostring(ASSETS.Background) or "",
    ClearTextOnFocus = false,
    TextColor3 = C.white,
    PlaceholderColor3 = C.muted,
    TextSize = 12,
    Font = Enum.Font.Gotham,
    TextXAlignment = Enum.TextXAlignment.Left,
    BackgroundColor3 = C.panel2,
    Position = UDim2.new(0.52, 0, 0, 312),
    Size = UDim2.new(0.48, -12, 0, 38),
}, settingsPage)
corner(backgroundIdBox, 8)
stroke(backgroundIdBox, C.line, 1)

local feedAssetIdBox = make("TextBox", {
    Name = "FeedAssetId",
    PlaceholderText = "Feed item image asset ID (optional)",
    Text = ASSETS.FeedItem ~= 0 and tostring(ASSETS.FeedItem) or "",
    ClearTextOnFocus = false,
    TextColor3 = C.white,
    PlaceholderColor3 = C.muted,
    TextSize = 12,
    Font = Enum.Font.Gotham,
    TextXAlignment = Enum.TextXAlignment.Left,
    BackgroundColor3 = C.panel2,
    Position = UDim2.fromOffset(12, 358),
    Size = UDim2.new(1, -24, 0, 36),
}, settingsPage)
corner(feedAssetIdBox, 8)
stroke(feedAssetIdBox, C.line, 1)

local applyAssetsButton = button(settingsPage, "APPLY ASSETS", UDim2.fromOffset(126, 34), Color3.fromRGB(75, 5, 17), C.white)
applyAssetsButton.Position = UDim2.fromOffset(12, 402)
applyAssetsButton.TextSize = 11
applyAssetsButton.MouseButton1Click:Connect(function()
    local logoUri = assetUri(logoIdBox.Text)
    local bgUri = assetUri(backgroundIdBox.Text)
    ASSETS.Logo = tonumber(logoIdBox.Text) or 0
    ASSETS.Background = tonumber(backgroundIdBox.Text) or 0
    ASSETS.FeedItem = tonumber(feedAssetIdBox.Text) or 0

    logoImage.Image = logoUri
    logoImage.Visible = logoUri ~= ""
    crown.Visible = logoUri == ""

    backgroundImage.Image = bgUri
    backgroundImage.Visible = bgUri ~= ""
    backgroundShade.Visible = bgUri ~= ""
    local feedUri = assetUri(ASSETS.FeedItem)
    for card, parts in pairs(feedCardParts) do
        parts.image.Image = feedUri
        parts.image.Visible = feedUri ~= "" and not isPhone
        parts.icon.Visible = not parts.image.Visible and not isPhone
    end
    notify("Asset settings applied")
end)

local themeHeading = label(settingsPage, "ACCENT PRESETS", 12, C.red2, Enum.Font.GothamBold)
themeHeading.Position = UDim2.fromOffset(12, 448)
themeHeading.Size = UDim2.new(1, -24, 0, 20)

local themePresets = {
    {name = "Crimson", color = Color3.fromRGB(225, 15, 38)},
    {name = "Violet", color = Color3.fromRGB(145, 75, 255)},
    {name = "Ice", color = Color3.fromRGB(60, 170, 255)},
    {name = "Emerald", color = Color3.fromRGB(35, 190, 120)},
}
for i, preset in ipairs(themePresets) do
    local swatch = button(settingsPage, preset.name, UDim2.fromOffset(75, 31), C.panel2, C.white)
    swatch.Position = UDim2.fromOffset(12 + (i - 1) * 83, 472)
    swatch.TextSize = 10
    local swatchStroke = swatch:FindFirstChildOfClass("UIStroke")
    if swatchStroke then swatchStroke.Color = preset.color end
    swatch.MouseButton1Click:Connect(function()
        C.red = preset.color
        C.red2 = preset.color:Lerp(Color3.new(1, 1, 1), 0.22)
        for _, obj in ipairs(gui:GetDescendants()) do
            if obj:IsA("UIStroke") and (obj.Color == Color3.fromRGB(225, 15, 38) or obj.Color == Color3.fromRGB(255, 35, 54)) then
                obj.Color = C.red
            end
            if obj:IsA("TextLabel") and obj.TextColor3 == Color3.fromRGB(255, 35, 54) then
                obj.TextColor3 = C.red2
            end
        end
        notify(preset.name .. " theme selected")
    end)
end

-- Feed search filters cards by item name, rate, and metadata.
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local query = string.lower(searchBox.Text)
    local visibleCount = 0
    for card, parts in pairs(feedCardParts) do
        local searchable = string.lower(parts.name.Text .. " " .. parts.detail.Text)
        local match = query == "" or string.find(searchable, query, 1, true) ~= nil
        card.Visible = match
        if match then visibleCount += 1 end
    end
    detected.Text = tostring(visibleCount) .. " detected"
end)

setTab("Logs")

-- Dragging: works with mouse and touch.
local dragging = false
local dragInput
local dragStart
local startPosition

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPosition = main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

header.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(
            startPosition.X.Scale, startPosition.X.Offset + delta.X,
            startPosition.Y.Scale, startPosition.Y.Offset + delta.Y
        )
    end
end)

-- Adaptive desktop / tablet / phone layout.
-- Uses viewport-relative sizing on phones instead of shrinking the desktop UI.
local camera = workspace.CurrentCamera

local function updateScale()
    camera = workspace.CurrentCamera
    if not camera then return end

    local viewport = camera.ViewportSize
    isPhone = math.min(viewport.X, viewport.Y) < 560
    isCompact = viewport.X < 850

    if isPhone then
        mainScale.Scale = 1
        main.Size = UDim2.fromScale(0.96, 0.84)
        main.Position = UDim2.fromScale(0.5, 0.51)

        header.Position = UDim2.fromOffset(10, 7)
        header.Size = UDim2.new(1, -20, 0, 47)
        crown.Size = UDim2.fromOffset(32, 38)
        crown.TextSize = 29
        title.Position = UDim2.fromOffset(34, 0)
        title.Size = UDim2.fromOffset(105, 38)
        title.TextSize = 18
        titleHub.Position = UDim2.fromOffset(137, 0)
        titleHub.Size = UDim2.fromOffset(48, 38)
        titleHub.TextSize = 18
        connectionText.Visible = false
        statusDot.Visible = false
        minimize.Position = UDim2.new(1, -76, 0, 2)
        minimize.Size = UDim2.fromOffset(33, 31)
        close.Position = UDim2.new(1, -36, 0, 2)
        close.Size = UDim2.fromOffset(33, 31)

        sidebar.Position = UDim2.fromOffset(8, 57)
        sidebar.Size = UDim2.new(1, -16, 0, 49)
        sideLine.Visible = false
        hideButton.Visible = false

        local navWidth = math.max(52, math.floor((viewport.X * 0.96 - 36) / 4))
        for i, item in ipairs(navItems) do
            local b = navButtons[item.name]
            b.Position = UDim2.fromOffset(4 + (i - 1) * (navWidth + 3), 4)
            b.Size = UDim2.new(0, navWidth, 0, 40)
            local icon = b:FindFirstChildOfClass("TextLabel")
            if icon then
                icon.Position = UDim2.fromOffset(2, 0)
                icon.Size = UDim2.fromOffset(22, 40)
                icon.TextSize = 17
            end
            local txt = b:FindFirstChild("TextLabel", true)
            if txt and txt ~= icon then
                txt.Position = UDim2.fromOffset(23, 0)
                txt.Size = UDim2.new(1, -24, 1, 0)
                txt.TextSize = 10
            end
        end

        content.Position = UDim2.fromOffset(8, 113)
        content.Size = UDim2.new(1, -16, 1, -123)

        for _, page in pairs(pages) do
            page.Size = UDim2.fromScale(1, 1)
        end

        local toggleWidth = math.max(120, math.floor((viewport.X * 0.96 - 55) / 2))
        for _, child in ipairs(logsPage:GetChildren()) do
            if child:IsA("Frame") and (child:FindFirstChild("TextLabel") or child:FindFirstChildOfClass("TextButton")) then
                if child.Size.Y.Offset == 52 then
                    child.Size = UDim2.new(0, toggleWidth, 0, 45)
                    child.Position = child.Name == "Auto-JoinToggle"
                        and UDim2.fromOffset(4, 3)
                        or UDim2.new(1, -toggleWidth - 4, 0, 3)
                    local textObj = child:FindFirstChildOfClass("TextLabel")
                    if textObj then
                        textObj.TextSize = 11
                        textObj.Position = UDim2.fromOffset(8, 0)
                    end
                    local track = child:FindFirstChildOfClass("TextButton")
                    if track then
                        track.Size = UDim2.fromOffset(43, 25)
                        track.Position = UDim2.new(1, -49, 0.5, -12)
                        local knob = track:FindFirstChildOfClass("Frame")
                        if knob then
                            knob.Size = UDim2.fromOffset(19, 19)
                            -- Preserve the current on/off side.
                            if track.BackgroundColor3 == C.gray then
                                knob.Position = UDim2.fromOffset(3, 3)
                            else
                                knob.Position = UDim2.new(1, -22, 0, 3)
                            end
                        end
                    end
                end
            end
        end

        feedHeader.Position = UDim2.fromOffset(5, 56)
        feedHeader.Size = UDim2.new(1, -10, 0, 27)
        liveText.TextSize = 12
        searchBox.Position = UDim2.fromOffset(91, 1)
        searchBox.Size = UDim2.fromOffset(math.max(58, math.floor(viewport.X * 0.17)), 25)
        searchBox.TextSize = 9
        detected.TextSize = 10
        clearButton.Size = UDim2.fromOffset(53, 26)
        clearButton.TextSize = 10
        detected.Position = UDim2.new(1, -59, 0, 0)
        detected.Size = UDim2.fromOffset(75, 27)

        feed.Position = UDim2.fromOffset(2, 89)
        feed.Size = UDim2.new(1, -4, 1, -94)
        for card, parts in pairs(feedCardParts) do
            card.Size = UDim2.new(1, -2, 0, 76)
            parts.icon.Visible = false
            parts.image.Visible = false
            parts.name.Position = UDim2.fromOffset(14, 9)
            parts.name.Size = UDim2.new(1, -132, 0, 25)
            parts.name.TextSize = 11
            parts.detail.Position = UDim2.fromOffset(14, 39)
            parts.detail.Size = UDim2.new(1, -132, 0, 20)
            parts.detail.TextSize = 10
            parts.join.Size = UDim2.fromOffset(54, 32)
            parts.join.Position = UDim2.new(1, -119, 0.5, 0)
            parts.join.TextSize = 10
            parts.force.Size = UDim2.fromOffset(54, 32)
            parts.force.Position = UDim2.new(1, -7, 0.5, 0)
            parts.force.TextSize = 9
        end
    else
        mainScale.Scale = math.clamp(math.min(viewport.X / 850, viewport.Y / 540, 1), 0.68, 1)
        main.Size = UDim2.fromOffset(790, 485)
        main.Position = UDim2.fromScale(0.5, 0.52)

        header.Position = UDim2.fromOffset(18, 10)
        header.Size = UDim2.new(1, -36, 0, 48)
        crown.Size = UDim2.fromOffset(48, 44)
        crown.TextSize = 36
        title.Position = UDim2.fromOffset(48, 0)
        title.Size = UDim2.fromOffset(142, 44)
        title.TextSize = 25
        titleHub.Position = UDim2.fromOffset(187, 0)
        titleHub.Size = UDim2.fromOffset(65, 44)
        titleHub.TextSize = 25
        connectionText.Visible = true
        statusDot.Visible = true
        minimize.Position = UDim2.new(1, -82, 0, 4)
        minimize.Size = UDim2.fromOffset(38, 34)
        close.Position = UDim2.new(1, -38, 0, 4)
        close.Size = UDim2.fromOffset(38, 34)

        sidebar.Position = UDim2.fromOffset(12, 72)
        sidebar.Size = UDim2.new(0, 166, 1, -86)
        sideLine.Visible = true
        hideButton.Visible = true
        for i, item in ipairs(navItems) do
            local b = navButtons[item.name]
            b.Position = UDim2.fromOffset(8, 18 + (i - 1) * 59)
            b.Size = UDim2.new(1, -16, 0, 49)
            local icon = b:FindFirstChildOfClass("TextLabel")
            if icon then
                icon.Position = UDim2.fromOffset(10, 0)
                icon.Size = UDim2.fromOffset(32, 49)
                icon.TextSize = 25
            end
            local txt = b:FindFirstChild("TextLabel", true)
            if txt and txt ~= icon then
                txt.Position = UDim2.fromOffset(51, 0)
                txt.Size = UDim2.new(1, -57, 1, 0)
                txt.TextSize = 15
            end
        end

        content.Position = UDim2.fromOffset(190, 72)
        content.Size = UDim2.new(1, -204, 1, -86)
        for _, child in ipairs(logsPage:GetChildren()) do
            if child:IsA("Frame") and (child.Size.Y.Offset == 45 or child.Size.Y.Offset == 52) then
                if child:FindFirstChildOfClass("TextButton") then
                    local isFirst = child.Name == "Auto-JoinToggle"
                    child.Size = UDim2.fromOffset(220, 52)
                    child.Position = isFirst and UDim2.fromOffset(12, 4) or UDim2.fromOffset(246, 4)
                    local textObj = child:FindFirstChildOfClass("TextLabel")
                    if textObj then
                        textObj.TextSize = 14
                        textObj.Position = UDim2.fromOffset(14, 0)
                    end
                    local track = child:FindFirstChildOfClass("TextButton")
                    if track then
                        track.Size = UDim2.fromOffset(52, 30)
                        track.Position = UDim2.new(1, -65, 0.5, -15)
                        local knob = track:FindFirstChildOfClass("Frame")
                        if knob then
                            knob.Size = UDim2.fromOffset(24, 24)
                            if track.BackgroundColor3 == C.gray then
                                knob.Position = UDim2.fromOffset(3, 3)
                            else
                                knob.Position = UDim2.new(1, -27, 0, 3)
                            end
                        end
                    end
                end
            end
        end
        for _, card in ipairs(feedCards) do
            local parts = feedCardParts[card]
            if parts then
                card.Size = UDim2.new(1, -2, 0, 82)
                parts.image.Visible = assetUri(ASSETS.FeedItem) ~= ""
                parts.icon.Visible = not parts.image.Visible
                parts.name.Position = UDim2.fromOffset(95, 13)
                parts.name.Size = UDim2.new(1, -315, 0, 25)
                parts.name.TextSize = 15
                parts.detail.Position = UDim2.fromOffset(95, 42)
                parts.detail.Size = UDim2.new(1, -315, 0, 22)
                parts.detail.TextSize = 12
                parts.join.Size = UDim2.fromOffset(76, 39)
                parts.join.Position = UDim2.new(1, -104, 0.5, 0)
                parts.join.TextSize = 13
                parts.force.Size = UDim2.fromOffset(76, 39)
                parts.force.Position = UDim2.new(1, -12, 0.5, 0)
                parts.force.TextSize = 13
            end
        end
        feedHeader.Position = UDim2.fromOffset(12, 66)
        feedHeader.Size = UDim2.new(1, -24, 0, 30)
        searchBox.Position = UDim2.fromOffset(126, 1)
        searchBox.Size = UDim2.fromOffset(145, 28)
        searchBox.TextSize = 11
        feed.Position = UDim2.fromOffset(8, 103)
        feed.Size = UDim2.new(1, -16, 1, -111)
    end
end

updateScale()
if camera then
    camera:GetPropertyChangedSignal("ViewportSize"):Connect(updateScale)
end
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(updateScale)

-- Minimize to a small floating crown button.
local minimized = false
local restoreButton
minimize.MouseButton1Click:Connect(function()
    if minimized then return end
    minimized = true
    main.Visible = false
    restoreButton = make("TextButton", {
        Name = "SovereignRestore",
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 14, 0.5, 0),
        Size = UDim2.fromOffset(58, 58),
        BackgroundColor3 = C.bg,
        Text = "♛",
        TextColor3 = C.red2,
        TextSize = 31,
        Font = Enum.Font.GothamBlack,
        AutoButtonColor = false,
        ZIndex = 50,
    }, gui)
    corner(restoreButton, 18)
    stroke(restoreButton, C.red, 2)
    restoreButton.MouseButton1Click:Connect(function()
        main.Visible = true
        minimized = false
        restoreButton:Destroy()
    end)
end)

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Entrance animation.
local finalSize = main.Size
main.Size = UDim2.new(
    finalSize.X.Scale, finalSize.X.Offset - 18,
    finalSize.Y.Scale, finalSize.Y.Offset - 14
)
main.BackgroundTransparency = 0.15
tween(main, 0.32, {Size = finalSize, BackgroundTransparency = 0}, Enum.EasingStyle.Back)

-- Soft pulsing live indicator.
task.spawn(function()
    while gui.Parent do
        tween(liveDot, 0.65, {BackgroundTransparency = 0.65})
        task.wait(0.65)
        if not gui.Parent then break end
        tween(liveDot, 0.65, {BackgroundTransparency = 0})
        task.wait(0.65)
    end
end)

print("[Sovereign Hub] Advanced V3 UI loaded successfully.")
