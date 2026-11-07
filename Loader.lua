--[[
    MAIN HUB LOADER
    Game: Blox Fruits
    Hub: Redz
]]

local Games = {
    ["Blox Fruits"] = {
        Hubs = {
            ["Redz Hub"] = {
                Loader = "https://api.aurorax.site/files/v5/loaders/ea511cab58cf0ba221d15c9adcc67e71"
            }
        }
    }
}

-- Main loader configuration
local SelectedGame = "Blox Fruits"
local SelectedHub = "Redz Hub"

local GameData = Games[SelectedGame]
local HubData = GameData.Hubs[SelectedHub]

-- Load selected hub
local success, result = pcall(function()
    local source = game:HttpGet(HubData.Loader)
    local scriptFunction = loadstring(source)

    assert(scriptFunction, "Unable to compile loader")
    scriptFunction()
end)

if not success then
    warn("[Main Loader] Error: " .. tostring(result))
end
