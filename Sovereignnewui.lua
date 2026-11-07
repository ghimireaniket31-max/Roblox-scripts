
-- Mira Hub | Redz UI Library
local Library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/ghimireaniket31-max/Library/refs/heads/main/Ui"
))()

local Window = Library:MakeWindow({
    Title = "Mira Hub",
    SubTitle = "Mira Hub | Community",
    SaveFolder = "MiraHub"
})

-- Minimize button
local Minimize = Window:NewMinimizer({
    KeyCode = Enum.KeyCode.LeftControl
})

Minimize:CreateMobileMinimizer({
    Image = "rbxassetid://132421227678548",
    BackgroundColor3 = Color3.fromRGB(20, 20, 20)
})

-- Create tabs
local Main = Window:MakeTab({
    Title = "Main",
    Icon = "home"
})

local Settings = Window:MakeTab({
    Title = "Settings",
    Icon = "settings"
})

local Misc = Window:MakeTab({
    Title = "Misc",
    Icon = "info"
})

-- Variables
local notificationsEnabled = true
local selectedMode = "Normal"
local uiScale = 1

-- MAIN TAB
Main:AddSection("Main Features")

Main:AddParagraph(
    "Welcome to Mira Hub",
    "Your hub is ready. Configure the options below."
)

Main:AddToggle({
    Name = "Enable Notifications",
    Description = "Turn hub notifications on or off.",
    Default = true,

    Callback = function(value)
        notificationsEnabled = value
        print("Notifications:", value)
    end
})

Main:AddToggle({
    Name = "Example Feature",
    Description = "Example toggle with an actual on/off state.",
    Default = false,

    Callback = function(value)
        _G.ExampleFeatureEnabled = value
        print("Example Feature:", value)
    end
})

Main:AddButton({
    Name = "Test Notification",
    Description = "Send a test notification.",

    Callback = function()
        if notificationsEnabled then
            Window:Notify({
                Title = "Mira Hub",
                Content = "The button is working!",
                Duration = 3
            })
        end
    end
})

-- SETTINGS TAB
Settings:AddSection("Hub Settings")

Settings:AddDropdown({
    Name = "Select Mode",
    Options = {"Normal", "Performance", "Visual"},
    Default = "Normal",

    Callback = function(value)
        selectedMode = value
        print("Selected mode:", value)
    end
})

Settings:AddSlider({
    Name = "UI Scale",
    Min = 0.8,
    Max = 1.2,
    Default = 1,
    Increment = 0.1,

    Callback = function(value)
        uiScale = value
        Window:SetUIScale(value)
    end
})

Settings:AddButton({
    Name = "Reset Settings",

    Callback = function()
        selectedMode = "Normal"
        uiScale = 1
        Window:SetUIScale(1)

        Window:Notify({
            Title = "Settings",
            Content = "Settings reset!",
            Duration = 3
        })
    end
})

-- MISC TAB
Misc:AddSection("Information")

Misc:AddParagraph(
    "Hub Information",
    "Mira Hub\nVersion: 1.0\nStatus: Loaded"
)

Misc:AddButton({
    Name = "Print Hub Status",

    Callback = function()
        print("Mira Hub is running!")
        print("Mode:", selectedMode)
        print("UI Scale:", uiScale)
    end
})
