local WindUI = loadstring(game:HttpGet(
    "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"
))()

local Window = WindUI:CreateWindow({
    Title = "Sovereign Hub",
    Icon = "shield",
    Author = "by Aniket",
    Folder = "SovereignHub",
    Size = UDim2.fromOffset(580, 400),
    Theme = "Dark"
})

local Main = Window:Tab({
    Title = "Main",
    Icon = "house"
})

Main:Button({
    Title = "Example Button",
    Desc = "Click to test",
    Callback = function()
        print("Sovereign Hub loaded!")
    end
})

Main:Toggle({
    Title = "Example Toggle",
    Desc = "Toggle an option",
    Default = false,
    Callback = function(value)
        print("Toggle:", value)
    end
})

Main:Paragraph({
    Title = "Welcome",
    Desc = "Welcome to Sovereign Hub!"
})
