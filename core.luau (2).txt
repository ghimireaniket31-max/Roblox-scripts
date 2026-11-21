-- Recovered Luau source by ZeroVector
local UserInputService = game:GetService("UserInputService")
local v = FARM_RANGE
local n = v or 300
FARM_RANGE = n
local v2 = Range
local n2 = v2 or 100
Range = n2
local v3 = ply
local Players = v3 or game:GetService("Players")
ply = Players
local v4 = Core
local tbl = v4 or {}
Core = tbl
getgenv().Core = Core
ply = game.Players
plr = ply.LocalPlayer
local character = plr.Character
local humanoidRootPart = character and plr.Character:FindFirstChild("HumanoidRootPart")
Root = humanoidRootPart
local ReplicatedStorage = game:GetService("ReplicatedStorage")
replicated = ReplicatedStorage
Lv = game.Players.LocalPlayer.Data.Level.Value
local TeleportService_ = game:GetService("TeleportService")
TeleportService = TeleportService_
local TweenService = game:GetService("TweenService")
TW = TweenService
local Lighting_ = game:GetService("Lighting")
Lighting = Lighting_
Enemies = workspace.Enemies
local VirtualInputManager = game:GetService("VirtualInputManager")
vim1 = VirtualInputManager
local VirtualUser = game:GetService("VirtualUser")
vim2 = VirtualUser
TeamSelf = plr.Team
local RunService = game:GetService("RunService")
RunSer = RunService
local Stats_ = game:GetService("Stats")
Stats = Stats_
local character2 = plr.Character
local n3 = character2 and plr.Character:FindFirstChild("Energy") and plr.Character.Energy.Value or 100
Energy = n3
BringConnections = {}
BossList = {}
MaterialList = {}
NPCList = {}
PlrList = {}
shouldTween = false
getgenv().OnFarm = false
getgenv().AutoMaterial = false
NextIs = false
senth = false
senth2 = false
SoulGuitar = false
KenTest = true
debug = false
Brazier1 = false
Brazier2 = false
Brazier3 = false
Sec = 0.1
ClickState = 0
Num_self = 25

for k, player in pairs(game:GetService("Players"):GetPlayers()) do
    table.insert(PlrList, player.Name)
end

game:GetService("Players").PlayerAdded:Connect(function(player)
    table.insert(PlrList, player.Name)
end)

game:GetService("Players").PlayerRemoving:Connect(function(player)
    local v5 = table.find(PlrList, player.Name)

    if v5 then
        table.remove(PlrList, v5)
    end
end)

PrehisUser = {Find = false, Skills = false, DE = false}

plr.CharacterAdded:Connect(function(character3)
    local humanoidRootPart2 = character3:WaitForChild("HumanoidRootPart", 15)

    if humanoidRootPart2 then
        Root = humanoidRootPart2
    end
end)

local loading, v5

repeat
    loading = plr.PlayerGui:WaitForChild("Main"):WaitForChild("Loading")
    v5 = loading and game:IsLoaded()
    task.wait()
until v5

local flag = game.PlaceId == 2753915549 or game.PlaceId == 85211729168715
World1 = flag
local flag2 = game.PlaceId == 4442272183 or game.PlaceId == 79091703265657
World2 = flag2
local flag3 = game.PlaceId == 7449423635 or game.PlaceId == 100117331123089
World3 = flag3

Marines = function()
    replicated.Remotes.CommF_:InvokeServer("SetTeam", "Marines")
end

Pirates = function()
    replicated.Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
end

if World1 then
    BossList = {
        "The Gorilla King",
        "Bobby",
        "The Saw",
        "Yeti",
        "Mob Leader",
        "Vice Admiral",
        "Saber Expert",
        "Warden",
        "Chief Warden",
        "Swan",
        "Magma Admiral",
        "Fishman Lord",
        "Wysper",
        "Thunder God",
        "Cyborg",
        "Ice Admiral",
        "Greybeard",
    }
elseif World2 then
    BossList = {
        "Diamond",
        "Jeremy",
        "Orbitus",
        "Don Swan",
        "Smoke Admiral",
        "Awakened Ice Admiral",
        "Tide Keeper",
        "Darkbeard",
        "Cursed Captain",
        "Order",
    }
elseif World3 then
    BossList = {
        "Stone",
        "Hydra Leader",
        "Kilo Admiral",
        "Captain Elephant",
        "Beautiful Pirate",
        "Cake Queen",
        "Dough King",
        "Longma",
        "Soul Reaper",
        "rip_indra True Form",
        "Tyrant of the Skies",
    }
end

if World1 then
    MaterialList = {
        "Leather + Scrap Metal",
        "Angel Wings",
        "Magma Ore",
        "Fish Tail",
    }
elseif World2 then
    MaterialList = {
        "Leather + Scrap Metal",
        "Radioactive Material",
        "Ectoplasm",
        "Mystic Droplet",
        "Magma Ore",
        "Vampire Fang",
    }
elseif World3 then
    MaterialList = {
        "Scrap Metal",
        "Demonic Wisp",
        "Conjured Cocoa",
        "Dragon Scale",
        "Gunpowder",
        "Fish Tail",
        "Mini Tusk",
    }
end

DungeonTables = {
    "Flame",
    "Ice",
    "Quake",
    "Light",
    "Dark",
    "String",
    "Rumble",
    "Magma",
    "Human: Buddha",
    "Sand",
    "Bird: Phoenix",
    "Dough",
}

RenMon = {
    "Snow Lurker",
    "Arctic Warrior",
    "Hidden Key",
    "Awakened Ice Admiral",
}

CursedTables = {
    Mob = "Mythological Pirate",
    Mob2 = "Cursed Skeleton",
    [1] = "Hell's Messenger",
    Mob3 = "Cursed Skeleton",
    [2] = "Heaven's Guardian",
}

Past = {
    "Part",
    "SpawnLocation",
    "Terrain",
    "WedgePart",
    "MeshPart",
}

BartMon = {"Swan Pirate", "Jeremy"}
CitizenTable = {"Forest Pirate", "Captain Elephant"}
Human_v3_Mob = {"Fajita", "Jeremy", "Diamond"}

AllBoats = {
    "Beast Hunter",
    "Lantern",
    "Guardian",
    "Grand Brigade",
    "Dinghy",
    "Sloop",
    "The Sentinel",
}

mastery1 = {"Cookie Crafter"}
mastery2 = {"Reborn Skeleton"}

local tbl2 = {
    ["Pirate Millionaire"] = CFrame.new(-712.8272705078125, 98.5770492553711, 5711.9541015625),
    ["Pistol Billionaire"] = CFrame.new(-723.4331665039062, 147.42906188964844, 5931.9931640625),
    ["Dragon Crew Warrior"] = CFrame.new(7021.50439453125, 55.76270294189453, -730.1290893554688),
    ["Dragon Crew Archer"] = CFrame.new(6625, 378, 244),
    ["Female Islander"] = CFrame.new(4692.7939453125, 797.9766845703125, 858.8480224609375),
    ["Venomous Assailant"] = CFrame.new(4902, 670, 39),
    ["Marine Commodore"] = CFrame.new(2401, 123, -7589),
    ["Marine Rear Admiral"] = CFrame.new(3588, 229, -7085),
    ["Fishman Raider"] = CFrame.new(-10941, 332, -8760),
    ["Fishman Captain"] = CFrame.new(-11035, 332, -9087),
    ["Forest Pirate"] = CFrame.new(-13446, 413, -7760),
    ["Mythological Pirate"] = CFrame.new(-13510, 584, -6987),
    ["Jungle Pirate"] = CFrame.new(-11778, 426, -10592),
    ["Musketeer Pirate"] = CFrame.new(-13282, 496, -9565),
    ["Reborn Skeleton"] = CFrame.new(-8764, 142, 5963),
    ["Living Zombie"] = CFrame.new(-10227, 421, 6161),
    ["Demonic Soul"] = CFrame.new(-9579, 6, 6194),
    ["Posessed Mummy"] = CFrame.new(-9579, 6, 6194),
    ["Peanut Scout"] = CFrame.new(-1993, 187, -10103),
    ["Peanut President"] = CFrame.new(-2215, 159, -10474),
    ["Ice Cream Chef"] = CFrame.new(-877, 118, -11032),
    ["Ice Cream Commander"] = CFrame.new(-877, 118, -11032),
    ["Cookie Crafter"] = CFrame.new(-2021, 38, -12028),
    ["Cake Guard"] = CFrame.new(-2024, 38, -12026),
    ["Baking Staff"] = CFrame.new(-1932, 38, -12848),
    ["Head Baker"] = CFrame.new(-1932, 38, -12848),
    ["Cocoa Warrior"] = CFrame.new(95, 73, -12309),
    ["Chocolate Bar Battler"] = CFrame.new(647, 42, -12401),
    ["Sweet Thief"] = CFrame.new(116, 36, -12478),
    ["Candy Rebel"] = CFrame.new(47, 61, -12889),
    Ghost = CFrame.new(5251, 5, 1111),
}

PosMsList = tbl2

local tbl3 = {
    RFJobsRemoteFunction = replicated.Modules.Net["RF/JobsRemoteFunction"],
    RFCraft = replicated:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/Craft"),
}

Remotes = tbl3

EquipWeapon = function(arg)
    if not arg then
        return
    end

    if plr.Backpack:FindFirstChild(arg) then
        plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild(arg))
    end
end

weaponSc = function(arg)
    for k, child in pairs(plr.Backpack:GetChildren()) do
        if child:IsA("Tool") and child.ToolTip == arg then
            EquipWeapon(child.Name)
        end
    end
end

Attack = {}
Attack.__index = Attack

Attack.Alive = function(arg)
    if not arg then
        return false
    end
    local humanoid = arg:FindFirstChild("Humanoid")
    local humanoidRootPart2 = arg:FindFirstChild("HumanoidRootPart")
    local flag4 = humanoid ~= nil and humanoid.Health > 0 and humanoidRootPart2 ~= nil
    return flag4
end

Attack.Pos = function(arg, arg2)
    local flag4 = (Root.Position - arg.Position).Magnitude <= arg2
    return flag4
end

Attack.Dist = function(arg, arg2)
    local humanoidRootPart2 = arg and arg:FindFirstChild("HumanoidRootPart")
    local flag4 = humanoidRootPart2 and (Root.Position - humanoidRootPart2.Position).Magnitude <= arg2 or false
    return flag4
end

Attack.DistH = function(arg, arg2)
    local humanoidRootPart2 = arg and arg:FindFirstChild("HumanoidRootPart")
    local flag4 = humanoidRootPart2 and arg2 < (Root.Position - humanoidRootPart2.Position).Magnitude or false
    return flag4
end

Attack.Kill = function(arg, arg2)
    if arg and arg2 then
        local humanoidRootPart2 = arg:FindFirstChild("HumanoidRootPart")
        if not humanoidRootPart2 then
            return
        end

        if not arg:GetAttribute("Locked") then
            arg:SetAttribute("Locked", humanoidRootPart2.CFrame)
        end

        local position = arg:GetAttribute("Locked").Position
        PosMon = position
        BringEnemy()
        EquipWeapon(_G.SelectWeapon)
        local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        local toolTip = tool and tool:FindFirstChild("ToolTip") and tool.ToolTip or ""

        if toolTip == "Blox Fruit" then
            _tp(humanoidRootPart2.CFrame * CFrame.new(0, 30, 0) * CFrame.Angles(0, math.rad(90), 0))
        else
            _tp(humanoidRootPart2.CFrame * CFrame.new(0, 10, 0) * CFrame.Angles(0, math.rad(180), 0))
        end

        if RandomCFrame then
            task.wait(0.5)
            _tp(humanoidRootPart2.CFrame * CFrame.new(0, 30, 25))
            task.wait(0.5)
            _tp(humanoidRootPart2.CFrame * CFrame.new(25, 30, 0))
            task.wait(0.5)
            _tp(humanoidRootPart2.CFrame * CFrame.new(-25, 30, 0))
            task.wait(0.5)
            _tp(humanoidRootPart2.CFrame * CFrame.new(0, 30, 25))
            task.wait(0.5)
            _tp(humanoidRootPart2.CFrame * CFrame.new(-25, 30, 0))
        end
    end
end

Attack.Kill2 = function(arg, arg2)
    if arg and arg2 then
        if not arg:GetAttribute("Locked") then
            arg:SetAttribute("Locked", arg.HumanoidRootPart.CFrame)
        end

        local position = arg:GetAttribute("Locked").Position
        PosMon = position
        BringEnemy()
        EquipWeapon(_G.SelectWeapon)
        local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        local toolTip = tool and tool:FindFirstChild("ToolTip") and tool.ToolTip or ""

        if toolTip == "Blox Fruit" then
            _tp(arg.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0) * CFrame.Angles(0, math.rad(90), 0))
        else
            _tp(arg.HumanoidRootPart.CFrame * CFrame.new(0, 10, 8) * CFrame.Angles(0, math.rad(180), 0))
        end

        if RandomCFrame then
            task.wait(0.1)
            _tp(arg.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
            task.wait(0.1)
            _tp(arg.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0))
            task.wait(0.1)
            _tp(arg.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
            task.wait(0.1)
            _tp(arg.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
            task.wait(0.1)
            _tp(arg.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
        end
    end
end

Attack.KillSea = function(arg, arg2)
    if arg and arg2 then
        if not arg:GetAttribute("Locked") then
            arg:SetAttribute("Locked", arg.HumanoidRootPart.CFrame)
        end

        local position = arg:GetAttribute("Locked").Position
        PosMon = position
        BringEnemy()
        EquipWeapon(_G.SelectWeapon)
        local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        local toolTip = tool and tool:FindFirstChild("ToolTip") and tool.ToolTip or ""

        if toolTip == "Blox Fruit" then
            _tp(arg.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0) * CFrame.Angles(0, math.rad(90), 0))
        else
            notween(arg.HumanoidRootPart.CFrame * CFrame.new(0, 50, 8))
            task.wait(0.85)
            notween(arg.HumanoidRootPart.CFrame * CFrame.new(0, 400, 0))
            task.wait(1)
        end
    end
end

Attack.Sword = function(arg, arg2)
    if arg and arg2 then
        if not arg:GetAttribute("Locked") then
            arg:SetAttribute("Locked", arg.HumanoidRootPart.CFrame)
        end

        local position = arg:GetAttribute("Locked").Position
        PosMon = position
        BringEnemy()
        weaponSc("Sword")
        _tp(arg.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))

        if RandomCFrame then
            task.wait(0.1)
            _tp(arg.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
            task.wait(0.1)
            _tp(arg.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0))
            task.wait(0.1)
            _tp(arg.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
            task.wait(0.1)
            _tp(arg.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
            task.wait(0.1)
            _tp(arg.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
        end
    end
end

Attack.Mas = function(arg, arg2)
    if arg and arg2 then
        if not arg:GetAttribute("Locked") then
            arg:SetAttribute("Locked", arg.HumanoidRootPart.CFrame)
        end

        local position = arg:GetAttribute("Locked").Position
        PosMon = position
        BringEnemy()

        if arg.Humanoid.Health <= HealthM then
            weaponSc("Blox Fruit")
            _tp(arg.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
            local selectedMasterySkills = _G.SelectedMasterySkills
            local tbl4 = selectedMasterySkills

            if type(selectedMasterySkills) == "string" then
                tbl4 = {selectedMasterySkills}
            elseif type(selectedMasterySkills) ~= "table" then
                tbl4 = {"Z", "X", "C", "V", "F"}
            end

            for k, v6 in pairs(tbl4) do
                if type(k) == "number" and type(v6) == "string" then
                    Useskills("Blox Fruit", v6)
                elseif type(k) == "string" and v6 == true then
                    Useskills("Blox Fruit", k)
                end
            end
        else
            weaponSc("Melee")
            _tp(arg.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0))
        end
    end
end

Attack.Masgun = function(arg, arg2)
    if arg and arg2 then
        if not arg:GetAttribute("Locked") then
            arg:SetAttribute("Locked", arg.HumanoidRootPart.CFrame)
        end

        local position = arg:GetAttribute("Locked").Position
        PosMon = position
        BringEnemy()

        if arg.Humanoid.Health <= HealthM then
            weaponSc("Gun")
            _tp(arg.HumanoidRootPart.CFrame * CFrame.new(0, 35, 8))
            local selectedMasterySkills = _G.SelectedMasterySkills
            local tbl4 = selectedMasterySkills

            if type(selectedMasterySkills) == "string" then
                tbl4 = {selectedMasterySkills}
            elseif type(selectedMasterySkills) ~= "table" then
                tbl4 = {"Z", "X", "C", "V", "F"}
            end

            for k, v6 in pairs(tbl4) do
                if type(k) == "number" and type(v6) == "string" then
                    Useskills("Gun", v6)
                elseif type(k) == "string" and v6 == true then
                    Useskills("Gun", k)
                end
            end
        else
            weaponSc("Melee")
            _tp(arg.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0))
        end
    end
end

statsSetings = function(arg, arg2)
    if arg == "Melee" then
        if plr.Data.Points.Value ~= 0 then
            replicated.Remotes.CommF_:InvokeServer("AddPoint", "Melee", arg2)
        end
    elseif arg == "Defense" then
        if plr.Data.Points.Value ~= 0 then
            replicated.Remotes.CommF_:InvokeServer("AddPoint", "Defense", arg2)
        end
    elseif arg == "Sword" then
        if plr.Data.Points.Value ~= 0 then
            replicated.Remotes.CommF_:InvokeServer("AddPoint", "Sword", arg2)
        end
    elseif arg == "Gun" then
        if plr.Data.Points.Value ~= 0 then
            replicated.Remotes.CommF_:InvokeServer("AddPoint", "Gun", arg2)
        end
    elseif arg == "Devil" and plr.Data.Points.Value ~= 0 then
        replicated.Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", arg2)
    end
end

BringEnemy = function(arg)
    local v6 = arg
    if not _B then
        return
    end

    if not v6 then
        local character3 = plr.Character
        local humanoidRootPart2 = character3 and plr.Character:FindFirstChild("HumanoidRootPart")
        if not humanoidRootPart2 then
            return
        end
        local huge = math.huge

        for i, child in ipairs(workspace.Enemies:GetChildren()) do
            local humanoid = child:FindFirstChildOfClass("Humanoid")
            local humanoidRootPart3 = child:FindFirstChild("HumanoidRootPart")

            if humanoid and humanoidRootPart3 and humanoid.Health > 0 then
                local magnitude = (humanoidRootPart3.Position - humanoidRootPart2.Position).Magnitude

                if magnitude < huge then
                    huge = magnitude
                    v6 = child
                end
            end
        end

        if not v6 then
            return
        end
    end

    local flag4 = false

    Mobs = function(arg2)
        local humanoid = arg2:FindFirstChildOfClass("Humanoid")
        local humanoidRootPart2 = arg2:FindFirstChild("HumanoidRootPart")
        local flag5 = humanoid and humanoidRootPart2 and humanoid.Health > 0
        return flag5, humanoidRootPart2, humanoid
    end

    Network = function(arg2)
        if isnetworkowner then
            return isnetworkowner(arg2)
        end
        local flag5 = arg2.ReceiveAge == 0

        if flag5 then
            if arg2.Anchored then
                flag5 = false
            else
                flag5 = true
            end
        end

        if flag5 then
            flag5 = arg2.Velocity.Magnitude > 0
        end

        return flag5
    end

    pcall(function()
        if sethiddenproperty then
            sethiddenproperty(plr, "SimulationRadius", math.huge)
        end

        local position = v6.HumanoidRootPart.Position

        for i, child in ipairs(workspace.Enemies:GetChildren()) do
            if child ~= v6 then
                local v7, v8, v9 = Mobs(child)

                if v7 and child.Name == v6.Name then
                    local magnitude = (v8.Position - position).Magnitude

                    if magnitude <= 3000 then
                        if not v8:FindFirstChild("BodyVelocity") then
                            local bodyVelocity = Instance.new("BodyVelocity")
                            bodyVelocity.Name = "BodyVelocity"
                            bodyVelocity.MaxForce = Vector3.new(1000000000, 1000000000, 1000000000)
                            bodyVelocity.Velocity = Vector3.zero
                            bodyVelocity.Parent = v8
                        end

                        if magnitude <= 10 then
                            flag4 = true
                        end

                        if not flag4 and Network(v8) then
                            v8.CFrame = CFrame.new(position)
                        end

                        v8.CanCollide = false
                        v9.WalkSpeed = 0
                        v9.JumpPower = 0
                    end
                end
            end
        end

        if v6 and v6:FindFirstChild("HumanoidRootPart") then
            v6.HumanoidRootPart.CanCollide = false
            v6.Humanoid.WalkSpeed = 0
            v6.Humanoid.JumpPower = 0
        end
    end)
end

IsSkillReady = function(arg, arg2)
    local localPlayer = game.Players.LocalPlayer
    local name = nil

    if localPlayer.Character then
        for k, child in pairs(localPlayer.Character:GetChildren()) do
            if child:IsA("Tool") and child.ToolTip == arg then
                name = child.Name
                break
            end
        end
    end

    if not name and localPlayer.Backpack then
        for k, child in pairs(localPlayer.Backpack:GetChildren()) do
            if child:IsA("Tool") and child.ToolTip == arg then
                name = child.Name
                break
            end
        end
    end

    if name and localPlayer.PlayerGui:FindFirstChild("Main") and localPlayer.PlayerGui.Main:FindFirstChild("Skills") then
        local v6 = localPlayer.PlayerGui.Main.Skills:FindFirstChild(name)

        if v6 then
            local v7 = v6:FindFirstChild(arg2)

            if v7 then
                local lock = v7:FindFirstChild("Lock")
                local locked = lock or v7:FindFirstChild("Locked")
                if locked and locked.Visible then
                    return false
                end
                local cooldown = v7:FindFirstChild("Cooldown")
                if cooldown and cooldown.Visible and (cooldown.Size.X.Scale > 0.05 or cooldown.AbsoluteSize.X > 5) then
                    return false
                end
                return true
            end
        end
    end

    return true
end

Useskills = function(arg, arg2)
    if arg == "Melee" then
        weaponSc("Melee")
        if not IsSkillReady(arg, arg2) then
            return
        end
        vim1:SendKeyEvent(true, arg2, false, game)
        task.wait(0.04)
        vim1:SendKeyEvent(false, arg2, false, game)
        task.wait(0.04)
    elseif arg == "Sword" then
        weaponSc("Sword")
        if not IsSkillReady(arg, arg2) then
            return
        end
        vim1:SendKeyEvent(true, arg2, false, game)
        task.wait(0.04)
        vim1:SendKeyEvent(false, arg2, false, game)
        task.wait(0.04)
    elseif arg == "Blox Fruit" then
        weaponSc("Blox Fruit")
        if not IsSkillReady(arg, arg2) then
            return
        end
        vim1:SendKeyEvent(true, arg2, false, game)
        task.wait(0.04)
        vim1:SendKeyEvent(false, arg2, false, game)
        task.wait(0.04)
    elseif arg == "Gun" then
        weaponSc("Gun")
        if not IsSkillReady(arg, arg2) then
            return
        end
        vim1:SendKeyEvent(true, arg2, false, game)
        task.wait(0.04)
        vim1:SendKeyEvent(false, arg2, false, game)
        task.wait(0.04)
    end

    if arg == "nil" and arg2 == "Y" then
        vim1:SendKeyEvent(true, "Y", false, game)
        task.wait(0.04)
        vim1:SendKeyEvent(false, "Y", false, game)
        task.wait(0.04)
    end
end

local v6 = getrawmetatable(game)
local namecall = v6.__namecall
setreadonly(v6, false)

v6.__namecall = newcclosure(function(...)
    local tbl4 = {...}
    local v7 = getnamecallmethod()
    if tostring(v7) ~= "FireServer" or tostring(tbl4[1]) ~= "RemoteEvent" or tostring(tbl4[2]) == "true" or tostring(tbl4[2]) == "false" or (not _G.FarmMastery_G or SoulGuitar) and not _G.FarmMastery_Dev and not _G.FarmBlazeEM and not _G.Prehis_Skills and not _G.SeaBeast1 and not _G.FishBoat and not _G.PGB and not _G.Leviathan1 and not _G.Complete_Trials and (not _G.AimMethod or ABmethod ~= "Aim Player") and (not _G.AimMethod or ABmethod ~= "Nearest Aim") then
        return namecall(...)
    end
    tbl4[2] = MousePos
    return namecall(unpack(tbl4))
end)

GetNearestEnemy = function(arg)
    local character3 = plr.Character
    local humanoidRootPart2 = character3 and plr.Character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart2 then
        return nil
    end
    local v7 = nil
    local v8 = nil

    for i, child in ipairs(workspace.Enemies:GetChildren()) do
        if child:IsA("Model") and (typeof(arg) == "table" and table.find(arg, child.Name) or child.Name == arg) then
            local humanoid = child:FindFirstChild("Humanoid")
            local humanoidRootPart3 = child:FindFirstChild("HumanoidRootPart")

            if humanoid and humanoidRootPart3 and humanoid.Health > 0 then
                local magnitude = (humanoidRootPart3.Position - humanoidRootPart2.Position).Magnitude

                if not v8 or magnitude < v8 then
                    v7 = child
                    v8 = magnitude
                end
            end
        end
    end

    return v7, v8
end

GetConnectionEnemies = function(arg)
    local character3 = plr.Character
    local humanoidRootPart2 = character3 and plr.Character:FindFirstChild("HumanoidRootPart")

    search = function(arg2)
        local v7 = nil
        local v8 = nil

        for i, child in ipairs(arg2:GetChildren()) do
            if child:IsA("Model") and (typeof(arg) == "table" and table.find(arg, child.Name) or child.Name == arg) then
                local humanoid = child:FindFirstChild("Humanoid")

                if humanoid and humanoid.Health > 0 then
                    local humanoidRootPart3 = child:FindFirstChild("HumanoidRootPart")
                    local magnitude = humanoidRootPart2 and humanoidRootPart3 and (humanoidRootPart3.Position - humanoidRootPart2.Position).Magnitude or math.huge

                    if not v7 or magnitude < v8 then
                        v7 = child
                        v8 = magnitude
                    end
                end
            end
        end

        return v7
    end

    local v7 = search(workspace.Enemies)
    local v8 = v7 or search(replicated)
    return v8
end

LowCpu = function()
    local v7, lighting, terrain, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, n4
    n4 = 1

    while true do
        if n4 == 1 then
            v7 = game
            lighting = v7.Lighting
            terrain = v7.Workspace.Terrain
            terrain.WaterWaveSize = 0
            terrain.WaterWaveSpeed = 0
            terrain.WaterReflectance = 0
            terrain.WaterTransparency = 0
            lighting.GlobalShadows = false
            lighting.FogEnd = 9000000000
            lighting.Brightness = 0
            settings().Rendering.QualityLevel = "Level01"
            v8, v9, v10 = pairs(v7:GetDescendants())
            v11 = v10
            n4 = 2
        elseif n4 == 2 then
            v12, v13 = v8(v9, v11)

            if v12 == nil then
                n4 = 16
            else
                n4 = 3
            end
        elseif n4 == 3 then
            v11 = v12

            if not v13:IsA("Part") and not v13:IsA("Union") and not v13:IsA("CornerWedgePart") and not v13:IsA("TrussPart") then
                n4 = 5
            else
                n4 = 4
            end
        elseif n4 == 4 then
            v13.Material = "Plastic"
            v13.Reflectance = 0
            n4 = 2
        elseif n4 == 5 then
            if v13:IsA("Decal") then
                n4 = 7
            else
                n4 = 6
            end
        elseif n4 == 6 then
            if v13:IsA("Texture") then
                n4 = 7
            else
                n4 = 8
            end
        elseif n4 == 7 then
            v13.Transparency = 1
            n4 = 2
        elseif n4 == 8 then
            if not v13:IsA("ParticleEmitter") and not v13:IsA("Trail") then
                n4 = 10
            else
                n4 = 9
            end
        elseif n4 == 9 then
            v13.Lifetime = NumberRange.new(0)
            n4 = 2
        elseif n4 == 10 then
            if v13:IsA("Explosion") then
                n4 = 11
            else
                n4 = 12
            end
        elseif n4 == 11 then
            v13.BlastPressure = 1
            v13.BlastRadius = 1
            n4 = 2
        elseif n4 == 12 then
            if not v13:IsA("Fire") and not v13:IsA("SpotLight") and not v13:IsA("Smoke") and not v13:IsA("Sparkles") then
                n4 = 14
            else
                n4 = 13
            end
        elseif n4 == 13 then
            v13.Enabled = false
            n4 = 2
        elseif n4 == 14 then
            if v13:IsA("MeshPart") then
                n4 = 15
            else
                n4 = 2
            end
        elseif n4 == 15 then
            v13.Material = "Plastic"
            v13.Reflectance = 0
            v13.TextureID = 1.0385902758728956e+16
            n4 = 2
        elseif n4 == 16 then
            v14, v15, v16 = pairs(lighting:GetChildren())
            v17 = v16
            n4 = 17
        elseif n4 == 17 then
            v18, v19 = v14(v15, v17)

            if v18 == nil then
                n4 = 20
            else
                n4 = 18
            end
        elseif n4 == 18 then
            v17 = v18

            if not v19:IsA("BlurEffect") and not v19:IsA("SunRaysEffect") and not v19:IsA("ColorCorrectionEffect") and not v19:IsA("BloomEffect") and not v19:IsA("DepthOfFieldEffect") then
                n4 = 17
            else
                n4 = 19
            end
        elseif n4 == 19 then
            v19.Enabled = false
            n4 = 17
        elseif n4 == 20 then
            return
        end
    end
end

CheckF = function()
    if not GetBP("Dragon-Dragon") and not GetBP("Gas-Gas") and not GetBP("Yeti-Yeti") and not GetBP("Kitsune-Kitsune") and not GetBP("T-Rex-T-Rex") then
        return
    end
    return true
end

CheckBoat = function()
    for k, child in pairs(workspace.Boats:GetChildren()) do
        if tostring(child.Owner.Value) == tostring(plr.Name) then
            return child
        end
    end

    return false
end

CheckEnemiesBoat = function()
    for k, child in pairs(workspace.Enemies:GetChildren()) do
        if child.Name == "FishBoat" and child:FindFirstChild("Health").Value > 0 then
            return true
        end
    end

    return false
end

CheckPirateGrandBrigade = function()
    for k, child in pairs(workspace.Enemies:GetChildren()) do
        if (child.Name == "PirateGrandBrigade" or child.Name == "PirateBrigade") and child:FindFirstChild("Health").Value > 0 then
            return true
        end
    end

    return false
end

CheckShark = function()
    for k, child in pairs(workspace.Enemies:GetChildren()) do
        if child.Name == "Shark" and Attack.Alive(child) then
            return true
        end
    end

    return false
end

CheckTerrorShark = function()
    for k, child in pairs(workspace.Enemies:GetChildren()) do
        if child.Name == "Terrorshark" and Attack.Alive(child) then
            return true
        end
    end

    return false
end

CheckPiranha = function()
    for k, child in pairs(workspace.Enemies:GetChildren()) do
        if child.Name == "Piranha" and Attack.Alive(child) then
            return true
        end
    end

    return false
end

CheckFishCrew = function()
    for k, child in pairs(workspace.Enemies:GetChildren()) do
        if (child.Name == "Fish Crew Member" or child.Name == "Haunted Crew Member") and Attack.Alive(child) then
            return true
        end
    end

    return false
end

CheckHauntedCrew = function()
    for k, child in pairs(workspace.Enemies:GetChildren()) do
        if child.Name == "Haunted Crew Member" and Attack.Alive(child) then
            return true
        end
    end

    return false
end

CheckSeaBeast = function()
    if not workspace.SeaBeasts:FindFirstChild("SeaBeast1") then
        return false
    end
    return true
end

CheckLeviathan = function()
    if not workspace.SeaBeasts:FindFirstChild("Leviathan") then
        return false
    end
    return true
end

UpdStFruit = function()
    local v7 = next
    local children, v8 = plr.Backpack:GetChildren()

    for k, v9 in v7, children, v8 do
        local eatRemote = v9:FindFirstChild("EatRemote", true)
        StoreFruit = eatRemote

        if StoreFruit then
            replicated.Remotes.CommF_:InvokeServer("StoreFruit", StoreFruit.Parent:GetAttribute("OriginalName"), plr.Backpack:FindFirstChild(v9.Name))
        end
    end
end

GetNearestFruit = function()
    local character3 = plr.Character
    local humanoidRootPart2 = character3 and plr.Character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart2 then
        return nil
    end
    local v7 = nil
    local v8 = nil

    for k, child in pairs(workspace:GetChildren()) do
        if string.find(child.Name, "Fruit") then
            local handle = child:FindFirstChild("Handle")

            if handle and handle:IsA("BasePart") then
                local magnitude = (handle.Position - humanoidRootPart2.Position).Magnitude

                if not v8 or magnitude < v8 then
                    v7 = handle
                    v8 = magnitude
                end
            end
        end
    end

    return v7
end

collectFruits = function(arg)
    if arg then
        local character3 = plr.Character
        local humanoidRootPart2 = character3 and character3:FindFirstChild("HumanoidRootPart")
        if not humanoidRootPart2 then
            return
        end

        for k, child in pairs(workspace:GetChildren()) do
            if string.find(child.Name, "Fruit") then
                local handle = child:FindFirstChild("Handle")

                if handle then
                    handle.CFrame = humanoidRootPart2.CFrame
                end
            end
        end
    end
end

Getmoon = function()
    if World1 then
        return Lighting.FantasySky.MoonTextureId
    end

    if World2 then
        return Lighting.FantasySky.MoonTextureId
    end

    if not World3 then
        return
    end
    return Lighting.Sky.MoonTextureId
end

DropFruits = function()
    local v7 = next
    local children, v8 = plr.Backpack:GetChildren()

    for k, v9 in v7, children, v8 do
        if string.find(v9.Name, "Fruit") then
            EquipWeapon(v9.Name)
            task.wait(0.1)

            if plr.PlayerGui.Main.Dialogue.Visible == true then
                plr.PlayerGui.Main.Dialogue.Visible = false
            end

            EquipWeapon(v9.Name)
            plr.Character:FindFirstChild(v9.Name).EatRemote:InvokeServer("Drop")
        end
    end

    for k, child in pairs(plr.Character:GetChildren()) do
        if string.find(child.Name, "Fruit") then
            EquipWeapon(child.Name)
            task.wait(0.1)

            if plr.PlayerGui.Main.Dialogue.Visible == true then
                plr.PlayerGui.Main.Dialogue.Visible = false
            end

            EquipWeapon(child.Name)
            plr.Character:FindFirstChild(child.Name).EatRemote:InvokeServer("Drop")
        end
    end
end

GetBP = function(arg)
    local v7 = plr.Backpack:FindFirstChild(arg)
    local v8 = v7 or plr.Character:FindFirstChild(arg)
    return v8
end

local tbl4 = {t = 0, data = nil}

GetInventoryList = function()
    if tbl4.data and tick() - tbl4.t < 2 then
        return tbl4.data
    end
    local v7 = nil

    local ok, result = pcall(function()
        return replicated.Remotes.CommF_:InvokeServer("getInventory")
    end)

    if ok and type(result) == "table" then
        v7 = result
    end

    if not v7 then
        local ok2, result2 = pcall(function()
            return replicated.Remotes.CommF_:InvokeServer("getInventoryWeapons")
        end)

        if ok2 and type(result2) == "table" then
            v7 = result2
        end
    end

    local tbl5 = v7 or {}
    local v8 = tbl5
    tbl4.t = tick()
    tbl4.data = v8
    return v8
end

GetIn = function(arg)
    if plr.Character:FindFirstChild(arg) or plr.Backpack:FindFirstChild(arg) then
        return true
    end

    for k, v7 in pairs(GetInventoryList()) do
        if type(v7) == "table" and v7.Name == arg then
            return true
        end
    end

    return false
end

GetM = function(arg)
    if arg == "Bones" then
        local ok, result = pcall(function()
            return replicated.Remotes.CommF_:InvokeServer("Bones", "Check")
        end)

        local n4 = ok and tonumber(result) or 0
        return n4
    end

    local ok, result = pcall(function()
        local v7 = require(replicated.IdMap).Material[arg]
        if not v7 then
            return
        end
        return require(replicated.Util.ItemReplication).Quantity.readClient(v7)
    end)

    if ok and tonumber(result) then
        return tonumber(result)
    end

    for k, v7 in pairs(GetInventoryList()) do
        if type(v7) == "table" and v7.Type == "Material" and v7.Name == arg then
            return v7.Count
        end
    end

    return 0
end

GetWP = function(arg)
    if plr.Character and plr.Character:FindFirstChild(arg) or plr.Backpack and plr.Backpack:FindFirstChild(arg) then
        return true
    end

    for k, v7 in pairs(GetInventoryList()) do
        if type(v7) == "table" and v7.Type == "Sword" and v7.Name == arg then
            return true
        end
    end

    return false
end

local tbl5 = {t = 0, v = nil}

CDKProgress = function()
    if tbl5.v and tick() - tbl5.t < 0.4 then
        return tbl5.v
    end

    local ok, v7 = pcall(function()
        return replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")
    end)

    if ok and type(v7) == "table" then
        tbl5.v = v7
        tbl5.t = tick()
    end

    return tbl5.v
end

getgenv().CDKDoorOpenedAt = nil

CDKEnsureDoor = function()
    if getgenv().CDKDoorOpenedAt then
        return true
    end
    local now = tick()
    local cdkDoorTry = getgenv().CDKDoorTry
    local n4 = cdkDoorTry or 0
    if now - n4 < 1 then
        return false
    end
    getgenv().CDKDoorTry = tick()

    local ok, result = pcall(function()
        return replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")
    end)

    if ok and tostring(result) == "opened" then
        getgenv().CDKDoorOpenedAt = tick()
        return true
    end

    pcall(function()
        replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor", true)
    end)

    return false
end

getInfinity_Ability = function(arg, arg2)
    local n4, n5, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, n6
    n6 = 1

    while true do
        if n6 == 1 then
            n4 = 590249038

            if Root then
                n6 = 2
            else
                n6 = 16
            end
        elseif n6 == 2 then
            n5 = 363225329

            if arg == "Soru" and arg2 then
                n6 = 7
            else
                n6 = 3
            end
        elseif n6 == 3 then
            if arg == "Energy" and arg2 then
                n6 = 6
            else
                n6 = 4
            end
        elseif n6 == 4 then
            if arg == "Observation" and arg2 then
                n6 = 5
            else
                n6 = 15
            end
        elseif n6 == 5 then
            plr.VisionRadius.Value = math.huge
            n6 = 15
        elseif n6 == 6 then
            plr.Character.Energy.Changed:connect(function()
                if arg2 then
                    plr.Character.Energy.Value = Energy
                end
            end)

            n6 = 15
        elseif n6 == 7 then
            v7, v8 = getgc()
            v9 = v8
            v10 = next
            v11 = v7
            n6 = 8
        elseif n6 == 8 then
            v12, v13 = v10(v11, v9)

            if v12 == nil then
                n6 = 15
            else
                n6 = 9
            end
        elseif n6 == 9 then
            v9 = v12

            if plr.Character.Soru and typeof(v13) == "function" and getfenv(v13).script == plr.Character.Soru then
                n6 = 10
            else
                n6 = 8
            end
        elseif n6 == 10 then
            v14 = next
            v15, v16 = getupvalues(v13)
            v17 = v10
            v18 = v11
            v19 = v16
            n6 = 11
        elseif n6 == 11 then
            v20, v21 = v14(v15, v19)

            if v20 == nil then
                n6 = 14
            else
                n6 = 12
            end
        elseif n6 == 12 then
            v19 = v20

            if typeof(v21) == "table" then
                n6 = 13
            else
                n6 = 11
            end
        elseif n6 == 13 then
            task.wait(Sec)
            v21.LastUse = 0

            if arg2 and plr.Character.Humanoid.Health > 0 then
                n6 = 13
            else
                n6 = 11
            end
        elseif n6 == 14 then
            v9 = v12
            v10 = v17
            v11 = v18
            n6 = 8
        elseif n6 == 15 then
            return
        elseif n6 == 16 then
            return
        end
    end
end

Hop = function()
    pcall(function()
        local v7 = nil

        for i = math.random(1, math.random(40, 75)), 100 do
            local response = replicated.__ServerBrowser:InvokeServer(i)
            local v8 = next

            while true do
                local v9, v10 = v8(response, v7)
                if v9 == nil then
                    break
                end
                v7 = v9

                if tonumber(v10.Count) < 12 then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, v9)
                end
            end

            v7 = nil
        end
    end)
end

local part = Instance.new("Part", workspace)
part.Size = Vector3.new(1, 1, 1)
part.Name = "Rip_Indra"
part.Anchored = true
part.CanCollide = false
part.CanTouch = false
part.Transparency = 1

for i, child in ipairs(workspace:GetChildren()) do
    if child.Name == part.Name and child ~= part then
        child:Destroy()
    end
end

local tbl6 = {Tween = nil, Target = nil}

Core.HalloweenStopTween = function()
    if tbl6.Tween then
        tbl6.Tween:Cancel()
    end
end

getgenv().LastTPCall = 0

task.spawn(function()
    while task.wait() do
        if part and part.Parent == workspace then
            if shouldTween then
                getgenv().OnFarm = true
            else
                getgenv().OnFarm = false
            end
        else
            getgenv().OnFarm = false
        end
    end
end)

task.spawn(function()
    local localPlayer = game.Players.LocalPlayer

    repeat
        task.wait()
    until localPlayer.Character and localPlayer.Character.PrimaryPart

    part.CFrame = localPlayer.Character.PrimaryPart.CFrame

    while task.wait() do
        pcall(function()
            if not part or part.Parent ~= workspace then
                return
            end
            local character3 = localPlayer.Character
            local primaryPart = character3 and localPlayer.Character.PrimaryPart

            if getgenv().OnFarm then
                if not _G.WasOnFarm then
                    _G.WasOnFarm = true
                end

                if primaryPart then
                    if (primaryPart.Position - part.Position).Magnitude <= 200 then
                        primaryPart.CFrame = CFrame.new(part.Position)
                    else
                        if tbl6.Tween then
                            tbl6.Tween:Cancel()
                        end

                        tbl6.Target = nil
                        part.CFrame = primaryPart.CFrame
                    end
                end

                local character4 = localPlayer.Character

                if character4 then
                    for k, child in pairs(character4:GetChildren()) do
                        if child:IsA("BasePart") then
                            child.CanCollide = false
                        end
                    end
                end
            else
                if tbl6.Tween and tbl6.Tween.PlaybackState == Enum.PlaybackState.Playing then
                    tbl6.Tween:Cancel()
                end

                tbl6.Target = nil

                if primaryPart then
                    part.CFrame = primaryPart.CFrame
                end

                if _G.WasOnFarm then
                    _G.WasOnFarm = false
                    local character4 = localPlayer.Character

                    if character4 then
                        for k, child in pairs(character4:GetChildren()) do
                            if child:IsA("BasePart") then
                                child.CanCollide = true
                            end
                        end
                    end
                end
            end
        end)
    end
end)

local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
game:GetService("RunService")
local localPlayer = game:GetService("Players").LocalPlayer
local flag4 = game.PlaceId == 2753915549 or game.PlaceId == 85211729168715
sea1 = flag4
local flag5 = game.PlaceId == 4442272183 or game.PlaceId == 79091703265657
sea2 = flag5
local flag6 = game.PlaceId == 7449423635 or game.PlaceId == 100117331123089
sea3 = flag6

local tbl7 = {
    ["Tween Speed"] = 200,
    ["Bypass Teleport"] = false,
    ["Up Y"] = false,
    ["Up Y When Low Health"] = false,
    ["Same Y"] = false,
}

local cframe = CFrame.new(10641.0918, -1953.92981, 9825.07031, -0.652825892, -9.2805891e-08, -0.757508039, -2.73638356e-08, 1, -9.89323823e-08, 0.757508039, -4.38572947e-08, -0.652825892)
local cframe2 = CFrame.new(-16271.126, 25.5847301, 1371.98755, 0.999396622, -5.78875188e-08, -0.0347310975, 5.52972779e-08, 1, -8.7544322e-08, 0.034731105, 8.28877091e-08, 0.999396741)

Convert_CFrame = function(arg)
    if not arg then
        return
    end

    if typeof(arg) == "Vector3" then
        return CFrame.new(arg)
    end

    if typeof(arg) == "CFrame" then
        return arg
    end

    if typeof(arg) == "Model" then
        return arg:GetPivot()
    end

    if not arg.CFrame then
        return nil
    end
    return arg.CFrame
end

GetDistance = function(arg, arg2, arg3)
    local v7 = arg2
    if arg == nil then
        return 9000000000
    end
    local character3 = localPlayer.Character
    if not character3 then
        return 9000000000
    end
    local humanoid = character3:FindFirstChild("Humanoid")
    if not humanoid or humanoid.Health <= 0 then
        return 9000000000
    end

    if arg2 == nil then
        local humanoidRootPart2 = character3:FindFirstChild("HumanoidRootPart")
        v7 = humanoidRootPart2
        if not humanoidRootPart2 then
            return 9000000000
        end
    end

    local v8 = Convert_CFrame(arg)
    local v9 = Convert_CFrame(v7)
    if not arg3 then
        return (v8.Position - v9.Position).Magnitude
    end
    return (Vector3.new(v8.X, 0, v8.Z) - Vector3.new(v9.X, 0, v9.Z)).Magnitude
end

InArea = function(arg)
    local worldOrigin = workspace:FindFirstChild("_WorldOrigin")
    if not worldOrigin then
        return {Name = ""}
    end
    local v7 = Convert_CFrame(arg)
    local v8 = next
    local children, v9 = worldOrigin.Locations:GetChildren()

    for k, v10 in v8, children, v9 do
        if v10:FindFirstChild("Mesh") and (v7.Position - v10.Position).Magnitude <= v10.Mesh.Scale.X then
            return v10
        end
    end

    return {Name = ""}
end

GetSpawnPoint = function(arg)
    local worldOrigin = workspace:FindFirstChild("_WorldOrigin")
    local pirates = worldOrigin and workspace._WorldOrigin:FindFirstChild("PlayerSpawns") and workspace._WorldOrigin.PlayerSpawns:FindFirstChild("Pirates")
    if not pirates then
        return
    end
    local v7 = next
    local children, v8 = pirates:GetChildren()

    for k, v9 in v7, children, v8 do
        if v9:FindFirstChild("Part") and (v9.Part.Position - arg.Position).Magnitude <= 2500 then
            return v9
        end
    end
end

CheckLegendaryItems = function()
    CheckItem = function(arg)
        local v7 = next
        local children, v8 = localPlayer.Backpack:GetChildren()

        for k, v9 in v7, children, v8 do
            if v9:IsA("Tool") and (v9.Name == arg or string.find(v9.Name, arg)) then
                return v9
            end
        end

        local v9 = next
        local children2, v10 = localPlayer.Character:GetChildren()

        for k, v11 in v9, children2, v10 do
            if v11:IsA("Tool") and (v11.Name == arg or string.find(v11.Name, arg)) then
                return v11
            end
        end
    end

    if not CheckItem("God's Chalice") and not CheckItem("Fist of Darkness") and not CheckItem("Sweet Chalice") and not CheckItem("Hallow Essence") and not CheckItem("Flower1") then
        return false
    end
    return true
end

WaitForHumanoid = function()
    local character3 = localPlayer.Character
    if not character3 then
        return nil
    end
    local humanoid = character3:FindFirstChild("Humanoid")
    if humanoid then
        return humanoid
    end
    local n4 = tick() + 5

    while tick() < n4 do
        local humanoid2 = character3:FindFirstChild("Humanoid")
        if humanoid2 then
            return humanoid2
        end
        task.wait(0.1)
    end

    return nil
end

checkinventory = function(arg)
    if arg then
        for k, v7 in pairs(GetInventoryList()) do
            if type(v7) == "table" and v7.Name == arg then
                return true
            end
        end
    end

    return false
end

getdis = function(arg, arg2)
    local cFrame = arg2 or localPlayer.Character.HumanoidRootPart.CFrame
    local v7 = cFrame
    local cframe3 = CFrame.new(arg.X, v7.Y, arg.Z)
    local cframe4 = CFrame.new(v7.X, v7.Y, v7.Z)
    return (cframe3.Position - cframe4.Position).Magnitude
end

CanBypassTeleport = function(arg)
    local name = InArea(arg).Name
    if name == "" then
        return false
    end

    if not tbl7["Bypass Teleport"] or name:find("Dimension") or name:find("Submerged") or name == "Sealed Cavern" or name:lower():find("under") or CheckLegendaryItems() then
        return false
    end

    if localPlayer.Data and localPlayer.Data.LastSpawnPoint and localPlayer.Data.LastSpawnPoint.Value == "SubmergedIsland" then
        return false
    end

    if GetDistance(arg.Position) <= 3500 then
        return false
    end
    return true
end

GetBypassCFrame = function(arg)
    local v7 = nil
    local huge = math.huge
    local v8 = nil
    local children = workspace._WorldOrigin.PlayerSpawns.Pirates:GetChildren()
    local character3 = localPlayer.Character
    local humanoidRootPart2 = character3 and localPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart2 then
        return nil
    end
    local v9 = next

    while true do
        local v10, v11 = v9(children, v7)
        if v10 == nil then
            break
        end
        v7 = v10

        if v11:FindFirstChild("Part") and (arg.Position - humanoidRootPart2.Position).Magnitude >= 3000 and GetSpawnPoint(v11.Part) ~= GetSpawnPoint(humanoidRootPart2) and (v11.Part.Position - humanoidRootPart2.Position).Magnitude <= 10000 and (v11.Part.Position - arg.Position).Magnitude <= huge then
            huge = (v11.Part.Position - arg.Position).Magnitude
            v8 = v11
        end
    end

    return v8
end

BypassTP = function(arg)
    local character3 = localPlayer.Character
    if not character3 then
        return
    end
    local v7 = WaitForHumanoid()
    if not v7 or v7.Health <= 0 then
        return
    end

    if CanBypassTeleport(arg) and GetBypassCFrame(arg) then
        local v8 = GetBypassCFrame(arg)

        if v8 and v8:FindFirstChild("Part") then
            character3.LastSpawnPoint.Disabled = true
            ReplicatedStorage2.Remotes.CommF_:InvokeServer("SetLastSpawnPoint", v8.Name)
            ReplicatedStorage2.Remotes.CommF_:InvokeServer("SetSpawnPoint")
            character3:PivotTo(v8.Part.CFrame)
            v7:ChangeState(15)

            repeat
                task.wait()
            until localPlayer.Character and WaitForHumanoid() and WaitForHumanoid().Health > 0
        end
    end
end

totopofgreattree = function()
    if getdis(CFrame.new(28310.0234, 14895.1123, 109.456741)) > 1500 then
        ReplicatedStorage2.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28310.0234, 14895.1123, 109.456741))
        task.wait(0.3)
    end

    local cframe3 = CFrame.new(28607.5352, 14896.5449, 106.011726)
    _tp(cframe3)

    repeat
        task.wait()
    until getdis(cframe3) <= 5

    task.wait(0.5)

    for i = 1, 4 do
        ReplicatedStorage2.Remotes.CommF_:InvokeServer("RaceV4Progress", "TeleportBack")
    end
end

requestentrance = function(arg)
    local position = arg

    if typeof(arg) == "CFrame" then
        position = arg.Position
    end

    local tbl8

    if sea1 then
        tbl8 = {
            Sky3 = Vector3.new(-7894, 5547, -380),
            Sky3Exit = Vector3.new(-4607, 874, -1667),
            UnderWater = Vector3.new(61163, 11, 1819),
            ["Underwater City"] = Vector3.new(61165.19140625, 0.18704631924629211, 1897.379150390625),
            ["Pirate Village"] = Vector3.new(-1242.4625244140625, 4.787059783935547, 3901.282958984375),
            UnderwaterExit = Vector3.new(4050, -1, -1814),
        }
    elseif sea2 then
        tbl8 = {
            ["Swan Mansion"] = Vector3.new(-390, 332, 673),
            ["Swan Room"] = Vector3.new(2285, 15, 905),
            ["Cursed Ship"] = Vector3.new(923, 126, 32852),
            ["Zombie Island"] = Vector3.new(-6509, 83, -133),
        }
    else
        tbl8 = {
            ["Hydra Island"] = Vector3.new(5657.88623046875, 1013.0790405273438, -335.4996337890625),
            Mansion = Vector3.new(-12462, 375, -7552),
            Castle = Vector3.new(-5036, 315, -3179),
            ["Temple of Time"] = Vector3.new(28286, 14897, 103),
            ["Greate Tree"] = Vector3.new(3024.1709, 2280.69434, -7325.12793),
        }

        if not checkinventory("Valkyrie Helm") then
            return
        end
    end

    local v7 = nil
    local huge = math.huge

    for k, v8 in pairs(tbl8) do
        local magnitude = typeof(v8) == "Vector3" and (v8 - position).Magnitude or (v8.Position - position).Magnitude

        if magnitude < huge then
            huge = magnitude
            v7 = v8
        end
    end

    if v7 and huge and huge < getdis(arg) then
        pcall(function()
            if _G.TweenCache then
                _G.TweenCache:Cancel()
            end
        end)

        if typeof(v7) == "Vector3" and v7.X == 3024.1709 and v7.Y == 2280.69434 and v7.Z == -7325.12793 and ReplicatedStorage2.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check") >= 2 then
            totopofgreattree()
            task.wait(1)
        elseif huge < getdis(arg) then
            local position2 = typeof(v7) == "Vector3" and v7 or v7.Position
            ReplicatedStorage2.Remotes.CommF_:InvokeServer("requestEntrance", position2)
            task.wait(1)
        end
    end
end

_tp = function(arg)
    local cframe3 = nil

    if typeof(arg) == "Vector3" then
        cframe3 = CFrame.new(arg)
    elseif typeof(arg) == "CFrame" then
        cframe3 = arg
    elseif typeof(arg) == "Instance" then
        local ok, result = pcall(function()
            if not arg:IsA("Model") then
                return arg.CFrame
            end
            return arg:GetPivot()
        end)

        local v7 = ok and result or nil
        cframe3 = v7
    end

    if not cframe3 then
        return
    end
    local character3 = plr.Character
    if not character3 or not character3:FindFirstChild("HumanoidRootPart") then
        return
    end
    local humanoidRootPart2 = character3.HumanoidRootPart
    if not part or part.Parent ~= workspace then
        return
    end
    getgenv().LastTPCall = tick()
    shouldTween = true
    getgenv().OnFarm = true
    local tween = tbl6.Tween
    local flag7 = tween and tbl6.Tween.PlaybackState == Enum.PlaybackState.Playing
    if flag7 and tbl6.Target and (tbl6.Target - cframe3.Position).Magnitude < 1 then
        return tbl6.Tween
    end

    if sea3 and (getdis(cframe3.Position, cframe.Position) < 4000 or cframe3.Position.Y < -1000) then
        local humanoidRootPart3 = plr.Character.HumanoidRootPart
        local flag8 = typeof(IsInSubmergedIsland) == "function" and IsInSubmergedIsland() or humanoidRootPart3.Position.Y < -1000

        if not flag8 then
            if getdis(cframe2) <= 15 then
                local net = ReplicatedStorage2.Modules.Net

                pcall(function()
                    net["RF/SubmarineWorkerSpeak"]:InvokeServer("AskKilledTikiBoss")
                    task.wait(0.5)
                    net["RF/SubmarineWorkerSpeak"]:InvokeServer("TravelToSubmergedIsland")
                end)

                task.wait(1)
                return
            end

            cframe3 = cframe2
        end
    end

    local character4 = plr.Character
    local humanoidRootPart3 = character4 and character4:FindFirstChild("HumanoidRootPart")
    local v7 = humanoidRootPart3
    if not humanoidRootPart3 or not part or part.Parent ~= workspace then
        return
    end

    if tbl6.Tween then
        tbl6.Tween:Cancel()
    end

    part.CFrame = v7.CFrame
    local humanoid = character4:FindFirstChildOfClass("Humanoid")

    if humanoid and humanoid.Sit == true then
        part.CFrame = CFrame.new(part.Position.X, cframe3.Y, part.Position.Z)
    end

    local magnitude = (cframe3.Position - part.Position).Magnitude
    local flag8 = magnitude <= 15

    if flag8 then
        local tweenSpeedNear = getgenv().TweenSpeedNear
        flag8 = tweenSpeedNear or 180
    end

    if not flag8 then
        local tweenSpeedFar = getgenv().TweenSpeedFar
        flag8 = tweenSpeedFar or 150
    end

    local tweenInfo = TweenInfo.new(magnitude / flag8, Enum.EasingStyle.Linear)
    local tween2 = game:GetService("TweenService"):Create(part, tweenInfo, {CFrame = CFrame.new(cframe3.Position)})
    tbl6.Tween = tween2
    tbl6.Target = cframe3.Position
    tween2:Play()
    return tween2
end

old_tp = function(cFrame)
    local character3 = plr.Character

    if character3 and character3:FindFirstChild("HumanoidRootPart") then
        character3.HumanoidRootPart.CFrame = cFrame
    end
end

TeleportToTarget = function(arg)
    local v7 = _tp(arg)

    if v7 then
        v7.Completed:Wait()
    end

    task.wait(0.1)
end

notween = function(cFrame)
    plr.Character.HumanoidRootPart.CFrame = cFrame
end

BTP = function(cFrame)
    local localPlayer2 = game.Players.LocalPlayer
    local humanoidRootPart2 = localPlayer2.Character.HumanoidRootPart
    local humanoid = localPlayer2.Character.Humanoid
    local main = localPlayer2.PlayerGui.Main
    local position = cFrame.Position
    local position2 = humanoidRootPart2.Position

    repeat
        humanoid.Health = 0
        humanoidRootPart2.CFrame = cFrame
        main.Quest.Visible = false

        if (humanoidRootPart2.Position - position2).Magnitude > 1 then
            position2 = humanoidRootPart2.Position
            humanoidRootPart2.CFrame = cFrame
        end

        task.wait(0.5)
    until (cFrame.Position - humanoidRootPart2.Position).Magnitude <= 2000
end

task.spawn(function()
    while task.wait() do
        pcall(function()
            local now, lastTPCall, n4, bodyVelocity, highlight, v7, v8, v9, v10, v11, v12, n5
            n5 = 1

            while true do
                if n5 == 1 then
                    if (not Core.Halloween or not Core.Halloween.Moving) and not _G.Auto_StartRaid and not _G.SailBoat_Hydra and not _G.WardenBoss and not _G.AutoFactory and not _G.HighestMirage and not _G.HCM and not _G.PGB and not _G.Leviathan1 and not _G.UPGDrago and not _G.Complete_Trials and not _G.TpDrago_Prehis and not _G.BuyDrago and not _G.AutoFireFlowers and not _G.DT_Uzoth and not _G.AutoBerry and not _G.Prefully and not _G.Prehis_Find and not _G.Prehis_Skills and not _G.Prehis_DB and not _G.Prehis_DE and not _G.FarmBlazeEM and not _G.Dojoo and not _G.CollectPresent and not _G.AutoLawKak and not _G.TpLab and not _G.AutoPhoenixF and not _G.AutoFarmChest and not _G.AutoHytHallow and not _G.LongsWord and not _G.BlackSpikey and not _G.AutoHolyTorch and not _G.TrainDrago and not _G.AutoSaber and not _G.FarmMastery_Dev and not _G.Auto_Fruit_Mastery and not _G.CitizenQuest and not _G.AutoEctoplasm and not _G.KeysRen and not _G.Auto_Rainbow_Haki and not _G.obsFarm and not _G.AutoBigmom and not _G.Doughv2 and not _G.AuraBoss and not _G.Raiding and not _G.Auto_Cavender and not _G.TpPly and not _G.Bartilo_Quest and not _G.Level and not _G.FarmEliteHunt and not _G.AutoZou and not _G.AutoFarm_Bone and not getgenv().AutoMaterial and not _G.CraftVM and not _G.FrozenTP and not _G.TPDoor and not _G.AcientOne and not _G.AutoFarmNear and not _G.AutoRaidCastle and not _G.DarkBladev3 and not _G.AutoFarmRaid and not _G.Auto_Cake_Prince and not _G.Addealer and _G.TPNpc ~= true and not _G.TwinHook and not _G.FindMirage and not _G.FarmChestM and not _G.Shark and not _G.TerrorShark and not _G.Piranha and not _G.MobCrew and not _G.SeaBeast1 and not _G.FishBoat and not _G.AutoPole and not _G.AutoPoleV2 and not _G.Auto_SuperHuman and not _G.AutoDeathStep and not _G.Auto_SharkMan_Karate and not _G.Auto_Electric_Claw and not _G.AutoDragonTalon and not _G.Auto_Def_DarkCoat and not _G.Auto_God_Human and not _G.Auto_Tushita and not _G.AutoMatSoul and not _G.AutoKenVTWO and not _G.AutoSerpentBow and not _G.AutoFMon and not _G.Auto_Soul_Guitar and not _G.TPGEAR and not _G.AutoSaw and not _G.AutoTridentW2 and not _G.AutoEvoRace and not _G.AutoGetQuestBounty and not _G.MarinesCoat and not _G.TravelDres and not _G.Defeating and not _G.DummyMan and not _G.Auto_Yama and not _G.Auto_SwanGG and not _G.SwanCoat and not _G.AutoEcBoss and not _G.Auto_Mink and not _G.Auto_Human and not _G.Auto_Skypiea and not _G.Auto_Fish and not _G.CDK_TS and not _G.CDK_YM and not _G.CDK and not _G.AutoFarmGodChalice and not _G.AutoFistDarkness and not _G.AutoMiror and not _G.Teleport and not _G.AutoKilo and not _G.AutoGetUsoap and not _G.Praying and not _G.TryLucky and not _G.AutoColShad and not _G.AutoUnHaki and not _G.Auto_DonAcces and not _G.AutoRipIngay and not _G.DragoV3 and not _G.DragoV1 and not _G.SailBoats and not NextIs and not _G.FarmGodChalice and not _G.IceBossRen and not senth and not senth2 and not _G.Lvthan and not _G.beasthunter and not _G.DangerLV and not _G.Relic123 and not _G.tweenKitsune and not _G.Collect_Ember and not _G.AutofindKitIs and not _G.snaguine and not _G.TwFruits and not _G.tweenKitShrine and not _G.Tp_LgS and not _G.Tp_MasterA and not _G.tweenShrine and not _G.FarmMastery_G and not _G.Auto_Gun_Mastery and not _G.FarmMastery_S and not _G.Auto_Mastery_All_Sword and not _G.FarmBoss and not _G.AutoFarmAllBoss and not _G.AutoFishSlap and not _G.FarmTyrant and not _G.FarmPhaBinh and not _G.AutoSpawnCP and not _G.AutoBerryH and not _G.AutoChestBP and not _G.FarmEliteHop and not _G.AutoHop_Dough and not _G.AutoDoughKing and not _G.AutoAttackDoughKing and not _G.StartEvent and not _G.AutoMysticIsland and not _G.AutoPlayerHunter and not _G.SafeMode and not _G.AutoKillMob and not _G.AutoStartPrehistoric and not _G.AutoUnHaki and not _G.AutoAttackRipIndra and not _G.AutoFarmIsland and not _G.AutoFarmDungeon and not _G.AutoFarmCandy and not _G.AutoTP_Gift and not _G.AutoTPGift and not _G.AutoTPAndCollect and not _G.MasterAutoLevel and not _G.MasterAutoCandy and not _G.TPFloor1 and not _G.TPFloor2 and not _G.TPFloor3 and not _G.TPFloor4 and not _G.AutoMagnetToken then
                        n5 = 2
                    else
                        n5 = 9
                    end
                elseif n5 == 2 then
                    now = tick()
                    lastTPCall = getgenv().LastTPCall
                    n4 = lastTPCall

                    if lastTPCall then
                        n5 = 4
                    else
                        n5 = 3
                    end
                elseif n5 == 3 then
                    n4 = 0
                    n5 = 4
                elseif n5 == 4 then
                    if now - n4 < 0.35 then
                        n5 = 9
                    else
                        n5 = 5
                    end
                elseif n5 == 5 then
                    shouldTween = false

                    if plr.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                        n5 = 6
                    else
                        n5 = 7
                    end
                elseif n5 == 6 then
                    plr.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
                    n5 = 7
                elseif n5 == 7 then
                    if plr.Character:FindFirstChild("highlight") then
                        n5 = 8
                    else
                        n5 = 17
                    end
                elseif n5 == 8 then
                    plr.Character:FindFirstChild("highlight"):Destroy()
                    n5 = 17
                elseif n5 == 9 then
                    shouldTween = true

                    if plr.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                        n5 = 11
                    else
                        n5 = 10
                    end
                elseif n5 == 10 then
                    bodyVelocity = Instance.new("BodyVelocity")
                    bodyVelocity.Name = "BodyClip"
                    bodyVelocity.Parent = plr.Character.HumanoidRootPart
                    bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
                    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                    n5 = 11
                elseif n5 == 11 then
                    if plr.Character:FindFirstChild("highlight") then
                        n5 = 13
                    else
                        n5 = 12
                    end
                elseif n5 == 12 then
                    highlight = Instance.new("Highlight")
                    highlight.Name = "highlight"
                    highlight.Enabled = true
                    highlight.FillColor = Color3.fromRGB(0, 255, 254)
                    highlight.OutlineColor = Color3.fromRGB(0, 255, 254)
                    highlight.FillTransparency = 0.5
                    highlight.OutlineTransparency = 0.2
                    highlight.Parent = plr.Character
                    n5 = 13
                elseif n5 == 13 then
                    v7, v8, v9 = pairs(plr.Character:GetDescendants())
                    v10 = v9
                    n5 = 14
                elseif n5 == 14 then
                    v11, v12 = v7(v8, v10)

                    if v11 == nil then
                        n5 = 17
                    else
                        n5 = 15
                    end
                elseif n5 == 15 then
                    v10 = v11

                    if v12:IsA("BasePart") then
                        n5 = 16
                    else
                        n5 = 14
                    end
                elseif n5 == 16 then
                    v12.CanCollide = false
                    n5 = 14
                elseif n5 == 17 then
                    return
                end
            end
        end)
    end
end)

QuestB = function()
    if World1 then
        if _G.FindBoss == "The Gorilla King" then
            bMon = "The Gorilla King"
            Qname = "JungleQuest"
            Qdata = 3
            local cframe3 = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(-1088.75977, 8.13463783, -488.559906, -0.707134247, 0, 0.707079291, 0, 1, 0, -0.707079291, 0, -0.707134247)
            PosB = cframe4
        elseif _G.FindBoss == "Bobby" then
            bMon = "Bobby"
            Qname = "BuggyQuest1"
            Qdata = 3
            local cframe3 = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)
            PosB = cframe4
        elseif _G.FindBoss == "The Saw" then
            bMon = "The Saw"
            local cframe3 = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)
            PosB = cframe3
        elseif _G.FindBoss == "Yeti" then
            bMon = "Yeti"
            Qname = "SnowQuest"
            Qdata = 3
            local cframe3 = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
            PosB = cframe4
        elseif _G.FindBoss == "Mob Leader" then
            bMon = "Mob Leader"
            local cframe3 = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)
            PosB = cframe3
        elseif _G.FindBoss == "Vice Admiral" then
            bMon = "Vice Admiral"
            Qname = "MarineQuest2"
            Qdata = 2
            local cframe3 = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
            PosB = cframe4
        elseif _G.FindBoss == "Saber Expert" then
            bMon = "Saber Expert"
            local cframe3 = CFrame.new(-1458.89502, 29.8870335, -50.633564)
            PosB = cframe3
        elseif _G.FindBoss == "Warden" then
            bMon = "Warden"
            Qname = "ImpelQuest"
            Qdata = 1
            local cframe3 = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, -4.49946401e-06, 0.975376427, -1.95412576e-05, 1, 9.03162072e-06, -0.975376427, -2.10519756e-05, 0.220546961)
            PosB = cframe3
            local cframe4 = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
            PosQBoss = cframe4
        elseif _G.FindBoss == "Chief Warden" then
            bMon = "Chief Warden"
            Qname = "ImpelQuest"
            Qdata = 2
            local cframe3 = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749, 0.00191645394, 0.999998152, -2.80422337e-05, -0.939682961, 0.00181045406, 0.342041939)
            PosB = cframe3
            local cframe4 = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
            PosQBoss = cframe4
        elseif _G.FindBoss == "Swan" then
            bMon = "Swan"
            Qname = "ImpelQuest"
            Qdata = 3
            local cframe3 = CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812)
            PosB = cframe3
            local cframe4 = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
            PosQBoss = cframe4
        elseif _G.FindBoss == "Magma Admiral" then
            bMon = "Magma Admiral"
            Qname = "MagmaQuest"
            Qdata = 3
            local cframe3 = CFrame.new(-5314.6220703125, 12.262420654297, 8517.279296875)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)
            PosB = cframe4
        elseif _G.FindBoss == "Fishman Lord" then
            bMon = "Fishman Lord"
            Qname = "FishmanQuest"
            Qdata = 3
            local cframe3 = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
            PosB = cframe4
        elseif _G.FindBoss == "Wysper" then
            bMon = "Wysper"
            Qname = "SkyExp1Quest"
            Qdata = 3
            local cframe3 = CFrame.new(-7861.947265625, 5545.517578125, -379.85974121094)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)
            PosB = cframe4
        elseif _G.FindBoss == "Thunder God" then
            bMon = "Thunder God"
            Qname = "SkyExp2Quest"
            Qdata = 3
            local cframe3 = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)
            PosB = cframe4
        elseif _G.FindBoss == "Cyborg" then
            bMon = "Cyborg"
            Qname = "FountainQuest"
            Qdata = 3
            local cframe3 = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
            PosB = cframe4
        elseif _G.FindBoss == "Ice Admiral" then
            bMon = "Ice Admiral"
            Qdata = nil
            local cframe3 = CFrame.new(1266.08948, 26.1757946, -1399.57678, -0.573599219, 0, -0.81913656, 0, 1, 0, 0.81913656, 0, -0.573599219)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(1266.08948, 26.1757946, -1399.57678, -0.573599219, 0, -0.81913656, 0, 1, 0, 0.81913656, 0, -0.573599219)
            PosB = cframe4
        elseif _G.FindBoss == "Greybeard" then
            bMon = "Greybeard"
            Qdata = nil
            local cframe3 = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
            PosB = cframe4
        end
    end

    if World2 then
        if _G.FindBoss == "Diamond" then
            bMon = "Diamond"
            Qname = "Area1Quest"
            Qdata = 3
            local cframe3 = CFrame.new(-427.5666809082, 73.313781738281, 1835.4208984375)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
            PosB = cframe4
        elseif _G.FindBoss == "Jeremy" then
            bMon = "Jeremy"
            Qname = "Area2Quest"
            Qdata = 3
            local cframe3 = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
            PosB = cframe4
        elseif _G.FindBoss == "Orbitus" then
            bMon = "Orbitus"
            Qname = "MarineQuest3"
            Qdata = 3
            local cframe3 = CFrame.new(-2441.986328125, 73.359344482422, -3217.5324707031)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
            PosB = cframe4
        elseif _G.FindBoss == "Don Swan" then
            bMon = "Don Swan"
            local cframe3 = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
            PosB = cframe3
        elseif _G.FindBoss == "Smoke Admiral" then
            bMon = "Smoke Admiral"
            Qname = "IceSideQuest"
            Qdata = 3
            local cframe3 = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
            PosB = cframe4
        elseif _G.FindBoss == "Awakened Ice Admiral" then
            bMon = "Awakened Ice Admiral"
            Qname = "FrostQuest"
            Qdata = 3
            local cframe3 = CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)
            PosB = cframe4
        elseif _G.FindBoss == "Tide Keeper" then
            bMon = "Tide Keeper"
            Qname = "ForgottenQuest"
            Qdata = 3
            local cframe3 = CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)
            PosB = cframe4
        elseif _G.FindBoss == "Darkbeard" then
            bMon = "Darkbeard"
            Qdata = nil
            local cframe3 = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
            PosB = cframe4
        elseif _G.FindBoss == "Cursed Captain" then
            bMon = "Cursed Captain"
            Qdata = nil
            local cframe3 = CFrame.new(916.928589, 181.092773, 33422)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(916.928589, 181.092773, 33422)
            PosB = cframe4
        elseif _G.FindBoss == "Order" then
            bMon = "Order"
            Qdata = nil
            local cframe3 = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
            PosB = cframe4
        end
    end

    if World3 then
        if _G.FindBoss == "Stone" then
            bMon = "Stone"
            Qname = "PiratePortQuest"
            Qdata = 3
            local cframe3 = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
            PosB = cframe4
        elseif _G.FindBoss == "Hydra Leader" then
            bMon = "Hydra Leader"
            Qname = "VenomCrewQuest"
            Qdata = 3
            local cframe3 = CFrame.new(5211.021484375, 1004.35778859375, 758.1847534179688)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(5821.89794921875, 1019.0950927734375, -73.71923065185547)
            PosB = cframe4
        elseif _G.FindBoss == "Kilo Admiral" then
            bMon = "Kilo Admiral"
            Qname = "MarineTreeIsland"
            Qdata = 3
            local cframe3 = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
            PosB = cframe4
        elseif _G.FindBoss == "Captain Elephant" then
            bMon = "Captain Elephant"
            Qname = "DeepForestIsland"
            Qdata = 3
            local cframe3 = CFrame.new(-13232.682617188, 332.40396118164, -7626.01171875)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
            PosB = cframe4
        elseif _G.FindBoss == "Beautiful Pirate" then
            bMon = "Beautiful Pirate"
            Qname = "DeepForestIsland2"
            Qdata = 3
            local cframe3 = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)
            PosB = cframe4
        elseif _G.FindBoss == "Cake Queen" then
            bMon = "Cake Queen"
            Qname = "IceCreamIslandQuest"
            Qdata = 3
            local cframe3 = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(-678.648804, 381.353943, -11114.2012, -0.908641815, 0.00149294338, 0.41757378, 0.00837114919, 0.999857843, 0.0146408929, -0.417492568, 0.0167988986, -0.90852499)
            PosB = cframe4
        elseif _G.FindBoss == "Longma" then
            bMon = "Longma"
            Qdata = nil
            local cframe3 = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
            PosB = cframe4
        elseif _G.FindBoss == "Soul Reaper" then
            bMon = "Soul Reaper"
            Qdata = nil
            local cframe3 = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
            PosQBoss = cframe3
            local cframe4 = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
            PosB = cframe4
        end
    end
end

QuestBeta = function()
    QuestB()

    return {
        [0] = _G.FindBoss,
        [1] = bMon,
        [2] = Qdata,
        [3] = Qname,
        [4] = PosB,
        [5] = PosQBoss,
    }
end

local Quests = require(game:GetService("ReplicatedStorage"):WaitForChild("Quests"))
local GuideModule = require(game:GetService("ReplicatedStorage"):WaitForChild("GuideModule"))
local tbl8 = {"MarineQuest", "BartiloQuest", "CitizenQuest", "Trainees"}

CheckSea = function(arg)
    if (game.PlaceId == 2753915549 or game.PlaceId == 85211729168715) and arg == 1 then
        return true
    end

    if (game.PlaceId == 4442272183 or game.PlaceId == 79091703265657) and arg == 2 then
        return true
    end

    if (game.PlaceId == 7449423635 or game.PlaceId == 100117331123089) and arg == 3 then
        return true
    end
    return false
end

GetQuestPointFromNPC = function(arg)
    for k, child in pairs(workspace.NPCs:GetChildren()) do
        if child.Name == arg and child:FindFirstChild("HumanoidRootPart") then
            return child.HumanoidRootPart.CFrame
        end
    end

    for k, child in pairs(replicated.NPCs:GetChildren()) do
        if child.Name == arg and child:FindFirstChild("HumanoidRootPart") then
            return child.HumanoidRootPart.CFrame
        end
    end

    return nil
end

GetQuests = function()
    local value = plr.Data.Level.Value
    local n4 = 0
    local tbl9 = {}

    if value >= 700 and CheckSea(1) then
        tbl9.Mob = "Galley Captain"
        tbl9.NameQuest = "FountainQuest"
        tbl9.ID = 2
        tbl9.LevelReq = 700
    elseif value >= 1500 and CheckSea(2) then
        tbl9.Mob = "Water Fighter"
        tbl9.NameQuest = "ForgottenQuest"
        tbl9.ID = 2
        tbl9.LevelReq = 1450
    else
        local v7, v8, v9 = pairs(Quests)
        local v10 = v9
        local v11 = v7
        local v12 = v8

        while true do
            local v13, v14 = v11(v12, v10)
            if v13 == nil then
                break
            end
            local v15, v16, v17 = pairs(v14)
            local v18 = v17
            local v19 = v15
            local v20 = v16
            local v21 = v13
            local v22 = v11
            local v23 = v12

            while true do
                local v24, v25 = v19(v20, v18)
                if v24 == nil then
                    break
                end
                local levelReq = v25.LevelReq

                for k in pairs(v25.Task) do
                    if levelReq <= value and n4 <= levelReq and v25.Task[k] > 1 and not table.find(tbl8, v13) then
                        n4 = levelReq
                        tbl9.Mob = k
                        tbl9.NameQuest = v13
                        tbl9.ID = v24
                        tbl9.LevelReq = levelReq
                    end
                end

                v18 = v24
            end

            v10 = v21
            v11 = v22
            v12 = v23
        end
    end

    return tbl9
end

GetQuestPoint = function()
    if GuideModule and GuideModule.Data and GuideModule.Data.LastClosestNPC then
        return GetQuestPointFromNPC(GuideModule.Data.LastClosestNPC)
    end
    return nil
end

MaterialMon = function()
    local localPlayer2 = game.Players.LocalPlayer
    local character3 = localPlayer2.Character
    local humanoidRootPart2 = character3 and localPlayer2.Character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart2 then
        return
    end

    shouldRequestEntrance = function(arg, arg2)
        if arg2 <= (humanoidRootPart2.Position - arg).Magnitude then
            replicated.Remotes.CommF_:InvokeServer("requestEntrance", arg)
        end
    end

    if World1 then
        if SelectMaterial == "Angel Wings" then
            MMon = {
                "Shanda",
                "Royal Squad",
                "Royal Soldier",
                "Wysper",
                "Thunder God",
            }

            local cframe3 = CFrame.new(-4698, 845, -1912)
            MPos = cframe3
            SP = "Default"
            local vector = Vector3.new(-4607.82275, 872.54248, -1667.55688)
            shouldRequestEntrance(vector, 10000)
        elseif SelectMaterial == "Leather + Scrap Metal" then
            MMon = {"Brute", "Pirate"}
            local cframe3 = CFrame.new(-1145, 15, 4350)
            MPos = cframe3
            SP = "Default"
        elseif SelectMaterial == "Magma Ore" then
            MMon = {"Military Soldier", "Military Spy", "Magma Admiral"}
            local cframe3 = CFrame.new(-5815, 84, 8820)
            MPos = cframe3
            SP = "Default"
        elseif SelectMaterial == "Fish Tail" then
            MMon = {"Fishman Warrior", "Fishman Commando", "Fishman Lord"}
            local cframe3 = CFrame.new(61123, 19, 1569)
            MPos = cframe3
            SP = "Default"
            local vector = Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)
            shouldRequestEntrance(vector, 17000)
        end
    elseif World2 then
        if SelectMaterial == "Leather + Scrap Metal" then
            MMon = {"Marine Captain"}
            local cframe3 = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
            MPos = cframe3
            SP = "Default"
        elseif SelectMaterial == "Magma Ore" then
            MMon = {"Magma Ninja", "Lava Pirate"}
            local cframe3 = CFrame.new(-5428, 78, -5959)
            MPos = cframe3
            SP = "Default"
        elseif SelectMaterial == "Ectoplasm" then
            MMon = {
                "Ship Deckhand",
                "Ship Engineer",
                "Ship Steward",
                "Ship Officer",
            }

            local cframe3 = CFrame.new(911.35827636719, 125.95812988281, 33159.5390625)
            MPos = cframe3
            SP = "Default"
            local vector = Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)
            shouldRequestEntrance(vector, 18000)
        elseif SelectMaterial == "Mystic Droplet" then
            MMon = {"Water Fighter"}
            local cframe3 = CFrame.new(-3385, 239, -10542)
            MPos = cframe3
            SP = "Default"
        elseif SelectMaterial == "Radioactive Material" then
            MMon = {"Factory Staff"}
            local cframe3 = CFrame.new(295, 73, -56)
            MPos = cframe3
            SP = "Default"
        elseif SelectMaterial == "Vampire Fang" then
            MMon = {"Vampire"}
            local cframe3 = CFrame.new(-6033, 7, -1317)
            MPos = cframe3
            SP = "Default"
        end
    elseif World3 then
        if SelectMaterial == "Scrap Metal" then
            MMon = {"Jungle Pirate", "Forest Pirate"}
            local cframe3 = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375)
            MPos = cframe3
            SP = "Default"
        elseif SelectMaterial == "Fish Tail" then
            MMon = {"Fishman Raider", "Fishman Captain"}
            local cframe3 = CFrame.new(-10993, 332, -8940)
            MPos = cframe3
            SP = "Default"
        elseif SelectMaterial == "Conjured Cocoa" then
            MMon = {"Chocolate Bar Battler", "Cocoa Warrior"}
            local cframe3 = CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625)
            MPos = cframe3
            SP = "Default"
        elseif SelectMaterial == "Dragon Scale" then
            MMon = {"Dragon Crew Archer", "Dragon Crew Warrior"}
            local cframe3 = CFrame.new(6594, 383, 139)
            MPos = cframe3
            SP = "Default"
        elseif SelectMaterial == "Gunpowder" then
            MMon = {"Pistol Billionaire"}
            local cframe3 = CFrame.new(-84.8556900024414, 85.62061309814453, 6132.0087890625)
            MPos = cframe3
            SP = "Default"
        elseif SelectMaterial == "Mini Tusk" then
            MMon = {"Mythological Pirate"}
            local cframe3 = CFrame.new(-13545, 470, -6917)
            MPos = cframe3
            SP = "Default"
        elseif SelectMaterial == "Demonic Wisp" then
            MMon = {"Demonic Soul"}
            local cframe3 = CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)
            MPos = cframe3
            SP = "Default"
        end
    end
end

QuestNeta = function()
    local v7 = GetQuests()

    return {
        v7.Mob,
        v7.ID,
        v7.NameQuest,
        v7.LevelReq,
        v7.Mob,
        GetQuestPoint(),
    }
end

alreadyTeleported = false
teleporting = false

_G.CheckQuestVisible = function(arg)
    local localPlayer2 = arg or game.Players.LocalPlayer
    local v7 = localPlayer2
    local main = localPlayer2.PlayerGui:FindFirstChild("Main")
    local quest = main and v7.PlayerGui.Main:FindFirstChild("Quest")
    local trackedQuestFrame = v7.PlayerGui:FindFirstChild("TrackedQuestFrame")

    if quest and quest.Visible then
        local str = ""

        pcall(function()
            str = quest.Container.QuestTitle.Title.Text
        end)

        return true, str
    end

    if not trackedQuestFrame or not trackedQuestFrame.Enabled then
        return false, ""
    end
    local str = ""

    pcall(function()
        str = trackedQuestFrame.Frame.header.textLabel.Text
    end)

    if str == "" then
        pcall(function()
            str = trackedQuestFrame.Frame.header.textLabel.textLabel.Text
        end)
    end

    return true, str
end

IsInSubmergedIsland = function()
    local character3 = plr.Character
    if not character3 then
        return false
    end
    local humanoidRootPart2 = character3:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart2 then
        return false
    end
    local flag7 = humanoidRootPart2.Position.Y < -1000
    return flag7
end

GuiNode = function(...)
    local main = game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main")
    if not main then
        return nil
    end
    local v7 = main

    for i, v8 in ipairs({...}) do
        if not v7 then
            return nil
        end
        v7 = v7:FindFirstChild(v8)
    end

    return v7
end

GuiShown = function(...)
    if select("#", ...) == 1 and select(1, ...) == "Quest" then
        local trackedQuestFrame = game.Players.LocalPlayer.PlayerGui:FindFirstChild("TrackedQuestFrame")

        if trackedQuestFrame then
            local frame = trackedQuestFrame:FindFirstChild("Frame")

            if frame then
                local enabled = trackedQuestFrame.Enabled
                local visible = enabled and frame.Visible
                return visible
            end
        end
    end

    local v7 = GuiNode(...)
    local flag7 = v7 ~= nil and v7.Visible == true
    return flag7
end

QuestText = function()
    local trackedQuestFrame = game.Players.LocalPlayer.PlayerGui:FindFirstChild("TrackedQuestFrame")

    if trackedQuestFrame then
        local frame = trackedQuestFrame:FindFirstChild("Frame")

        if frame and frame.Visible then
            local header = frame:FindFirstChild("header")
            local textLabel = header and header:FindFirstChild("textLabel")
            if textLabel and textLabel:IsA("TextLabel") then
                return tostring(textLabel.Text)
            end
        end
    end

    local Quest = GuiNode("Quest", "Container", "QuestTitle", "Title")
    if not Quest then
        return ""
    end
    return tostring(Quest.Text)
end

CheckHasQuest = function(arg)
    if not arg then
        return false
    end

    if not GuiShown("Quest") then
        return false
    end
    local v7 = QuestText()
    if v7 == "" then
        return false
    end
    local flag7 = string.find(string.lower(v7), string.lower(arg), 1, true) ~= nil
    return flag7
end

BFAcceptQuest = function(arg, arg2, arg3)
    if CheckHasQuest(arg3) then
        return true
    end
    local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
    local commF = remotes and game:GetService("ReplicatedStorage").Remotes:FindFirstChild("CommF_")
    if not commF then
        return false
    end

    if not pcall(function()
        return commF:InvokeServer("StartQuest", arg, arg2)
    end) then
        return false
    end
    local n4 = os.clock() + 3

    while not CheckHasQuest(arg3) do
        task.wait(0.25)
        if n4 <= os.clock() then
            return CheckHasQuest(arg3)
        end
    end

    return true
end

task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            local chooseWP = _G.ChooseWP
            local str = chooseWP or "Melee"
            local character3 = plr.Character
            local backpack = plr.Backpack
            local name = nil

            if character3 then
                for k, child in pairs(character3:GetChildren()) do
                    if child:IsA("Tool") and child.ToolTip == str then
                        name = child.Name
                        break
                    end
                end
            end

            if not name and backpack then
                for k, child in pairs(backpack:GetChildren()) do
                    if child:IsA("Tool") and child.ToolTip == str then
                        name = child.Name
                        break
                    end
                end
            end

            if name then
                _G.SelectWeapon = name
            end
        end)
    end
end)

task.spawn(function()
    while task.wait() do
        pcall(function()
            local v7, v8, v9, v10, v11, v12, n4
            n4 = 1

            while true do
                if n4 == 1 then
                    if _G.AutoFarmNear then
                        n4 = 2
                    else
                        n4 = 6
                    end
                elseif n4 == 2 then
                    v7, v8, v9 = pairs(workspace.Enemies:GetChildren())
                    v10 = v9
                    n4 = 3
                elseif n4 == 3 then
                    v11, v12 = v7(v8, v10)

                    if v11 == nil then
                        n4 = 6
                    else
                        n4 = 4
                    end
                elseif n4 == 4 then
                    v10 = v11

                    if (v12:FindFirstChild("Humanoid") or v12:FindFirstChild("HumanoidRootPart")) and v12.Humanoid.Health > 0 then
                        n4 = 5
                    else
                        n4 = 3
                    end
                elseif n4 == 5 then
                    task.wait()
                    Attack.Kill(v12, _G.AutoFarmNear)

                    if _G.AutoFarmNear and v12.Parent and v12.Humanoid.Health > 0 then
                        n4 = 5
                    else
                        n4 = 3
                    end
                elseif n4 == 6 then
                    return
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(Sec) do
        pcall(function()
            if _G.AutoFactory then
                local Core_ = GetConnectionEnemies("Core")

                if Core_ then
                    repeat
                        task.wait()
                        EquipWeapon(_G.SelectWeapon)
                        _tp(CFrame.new(448.46756, 199.356781, -441.389252))
                    until Core_.Humanoid.Health <= 0 or _G.AutoFactory == false
                else
                    _tp(CFrame.new(448.46756, 199.356781, -441.389252))
                end
            end
        end)
    end
end)

task.spawn(function()
    local cframe3 = CFrame.new(-5496.17432, 313.768921, -2841.53027, 0.924894512, 7.37058015e-09, 0.380223751, 3.5881019e-08, 1, -1.06665446e-07, -0.380223751, 1.12297109e-07, 0.924894512)
    local vector = Vector3.new(-5539.3115234375, 313.800537109375, -2972.372314453125)

    while task.wait(Sec) do
        if _G.AutoRaidCastle then
            pcall(function()
                local character3 = plr.Character
                local humanoidRootPart2 = character3 and plr.Character:FindFirstChild("HumanoidRootPart")
                if not humanoidRootPart2 then
                    return
                end

                if (vector - humanoidRootPart2.Position).Magnitude <= 500 then
                    local v7 = nil
                    local v8 = nil

                    for k, child in pairs(workspace.Enemies:GetChildren()) do
                        local humanoid = child:FindFirstChild("Humanoid")
                        local humanoidRootPart3 = child:FindFirstChild("HumanoidRootPart")

                        if humanoid and humanoidRootPart3 and humanoid.Health > 0 and (humanoidRootPart3.Position - vector).Magnitude <= 700 then
                            local magnitude = (humanoidRootPart3.Position - humanoidRootPart2.Position).Magnitude

                            if not v8 or magnitude < v8 then
                                v7 = child
                                v8 = magnitude
                            end
                        end
                    end

                    if v7 then
                        local n4 = tick() + 30

                        repeat
                            task.wait()
                            Attack.Kill(v7, _G.AutoRaidCastle)
                        until not _G.AutoRaidCastle or not v7.Parent or v7.Humanoid.Health <= 0 or n4 < tick()
                    else
                        _tp(cframe3)
                    end
                else
                    _tp(cframe3)
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(Sec) do
        pcall(function()
            if _G.AutoEctoplasm then
                local v7 = GetConnectionEnemies({
                    "Ship Deckhand",
                    "Ship Engineer",
                    "Ship Steward",
                    "Ship Officer",
                    "Arctic Warrior",
                })

                if Attack.Alive(v7) then
                    repeat
                        task.wait()
                        Attack.Kill(v7, _G.AutoEctoplasm)
                    until not _G.AutoEctoplasm or not v7.Parent or v7.Humanoid.Health <= 0
                else
                    replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(Sec) do
        if _G.AutoFarmChest then
            pcall(function()
                local CollectionService = game:GetService("CollectionService")
                local localPlayer2 = game:GetService("Players").LocalPlayer
                local character3 = localPlayer2.Character
                local result = character3 or localPlayer2.CharacterAdded:Wait()
                if not result then
                    return
                end
                local position = result:GetPivot().Position
                local tagged = CollectionService:GetTagged("_ChestTagged")
                local huge = math.huge
                local v7 = nil

                for i = 1, #tagged do
                    local v8 = tagged[i]
                    local magnitude = (v8:GetPivot().Position - position).Magnitude

                    if (not SelectedIsland or v8:IsDescendantOf(SelectedIsland)) and not v8:GetAttribute("IsDisabled") and magnitude < huge then
                        huge = magnitude
                        v7 = v8
                    end
                end

                if v7 then
                    _tp(v7:GetPivot())
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.2) do
        if _G.StopWhenChalice and (_G.AutoFarmChest or _G.AutoChestBP) then
            pcall(function()
                if GetBP("God's Chalice") or GetBP("Sweet Chalice") or GetBP("Fist of Darkness") then
                    _G.AutoFarmChest = false
                    _G.AutoChestBP = false
                end
            end)
        end
    end
end)

task.spawn(function()
    local CollectionService, localPlayer2, tagged, n4, n5, n6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, n7, n8, v18
    local v19, v20, v21, v22, v23, n9, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, n10
    n10 = 1

    while true do
        if n10 == 1 then
            if task.wait(Sec) then
                n10 = 2
            else
                n10 = 17
            end
        elseif n10 == 2 then
            if _G.AutoBerry then
                n10 = 3
            else
                n10 = 1
            end
        elseif n10 == 3 then
            CollectionService = game:GetService("CollectionService")
            localPlayer2 = game:GetService("Players").LocalPlayer
            tagged = CollectionService:GetTagged("BerryBush")
            n4 = 0
            n5 = #tagged + 0
            n10 = 4
        elseif n10 == 4 then
            n6 = n4 + 1

            if n6 <= n5 then
                n10 = 5
            else
                n10 = 1
            end
        elseif n10 == 5 then
            v7 = tagged[n6]
            v8, v9, v10 = pairs(v7:GetAttributes())
            v11 = v10
            v12 = v8
            v13 = v9
            v14 = n5
            v15 = n6
            n10 = 6
        elseif n10 == 6 then
            v16, v17 = v12(v13, v11)

            if v16 == nil then
                n10 = 16
            else
                n10 = 7
            end
        elseif n10 == 7 then
            v11 = v16

            if BerryArray and not table.find(BerryArray, v17) then
                n10 = 6
            else
                n10 = 8
            end
        elseif n10 == 8 then
            _tp(v7.Parent:GetPivot())
            n7 = 0
            n8 = #tagged + 0
            v18 = n5
            v19 = v16
            v20 = v12
            v21 = v13
            v22 = v14
            v23 = v15
            n10 = 9
        elseif n10 == 9 then
            n9 = n7 + 1

            if n9 <= n8 then
                n10 = 11
            else
                n10 = 10
            end
        elseif n10 == 10 then
            v11 = v19
            v12 = v20
            v13 = v21
            n5 = v18
            v14 = v22
            v15 = v23
            n10 = 6
        elseif n10 == 11 then
            v24, v25, v26 = pairs(tagged[n9]:GetChildren())
            v27 = v18
            v28 = v19
            v29 = v20
            v30 = v21
            v31 = v22
            v32 = v26
            n10 = 12
        elseif n10 == 12 then
            v33, v34 = v24(v25, v32)

            if v33 == nil then
                n10 = 15
            else
                n10 = 13
            end
        elseif n10 == 13 then
            v32 = v33

            if BerryArray and not table.find(BerryArray, v34) then
                n10 = 12
            else
                n10 = 14
            end
        elseif n10 == 14 then
            _tp(v34.WorldPivot)
            fireproximityprompt(v34.ProximityPrompt, math.huge)
            n10 = 12
        elseif n10 == 15 then
            n7 = n9
            v18 = v27
            v19 = v28
            v20 = v29
            v21 = v30
            v22 = v31
            n10 = 9
        elseif n10 == 16 then
            n4 = v15
            n5 = v14
            n10 = 4
        elseif n10 == 17 then
            return
        end
    end
end)

task.spawn(function()
    local n4, n5, n6, n7, n8, CollectionService, localPlayer2, tagged, n9, n10, n11, v7, v8, v9, v10, v11, v12, v13, v14, v15
    local v16, v17, n12, n13, v18, v19, v20, v21, v22, v23, n14, v24, v25, v26, v27, v28, v29, v30, v31, v32
    local v33, v34, TeleportService_2, tbl9, v35, v36, v37, v38, v39, v40, n15
    n15 = 1

    while true do
        if n15 == 1 then
            n4 = 1040293261
            n5 = 683747035
            n6 = 182434435
            n7 = nil
            n8 = nil
            n15 = 2
        elseif n15 == 2 then
            if task.wait(Sec) then
                n15 = 3
            else
                n15 = 24
            end
        elseif n15 == 3 then
            if _G.AutoBerryH then
                n15 = 4
            else
                n15 = 2
            end
        elseif n15 == 4 then
            CollectionService = game:GetService("CollectionService")
            localPlayer2 = game:GetService("Players").LocalPlayer
            tagged = CollectionService:GetTagged("BerryBush")

            if #tagged == 0 then
                n15 = 19
            else
                n15 = 5
            end
        elseif n15 == 5 then
            n9 = 0
            n10 = #tagged + 0
            n15 = 6
        elseif n15 == 6 then
            n11 = n9 + 1

            if n11 <= n10 then
                n15 = 7
            else
                n15 = 2
            end
        elseif n15 == 7 then
            v7 = tagged[n11]
            v8, v9, v10 = pairs(v7:GetAttributes())
            v11 = v10
            v12 = v8
            v13 = v9
            v14 = n10
            v15 = n11
            n15 = 8
        elseif n15 == 8 then
            v16, v17 = v12(v13, v11)

            if v16 == nil then
                n15 = 18
            else
                n15 = 9
            end
        elseif n15 == 9 then
            v11 = v16

            if BerryArray and not table.find(BerryArray, v17) then
                n15 = 8
            else
                n15 = 10
            end
        elseif n15 == 10 then
            _tp(v7.Parent:GetPivot())
            n12 = 0
            n13 = #tagged + 0
            v18 = n10
            v19 = v16
            v20 = v12
            v21 = v13
            v22 = v14
            v23 = v15
            n15 = 11
        elseif n15 == 11 then
            n14 = n12 + 1

            if n14 <= n13 then
                n15 = 13
            else
                n15 = 12
            end
        elseif n15 == 12 then
            v11 = v19
            v12 = v20
            v13 = v21
            n10 = v18
            v14 = v22
            v15 = v23
            n15 = 8
        elseif n15 == 13 then
            v24, v25, v26 = pairs(tagged[n14]:GetChildren())
            v27 = v18
            v28 = v19
            v29 = v20
            v30 = v21
            v31 = v22
            v32 = v26
            n15 = 14
        elseif n15 == 14 then
            v33, v34 = v24(v25, v32)

            if v33 == nil then
                n15 = 17
            else
                n15 = 15
            end
        elseif n15 == 15 then
            v32 = v33

            if BerryArray and not table.find(BerryArray, v34.Name) then
                n15 = 14
            else
                n15 = 16
            end
        elseif n15 == 16 then
            _tp(v34.WorldPivot)
            fireproximityprompt(v34.ProximityPrompt, math.huge)
            n15 = 14
        elseif n15 == 17 then
            n12 = n14
            v18 = v27
            v19 = v28
            v20 = v29
            v21 = v30
            v22 = v31
            n15 = 11
        elseif n15 == 18 then
            n9 = v15
            n10 = v14
            n15 = 6
        elseif n15 == 19 then
            TeleportService_2 = game:GetService("TeleportService")
            tbl9 = {}

            if pcall(function()
                n7 = 706406283
                n8 = 290551660
                tbl9 = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
            end) and tbl9.data then
                n15 = 20
            else
                n15 = 2
            end
        elseif n15 == 20 then
            v35, v36, v37 = pairs(tbl9.data)
            v38 = v37
            n15 = 21
        elseif n15 == 21 then
            v39, v40 = v35(v36, v38)

            if v39 == nil then
                n15 = 2
            else
                n15 = 22
            end
        elseif n15 == 22 then
            v38 = v39

            if v40.playing < v40.maxPlayers and v40.id ~= game.JobId then
                n15 = 23
            else
                n15 = 21
            end
        elseif n15 == 23 then
            TeleportService_2:TeleportToPlaceInstance(game.PlaceId, v40.id, localPlayer2)
            n15 = 2
        elseif n15 == 24 then
            return
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.AutoKillMob then
            pcall(function()
                local v7, v8, v9, v10, v11, v12, n4
                n4 = 1

                while true do
                    if n4 == 1 then
                        if game:GetService("Workspace").Enemies:FindFirstChild(getgenv().SelectMob) then
                            n4 = 2
                        else
                            n4 = 6
                        end
                    elseif n4 == 2 then
                        v7, v8, v9 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        v10 = v9
                        n4 = 3
                    elseif n4 == 3 then
                        v11, v12 = v7(v8, v10)

                        if v11 == nil then
                            n4 = 6
                        else
                            n4 = 4
                        end
                    elseif n4 == 4 then
                        v10 = v11

                        if v12.Name == getgenv().SelectMob and v12:FindFirstChild("Humanoid") and v12:FindFirstChild("HumanoidRootPart") and v12.Humanoid.Health > 0 then
                            n4 = 5
                        else
                            n4 = 3
                        end
                    elseif n4 == 5 then
                        game:GetService("RunService").Heartbeat:Wait()
                        Attack.Kill(v12, _G.AutoKillMob)

                        if _G.AutoKillMob and v12.Parent and v12.Humanoid.Health > 0 then
                            n4 = 5
                        else
                            n4 = 3
                        end
                    elseif n4 == 6 then
                        return
                    end
                end
            end)
        end
    end
end)

local tbl9 = {
    Pirates = {
        CFrame = CFrame.new(-2709.67944, 24.5206585, 2104.24585, -0.744724929, -3.97967455e-08, -0.667371571, 4.32403588e-08, 1, -1.07884304e-07, 0.667371571, -1.09201515e-07, -0.744724929),
        Mobs = {"Bandit"},
    },
    Marine = {
        CFrame = CFrame.new(-2709.67944, 24.5206585, 2104.24585, -0.744724929, -3.97967455e-08, -0.667371571, 4.32403588e-08, 1, -1.07884304e-07, 0.667371571, -1.09201515e-07, -0.744724929),
        Mobs = {"Trainee"},
    },
    Jungle = {
        CFrame = CFrame.new(-1600, 36, 150),
        Mobs = {"Monkey", "Gorilla"},
    },
    ["Pirate Village"] = {
        CFrame = CFrame.new(-1100, 4, 3850),
        Mobs = {"Pirate", "Brute"},
    },
    Desert = {
        CFrame = CFrame.new(1090, 7, 4370),
        Mobs = {"Desert Bandit", "Desert Officer"},
    },
    ["Frozen Village"] = {
        CFrame = CFrame.new(1200, 28, -1500),
        Mobs = {"Snow Bandit", "Snowman"},
    },
    ["Marine Fortress"] = {
        CFrame = CFrame.new(-4500, 20, 4250),
        Mobs = {"Chief Petty Officer"},
    },
    ["Skylands Lower"] = {
        CFrame = CFrame.new(-5000, 700, -2500),
        Mobs = {"Sky Bandit", "Dark Master"},
    },
    Prison = {
        CFrame = CFrame.new(4875, 6, 735),
        Mobs = {"Prisoner", "Dangerous Prisoner"},
    },
    Colosseum = {
        CFrame = CFrame.new(-1500, 60, -290),
        Mobs = {"Toga Warrior", "Gladiator"},
    },
    ["Magma Village"] = {
        CFrame = CFrame.new(-5200, 8, 8400),
        Mobs = {"Military Soldier", "Military Spy"},
    },
    ["Underwater City"] = {
        CFrame = CFrame.new(61160, 5, 1819),
        Mobs = {"Fishman Warrior", "Fishman Commando"},
    },
    ["Skylands Upper"] = {
        CFrame = CFrame.new(-7880, 5545, -380),
        Mobs = {"God's Guard", "Shanda", "Royal Squad", "Royal Soldier"},
    },
    ["Fountain City"] = {
        CFrame = CFrame.new(5258, 38, 4050),
        Mobs = {"Galley Pirate", "Galley Captain"},
    },
}

Sea1_Islands = tbl9
Core.Sea1_Islands = Sea1_Islands
getgenv().Sea1_Islands = Sea1_Islands

local tbl10 = {
    ["Kingdom of Rose"] = {
        CFrame = CFrame.new(600, 73, 1000),
        Mobs = {"Raider", "Mercenary", "Swan Pirate", "Factory Staff"},
    },
    ["Green Zone"] = {
        CFrame = CFrame.new(-2400, 73, -2700),
        Mobs = {"Marine Lieutenant", "Marine Captain"},
    },
    ["Graveyard Island"] = {
        CFrame = CFrame.new(-5500, 8, -700),
        Mobs = {"Zombie", "Vampire"},
    },
    ["Snow Mountain"] = {
        CFrame = CFrame.new(600, 400, -5300),
        Mobs = {"Snow Trooper", "Winter Warrior"},
    },
    ["Hot and Cold (Cold)"] = {
        CFrame = CFrame.new(-6000, 15, -4500),
        Mobs = {"Lab Subordinate", "Horned Warrior"},
    },
    ["Hot and Cold (Hot)"] = {
        CFrame = CFrame.new(-5400, 15, -5900),
        Mobs = {"Magma Ninja", "Lava Pirate"},
    },
    ["Cursed Ship"] = {
        CFrame = CFrame.new(923, 126, 32852),
        Mobs = {
            "Ship Deckhand",
            "Ship Engineer",
            "Ship Steward",
            "Ship Officer",
        },
    },
    ["Ice Castle"] = {
        CFrame = CFrame.new(5500, 28, -6800),
        Mobs = {"Arctic Warrior", "Snow Lurker"},
    },
    ["Forgotten Island"] = {
        CFrame = CFrame.new(-3050, 237, -10150),
        Mobs = {"Sea Soldier", "Water Fighter"},
    },
}

Sea2_Islands = tbl10
Core.Sea2_Islands = Sea2_Islands
getgenv().Sea2_Islands = Sea2_Islands

local tbl11 = {
    ["Port Town"] = {
        CFrame = CFrame.new(-290, 7, 5300),
        Mobs = {"Pirate Millionaire", "Pistol Billionaire"},
    },
    ["Hydra Island"] = {
        CFrame = CFrame.new(5700, 600, 200),
        Mobs = {
            "Dragon Crew Warrior",
            "Dragon Crew Archer",
            "Female Islander",
            "Giant Islander",
        },
    },
    ["Great Tree"] = {
        CFrame = CFrame.new(2300, 25, -6400),
        Mobs = {"Marine Commodore", "Marine Rear Admiral"},
    },
    ["Floating Turtle"] = {
        CFrame = CFrame.new(-12500, 330, -7500),
        Mobs = {
            "Fishman Raider",
            "Fishman Captain",
            "Forest Pirate",
            "Mythological Pirate",
            "Jungle Pirate",
            "Musketeer Pirate",
        },
    },
    ["Haunted Castle"] = {
        CFrame = CFrame.new(-9500, 140, 5500),
        Mobs = {
            "Reborn Skeleton",
            "Living Zombie",
            "Demonic Soul",
            "Posessed Mummy",
        },
    },
    ["Sea of Treats"] = {
        CFrame = CFrame.new(-2100, 38, -12000),
        Mobs = {
            "Peanut Scout",
            "Peanut President",
            "Ice Cream Chef",
            "Ice Cream Commander",
            "Cookie Crafter",
            "Cake Guard",
            "Baking Staff",
            "Head Baker",
            "Cocoa Warrior",
            "Chocolate Bar Battler",
            "Sweet Thief",
            "Candy Rebel",
            "Candy Pirate",
            "Snow Demon",
        },
    },
    ["Tiki Outpost"] = {
        CFrame = CFrame.new(-16200, 90, -17300),
        Mobs = {
            "Isle Outlaw",
            "Island Boy",
            "Sun-kissed Warrior",
            "Isle Champion",
        },
    },
    ["Submerged Island"] = {
        CFrame = CFrame.new(-3200, -10, -10000),
        Mobs = {
            "Reef Bandit",
            "Coral Pirate",
            "Sea Chanter",
            "Ocean Prophet",
            "High Disciple",
            "Grand Devotee",
        },
    },
}

Sea3_Islands = tbl11
Core.Sea3_Islands = Sea3_Islands
getgenv().Sea3_Islands = Sea3_Islands
local v7 = Core
local v8 = World1
local island = v8 and Sea1_Islands

if not island then
    local v9 = World2
    island = v9 and Sea2_Islands
end

if not island then
    local v9 = World3
    island = v9 and Sea3_Islands
end

if not island then
    island = {}
end

v7.Island = island
IslandData = Core.Island
getgenv().IslandData = IslandData

Core.GetMobs = function()
    local tbl12 = {}
    local v9 = IslandData
    local island2 = v9 or Core.Island

    if not island2 then
        local v10 = World1
        island2 = v10 and Sea1_Islands

        if not island2 then
            local v11 = World2
            island2 = v11 and Sea2_Islands
        end

        if not island2 then
            local v11 = World3
            island2 = v11 and Sea3_Islands
        end
    end

    if not island2 then
        island2 = {}
    end

    local v10, v11, v12 = pairs(island2)
    local v13 = v12
    local v14 = v10
    local v15 = v11

    while true do
        local v16, v17 = v14(v15, v13)
        if v16 == nil then
            break
        end
        v13 = v16

        if v17.Mobs then
            for i, mob in ipairs(v17.Mobs) do
                if not table.find(tbl12, mob) then
                    table.insert(tbl12, mob)
                end
            end

            v13 = v16
        end
    end

    table.sort(tbl12)
    return tbl12
end

getgenv().GetMobs = Core.GetMobs

task.spawn(function()
    local v9, cFrame, tbl12, v10, v11, v12, v13, v14, v15, flag7, v16, v17, v18, v19, v20, v21, n4
    n4 = 1

    while true do
        if n4 == 1 then
            n4 = 2
        elseif n4 == 2 then
            if task.wait(0.2) then
                n4 = 3
            else
                n4 = 15
            end
        elseif n4 == 3 then
            if _G.AutoFarmIsland and _G.SelectIsland and IslandData then
                n4 = 4
            else
                n4 = 2
            end
        elseif n4 == 4 then
            v9 = IslandData[_G.SelectIsland]

            if v9 then
                n4 = 5
            else
                n4 = 2
            end
        elseif n4 == 5 then
            cFrame = v9.CFrame
            tbl12 = {}
            v10, v11, v12 = ipairs(v9.Mobs)
            v13 = v12
            n4 = 6
        elseif n4 == 6 then
            v14, v15 = v10(v11, v13)

            if v14 == nil then
                n4 = 8
            else
                n4 = 7
            end
        elseif n4 == 7 then
            v13 = v14
            tbl12[v15] = true
            n4 = 6
        elseif n4 == 8 then
            flag7 = false
            v16, v17, v18 = pairs(workspace.Enemies:GetChildren())
            v19 = v18
            n4 = 9
        elseif n4 == 9 then
            v20, v21 = v16(v17, v19)

            if v20 == nil then
                n4 = 13
            else
                n4 = 10
            end
        elseif n4 == 10 then
            v19 = v20

            if tbl12[v21.Name] and v21:FindFirstChild("Humanoid") and v21:FindFirstChild("HumanoidRootPart") and v21.Humanoid.Health > 0 then
                n4 = 11
            else
                n4 = 9
            end
        elseif n4 == 11 then
            flag7 = true
            n4 = 12
        elseif n4 == 12 then
            task.wait()
            _tp(v21.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0))
            Attack.Kill(v21, true)

            if _G.AutoFarmIsland and v21.Parent and v21.Humanoid.Health > 0 then
                n4 = 12
            else
                n4 = 9
            end
        elseif n4 == 13 then
            if flag7 then
                n4 = 2
            else
                n4 = 14
            end
        elseif n4 == 14 then
            _tp(cFrame)
            n4 = 2
        elseif n4 == 15 then
            return
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if _G.FarmEliteHunt then
                local Quest = GuiShown("Quest")
                local v9 = QuestText()

                if Quest then
                    local v10 = nil

                    for k, v11 in pairs({"Diablo", "Urban", "Deandre"}) do
                        if string.find(v9, v11) then
                            v10 = v11
                            break
                        end
                        continue
                    end

                    if v10 then
                        local v11 = nil

                        for k, child in pairs(replicated:GetChildren()) do
                            if child.Name == v10 and child:FindFirstChild("HumanoidRootPart") then
                                v11 = child
                                break
                            end
                        end

                        if not v11 then
                            for k, child in pairs(Enemies:GetChildren()) do
                                if child.Name == v10 and Attack.Alive(child) then
                                    v11 = child
                                    break
                                end
                            end
                        end

                        if v11 and v11:FindFirstChild("HumanoidRootPart") then
                            _tp(v11.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))

                            repeat
                                task.wait()
                                Attack.Kill(v11, _G.FarmEliteHunt)
                            until not _G.FarmEliteHunt or not v11.Parent or v11.Humanoid.Health <= 0 or not GuiShown("Quest")
                        else
                            task.wait(5)
                        end
                    else
                        replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                else
                    local response = replicated.Remotes.CommF_:InvokeServer("EliteHunter")
                    if response == nil or string.find(tostring(response), "Cooldown") then
                        task.wait(10)
                        return
                    end
                    task.wait(1)
                end
            end
        end)
    end
end)

HopServer = function()
    local HttpService = game:GetService("HttpService")
    local TeleportService_2 = game:GetService("TeleportService")
    local placeId = game.PlaceId
    local str = ""
    local flag7 = false
    local ok, result, data, nextPageCursor, str2

    repeat
        ok, result = pcall(function()
            return game:HttpGet("https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. str)
        end)

        if ok and result then
            data = HttpService:JSONDecode(result)

            if data.data then
                for k, v9 in pairs(data.data) do
                    if v9.playing < v9.maxPlayers and v9.id ~= game.JobId then
                        flag7 = true
                        TeleportService_2:TeleportToPlaceInstance(placeId, v9.id)
                        break
                    end
                end

                nextPageCursor = data.nextPageCursor
                str2 = nextPageCursor or ""
                str = str2
            end
        end
    until not str or flag7
end

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if _G.FarmEliteH then
                local Quest = GuiShown("Quest")
                local v9 = QuestText()

                if Quest then
                    local v10 = nil

                    for k, v11 in pairs({"Diablo", "Urban", "Deandre"}) do
                        if string.find(v9, v11) then
                            v10 = v11
                            break
                        end
                        continue
                    end

                    if v10 then
                        local v11 = nil

                        for k, child in pairs(replicated:GetChildren()) do
                            if child.Name == v10 and child:FindFirstChild("HumanoidRootPart") then
                                v11 = child
                                break
                            end
                        end

                        for k, child in pairs(workspace.Enemies:GetChildren()) do
                            if child.Name == v10 and Attack.Alive(child) then
                                v11 = child
                                break
                            end
                        end

                        if v11 and v11:FindFirstChild("HumanoidRootPart") then
                            _tp(v11.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))

                            repeat
                                task.wait()
                                Attack.Kill(v11, _G.FarmEliteH)
                            until not _G.FarmEliteH or not v11.Parent or v11.Humanoid.Health <= 0 or not GuiShown("Quest")
                        else
                            task.wait(5)
                            HopServer()
                        end
                    else
                        replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                else
                    local response = replicated.Remotes.CommF_:InvokeServer("EliteHunter")
                    if response == nil or string.find(tostring(response), "Cooldown") then
                        HopServer()
                        return
                    end
                    task.wait(1)
                end
            end
        end)
    end
end)

task.spawn(function()
    local vector = Vector3.new(-5097.93164, 316.447021, -3142.66602)
    local cframe3 = CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781)
    local n4 = 0

    while task.wait(Sec) do
        pcall(function()
            if _G.AutoRipIngay then
                local v9 = GetConnectionEnemies({"rip_indra", "rip_indra True Form"})

                if v9 then
                    local n5 = tick() + 120

                    repeat
                        task.wait()
                        Attack.Kill(v9, _G.AutoRipIngay)
                    until not _G.AutoRipIngay or not v9.Parent or v9.Humanoid.Health <= 0 or n5 < tick()
                else
                    local character3 = plr.Character
                    local humanoidRootPart2 = character3 and plr.Character:FindFirstChild("HumanoidRootPart")

                    if humanoidRootPart2 and (humanoidRootPart2.Position - cframe3.Position).Magnitude > 400 and tick() - n4 > 5 then
                        n4 = tick()
                        replicated.Remotes.CommF_:InvokeServer("requestEntrance", vector)
                        task.wait(0.1)
                    end

                    _tp(cframe3)
                end
            end
        end)
    end
end)

AuraSkin = function(arg)
    replicated:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/FruitCustomizerRF"):InvokeServer(unpack({{StorageName = arg, Type = "AuraSkin", Context = "Equip"}}))
end

VaildColor = function(arg)
    if not arg or not arg.BrickColor then
        return
    end
    local flag7 = tostring(arg.BrickColor) == "Lime green"
    return flag7
end

HakiCalculate = function(arg)
    local tbl12 = {
        ["Really red"] = "Pure Red",
        Oyster = "Snow White",
        ["Hot pink"] = "Winter Sky",
    }

    if arg and arg.BrickColor then
        return tbl12[tostring(arg.BrickColor)]
    end
end

task.spawn(function()
    while task.wait(Sec) do
        if _G.AutoUnHaki then
            pcall(function()
                local summoner, v9, v10, v11, v12, v13, v14, part2, n4
                n4 = 1

                while true do
                    if n4 == 1 then
                        summoner = workspace.Map["Boat Castle"]:FindFirstChild("Summoner")

                        if summoner and summoner:FindFirstChild("Circle") then
                            n4 = 2
                        else
                            n4 = 8
                        end
                    elseif n4 == 2 then
                        v9, v10, v11 = pairs(summoner:FindFirstChild("Circle"):GetChildren())
                        v12 = v11
                        n4 = 3
                    elseif n4 == 3 then
                        v13, v14 = v9(v10, v12)

                        if v13 == nil then
                            n4 = 8
                        else
                            n4 = 4
                        end
                    elseif n4 == 4 then
                        v12 = v13

                        if v14.Name == "Part" then
                            n4 = 5
                        else
                            n4 = 3
                        end
                    elseif n4 == 5 then
                        part2 = v14:FindFirstChild("Part")

                        if VaildColor(part2) == false then
                            n4 = 6
                        else
                            n4 = 3
                        end
                    elseif n4 == 6 then
                        AuraSkin(HakiCalculate(v14))
                        n4 = 7
                    elseif n4 == 7 then
                        task.wait()
                        _tp(v14.CFrame)

                        if VaildColor(part2) ~= true and _G.AutoUnHaki then
                            n4 = 7
                        else
                            n4 = 3
                        end
                    elseif n4 == 8 then
                        return
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.Auto_Cake_Prince and not _G.AutoRaidCastle then
            pcall(function()
                local localPlayer2 = game.Players.LocalPlayer
                local character3 = localPlayer2.Character
                local humanoidRootPart2 = character3 and localPlayer2.Character:FindFirstChild("HumanoidRootPart")
                local enemies = workspace.Enemies
                local cakeLoaf = workspace.Map:FindFirstChild("CakeLoaf")
                local bigMirror = cakeLoaf and cakeLoaf:FindFirstChild("BigMirror")
                if not humanoidRootPart2 then
                    return
                end

                if _G.AcceptQuestC and not _G.CheckQuestVisible(localPlayer2) then
                    local cframe3 = CFrame.new(-1927.92, 37.8, -12842.54)
                    _tp(cframe3)

                    while (cframe3.Position - humanoidRootPart2.Position).Magnitude > 50 do
                        task.wait(0.2)
                    end

                    local n4 = math.random(1, 4)

                    local tbl12 = {
                        {"StartQuest", "CakeQuest2", 2},
                        {"StartQuest", "CakeQuest2", 1},
                        {"StartQuest", "CakeQuest1", 1},
                        {"StartQuest", "CakeQuest1", 2},
                    }

                    pcall(function()
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(tbl12[n4]))
                    end)
                end

                if not cakeLoaf then
                    _tp(CFrame.new(-2077, 252, -12373))
                    task.wait(2)
                    return
                end

                if bigMirror and (bigMirror.Other.Transparency == 0 or enemies:FindFirstChild("Cake Prince")) then
                    local v9 = GetConnectionEnemies("Cake Prince")

                    if v9 then
                        repeat
                            task.wait()
                            Attack.Kill2(v9, _G.Auto_Cake_Prince)
                        until not _G.Auto_Cake_Prince or not v9.Parent or v9.Humanoid.Health <= 0
                    else
                        _tp(CFrame.new(-2151.82, 149.32, -12404.91))
                    end
                else
                    local v9 = GetConnectionEnemies({
                        "Cookie Crafter",
                        "Cake Guard",
                        "Baking Staff",
                        "Head Baker",
                    })

                    if v9 then
                        repeat
                            task.wait()
                            Attack.Kill(v9, _G.Auto_Cake_Prince)
                        until not _G.Auto_Cake_Prince or not v9.Parent or v9.Humanoid.Health <= 0 or bigMirror and bigMirror.Other.Transparency == 0
                    else
                        _tp(CFrame.new(-2077, 252, -12373))
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(2) do
        if _G.AutoSpawnCP then
            pcall(function()
                local commF = game.ReplicatedStorage.Remotes.CommF_
                local enemies = workspace.Enemies
                local bigMirror = workspace.Map.CakeLoaf:FindFirstChild("BigMirror")
                if not bigMirror then
                    return
                end

                if enemies:FindFirstChild("Cake Prince") then
                    return
                end

                if bigMirror.Other.Transparency == 0 then
                    return
                end
                commF:InvokeServer("CakePrinceSpawner", true)
            end)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.AutoDoughKing then
            pcall(function()
                if workspace.Map.CakeLoaf:FindFirstChild("RedDoor") then
                    if workspace.Map.CakeLoaf:FindFirstChild("RedDoor") then
                        if GetBP("Red Key") then
                            repeat
                                task.wait()
                                _tp(CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-08, 0.98883605, 3.60619588e-08, 1, 1.35681812e-08, -0.98883605, 3.36376011e-08, 0.149007782))
                            until not getgenv().AutoDoughKing or (plr.Character.HumanoidRootPart.CFrame - CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-08, 0.98883605, 3.60619588e-08, 1, 1.35681812e-08, -0.98883605, 3.36376011e-08, 0.149007782)).Magnitude <= 5

                            EquipWeapon("Red Key")
                        end
                    elseif GetConnectionEnemies("Dough King") then
                        local v9 = GetConnectionEnemies("Dough King")

                        if v9 then
                            repeat
                                task.wait()
                                Attack.Kill(v9, _G.AutoDoughKing)
                            until not _G.AutoDoughKing or not v9.Parent or v9.Humanoid.Health <= 0
                        else
                            _tp(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375))
                        end
                    end
                elseif GetBP("Red Key") then
                    replicated.Remotes.CommF_:InvokeServer("CakeScientist", "Check")
                    replicated.Remotes.CommF_:InvokeServer("RaidsNpc", "Check")
                end

                if GetBP("Sweet Chalice") then
                    replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
                    _G.AutoAttackDoughKing = true
                else
                    _G.AutoAttackDoughKing = false
                end

                if GetBP("God's Chalice") and GetM("Conjured Cocoa") >= 10 then
                    replicated.Remotes.CommF_:InvokeServer("SweetChaliceNpc")
                end

                if plr.Backpack:FindFirstChild("God's Chalice") and not plr.Character:FindFirstChild("God's Chalice") then
                    _G.FarmEliteHunt = false
                else
                    _G.FarmEliteHunt = true
                end

                if GetM("Conjured Cocoa") <= 10 then
                    local v9 = GetConnectionEnemies({"Cocoa Warrior", "Chocolate Bar Battler"})

                    if v9 then
                        repeat
                            task.wait()
                            Attack.Kill(v9, _G.AutoDoughKing)
                        until _G.AutoDoughKing == false or not v9.Parent or v9.Humanoid.Health <= 0
                    else
                        _tp(CFrame.new(402.7189025878906, 81.06050109863281, -12259.54296875))
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.AutoAttackDoughKing then
            pcall(function()
                local v9 = GetConnectionEnemies("Dough King")

                if v9 then
                    repeat
                        task.wait()
                        Attack.Kill(v9, _G.AutoAttackDoughKing)
                    until not _G.AutoAttackDoughKing or not v9.Parent or v9.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(-1943.6765, 251.5095, -12337.8809))
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.AutoHop_Dough then
            pcall(function()
                local v9 = GetConnectionEnemies("Dough King")

                if v9 then
                    repeat
                        task.wait()
                        Attack.Kill(v9, _G.AutoHop_Dough)
                    until not _G.AutoHop_Dough or not v9.Parent or v9.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(-1943.6765, 251.5095, -12337.8809))
                    task.wait(2)
                    HopServer()
                end
            end)
        end
    end
end)

task.spawn(function()
    local localPlayer2 = game.Players.LocalPlayer

    local tbl12 = {
        "Reborn Skeleton",
        "Living Zombie",
        "Demonic Soul",
        "Posessed Mummy",
    }

    local tbl13 = {
        {"HauntedQuest1", 1, "Reborn Skeleton", 1975},
        {"HauntedQuest1", 2, "Living Zombie", 2000},
        {"HauntedQuest2", 1, "Demonic Soul", 2025},
        {"HauntedQuest2", 2, "Posessed Mummy", 2050},
    }

    local tbl14 = {
        CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125),
        PosMsList["Reborn Skeleton"],
        PosMsList["Living Zombie"],
        PosMsList["Demonic Soul"],
    }

    local n4 = 1
    local v9 = nil

    QuestWantedMob = function()
        local ok, result = pcall(function()
            local quest = localPlayer2.PlayerGui.Main.Quest
            if not quest.Visible then
                return nil
            end
            return quest.Container.QuestTitle.Title.Text
        end)

        if not ok or not result then
            return nil
        end
        local v10 = string.lower(result)

        for i, v11 in ipairs(tbl13) do
            local v12 = string.lower(v11[3])
            if string.find(v10, string.sub(v12, 1, #v12 - 1), 1, true) then
                return v11[3]
            end
        end

        return nil
    end

    while task.wait(0.5) do
        if _G.AutoFarm_Bone then
            pcall(function()
                local character3 = localPlayer2.Character
                local humanoidRootPart2 = character3 and localPlayer2.Character:FindFirstChild("HumanoidRootPart")
                if not humanoidRootPart2 then
                    return
                end

                if _G.AcceptQuestB and not _G.CheckQuestVisible(localPlayer2) then
                    local cframe3 = CFrame.new(-9516.99316, 172.01718, 6078.46533)
                    local n5 = tick() + 45
                    local character4, humanoidRootPart3

                    repeat
                        _tp(cframe3)
                        task.wait(0.5)
                        character4 = localPlayer2.Character
                        humanoidRootPart3 = character4 and localPlayer2.Character:FindFirstChild("HumanoidRootPart")
                        humanoidRootPart2 = humanoidRootPart3
                    until not _G.AutoFarm_Bone or not humanoidRootPart2 or (cframe3.Position - humanoidRootPart2.Position).Magnitude <= 50 or n5 < tick()

                    if not _G.AutoFarm_Bone or not humanoidRootPart2 or (cframe3.Position - humanoidRootPart2.Position).Magnitude > 50 then
                        return
                    end
                    local value = localPlayer2.Data.Level.Value
                    local tbl15 = {}

                    for i, v10 in ipairs(tbl13) do
                        if v10[4] <= value then
                            table.insert(tbl15, v10)
                        end
                    end

                    if #tbl15 > 0 then
                        local v10 = tbl15[math.random(1, #tbl15)]
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", v10[1], v10[2])
                    end
                end

                local v10 = QuestWantedMob()
                local v11 = GetNearestEnemy
                local v12 = v10

                if v10 then
                    local tbl15 = {}
                    v12 = tbl15
                    tbl15[1] = v10
                end

                if not v12 then
                    v12 = tbl12
                end

                local v13 = v11(v12)

                if v13 then
                    v9 = nil
                    local n5 = tick() + 30

                    repeat
                        task.wait()
                        Attack.Kill(v13, true)
                    until not _G.AutoFarm_Bone or not v13.Parent or v13.Humanoid.Health <= 0 or n5 < tick()
                else
                    local v14 = GetConnectionEnemies
                    local v15 = v10

                    if v10 then
                        local tbl15 = {}
                        v15 = tbl15
                        tbl15[1] = v10
                    end

                    if not v15 then
                        v15 = tbl12
                    end

                    if v14(v15) then
                        local v16 = GetConnectionEnemies
                        local v17 = v10

                        if v10 then
                            local tbl15 = {}
                            v17 = tbl15
                            tbl15[1] = v10
                        end

                        if not v17 then
                            v17 = tbl12
                        end

                        local v18 = v16(v17)

                        if v18 and v18:FindFirstChild("HumanoidRootPart") then
                            _tp(v18.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                        end
                    else
                        local v16

                        if v10 and PosMsList[v10] then
                            v16 = PosMsList[v10]
                        else
                            local v17 = tbl14[n4]
                            v16 = v17

                            if (v17.Position - humanoidRootPart2.Position).Magnitude <= 60 then
                                local v18 = v9
                                local now = v18 or tick()
                                v9 = now

                                if tick() - v9 > 5 then
                                    n4 = n4 % #tbl14 + 1
                                    v9 = nil
                                end
                            else
                                v9 = nil
                            end
                        end

                        _tp(v16)
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(Sec) do
        if _G.AutoHytHallow then
            pcall(function()
                local v9 = GetConnectionEnemies("Soul Reaper")

                if v9 then
                    repeat
                        task.wait()
                        Attack.Kill(v9, _G.AutoHytHallow)
                    until v9.Humanoid.Health <= 0 or _G.AutoHytHallow == false
                elseif GetBP("Hallow Essence") then
                    repeat
                        task.wait(0.1)
                        _tp(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
                    until _G.AutoHytHallow == false or plr.Character.HumanoidRootPart.CFrame == CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125)

                    EquipWeapon("Hallow Essence")
                else
                    repeat
                        task.wait(0.1)
                        replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                    until _G.AutoHytHallow == false or GetBP("Hallow Essence")
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(Sec) do
        pcall(function()
            if _G.Auto_Random_Bone then
                repeat
                    task.wait()
                    replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                until not _G.Auto_Random_Bone
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(Sec) do
        if _G.TryLucky then
            local cframe3 = CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813)

            if plr.Character.HumanoidRootPart.CFrame == cframe3 then
                if plr.Character.HumanoidRootPart.CFrame == cframe3 then
                    replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 1)
                end
            else
                _tp(CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813))
            end
        end
    end
end)

task.spawn(function()
    while task.wait(Sec) do
        if _G.Praying then
            local cframe3 = CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813)

            if plr.Character.HumanoidRootPart.CFrame == cframe3 then
                if plr.Character.HumanoidRootPart.CFrame == cframe3 then
                    replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2)
                end
            else
                _tp(CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813))
            end
        end
    end
end)

Check_Eye = function()
    local islandModel = workspace.Map.TikiOutpost.IslandModel
    local n4 = 0

    for i, v9 in ipairs({
        islandModel.Eye1,
        islandModel.Eye2,
        islandModel.IslandChunks.E.Eye3,
        islandModel.IslandChunks.E.Eye4,
    }) do
        if v9 and v9.Transparency ~= 1 then
            n4 = n4 + 1
        end
    end

    local flag7 = n4 == 4
    return n4, flag7
end

task.spawn(function()
    while task.wait(Sec) do
        if _G.FarmTyrant then
            pcall(function()
                local humanoidRootPart2, v9, vector, tyrantOfTheSkies, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25
                local now, character3, humanoidRootPart3, n4
                n4 = 1

                while true do
                    if n4 == 1 then
                        if plr.Character then
                            n4 = 2
                        else
                            n4 = 31
                        end
                    elseif n4 == 2 then
                        humanoidRootPart2 = plr.Character:FindFirstChild("HumanoidRootPart")
                        v9 = humanoidRootPart2

                        if humanoidRootPart2 then
                            n4 = 3
                        else
                            n4 = 30
                        end
                    elseif n4 == 3 then
                        vector = Vector3.new(-16268.287, 152.616, 1390.773)

                        if (humanoidRootPart2.Position - vector).Magnitude > 5 then
                            n4 = 4
                        else
                            n4 = 6
                        end
                    elseif n4 == 4 then
                        _tp(CFrame.new(vector))
                        n4 = 5
                    elseif n4 == 5 then
                        task.wait()

                        if _G.FarmTyrant and (not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") or (plr.Character.HumanoidRootPart.Position - vector).Magnitude > 5) then
                            n4 = 5
                        else
                            n4 = 6
                        end
                    elseif n4 == 6 then
                        tyrantOfTheSkies = workspace.Enemies:FindFirstChild("Tyrant of the Skies")

                        if tyrantOfTheSkies and tyrantOfTheSkies:FindFirstChild("Humanoid") and tyrantOfTheSkies.Humanoid.Health > 0 then
                            n4 = 25
                        else
                            n4 = 7
                        end
                    elseif n4 == 7 then
                        v10, v11, v12 = ipairs({
                            "Serpent Hunter",
                            "Skull Slayer",
                            "Isle Champion",
                            "Sun-kissed Warrior",
                        })

                        v13 = v12
                        v14 = v10
                        v15 = v11
                        n4 = 8
                    elseif n4 == 8 then
                        v16, v17 = v14(v15, v13)

                        if v16 == nil then
                            n4 = 24
                        else
                            n4 = 9
                        end
                    elseif n4 == 9 then
                        if _G.FarmTyrant then
                            n4 = 10
                        else
                            n4 = 24
                        end
                    elseif n4 == 10 then
                        v18, v19, v20 = pairs(workspace.Enemies:GetChildren())
                        v21 = v14
                        v22 = v15
                        v23 = v20
                        n4 = 11
                    elseif n4 == 11 then
                        v24, v25 = v18(v19, v23)

                        if v24 == nil then
                            n4 = 23
                        else
                            n4 = 12
                        end
                    elseif n4 == 12 then
                        v23 = v24

                        if _G.FarmTyrant then
                            n4 = 13
                        else
                            n4 = 23
                        end
                    elseif n4 == 13 then
                        if v25 and v25.Name == v17 and v25:FindFirstChild("HumanoidRootPart") and v25:FindFirstChild("Humanoid") and v25.Humanoid.Health > 0 then
                            n4 = 14
                        else
                            n4 = 11
                        end
                    elseif n4 == 14 then
                        if (v9.Position - v25.HumanoidRootPart.Position).Magnitude > 5000 then
                            n4 = 15
                        else
                            n4 = 19
                        end
                    elseif n4 == 15 then
                        _tp(v25.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                        now = tick()
                        n4 = 16
                    elseif n4 == 16 then
                        task.wait()
                        character3 = plr.Character
                        humanoidRootPart3 = character3

                        if character3 then
                            n4 = 17
                        else
                            n4 = 18
                        end
                    elseif n4 == 17 then
                        humanoidRootPart3 = plr.Character:FindFirstChild("HumanoidRootPart")
                        n4 = 18
                    elseif n4 == 18 then
                        v9 = humanoidRootPart3

                        if _G.FarmTyrant and v9 and (v9.Position - v25.HumanoidRootPart.Position).Magnitude > 6 and tick() - now <= 8 then
                            n4 = 16
                        else
                            n4 = 19
                        end
                    elseif n4 == 19 then
                        if _G.FarmTyrant then
                            n4 = 20
                        else
                            n4 = 11
                        end
                    elseif n4 == 20 then
                        if Attack and Attack.Kill then
                            n4 = 21
                        else
                            n4 = 22
                        end
                    elseif n4 == 21 then
                        Attack.Kill(v25, _G.FarmTyrant)
                        n4 = 22
                    elseif n4 == 22 then
                        task.wait()

                        if _G.FarmTyrant and v25.Parent and v25.Humanoid.Health > 0 then
                            n4 = 19
                        else
                            n4 = 11
                        end
                    elseif n4 == 23 then
                        v13 = v16
                        v14 = v21
                        v15 = v22
                        n4 = 8
                    elseif n4 == 24 then
                        return
                    elseif n4 == 25 then
                        if _G.FarmTyrant then
                            n4 = 26
                        else
                            n4 = 29
                        end
                    elseif n4 == 26 then
                        if Attack and Attack.Kill then
                            n4 = 27
                        else
                            n4 = 28
                        end
                    elseif n4 == 27 then
                        Attack.Kill(tyrantOfTheSkies, _G.FarmTyrant)
                        n4 = 28
                    elseif n4 == 28 then
                        task.wait()

                        if _G.FarmTyrant and tyrantOfTheSkies.Parent and tyrantOfTheSkies.Humanoid.Health > 0 then
                            n4 = 25
                        else
                            n4 = 29
                        end
                    elseif n4 == 29 then
                        return
                    elseif n4 == 30 then
                        return
                    elseif n4 == 31 then
                        return
                    end
                end
            end)
        end
    end
end)

sendSkillKey = function(arg)
    local VirtualInputManager2 = game:GetService("VirtualInputManager")
    VirtualInputManager2:SendKeyEvent(true, arg, false, game)
    task.wait(0.05)
    VirtualInputManager2:SendKeyEvent(false, arg, false, game)
end

equipAndUseSkill = function(arg)
    local character3 = plr.Character
    local backpack = plr.Backpack
    if not character3 or not character3:FindFirstChild("Humanoid") or character3.Humanoid.Health <= 0 then
        return
    end

    for k, child in pairs(backpack:GetChildren()) do
        if child:IsA("Tool") and child.ToolTip == arg then
            child.Parent = character3
            task.wait(0.12)

            for i, v9 in ipairs({"Z", "X", "C", "V", "F"}) do
                if not _G.FarmPhaBinh then
                    break
                end

                pcall(function()
                    sendSkillKey(v9)
                end)

                task.wait(0.12)
            end

            child.Parent = backpack
            break
        end
    end
end

local phaBinhPoints = {
    CFrame.new(-16332.5263671875, 158.07200622558594, 1440.324951171875),
    CFrame.new(-16288.609375, 158.16700744628906, 1470.3680419921875),
    CFrame.new(-16245.412109375, 158.43699645996094, 1463.365966796875),
    CFrame.new(-16212.46875, 158.16700744628906, 1466.343994140625),
    CFrame.new(-16211.9462890625, 158.07200622558594, 1322.39794921875),
    CFrame.new(-16260.921875, 154.92100524902344, 1323.615966796875),
    CFrame.new(-16297.0595703125, 159.322998046875, 1317.2239990234375),
    CFrame.new(-16335.0966796875, 159.33399963378906, 1324.885986328125),
}

Core.PhaBinhPoints = phaBinhPoints

task.spawn(function()
    while task.wait(Sec) do
        if _G.FarmPhaBinh then
            pcall(function()
                if not plr or not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") or not plr.Character:FindFirstChild("Humanoid") or plr.Character.Humanoid.Health <= 0 then
                    return
                end

                for i, phaBinhPoint in ipairs(phaBinhPoints) do
                    if not _G.FarmPhaBinh then
                        break
                    end
                    _tp(phaBinhPoint)
                    local flag7 = false
                    local now = tick()

                    while tick() - now < 12 and _G.FarmPhaBinh do
                        local character3 = plr.Character
                        local humanoidRootPart2 = character3 and plr.Character:FindFirstChild("HumanoidRootPart")
                        if not humanoidRootPart2 then
                            break
                        end

                        if (humanoidRootPart2.Position - phaBinhPoint.Position).Magnitude <= 3 then
                            flag7 = true
                            break
                        end
                        task.wait(0.1)
                    end

                    if _G.FarmPhaBinh and flag7 then
                        equipAndUseSkill("Melee")
                        equipAndUseSkill("Sword")
                        equipAndUseSkill("Gun")
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    processEnemy = function(arg, arg2)
        if arg:FindFirstChild("Humanoid") and arg:FindFirstChild("HumanoidRootPart") and arg.Humanoid.Health > 0 and arg.Name == arg2 then
            repeat
                task.wait()
                Attack.Kill(arg, getgenv().AutoMaterial)
            until not getgenv().AutoMaterial or not arg.Parent or arg.Humanoid.Health <= 0
        end
    end

    handleEnemySpawns = function()
        local v9, v10, v11 = pairs(game:GetService("Workspace")._WorldOrigin.EnemySpawns:GetChildren())
        local v12 = v11
        local v13 = v9
        local v14 = v10

        while true do
            local v15, v16 = v13(v14, v12)
            if v15 == nil then
                break
            end

            for i, v17 in ipairs(MMon) do
                if string.find(v16.Name, v17) and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v16.Position).Magnitude >= 10 then
                    _tp(v16.CFrame * Pos)
                end
            end

            v12 = v15
        end
    end

    while task.wait() do
        if getgenv().AutoMaterial then
            pcall(function()
                if getgenv().SelectMaterial then
                    MaterialMon(getgenv().SelectMaterial)
                    _tp(MPos)
                end

                local v9, v10, v11 = ipairs(MMon)
                local v12 = v11
                local v13 = v9
                local v14 = v10

                while true do
                    local v15, v16 = v13(v14, v12)
                    if v15 == nil then
                        break
                    end

                    for k, child in pairs(workspace.Enemies:GetChildren()) do
                        processEnemy(child, v16)
                    end

                    v12 = v15
                end

                handleEnemySpawns()
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(Sec) do
        if _G.FarmBoss then
            pcall(function()
                local flag7, text, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, n4
                n4 = 1

                while true do
                    if n4 == 1 then
                        if QuestBeta()[2] == nil then
                            n4 = 3
                        else
                            n4 = 2
                        end
                    elseif n4 == 2 then
                        flag7 = true
                        n4 = 4
                    elseif n4 == 3 then
                        flag7 = false
                        n4 = 4
                    elseif n4 == 4 then
                        if flag7 then
                            n4 = 5
                        else
                            n4 = 8
                        end
                    elseif n4 == 5 then
                        if QuestBeta()[3] == nil then
                            n4 = 7
                        else
                            n4 = 6
                        end
                    elseif n4 == 6 then
                        flag7 = true
                        n4 = 8
                    elseif n4 == 7 then
                        flag7 = false
                        n4 = 8
                    elseif n4 == 8 then
                        text = plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text

                        if _G.AcceptQuestBoss and flag7 then
                            n4 = 16
                        else
                            n4 = 9
                        end
                    elseif n4 == 9 then
                        if workspace.Enemies:FindFirstChild(QuestBeta()[1]) then
                            n4 = 10
                        else
                            n4 = 14
                        end
                    elseif n4 == 10 then
                        v15, v16, v17 = pairs(workspace.Enemies:GetChildren())
                        v18 = v17
                        n4 = 11
                    elseif n4 == 11 then
                        v19, v20 = v15(v16, v18)

                        if v19 == nil then
                            n4 = 31
                        else
                            n4 = 12
                        end
                    elseif n4 == 12 then
                        v18 = v19

                        if Attack.Alive(v20) and v20.Name == QuestBeta()[1] then
                            n4 = 13
                        else
                            n4 = 11
                        end
                    elseif n4 == 13 then
                        task.wait()
                        Attack.Kill(v20, _G.FarmBoss)

                        if _G.FarmBoss and v20.Humanoid.Health > 0 and v20.Parent then
                            n4 = 13
                        else
                            n4 = 11
                        end
                    elseif n4 == 14 then
                        _tp(QuestBeta()[4])

                        if replicated:FindFirstChild(QuestBeta()[1]) then
                            n4 = 15
                        else
                            n4 = 31
                        end
                    elseif n4 == 15 then
                        _tp(replicated:FindFirstChild(QuestBeta()[1]).HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                        n4 = 31
                    elseif n4 == 16 then
                        if string.find(text, QuestBeta()[0]) then
                            n4 = 18
                        else
                            n4 = 17
                        end
                    elseif n4 == 17 then
                        replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
                        n4 = 18
                    elseif n4 == 18 then
                        if plr.PlayerGui.Main.Quest.Visible == false then
                            n4 = 29
                        else
                            n4 = 19
                        end
                    elseif n4 == 19 then
                        if plr.PlayerGui.Main.Quest.Visible == true then
                            n4 = 20
                        else
                            n4 = 31
                        end
                    elseif n4 == 20 then
                        if workspace.Enemies:FindFirstChild(QuestBeta()[1]) then
                            n4 = 21
                        else
                            n4 = 27
                        end
                    elseif n4 == 21 then
                        v9, v10, v11 = pairs(workspace.Enemies:GetChildren())
                        v12 = v11
                        n4 = 22
                    elseif n4 == 22 then
                        v13, v14 = v9(v10, v12)

                        if v13 == nil then
                            n4 = 31
                        else
                            n4 = 23
                        end
                    elseif n4 == 23 then
                        v12 = v13

                        if Attack.Alive(v14) and v14.Name == QuestBeta()[1] then
                            n4 = 24
                        else
                            n4 = 22
                        end
                    elseif n4 == 24 then
                        if string.find(text, QuestBeta()[0]) then
                            n4 = 25
                        else
                            n4 = 26
                        end
                    elseif n4 == 25 then
                        task.wait()
                        Attack.Kill(v14, _G.FarmBoss)

                        if _G.FarmBoss and v14.Humanoid.Health > 0 and v14.Parent and plr.PlayerGui.Main.Quest.Visible ~= false then
                            n4 = 25
                        else
                            n4 = 22
                        end
                    elseif n4 == 26 then
                        replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
                        n4 = 22
                    elseif n4 == 27 then
                        _tp(QuestBeta()[4])

                        if replicated:FindFirstChild(QuestBeta()[1]) then
                            n4 = 28
                        else
                            n4 = 31
                        end
                    elseif n4 == 28 then
                        _tp(replicated:FindFirstChild(QuestBeta()[1]).HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                        n4 = 31
                    elseif n4 == 29 then
                        _tp(QuestBeta()[5])

                        if (Root.Position - QuestBeta()[5].Position).Magnitude <= 5 then
                            n4 = 30
                        else
                            n4 = 31
                        end
                    elseif n4 == 30 then
                        replicated.Remotes.CommF_:InvokeServer("StartQuest", QuestBeta()[3], QuestBeta()[2])
                        n4 = 31
                    elseif n4 == 31 then
                        return
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.3) do
        if _G.AutoFarmAllBoss then
            pcall(function()
                local localPlayer2 = game.Players.LocalPlayer
                if not localPlayer2.Character or not localPlayer2.Character:FindFirstChild("HumanoidRootPart") then
                    return
                end
                local humanoidRootPart2 = localPlayer2.Character.HumanoidRootPart
                local v9 = nil
                local huge = math.huge

                for k, child in pairs(workspace.Enemies:GetChildren()) do
                    if child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 and table.find(BossList, child.Name) then
                        local magnitude = (humanoidRootPart2.Position - child.HumanoidRootPart.Position).Magnitude

                        if magnitude < huge then
                            v9 = child
                            huge = magnitude
                        end
                    end
                end

                if v9 and v9:FindFirstChild("HumanoidRootPart") then
                    local humanoidRootPart3 = v9.HumanoidRootPart
                    local humanoid = v9.Humanoid
                    local n4

                    repeat
                        task.wait(0.1)
                        if not _G.AutoFarmAllBoss then
                            break
                        end
                        n4 = humanoidRootPart3.CFrame * CFrame.new(0, 5, 0)

                        if (humanoidRootPart2.Position - n4.Position).Magnitude > 100 then
                            localPlayer2.Character:PivotTo(n4)
                        else
                            _tp(n4)
                        end

                        if Attack and typeof(Attack.Kill) == "function" then
                            Attack.Kill(v9, true)
                        end
                    until not v9.Parent or humanoid.Health <= 0 or not _G.AutoFarmAllBoss
                end
            end)
        end
    end
end)

RunSer.RenderStepped:Connect(function()
    pcall(function()
        if _G.FarmMastery_Dev or _G.FarmMastery_G or _G.FarmMastery_S then
            for k, child in pairs(plr.PlayerGui.Notifications:GetChildren()) do
                if child.Name == "NotificationTemplate" and string.find(child.Text, "Skill locked!") then
                    child:Destroy()
                end
            end
        end
    end)
end)

local function fn(arg)
    if arg == "Cake" then
        return GetConnectionEnemies(mastery1), CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375)
    end

    if arg == "Bone" then
        return GetConnectionEnemies(mastery2), CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)
    end

    if arg == "Selected Mob" and getgenv().SelectMob then
        local selectMob = getgenv().SelectMob
        local v9 = GetConnectionEnemies({selectMob})
        local cFrame = nil

        if not v9 and IslandData then
            for k, v10 in pairs(IslandData) do
                if v10.Mobs and table.find(v10.Mobs, selectMob) and v10.CFrame then
                    cFrame = v10.CFrame
                    break
                end
            end
        end

        return v9, cFrame
    end

    if World3 then
        return GetConnectionEnemies(mastery1), CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375)
    end

    if not getgenv().SelectMob then
        return nil, nil
    end
    return GetConnectionEnemies({getgenv().SelectMob}), nil
end

task.spawn(function()
    while task.wait(Sec) do
        if _G.FarmMastery_Dev or _G.Auto_Fruit_Mastery then
            pcall(function()
                local selectIslandMastery = getgenv().SelectIslandMastery
                local selectIslandMastery2 = selectIslandMastery or _G.SelectIslandMastery or SelectIsland or "Cake"
                local v9, v10 = fn(selectIslandMastery2)

                if v9 then
                    local maxHealth = v9.Humanoid.MaxHealth
                    local masteryHealthPct = _G.MasteryHealthPct
                    local n4 = masteryHealthPct or 70
                    HealthM = maxHealth * n4 / 100
                    local mas, farmMasteryDev, autoFruitMastery

                    repeat
                        task.wait()
                        MousePos = v9.HumanoidRootPart.Position
                        mas = Attack.Mas
                        farmMasteryDev = _G.FarmMastery_Dev
                        autoFruitMastery = farmMasteryDev or _G.Auto_Fruit_Mastery
                        mas(v9, autoFruitMastery)
                    until not _G.FarmMastery_Dev and not _G.Auto_Fruit_Mastery or v9.Humanoid.Health <= 0 or not v9.Parent
                elseif v10 then
                    _tp(v10)
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(Sec) do
        if _G.FarmMastery_G or _G.Auto_Gun_Mastery then
            pcall(function()
                local selectIslandMastery = getgenv().SelectIslandMastery
                local selectIslandMastery2 = selectIslandMastery or _G.SelectIslandMastery or SelectIsland or "Cake"
                local v9, v10 = fn(selectIslandMastery2)

                if v9 then
                    local maxHealth = v9.Humanoid.MaxHealth
                    local masteryHealthPct = _G.MasteryHealthPct
                    local n4 = masteryHealthPct or 70
                    HealthM = maxHealth * n4 / 100
                    local masgun, farmMasteryG, autoGunMastery, modules, net, reShootGunEvent, tool

                    repeat
                        task.wait()
                        MousePos = v9.HumanoidRootPart.Position
                        masgun = Attack.Masgun
                        farmMasteryG = _G.FarmMastery_G
                        autoGunMastery = farmMasteryG or _G.Auto_Gun_Mastery
                        masgun(v9, autoGunMastery)
                        modules = replicated:FindFirstChild("Modules")
                        net = modules and modules:FindFirstChild("Net")
                        reShootGunEvent = net and net:FindFirstChild("RE/ShootGunEvent")
                        tool = plr.Character:FindFirstChildOfClass("Tool")

                        if tool and tool.ToolTip == "Gun" then
                            if tool.Name == "Skull Guitar" then
                                SoulGuitar = true
                                tool.RemoteEvent:FireServer("TAP", MousePos)
                                vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                                task.wait(0.05)
                                vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1)
                                task.wait(0.05)
                            else
                                SoulGuitar = false

                                if reShootGunEvent then
                                    reShootGunEvent:FireServer(MousePos, {v9.HumanoidRootPart})
                                end

                                vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                                task.wait(0.05)
                                vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1)
                                task.wait(0.05)
                            end
                        end
                    until not _G.FarmMastery_G and not _G.Auto_Gun_Mastery or v9.Humanoid.Health <= 0 or not v9.Parent

                    SoulGuitar = false
                elseif v10 then
                    _tp(v10)
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(Sec) do
        pcall(function()
            if _G.FarmMastery_S or _G.Auto_Mastery_All_Sword then
                local selectIslandMastery = getgenv().SelectIslandMastery
                local selectIslandMastery2 = selectIslandMastery or _G.SelectIslandMastery or SelectIsland or "Cake"
                local v9, v10 = fn(selectIslandMastery2)
                local v11 = next
                local response, v12 = replicated.Remotes.CommF_:InvokeServer("getInventory")

                for k, v13 in v11, response, v12 do
                    if type(v13) == "table" and v13.Type == "Sword" then
                        local name = v13.Name

                        if tonumber(v13.Mastery) >= 1 and tonumber(v13.Mastery) <= 599 then
                            if GetBP(name) then
                                if v9 then
                                    local sword, farmMasteryS, autoMasteryAllSword

                                    repeat
                                        task.wait()
                                        sword = Attack.Sword
                                        farmMasteryS = _G.FarmMastery_S
                                        autoMasteryAllSword = farmMasteryS or _G.Auto_Mastery_All_Sword
                                        sword(v9, autoMasteryAllSword)
                                    until not _G.FarmMastery_S and not _G.Auto_Mastery_All_Sword or not v9.Parent or v9.Humanoid.Health <= 0
                                elseif v10 then
                                    _tp(v10)
                                end
                            else
                                replicated.Remotes.CommF_:InvokeServer("LoadItem", name)
                            end

                            break
                        end

                        if tonumber(v13.Mastery) >= 600 and not GetBP(name) then
                            replicated.Remotes.CommF_:InvokeServer("LoadItem", name)
                        end
                    end
                end
            end
        end)
    end
end)

local MagnetEvent26 = require(game.ReplicatedStorage.EventConfig.MagnetEvent26)

IsMagnetEventActive = function()
    local serverTimeNow = workspace:GetServerTimeNow()
    local value = MagnetEvent26.START_AT._Value
    local value2 = MagnetEvent26.NO_MORE_GAMEPLAY_AT._Value
    local enabled = MagnetEvent26.ENABLED
    local flag7 = enabled and value <= serverTimeNow and serverTimeNow < value2
    return flag7
end

local v9 = _G
local magnetEventSpawnIndex = _G.MagnetEventSpawnIndex
local magnetEventSpawnIndex2 = magnetEventSpawnIndex or 1
v9.MagnetEventSpawnIndex = magnetEventSpawnIndex2

local magnetBlacklistIslands = {
    sky = true,
    skyarea2 = true,
    uppersky = true,
    ["upper sky"] = true,
    ["underwater city"] = true,
    ["fishman island"] = true,
    sewers = true,
    ["sewer gangs"] = true,
}

Core.MAGNET_BLACKLIST_ISLANDS = magnetBlacklistIslands
local tbl12 = {}

MagnetGetPos = function(arg)
    if not arg then
        return
    end

    if arg:IsA("BasePart") then
        return arg.Position
    end

    local ok, result = pcall(function()
        return arg:GetPivot()
    end)

    local position = ok and typeof(result) == "CFrame" and result.Position or nil
    return position
end

MagnetIsland = function(arg)
    local worldOrigin = workspace:FindFirstChild("_WorldOrigin")
    local locations = worldOrigin and workspace._WorldOrigin:FindFirstChild("Locations")
    if not locations then
        return "unknown"
    end
    local name = nil
    local v10 = nil

    for i, child in ipairs(locations:GetChildren()) do
        if child:IsA("BasePart") then
            local magnitude = (child.Position - arg).Magnitude

            if not name or magnitude < v10 then
                name = child.Name
                v10 = magnitude
            end
        end
    end

    local str = name and string.lower(name) or "unknown"
    return str
end

MagnetSkipSpawn = function(arg, arg2)
    local lower = string.lower
    local v10 = tostring
    local str = arg2 or ""
    local v11 = lower(v10(str))
    local lower2 = string.lower
    local v12 = tostring
    local name = arg.Name
    local str2 = name or ""
    local v13 = lower2(v12(str2))
    local lower3 = string.lower
    local v14 = tostring
    local attribute = arg:GetAttribute("DisplayName")
    local str3 = attribute or ""
    local v15 = lower3(v14(str3))
    local str4 = v13 .. " " .. v15
    if magnetBlacklistIslands[v11] or v11:find("fishman", 1, true) or v11:find("underwater", 1, true) or v11:find("sewer", 1, true) or str4:find("boss", 1, true) then
        return true
    end
    local v16 = tbl12[v13]
    local v17 = v16 or tbl12[v15]
    return v17
end

MagnetBuildPoints = function()
    local tbl13 = {}
    local tbl14 = {}
    local worldOrigin = workspace:FindFirstChild("_WorldOrigin")
    local enemySpawns = worldOrigin and worldOrigin:FindFirstChild("EnemySpawns")
    if not enemySpawns then
        return tbl13
    end

    for i, child in ipairs(enemySpawns:GetChildren()) do
        local v10 = MagnetGetPos(child)

        if v10 then
            local v11 = MagnetIsland(v10)
            local v12 = tostring
            local attribute = child:GetAttribute("DisplayName")
            local name = attribute or child.Name or ""
            local v13 = v12(name)

            if v13 ~= "" and not MagnetSkipSpawn(child, v11) then
                local v14 = tbl14[v11]
                local tbl15 = v14 or {}
                tbl14[v11] = tbl15
                local v15 = tbl14[v11]
                local v16 = tbl14[v11][v13]
                local tbl16 = v16 or {}
                v15[v13] = tbl16
                tbl14[v11][v13][#tbl14[v11][v13] + 1] = v10
            end
        end
    end

    local tbl15 = {}

    for k in pairs(tbl14) do
        tbl15[#tbl15 + 1] = k
    end

    table.sort(tbl15)
    local v10, v11, v12 = ipairs(tbl15)
    local v13 = v12
    local v14 = v10
    local v15 = v11

    while true do
        local v16, v17 = v14(v15, v13)
        if v16 == nil then
            break
        end
        local v18 = tbl14[v17]
        local tbl16 = {}
        local v19, v20, v21 = pairs(v18)
        local v22 = v14
        local v23 = v15

        for k in v19, v20, v21 do
            tbl16[#tbl16 + 1] = k
        end

        local v24 = v16
        local v25 = v22
        local v26 = v23
        table.sort(tbl16)
        local position = nil
        local locations = worldOrigin and worldOrigin:FindFirstChild("Locations")

        if locations then
            for i, child in ipairs(locations:GetChildren()) do
                if child:IsA("BasePart") and string.lower(child.Name) == v17 then
                    position = child.Position
                    break
                end
            end

            v24 = v16
            v25 = v22
            v26 = v23
        end

        for i, v27 in ipairs(tbl16) do
            local v28 = v18[v27][1]

            if #tbl16 > 1 then
                tbl13[#tbl13 + 1] = {
                    Island = v17,
                    Name = v27,
                    CFrame = CFrame.new(v28 + Vector3.new(0, 40, 0)),
                }
            else
                local vector = Vector3.new(1, 0, 0)

                if position then
                    local vector2 = Vector3.new(v28.X - position.X, 0, v28.Z - position.Z)

                    if vector2.Magnitude > 0.01 then
                        vector = vector2.Unit
                    end
                end

                tbl13[#tbl13 + 1] = {
                    Island = v17,
                    Name = v27,
                    CFrame = CFrame.new(v28 + vector * 60 + Vector3.new(0, 40, 0)),
                }

                tbl13[#tbl13 + 1] = {
                    Island = v17,
                    Name = v27,
                    CFrame = CFrame.new(v28 - vector * 60 + Vector3.new(0, 40, 0)),
                }
            end
        end

        v13 = v24
        v14 = v25
        v15 = v26
    end

    return tbl13
end

MagnetFindTarget = function()
    local enemies = workspace:FindFirstChild("Enemies")
    if not enemies then
        return
    end
    local character3 = game.Players.LocalPlayer.Character
    local humanoidRootPart2 = character3 and character3:FindFirstChild("HumanoidRootPart")
    local v10 = nil
    local v11 = nil

    for i, child in ipairs(enemies:GetChildren()) do
        if child:IsA("Model") and (child:GetAttribute("MagnetEnemy") == true or string.find(string.lower(child.Name), "magnetized")) and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 and child:FindFirstChild("HumanoidRootPart") then
            local magnitude = humanoidRootPart2 and (child.HumanoidRootPart.Position - humanoidRootPart2.Position).Magnitude or 0

            if not v10 or magnitude < v11 then
                v10 = child
                v11 = magnitude
            end
        end
    end

    return v10
end

SetMagnetStatus = function(arg)
    if _G.SetMagnetStatus then
        pcall(_G.SetMagnetStatus, arg)
    end
end

MagnetTravel = function(arg)
    if not arg or typeof(arg.CFrame) ~= "CFrame" then
        return false
    end
    local localPlayer2 = game.Players.LocalPlayer
    local character3 = localPlayer2.Character
    local humanoidRootPart2 = character3 and character3:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart2 then
        return false
    end
    SetMagnetStatus("Patrolling - " .. tostring(arg.Island))

    pcall(function()
        _tp(arg.CFrame)
    end)

    local now = tick()

    while _G.AutoMagnetToken do
        local v10 = MagnetFindTarget()
        if v10 then
            return v10
        end
        local character4 = localPlayer2.Character
        local humanoidRootPart3 = character4 and character4:FindFirstChild("HumanoidRootPart")
        local v11 = humanoidRootPart3
        if not humanoidRootPart3 then
            return false
        end

        if (arg.CFrame.Position - v11.Position).Magnitude <= 15 or tick() - now > 10 then
            break
        end
        task.wait(0.1)
    end

    if not _G.AutoMagnetToken then
        return false
    end
    SetMagnetStatus("Searching - " .. tostring(arg.Island))
    local now2 = tick()

    while _G.AutoMagnetToken and tick() - now2 < 1 do
        local v10 = MagnetFindTarget()
        if v10 then
            return v10
        end
        task.wait(0.05)
    end

    local v10 = MagnetFindTarget()
    local flag7 = v10 or false
    return flag7
end

task.spawn(function()
    local tbl13, magnetEventSpawnIndex3, flag7, v10, magnetEventSpawnIndex4, n4, v11, v12, v13, n5, n6, n7
    n7 = 1

    while true do
        if n7 == 1 then
            tbl13 = {}
            magnetEventSpawnIndex3 = 1
            flag7 = true
            n7 = 2
        elseif n7 == 2 then
            if task.wait() then
                n7 = 3
            else
                n7 = 25
            end
        elseif n7 == 3 then
            if _G.AutoMagnetToken then
                n7 = 4
            else
                n7 = 24
            end
        elseif n7 == 4 then
            if not flag7 and #tbl13 ~= 0 then
                n7 = 12
            else
                n7 = 5
            end
        elseif n7 == 5 then
            v10 = MagnetBuildPoints()
            tbl13 = v10

            if #v10 == 0 then
                n7 = 11
            else
                n7 = 6
            end
        elseif n7 == 6 then
            magnetEventSpawnIndex4 = _G.MagnetEventSpawnIndex
            n4 = magnetEventSpawnIndex4

            if magnetEventSpawnIndex4 then
                n7 = 8
            else
                n7 = 7
            end
        elseif n7 == 7 then
            n4 = 1
            n7 = 8
        elseif n7 == 8 then
            magnetEventSpawnIndex3 = n4

            if #v10 < magnetEventSpawnIndex3 then
                n7 = 9
            else
                n7 = 10
            end
        elseif n7 == 9 then
            magnetEventSpawnIndex3 = 1
            n7 = 10
        elseif n7 == 10 then
            flag7 = false
            _G.MagnetEventSpawnRoute = v10
            n7 = 12
        elseif n7 == 11 then
            task.wait(5)
            n7 = 2
        elseif n7 == 12 then
            v11 = tbl13[magnetEventSpawnIndex3]
            v12 = v11

            if v11 then
                n7 = 14
            else
                n7 = 13
            end
        elseif n7 == 13 then
            magnetEventSpawnIndex3 = 1
            v12 = tbl13[1]
            n7 = 14
        elseif n7 == 14 then
            v13 = MagnetTravel(v12)

            if v13 then
                n7 = 15
            else
                n7 = 21
            end
        elseif n7 == 15 then
            SetMagnetStatus("Farming - " .. tostring(v13.Name))
            n7 = 16
        elseif n7 == 16 then
            task.wait(0.1)

            if v13.Parent and v13:FindFirstChild("HumanoidRootPart") then
                n7 = 17
            else
                n7 = 18
            end
        elseif n7 == 17 then
            _tp(v13.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
            Attack.Kill(v13, _G.AutoMagnetToken)

            if _G.AutoMagnetToken and v13 and v13.Humanoid.Health > 0 and v13.Parent then
                n7 = 16
            else
                n7 = 18
            end
        elseif n7 == 18 then
            n5 = magnetEventSpawnIndex3 + 1
            magnetEventSpawnIndex3 = n5

            if #tbl13 < n5 then
                n7 = 19
            else
                n7 = 20
            end
        elseif n7 == 19 then
            magnetEventSpawnIndex3 = 1
            n7 = 20
        elseif n7 == 20 then
            _G.MagnetEventSpawnIndex = magnetEventSpawnIndex3
            n7 = 2
        elseif n7 == 21 then
            n6 = magnetEventSpawnIndex3 + 1
            magnetEventSpawnIndex3 = n6

            if #tbl13 < n6 then
                n7 = 22
            else
                n7 = 23
            end
        elseif n7 == 22 then
            magnetEventSpawnIndex3 = 1
            n7 = 23
        elseif n7 == 23 then
            _G.MagnetEventSpawnIndex = magnetEventSpawnIndex3
            task.wait(0.2)
            n7 = 2
        elseif n7 == 24 then
            SetMagnetStatus("Idle")
            _G.MagnetEventSpawnIndex = magnetEventSpawnIndex3
            task.wait(1)
            n7 = 2
        elseif n7 == 25 then
            return
        end
    end
end)

Spawn(function()
    while Wait(1) do
        if _G.AutoHopServer then
            pcall(function()
                if not _G.HopTimer then
                    _G.HopTimer = tick()
                end

                local n4 = tick() - _G.HopTimer
                local hopDelay = _G.HopDelay
                local n5 = hopDelay or 1800

                if n5 <= n4 then
                    _G.HopTimer = tick()

                    if syn and syn.queue_on_teleport then
                        syn.queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/bloxfruitsnokey/Redz/refs/heads/main/Chest'))()")
                    end

                    game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
                end
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if Boud then
                local tbl13 = {"HasBuso", "Buso"}

                if not plr.Character:FindFirstChild(tbl13[1]) then
                    replicated.Remotes.CommF_:InvokeServer(tbl13[2])
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        if getgenv().Observation then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true)
            end)
        end
    end
end)

spawn(function()
    while wait(0.2) do
        pcall(function()
            if _G.RaceClickAutov3 then
                repeat
                    replicated.Remotes.CommE:FireServer("ActivateAbility")
                    wait(30)
                until not _G.RaceClickAutov3
            end
        end)
    end
end)

spawn(function()
    while wait(0.2) do
        pcall(function()
            if _G.RaceClickAutov4 and plr.Character:FindFirstChild("RaceEnergy") and plr.Character:FindFirstChild("RaceEnergy").Value == 1 then
                Useskills("nil", "Y")
            end
        end)
    end
end)

spawn(function()
    while task.wait(Sec) do
        pcall(function()
            if _G.Safemode then
                if plr.Character.Humanoid.Health / plr.Character.Humanoid.MaxHealth * 100 < Num_self then
                    shouldTween = true
                    _tp(Root.CFrame * CFrame.new(0, 500, 0))
                else
                    shouldTween = false
                end
            end
        end)
    end
end)

local tbl13 = {"SlashHit", "CurvedRing", "SwordSlash", "SlashTail"}

task.spawn(function()
    while task.wait(Sec) do
        if _G.DestroyHit then
            pcall(function()
                for k, child in pairs(workspace._WorldOrigin:GetChildren()) do
                    if table.find(tbl13, child.Name) then
                        child:Destroy()
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if RDeath then
                if replicated.Effect.Container:FindFirstChild("Death") then
                    replicated.Effect.Container.Death:Destroy()
                end

                if replicated.Effect.Container:FindFirstChild("Respawn") then
                    replicated.Effect.Container.Respawn:Destroy()
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if RemoveDamage then
                replicated.Assets.GUI.DamageCounter.Enabled = false
                plr.PlayerGui.Notifications.Enabled = false
            else
                replicated.Assets.GUI.DamageCounter.Enabled = true
                plr.PlayerGui.Notifications.Enabled = true
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if getgenv().HopServerAdmin then
                for k, player in pairs(game.Players:GetPlayers()) do
                    if table.find({
                        "red_game43",
                        "rip_indra",
                        "Axiore",
                        "Polkster",
                        "wenlocktoad",
                        "Daigrock",
                        "toilamvidamme",
                        "oofficialnoobie",
                        "Uzoth",
                        "Azarth",
                        "arlthmetic",
                        "Death_King",
                        "Lunoven",
                        "TheGreateAced",
                        "rip_fud",
                        "drip_mama",
                        "layandikit12",
                        "Hingoi",
                    }, player.Name) then
                        Hop()
                    end
                end
            end
        end)
    end
end)

spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if getgenv().NoClip then
                for k, descendant in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if descendant:IsA("BasePart") or descendant:IsA("Part") then
                        descendant.CanCollide = false
                    end
                end
            end
        end)
    end)
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Melee then
                statsSetings("Melee", pSats)
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Sword then
                statsSetings("Sword", pSats)
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Gun then
                statsSetings("Gun", pSats)
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_DevilFruit then
                statsSetings("Devil", pSats)
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Defense then
                statsSetings("Defense", pSats)
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(2) do
        if _G.AutoBuyBait and _G.SelectedBait then
            pcall(function()
                replicated.Modules.Net["RF/Craft"]:InvokeServer("Craft", _G.SelectedBait, {})
            end)
        end
    end
end)

local fishReplicated = replicated:WaitForChild("FishReplicated", 10)
local fishingRequest = fishReplicated and fishReplicated:WaitForChild("FishingRequest", 10)
local Config = fishReplicated and require(fishReplicated.FishingClient.Config)
local GetWaterHeightAtLocation = require(replicated.Util.GetWaterHeightAtLocation)
local maxLaunchDistance = Config and Config.Rod and Config.Rod.MaxLaunchDistance or 100

local tbl14 = {
    bite = false,
    biteAt = 0,
    casting = false,
    castAt = 0,
    blockedSince = nil,
}

task.spawn(function()
    if not fishReplicated then
        return
    end

    local ok, result = pcall(function()
        return fishReplicated:WaitForChild("FishingRemote", 15)
    end)

    if ok and result then
        result.OnClientEvent:Connect(function(arg, arg2)
            if arg ~= plr then
                return
            end

            if arg2 == "SpawnFishOnBob" then
                tbl14.bite = true
                tbl14.biteAt = tick()
            elseif arg2 == "ResetBiting" then
                tbl14.bite = false
            elseif arg2 == "ReeledIn" then
                tbl14.bite = false
                tbl14.casting = false
            end
        end)
    end
end)

FindCastTarget = function(arg, arg2, arg3)
    local tbl15 = {arg, workspace.Characters, workspace.Enemies}
    local v10 = GetWaterHeightAtLocation(arg2.Position)
    local attribute = arg3:GetAttribute("MaxLaunchDistance")
    local v11 = attribute or maxLaunchDistance
    local n4 = v11 * 0.9975124378109452
    local v12

    for i, v13 in ipairs({
        0,
        45,
        -45,
        90,
        -90,
        135,
        -135,
        180,
    }) do
        local n5 = CFrame.Angles(0, math.rad(v13), 0) * arg2.CFrame.LookVector
        local v14
        v12, v14 = workspace:FindPartOnRayWithIgnoreList(Ray.new(arg.Head.Position, n5 * n4), tbl15)
        local v15, v16 = workspace:FindPartOnRayWithIgnoreList(Ray.new(v14 + Vector3.new(0, 3, 0), Vector3.new(0, -500, 0)), tbl15)

        if v15 or v16.Y < v10 then
            local vector = Vector3.new(v14.X, math.max(v16.Y, v10), v14.Z)
            local flag7 = v15 and game:GetService("CollectionService"):HasTag(v15, Config.WATER_BODY_TAG) or vector.Y <= v10
            if not flag7 then
                continue
            end
            arg2.CFrame = CFrame.new(arg2.Position, arg2.Position + Vector3.new(n5.X, 0, n5.Z))
            return vector
        end

        continue
    end

    local v13
    v12, v13 = workspace:FindPartOnRayWithIgnoreList(Ray.new(arg.Head.Position, arg2.CFrame.LookVector * n4), tbl15)
    return Vector3.new(v13.X, math.max(v13.Y, v10), v13.Z)
end

task.spawn(function()
    while task.wait(0.4) do
        if _G.AutoFishing then
            pcall(function()
                local character3 = plr.Character
                local humanoidRootPart2 = character3 and character3:FindFirstChild("HumanoidRootPart")
                local humanoid = character3 and character3:FindFirstChildOfClass("Humanoid")
                if not humanoidRootPart2 or not humanoid or humanoid.Health <= 0 then
                    return
                end
                local tool = character3:FindFirstChildOfClass("Tool")
                local selectedRod = _G.SelectedRod
                local flag7 = tool and selectedRod and tool.Name ~= selectedRod and plr.Backpack:FindFirstChild(selectedRod)

                if tool and tool:FindFirstChild("FishingRodData") and not flag7 then
                    if not tbl14.bite and (not tbl14.casting or tool:GetAttribute("ServerState") ~= "Biting") then
                        if not tbl14.casting then
                            local attribute = tool:GetAttribute("State")
                            local attribute2 = tool:GetAttribute("ServerState")
                            local flag8 = attribute ~= nil and attribute ~= "ReeledIn" or attribute2 ~= nil and attribute2 ~= "ReeledIn"

                            if flag8 then
                                local blockedSince = tbl14.blockedSince
                                local now = blockedSince or tick()
                                tbl14.blockedSince = now
                                if tick() - tbl14.blockedSince < 15 then
                                    return
                                end
                            else
                                tbl14.blockedSince = nil
                            end

                            local attribute3 = plr.Data.FishingData:GetAttribute("SelectedBait")
                            if attribute3 == nil or attribute3 == "None" then
                                return
                            end
                            local v10 = FindCastTarget(character3, humanoidRootPart2, tool)
                            if not v10 then
                                return
                            end
                            fishingRequest:InvokeServer("StartCasting")
                            task.wait(0.2)
                            local response, v11 = fishingRequest:InvokeServer("CastLineAtLocation", v10, 100, true)

                            if response and not v11 then
                                tbl14.casting = true
                                tbl14.castAt = tick()
                                tbl14.blockedSince = nil
                            end

                            return
                        end

                        if tick() - tbl14.castAt > 25 then
                            pcall(function()
                                fishingRequest:InvokeServer("ReeledIn")
                            end)

                            tbl14.casting = false
                        end

                        return
                    end

                    tbl14.bite = false
                    fishingRequest:InvokeServer("Catching", true)
                    local wait_ = task.wait
                    local fishCatchDelay = _G.FishCatchDelay
                    local n4 = fishCatchDelay or math.random(35, 55) / 10
                    wait_(n4)
                    fishingRequest:InvokeServer("Catch", 1, 0, math.random(80, 95) / 100)
                    tbl14.casting = false
                    task.wait(1)
                    return
                end

                local v10 = selectedRod and plr.Backpack:FindFirstChild(selectedRod)

                if not v10 then
                    for i, child in ipairs(plr.Backpack:GetChildren()) do
                        if child:IsA("Tool") and child:FindFirstChild("FishingRodData") then
                            v10 = child
                            break
                        end
                    end
                end

                if v10 then
                    tbl14.casting = false
                    humanoid:EquipTool(v10)
                    task.wait(0.6)
                end
            end)
        else
            tbl14.casting = false
            tbl14.bite = false
        end
    end
end)

HasQuest3 = function()
    local quest = plr.PlayerGui:FindFirstChild("Quest")
    local questGui = quest or plr.PlayerGui:FindFirstChild("QuestGui")
    if questGui and questGui:FindFirstChild("Container") and questGui.Container:FindFirstChild("QuestTitle") then
        return true
    end
    return false
end

task.spawn(function()
    while task.wait(1) do
        if _G.AutoFishingQuest then
            pcall(function()
                if not HasQuest3() then
                    replicated.Modules.Net["RF/JobsRemoteFunction"]:InvokeServer("FishingNPC", "Angler", "AskQuest")
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(5) do
        if _G.AutoQuestComplete then
            pcall(function()
                replicated.Modules.Net["RF/JobsRemoteFunction"]:InvokeServer("FishingNPC", "FinishQuest")
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(5) do
        if _G.AutoSellFish then
            pcall(function()
                replicated.Modules.Net["RF/JobsRemoteFunction"]:InvokeServer("FishingNPC", "SellFish")
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        if _G.AutoSkillZ then
            pcall(function()
                replicated.Modules.Net["RF/JobToolAbilities"]:InvokeServer("Z", true)
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.TravelDres and plr.Data.Level.Value >= 700 then
                if workspace.Map.Ice.Door.CanCollide == true and workspace.Map.Ice.Door.Transparency == 0 then
                    replicated.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
                    EquipWeapon("Key")

                    repeat
                        wait()
                        _tp(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                    until not _G.TravelDres or Root.Position == CFrame.new(1347.7124, 37.3751602, -1325.6488).Position
                elseif workspace.Map.Ice.Door.CanCollide == false and workspace.Map.Ice.Door.Transparency == 1 then
                    if Enemies:FindFirstChild("Ice Admiral") then
                        for k, child in pairs(Enemies:GetChildren()) do
                            if child.Name == "Ice Admiral" and Attack.Alive(child) then
                                repeat
                                    task.wait()
                                    Attack.Kill(child, _G.TravelDres)
                                until _G.TravelDres == false or child.Humanoid.Health <= 0

                                replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
                            end
                        end
                    else
                        _tp(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                    end
                else
                    replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.AutoZou and plr.Data.Level.Value >= 1500 then
                if replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 3 then
                    if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
                        if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
                            TabelDevilFruitStore = {}
                            TabelDevilFruitOpen = {}
                            local v10, v11, v12 = pairs(replicated.Remotes.CommF_:InvokeServer("getInventoryFruits"))
                            local v13 = v12
                            local v14 = v10
                            local v15 = v11

                            while true do
                                local v16, v17 = v14(v15, v13)
                                if v16 == nil then
                                    break
                                end

                                for k, v18 in pairs(v17) do
                                    if k == "Name" then
                                        table.insert(TabelDevilFruitStore, v18)
                                    end
                                end

                                v13 = v16
                            end

                            local v16 = next
                            local response, v17 = game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits")

                            for k, v18 in v16, response, v17 do
                                if v18.Price >= 1000000 then
                                    table.insert(TabelDevilFruitOpen, v18.Name)
                                end
                            end

                            local v18, v19, v20 = pairs(TabelDevilFruitOpen)
                            local v21 = v20
                            local v22 = v18
                            local v23 = v19

                            while true do
                                local v24, v25 = v22(v23, v21)
                                if v24 == nil then
                                    break
                                end

                                for k, v26 in pairs(TabelDevilFruitStore) do
                                    if v25 == v26 and replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
                                        if plr.Backpack:FindFirstChild(v26) then
                                            replicated.Remotes.CommF_:InvokeServer("F_", "TalkTrevor", "1")
                                            replicated.Remotes.CommF_:InvokeServer("F_", "TalkTrevor", "2")
                                            replicated.Remotes.CommF_:InvokeServer("F_", "TalkTrevor", "3")
                                        else
                                            replicated.Remotes.CommF_:InvokeServer("F_", "LoadFruit", v26)
                                        end
                                    end
                                end

                                v21 = v24
                            end

                            replicated.Remotes.CommF_:InvokeServer("F_", "TalkTrevor", "1")
                            replicated.Remotes.CommF_:InvokeServer("F_", "TalkTrevor", "2")
                            replicated.Remotes.CommF_:InvokeServer("F_", "TalkTrevor", "3")
                        end
                    else
                        replicated.Remotes.CommF_:InvokeServer("F_", "TravelZou")

                        if replicated.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 0 then
                            local ripIndra = GetConnectionEnemies("rip_indra")

                            if ripIndra then
                                repeat
                                    wait()
                                    Attack.Kill(ripIndra, _G.AutoZou)
                                until not _G.AutoZou or not ripIndra.Parent or ripIndra.Humanoid.Health <= 0

                                Check = 2

                                repeat
                                    wait()
                                    replicated.Remotes.CommF_:InvokeServer("F_", "TravelZou")
                                until Check == 1
                            else
                                replicated.Remotes.CommF_:InvokeServer("F_", "ZQuestProgress", "Check")
                                wait(0.1)
                                replicated.Remotes.CommF_:InvokeServer("F_", "ZQuestProgress", "Begin")
                            end
                        elseif replicated.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 1 then
                            replicated.Remotes.CommF_:InvokeServer("F_", "TravelZou")
                        else
                            local v10 = GetConnectionEnemies("Don Swan")

                            if v10 then
                                repeat
                                    wait()
                                    Attack.Kill(v10, _G.AutoZou)
                                until not _G.AutoZou or not v10.Parent or v10.Humanoid.Health <= 0
                            else
                                repeat
                                    wait()
                                    _tp(CFrame.new(2288.802, 15.1870775, 863.034607))
                                until not _G.AutoZou or Root.Position == CFrame.new(2288.802, 15.1870775, 863.034607).Position

                                if Root.CFrame == CFrame.new(2288.802, 15.1870775, 863.034607) then
                                    notween(CFrame.new(2288.802, 15.1870775, 863.034607))
                                end
                            end
                        end
                    end
                elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 0 then
                    if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and plr.PlayerGui.Main.Quest.Visible == true then
                        local v10 = GetConnectionEnemies("Swan Pirate")

                        if v10 then
                            pcall(function()
                                repeat
                                    wait()
                                    Attack.Kill(v10, _G.AutoZou)
                                until not v10.Parent or v10.Humanoid.Health <= 0 or _G.AutoZou == false or plr.PlayerGui.Main.Quest.Visible == false
                            end)
                        else
                            _tp(CFrame.new(1057.92761, 137.614319, 1242.08069))
                        end
                    else
                        _tp(CFrame.new(-456.28952, 73.0200958, 299.895966))
                    end
                elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 1 then
                    local Jeremy = GetConnectionEnemies("Jeremy")

                    if Jeremy then
                        repeat
                            wait()
                            Attack.Kill(Jeremy, _G.AutoZou)
                        until not Jeremy.Parent or Jeremy.Humanoid.Health <= 0 or _G.AutoZou == false
                    else
                        _tp(CFrame.new(2099.88159, 448.931, 648.997375))
                    end
                elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 2 then
                    repeat
                        wait()
                        _tp(CFrame.new(-1836, 11, 1714))
                    until not _G.AutoZou or Root.Position == CFrame.new(-1836, 11, 1714).Position

                    if Root.CFrame == CFrame.new(-1836, 11, 1714) then
                        notween(CFrame.new(-1836, 11, 1714))
                    end

                    notween(CFrame.new(-1850.49329, 13.1789551, 1750.89685))
                    wait(0.1)
                    notween(CFrame.new(-1858.87305, 19.3777466, 1712.01807))
                    wait(0.1)
                    notween(CFrame.new(-1803.94324, 16.5789185, 1750.89685))
                    wait(0.1)
                    notween(CFrame.new(-1858.55835, 16.8604317, 1724.79541))
                    wait(0.1)
                    notween(CFrame.new(-1869.54224, 15.987854, 1681.00659))
                    wait(0.1)
                    notween(CFrame.new(-1800.0979, 16.4978027, 1684.52368))
                    wait(0.1)
                    notween(CFrame.new(-1819.26343, 14.795166, 1717.90625))
                    wait(0.1)
                    notween(CFrame.new(-1813.51843, 14.8604736, 1724.79541))
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Tushita then
                if workspace.Map.Turtle:FindFirstChild("TushitaGate") then
                    if GetBP("Holy Torch") then
                        EquipWeapon("Holy Torch")
                        task.wait(1)

                        repeat
                            task.wait()
                            _tp(CFrame.new(-10752, 417, -9366))
                        until not _G.Auto_Tushita or (CFrame.new(-10752, 417, -9366).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10

                        wait(0.7)

                        repeat
                            task.wait()
                            _tp(CFrame.new(-11672, 334, -9474))
                        until not _G.Auto_Tushita or (CFrame.new(-11672, 334, -9474).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10

                        wait(0.7)

                        repeat
                            task.wait()
                            _tp(CFrame.new(-12132, 521, -10655))
                        until not _G.Auto_Tushita or (CFrame.new(-12132, 521, -10655).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10

                        wait(0.7)

                        repeat
                            task.wait()
                            _tp(CFrame.new(-13336, 486, -6985))
                        until not _G.Auto_Tushita or (CFrame.new(-13336, 486, -6985).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10

                        wait(0.7)

                        repeat
                            task.wait()
                            _tp(CFrame.new(-13489, 332, -7925))
                        until not _G.Auto_Tushita or (CFrame.new(-13489, 332, -7925).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
                    else
                        _tp(CFrame.new(5148.03613, 162.352493, 910.548218))
                        wait(0.7)
                    end
                else
                    local Longma = GetConnectionEnemies("Longma")

                    if Longma then
                        repeat
                            task.wait()
                            Attack.Kill(Longma, _G.Auto_Tushita)
                        until Longma.Humanoid.Health <= 0 or not _G.Auto_Tushita or not Longma.Parent
                    elseif replicated:FindFirstChild("Longma") then
                        _tp(replicated:FindFirstChild("Longma").HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Yama then
                if replicated.Remotes.CommF_:InvokeServer("EliteHunter", "Progress") < 30 then
                    _G.FarmEliteHunt = true
                elseif replicated.Remotes.CommF_:InvokeServer("EliteHunter", "Progress") > 30 then
                    _G.FarmEliteHunt = false

                    if (workspace.Map.Waterfall.SealedKatana.Handle.Position - plr.Character.HumanoidRootPart.Position).Magnitude >= 20 then
                        _tp(workspace.Map.Waterfall.SealedKatana.Handle.CFrame)
                        local Ghost = GetConnectionEnemies("Ghost")

                        if Ghost then
                            repeat
                                wait()
                                Attack.Kill(Ghost, _G.Auto_Yama)
                            until Ghost.Humanoid.Health <= 0 or not Ghost.Parent or not _G.Auto_Yama

                            fireclickdetector(workspace.Map.Waterfall.SealedKatana.Handle.ClickDetector)
                        end
                    end
                end
            end
        end)
    end
end)

task.spawn(function()
    while wait() do
        if _G.Auto_Soul_Guitar then
            pcall(function()
                local v10 = GetConnectionEnemies("Living Zombie")

                if v10 then
                    v10.HumanoidRootPart.CFrame = CFrame.new(-10138.3974609375, 138.6524658203125, 5902.89208984375)
                    v10.Head.CanCollide = false
                    v10.Humanoid.Sit = false
                    v10.HumanoidRootPart.CanCollide = false
                    v10.Humanoid.JumpPower = 0
                    v10.Humanoid.WalkSpeed = 0

                    if v10.Humanoid:FindFirstChild("Animator") then
                        v10.Humanoid:FindFirstChild("Animator"):Destroy()
                    end
                end
            end)
        end
    end
end)

getT = function(arg)
    local rotation = nil

    if arg == 1 then
        rotation = workspace.Map["Haunted Castle"].Tablet.Segment1.Line.Rotation
    elseif arg == 3 then
        rotation = workspace.Map["Haunted Castle"].Tablet.Segment3.Line.Rotation
    elseif arg == 4 then
        rotation = workspace.Map["Haunted Castle"].Tablet.Segment4.Line.Rotation
    elseif arg == 7 then
        rotation = workspace.Map["Haunted Castle"].Tablet.Segment7.Line.Rotation
    elseif arg == 10 then
        rotation = workspace.Map["Haunted Castle"].Tablet.Segment10.Line.Rotation
    end

    if not rotation then
        return
    end
    return rotation.Z
end

getRT = function(arg)
    local rotation = nil

    for k, child in pairs(workspace.Map["Haunted Castle"].Trophies.Quest:GetChildren()) do
        if arg == 1 and child.Name == "Trophy1" and child:FindFirstChild("Handle") then
            rotation = child.Handle.Rotation
        elseif arg == 2 and child.Name == "Trophy2" and child:FindFirstChild("Handle") then
            rotation = child.Handle.Rotation
        elseif arg == 3 and child.Name == "Trophy3" and child:FindFirstChild("Handle") then
            rotation = child.Handle.Rotation
        elseif arg == 4 and child.Name == "Trophy4" and child:FindFirstChild("Handle") then
            rotation = child.Handle.Rotation
        elseif arg == 5 and child.Name == "Trophy5" and child:FindFirstChild("Handle") then
            rotation = child.Handle.Rotation
        end

        if rotation then
            return rotation.Z
        end
    end
end

GetFirePlacard = function(arg, arg2)
    if tostring(workspace.Map["Haunted Castle"]["Placard" .. arg][arg2].Indicator.BrickColor) ~= "Pearl" then
        fireclickdetector(workspace.Map["Haunted Castle"]["Placard" .. arg][arg2].ClickDetector)
    end
end

spawn(function()
    repeat
        task.wait()
    until _G.Auto_Soul_Guitar

    while wait(Sec) do
        pcall(function()
            if _G.Auto_Soul_Guitar and World3 then
                replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2)
                replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)

                if replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check") == nil then
                    _tp(CFrame.new(-8655.0166015625, 141.3166961669922, 6160.0224609375))
                    replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2)
                    replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
                elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check").Swamp == false then
                    Quest1 = true
                    Quest2 = false
                    Quest3 = false
                    Quest4 = false
                    local v10 = GetConnectionEnemies("Living Zombie")

                    if v10 then
                        repeat
                            task.wait()
                            Attack.Kill(v10, _G.Auto_Soul_Guitar)
                        until not _G.Auto_Soul_Guitar or v10.Humanoid.Health <= 0 or not v10.Parent or workspace.Map["Haunted Castle"].SwampWater.Color ~= Color3.fromRGB(117, 0, 0)
                    else
                        _tp(CFrame.new(-10170.7275390625, 138.6524658203125, 5934.26513671875))
                    end
                elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check").Gravestones == false then
                    Quest1 = false
                    Quest2 = true
                    Quest3 = false
                    Quest4 = false
                    GetFirePlacard("7", "Left")
                    GetFirePlacard("6", "Left")
                    GetFirePlacard("5", "Left")
                    GetFirePlacard("4", "Right")
                    GetFirePlacard("3", "Left")
                    GetFirePlacard("2", "Right")
                    GetFirePlacard("1", "Right")
                elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check").Ghost == false then
                    replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost")
                    replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost", true)
                elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check").Trophies == false then
                    Quest1 = false
                    Quest2 = false
                    Quest3 = true
                    Quest4 = false
                    _tp(CFrame.new(-9532.8232421875, 6.471667766571045, 6078.068359375))
                    local v10, v11

                    repeat
                        wait()
                        v10 = getRT(1)
                        v11 = getT(1)

                        if v10 and v11 then
                            fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment1:FindFirstChild("ClickDetector"))
                        end
                    until v10 == v11

                    local v12, v13

                    repeat
                        wait()
                        v12 = getRT(2)
                        v13 = getT(3)

                        if v12 and v13 then
                            fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment3:FindFirstChild("ClickDetector"))
                        end
                    until v12 == v13

                    local v14, v15

                    repeat
                        wait()
                        v14 = getRT(3)
                        v15 = getT(4)

                        if v14 and v15 then
                            fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment4:FindFirstChild("ClickDetector"))
                        end
                    until v14 == v15

                    local v16, v17

                    repeat
                        wait()
                        v16 = getRT(4)
                        v17 = getT(7)

                        if v16 and v17 then
                            fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment7:FindFirstChild("ClickDetector"))
                        end
                    until v16 == v17

                    local v18, v19

                    repeat
                        wait()
                        v18 = getRT(5)
                        v19 = getT(10)

                        if v18 and v19 then
                            fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment10:FindFirstChild("ClickDetector"))
                        end
                    until v18 == v19

                    repeat
                        wait()
                        fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment2:FindFirstChild("ClickDetector"))
                        fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment5:FindFirstChild("ClickDetector"))
                        fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment6:FindFirstChild("ClickDetector"))
                        fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment8:FindFirstChild("ClickDetector"))
                        fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment9:FindFirstChild("ClickDetector"))
                    until workspace.Map["Haunted Castle"].Tablet.Segment2.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment5.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment6.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment8.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment9.Line.Rotation.Z == 0
                elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check").Pipes == false then
                    Quest1 = false
                    Quest2 = false
                    Quest3 = false
                    Quest4 = true
                    _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame)
                    fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector)
                    _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame)
                    fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                    fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                    fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                    _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame)
                    fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                    fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                    _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame)
                    fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector)
                    _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame)
                    fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                    fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                    fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.AutoMatSoul and GetWP("Skull Guitar") == false then
                if GetM("Bones") >= 500 and GetM("Ectoplasm") >= 250 and GetM("Dark Fragment") >= 1 then
                    replicated.Remotes.CommF_:InvokeServer("soulGuitarBuy", true)
                elseif GetM("Ectoplasm") <= 250 then
                    if _G.AutoMatSoul and World2 then
                        local v10 = GetConnectionEnemies({
                            "Ship Deckhand",
                            "Ship Engineer",
                            "Ship Steward",
                            "Ship Officer",
                            "Arctic Warrior",
                        })

                        if v10 then
                            repeat
                                task.wait()
                                Attack.Kill(v10, _G.AutoMatSoul)
                            until not _G.AutoMatSoul or not v10.Parent or v10.Humanoid.Health <= 0
                        else
                            replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                        end
                    else
                        replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
                    end
                elseif GetM("Dark Fragment") < 1 then
                    if _G.AutoMatSoul and World2 then
                        local Darkbeard = GetConnectionEnemies("Darkbeard")

                        if Darkbeard then
                            repeat
                                task.wait()
                                Attack.Kill(Darkbeard, _G.AutoMatSoul)
                            until not _G.AutoMatSoul or Darkbeard.Humanoid.Health <= 0 or not Darkbeard.Parent
                        else
                            _tp(CFrame.new(3798.4575195313, 13.826690673828, -3399.806640625))
                        end
                    else
                        replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
                    end

                    if not GetConnectionEnemies("Darkbeard") then
                        Hop()
                    end
                elseif GetM("Bones") <= 500 then
                    if _G.AutoMatSoul and World3 then
                        local v10 = GetConnectionEnemies({
                            "Reborn Skeleton",
                            "Living Zombie",
                            "Demonic Soul",
                            "Posessed Mummy",
                        })

                        if v10 then
                            repeat
                                task.wait()
                                Attack.Kill(v10, _G.AutoMatSoul)
                            until not _G.AutoMatSoul or v10.Humanoid.Health <= 0 or not v10.Parent or v10.Humanoid.Health <= 0
                        else
                            _tp(CFrame.new(-9504.8564453125, 172.14292907714844, 6057.259765625))
                        end
                    else
                        replicated.Remotes.CommF_:InvokeServer("TravelZou")
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.CDK then
                local now = tick()
                local lastCDKBossKick = getgenv().LastCDKBossKick
                local n4 = lastCDKBossKick or 0

                if now - n4 > 3 then
                    getgenv().LastCDKBossKick = tick()
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Boss")
                end

                local v10 = GetConnectionEnemies("Cursed Skeleton Boss")

                if v10 then
                    repeat
                        wait()

                        if not plr.Character:FindFirstChild("Yama") and not plr.Backpack:FindFirstChild("Yama") then
                            if plr.Character:FindFirstChild("Tushita") or plr.Backpack:FindFirstChild("Tushita") then
                                EquipWeapon("Tushita")
                            end
                        else
                            EquipWeapon("Yama")
                        end

                        _tp(v10.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                    until not _G.CDK or not v10.Parent or v10.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(-12318.193359375, 601.9518432617188, -6538.662109375))
                    wait(0.5)
                    _tp(workspace.Map.Turtle.Cursed.BossDoor.CFrame)
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            local v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29
            local v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49
            local v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, n4
            n4 = 1

            while true do
                if n4 == 1 then
                    if _G.CDK_YM and CDKEnsureDoor() then
                        n4 = 2
                    else
                        n4 = 58
                    end
                elseif n4 == 2 then
                    if CDKProgress().Finished == nil then
                        n4 = 57
                    else
                        n4 = 3
                    end
                elseif n4 == 3 then
                    if CDKProgress().Finished == false then
                        n4 = 4
                    else
                        n4 = 58
                    end
                elseif n4 == 4 then
                    if tonumber(CDKProgress().Evil) == -3 then
                        n4 = 51
                    else
                        n4 = 5
                    end
                elseif n4 == 5 then
                    if tonumber(CDKProgress().Evil) == -4 then
                        n4 = 38
                    else
                        n4 = 6
                    end
                elseif n4 == 6 then
                    if tonumber(CDKProgress().Evil) == -5 then
                        n4 = 7
                    else
                        n4 = 58
                    end
                elseif n4 == 7 then
                    QuestYama_1 = false
                    QuestYama_2 = false
                    QuestYama_3 = true

                    if workspace.Map:FindFirstChild("HellDimension") and (Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 1000 then
                        n4 = 8
                    else
                        n4 = 58
                    end
                elseif n4 == 8 then
                    v10, v11, v12 = pairs(workspace.Map.HellDimension.Exit:GetChildren())
                    v13 = v12
                    n4 = 9
                elseif n4 == 9 then
                    v14 = v10(v11, v13)

                    if v14 == nil then
                        n4 = 12
                    else
                        n4 = 10
                    end
                elseif n4 == 10 then
                    v13 = v14

                    if tonumber(v14) == 2 then
                        n4 = 11
                    else
                        n4 = 9
                    end
                elseif n4 == 11 then
                    task.wait()
                    Root.CFrame = workspace.Map.HellDimension.Exit.CFrame

                    if _G.CDK_YM and tonumber(CDKProgress().Evil) ~= 3 then
                        n4 = 11
                    else
                        n4 = 9
                    end
                elseif n4 == 12 then
                    EquipWeapon(_G.SelectWeapon)

                    if tonumber(CDKProgress().Evil) == 3 then
                        n4 = 34
                    else
                        n4 = 13
                    end
                elseif n4 == 13 then
                    task.wait()
                    n4 = 14
                elseif n4 == 14 then
                    task.wait()
                    _tp(workspace.Map.HellDimension.Torch1.Particles.CFrame)
                    v15, v16, v17 = pairs(workspace.Map.HellDimension:GetDescendants())
                    v18 = v17
                    n4 = 15
                elseif n4 == 15 then
                    v19, v20 = v15(v16, v18)

                    if v19 == nil then
                        n4 = 18
                    else
                        n4 = 16
                    end
                elseif n4 == 16 then
                    v18 = v19

                    if v20:IsA("ProximityPrompt") then
                        n4 = 17
                    else
                        n4 = 15
                    end
                elseif n4 == 17 then
                    fireproximityprompt(v20)
                    n4 = 15
                elseif n4 == 18 then
                    if (workspace.Map.HellDimension.Torch1.Particles.Position - Root.Position).Magnitude < 5 then
                        n4 = 19
                    else
                        n4 = 14
                    end
                elseif n4 == 19 then
                    wait(2)
                    _G.T1Yama = true

                    if _G.CDK_YM and not _G.T1Yama and tonumber(CDKProgress().Evil) ~= 3 then
                        n4 = 13
                    else
                        n4 = 20
                    end
                elseif n4 == 20 then
                    task.wait()
                    n4 = 21
                elseif n4 == 21 then
                    task.wait()
                    _tp(workspace.Map.HellDimension.Torch2.Particles.CFrame)
                    v21, v22, v23 = pairs(workspace.Map.HellDimension:GetDescendants())
                    v24 = v23
                    n4 = 22
                elseif n4 == 22 then
                    v25, v26 = v21(v22, v24)

                    if v25 == nil then
                        n4 = 25
                    else
                        n4 = 23
                    end
                elseif n4 == 23 then
                    v24 = v25

                    if v26:IsA("ProximityPrompt") then
                        n4 = 24
                    else
                        n4 = 22
                    end
                elseif n4 == 24 then
                    fireproximityprompt(v26)
                    n4 = 22
                elseif n4 == 25 then
                    if (workspace.Map.HellDimension.Torch2.Particles.Position - Root.Position).Magnitude < 5 then
                        n4 = 26
                    else
                        n4 = 21
                    end
                elseif n4 == 26 then
                    wait(2)
                    _G.T2Yama = true

                    if not _G.T2Yama and _G.CDK_YM ~= false and tonumber(CDKProgress().Evil) ~= 3 then
                        n4 = 20
                    else
                        n4 = 27
                    end
                elseif n4 == 27 then
                    wait()
                    n4 = 28
                elseif n4 == 28 then
                    task.wait()
                    _tp(workspace.Map.HellDimension.Torch3.Particles.CFrame)
                    v27, v28, v29 = pairs(workspace.Map.HellDimension:GetDescendants())
                    v30 = v29
                    n4 = 29
                elseif n4 == 29 then
                    v31, v32 = v27(v28, v30)

                    if v31 == nil then
                        n4 = 32
                    else
                        n4 = 30
                    end
                elseif n4 == 30 then
                    v30 = v31

                    if v32:IsA("ProximityPrompt") then
                        n4 = 31
                    else
                        n4 = 29
                    end
                elseif n4 == 31 then
                    fireproximityprompt(v32)
                    n4 = 29
                elseif n4 == 32 then
                    if (workspace.Map.HellDimension.Torch3.Particles.Position - Root.Position).Magnitude < 5 then
                        n4 = 33
                    else
                        n4 = 28
                    end
                elseif n4 == 33 then
                    wait(2)
                    _G.T3Yama = true

                    if not _G.T3Yama and _G.CDK_YM ~= false and tonumber(CDKProgress().Evil) ~= 3 then
                        n4 = 27
                    else
                        n4 = 34
                    end
                elseif n4 == 34 then
                    v33, v34, v35 = pairs(workspace.Enemies:GetChildren())
                    v36 = v35
                    n4 = 35
                elseif n4 == 35 then
                    v37, v38 = v33(v34, v36)

                    if v37 == nil then
                        n4 = 58
                    else
                        n4 = 36
                    end
                elseif n4 == 36 then
                    v36 = v37

                    if (v38:FindFirstChild("HumanoidRootPart").Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 300 and v38:FindFirstChild("HumanoidRootPart") and v38:FindFirstChild("Humanoid") and v38:FindFirstChild("Humanoid").Health > 0 then
                        n4 = 37
                    else
                        n4 = 35
                    end
                elseif n4 == 37 then
                    task.wait()
                    Attack.Kill(v38, _G.CDK_YM)

                    if _G.CDK_YM and v38.Humanoid.Health > 0 and v38.Parent and tonumber(CDKProgress().Evil) ~= 3 then
                        n4 = 37
                    else
                        n4 = 35
                    end
                elseif n4 == 38 then
                    QuestYama_1 = false
                    QuestYama_2 = true
                    QuestYama_3 = false
                    v39, v40, v41 = pairs(game:GetService("Players").LocalPlayer.QuestHaze:GetChildren())
                    v42 = v41
                    v43 = v39
                    v44 = v40
                    n4 = 39
                elseif n4 == 39 then
                    v45, v46 = v43(v44, v42)

                    if v45 == nil then
                        n4 = 58
                    else
                        n4 = 40
                    end
                elseif n4 == 40 then
                    v47, v48, v49 = pairs(PosMsList)
                    v50 = v49
                    v51 = v47
                    v52 = v48
                    v53 = v45
                    v54 = v43
                    v55 = v44
                    n4 = 41
                elseif n4 == 41 then
                    v56, v57 = v51(v52, v50)

                    if v56 == nil then
                        n4 = 50
                    else
                        n4 = 42
                    end
                elseif n4 == 42 then
                    v50 = v56

                    if string.find(v56, v46.Name) and v46.Value > 0 then
                        n4 = 43
                    else
                        n4 = 41
                    end
                elseif n4 == 43 then
                    if (v57.Position - Root.Position).Magnitude <= 1000 and workspace.Enemies:FindFirstChild(v56) then
                        n4 = 45
                    else
                        n4 = 44
                    end
                elseif n4 == 44 then
                    _tp(v57)
                    n4 = 41
                elseif n4 == 45 then
                    v58, v59, v60 = pairs(workspace.Enemies:GetChildren())
                    v61 = v51
                    v62 = v52
                    v63 = v53
                    v64 = v54
                    v65 = v55
                    v66 = v60
                    n4 = 46
                elseif n4 == 46 then
                    v67, v68 = v58(v59, v66)

                    if v67 == nil then
                        n4 = 49
                    else
                        n4 = 47
                    end
                elseif n4 == 47 then
                    v66 = v67

                    if v68:FindFirstChild("HumanoidRootPart") and v68:FindFirstChild("Humanoid") and v68:FindFirstChild("Humanoid").Health > 0 and v68:FindFirstChild("HazeESP") then
                        n4 = 48
                    else
                        n4 = 46
                    end
                elseif n4 == 48 then
                    wait()
                    Attack.Kill(v68, _G.CDK_YM)

                    if _G.CDK_YM and tonumber(CDKProgress().Evil) ~= 2 and v68:FindFirstChild("HazeESP") and v68.Humanoid.Health > 0 then
                        n4 = 48
                    else
                        n4 = 46
                    end
                elseif n4 == 49 then
                    v50 = v56
                    v51 = v61
                    v52 = v62
                    v53 = v63
                    v54 = v64
                    v55 = v65
                    n4 = 41
                elseif n4 == 50 then
                    v42 = v53
                    v43 = v54
                    v44 = v55
                    n4 = 39
                elseif n4 == 51 then
                    QuestYama_1 = true
                    QuestYama_2 = false
                    QuestYama_3 = false
                    n4 = 52
                elseif n4 == 52 then
                    task.wait()

                    if workspace.Enemies:FindFirstChild("Forest Pirate") then
                        n4 = 53
                    else
                        n4 = 55
                    end
                elseif n4 == 53 then
                    if GetConnectionEnemies("Forest Pirate") then
                        n4 = 54
                    else
                        n4 = 56
                    end
                elseif n4 == 54 then
                    _tp(workspace.Enemies:FindFirstChild("Forest Pirate").HumanoidRootPart.CFrame)
                    n4 = 56
                elseif n4 == 55 then
                    _tp(CFrame.new(-13223.521484375, 428.1938171386719, -7766.06787109375))
                    n4 = 56
                elseif n4 == 56 then
                    if tonumber(CDKProgress().Evil) ~= 1 and _G.CDK_YM then
                        n4 = 52
                    else
                        n4 = 58
                    end
                elseif n4 == 57 then
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
                    n4 = 58
                elseif n4 == 58 then
                    return
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            local v10, v11, v12, v13, v14, v15, v16, n4
            n4 = 1

            while true do
                if n4 == 1 then
                    if _G.CDK_YM and tonumber(CDKProgress().Evil) == -5 and (not workspace.Map:FindFirstChild("HellDimension") or (Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude > 1000) then
                        n4 = 2
                    else
                        n4 = 17
                    end
                elseif n4 == 2 then
                    v10 = GetConnectionEnemies("Soul Reaper")

                    if v10 then
                        n4 = 3
                    else
                        n4 = 4
                    end
                elseif n4 == 3 then
                    task.wait()
                    _tp(v10.HumanoidRootPart.CFrame)

                    if v10.Humanoid.Health > 0 and _G.CDK_YM and v10.Parent and tonumber(CDKProgress().Evil) ~= 3 and (not workspace.Map:FindFirstChild("HellDimension") or (Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude > 1000) then
                        n4 = 3
                    else
                        n4 = 17
                    end
                elseif n4 == 4 then
                    if not plr.Backpack:FindFirstChild("Hallow Essence") and not plr.Character:FindFirstChild("Hallow Essence") then
                        n4 = 7
                    else
                        n4 = 5
                    end
                elseif n4 == 5 then
                    _tp(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
                    task.wait()

                    if (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - Root.Position).Magnitude <= 8 then
                        n4 = 6
                    else
                        n4 = 5
                    end
                elseif n4 == 6 then
                    EquipWeapon("Hallow Essence")
                    n4 = 17
                elseif n4 == 7 then
                    if replicated:FindFirstChild("Soul Reaper") and replicated:FindFirstChild("Soul Reaper").Humanoid.Health > 0 then
                        n4 = 16
                    else
                        n4 = 8
                    end
                elseif n4 == 8 then
                    if replicated.Remotes.CommF_:InvokeServer("Bones", "Check") < 50 and not workspace.Enemies:FindFirstChild("Soul Reaper") and not replicated:FindFirstChild("Soul Reaper") and not workspace.Map:FindFirstChild("HellDimension") then
                        n4 = 10
                    else
                        n4 = 9
                    end
                elseif n4 == 9 then
                    replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                    n4 = 17
                elseif n4 == 10 then
                    if not workspace.Enemies:FindFirstChild("Reborn Skeleton") and not workspace.Enemies:FindFirstChild("Living Zombie") and not workspace.Enemies:FindFirstChild("Demonic Soul") and not workspace.Enemies:FindFirstChild("Posessed Mummy") then
                        n4 = 15
                    else
                        n4 = 11
                    end
                elseif n4 == 11 then
                    v11, v12, v13 = pairs(workspace.Enemies:GetChildren())
                    v14 = v13
                    n4 = 12
                elseif n4 == 12 then
                    v15, v16 = v11(v12, v14)

                    if v15 == nil then
                        n4 = 17
                    else
                        n4 = 13
                    end
                elseif n4 == 13 then
                    v14 = v15

                    if (v16.Name == "Reborn Skeleton" or v16.Name == "Living Zombie" or v16.Name == "Demonic Soul" or v16.Name == "Posessed Mummy") and v16:FindFirstChild("HumanoidRootPart") and v16:FindFirstChild("Humanoid") and v16:FindFirstChild("Humanoid").Health > 0 then
                        n4 = 14
                    else
                        n4 = 12
                    end
                elseif n4 == 14 then
                    task.wait()
                    Attack.Kill(v16, _G.CDK_YM)

                    if _G.CDK_YM and v16.Humanoid.Health > 0 and v16.Parent then
                        n4 = 14
                    else
                        n4 = 12
                    end
                elseif n4 == 15 then
                    _tp(CFrame.new(-9515.2255859375, 164.0062255859375, 5785.38330078125))
                    n4 = 17
                elseif n4 == 16 then
                    _tp(replicated:FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame)
                    n4 = 17
                elseif n4 == 17 then
                    return
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            local v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29
            local v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, n4
            n4 = 1

            while true do
                if n4 == 1 then
                    if _G.CDK_TS and CDKEnsureDoor() then
                        n4 = 2
                    else
                        n4 = 62
                    end
                elseif n4 == 2 then
                    if CDKProgress().Finished == nil then
                        n4 = 61
                    else
                        n4 = 3
                    end
                elseif n4 == 3 then
                    if CDKProgress().Finished == false then
                        n4 = 4
                    else
                        n4 = 62
                    end
                elseif n4 == 4 then
                    if tonumber(CDKProgress().Good) == -3 then
                        n4 = 48
                    else
                        n4 = 5
                    end
                elseif n4 == 5 then
                    if tonumber(CDKProgress().Good) == -4 then
                        n4 = 45
                    else
                        n4 = 6
                    end
                elseif n4 == 6 then
                    if tonumber(CDKProgress().Good) == -5 then
                        n4 = 7
                    else
                        n4 = 62
                    end
                elseif n4 == 7 then
                    QuestTushita_1 = false
                    QuestTushita_2 = false
                    QuestTushita_3 = true

                    if workspace.Enemies:FindFirstChild("Cake Queen") then
                        n4 = 8
                    else
                        n4 = 12
                    end
                elseif n4 == 8 then
                    v10, v11, v12 = pairs(workspace.Enemies:GetChildren())
                    v13 = v12
                    n4 = 9
                elseif n4 == 9 then
                    v14, v15 = v10(v11, v13)

                    if v14 == nil then
                        n4 = 62
                    else
                        n4 = 10
                    end
                elseif n4 == 10 then
                    v13 = v14

                    if v15.Name == "Cake Queen" and v15:FindFirstChild("Humanoid") and v15:FindFirstChild("HumanoidRootPart") and v15.Humanoid.Health > 0 then
                        n4 = 11
                    else
                        n4 = 9
                    end
                elseif n4 == 11 then
                    wait()
                    Attack.Kill(v15, _G.CDK_TS)

                    if _G.CDK_TS and v15.Parent and v15.Humanoid.Health > 0 and tonumber(CDKProgress().Good) ~= 3 then
                        n4 = 11
                    else
                        n4 = 9
                    end
                elseif n4 == 12 then
                    if replicated:FindFirstChild("Cake Queen") and replicated:FindFirstChild("Cake Queen").Humanoid.Health > 0 then
                        n4 = 44
                    else
                        n4 = 13
                    end
                elseif n4 == 13 then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - workspace.Map.HeavenlyDimension.Spawn.Position).Magnitude <= 1000 then
                        n4 = 14
                    else
                        n4 = 62
                    end
                elseif n4 == 14 then
                    v16, v17, v18 = pairs(workspace.Map.HeavenlyDimension.Exit:GetChildren())
                    v19 = v18
                    n4 = 15
                elseif n4 == 15 then
                    v20 = v16(v17, v19)

                    if v20 == nil then
                        n4 = 17
                    else
                        n4 = 16
                    end
                elseif n4 == 16 then
                    v19 = v20
                    Ex = v20
                    n4 = 15
                elseif n4 == 17 then
                    if Ex == 2 then
                        n4 = 18
                    else
                        n4 = 19
                    end
                elseif n4 == 18 then
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.HeavenlyDimension.Exit.CFrame

                    if _G.CDK_TS and tonumber(CDKProgress().Good) ~= 3 then
                        n4 = 18
                    else
                        n4 = 19
                    end
                elseif n4 == 19 then
                    wait()
                    n4 = 20
                elseif n4 == 20 then
                    wait()
                    _tp(CFrame.new(-22529.6171875, 5275.77392578125, 3873.5712890625))
                    v21, v22, v23 = pairs(workspace.Map.HeavenlyDimension:GetDescendants())
                    v24 = v23
                    n4 = 21
                elseif n4 == 21 then
                    v25, v26 = v21(v22, v24)

                    if v25 == nil then
                        n4 = 24
                    else
                        n4 = 22
                    end
                elseif n4 == 22 then
                    v24 = v25

                    if v26:IsA("ProximityPrompt") then
                        n4 = 23
                    else
                        n4 = 21
                    end
                elseif n4 == 23 then
                    fireproximityprompt(v26)
                    n4 = 21
                elseif n4 == 24 then
                    if (CFrame.new(-22529.6171875, 5275.77392578125, 3873.5712890625).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5 then
                        n4 = 25
                    else
                        n4 = 20
                    end
                elseif n4 == 25 then
                    wait(2)
                    _G.DoneT1 = true

                    if _G.CDK_TS and not _G.DoneT1 then
                        n4 = 19
                    else
                        n4 = 26
                    end
                elseif n4 == 26 then
                    wait()
                    n4 = 27
                elseif n4 == 27 then
                    wait()
                    _tp(CFrame.new(-22637.291015625, 5281.365234375, 3749.28857421875))
                    v27, v28, v29 = pairs(workspace.Map.HeavenlyDimension:GetDescendants())
                    v30 = v29
                    n4 = 28
                elseif n4 == 28 then
                    v31, v32 = v27(v28, v30)

                    if v31 == nil then
                        n4 = 31
                    else
                        n4 = 29
                    end
                elseif n4 == 29 then
                    v30 = v31

                    if v32:IsA("ProximityPrompt") then
                        n4 = 30
                    else
                        n4 = 28
                    end
                elseif n4 == 30 then
                    fireproximityprompt(v32)
                    n4 = 28
                elseif n4 == 31 then
                    if (CFrame.new(-22637.291015625, 5281.365234375, 3749.28857421875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5 then
                        n4 = 32
                    else
                        n4 = 27
                    end
                elseif n4 == 32 then
                    wait(2)
                    _G.DoneT2 = true

                    if not _G.DoneT2 and _G.CDK_TS ~= false then
                        n4 = 26
                    else
                        n4 = 33
                    end
                elseif n4 == 33 then
                    wait()
                    n4 = 34
                elseif n4 == 34 then
                    task.wait()
                    _tp(CFrame.new(-22791.14453125, 5277.16552734375, 3764.570068359375))
                    v33, v34, v35 = pairs(workspace.Map.HeavenlyDimension:GetDescendants())
                    v36 = v35
                    n4 = 35
                elseif n4 == 35 then
                    v37, v38 = v33(v34, v36)

                    if v37 == nil then
                        n4 = 38
                    else
                        n4 = 36
                    end
                elseif n4 == 36 then
                    v36 = v37

                    if v38:IsA("ProximityPrompt") then
                        n4 = 37
                    else
                        n4 = 35
                    end
                elseif n4 == 37 then
                    fireproximityprompt(v38)
                    n4 = 35
                elseif n4 == 38 then
                    if (CFrame.new(-22791.14453125, 5277.16552734375, 3764.570068359375).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5 then
                        n4 = 39
                    else
                        n4 = 34
                    end
                elseif n4 == 39 then
                    wait(2)
                    _G.DoneT3 = true

                    if not _G.DoneT3 and _G.CDK_TS ~= false then
                        n4 = 33
                    else
                        n4 = 40
                    end
                elseif n4 == 40 then
                    v39, v40, v41 = pairs(workspace.Enemies:GetChildren())
                    v42 = v41
                    n4 = 41
                elseif n4 == 41 then
                    v43, v44 = v39(v40, v42)

                    if v43 == nil then
                        n4 = 62
                    else
                        n4 = 42
                    end
                elseif n4 == 42 then
                    v42 = v43

                    if (v44:FindFirstChild("HumanoidRootPart").Position - CFrame.new(-22695.7012, 5270.93652, 3814.42847, 0.11794927, 3.32185834e-08, 0.99301964, -8.73070718e-08, 1, -2.30819008e-08, -0.99301964, -8.3975138e-08, 0.11794927).Position).Magnitude <= 300 and v44:FindFirstChild("HumanoidRootPart") and v44:FindFirstChild("Humanoid") and v44:FindFirstChild("Humanoid").Health > 0 then
                        n4 = 43
                    else
                        n4 = 41
                    end
                elseif n4 == 43 then
                    wait()
                    Attack.Kill(v44, _G.CDK_TS)

                    if _G.CDK_TS and v44.Humanoid.Health > 0 and v44.Parent then
                        n4 = 43
                    else
                        n4 = 41
                    end
                elseif n4 == 44 then
                    _tp(replicated:FindFirstChild("Cake Queen").HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                    n4 = 62
                elseif n4 == 45 then
                    QuestTushita_1 = false
                    QuestTushita_2 = true
                    QuestTushita_3 = false
                    n4 = 46
                elseif n4 == 46 then
                    wait()
                    _G.AutoRaidCastle = true

                    if _G.CDK_TS and tonumber(CDKProgress().Good) ~= 2 then
                        n4 = 46
                    else
                        n4 = 47
                    end
                elseif n4 == 47 then
                    _G.AutoRaidCastle = false
                    n4 = 62
                elseif n4 == 48 then
                    QuestTushita_1 = true
                    QuestTushita_2 = false
                    QuestTushita_3 = false
                    n4 = 49
                elseif n4 == 49 then
                    wait()
                    _tp(CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875))

                    if (CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3 and _G.CDK_TS and tonumber(CDKProgress().Good) ~= 1 then
                        n4 = 49
                    else
                        n4 = 50
                    end
                elseif n4 == 50 then
                    if (CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        n4 = 51
                    else
                        n4 = 52
                    end
                elseif n4 == 51 then
                    wait(0.7)
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"), "Check")
                    wait(0.5)
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
                    n4 = 52
                elseif n4 == 52 then
                    wait(1)
                    n4 = 53
                elseif n4 == 53 then
                    wait()
                    _tp(CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125))

                    if (CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3 and _G.CDK_TS and tonumber(CDKProgress().Good) ~= 1 then
                        n4 = 53
                    else
                        n4 = 54
                    end
                elseif n4 == 54 then
                    if (CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        n4 = 55
                    else
                        n4 = 56
                    end
                elseif n4 == 55 then
                    wait(0.7)
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"), "Check")
                    wait(0.5)
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
                    n4 = 56
                elseif n4 == 56 then
                    wait(1)
                    n4 = 57
                elseif n4 == 57 then
                    wait()
                    _tp(CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625))

                    if (CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3 and _G.CDK_TS and tonumber(CDKProgress().Good) ~= 1 then
                        n4 = 57
                    else
                        n4 = 58
                    end
                elseif n4 == 58 then
                    if (CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        n4 = 59
                    else
                        n4 = 60
                    end
                elseif n4 == 59 then
                    wait(0.7)
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"), "Check")
                    wait(0.5)
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
                    n4 = 60
                elseif n4 == 60 then
                    wait(1)
                    n4 = 62
                elseif n4 == 61 then
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
                    n4 = 62
                elseif n4 == 62 then
                    return
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.Tp_LgS then
            pcall(function()
                local character3 = plr.Character
                local humanoidRootPart2 = character3 and plr.Character:FindFirstChild("HumanoidRootPart")
                if not humanoidRootPart2 then
                    return
                end
                local v10 = nil
                local v11 = nil

                local v12, v13, v14 = ipairs({
                    workspace:FindFirstChild("NPCs"),
                    replicated:FindFirstChild("NPCs"),
                })

                local v15 = v14
                local v16 = v12
                local v17 = v13

                while true do
                    local v18, v19 = v16(v17, v15)
                    if v18 == nil then
                        break
                    end
                    v15 = v18

                    if v19 then
                        for i, child in ipairs(v19:GetChildren()) do
                            if string.find(child.Name, "Legendary Sword Dealer", 1, true) then
                                local ok, result = pcall(function()
                                    return child:GetPivot()
                                end)

                                if ok then
                                    local magnitude = (result.Position - humanoidRootPart2.Position).Magnitude

                                    if not v11 or magnitude < v11 then
                                        v10 = result
                                        v11 = magnitude
                                    end
                                end
                            end
                        end

                        v15 = v18
                    end
                end

                if v10 then
                    _tp(v10)
                end
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.AutoPole then
            pcall(function()
                local v10 = GetConnectionEnemies("Thunder God")

                if v10 then
                    repeat
                        task.wait()
                        Attack.Kill(v10, _G.AutoPole)
                    until not _G.AutoPole or not v10.Parent or v10.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188))
                end
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.AutoPoleV2 then
                if not GetBP("Pole (1st Form)") then
                    replicated.Remotes.CommF_:InvokeServer("LoadItem", "Pole (1st Form)")
                end

                if not GetBP("Pole (2nd Form)") then
                    replicated.Remotes.CommF_:InvokeServer("LoadItem", "Pole (2nd Form)")
                end

                if GetBP("Pole (1st Form)") and GetBP("Pole (1st Form)").Level.Value <= 179 then
                    _G.Level = true
                elseif GetBP("Pole (1st Form)") and GetBP("Pole (1st Form)").Level.Value >= 180 then
                    _G.Level = false
                end

                if not GetBP("Rumble Fruit") then
                    return
                end

                if GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("Z") and GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("X") and GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("C") and GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("V") and GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("F") then
                    _G.SelectChip = nil
                    _G.Raiding = false
                    _G.Auto_Awakener = false

                    if plr.Data.Fragments.Value >= 5000 then
                        replicated.Remotes.CommF_:InvokeServer("Thunder God", "Talk")
                        wait(Sec)
                        replicated.Remotes.CommF_:InvokeServer("Thunder God", "Sure")
                    end
                elseif replicated.Remotes.CommF_:InvokeServer("Awakener", "Check") == nil or replicated.Remotes.CommF_:InvokeServer("Awakener", "Check") == 0 then
                    _G.SelectChip = "Rumble"
                    local response = replicated.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)

                    if response then
                        response:Stop()
                    end

                    _G.Raiding = true
                    _G.Auto_Awakener = true
                end
            end
        end)
    end
end)

spawn(function()
    while wait(0.2) do
        pcall(function()
            if _G.AutoSaw then
                local v10 = GetConnectionEnemies("The Saw")

                if v10 then
                    repeat
                        task.wait()
                        Attack.Kill(v10, _G.AutoSaw)
                    until _G.AutoSaw == false or v10.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906))
                end
            end
        end)
    end
end)

spawn(function()
    while wait(0.2) do
        pcall(function()
            local v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, n4
            n4 = 1

            while true do
                if n4 == 1 then
                    if _G.AutoSaber and plr.Data.Level.Value >= 200 and not plr.Backpack:FindFirstChild("Saber") and not plr.Character:FindFirstChild("Saber") then
                        n4 = 2
                    else
                        n4 = 31
                    end
                elseif n4 == 2 then
                    if workspace.Map.Jungle.Final.Part.Transparency == 0 then
                        n4 = 11
                    else
                        n4 = 3
                    end
                elseif n4 == 3 then
                    if not workspace.Enemies:FindFirstChild("Saber Expert") and not replicated:FindFirstChild("Saber Expert") then
                        n4 = 10
                    else
                        n4 = 4
                    end
                elseif n4 == 4 then
                    v10, v11, v12 = pairs(workspace.Enemies:GetChildren())
                    v13 = v12
                    n4 = 5
                elseif n4 == 5 then
                    v14, v15 = v10(v11, v13)

                    if v14 == nil then
                        n4 = 31
                    else
                        n4 = 6
                    end
                elseif n4 == 6 then
                    v13 = v14

                    if v15.Name == "Saber Expert" and Attack.Alive(v15) then
                        n4 = 7
                    else
                        n4 = 5
                    end
                elseif n4 == 7 then
                    task.wait()
                    Attack.Kill(v15, _G.AutoSaber)

                    if v15.Humanoid.Health > 0 and _G.AutoSaber ~= false then
                        n4 = 7
                    else
                        n4 = 8
                    end
                elseif n4 == 8 then
                    if v15.Humanoid.Health <= 0 then
                        n4 = 9
                    else
                        n4 = 5
                    end
                elseif n4 == 9 then
                    replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic")
                    n4 = 5
                elseif n4 == 10 then
                    _tp(CFrame.new(-1401.85046, 29.9773273, 8.81916237, 0.85820812, 8.76083845e-08, 0.513301849, -8.55007443e-08, 1, -2.77243419e-08, -0.513301849, -2.00944328e-08, 0.85820812))
                    n4 = 31
                elseif n4 == 11 then
                    if workspace.Map.Jungle.QuestPlates.Door.Transparency == 0 then
                        n4 = 28
                    else
                        n4 = 12
                    end
                elseif n4 == 12 then
                    if workspace.Map.Desert.Burn.Part.Transparency == 0 then
                        n4 = 25
                    else
                        n4 = 13
                    end
                elseif n4 == 13 then
                    if replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan") == 0 then
                        n4 = 15
                    else
                        n4 = 14
                    end
                elseif n4 == 14 then
                    replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup")
                    wait(0.5)
                    EquipWeapon("Cup")
                    wait(0.5)
                    replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "FillCup", plr.Character.Cup)
                    wait(Sec)
                    replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan")
                    n4 = 31
                elseif n4 == 15 then
                    if replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == nil then
                        n4 = 24
                    else
                        n4 = 16
                    end
                elseif n4 == 16 then
                    if replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 0 then
                        n4 = 19
                    else
                        n4 = 17
                    end
                elseif n4 == 17 then
                    if replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 1 then
                        n4 = 18
                    else
                        n4 = 31
                    end
                elseif n4 == 18 then
                    replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                    EquipWeapon("Relic")
                    _tp(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-09, 0.481375456, 2.53851997e-08, 1, -5.79995607e-08, -0.481375456, 6.30572643e-08, 0.876514494))
                    n4 = 31
                elseif n4 == 19 then
                    if not workspace.Enemies:FindFirstChild("Mob Leader") and not replicated:FindFirstChild("Mob Leader") then
                        n4 = 31
                    else
                        n4 = 20
                    end
                elseif n4 == 20 then
                    _tp(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559))
                    v16, v17, v18 = pairs(workspace.Enemies:GetChildren())
                    v19 = v18
                    n4 = 21
                elseif n4 == 21 then
                    v20, v21 = v16(v17, v19)

                    if v20 == nil then
                        n4 = 31
                    else
                        n4 = 22
                    end
                elseif n4 == 22 then
                    v19 = v20

                    if v21.Name == "Mob Leader" and Attack.Alive(v21) then
                        n4 = 23
                    else
                        n4 = 21
                    end
                elseif n4 == 23 then
                    task.wait()
                    Attack.Kill(v21, _G.AutoSaber)

                    if v21.Humanoid.Health > 0 and _G.AutoSaber ~= false then
                        n4 = 23
                    else
                        n4 = 21
                    end
                elseif n4 == 24 then
                    replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                    n4 = 31
                elseif n4 == 25 then
                    if not plr.Backpack:FindFirstChild("Torch") and not plr.Character:FindFirstChild("Torch") then
                        n4 = 27
                    else
                        n4 = 26
                    end
                elseif n4 == 26 then
                    EquipWeapon("Torch")
                    firetouchinterest(plr.Character.Torch.Handle, workspace.Map.Desert.Burn.Fire, 0)
                    firetouchinterest(plr.Character.Torch.Handle, workspace.Map.Desert.Burn.Fire, 1)
                    _tp(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-09, 0.761243105, -5.70652914e-10, 1, 1.20584542e-09, -0.761243105, 3.47544882e-10, -0.648466587))
                    n4 = 31
                elseif n4 == 27 then
                    _tp(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 3.42372805e-05, -0.258850515, 0.965917408))
                    n4 = 31
                elseif n4 == 28 then
                    if (CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                        n4 = 30
                    else
                        n4 = 29
                    end
                elseif n4 == 29 then
                    _tp(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279))
                    n4 = 31
                elseif n4 == 30 then
                    _tp(plr.Character.HumanoidRootPart.CFrame)
                    wait(0.5)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate1.Button.CFrame
                    wait(0.5)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate2.Button.CFrame
                    wait(0.5)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate3.Button.CFrame
                    wait(0.5)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate4.Button.CFrame
                    wait(0.5)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate5.Button.CFrame
                    wait(0.5)
                    n4 = 31
                elseif n4 == 31 then
                    return
                end
            end
        end)
    end
end)

spawn(function()
    while wait(0.2) do
        if _G.AutoColShad then
            pcall(function()
                local Cyborg = GetConnectionEnemies("Cyborg")

                if Cyborg then
                    repeat
                        task.wait()
                        Attack.Kill(Cyborg, _G.AutoColShad)
                    until _G.AutoColShad == false or not Cyborg.Parent or Cyborg.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813))
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait(Sec) do
        pcall(function()
            local v10, v11, v12, v13, v14, v15, n4
            n4 = 1

            while true do
                if n4 == 1 then
                    if _G.AutoGetUsoap then
                        n4 = 2
                    else
                        n4 = 6
                    end
                elseif n4 == 2 then
                    v10, v11, v12 = pairs(workspace.Characters:GetChildren())
                    v13 = v12
                    n4 = 3
                elseif n4 == 3 then
                    v14, v15 = v10(v11, v13)

                    if v14 == nil then
                        n4 = 6
                    else
                        n4 = 4
                    end
                elseif n4 == 4 then
                    v13 = v14

                    if v15.Name ~= plr.Name and v15.Humanoid.Health > 0 and v15:FindFirstChild("HumanoidRootPart") and v15.Parent and (Root.Position - v15.HumanoidRootPart.Position).Magnitude <= 230 then
                        n4 = 5
                    else
                        n4 = 3
                    end
                elseif n4 == 5 then
                    task.wait()
                    EquipWeapon(_G.SelectWeapon)
                    _tp(v15.HumanoidRootPart.CFrame * CFrame.new(1, 1, 2))

                    if _G.AutoGetUsoap ~= false and v15.Humanoid.Health > 0 and v15.Parent and v15:FindFirstChild("HumanoidRootPart") and v15:FindFirstChild("Humanoid") then
                        n4 = 5
                    else
                        n4 = 3
                    end
                elseif n4 == 6 then
                    return
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.Greybeard then
            pcall(function()
                if GetWP("Bisento") then
                    if GetWP("Bisento") then
                        replicated.Remotes.CommF_:InvokeServer("LoadItem", "Bisento")
                        local Greybeard = GetConnectionEnemies("Greybeard")

                        if Greybeard then
                            repeat
                                wait()
                                Attack.Kill(Greybeard, _G.Greybeard)
                            until _G.Greybeard == false or not Greybeard.Parent or Greybeard.Humanoid.Health <= 0
                        else
                            _tp(CFrame.new(-5023.38330078125, 28.65203285217285, 4332.3818359375))
                        end
                    end
                else
                    replicated.Remotes.CommF_:InvokeServer("BuyItem", "Bisento")
                end
            end)
        end
    end
end)

spawn(function()
    while wait(0.1) do
        if _G.WardenBoss then
            pcall(function()
                local v10 = GetConnectionEnemies("Chief Warden")

                if v10 then
                    repeat
                        wait()
                        Attack.Kill(v10, _G.WardenBoss)
                    until _G.WardenBoss == false or not v10.Parent or v10.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749, 0.00191645394, 0.999998152, -2.80422337e-05, -0.939682961, 0.00181045406, 0.342041939))
                end
            end)
        end
    end
end)

spawn(function()
    while wait(0.1) do
        if _G.MarinesCoat then
            pcall(function()
                local v10 = GetConnectionEnemies("Vice Admiral")

                if v10 then
                    repeat
                        wait()
                        Attack.Kill(v10, _G.MarinesCoat)
                    until _G.MarinesCoat == false or not v10.Parent or v10.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375))
                end
            end)
        end
    end
end)

spawn(function()
    while wait(0.1) do
        if _G.SwanCoat then
            pcall(function()
                local Swan = GetConnectionEnemies("Swan")

                if Swan then
                    repeat
                        wait()
                        Attack.Kill(Swan, _G.SwanCoat)
                    until _G.SwanCoat == false or not Swan.Parent or Swan.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812))
                end
            end)
        end
    end
end)

spawn(function()
    pcall(function()
        local v10, n4
        n4 = 1

        while true do
            if n4 == 1 then
                if wait(0.1) then
                    n4 = 2
                else
                    n4 = 6
                end
            elseif n4 == 2 then
                if _G.IceBossRen then
                    n4 = 3
                else
                    n4 = 1
                end
            elseif n4 == 3 then
                v10 = GetConnectionEnemies("Awakened Ice Admiral")

                if v10 then
                    n4 = 4
                else
                    n4 = 5
                end
            elseif n4 == 4 then
                task.wait()
                Attack.Kill(v10, _G.IceBossRen)

                if _G.IceBossRen ~= false and v10.Parent and v10.Humanoid.Health > 0 then
                    n4 = 4
                else
                    n4 = 1
                end
            elseif n4 == 5 then
                _tp(CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813))
                n4 = 1
            elseif n4 == 6 then
                return
            end
        end
    end)
end)

spawn(function()
    while wait(0.1) do
        pcall(function()
            if _G.KeysRen then
                if not plr.Backpack:FindFirstChild(RenMon[3]) and not plr.Character:FindFirstChild(RenMon[3]) then
                    local v10 = GetConnectionEnemies(RenMon)

                    if v10 then
                        repeat
                            task.wait()
                            Attack.Kill(v10, _G.KeysRen)
                        until plr.Backpack:FindFirstChild(RenMon[3]) or _G.KeysRen == false or not v10.Parent or v10.Humanoid.Health <= 0
                    else
                        _tp(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
                    end
                else
                    EquipWeapon(RenMon[3])
                    wait(0.1)
                    _tp(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
                end
            end
        end)
    end
end)

spawn(function()
    while wait(0.1) do
        pcall(function()
            if _G.AutoTridentW2 then
                local v10 = GetConnectionEnemies("Tide Keeper")

                if v10 then
                    repeat
                        task.wait()
                        Attack.Kill(v10, _G.AutoTridentW2)
                    until _G.AutoTridentW2 == false or not v10.Parent or v10.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188))
                end
            end
        end)
    end
end)

spawn(function()
    while wait(0.1) do
        pcall(function()
            if _G.LongsWord then
                local Diamond = GetConnectionEnemies("Diamond")

                if Diamond then
                    repeat
                        task.wait()
                        Attack.Kill(Diamond, _G.LongsWord)
                    until _G.LongsWord == false or not Diamond.Parent or Diamond.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407))
                end
            end
        end)
    end
end)

spawn(function()
    while wait(0.1) do
        if _G.BlackSpikey then
            pcall(function()
                local Jeremy = GetConnectionEnemies("Jeremy")

                if Jeremy then
                    repeat
                        wait()
                        Attack.Kill(Jeremy, _G.BlackSpikey)
                    until _G.BlackSpikey == false or not Jeremy.Parent or Jeremy.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109))
                end
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.DarkBladev3 and World2 then
                if not GetBP("Dark Blade") then
                    replicated.Remotes.CommF_:InvokeServer("LoadItem", "Dark Blade")
                end

                if GetBP("Fist of Darkness") then
                    if workspace.Enemies:FindFirstChild("Darkbeard") then
                        if GetConnectionEnemies("Darkbeard") and GetBP("Fist of Darkness") >= 1 then
                            repeat
                                wait()
                                _tp(CFrame.new(-5719.36376953125, 48.50590515136719, -782.9759521484375))
                            until not _G.DarkBladev3 or Root.Position == CFrame.new(-5719.36376953125, 48.50590515136719, -782.9759521484375).Position

                            fireclickdetector(workspace.Map.GraveIsland.Mountain.Rocks.Button.ClickDetector)
                        end
                    else
                        _tp(CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531))
                    end
                else
                    _G.AutoFarmChest = true
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.AutoEcBoss then
                if GetM("Ectoplasm") >= 99 then
                    replicated.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 3)
                elseif GetM("Ectoplasm") <= 99 then
                    local v10 = GetConnectionEnemies("Cursed Captain")

                    if v10 then
                        repeat
                            wait()
                            Attack.Kill(v10, _G.AutoEcBoss)
                        until not _G.AutoEcBoss or not v10.Parent or v10.Humanoid.Health <= 0
                    else
                        replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                        wait(0.5)
                        _tp(CFrame.new(916.928589, 181.092773, 33422))
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait(0.1) do
        if _G.Auto_Def_DarkCoat then
            pcall(function()
                if GetBP("Fist of Darkness") and not workspace.Enemies:FindFirstChild("Darkbeard") then
                    _tp(CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531))
                elseif GetConnectionEnemies("Darkbeard") then
                    local Darkbeard = GetConnectionEnemies("Darkbeard")

                    if Darkbeard then
                        repeat
                            wait()
                            Attack.Kill(Darkbeard, _G.Auto_Def_DarkCoat)
                        until _G.Auto_Def_DarkCoat == false or not Darkbeard.Parent or Darkbeard.Humanoid.Health <= 0
                    end
                elseif not GetBP("Fist of Darkness") and not GetConnectionEnemies("Darkbeard") then
                    repeat
                        wait(0.1)
                        _G.AutoFarmChest = true
                    until not _G.Auto_Def_DarkCoat or GetBP("Fist of Darkness") or GetConnectionEnemies("Darkbeard")

                    _G.AutoFarmChest = false
                end
            end)
        end
    end
end)

spawn(function()
    while wait(0.1) do
        if _G.Auto_DonAcces then
            pcall(function()
                if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil and plr.Data.Level.Value >= 1500 then
                    FruitPrice = {}
                    FruitStore = {}
                    local v10 = next
                    local response, v11 = replicated:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits")

                    for k, v12 in v10, response, v11 do
                        if v12.Price >= 1000000 then
                            table.insert(FruitPrice, v12.Name)
                        end
                    end

                    local v12, v13, v14 = pairs(replicated.Remotes.CommF_:InvokeServer("getInventoryFruits"))
                    local v15 = v14
                    local v16 = v12
                    local v17 = v13

                    while true do
                        local v18, v19 = v16(v17, v15)
                        if v18 == nil then
                            break
                        end

                        for k, v20 in pairs(v19) do
                            if k == "Name" then
                                table.insert(FruitStore, v20)
                            end
                        end

                        replicated.Remotes.CommF_:InvokeServer("Cousin", "Buy")
                        local v20, v21, v22 = pairs(FruitPrice)
                        local v23 = v22
                        local v24 = v20
                        local v25 = v21
                        local v26 = v18
                        local v27 = v16
                        local v28 = v17

                        while true do
                            local v29, v30 = v24(v25, v23)
                            if v29 == nil then
                                break
                            end

                            for k, v31 in pairs(FruitStore) do
                                if v30 == v31 and replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
                                    _G.StoreF = false

                                    if plr.Backpack:FindFirstChild(FruitStore) then
                                        replicated.Remotes.CommF_:InvokeServer("TalkTrevor", "1")
                                        replicated.Remotes.CommF_:InvokeServer("TalkTrevor", "2")
                                        replicated.Remotes.CommF_:InvokeServer("TalkTrevor", "3")
                                    else
                                        replicated.Remotes.CommF_:InvokeServer("LoadFruit", tostring(v30))
                                    end
                                end
                            end

                            v23 = v29
                        end

                        v15 = v26
                        v16 = v27
                        v17 = v28

                        if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess ~= nil then
                            _G.StoreF = true
                            _G.Auto_DonAcces = false
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait(0.2) do
        if _G.Auto_SwanGG then
            pcall(function()
                local v10 = GetConnectionEnemies("Don Swan")

                if v10 then
                    repeat
                        wait()
                        Attack.Kill(v10, _G.Auto_SwanGG)
                    until _G.Auto_SwanGG == false or not v10.Parent or v10.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875))
                end
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.AutoBigmom then
            pcall(function()
                local v10 = GetConnectionEnemies("Cake Queen")

                if v10 then
                    repeat
                        task.wait()
                        Attack.Kill(v10, _G.AutoBigmom)
                    until not _G.AutoBigmom or not v10.Parent or v10.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(-709.3132934570312, 381.6005859375, -11011.396484375))
                end
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Cavender then
                local v10 = GetConnectionEnemies("Beautiful Pirate")

                if v10 then
                    repeat
                        wait()
                        Attack.Kill(v10, _G.Auto_Cavender)
                    until not _G.Auto_Cavender or v10.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(5283.609375, 22.56223487854, -110.78285217285))
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.TwinHook then
                local v10 = GetConnectionEnemies("Captain Elephant")

                if v10 then
                    repeat
                        wait()
                        Attack.Kill(v10, _G.TwinHook)
                    until not _G.TwinHook or v10.Humanoid.Health <= 0
                else
                    replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
                    wait(0.2)
                    _tp(CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125))
                end
            end
        end)
    end
end)

spawn(function()
    local v10, n4
    n4 = 1

    while true do
        if n4 == 1 then
            if wait(Sec) then
                n4 = 2
            else
                n4 = 6
            end
        elseif n4 == 2 then
            if _G.AutoSerpentBow then
                n4 = 3
            else
                n4 = 1
            end
        elseif n4 == 3 then
            v10 = GetConnectionEnemies("Hydra Leader")

            if v10 then
                n4 = 4
            else
                n4 = 5
            end
        elseif n4 == 4 then
            wait()
            Attack.Kill(v10, _G.AutoSerpentBow)

            if _G.AutoSerpentBow and v10.Parent and v10.Humanoid.Health > 0 then
                n4 = 4
            else
                n4 = 1
            end
        elseif n4 == 5 then
            _tp(CFrame.new(5821.89794921875, 1019.0950927734375, -73.71923065185547))
            n4 = 1
        elseif n4 == 6 then
            return
        end
    end
end)

spawn(function()
    while wait(0.2) do
        if _G.AutoKilo then
            pcall(function()
                local v10 = GetConnectionEnemies("Kilo Admiral")

                if v10 then
                    repeat
                        task.wait()
                        Attack.Kill(v10, _G.AutoKilo)
                    until not _G.AutoKilo or not v10.Parent or v10.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125))
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.Tp_MasterA then
            pcall(function()
                for k, child in pairs(replicated.NPCs:GetChildren()) do
                    if child.Name == "Barista Cousin" then
                        _tp(child.HumanoidRootPart.CFrame)
                    end
                end
            end)
        end
    end
end)

spawn(function()
    pcall(function()
        local Stone, v10, vector, cframe3, v11, v12, vector2, cframe4, v13, cframe5, n4
        n4 = 1

        while true do
            if n4 == 1 then
                n4 = 2
            elseif n4 == 2 then
                if wait(Sec) then
                    n4 = 3
                else
                    n4 = 36
                end
            elseif n4 == 3 then
                if _G.Auto_Rainbow_Haki then
                    n4 = 4
                else
                    n4 = 2
                end
            elseif n4 == 4 then
                if plr.PlayerGui.Main.Quest.Visible == false then
                    n4 = 29
                else
                    n4 = 5
                end
            elseif n4 == 5 then
                if plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
                    n4 = 26
                else
                    n4 = 6
                end
            elseif n4 == 6 then
                if plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Hydra Leader") then
                    n4 = 22
                else
                    n4 = 7
                end
            elseif n4 == 7 then
                if plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
                    n4 = 19
                else
                    n4 = 8
                end
            elseif n4 == 8 then
                if plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
                    n4 = 13
                else
                    n4 = 9
                end
            elseif n4 == 9 then
                if plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
                    n4 = 10
                else
                    n4 = 2
                end
            elseif n4 == 10 then
                v13 = GetConnectionEnemies("Captain Elephant")

                if v13 then
                    n4 = 11
                else
                    n4 = 12
                end
            elseif n4 == 11 then
                task.wait()
                Attack.Kill(v13, _G.Auto_Rainbow_Haki)

                if _G.Auto_Rainbow_Haki ~= false and v13.Humanoid.Health > 0 and v13.Parent and plr.PlayerGui.Main.Quest.Visible ~= false then
                    n4 = 11
                else
                    n4 = 2
                end
            elseif n4 == 12 then
                replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5314.54638671875, 22.562219619750977, -127.06755065917969))
                n4 = 2
            elseif n4 == 13 then
                v12 = GetConnectionEnemies("Captain Elephant")

                if v12 then
                    n4 = 14
                else
                    n4 = 15
                end
            elseif n4 == 14 then
                task.wait()
                Attack.Kill(v12, _G.Auto_Rainbow_Haki)

                if _G.Auto_Rainbow_Haki ~= false and v12.Humanoid.Health > 0 and v12.Parent and plr.PlayerGui.Main.Quest.Visible ~= false then
                    n4 = 14
                else
                    n4 = 2
                end
            elseif n4 == 15 then
                vector2 = Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375)
                cframe4 = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)

                if plr.Character.HumanoidRootPart.CFrame.Position == vector2 then
                    n4 = 17
                else
                    n4 = 16
                end
            elseif n4 == 16 then
                replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
                n4 = 2
            elseif n4 == 17 then
                if plr.Character.HumanoidRootPart.CFrame.Position == vector2 then
                    n4 = 18
                else
                    n4 = 2
                end
            elseif n4 == 18 then
                _tp(cframe4)
                n4 = 2
            elseif n4 == 19 then
                v11 = GetConnectionEnemies("Kilo Admiral")

                if v11 then
                    n4 = 20
                else
                    n4 = 21
                end
            elseif n4 == 20 then
                task.wait()
                Attack.Kill(v11, _G.Auto_Rainbow_Haki)

                if _G.Auto_Rainbow_Haki ~= false and v11.Humanoid.Health > 0 and v11.Parent and plr.PlayerGui.Main.Quest.Visible ~= false then
                    n4 = 20
                else
                    n4 = 2
                end
            elseif n4 == 21 then
                _tp(CFrame.new(2877.61743, 423.558685, -7207.31006, -0.989591599, -0.0, -0.143904909, -0.0, 1.00000012, -0.0, 0.143904924, 0, -0.989591479))
                n4 = 2
            elseif n4 == 22 then
                v10 = GetConnectionEnemies("Hydra Leader")

                if v10 then
                    n4 = 23
                else
                    n4 = 24
                end
            elseif n4 == 23 then
                task.wait()
                Attack.Kill(v10, _G.Auto_Rainbow_Haki)

                if _G.Auto_Rainbow_Haki ~= false and v10.Humanoid.Health > 0 and v10.Parent and plr.PlayerGui.Main.Quest.Visible ~= false then
                    n4 = 23
                else
                    n4 = 2
                end
            elseif n4 == 24 then
                replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5643.45263671875, 1013.0858154296875, -340.51025390625))
                vector = Vector3.new(5643.45263671875, 1013.0858154296875, -340.51025390625)
                cframe3 = CFrame.new(5821.89794921875, 1019.0950927734375, -73.71923065185547)

                if plr.Character.HumanoidRootPart.CFrame.Position == vector then
                    n4 = 25
                else
                    n4 = 2
                end
            elseif n4 == 25 then
                _tp(cframe3)
                n4 = 2
            elseif n4 == 26 then
                Stone = GetConnectionEnemies("Stone")

                if Stone then
                    n4 = 27
                else
                    n4 = 28
                end
            elseif n4 == 27 then
                wait()
                Attack.Kill(Stone, _G.Auto_Rainbow_Haki)

                if _G.Auto_Rainbow_Haki ~= false and Stone.Humanoid.Health > 0 and Stone.Parent and plr.PlayerGui.Main.Quest.Visible ~= false then
                    n4 = 27
                else
                    n4 = 2
                end
            elseif n4 == 28 then
                _tp(CFrame.new(-1086.11621, 38.8425903, 6768.71436, 0.0231462717, -0.592676699, 0.805107772, 2.03251839e-05, 0.805323839, 0.592835128, -0.999732077, -0.0137055516, 0.0186523199))
                n4 = 2
            elseif n4 == 29 then
                if _G.GetQFast then
                    n4 = 30
                else
                    n4 = 32
                end
            elseif n4 == 30 then
                if plr.PlayerGui.Main.Quest.Visible == false then
                    n4 = 31
                else
                    n4 = 2
                end
            elseif n4 == 31 then
                replicated.Remotes.CommF_:InvokeServer("HornedMan", "Bet")
                n4 = 2
            elseif n4 == 32 then
                cframe5 = CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875)
                Rainbow1 = cframe5

                if plr.Character.HumanoidRootPart.CFrame == Rainbow1 then
                    n4 = 34
                else
                    n4 = 33
                end
            elseif n4 == 33 then
                _tp(Rainbow1)
                n4 = 2
            elseif n4 == 34 then
                if plr.Character.HumanoidRootPart.CFrame == Rainbow1 then
                    n4 = 35
                else
                    n4 = 2
                end
            elseif n4 == 35 then
                wait(1)
                replicated.Remotes.CommF_:InvokeServer("HornedMan", "Bet")
                n4 = 2
            elseif n4 == 36 then
                return
            end
        end
    end)
end)

spawn(function()
    while wait(0.2) do
        pcall(function()
            if _G.obsFarm then
                replicated.Remotes.CommE:FireServer("Ken", true)

                if plr:GetAttribute("KenDodgesLeft") == 0 then
                    KenTest = false
                elseif plr:GetAttribute("KenDodgesLeft") > 0 then
                    replicated.Remotes.CommE:FireServer("Ken", true)
                    KenTest = true
                end
            end
        end)
    end
end)

spawn(function()
    while wait(0.2) do
        pcall(function()
            if _G.obsFarm then
                if World1 then
                    if workspace.Enemies:FindFirstChild("Galley Captain") then
                        if KenTest then
                            repeat
                                wait()
                                plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(3, 0, 0)
                            until _G.obsFarm == false or KenTest == false
                        else
                            repeat
                                wait()
                                plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)
                            until _G.obsFarm == false or KenTest
                        end
                    else
                        _tp(CFrame.new(5533.29785, 88.1079102, 4852.3916))
                    end
                elseif World2 then
                    if workspace.Enemies:FindFirstChild("Lava Pirate") then
                        if KenTest then
                            repeat
                                wait()
                                plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(3, 0, 0)
                            until _G.obsFarm == false or KenTest == false
                        else
                            repeat
                                wait()
                                plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)
                            until _G.obsFarm == false or KenTest
                        end
                    else
                        _tp(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
                    end
                elseif World3 then
                    if workspace.Enemies:FindFirstChild("Venomous Assailant") then
                        if KenTest then
                            repeat
                                wait()
                                _tp(workspace.Enemies:FindFirstChild("Venomous Assailant").HumanoidRootPart.CFrame * CFrame.new(3, 0, 0))
                            until _G.obsFarm == false or KenTest == false
                        else
                            repeat
                                wait()
                                _tp(workspace.Enemies:FindFirstChild("Venomous Assailant").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                            until _G.obsFarm == false or KenTest
                        end
                    else
                        _tp(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789))
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.AutoKenVTWO then
            pcall(function()
                local cframe3 = CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)
                local cframe4 = CFrame.new(-10920.125, 624.20275878906, -10266.995117188)
                local cframe5 = CFrame.new(-13277.568359375, 370.34185791016, -7821.1572265625)
                local cframe6 = CFrame.new(-13493.12890625, 318.89553833008, -8373.7919921875)

                if plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Defeat 50 Forest Pirates") then
                    local v10 = GetConnectionEnemies("Forest Pirate")

                    if v10 then
                        repeat
                            wait()
                            Attack.Kill(v10, _G.AutoKenVTWO)
                        until not _G.AutoKenVTWO or v10.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
                    else
                        _tp(cframe5)
                    end
                elseif plr.PlayerGui.Main.Quest.Visible == true then
                    local v10 = GetConnectionEnemies("Captain Elephant")

                    if v10 then
                        repeat
                            wait()
                            Attack.Kill(v10, _G.AutoKenVTWO)
                        until not _G.AutoKenVTWO or v10.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
                    else
                        _tp(cframe6)
                    end
                elseif plr.PlayerGui.Main.Quest.Visible == false then
                    replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
                    wait(0.1)
                    replicated.Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1)
                end

                if replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 2 then
                    _tp(CFrame.new(-12513.51953125, 340.1137390136719, -9873.048828125))
                end

                if not plr.Backpack:FindFirstChild("Fruit Bowl") or not plr.Character:FindFirstChild("Fruit Bowl") then
                    if not GetBP("Fruit Bowl") then
                        if GetBP("Apple") then
                            if GetBP("Banana") then
                                if not GetBP("Pineapple") then
                                    _tp(CFrame.new(-712.8272705078125, 98.5770492553711, 5711.9541015625))

                                    for k, descendant in pairs(workspace:GetDescendants()) do
                                        if descendant.Name == "Pineapple" then
                                            descendant.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10)
                                            wait()
                                            firetouchinterest(plr.Character.HumanoidRootPart, descendant.Handle, 0)
                                            wait()
                                        end
                                    end
                                end
                            else
                                _tp(CFrame.new(2286.0078125, 73.13391876220703, -7159.80908203125))

                                for k, descendant in pairs(workspace:GetDescendants()) do
                                    if descendant.Name == "Banana" then
                                        descendant.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10)
                                        wait()
                                        firetouchinterest(plr.Character.HumanoidRootPart, descendant.Handle, 0)
                                        wait()
                                    end
                                end
                            end
                        else
                            replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))

                            for k, descendant in pairs(workspace:GetDescendants()) do
                                if descendant.Name == "Apple" then
                                    descendant.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10)
                                    wait()
                                    firetouchinterest(plr.Character.HumanoidRootPart, descendant.Handle, 0)
                                    wait()
                                end
                            end
                        end
                    end

                    if plr.Backpack:FindFirstChild("Banana") and plr.Backpack:FindFirstChild("Apple") and plr.Backpack:FindFirstChild("Pineapple") or plr:FindFirstChild("Banana") and plr:FindFirstChild("Apple") and plr:FindFirstChild("Pineapple") then
                        repeat
                            wait()
                            _tp(cframe3)
                        until _G.AutoKenVTWO or plr.Character.HumanoidRootPart.CFrame == cframe3

                        replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
                    end

                    if plr.Backpack:FindFirstChild("Fruit Bowl") or plr.Character:FindFirstChild("Fruit Bowl") then
                        if plr.Character.HumanoidRootPart.CFrame == cframe4 then
                            if plr.Character.HumanoidRootPart.CFrame == cframe4 then
                                replicated.Remotes.CommF_:InvokeServer("KenTalk2", "Start")
                                wait(0.1)
                                replicated.Remotes.CommF_:InvokeServer("KenTalk2", "Buy")
                            end
                        else
                            _tp(cframe4)
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait(0.1) do
        pcall(function()
            if _G.Bartilo_Quest and Lv >= 850 then
                local quest = plr.PlayerGui.Main.Quest

                if replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 0 then
                    _G.Level = false

                    if quest.Visible == true then
                        if GetConnectionEnemies("Swan Pirate") then
                            local v10 = GetConnectionEnemies(BartMon)

                            if v10 then
                                repeat
                                    task.wait()

                                    if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirate") then
                                        Attack.Kill(v10, _G.Bartilo_Quest)
                                    else
                                        replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
                                    end
                                until _G.Bartilo_Quest == false or not v10.Parent or v10.Humanoid.Health <= 0 or quest.Visible == false or not v10:FindFirstChild("HumanoidRootPart")
                            end
                        else
                            _tp(CFrame.new(970.369446, 142.653198, 1217.3667, 0.162079468, -4.85452638e-08, -0.986777723, 1.03357589e-08, 1, -4.74980872e-08, 0.986777723, -2.50063148e-09, 0.162079468))
                        end
                    else
                        repeat
                            wait()
                            _tp(CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, -0.0, -0.998706102, 0, 1, -0.0, 0.998706102, 0, 0.050853312))
                        until (CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, -0.0, -0.998706102, 0, 1, -0.0, 0.998706102, 0, 0.050853312).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 20 or _G.Bartilo_Quest == false

                        if (CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, -0.0, -0.998706102, 0, 1, -0.0, 0.998706102, 0, 0.050853312).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 1 then
                            replicated.Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest", 1)
                        end
                    end
                elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 1 then
                    _G.Level = false
                    local Jeremy = GetConnectionEnemies("Jeremy")

                    if Jeremy then
                        repeat
                            task.wait()
                            Attack.Kill(Jeremy, _G.Bartilo_Quest)
                        until _G.Bartilo_Quest == false or not Jeremy.Parent or Jeremy.Humanoid.Health <= 0 or quest.Visible == false or not Jeremy:FindFirstChild("HumanoidRootPart")
                    else
                        _tp(CFrame.new(2158.97412, 449.056244, 705.411682, -0.754199564, -4.17389057e-09, -0.656645238, -4.47752875e-08, 1, 4.50709301e-08, 0.656645238, 6.3393955e-08, -0.754199564))
                    end
                elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 2 then
                    repeat
                        wait()
                        _tp(CFrame.new(-1830.83972, 10.5578213, 1680.60229, 0.979988456, -2.02152783e-08, -0.199054286, 2.20792113e-08, 1, 7.1442483e-09, 0.199054286, -1.13962431e-08, 0.979988456))
                    until (CFrame.new(-1830.83972, 10.5578213, 1680.60229, 0.979988456, -2.02152783e-08, -0.199054286, 2.20792113e-08, 1, 7.1442483e-09, 0.199054286, -1.13962431e-08, 0.979988456).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 1 or _G.Bartilo_Quest == false

                    wait(0.5)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate1.CFrame
                    wait(0.5)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate2.CFrame
                    wait(0.5)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate3.CFrame
                    wait(0.5)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate4.CFrame
                    wait(0.5)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate5.CFrame
                    wait(0.5)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate6.CFrame
                    wait(0.5)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate7.CFrame
                    wait(0.5)
                    plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate8.CFrame
                    wait(2.5)
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.CitizenQuest then
                if Lv >= 1800 and replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits == false then
                    if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and plr.PlayerGui.Main.Quest.Visible == true then
                        local v10 = GetConnectionEnemies("Forest Pirate")

                        if v10 then
                            repeat
                                task.wait()
                                Attack.Kill(v10, _G.CitizenQuest)
                            until _G.CitizenQuest == false or not v10.Parent or v10.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
                        else
                            _tp(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
                        end
                    else
                        _tp(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))

                        if (Vector3.new(-12443.8671875, 332.40396118164, -7675.4892578125) - plr.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                            wait(1.5)
                            replicated.Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1)
                        end
                    end
                elseif Lv >= 1800 and replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss == false then
                    local v10 = GetConnectionEnemies("Captain Elephant")

                    if plr.PlayerGui.Main.Quest.Visible and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and plr.PlayerGui.Main.Quest.Visible == true then
                        if v10 then
                            repeat
                                task.wait()
                                Attack.Kill(v10, _G.CitizenQuest)
                            until _G.CitizenQuest == false or v10.Humanoid.Health <= 0 or not v10.Parent or plr.PlayerGui.Main.Quest.Visible == false
                        else
                            _tp(CFrame.new(-13374.889648438, 421.27752685547, -8225.208984375))
                        end
                    else
                        _tp(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))

                        if (CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                            wait(1.5)
                            replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
                        end
                    end
                elseif Lv >= 1800 and replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 2 then
                    _tp(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125))
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.DummyMan then
            pcall(function()
                if plr.PlayerGui.Main.Quest.Visible == false then
                    replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack({"ArenaTrainer"}))
                else
                    local v10 = GetConnectionEnemies("Training Dummy")

                    if v10 then
                        repeat
                            wait()
                            Attack.Kill(v10, _G.DummyMan)
                        until not _G.DummyMan or not v10.Parent or v10.Humanoid.Health <= 0
                    else
                        _tp(CFrame.new(3688.005126953125, 12.746943473815918, 170.20953369140625))
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_SuperHuman then
                local value = plr.Data.Beli.Value
                local value2 = plr.Data.Fragments.Value

                if plr:FindFirstChild("WeaponAssetCache") and not GetBP("Superhuman") then
                    if GetBP("Black Leg") then
                        if GetBP("Black Leg") and GetBP("Black Leg").Level.Value < 299 then
                            _G.Level = true
                        elseif GetBP("Black Leg") and GetBP("Black Leg").Level.Value >= 300 then
                            _G.Level = false
                        end
                    elseif value >= 150000 then
                        replicated.Remotes.CommF_:InvokeServer("BuyBlackLeg")
                    end

                    if GetBP("Electro") then
                        if GetBP("Electro") and GetBP("Electro").Level.Value < 299 then
                            _G.Level = true
                        elseif GetBP("Electro") and GetBP("Electro").Level.Value >= 300 then
                            _G.Level = false
                        end
                    elseif value >= 500000 then
                        replicated.Remotes.CommF_:InvokeServer("BuyElectro")
                    end

                    if GetBP("Fishman Karate") then
                        if GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value < 299 then
                            _G.Level = true
                        elseif GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value >= 300 then
                            _G.Level = false
                        end
                    elseif value >= 750000 then
                        replicated.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                    end

                    if GetBP("Dragon Claw") then
                        if GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value < 299 then
                            _G.Level = true
                        elseif GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value >= 300 then
                            _G.Level = false
                        end
                    elseif value2 >= 1500 then
                        replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
                    end

                    replicated.Remotes.CommF_:InvokeServer("BuySuperhuman")
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.AutoDeathStep then
            pcall(function()
                if plr:FindFirstChild("WeaponAssetCache") and not GetBP("Death Step") then
                    if not GetBP("Black Leg") then
                        replicated.Remotes.CommF_:InvokeServer("BuyBlackLeg")
                    end

                    if GetBP("Black Leg") and GetBP("Black Leg").Level.Value >= 400 then
                        replicated.Remotes.CommF_:InvokeServer("BuyDeathStep")
                        _G.Level = false
                    elseif GetBP("Black Leg") and GetBP("Black Leg").Level.Value < 399 then
                        _G.Level = true
                    end

                    if (GetBP("Black Leg") or GetBP("Black Leg").Level.Value >= 400) and workspace.Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.Transparency == 0 then
                        if GetBP("Library Key") then
                            repeat
                                wait()
                                _tp(CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375))
                            until not _G.AutoDeathStep or Root.Position == CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375).Position

                            if Root.CFrame == CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375) then
                                replicated.Remotes.CommF_:InvokeServer("BuyDeathStep")
                            end
                        elseif not GetBP("Library Key") then
                            local v10 = GetConnectionEnemies("Awakened Ice Admiral")

                            if v10 then
                                repeat
                                    wait()
                                    Attack.Kill(v10, _G.AutoDeathStep)
                                until not v10.Parent or v10.Humanoid.Health <= 0 or _G.AutoDeathStep == false or GetBP("Library Key") or GetBP("Death Step")
                            else
                                _tp(CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813))
                            end
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.Auto_SharkMan_Karate then
            pcall(function()
                if plr:FindFirstChild("WeaponAssetCache") and not GetBP("Sharkman Karate") then
                    if not GetBP("Fishman Karate") then
                        replicated.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                    end

                    if GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value >= 400 then
                        replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                        _G.Level = false
                    elseif GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value < 399 then
                        _G.Level = true
                    end

                    if GetBP("Fishman Karate") or GetBP("Fishman Karate").Level.Value >= 400 then
                        if GetBP("Water Key") then
                            if string.find(replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys") and GetBP("Water Key") then
                                repeat
                                    wait()
                                    _tp(CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365))
                                until not _G.Auto_SharkMan_Karate or Root.Position == CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365).Position

                                replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                            end
                        elseif not GetBP("Water Key") then
                            local v10 = GetConnectionEnemies("Tide Keeper")

                            if v10 then
                                repeat
                                    wait()
                                    Attack.Kill(v10, _G.Auto_SharkMan_Karate)
                                until not v10.Parent or v10.Humanoid.Health <= 0 or _G.Auto_SharkMan_Karate == false or GetBP("Water Key") or GetBP("Sharkman Karate")
                            else
                                _tp(CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625))
                            end
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.Auto_Electric_Claw then
            pcall(function()
                if plr:FindFirstChild("WeaponAssetCache") then
                    if not GetBP("Electro") then
                        replicated.Remotes.CommF_:InvokeServer("BuyElectro")
                    end

                    if GetBP("Electro") and GetBP("Electro").Level.Value >= 400 then
                        if replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start") == nil then
                            notween(CFrame.new(-12548, 337, -7481))
                        end

                        replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw")
                    elseif GetBP("Electro") and GetBP("Electro").Level.Value < 400 then
                        repeat
                            _G.AutoFarm_Bone = true
                            wait()
                        until not _G.Auto_Electric_Claw or GetBP("Electric Claw")

                        _G.AutoFarm_Bone = false
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.AutoDragonTalon then
            pcall(function()
                if plr:FindFirstChild("WeaponAssetCache") then
                    if not GetBP("Dragon Claw") then
                        replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
                    end

                    if GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value >= 400 then
                        replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                        replicated.Remotes.CommF_:InvokeServer("BuyDragonTalon")
                    elseif GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value < 400 then
                        repeat
                            _G.AutoFarm_Bone = true
                            wait()
                        until not _G.AutoDragonTalon or GetBP("Dragon Talon")

                        _G.AutoFarm_Bone = false
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_God_Human then
                if replicated.Remotes.CommF_:InvokeServer("BuyGodhuman", true) == "Bring me 20 Fish Tails, 20 Magma Ore, 10 Dragon Scales and 10 Mystic Droplets." then
                    if GetM("Dragon Scale") ~= false and GetM("Dragon Scale") >= 10 then
                        if GetM("Fish Tail") ~= false and GetM("Fish Tail") >= 20 then
                            if GetM("Mystic Droplet") ~= false and GetM("Mystic Droplet") >= 10 then
                                if GetM("Magma Ore") == false or GetM("Magma Ore") < 20 then
                                    if World2 then
                                        Lv = 1175
                                        _G.Level = true
                                    else
                                        replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
                                    end
                                end
                            elseif World2 then
                                Lv = 1425
                                _G.Level = true
                            else
                                replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
                            end
                        elseif World3 then
                            Lv = 1775
                            _G.Level = true
                        else
                            replicated.Remotes.CommF_:InvokeServer("TravelZou")
                        end
                    elseif World3 then
                        Lv = 1575
                        _G.Level = true
                    else
                        replicated.Remotes.CommF_:InvokeServer("TravelZou")
                    end
                else
                    if replicated.Remotes.CommF_:InvokeServer("BuyGodhuman", true) == 3 then
                        return nil
                    end
                    replicated.Remotes.CommF_:InvokeServer("BuyGodhuman")
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.Snaguine then
            pcall(function()
                if not GetBP("Sanguine Art") then
                    replicated.Remotes.CommF_:InvokeServer("Sanguine Art")
                end

                if GetBP("Sanguine Art") then
                    replicated.Remotes.CommF_:InvokeServer("BuySanguineArt")
                else
                    if GetM("Leviathan Heart") >= 1 then
                        print("Completed!!")
                    elseif World3 then
                        _G.DangerSc = "Lv Infinite"
                        _G.SailBoats = true
                    else
                        _G.SailBoats = false
                    end

                    if GetM("Vampire Fang") <= 19 then
                        if World2 then
                            local Vampire = GetConnectionEnemies("Vampire")

                            if Vampire then
                                repeat
                                    task.wait()
                                    Attack.Kill(Vampire, _G.Snaguine)
                                until not _G.Snaguine or Vampire.Humanoid.Health <= 0 or not Vampire.Parent
                            else
                                _tp(CFrame.new(-6041.29248046875, 6.402710914611816, -1304.63330078125))
                            end
                        else
                            replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
                        end
                    end

                    if GetM("Vampire Fang") >= 20 and GetM("Demonic Wisp") <= 19 then
                        if World3 then
                            local v10 = GetConnectionEnemies("Demonic Soul")

                            if v10 then
                                repeat
                                    task.wait()
                                    Attack.Kill(v10, _G.Snaguine)
                                until not _G.Snaguine or v10.Humanoid.Health <= 0 or not v10.Parent
                            else
                                _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
                            end
                        else
                            replicated.Remotes.CommF_:InvokeServer("TravelZou")
                        end
                    end

                    if GetM("Vampire Fang") >= 20 and GetM("Demonic Wisp") >= 20 and GetM("Dark Fragment") <= 1 then
                        if World2 then
                            local Darkbeard = GetConnectionEnemies("Darkbeard")

                            if Darkbeard then
                                repeat
                                    task.wait()
                                    Attack.Kill(Darkbeard, _G.Snaguine)
                                until not _G.Snaguine or Darkbeard.Humanoid.Health <= 0 or not Darkbeard.Parent
                            else
                                _tp(CFrame.new(3798.4575195313, 13.826690673828, -3399.806640625))
                            end
                        else
                            replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.FindMirage then
            pcall(function()
                if workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island", true) then
                    _tp(workspace.Map:FindFirstChild("MysticIsland").Center.CFrame * CFrame.new(0, 300, 0))
                else
                    local v10 = CheckBoat()

                    if v10 then
                        if plr.Character.Humanoid.Sit == false then
                            local n4 = v10.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
                            _tp(n4)
                        else
                            local cframe3

                            repeat
                                wait()
                                cframe3 = CFrame.new(-10000000, 31, 37016.25)

                                if not CheckEnemiesBoat() and not CheckTerrorShark() and not CheckPirateGrandBrigade() then
                                    _tp(CFrame.new(-10000000, 31, 37016.25))
                                else
                                    _tp(CFrame.new(-10000000, 150, 37016.25))
                                end
                            until not _G.FindMirage or (cframe3.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 or workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") or plr.Character.Humanoid.Sit == false

                            plr.Character.Humanoid.Sit = false
                        end
                    else
                        local cframe3 = CFrame.new(-16927.451, 9.086, 433.864)
                        TeleportToTarget(cframe3)

                        if (cframe3.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if _G.AutoMysticIsland then
                for k, child in pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
                    if child.Name == "Mirage Island" then
                        topos(child.CFrame * CFrame.new(0, 333, 0))
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.HighestMirage then
            pcall(function()
                if workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island", true) then
                    _tp(workspace.Map:FindFirstChild("MysticIsland").Center.CFrame * CFrame.new(0, 400, 0))
                end
            end)
        end
    end
end)

spawn(function()
    pcall(function()
        local v10, v11, v12, v13, v14, v15, n4
        n4 = 1

        while true do
            if n4 == 1 then
                n4 = 2
            elseif n4 == 2 then
                if wait(0.1) then
                    n4 = 3
                else
                    n4 = 8
                end
            elseif n4 == 3 then
                if _G.TPGEAR then
                    n4 = 4
                else
                    n4 = 2
                end
            elseif n4 == 4 then
                v10, v11, v12 = pairs(workspace.Map:FindFirstChild("MysticIsland"):GetChildren())
                v13 = v12
                n4 = 5
            elseif n4 == 5 then
                v14, v15 = v10(v11, v13)

                if v14 == nil then
                    n4 = 2
                else
                    n4 = 6
                end
            elseif n4 == 6 then
                v13 = v14

                if v15.Name == "Part" and v15.ClassName == "MeshPart" then
                    n4 = 7
                else
                    n4 = 5
                end
            elseif n4 == 7 then
                _tp(v15.CFrame)
                n4 = 5
            elseif n4 == 8 then
                return
            end
        end
    end)
end)

spawn(function()
    pcall(function()
        local v10, v11, v12, v13, v14, v15, n4
        n4 = 1

        while true do
            if n4 == 1 then
                if wait(Sec) then
                    n4 = 2
                else
                    n4 = 9
                end
            elseif n4 == 2 then
                if _G.can then
                    n4 = 3
                else
                    n4 = 1
                end
            elseif n4 == 3 then
                v10, v11, v12 = pairs(workspace.Map:FindFirstChild("MysticIsland"):GetChildren())
                v13 = v12
                n4 = 4
            elseif n4 == 4 then
                v14, v15 = v10(v11, v13)

                if v14 == nil then
                    n4 = 1
                else
                    n4 = 5
                end
            elseif n4 == 5 then
                v13 = v14

                if v15.Name == "Part" then
                    n4 = 6
                else
                    n4 = 4
                end
            elseif n4 == 6 then
                if v15.ClassName == "MeshPart" then
                    n4 = 8
                else
                    n4 = 7
                end
            elseif n4 == 7 then
                v15.Transparency = 1
                n4 = 4
            elseif n4 == 8 then
                v15.Transparency = 0
                n4 = 4
            elseif n4 == 9 then
                return
            end
        end
    end)
end)

spawn(function()
    while wait() do
        if _G.Addealer then
            pcall(function()
                for k, child in pairs(replicated.NPCs:GetChildren()) do
                    if child.Name == "Advanced Fruit Dealer" then
                        _tp(child.HumanoidRootPart.CFrame)
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait(0.2) do
        if _G.FarmChestM then
            pcall(function()
                if workspace.Map:FindFirstChild("MysticIsland").Chests:FindFirstChild("DiamondChest") or workspace.Map:FindFirstChild("MysticIsland").Chests:FindFirstChild("FragChest") then
                    local CollectionService = game:GetService("CollectionService")
                    local localPlayer2 = game:GetService("Players").LocalPlayer
                    local character3 = localPlayer2.Character
                    local result = character3 or localPlayer2.CharacterAdded:Wait()
                    if not result then
                        return
                    end
                    local position = result:GetPivot().Position
                    local tagged = CollectionService:GetTagged("_ChestTagged")
                    local huge = math.huge
                    local v10 = nil

                    for i = 1, #tagged do
                        local v11 = tagged[i]
                        local magnitude = (v11:GetPivot().Position - position).Magnitude

                        if (not SelectedIsland or v11:IsDescendantOf(SelectedIsland)) and not v11:GetAttribute("IsDisabled") and magnitude < huge then
                            huge = magnitude
                            v10 = v11
                        end
                    end

                    if v10 then
                        _tp(v10:GetPivot())
                    end
                end
            end)
        end
    end
end)

MoveCamtoMoon = function()
    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, Lighting:GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)
    plr.Character.HumanoidRootPart.CFrame = CFrame.new(plr.Character.HumanoidRootPart.Position, Lighting:GetMoonDirection() + plr.Character.HumanoidRootPart.CFrame.Position)
end

task.spawn(function()
    while task.wait() do
        if LookM then
            MoveCamtoMoon()
            wait(0.1)
            replicated.Remotes.CommE:FireServer("ActivateAbility")
        end
    end
end)

MoveCamtoMoon = function()
    local moonDirection = Lighting:GetMoonDirection()
    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, workspace.CurrentCamera.CFrame.Position + moonDirection)
    plr.Character.HumanoidRootPart.CFrame = CFrame.new(plr.Character.HumanoidRootPart.Position, plr.Character.HumanoidRootPart.Position + moonDirection)
end

task.spawn(function()
    while task.wait(0.1) do
        if LookMV3 then
            MoveCamtoMoon()
            replicated.Remotes.CommE:FireServer("ActivateAbility")
            UserInputService:SendKeyEvent(true, "T", false, game)
            wait(0.5)
            UserInputService:SendKeyEvent(false, "T", false, game)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Mink then
                if replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
                    if replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 0 then
                        replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
                    elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 1 then
                        _G.AutoFarmChest = true
                    else
                        _G.AutoFarmChest = false
                    end
                elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
                    replicated.Remotes.CommF_:InvokeServer("Alchemist", "2")
                elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 1 then
                    if not plr.Backpack:FindFirstChild("Flower 1") and not plr.Character:FindFirstChild("Flower 1") then
                        _tp(workspace.Flower1.CFrame)
                    elseif not plr.Backpack:FindFirstChild("Flower 2") and not plr.Character:FindFirstChild("Flower 2") then
                        _tp(workspace.Flower2.CFrame)
                    elseif not plr.Backpack:FindFirstChild("Flower 3") and not plr.Character:FindFirstChild("Flower 3") then
                        local v10 = GetConnectionEnemies("Swan Pirate")

                        if v10 then
                            repeat
                                wait()
                                Attack.Kill(v10, _G.Auto_Mink)
                            until GetBP("Flower 3") or not v10.Parent or v10.Humanoid.Health <= 0 or _G.Auto_Mink == false
                        else
                            _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
                        end
                    end
                elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
                    replicated.Remotes.CommF_:InvokeServer("Alchemist", "3")
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Human then
                if replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == -2 then
                    if replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 0 then
                        replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
                    elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 1 then
                        local v10 = GetConnectionEnemies(Human_v3_Mob[1])

                        if v10 then
                            repeat
                                wait()
                                Attack.Kill(v10, _G.Auto_Human)
                            until v10.Humanoid.Health <= 0 or not v10.Parent or not _G.Auto_Human
                        else
                            _tp(CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625))
                        end

                        local v11 = GetConnectionEnemies(Human_v3_Mob[2])

                        if v11 then
                            repeat
                                wait()
                                Attack.Kill(v11, _G.Auto_Human)
                            until v11.Humanoid.Health <= 0 or not v11.Parent or not _G.Auto_Human
                        else
                            _tp(CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109))
                        end

                        local v12 = GetConnectionEnemies(Human_v3_Mob[3])

                        if v12 then
                            repeat
                                wait()
                                Attack.Kill(v12, _G.Auto_Human)
                            until v12.Humanoid.Health <= 0 or not v12.Parent or not _G.Auto_Human
                        else
                            _tp(CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407))
                        end
                    end
                elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
                    replicated.Remotes.CommF_:InvokeServer("Alchemist", "2")
                elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 1 then
                    if not plr.Backpack:FindFirstChild("Flower 1") and not plr.Character:FindFirstChild("Flower 1") then
                        _tp(workspace.Flower1.CFrame)
                    elseif not plr.Backpack:FindFirstChild("Flower 2") and not plr.Character:FindFirstChild("Flower 2") then
                        _tp(workspace.Flower2.CFrame)
                    elseif not plr.Backpack:FindFirstChild("Flower 3") and not plr.Character:FindFirstChild("Flower 3") then
                        local v10 = GetConnectionEnemies("Swan Pirate")

                        if v10 then
                            repeat
                                wait()
                                Attack.Kill(v10, _G.Auto_Human)
                            until plr.Backpack:FindFirstChild("Flower 3") or not v10.Parent or v10.Humanoid.Health <= 0 or _G.Auto_Human == false
                        else
                            _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
                        end
                    end
                elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
                    replicated.Remotes.CommF_:InvokeServer("Alchemist", "3")
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            local v10, v11, v12, v13, v14, v15, v16, n4
            n4 = 1

            while true do
                if n4 == 1 then
                    if _G.Auto_Skypiea then
                        n4 = 2
                    else
                        n4 = 23
                    end
                elseif n4 == 2 then
                    if replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == -2 then
                        n4 = 16
                    else
                        n4 = 3
                    end
                elseif n4 == 3 then
                    if replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
                        n4 = 15
                    else
                        n4 = 4
                    end
                elseif n4 == 4 then
                    if replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 1 then
                        n4 = 7
                    else
                        n4 = 5
                    end
                elseif n4 == 5 then
                    if replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
                        n4 = 6
                    else
                        n4 = 23
                    end
                elseif n4 == 6 then
                    replicated.Remotes.CommF_:InvokeServer("Alchemist", "3")
                    n4 = 23
                elseif n4 == 7 then
                    if not plr.Backpack:FindFirstChild("Flower 1") and not plr.Character:FindFirstChild("Flower 1") then
                        n4 = 14
                    else
                        n4 = 8
                    end
                elseif n4 == 8 then
                    if not plr.Backpack:FindFirstChild("Flower 2") and not plr.Character:FindFirstChild("Flower 2") then
                        n4 = 13
                    else
                        n4 = 9
                    end
                elseif n4 == 9 then
                    if not plr.Backpack:FindFirstChild("Flower 3") and not plr.Character:FindFirstChild("Flower 3") then
                        n4 = 10
                    else
                        n4 = 23
                    end
                elseif n4 == 10 then
                    v10 = GetConnectionEnemies("Swan Pirate")

                    if v10 then
                        n4 = 11
                    else
                        n4 = 12
                    end
                elseif n4 == 11 then
                    wait()
                    Attack.Kill(v10, _G.Auto_Skypiea)

                    if not plr.Backpack:FindFirstChild("Flower 3") and v10.Parent and v10.Humanoid.Health > 0 and _G.Auto_Skypiea ~= false then
                        n4 = 11
                    else
                        n4 = 23
                    end
                elseif n4 == 12 then
                    _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
                    n4 = 23
                elseif n4 == 13 then
                    _tp(workspace.Flower2.CFrame)
                    n4 = 23
                elseif n4 == 14 then
                    _tp(workspace.Flower1.CFrame)
                    n4 = 23
                elseif n4 == 15 then
                    replicated.Remotes.CommF_:InvokeServer("Alchemist", "2")
                    n4 = 23
                elseif n4 == 16 then
                    if replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 0 then
                        n4 = 22
                    else
                        n4 = 17
                    end
                elseif n4 == 17 then
                    if replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 1 then
                        n4 = 18
                    else
                        n4 = 23
                    end
                elseif n4 == 18 then
                    v11, v12, v13 = pairs(game.Players:GetChildren())
                    v14 = v13
                    n4 = 19
                elseif n4 == 19 then
                    v15, v16 = v11(v12, v14)

                    if v15 == nil then
                        n4 = 23
                    else
                        n4 = 20
                    end
                elseif n4 == 20 then
                    v14 = v15

                    if v16.Name ~= plr.Name and tostring(v16.Data.Race.Value) == "Skypiea" then
                        n4 = 21
                    else
                        n4 = 19
                    end
                elseif n4 == 21 then
                    task.wait()
                    _tp(v16.HumanoidRootPart.CFrame * CFrame.new(0, 8, 0) * CFrame.Angles(math.rad(-45), 0, 0))

                    if v16.Humanoid.Health > 0 and _G.Auto_Skypiea ~= false then
                        n4 = 21
                    else
                        n4 = 19
                    end
                elseif n4 == 22 then
                    replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
                    n4 = 23
                elseif n4 == 23 then
                    return
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Fish then
                if replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == -2 then
                    if replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 0 then
                        replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
                    elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 1 then
                        warn("Sea Beast Soon")
                    end
                elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
                    replicated.Remotes.CommF_:InvokeServer("Alchemist", "2")
                elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 1 then
                    if not plr.Backpack:FindFirstChild("Flower 1") and not plr.Character:FindFirstChild("Flower 1") then
                        _tp(workspace.Flower1.CFrame)
                    elseif not plr.Backpack:FindFirstChild("Flower 2") and not plr.Character:FindFirstChild("Flower 2") then
                        _tp(workspace.Flower2.CFrame)
                    elseif not plr.Backpack:FindFirstChild("Flower 3") and not plr.Character:FindFirstChild("Flower 3") then
                        local v10 = GetConnectionEnemies("Swan Pirate")

                        if v10 then
                            repeat
                                wait()
                                Attack.Kill(v10, _G.Auto_Fish)
                            until plr.Backpack:FindFirstChild("Flower 3") or not v10.Parent or v10.Humanoid.Health <= 0 or _G.Auto_Fish == false
                        else
                            _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
                        end
                    end
                elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
                    replicated.Remotes.CommF_:InvokeServer("Alchemist", "3")
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.Lver then
            pcall(function()
                for k, descendant in pairs(workspace.Map["Temple of Time"]:GetDescendants()) do
                    if descendant.Name == "ProximityPrompt" then
                        fireproximityprompt(descendant, math.huge)
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            local tbl15, n4, n5, n6, v10, n7
            n7 = 1

            while true do
                if n7 == 1 then
                    if _G.AcientOne then
                        n7 = 2
                    else
                        n7 = 10
                    end
                elseif n7 == 2 then
                    tbl15 = {
                        "Reborn Skeleton",
                        "Living Zombie",
                        "Demonic Soul",
                        "Posessed Mummy",
                    }

                    n4 = #tbl15 + 0
                    n5 = 0
                    n7 = 3
                elseif n7 == 3 then
                    n6 = n5 + 1

                    if n6 <= n4 then
                        n7 = 4
                    else
                        n7 = 10
                    end
                elseif n7 == 4 then
                    n5 = n6

                    if plr.Character:FindFirstChild("RaceEnergy").Value == 1 then
                        n7 = 9
                    else
                        n7 = 5
                    end
                elseif n7 == 5 then
                    if plr.Character:FindFirstChild("RaceTransformed").Value == false then
                        n7 = 6
                    else
                        n7 = 3
                    end
                elseif n7 == 6 then
                    v10 = GetConnectionEnemies(tbl15)

                    if v10 then
                        n7 = 7
                    else
                        n7 = 8
                    end
                elseif n7 == 7 then
                    wait()
                    Attack.Kill(v10, _G.AcientOne)

                    if _G.AcientOne ~= false and v10.Humanoid.Health > 0 and v10.Parent then
                        n7 = 7
                    else
                        n7 = 3
                    end
                elseif n7 == 8 then
                    _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
                    n7 = 3
                elseif n7 == 9 then
                    vim1:SendKeyEvent(true, "Y", false, game)
                    replicated.Remotes.CommF_:InvokeServer("UpgradeRace", "Buy")
                    _tp(CFrame.new(-8987.041015625, 215.862060546875, 5886.71044921875))
                    n7 = 3
                elseif n7 == 10 then
                    return
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.TPDoor then
                if tostring(plr.Data.Race.Value) == "Mink" then
                    _tp(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))
                elseif tostring(plr.Data.Race.Value) == "Fishman" then
                    _tp(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
                elseif tostring(plr.Data.Race.Value) == "Cyborg" then
                    _tp(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))
                elseif tostring(plr.Data.Race.Value) == "Skypiea" then
                    _tp(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
                elseif tostring(plr.Data.Race.Value) == "Ghoul" then
                    _tp(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))
                elseif tostring(plr.Data.Race.Value) == "Human" then
                    _tp(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Complete_Trials and tostring(plr.Data.Race.Value) == "Mink" then
                notween(workspace.Map.MinkTrial.Ceiling.CFrame * CFrame.new(0, -20, 0))
            end
        end)
    end
end)

GetSeaBeastTrial = function()
    if not workspace.Map:FindFirstChild("FishmanTrial") then
        return nil
    end

    if workspace._WorldOrigin.Locations:FindFirstChild("Trial of Water") then
        local trialOfWater = workspace._WorldOrigin.Locations:FindFirstChild("Trial of Water")
        FishmanTrial = trialOfWater
    end

    if FishmanTrial then
        local v10 = next
        local children, v11 = workspace.SeaBeasts:GetChildren()

        for k, v12 in v10, children, v11 do
            if v12:FindFirstChild("HumanoidRootPart") and (v12.HumanoidRootPart.Position - FishmanTrial.Position).Magnitude <= 1500 and v12.Health.Value > 0 then
                return v12
            end
        end
    end
end

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Complete_Trials and tostring(plr.Data.Race.Value) == "Fishman" and GetSeaBeastTrial() then
                local position

                repeat
                    task.wait()

                    spawn(function()
                        _tp(CFrame.new(GetSeaBeastTrial().HumanoidRootPart.Position.X, game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y + 300, GetSeaBeastTrial().HumanoidRootPart.Position.Z))
                    end)

                    position = GetSeaBeastTrial().HumanoidRootPart.Position
                    MousePos = position
                    Useskills("Melee", "Z")
                    Useskills("Melee", "X")
                    Useskills("Melee", "C")
                    wait(0.1)
                    Useskills("Sword", "Z")
                    Useskills("Sword", "X")
                    wait(0.1)
                    Useskills("Blox Fruit", "Z")
                    Useskills("Blox Fruit", "X")
                    Useskills("Blox Fruit", "C")
                    wait(0.1)
                    Useskills("Gun", "Z")
                    Useskills("Gun", "X")
                until _G.Complete_Trials == false or not GetSeaBeastTrial()
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Complete_Trials and tostring(plr.Data.Race.Value) == "Cyborg" then
                _tp(workspace.Map.CyborgTrial.Floor.CFrame * CFrame.new(0, 500, 0))
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Complete_Trials and tostring(plr.Data.Race.Value) == "Skypiea" then
                notween(workspace.Map.SkyTrial.Model.FinishPart.CFrame)
            end
        end)
    end
end)

spawn(function()
    while wait(0.1) do
        pcall(function()
            if _G.Complete_Trials and (tostring(plr.Data.Race.Value) == "Human" or tostring(plr.Data.Race.Value) == "Ghoul") then
                local v10 = GetConnectionEnemies({"Ancient Vampire", "Ancient Zombie"})

                if v10 then
                    repeat
                        wait()
                        Attack.Kill(v10, _G.Complete_Trials)
                    until _G.Complete_Trials == false or not v10.Parent or v10.Humanoid.Health <= 0
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait(Sec) do
        pcall(function()
            local v10, v11, v12, v13, v14, v15, n4
            n4 = 1

            while true do
                if n4 == 1 then
                    if _G.Defeating then
                        n4 = 2
                    else
                        n4 = 6
                    end
                elseif n4 == 2 then
                    v10, v11, v12 = pairs(workspace.Characters:GetChildren())
                    v13 = v12
                    n4 = 3
                elseif n4 == 3 then
                    v14, v15 = v10(v11, v13)

                    if v14 == nil then
                        n4 = 6
                    else
                        n4 = 4
                    end
                elseif n4 == 4 then
                    v13 = v14

                    if v15.Name ~= plr.Name and v15.Humanoid.Health > 0 and v15:FindFirstChild("HumanoidRootPart") and v15.Parent and (Root.Position - v15.HumanoidRootPart.Position).Magnitude <= 250 then
                        n4 = 5
                    else
                        n4 = 3
                    end
                elseif n4 == 5 then
                    task.wait()
                    EquipWeapon(_G.SelectWeapon)
                    _tp(v15.HumanoidRootPart.CFrame * CFrame.new(0, 0, 15))
                    sethiddenproperty(plr, "SimulationRadius", math.huge)

                    if _G.Defeating ~= false and v15.Humanoid.Health > 0 and v15.Parent and v15:FindFirstChild("HumanoidRootPart") and v15:FindFirstChild("Humanoid") then
                        n4 = 5
                    else
                        n4 = 3
                    end
                elseif n4 == 6 then
                    return
                end
            end
        end)
    end
end)

printBeltName = function(arg)
    if type(arg) == "table" and arg.Quest.BeltName then
        return arg.Quest.BeltName
    end
end

spawn(function()
    while wait(Sec) do
        if _G.Dojoo then
            pcall(function()
                local tbl15 = {{NPC = "Dojo Trainer", Command = "RequestQuest"}}
                local response = replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(tbl15))
                local v10 = response
                local v11 = printBeltName(response)

                if debug == false and not response and not v11 then
                    _tp(CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875))
                    debug = true
                elseif debug == true and (CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 50 then
                    if v11 == "White" then
                        local v12 = GetConnectionEnemies("Skull Slayer")

                        if v12 then
                            local response2

                            repeat
                                task.wait()
                                Attack.Kill(v12, _G.Dojoo)
                                response2 = replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(tbl15))
                                v10 = response2
                            until not response2 or not _G.Dojoo or not Attack.Alive(v12)
                        else
                            _tp(CFrame.new(-16759.58984375, 71.28376770019531, 1595.3399658203125))
                        end
                    elseif v11 == "Yellow" then
                        local response2

                        repeat
                            task.wait(1)
                            _G.SeaBeast1 = true
                            _G.TerrorShark = true
                            _G.Shark = true
                            _G.Piranha = true
                            _G.MobCrew = true
                            _G.FishBoat = true
                            _G.SailBoats = true
                            response2 = replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(tbl15))
                            v10 = response2
                        until not _G.Dojoo or not response2

                        _G.SeaBeast1 = false
                        _G.TerrorShark = false
                        _G.Shark = false
                        _G.Piranha = false
                        _G.MobCrew = false
                        _G.FishBoat = false
                        _G.SailBoats = false
                    elseif v11 == "Green" then
                        local response2

                        repeat
                            task.wait(1)
                            _G.SailBoats = true
                            response2 = replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(tbl15))
                            v10 = response2
                        until not _G.Dojoo or not response2

                        _G.SailBoats = false
                    elseif v11 == "Purple" then
                        local response2

                        repeat
                            task.wait(1)
                            _G.FarmEliteHunt = true
                            response2 = replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(tbl15))
                            v10 = response2
                        until not _G.Dojoo or not response2

                        _G.FarmEliteHunt = false
                    elseif v11 == "Red" then
                        local response2

                        repeat
                            task.wait(1)
                            _G.SailBoats = true
                            _G.FishBoat = true
                            response2 = replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(tbl15))
                            v10 = response2
                        until not _G.Dojoo or not response2

                        _G.SailBoats = false
                        _G.FishBoat = false
                    elseif v11 == "Black" then
                        local prehistoricIsland, response2

                        repeat
                            task.wait(1)
                            prehistoricIsland = workspace.Map:FindFirstChild("PrehistoricIsland")

                            if not prehistoricIsland and not workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
                                _G.Prehis_Find = true
                                _G.Prehis_Skills = false
                            else
                                _G.Prehis_Find = true

                                if prehistoricIsland and prehistoricIsland:FindFirstChild("Core") and prehistoricIsland.Core:FindFirstChild("ActivationPrompt") and prehistoricIsland.Core.ActivationPrompt:FindFirstChild("ProximityPrompt", true) then
                                    _G.Prehis_Skills = false
                                    _G.Prehis_Find = true
                                else
                                    _G.Prehis_Skills = true
                                    _G.Prehis_Find = false
                                end
                            end

                            response2 = replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(tbl15))
                            v10 = response2
                        until not _G.Dojoo or not response2

                        _G.Prehis_Find = PrehisUser.Find
                        _G.Prehis_Skills = PrehisUser.Skills
                    elseif v11 == "Orange" or v11 == "Blue" then
                        return nil
                    end
                end

                if not v10 then
                    debug = false
                    replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({{NPC = "Dojo Trainer", Command = "ClaimQuest"}}))
                end
            end)
        end
    end
end)

checkQuesta = function()
    local tbl15 = {{Context = "Check"}}
    local response = nil

    pcall(function()
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/DragonHunter"):InvokeServer(unpack({{Context = "RequestQuest"}}))
    end)

    pcall(function()
        response = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/DragonHunter"):InvokeServer(unpack(tbl15))
    end)

    local flag7 = false
    local num = nil
    local v10 = nil
    local n4 = nil

    if response and response.Text then
        flag7 = true
        local text = response.Text

        if string.find(tostring(text), "Defeat") then
            n4 = 1
            num = tonumber(string.sub(tostring(text), 8, 9))

            for k, v11 in pairs({"Hydra Enforcer", "Venomous Assailant"}) do
                if string.find(text, v11) then
                    v10 = v11
                    break
                end
                continue
            end
        elseif string.find(tostring(text), "Destroy") then
            num = 10
            n4 = 2
            v10 = nil
        end
    end

    return flag7, v10, num, n4
end

BackTODoJo = function()
    for k, child in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
        if child.Name == "NotificationTemplate" and string.find(child.Text, "Head back to the Dojo to complete more tasks") then
            return true
        end
    end

    return false
end

DragonMobClear = function(arg, arg2, arg3)
    if workspace.Enemies:FindFirstChild(arg2) then
        for k, child in pairs(workspace.Enemies:GetChildren()) do
            if child.Name == arg2 and Attack.Alive(child) and arg then
                Attack.Kill(child, arg)
            end
        end
    else
        _tp(arg3)
    end
end

GetQuestDracoLevel = function()
    return replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({{NPC = "Dragon Wizard", Command = "Upgrade"}}))
end

spawn(function()
    while wait() do
        if _G.FarmBlazeEM then
            pcall(function()
                local v10, v11, v12, v13 = checkQuesta()

                if v10 == true and not BackTODoJo() then
                    if v13 == 1 then
                        if v11 == "Hydra Enforcer" or v11 == "Venomous Assailant" then
                            repeat
                                wait()
                                DragonMobClear(true, v11, CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))
                            until not _G.FarmBlazeEM or not v10 or BackTODoJo()
                        end
                    elseif v13 == 2 and workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true) then
                        local position

                        repeat
                            wait()

                            spawn(function()
                                _tp(workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).CFrame * CFrame.new(4, 0, 0))
                            end)

                            if (workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).Position - Root.Position).Magnitude <= 200 then
                                position = workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).Position
                                MousePos = position
                                Useskills("Melee", "Z")
                                Useskills("Melee", "X")
                                Useskills("Melee", "C")
                                wait(0.5)
                                Useskills("Sword", "Z")
                                Useskills("Sword", "X")
                                wait(0.5)
                                Useskills("Blox Fruit", "Z")
                                Useskills("Blox Fruit", "X")
                                Useskills("Blox Fruit", "C")
                                wait(0.5)
                                Useskills("Gun", "Z")
                                Useskills("Gun", "X")
                            end
                        until not _G.FarmBlazeEM or not v10 or BackTODoJo()
                    end
                else
                    _tp(CFrame.new(5813, 1208, 884))
                    DragonMobClear(false, nil, nil)
                end
            end)
        end
    end
end)

spawn(function()
    while wait(0.1) do
        if _G.FarmBlazeEM then
            pcall(function()
                if workspace.EmberTemplate:FindFirstChild("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.EmberTemplate.Part.CFrame
                end
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.UPGDrago then
                if GetQuestDracoLevel() == false then
                    return nil
                end

                if GetQuestDracoLevel() == true then
                    if (CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938).Position - Root.Position).Magnitude >= 300 then
                        _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
                    else
                        _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
                        replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({{NPC = "Dragon Wizard", Command = "Upgrade"}}))
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.DragoV1 and GetM("Dragon Egg") <= 0 then
                repeat
                    wait()
                    _G.Prehis_Find = true
                    _G.Prehis_Skills = true
                    _G.Prehis_DE = true
                until not _G.DragoV1 or GetM("Dragon Egg") >= 1

                _G.Prehis_Find = PrehisUser.Find
                _G.Prehis_Skills = PrehisUser.Skills
                _G.Prehis_DE = PrehisUser.DE
            end
        end)
    end
end)

spawn(function()
    local fireFlowers, v10, v11, v12, v13, v14, v15, v16, position, n4
    n4 = 1

    while true do
        if n4 == 1 then
            if wait(Sec) then
                n4 = 2
            else
                n4 = 13
            end
        elseif n4 == 2 then
            if _G.AutoFireFlowers then
                n4 = 3
            else
                n4 = 1
            end
        elseif n4 == 3 then
            fireFlowers = workspace:FindFirstChild("FireFlowers")
            v10 = GetConnectionEnemies("Forest Pirate")

            if v10 then
                n4 = 4
            else
                n4 = 5
            end
        elseif n4 == 4 then
            wait()
            Attack.Kill(v10, _G.AutoFireFlowers)

            if _G.AutoFireFlowers and v10.Parent and v10.Humanoid.Health > 0 and not fireFlowers then
                n4 = 4
            else
                n4 = 6
            end
        elseif n4 == 5 then
            _tp(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
            n4 = 6
        elseif n4 == 6 then
            if fireFlowers then
                n4 = 7
            else
                n4 = 1
            end
        elseif n4 == 7 then
            v11, v12, v13 = pairs(fireFlowers:GetChildren())
            v14 = v13
            n4 = 8
        elseif n4 == 8 then
            v15, v16 = v11(v12, v14)

            if v15 == nil then
                n4 = 1
            else
                n4 = 9
            end
        elseif n4 == 9 then
            v14 = v15

            if v16:IsA("Model") and v16.PrimaryPart then
                n4 = 10
            else
                n4 = 8
            end
        elseif n4 == 10 then
            position = v16.PrimaryPart.Position

            if (position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                n4 = 12
            else
                n4 = 11
            end
        elseif n4 == 11 then
            _tp(CFrame.new(position))
            n4 = 8
        elseif n4 == 12 then
            vim1:SendKeyEvent(true, "E", false, game)
            wait(1.5)
            vim1:SendKeyEvent(false, "E", false, game)
            n4 = 8
        elseif n4 == 13 then
            return
        end
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.DragoV3 then
                repeat
                    wait()
                    _G.DangerSc = "Lv Infinite"
                    _G.SailBoats = true
                    _G.TerrorShark = true
                until not _G.DragoV3

                _G.DangerSc = "Lv 1"
                _G.SailBoats = false
                _G.TerrorShark = false
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.Relic123 then
            pcall(function()
                if workspace.Map:FindFirstChild("DracoTrial") then
                    replicated.Remotes.DracoTrial:InvokeServer()
                    wait(0.5)

                    repeat
                        wait()
                        _tp(CFrame.new(-39934.9765625, 10685.359375, 22999.34375))
                    until not _G.Relic123 or Root.Position == CFrame.new(-39934.9765625, 10685.359375, 22999.34375).Position

                    repeat
                        wait()
                        _tp(CFrame.new(-40511.25390625, 9376.4013671875, 23458.37890625))
                    until not _G.Relic123 or Root.Position == CFrame.new(-40511.25390625, 9376.4013671875, 23458.37890625).Position

                    wait(2.5)

                    repeat
                        wait()
                        _tp(CFrame.new(-39914.65625, 10685.384765625, 23000.177734375))
                    until not _G.Relic123 or Root.Position == CFrame.new(-39914.65625, 10685.384765625, 23000.177734375).Position

                    repeat
                        wait()
                        _tp(CFrame.new(-40045.83203125, 9376.3984375, 22791.287109375))
                    until not _G.Relic123 or Root.Position == CFrame.new(-40045.83203125, 9376.3984375, 22791.287109375).Position

                    wait(2.5)

                    repeat
                        wait()
                        _tp(CFrame.new(-39908.5, 10685.4052734375, 22990.04296875))
                    until not _G.Relic123 or Root.Position == CFrame.new(-39908.5, 10685.4052734375, 22990.04296875).Position

                    repeat
                        wait()
                        _tp(CFrame.new(-39609.5, 9376.400390625, 23472.94335975))
                    until not _G.Relic123 or Root.Position == CFrame.new(-39609.5, 9376.400390625, 23472.94335975).Position
                else
                    local trialTeleport = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")

                    if trialTeleport and trialTeleport:IsA("Part") then
                        _tp(CFrame.new(trialTeleport.Position))
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            local tbl15, n4, n5, n6, v10, n7
            n7 = 1

            while true do
                if n7 == 1 then
                    if _G.TrainDrago then
                        n7 = 2
                    else
                        n7 = 10
                    end
                elseif n7 == 2 then
                    tbl15 = {"Venomous Assailant", "Hydra Enforcer"}
                    n4 = #tbl15 + 0
                    n5 = 0
                    n7 = 3
                elseif n7 == 3 then
                    n6 = n5 + 1

                    if n6 <= n4 then
                        n7 = 4
                    else
                        n7 = 10
                    end
                elseif n7 == 4 then
                    n5 = n6

                    if plr.Character:FindFirstChild("RaceEnergy").Value == 1 then
                        n7 = 9
                    else
                        n7 = 5
                    end
                elseif n7 == 5 then
                    if plr.Character:FindFirstChild("RaceTransformed").Value == false then
                        n7 = 6
                    else
                        n7 = 3
                    end
                elseif n7 == 6 then
                    v10 = GetConnectionEnemies(tbl15)

                    if v10 then
                        n7 = 7
                    else
                        n7 = 8
                    end
                elseif n7 == 7 then
                    wait()
                    Attack.Kill(v10, _G.TrainDrago)

                    if _G.TrainDrago ~= false and v10.Humanoid.Health > 0 and v10.Parent then
                        n7 = 7
                    else
                        n7 = 3
                    end
                elseif n7 == 8 then
                    _tp(CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))
                    n7 = 3
                elseif n7 == 9 then
                    vim1:SendKeyEvent(true, "Y", false, game)
                    replicated.Remotes.CommF_:InvokeServer("UpgradeRace", "Buy", 2)
                    _tp(CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))
                    n7 = 3
                elseif n7 == 10 then
                    return
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.TpDrago_Prehis then
            local trialTeleport = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")

            if trialTeleport and trialTeleport:IsA("Part") then
                _tp(CFrame.new(trialTeleport.Position))
            end
        end
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.BuyDrago then
            pcall(function()
                if (CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938).Position - Root.Position).Magnitude >= 300 then
                    _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
                else
                    _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
                    replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({{NPC = "Dragon Wizard", Command = "DragonRace"}}))
                end
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.DT_Uzoth then
            local cframe3 = CFrame.new(5661.89014, 1211.31909, 864.836731, 0.811413169, -1.36805838e-08, -0.584473014, 4.75227395e-08, 1, 4.25682458e-08, 0.584473014, -6.23161966e-08, 0.811413169)
            _tp(cframe3)

            if (cframe3.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 25 then
                replicated.Modules.Net["RF/InteractDragonQuest"]:InvokeServer({NPC = "Uzoth", Command = "Upgrade"})
            end
        end
    end
end)

task.spawn(function()
    local rfCraft = game:GetService("ReplicatedStorage").Modules.Net["RF/Craft"]

    while task.wait(0.3) do
        if getgenv().AutoCraftVolcanic then
            pcall(function()
                rfCraft:InvokeServer("PossibleHardcode", "Volcanic Magnet")
            end)

            getgenv().AutoCraftVolcanic = false
        end
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Prehis_Find then
                local character3 = plr.Character
                if not character3 then
                    return
                end
                local humanoidRootPart2 = character3:FindFirstChild("HumanoidRootPart")
                local humanoid = character3:FindFirstChild("Humanoid")
                if not humanoidRootPart2 or not humanoid or humanoid.Health <= 0 then
                    return
                end
                local prehistoricIsland = workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island", true)

                if prehistoricIsland then
                    local headTeleport = prehistoricIsland:FindFirstChild("HeadTeleport", true)
                    local teleportHead = headTeleport or prehistoricIsland:FindFirstChild("Teleport_Head", true) or prehistoricIsland:FindFirstChild("Head", true)

                    if teleportHead then
                        local cFrame = teleportHead.CFrame
                        local n4 = cFrame.Position - cFrame.LookVector * 40 + Vector3.new(0, 20, 0)

                        if (n4 - humanoidRootPart2.Position).Magnitude > 30 then
                            _tp(CFrame.new(n4))
                        end
                    else
                        local position = prehistoricIsland.CFrame.Position
                        local n4 = position - (position - humanoidRootPart2.Position).Unit * 250 + Vector3.new(0, 60, 0)
                        _tp(CFrame.new(n4))
                    end
                else
                    local v10 = CheckBoat()

                    if not v10 then
                        local cframe3 = CFrame.new(-16927.451, 9.086, 433.864)
                        TeleportToTarget(cframe3)

                        if (cframe3.Position - humanoidRootPart2.Position).Magnitude <= 10 then
                            local commF = replicated.Remotes.CommF_
                            local invokeServer = commF.InvokeServer
                            local selectedBoat = _G.SelectedBoat
                            local str = selectedBoat or "Guardian"
                            invokeServer(commF, "BuyBoat", str)
                        end

                        return
                    end

                    if humanoid.Sit == false then
                        local n4 = v10.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
                        _tp(n4)
                        return
                    end

                    local cframe3 = CFrame.new(-10000000, 31, 37016.25)
                    targetDestination = cframe3

                    if not CheckEnemiesBoat() and not CheckTerrorShark() and not CheckPirateGrandBrigade() then
                        _tp(cframe3)
                    else
                        _tp(CFrame.new(-10000000, 150, 37016.25))
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        if _G.AutoStartPrehistoric then
            pcall(function()
                if workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island", true) then
                    local prehistoricIsland = workspace.Map:FindFirstChild("PrehistoricIsland", true)

                    if prehistoricIsland and prehistoricIsland:FindFirstChild("Core") then
                        local activationPrompt = prehistoricIsland.Core:FindFirstChild("ActivationPrompt", true)

                        if activationPrompt and activationPrompt:FindFirstChild("ProximityPrompt") then
                            if plr:DistanceFromCharacter(activationPrompt.CFrame.Position) <= 150 then
                                fireproximityprompt(activationPrompt.ProximityPrompt, math.huge)
                                vim1:SendKeyEvent(true, "E", false, game)
                                wait(1.5)
                                vim1:SendKeyEvent(false, "E", false, game)
                            end

                            _tp(activationPrompt.CFrame)
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait(0.3) do
        if _G.Prehis_Skills then
            pcall(function()
                local prehistoricIsland = workspace.Map:FindFirstChild("PrehistoricIsland")
                if not prehistoricIsland then
                    return
                end

                for k, descendant in pairs(prehistoricIsland:GetDescendants()) do
                    if (descendant:IsA("BasePart") or descendant:IsA("MeshPart")) and descendant.Name:lower():find("lava") then
                        descendant:Destroy()
                    end
                end

                local core = prehistoricIsland:FindFirstChild("Core")

                if core then
                    local interiorLava = core:FindFirstChild("InteriorLava")

                    if interiorLava then
                        interiorLava:Destroy()
                    end
                end

                local trialTeleport = prehistoricIsland:FindFirstChild("TrialTeleport")

                for k, descendant in pairs(prehistoricIsland:GetDescendants()) do
                    if descendant.Name == "TouchInterest" and (not trialTeleport or not descendant:IsDescendantOf(trialTeleport)) then
                        descendant.Parent:Destroy()
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.Prehis_Skills then
            pcall(function()
                local v10 = GetConnectionEnemies("Lava Golem")

                if v10 and v10:FindFirstChild("Humanoid") then
                    repeat
                        wait(0.1)
                        Attack.Kill(v10, true)
                        v10.Humanoid:ChangeState(15)
                    until not _G.Prehis_Skills or not v10.Parent or v10.Humanoid.Health <= 0
                end
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.Prehis_Skills then
            pcall(function()
                local prehistoricIsland, core, volcanoRocks, v10, v11, v12, v13, v14, v15, vfxLayer, at0, glow, n4
                n4 = 1

                while true do
                    if n4 == 1 then
                        prehistoricIsland = workspace.Map:FindFirstChild("PrehistoricIsland")

                        if prehistoricIsland then
                            n4 = 2
                        else
                            n4 = 17
                        end
                    elseif n4 == 2 then
                        core = prehistoricIsland:FindFirstChild("Core")

                        if core then
                            n4 = 3
                        else
                            n4 = 16
                        end
                    elseif n4 == 3 then
                        volcanoRocks = core:FindFirstChild("VolcanoRocks")

                        if volcanoRocks then
                            n4 = 4
                        else
                            n4 = 15
                        end
                    elseif n4 == 4 then
                        v10, v11, v12 = pairs(volcanoRocks:GetChildren())
                        v13 = v12
                        n4 = 5
                    elseif n4 == 5 then
                        v14, v15 = v10(v11, v13)

                        if v14 == nil then
                            n4 = 14
                        else
                            n4 = 6
                        end
                    elseif n4 == 6 then
                        v13 = v14
                        vfxLayer = v15:FindFirstChild("VFXLayer")
                        at0 = vfxLayer

                        if vfxLayer then
                            n4 = 7
                        else
                            n4 = 8
                        end
                    elseif n4 == 7 then
                        at0 = vfxLayer:FindFirstChild("At0")
                        n4 = 8
                    elseif n4 == 8 then
                        glow = at0

                        if at0 then
                            n4 = 9
                        else
                            n4 = 10
                        end
                    elseif n4 == 9 then
                        glow = at0:FindFirstChild("Glow")
                        n4 = 10
                    elseif n4 == 10 then
                        if glow and glow.Enabled then
                            n4 = 11
                        else
                            n4 = 5
                        end
                    elseif n4 == 11 then
                        wait(0.1)
                        _tp(vfxLayer.CFrame)

                        if plr:DistanceFromCharacter(vfxLayer.CFrame.Position) <= 150 then
                            n4 = 12
                        else
                            n4 = 13
                        end
                    elseif n4 == 12 then
                        MousePos = vfxLayer.CFrame.Position
                        Useskills("Melee", "Z")
                        wait(0.4)
                        Useskills("Melee", "X")
                        wait(0.4)
                        Useskills("Melee", "C")
                        wait(0.4)
                        Useskills("Blox Fruit", "Z")
                        wait(0.4)
                        Useskills("Blox Fruit", "X")
                        wait(0.4)
                        Useskills("Blox Fruit", "C")
                        n4 = 13
                    elseif n4 == 13 then
                        if _G.Prehis_Skills and glow.Enabled then
                            n4 = 11
                        else
                            n4 = 5
                        end
                    elseif n4 == 14 then
                        return
                    elseif n4 == 15 then
                        return
                    elseif n4 == 16 then
                        return
                    elseif n4 == 17 then
                        return
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while true do
        local wait_ = task.wait
        local v10 = Sec
        local n4 = v10 or 0.1
        if not wait_(n4) then
            break
        end

        if _G.KillAuraFull then
            pcall(function()
                local localPlayer2 = game.Players.LocalPlayer
                local character3 = localPlayer2.Character
                local humanoidRootPart2 = character3 and character3:FindFirstChild("HumanoidRootPart")
                if not humanoidRootPart2 then
                    return
                end
                sethiddenproperty(localPlayer2, "SimulationRadius", math.huge)

                for k, child in pairs(workspace.Enemies:GetChildren()) do
                    if child:FindFirstChild("Humanoid") and child:FindFirstChild("HumanoidRootPart") then
                        local magnitude = (child.HumanoidRootPart.Position - humanoidRootPart2.Position).Magnitude
                        local v11 = Range
                        local n5 = v11 or 100

                        if magnitude <= n5 and child.Humanoid.Health > 0 then
                            child.Humanoid.Health = 0
                            child.HumanoidRootPart.CanCollide = false
                            child:BreakJoints()
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Prehis_DB and workspace:FindFirstChild("DinoBone") then
                for k, child in pairs(workspace:GetChildren()) do
                    if child.Name == "DinoBone" then
                        _tp(child.CFrame)
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Prehis_DE then
                local prehistoricIsland = workspace.Map:FindFirstChild("PrehistoricIsland")

                if prehistoricIsland and prehistoricIsland:FindFirstChild("Core") and prehistoricIsland.Core:FindFirstChild("SpawnedDragonEggs") then
                    local dragonEgg = prehistoricIsland.Core.SpawnedDragonEggs:FindFirstChild("DragonEgg")

                    if dragonEgg and dragonEgg:FindFirstChild("Molten") and dragonEgg.Molten:FindFirstChild("ProximityPrompt") then
                        _tp(dragonEgg.Molten.CFrame)
                        fireproximityprompt(dragonEgg.Molten.ProximityPrompt, 30)
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.ResetPH then
                local trialTeleport = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")

                if trialTeleport and trialTeleport:FindFirstChild("TouchInterest") then
                    local now = tick()
                    local lastPHReset = getgenv().LastPHReset
                    local n4 = lastPHReset or 0

                    if now - n4 > 10 then
                        getgenv().LastPHReset = tick()
                        plr.Character.Humanoid.Health = 0
                    end
                elseif workspace:FindFirstChild("DinoBone") then
                    for k, child in pairs(workspace:GetChildren()) do
                        if child.Name == "DinoBone" then
                            _tp(child.CFrame)
                        end
                    end
                end
            end
        end)
    end
end)

ListSeaBoat = {
    "Guardian",
    "PirateGrandBrigade",
    "MarineGrandBrigade",
    "PirateBrigade",
    "MarineBrigade",
    "PirateSloop",
    "MarineSloop",
    "Beast Hunter",
}

ListSeaZone = {
    "Lv 1",
    "Lv 2",
    "Lv 3",
    "Lv 4",
    "Lv 5",
    "Lv 6",
    "Lv Infinite",
}

spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoPressW and game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            local v10, v11, v12 = pairs(game:GetService("Workspace").Boats:GetChildren())
            local v13 = v12
            local v14 = v10
            local v15 = v11

            while true do
                local v16, v17 = v14(v15, v13)
                if v16 == nil then
                    break
                end

                for k, descendant in pairs(v17:GetDescendants()) do
                    if descendant:IsA("BasePart") then
                        if not getgenv().NoClipShip and not getgenv().FindPrehistoric then
                            descendant.CanCollide = true
                        else
                            descendant.CanCollide = false
                        end
                    end
                end

                v13 = v16
            end
        end)
    end
end)

spawn(function()
    while wait() do
        if _G.SailBoats then
            pcall(function()
                local v10 = CheckBoat()

                if not v10 and (not CheckShark() or not _G.Shark) and (not CheckTerrorShark() or not _G.TerrorShark) and (not CheckFishCrew() or not _G.MobCrew) and (not CheckPiranha() or not _G.Piranha) and (not CheckEnemiesBoat() or not _G.FishBoat) and (not CheckSeaBeast() or not _G.SeaBeast1) and (not _G.PGB or not CheckPirateGrandBrigade()) and (not _G.HCM or not CheckHauntedCrew()) and (not _G.Leviathan1 or not CheckLeviathan()) then
                    local cframe3 = CFrame.new(-16927.451, 9.086, 433.864)
                    TeleportToTarget(cframe3)

                    if (cframe3.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
                    end
                elseif v10 and (not CheckShark() or not _G.Shark) and (not CheckTerrorShark() or not _G.TerrorShark) and (not CheckFishCrew() or not _G.MobCrew) and (not CheckPiranha() or not _G.Piranha) and (not CheckEnemiesBoat() or not _G.FishBoat) and (not CheckSeaBeast() or not _G.SeaBeast1) and (not _G.PGB or not CheckPirateGrandBrigade()) and (not _G.HCM or not CheckHauntedCrew()) and (not _G.Leviathan1 or not CheckLeviathan()) then
                    if plr.Character.Humanoid.Sit == false then
                        local n4 = v10.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
                        _tp(n4)
                    else
                        if _G.DangerSc == "Lv 1" then
                            local cframe3 = CFrame.new(-21998.375, 30.0006084, -682.309143)
                            CFrameSelectedZone = cframe3
                        elseif _G.DangerSc == "Lv 2" then
                            local cframe3 = CFrame.new(-26779.5215, 30.0005474, -822.858032)
                            CFrameSelectedZone = cframe3
                        elseif _G.DangerSc == "Lv 3" then
                            local cframe3 = CFrame.new(-31171.957, 30.0001011, -2256.93774)
                            CFrameSelectedZone = cframe3
                        elseif _G.DangerSc == "Lv 4" then
                            local cframe3 = CFrame.new(-34054.6875, 30.2187767, -2560.12012)
                            CFrameSelectedZone = cframe3
                        elseif _G.DangerSc == "Lv 5" then
                            local cframe3 = CFrame.new(-38887.5547, 30.0004578, -2162.99023)
                            CFrameSelectedZone = cframe3
                        elseif _G.DangerSc == "Lv 6" then
                            local cframe3 = CFrame.new(-44541.7617, 30.0003204, -1244.8584)
                            CFrameSelectedZone = cframe3
                        elseif _G.DangerSc == "Lv Infinite" then
                            local cframe3 = CFrame.new(-10000000, 31, 37016.25)
                            CFrameSelectedZone = cframe3
                        end

                        repeat
                            wait()

                            if (_G.FishBoat or not CheckEnemiesBoat()) and (_G.PGB or not CheckPirateGrandBrigade()) and (_G.TerrorShark or not CheckTerrorShark()) then
                                _tp(CFrameSelectedZone)
                            else
                                _tp(CFrameSelectedZone * CFrame.new(0, 150, 0))
                            end
                        until _G.SailBoats == false or CheckShark() and _G.Shark or CheckTerrorShark() and _G.TerrorShark or CheckFishCrew() and _G.MobCrew or CheckPiranha() and _G.Piranha or CheckSeaBeast() and _G.SeaBeast1 or CheckEnemiesBoat() and _G.FishBoat or _G.Leviathan1 and CheckLeviathan() or _G.HCM and CheckHauntedCrew() or _G.PGB and CheckPirateGrandBrigade() or plr.Character:WaitForChild("Humanoid").Sit == false

                        plr.Character.Humanoid.Sit = false
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            local v10, v11, v12 = pairs(workspace.Boats:GetChildren())
            local v13 = v12
            local v14 = v10
            local v15 = v11

            while true do
                local v16, v17 = v14(v15, v13)
                if v16 == nil then
                    break
                end

                for k, descendant in pairs(workspace.Boats[v17.Name]:GetDescendants()) do
                    if descendant:IsA("BasePart") then
                        if not _G.SailBoats and not _G.Prehis_Find and not _G.FindMirage and not _G.SailBoat_Hydra and not _G.AutofindKitIs then
                            descendant.CanCollide = true
                        else
                            descendant.CanCollide = false
                        end
                    end
                end

                v13 = v16
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            local n4, n5, tbl15, v10, v11, v12, v13, v14, v15, tbl16, v16, v17, v18, v19, v20, v21, tbl17, v22, v23, v24
            local v25, v26, v27, tbl18, v28, v29, v30, v31, v32, v33, tbl19, v34, v35, v36, v37, v38, v39, n6, v40, v41
            local v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, position, v52, v53, v54, v55, v56, v57, v58, v59, v60
            local v61, v62, v63, n7
            n7 = 1

            while true do
                if n7 == 1 then
                    n4 = 885238790
                    n5 = 1031471291

                    if _G.Shark then
                        n7 = 2
                    else
                        n7 = 7
                    end
                elseif n7 == 2 then
                    tbl15 = {"Shark"}

                    if CheckShark() then
                        n7 = 3
                    else
                        n7 = 7
                    end
                elseif n7 == 3 then
                    v10, v11, v12 = pairs(workspace.Enemies:GetChildren())
                    v13 = v12
                    n7 = 4
                elseif n7 == 4 then
                    v14, v15 = v10(v11, v13)

                    if v14 == nil then
                        n7 = 7
                    else
                        n7 = 5
                    end
                elseif n7 == 5 then
                    v13 = v14

                    if table.find(tbl15, v15.Name) and Attack.Alive(v15) then
                        n7 = 6
                    else
                        n7 = 4
                    end
                elseif n7 == 6 then
                    task.wait()
                    Attack.Kill(v15, _G.Shark)

                    if _G.Shark ~= false and v15.Parent and v15.Humanoid.Health > 0 then
                        n7 = 6
                    else
                        n7 = 4
                    end
                elseif n7 == 7 then
                    if _G.TerrorShark then
                        n7 = 8
                    else
                        n7 = 13
                    end
                elseif n7 == 8 then
                    tbl16 = {"Terrorshark"}

                    if CheckTerrorShark() then
                        n7 = 9
                    else
                        n7 = 13
                    end
                elseif n7 == 9 then
                    v16, v17, v18 = pairs(workspace.Enemies:GetChildren())
                    v19 = v18
                    n7 = 10
                elseif n7 == 10 then
                    v20, v21 = v16(v17, v19)

                    if v20 == nil then
                        n7 = 13
                    else
                        n7 = 11
                    end
                elseif n7 == 11 then
                    v19 = v20

                    if table.find(tbl16, v21.Name) and Attack.Alive(v21) then
                        n7 = 12
                    else
                        n7 = 10
                    end
                elseif n7 == 12 then
                    task.wait()
                    Attack.KillSea(v21, _G.TerrorShark)

                    if _G.TerrorShark ~= false and v21.Parent and v21.Humanoid.Health > 0 then
                        n7 = 12
                    else
                        n7 = 10
                    end
                elseif n7 == 13 then
                    if _G.Piranha then
                        n7 = 14
                    else
                        n7 = 19
                    end
                elseif n7 == 14 then
                    tbl17 = {"Piranha"}

                    if CheckPiranha() then
                        n7 = 15
                    else
                        n7 = 19
                    end
                elseif n7 == 15 then
                    v22, v23, v24 = pairs(workspace.Enemies:GetChildren())
                    v25 = v24
                    n7 = 16
                elseif n7 == 16 then
                    v26, v27 = v22(v23, v25)

                    if v26 == nil then
                        n7 = 19
                    else
                        n7 = 17
                    end
                elseif n7 == 17 then
                    v25 = v26

                    if table.find(tbl17, v27.Name) and Attack.Alive(v27) then
                        n7 = 18
                    else
                        n7 = 16
                    end
                elseif n7 == 18 then
                    task.wait()
                    Attack.Kill(v27, _G.Piranha)

                    if _G.Piranha ~= false and v27.Parent and v27.Humanoid.Health > 0 then
                        n7 = 18
                    else
                        n7 = 16
                    end
                elseif n7 == 19 then
                    if _G.MobCrew then
                        n7 = 20
                    else
                        n7 = 25
                    end
                elseif n7 == 20 then
                    tbl18 = {"Fish Crew Member"}

                    if CheckFishCrew() then
                        n7 = 21
                    else
                        n7 = 25
                    end
                elseif n7 == 21 then
                    v28, v29, v30 = pairs(workspace.Enemies:GetChildren())
                    v31 = v30
                    n7 = 22
                elseif n7 == 22 then
                    v32, v33 = v28(v29, v31)

                    if v32 == nil then
                        n7 = 25
                    else
                        n7 = 23
                    end
                elseif n7 == 23 then
                    v31 = v32

                    if table.find(tbl18, v33.Name) and Attack.Alive(v33) then
                        n7 = 24
                    else
                        n7 = 22
                    end
                elseif n7 == 24 then
                    task.wait()
                    Attack.Kill(v33, _G.MobCrew)

                    if _G.MobCrew ~= false and v33.Parent and v33.Humanoid.Health > 0 then
                        n7 = 24
                    else
                        n7 = 22
                    end
                elseif n7 == 25 then
                    if _G.HCM then
                        n7 = 26
                    else
                        n7 = 31
                    end
                elseif n7 == 26 then
                    tbl19 = {"Haunted Crew Member"}

                    if CheckHauntedCrew() then
                        n7 = 27
                    else
                        n7 = 31
                    end
                elseif n7 == 27 then
                    v34, v35, v36 = pairs(workspace.Enemies:GetChildren())
                    v37 = v36
                    n7 = 28
                elseif n7 == 28 then
                    v38, v39 = v34(v35, v37)

                    if v38 == nil then
                        n7 = 31
                    else
                        n7 = 29
                    end
                elseif n7 == 29 then
                    v37 = v38

                    if table.find(tbl19, v39.Name) and Attack.Alive(v39) then
                        n7 = 30
                    else
                        n7 = 28
                    end
                elseif n7 == 30 then
                    task.wait()
                    Attack.Kill(v39, _G.HCM)

                    if _G.HCM ~= false and v39.Parent and v39.Humanoid.Health > 0 then
                        n7 = 30
                    else
                        n7 = 28
                    end
                elseif n7 == 31 then
                    n6 = nil

                    if _G.SeaBeast1 and workspace.SeaBeasts:FindFirstChild("SeaBeast1") then
                        n7 = 32
                    else
                        n7 = 40
                    end
                elseif n7 == 32 then
                    v40, v41, v42 = pairs(workspace.SeaBeasts:GetChildren())
                    v43 = v42
                    n7 = 33
                elseif n7 == 33 then
                    v44, v45 = v40(v41, v43)

                    if v44 == nil then
                        n7 = 40
                    else
                        n7 = 34
                    end
                elseif n7 == 34 then
                    v43 = v44

                    if v45:FindFirstChild("HumanoidRootPart") and v45:FindFirstChild("Health") and v45.Health.Value > 0 then
                        n7 = 35
                    else
                        n7 = 33
                    end
                elseif n7 == 35 then
                    task.wait()

                    spawn(function()
                        n6 = 343305555
                        _tp(CFrame.new(v45.HumanoidRootPart.Position.X, game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y + 200, v45.HumanoidRootPart.Position.Z))
                    end)

                    if plr:DistanceFromCharacter(v45.HumanoidRootPart.CFrame.Position) <= 500 then
                        n7 = 36
                    else
                        n7 = 39
                    end
                elseif n7 == 36 then
                    AitSeaSkill_Custom = v45.HumanoidRootPart.CFrame
                    MousePos = AitSeaSkill_Custom.Position

                    if CheckF() then
                        n7 = 37
                    else
                        n7 = 38
                    end
                elseif n7 == 37 then
                    weaponSc("Blox Fruit")
                    Useskills("Blox Fruit", "Z")
                    Useskills("Blox Fruit", "X")
                    Useskills("Blox Fruit", "C")
                    n7 = 39
                elseif n7 == 38 then
                    Useskills("Melee", "Z")
                    Useskills("Melee", "X")
                    Useskills("Melee", "C")
                    wait(0.1)
                    Useskills("Sword", "Z")
                    Useskills("Sword", "X")
                    wait(0.1)
                    Useskills("Blox Fruit", "Z")
                    Useskills("Blox Fruit", "X")
                    Useskills("Blox Fruit", "C")
                    wait(0.1)
                    Useskills("Gun", "Z")
                    Useskills("Gun", "X")
                    n7 = 39
                elseif n7 == 39 then
                    if _G.SeaBeast1 ~= false and v45:FindFirstChild("HumanoidRootPart") and v45.Parent and v45.Health.Value > 0 then
                        n7 = 35
                    else
                        n7 = 33
                    end
                elseif n7 == 40 then
                    if _G.Leviathan1 and workspace.SeaBeasts:FindFirstChild("Leviathan") then
                        n7 = 41
                    else
                        n7 = 49
                    end
                elseif n7 == 41 then
                    v46, v47, v48 = pairs(workspace.SeaBeasts:GetChildren())
                    v49 = v48
                    n7 = 42
                elseif n7 == 42 then
                    v50, v51 = v46(v47, v49)

                    if v50 == nil then
                        n7 = 49
                    else
                        n7 = 43
                    end
                elseif n7 == 43 then
                    v49 = v50

                    if v51:FindFirstChild("HumanoidRootPart") and v51:FindFirstChild("Leviathan Segment") and v51:FindFirstChild("Health") and v51.Health.Value > 0 then
                        n7 = 44
                    else
                        n7 = 42
                    end
                elseif n7 == 44 then
                    task.wait()

                    spawn(function()
                        _tp(CFrame.new(v51.HumanoidRootPart.Position.X, game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y + 200, v51.HumanoidRootPart.Position.Z))
                    end)

                    if plr:DistanceFromCharacter(v51.HumanoidRootPart.CFrame.Position) <= 500 then
                        n7 = 45
                    else
                        n7 = 48
                    end
                elseif n7 == 45 then
                    position = v51:FindFirstChild("Leviathan Segment").Position
                    MousePos = position

                    if CheckF() then
                        n7 = 46
                    else
                        n7 = 47
                    end
                elseif n7 == 46 then
                    weaponSc("Blox Fruit")
                    Useskills("Blox Fruit", "Z")
                    Useskills("Blox Fruit", "X")
                    Useskills("Blox Fruit", "C")
                    n7 = 48
                elseif n7 == 47 then
                    Useskills("Melee", "Z")
                    Useskills("Melee", "X")
                    Useskills("Melee", "C")
                    wait(0.1)
                    Useskills("Sword", "Z")
                    Useskills("Sword", "X")
                    wait(0.1)
                    Useskills("Blox Fruit", "Z")
                    Useskills("Blox Fruit", "X")
                    Useskills("Blox Fruit", "C")
                    wait(0.1)
                    Useskills("Gun", "Z")
                    Useskills("Gun", "X")
                    n7 = 48
                elseif n7 == 48 then
                    if _G.Leviathan1 ~= false and v51:FindFirstChild("HumanoidRootPart") and v51.Parent and v51.Health.Value > 0 then
                        n7 = 44
                    else
                        n7 = 42
                    end
                elseif n7 == 49 then
                    if _G.FishBoat and CheckEnemiesBoat() then
                        n7 = 50
                    else
                        n7 = 58
                    end
                elseif n7 == 50 then
                    v52, v53, v54 = pairs(workspace.Enemies:GetChildren())
                    v55 = v54
                    n7 = 51
                elseif n7 == 51 then
                    v56, v57 = v52(v53, v55)

                    if v56 == nil then
                        n7 = 58
                    else
                        n7 = 52
                    end
                elseif n7 == 52 then
                    v55 = v56

                    if v57:FindFirstChild("Health") and v57.Health.Value > 0 and v57:FindFirstChild("VehicleSeat") then
                        n7 = 53
                    else
                        n7 = 51
                    end
                elseif n7 == 53 then
                    task.wait()

                    spawn(function()
                        if v57.Name == "FishBoat" then
                            _tp(v57.Engine.CFrame * CFrame.new(0, -50, -25))
                        end
                    end)

                    if plr:DistanceFromCharacter(v57.Engine.CFrame.Position) <= 150 then
                        n7 = 54
                    else
                        n7 = 57
                    end
                elseif n7 == 54 then
                    AitSeaSkill_Custom = v57.Engine.CFrame
                    MousePos = AitSeaSkill_Custom.Position

                    if CheckF() then
                        n7 = 55
                    else
                        n7 = 56
                    end
                elseif n7 == 55 then
                    weaponSc("Blox Fruit")
                    Useskills("Blox Fruit", "Z")
                    Useskills("Blox Fruit", "X")
                    Useskills("Blox Fruit", "C")
                    n7 = 57
                elseif n7 == 56 then
                    Useskills("Melee", "Z")
                    Useskills("Melee", "X")
                    Useskills("Melee", "C")
                    wait(0.1)
                    Useskills("Sword", "Z")
                    Useskills("Sword", "X")
                    wait(0.1)
                    Useskills("Blox Fruit", "Z")
                    Useskills("Blox Fruit", "X")
                    Useskills("Blox Fruit", "C")
                    wait(0.1)
                    Useskills("Gun", "Z")
                    Useskills("Gun", "X")
                    n7 = 57
                elseif n7 == 57 then
                    if _G.FishBoat ~= false and v57:FindFirstChild("VehicleSeat") and v57.Health.Value > 0 then
                        n7 = 53
                    else
                        n7 = 51
                    end
                elseif n7 == 58 then
                    if _G.PGB and CheckPirateGrandBrigade() then
                        n7 = 59
                    else
                        n7 = 67
                    end
                elseif n7 == 59 then
                    v58, v59, v60 = pairs(workspace.Enemies:GetChildren())
                    v61 = v60
                    n7 = 60
                elseif n7 == 60 then
                    v62, v63 = v58(v59, v61)

                    if v62 == nil then
                        n7 = 67
                    else
                        n7 = 61
                    end
                elseif n7 == 61 then
                    v61 = v62

                    if v63:FindFirstChild("Health") and v63.Health.Value > 0 and v63:FindFirstChild("VehicleSeat") then
                        n7 = 62
                    else
                        n7 = 60
                    end
                elseif n7 == 62 then
                    task.wait()

                    spawn(function()
                        if v63.Name == "PirateBrigade" then
                            _tp(v63.Engine.CFrame * CFrame.new(0, -30, -10))
                        elseif v63.Name == "PirateGrandBrigade" then
                            _tp(v63.Engine.CFrame * CFrame.new(0, -50, -50))
                        end
                    end)

                    if plr:DistanceFromCharacter(v63.Engine.CFrame.Position) <= 150 then
                        n7 = 63
                    else
                        n7 = 66
                    end
                elseif n7 == 63 then
                    AitSeaSkill_Custom = v63.Engine.CFrame
                    MousePos = AitSeaSkill_Custom.Position

                    if CheckF() then
                        n7 = 64
                    else
                        n7 = 65
                    end
                elseif n7 == 64 then
                    weaponSc("Blox Fruit")
                    Useskills("Blox Fruit", "Z")
                    Useskills("Blox Fruit", "X")
                    Useskills("Blox Fruit", "C")
                    n7 = 66
                elseif n7 == 65 then
                    Useskills("Melee", "Z")
                    Useskills("Melee", "X")
                    Useskills("Melee", "C")
                    wait(0.1)
                    Useskills("Sword", "Z")
                    Useskills("Sword", "X")
                    wait(0.1)
                    Useskills("Blox Fruit", "Z")
                    Useskills("Blox Fruit", "X")
                    Useskills("Blox Fruit", "C")
                    wait(0.1)
                    Useskills("Gun", "Z")
                    Useskills("Gun", "X")
                    n7 = 66
                elseif n7 == 66 then
                    if _G.PGB ~= false and v63:FindFirstChild("VehicleSeat") and v63.Health.Value > 0 then
                        n7 = 62
                    else
                        n7 = 60
                    end
                elseif n7 == 67 then
                    return
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        if _G.AutofindKitIs then
            pcall(function()
                if workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island", true) then
                    _tp(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame * CFrame.new(0, 500, 0))
                else
                    local v10 = CheckBoat()

                    if v10 then
                        if plr.Character.Humanoid.Sit == false then
                            local n4 = v10.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
                            _tp(n4)
                        else
                            local cframe3 = CFrame.new(-10000000, 31, 37016.25)

                            repeat
                                wait()

                                if not CheckEnemiesBoat() and not CheckTerrorShark() and not CheckPirateGrandBrigade() then
                                    _tp(CFrame.new(-10000000, 31, 37016.25))
                                else
                                    _tp(CFrame.new(-10000000, 150, 37016.25))
                                end
                            until not _G.AutofindKitIs or (cframe3.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 or workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") or plr.Character.Humanoid.Sit == false

                            plr.Character.Humanoid.Sit = false
                        end
                    else
                        local cframe3 = CFrame.new(-16927.451, 9.086, 433.864)
                        TeleportToTarget(cframe3)

                        if (cframe3.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait(0.1) do
        if _G.tweenShrine then
            pcall(function()
                local kitsuneIsland, kitsuneIsland2, shrineActive, v10, descendants, v11, v12, v13, v14, n4
                n4 = 1

                while true do
                    if n4 == 1 then
                        kitsuneIsland = workspace.Map:FindFirstChild("KitsuneIsland")
                        kitsuneIsland2 = kitsuneIsland

                        if kitsuneIsland then
                            n4 = 3
                        else
                            n4 = 2
                        end
                    elseif n4 == 2 then
                        kitsuneIsland2 = game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island")
                        n4 = 3
                    elseif n4 == 3 then
                        shrineActive = kitsuneIsland2:FindFirstChild("ShrineActive")

                        if shrineActive then
                            n4 = 4
                        else
                            n4 = 9
                        end
                    elseif n4 == 4 then
                        v10 = next
                        descendants, v11 = shrineActive:GetDescendants()
                        v12 = v11
                        n4 = 5
                    elseif n4 == 5 then
                        v13, v14 = v10(descendants, v12)

                        if v13 == nil then
                            n4 = 10
                        else
                            n4 = 6
                        end
                    elseif n4 == 6 then
                        v12 = v13

                        if v14:IsA("BasePart") and v14.Name:find("NeonShrinePart") then
                            n4 = 7
                        else
                            n4 = 5
                        end
                    elseif n4 == 7 then
                        replicated.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()
                        n4 = 8
                    elseif n4 == 8 then
                        wait()
                        _tp(v14.CFrame * CFrame.new(0, 2, 0))

                        if _G.tweenShrine ~= false and kitsuneIsland2 then
                            n4 = 8
                        else
                            n4 = 5
                        end
                    elseif n4 == 9 then
                        _tp(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame * CFrame.new(0, 500, 0))
                        n4 = 10
                    elseif n4 == 10 then
                        return
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait(0.1) do
        if _G.Collect_Ember then
            pcall(function()
                if not workspace:WaitForChild("AttachedAzureEmber") and not workspace:WaitForChild("EmberTemplate") then
                    _tp(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame * CFrame.new(0, 500, 0))
                    replicated.Modules.Net["RF/KitsuneStatuePray"]:InvokeServer()
                else
                    notween(workspace:WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame)
                end
            end)
        end
    end
end)

spawn(function()
    while wait(0.1) do
        if _G.Trade_Ember then
            pcall(function()
                if workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island", true) then
                    replicated.Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
                end
            end)
        end
    end
end)

spawn(function()
    while wait(0.1) do
        if _G.FrozenTP then
            pcall(function()
                if workspace.Map:FindFirstChild("LeviathanGate") then
                    _tp(workspace.Map.LeviathanGate.CFrame)
                    replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("OpenLeviathanGate")
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.SailBoat_Hydra then
            pcall(function()
                local v10 = CheckBoat()

                if v10 then
                    if v10 then
                        if plr.Character.Humanoid.Sit == false then
                            local n4 = v10.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
                            _tp(n4)
                        else
                            repeat
                                wait()

                                if not CheckEnemiesBoat() and not CheckPirateGrandBrigade() and not CheckTerrorShark() then
                                    _tp(CFrame.new(5433, 35, 290))
                                else
                                    _tp(CFrame.new(5433, 150, 290))
                                end
                            until _G.SailBoat_Hydra == false or plr.Character:WaitForChild("Humanoid").Sit == false

                            plr.Character.Humanoid.Sit = false
                        end
                    end
                else
                    local cframe3 = CFrame.new(-16927.451, 9.086, 433.864)
                    TeleportToTarget(cframe3)

                    if (cframe3.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
                    end
                end
            end)
        end
    end
end)

isnil = function(arg)
    local flag7 = arg == nil
    return flag7
end

round = function(arg)
    return math.floor(tonumber(arg) + 0.5)
end

formatNumber = function(arg)
    local str = tostring(arg)
    local str2, v10

    repeat
        str2, v10 = str:gsub("^(-?%d+)(%d%d%d)", "%1,%2")
        str = str2
    until v10 == 0

    return str2
end

getFruitStock = function()
    local str = "Advance Fruit Stock\n"

    local ok, result = pcall(function()
        return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits", true)
    end)

    if ok and result then
        local flag7 = false

        for k, v10 in pairs(result) do
            if v10.OnSale then
                flag7 = true
                str = str .. v10.Name .. " - $" .. formatNumber(v10.Price) .. "\n"
            end
        end

        if not flag7 then
            str = str .. "- No fruit.\n"
        end
    else
        str = "Advance Fruit Stock\n- Error while retrieving data.\n"
    end

    local str2 = str .. "\nNormal Fruit Stock\n"
    local str3 = str2

    local ok2, result2 = pcall(function()
        return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
    end)

    if ok2 and result2 then
        local flag7 = false

        for k, v10 in pairs(result2) do
            if v10.OnSale then
                flag7 = true
                str3 = str3 .. v10.Name .. " - $" .. formatNumber(v10.Price) .. "\n"
            end
        end

        if not flag7 then
            str3 = str3 .. "- No fruit.\n"
        end
    else
        str3 = str2 .. "- Error while retrieving data.\n"
    end

    return str3
end

spawn(function()
    while wait(5) do
        pcall(function()
            if not _G.Random_Auto then
                return
            end
            local spinnerWindow = plr.PlayerGui:FindFirstChild("SpinnerWindow")

            if spinnerWindow then
                local aboveSpinner = spinnerWindow:FindFirstChild("AboveSpinner")
                local closeButton = aboveSpinner and spinnerWindow.AboveSpinner:FindFirstChild("Navigation") and spinnerWindow.AboveSpinner.Navigation:FindFirstChild("CloseButton")

                if closeButton and closeButton.Visible then
                    pcall(function()
                        for k, v10 in pairs(getconnections(closeButton.Activated)) do
                            if v10.Function then
                                v10.Function()
                            elseif v10.Fire then
                                v10:Fire()
                            end
                        end
                    end)
                end
            end

            if plr.Data.Level.Value < 50 then
                return
            end

            if RandomFruitCooldown and tick() < RandomFruitCooldown then
                return
            end
            local GachaClient = require(replicated.Controllers.GachaClient)

            local ok, result, result2 = pcall(function()
                return GachaClient.PurchaseGachaAsync("ZiolesGacha")
            end)

            if ok and type(result2) == "table" then
                if result2.Cooldown and result2.Cooldown.TimeEnds then
                    local n4 = result2.Cooldown.TimeEnds - os.time()

                    if n4 > 0 then
                        local n5 = tick() + n4
                        RandomFruitCooldown = n5
                        return
                    end
                end

                if result2.RequirementsMet == false then
                    local n4 = tick() + 600
                    RandomFruitCooldown = n4
                    return
                end

                if result == true then
                    local n4 = tick() + 7200
                    RandomFruitCooldown = n4
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.DropFruit then
            pcall(function()
                DropFruits()
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.StoreF then
            pcall(function()
                UpdStFruit()
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.TwFruits then
            pcall(function()
                local v10 = GetNearestFruit()

                if v10 then
                    _tp(v10.CFrame)
                end
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.InstanceF then
            pcall(function()
                collectFruits(_G.InstanceF)
            end)
        end
    end
end)

spawn(function()
    pcall(function()
        while wait() do
            if getgenv().AutoBuyFruitSniper then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit", getgenv().SelectFruit)
            end
        end
    end)
end)

spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoGetFruit then
                for i, v10 in ipairs({
                    "Rocket-Rocket",
                    "Spin-Spin",
                    "Chop-Chop",
                    "Spring-Spring",
                    "Bomb-Bomb",
                    "Smoke-Smoke",
                    "Spike-Spike",
                    "Flame-Flame",
                    "Falcon-Falcon",
                    "Ice-Ice",
                    "Sand-Sand",
                    "Dark-Dark",
                    "Ghost-Ghost",
                    "Diamond-Diamond",
                    "Light-Light",
                    "Rubber-Rubber",
                    "Barrier-Barrier",
                }) do
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({"LoadFruit", v10}))
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(1) do
        if _G.AutoChipBeli then
            pcall(function()
                if not GetBP("Special Microchip") then
                    replicated.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if _G.AutoChipFruit then
            pcall(function()
                if not GetBP("Special Microchip") then
                    local name = nil
                    local response = replicated.Remotes.CommF_:InvokeServer("GetFruits")

                    for k, v10 in pairs(response) do
                        if v10.Price <= 490000 then
                            name = v10.Name
                            break
                        end
                    end

                    if name then
                        replicated.Remotes.CommF_:InvokeServer("LoadFruit", tostring(name))
                        replicated.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
                    end
                end
            end)
        end
    end
end)

IsRaidActive = function()
    local ok, result = pcall(function()
        if plr.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
            return true
        end
        local attribute = plr:GetAttribute("IslandRaiding")
        local flag7 = attribute ~= nil and attribute ~= false and attribute ~= ""
        return flag7
    end)

    local flag7 = ok and result == true
    return flag7
end

task.spawn(function()
    local n4 = 0

    while task.wait(0.5) do
        if _G.Auto_StartRaid then
            pcall(function()
                if IsRaidActive() or tick() - n4 < 25 then
                    return
                end

                if not GetBP("Special Microchip") then
                    return
                end
                local cframe3 = nil

                if World2 then
                    cframe3 = CFrame.new(-6438.73535, 250.645355, -4501.50684)
                elseif World3 then
                    cframe3 = CFrame.new(-5046, 314, -2960)
                end

                if not cframe3 then
                    return
                end
                local character3 = plr.Character
                local humanoidRootPart2 = character3 and plr.Character:FindFirstChild("HumanoidRootPart")
                if not humanoidRootPart2 then
                    return
                end

                if (humanoidRootPart2.Position - cframe3.Position).Magnitude > 30 then
                    _tp(cframe3)
                    return
                end

                if World2 then
                    fireclickdetector(workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                else
                    local main = workspace.Map["Boat Castle"].RaidSummon2.Button.Main

                    if main and main:FindFirstChild("ClickDetector") then
                        fireclickdetector(main.ClickDetector)
                    end
                end

                n4 = tick()
            end)
        end
    end
end)

spawn(function()
    local locations = workspace._WorldOrigin.Locations
    local n4 = 1
    local flag7 = false
    local n5 = 0
    local position = nil

    findIsland = function(arg, arg2)
        local v10 = nil
        local v11 = nil

        for i, child in ipairs(locations:GetChildren()) do
            if child.Name == "Island " .. arg then
                local magnitude = (child.Position - arg2).Magnitude

                if not v11 or magnitude < v11 then
                    v10 = child
                    v11 = magnitude
                end
            end
        end

        return v10
    end

    while task.wait(0.3) do
        if _G.Raiding then
            pcall(function()
                if not IsRaidActive() then
                    flag7 = false
                    position = nil
                    n5 = 0
                    return
                end

                local character3 = plr.Character
                local humanoidRootPart2 = character3 and character3:FindFirstChild("HumanoidRootPart")
                local humanoid = character3 and character3:FindFirstChildOfClass("Humanoid")
                if not humanoidRootPart2 or not humanoid or humanoid.Health <= 0 then
                    return
                end

                if humanoid.Sit or humanoid.PlatformStand or humanoidRootPart2.Anchored then
                    return
                end

                if not flag7 then
                    flag7 = true
                    position = nil
                    n5 = 0
                    n4 = 1
                    local n6 = 1500

                    for i = 1, 5 do
                        local v10 = findIsland(i, humanoidRootPart2.Position)

                        if v10 then
                            local magnitude = (humanoidRootPart2.Position - v10.Position).Magnitude

                            if magnitude < n6 then
                                n6 = magnitude
                                n4 = i
                            end
                        end
                    end
                end

                local v10 = findIsland
                local v11 = n4
                local v12 = position
                local position2 = v12 or humanoidRootPart2.Position
                local v13 = v10(v11, position2)
                if not v13 then
                    return
                end

                if not position and (humanoidRootPart2.Position - v13.Position).Magnitude <= 600 then
                    position = v13.Position
                end

                if _G.KillAuraRaid and (n4 == 4 or n4 == 5) then
                    sethiddenproperty(plr, "SimulationRadius", math.huge)

                    for i, child in ipairs(workspace.Enemies:GetChildren()) do
                        if child:FindFirstChild("Humanoid") and child:FindFirstChild("HumanoidRootPart") and (child.HumanoidRootPart.Position - humanoidRootPart2.Position).Magnitude <= 500 and child.Humanoid.Health > 0 then
                            child.Humanoid.Health = 0
                            child.HumanoidRootPart.CanCollide = false
                            child:BreakJoints()
                        end
                    end
                end

                if (humanoidRootPart2.Position - v13.Position).Magnitude > 600 then
                    n5 = 0
                    _tp(v13.CFrame * CFrame.new(0, 60, 0))
                    return
                end

                local flag8 = false

                for i, child in ipairs(workspace.Enemies:GetChildren()) do
                    local humanoid2 = child:FindFirstChild("Humanoid")
                    local humanoidRootPart3 = child:FindFirstChild("HumanoidRootPart")

                    if humanoid2 and humanoidRootPart3 and humanoid2.Health > 0 and (humanoidRootPart3.Position - v13.Position).Magnitude < 800 then
                        flag8 = true
                        local n6 = tick() + 25

                        repeat
                            task.wait()
                            Attack.Kill(child, _G.Raiding)
                        until not _G.Raiding or not child.Parent or humanoid2.Health <= 0 or not IsRaidActive() or n6 < tick()

                        if not _G.Raiding or not IsRaidActive() then
                            return
                        end
                    end
                end

                if flag8 then
                    n5 = 0
                else
                    n5 = n5 + 1

                    if n5 > 15 then
                        local v14 = findIsland
                        local n6 = n4 + 1
                        local v15 = position
                        local position3 = v15 or v13.Position
                        local v16 = v14(n6, position3)

                        if v16 then
                            n4 = n4 + 1
                            n5 = 0
                            _tp(v16.CFrame * CFrame.new(0, 60, 0))
                        else
                            _tp(v13.CFrame * CFrame.new(0, 60, 0))
                        end
                    end
                end
            end)
        else
            flag7 = false
            position = nil
        end
    end
end)

spawn(function()
    while task.wait() do
        if _G.TpPly and _G.PlayersList then
            pcall(function()
                local v10 = game:GetService("Players"):FindFirstChild(_G.PlayersList)

                if v10 and v10.Character and v10.Character:FindFirstChild("HumanoidRootPart") then
                    _tp(v10.Character.HumanoidRootPart.CFrame)
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait(0.1) do
        if SpectatePlys and _G.PlayersList then
            pcall(function()
                local v10 = game:GetService("Players"):FindFirstChild(_G.PlayersList)

                if v10 and v10.Character and v10.Character:FindFirstChild("Humanoid") then
                    workspace.Camera.CameraSubject = v10.Character.Humanoid
                end
            end)
        end
    end
end)

ListServers = function(arg)
    local HttpService = game:GetService("HttpService")
    local str = tostring(game.PlaceId)
    local str2 = arg and "&cursor=" .. arg or ""
    local str3 = "https://games.roblox.com/v1/games/" .. str .. "/servers/Public?sortOrder=Asc&limit=100" .. str2

    local ok, result = pcall(function()
        return game:HttpGet(str3)
    end)

    if ok and result then
        local ok2, result2 = pcall(function()
            return HttpService:JSONDecode(result)
        end)

        if ok2 then
            return result2
        end
    end

    return {data = {}}
end

fetchServersData = function(arg, arg2)
    local format = string.format
    local n4 = arg2 or 100
    local v10 = format("https://games.roblox.com/v1/games/%d/servers/Public?limit=%d", arg, n4)

    local ok, result = pcall(function()
        return game:GetService("HttpService"):JSONDecode(game:HttpGet(v10))
    end)

    if ok and result and result.data then
        return result.data
    end
    return nil
end

local localPlayer2 = game.Players.LocalPlayer

IsEntityAlive = function(arg)
    if not arg then
        return false
    end
    local humanoid = arg:FindFirstChild("Humanoid")
    local flag7 = humanoid and humanoid.Health > 0
    return flag7
end

GetEnemiesInRange = function(arg, arg2)
    local tbl15 = {}
    local position = arg:GetPivot().Position
    local players = game:GetService("Players"):GetPlayers()
    local children = game:GetService("Workspace").Enemies:GetChildren()

    for i, child in ipairs(children) do
        local humanoidRootPart2 = child:FindFirstChild("HumanoidRootPart")

        if humanoidRootPart2 and IsEntityAlive(child) and (humanoidRootPart2.Position - position).Magnitude <= arg2 then
            table.insert(tbl15, child)
        end
    end

    for i, player in ipairs(players) do
        if player ~= plr and player.Character then
            local humanoidRootPart2 = player.Character:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart2 and IsEntityAlive(player.Character) and (humanoidRootPart2.Position - position).Magnitude <= arg2 then
                table.insert(tbl15, player.Character)
            end
        end
    end

    return tbl15
end

AttackNoCoolDown = function()
    local character3 = plr.Character
    if not character3 then
        return
    end
    local v10 = nil

    for i, child in ipairs(character3:GetChildren()) do
        if child:IsA("Tool") then
            v10 = child
            break
        end
        continue
    end

    if not v10 then
        return
    end
    local v11 = GetEnemiesInRange(character3, 60)
    if #v11 == 0 then
        return
    end
    local ReplicatedStorage3 = game:GetService("ReplicatedStorage")
    local modules = ReplicatedStorage3:FindFirstChild("Modules")
    if not modules then
        return
    end
    local reRegisterAttack = ReplicatedStorage3:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack")
    local reRegisterHit = ReplicatedStorage3:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit")
    if not reRegisterAttack or not reRegisterHit then
        return
    end
    local tbl15 = {}
    local v12 = nil

    for i, v13 in ipairs(v11) do
        if not v13:GetAttribute("IsBoat") then
            local tbl16 = {
                "RightLowerArm",
                "RightUpperArm",
                "LeftLowerArm",
                "LeftUpperArm",
                "RightHand",
                "LeftHand",
            }

            local v14 = v13:FindFirstChild(tbl16[math.random(#tbl16)])
            local primaryPart = v14 or v13.PrimaryPart

            if primaryPart then
                table.insert(tbl15, {v13, primaryPart})
                v12 = primaryPart
            end
        end
    end

    if not v12 then
        return
    end
    reRegisterAttack:FireServer(0)
    local playerScripts = plr:FindFirstChild("PlayerScripts")
    if not playerScripts then
        return
    end
    local localScript = playerScripts:FindFirstChildOfClass("LocalScript")

    while not localScript do
        playerScripts.ChildAdded:Wait()
        localScript = playerScripts:FindFirstChildOfClass("LocalScript")
    end

    local sendHitsToServer = nil

    if getsenv then
        local ok, result = pcall(getsenv, localScript)

        if ok and result then
            sendHitsToServer = result._G.SendHitsToServer
        end
    end

    local ok, result = pcall(function()
        local combatRemoteThread = require(modules.Flags).COMBAT_REMOTE_THREAD
        local flag7 = combatRemoteThread or false
        return flag7
    end)

    if ok and result and sendHitsToServer then
        sendHitsToServer(v12, tbl15)
    elseif ok and not result then
        reRegisterHit:FireServer(v12, tbl15)
    end
end

local CameraShaker = require(game.ReplicatedStorage.Util.CameraShaker)
CameraShakerR = CameraShaker
CameraShakerR:Stop()

get_Monster = function()
    for k, child in pairs(workspace.Enemies:GetChildren()) do
        local upperTorso = child:FindFirstChild("UpperTorso")
        local head = upperTorso or child:FindFirstChild("Head")
        if child:FindFirstChild("HumanoidRootPart", true) and head and (child.Head.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 50 then
            return true, head.Position
        end
    end

    for k, child in pairs(workspace.SeaBeasts:GetChildren()) do
        if child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Health") and child.Health.Value > 0 then
            return true, child.HumanoidRootPart.Position
        end
    end

    for k, child in pairs(workspace.Enemies:GetChildren()) do
        if child:FindFirstChild("Health") and child.Health.Value > 0 and child:FindFirstChild("VehicleSeat") then
            return true, child.Engine.Position
        end
    end
end

Actived = function()
    local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
    local v10 = next
    local v11, v12 = getconnections(tool.Activated)

    for k, v13 in v10, v11, v12 do
        if typeof(v13.Function) == "function" then
            getupvalues(v13.Function)
        end
    end
end

task.spawn(function()
    RunSer.Heartbeat:Connect(function()
        pcall(function()
            if not _G.Seriality then
                return
            end
            AttackNoCoolDown()
            local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
            local toolTip = tool.ToolTip
            local v10 = get_Monster()

            if toolTip == "Blox Fruit" and v10 then
                local leftClickRemote = tool:FindFirstChild("LeftClickRemote")

                if leftClickRemote then
                    Actived()
                    leftClickRemote:FireServer(Vector3.new(0.01, -500, 0.01), 1, true)
                    leftClickRemote:FireServer(false)
                end
            end
        end)
    end)
end)

local tbl15 = {}
local tbl16 = {}
local v10 = game
local Players2 = v10:GetService("Players")
local RunService2 = v10:GetService("RunService")
local ReplicatedStorage3 = v10:GetService("ReplicatedStorage")
local Workspace = v10:GetService("Workspace")
local localPlayer3 = Players2.LocalPlayer

if not localPlayer3.Character then
    localPlayer3.CharacterAdded:Wait()
end

SafeWaitForChild = function(arg, arg2)
    local ok, result = pcall(function()
        return arg:WaitForChild(arg2)
    end)

    return result
end

local v11 = SafeWaitForChild(Workspace, "Enemies")
local v12 = SafeWaitForChild(Workspace, "Characters")
local v13 = SafeWaitForChild(ReplicatedStorage3, "Modules")
local v14 = SafeWaitForChild(v13, "Net")
tbl15.Rate = 2e-09
tbl15.Enabled = true

tbl15.IsAlive = function(arg)
    local humanoid = arg:FindFirstChild("Humanoid")
    if humanoid and humanoid.Health > 0 then
        return true
    end
    return false
end

tbl15.GetNearbyTargets = function(arg, arg2)
    local tbl17 = {}
    local position = arg:GetPivot().Position
    local children = arg2:GetChildren()

    for i = 1, #children do
        local v15 = children[i]
        local humanoid = v15:FindFirstChild("Humanoid")
        local humanoidRootPart2 = v15:FindFirstChild("HumanoidRootPart")

        if humanoid and humanoidRootPart2 and humanoid.Health > 0 and (humanoidRootPart2.Position - position).Magnitude <= 60 then
            table.insert(tbl17, v15)
        end
    end

    return tbl17
end

tbl15.GetTargetParts = function(arg)
    local tbl17 = {}

    for i = 1, #arg do
        local v15 = arg[i]
        local head = v15:FindFirstChild("Head")
        local primaryPart = head or v15.PrimaryPart

        if primaryPart then
            table.insert(tbl17, {v15, primaryPart})
        end
    end

    return tbl17
end

tbl15.GetAllTargets = function(arg)
    local tbl17 = {}
    local v15 = tbl15.GetNearbyTargets(arg, v11)
    local v16 = tbl15.GetNearbyTargets(arg, v12)

    for i = 1, #v15 do
        table.insert(tbl17, v15[i])
    end

    for i = 1, #v16 do
        table.insert(tbl17, v16[i])
    end

    return tbl17
end

tbl15.ExecuteFastAttack = function()
    local character3 = localPlayer3.Character
    if not character3 then
        return
    end

    if not character3:FindFirstChildOfClass("Tool") then
        return
    end
    local v15 = tbl15.GetAllTargets(character3)
    if #v15 < 1 then
        return
    end
    local v16 = tbl15.GetTargetParts(v15)
    if #v16 < 1 then
        return
    end
    local reRegisterHit = v14["RE/RegisterHit"]
    v14["RE/RegisterAttack"]:FireServer(tbl15.Rate)
    reRegisterHit:FireServer(v16[1][2], v16)
end

local v15 = nil
local attribute = nil

InitializeHitRegistration = function()
    local tbl17 = {
        ReplicatedStorage3.Util,
        ReplicatedStorage3.Common,
        ReplicatedStorage3.Remotes,
        ReplicatedStorage3.Assets,
        ReplicatedStorage3.FX,
    }

    local v16, v17, v18 = ipairs(tbl17)
    local v19 = v18
    local v20 = v16
    local v21 = v17

    while true do
        local v22, v23 = v20(v21, v19)
        if v22 == nil then
            break
        end
        local children = v23:GetChildren()

        for i, child in ipairs(children) do
            if child:IsA("RemoteEvent") and child:GetAttribute("Id") then
                v15 = child
                attribute = child:GetAttribute("Id")
            end
        end

        v19 = v22

        v23.ChildAdded:Connect(function(child)
            if child:IsA("RemoteEvent") and child:GetAttribute("Id") then
                v15 = child
                attribute = child:GetAttribute("Id")
            end
        end)
    end
end

InitializeHitRegistration()

tbl16.Execute = function()
    local character3 = localPlayer3.Character
    if not character3 then
        return
    end
    local humanoidRootPart2 = character3:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart2 then
        return
    end
    local tbl17 = {}

    ScanFolder = function(arg)
        local children = arg:GetChildren()
        local n4 = 0
        local n5 = #children + 0

        while true do
            local n6 = n4 + 1
            if n6 > n5 then
                break
            end
            n4 = n6
            local v16 = children[n6]
            local humanoid = v16:FindFirstChild("Humanoid")
            local humanoidRootPart3 = v16:FindFirstChild("HumanoidRootPart")

            if humanoid and humanoidRootPart3 and humanoid.Health > 0 and v16 ~= character3 and (humanoidRootPart3.Position - humanoidRootPart2.Position).Magnitude <= 60 then
                local children2 = v16:GetChildren()

                for i, v17 in ipairs(children2) do
                    if v17:IsA("BasePart") then
                        table.insert(tbl17, {v16, v17})
                    end
                end

                n4 = n6
            end
        end
    end

    ScanFolder(v11)
    ScanFolder(v12)
    local tool = character3:FindFirstChildOfClass("Tool")

    if #tbl17 > 0 and tool and (tool:GetAttribute("WeaponType") == "Melee" or tool:GetAttribute("WeaponType") == "Sword") then
        local response = v13.Net.seed:InvokeServer()
        local reRegisterHit = v14["RE/RegisterHit"]
        v14["RE/RegisterAttack"]:FireServer()
        local head = tbl17[1][1]:FindFirstChild("Head")
        if not head then
            return
        end
        reRegisterHit:FireServer(head, tbl17, {})

        if v15 then
            local n4 = math.floor(Workspace:GetServerTimeNow() / 10 % 10) + 1

            local RegisterHit = string.gsub("RE/RegisterHit", ".", function(arg)
                return string.char(bit32.bxor(string.byte(arg), n4))
            end)

            local v16 = bit32.bxor(attribute + 909090, response * 2)
            cloneref(v15):FireServer(RegisterHit, v16, head, tbl17)
        end
    end
end

DisableCameraShake = function()
    require(ReplicatedStorage3.Util.CameraShaker):Stop()
end

StartMainLoops = function()
    task.spawn(function()
        while task.wait(tbl15.Rate) do
            tbl15.ExecuteFastAttack()
        end
    end)

    RunService2.Heartbeat:Connect(function()
        pcall(tbl16.Execute)
    end)
end

StartMainLoops()

task.spawn(function()
    while task.wait(Sec) do
        if _G.Level then
            pcall(function()
                local character3 = plr.Character
                local result = character3 or plr.CharacterAdded:Wait()
                local humanoidRootPart2 = result:WaitForChild("HumanoidRootPart")
                if not humanoidRootPart2 then
                    return
                end
                local value = plr.Data.Level.Value
                local v16 = IsInSubmergedIsland()
                GuiShown("Quest")
                QuestText()

                if World3 and value >= 2600 and not v16 then
                    local cframe3 = cframe2 or CFrame.new(-16269.7041, 25.2288494, 1373.65955)
                    if (humanoidRootPart2.Position - cframe3.Position).Magnitude > 15 then
                        _tp(cframe3)
                        return
                    end

                    pcall(function()
                        local net = game:GetService("ReplicatedStorage").Modules.Net
                        net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer("AskKilledTikiBoss")
                        task.wait(0.5)
                        net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer("TravelToSubmergedIsland")
                    end)

                    local now = tick()

                    repeat
                        task.wait(0.5)
                    until not _G.Level or IsInSubmergedIsland() or tick() - now > 10

                    return
                end

                local v17 = QuestNeta()

                if v17 and v17[1] then
                    local Quest = GuiShown("Quest")
                    local v18 = Quest

                    if Quest then
                        local v19 = CheckHasQuest
                        local v20 = v17[5]
                        local v21 = v20 or v17[1]
                        v18 = v19(v21)
                    end

                    if GuiShown("Quest") and not v18 then
                        replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
                        task.wait(0.2)
                        return
                    end

                    if not v18 then
                        local v19 = v17[6]

                        if v19 then
                            _tp(v19)
                            task.wait(2)

                            if (humanoidRootPart2.Position - v19.Position).Magnitude <= 10 then
                                local v20 = BFAcceptQuest
                                local v21 = v17[3]
                                local v22 = v17[2]
                                local v23 = v17[5]
                                local v24 = v23 or v17[1]
                                v20(v21, v22, v24)
                            end
                        else
                            local v20 = BFAcceptQuest
                            local v21 = v17[3]
                            local v22 = v17[2]
                            local v23 = v17[5]
                            local v24 = v23 or v17[1]
                            v20(v21, v22, v24)
                        end

                        return
                    end

                    local v19 = v17[1]
                    local flag7 = false

                    for k, child in pairs(workspace.Enemies:GetChildren()) do
                        if string.find(child.Name, v19, 1, true) and Attack.Alive(child) then
                            local humanoidRootPart3 = child:FindFirstChild("HumanoidRootPart")

                            if humanoidRootPart3 then
                                flag7 = true

                                repeat
                                    task.wait(Sec)
                                    if not Attack.Alive(child) or not humanoidRootPart3.Parent then
                                        break
                                    end
                                    _tp(humanoidRootPart3.CFrame * CFrame.new(0, 20, 0))
                                    Attack.Kill(child, _G.Level)
                                until not GuiShown("Quest") or not _G.Level or not child.Parent or not Attack.Alive(child)

                                break
                            end

                            continue
                        end
                    end

                    if not flag7 then
                        for k, child in pairs(replicated:GetChildren()) do
                            if string.find(child.Name, v19, 1, true) and Attack.Alive(child) then
                                local humanoidRootPart3 = child:FindFirstChild("HumanoidRootPart")

                                if humanoidRootPart3 then
                                    flag7 = true
                                    _tp(humanoidRootPart3.CFrame * CFrame.new(0, 20, 0))
                                    break
                                end

                                continue
                            end
                        end
                    end

                    if not flag7 then
                        for k, child in pairs(workspace._WorldOrigin.EnemySpawns:GetChildren()) do
                            if string.find(child.Name, v19, 1, true) then
                                _tp(child.CFrame * CFrame.new(0, 20, 0))
                                flag7 = true
                                break
                            end

                            continue
                        end
                    end

                    if not flag7 and PosMon then
                        _tp(CFrame.new(PosMon) * CFrame.new(0, 20, 0))
                    end

                    return
                end

                task.wait(1)
            end)
        else
            teleporting = false
            alreadyTeleported = false
        end
    end
end)

localPlayer2 = game:GetService("Players").LocalPlayer
local ReplicatedStorage4 = game:GetService("ReplicatedStorage")

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Awakener then
                ReplicatedStorage4.Remotes.CommF_:InvokeServer("Awakener", "Check")
                ReplicatedStorage4.Remotes.CommF_:InvokeServer("Awakener", "Awaken")
            end
        end)
    end
end)

spawn(function()
    while task.wait(1) do
        if getgenv().AutoBuyMicrochipLaw then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
            end)
        end
    end
end)

spawn(function()
    while task.wait(1) do
        if getgenv().AutoStartLawRaids then
            pcall(function()
                fireclickdetector(workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.AutoLawKak then
            pcall(function()
                local Order = GetConnectionEnemies("Order")

                if Order then
                    repeat
                        task.wait()
                        Attack.Kill(Order, _G.AutoLawKak)
                    until _G.AutoLawKak == false or not Order.Parent or Order.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
                end
            end)
        end
    end
end)

local localPlayer4 = game.Players.LocalPlayer

GetHRP = function()
    local character3 = localPlayer4.Character
    local humanoidRootPart2 = character3 and character3:FindFirstChild("HumanoidRootPart")
    return humanoidRootPart2
end

spawn(function()
    while task.wait(0.15) do
        if _G.AutoFarmDungeon then
            pcall(function()
                local character3, humanoidRootPart2, humanoid, v16, v17, v18, v19, v20, v21, humanoid2, humanoidRootPart3, n4
                n4 = 1

                while true do
                    if n4 == 1 then
                        character3 = game.Players.LocalPlayer.Character
                        humanoidRootPart2 = character3

                        if character3 then
                            n4 = 2
                        else
                            n4 = 3
                        end
                    elseif n4 == 2 then
                        humanoidRootPart2 = character3:FindFirstChild("HumanoidRootPart")
                        n4 = 3
                    elseif n4 == 3 then
                        humanoid = character3

                        if character3 then
                            n4 = 4
                        else
                            n4 = 5
                        end
                    elseif n4 == 4 then
                        humanoid = character3:FindFirstChildOfClass("Humanoid")
                        n4 = 5
                    elseif n4 == 5 then
                        if humanoidRootPart2 and humanoid and humanoid.Health > 0 then
                            n4 = 7
                        else
                            n4 = 6
                        end
                    elseif n4 == 6 then
                        return
                    elseif n4 == 7 then
                        v16, v17, v18 = pairs(workspace.Enemies:GetChildren())
                        v19 = v18
                        n4 = 8
                    elseif n4 == 8 then
                        v20, v21 = v16(v17, v19)

                        if v20 == nil then
                            n4 = 12
                        else
                            n4 = 9
                        end
                    elseif n4 == 9 then
                        v19 = v20

                        if _G.AutoFarmDungeon then
                            n4 = 10
                        else
                            n4 = 12
                        end
                    elseif n4 == 10 then
                        humanoid2 = v21:FindFirstChild("Humanoid")
                        humanoidRootPart3 = v21:FindFirstChild("HumanoidRootPart")

                        if humanoid2 and humanoidRootPart3 and humanoid2.Health > 0 and (humanoidRootPart3.Position - humanoidRootPart2.Position).Magnitude <= FARM_RANGE then
                            n4 = 11
                        else
                            n4 = 8
                        end
                    elseif n4 == 11 then
                        task.wait()
                        Attack.Kill(v21, true)

                        if _G.AutoFarmDungeon and v21.Parent and humanoid2.Health > 0 then
                            n4 = 11
                        else
                            n4 = 8
                        end
                    elseif n4 == 12 then
                        return
                    end
                end
            end)
        end
    end
end)

GetCurrentFloor = function()
    local v16 = GetHRP()
    if not v16 then
        return
    end

    for k, child in pairs(workspace.Map.Dungeon:GetChildren()) do
        local exitTeleporter = child:FindFirstChild("ExitTeleporter")
        if exitTeleporter and exitTeleporter:FindFirstChild("Root") and (v16.Position - exitTeleporter.Root.Position).Magnitude < 200 then
            return exitTeleporter.Root
        end
    end
end

task.spawn(function()
    while task.wait(0.3) do
        if _G.TPFloor1 then
            if not tp1Done then
                local v16 = GetCurrentFloor()

                if v16 then
                    local cFrame = v16.CFrame * CFrame.new(0, 3, 0)
                    GetHRP().CFrame = cFrame
                    tp1Done = true
                end
            end
        else
            tp1Done = false
        end
    end
end)

task.spawn(function()
    local v16, v17, v18, v19, v20, v21, v22, entranceTeleporter, exitTeleporter, n4
    n4 = 1

    while true do
        if n4 == 1 then
            if task.wait(0.3) then
                n4 = 2
            else
                n4 = 10
            end
        elseif n4 == 2 then
            if _G.TPFloor2 then
                n4 = 3
            else
                n4 = 9
            end
        elseif n4 == 3 then
            if tp2Done then
                n4 = 1
            else
                n4 = 4
            end
        elseif n4 == 4 then
            v16 = GetHRP()

            if v16 then
                n4 = 5
            else
                n4 = 1
            end
        elseif n4 == 5 then
            v17, v18, v19 = pairs(workspace.Map.Dungeon:GetChildren())
            v20 = v19
            n4 = 6
        elseif n4 == 6 then
            v21, v22 = v17(v18, v20)

            if v21 == nil then
                n4 = 1
            else
                n4 = 7
            end
        elseif n4 == 7 then
            v20 = v21
            entranceTeleporter = v22:FindFirstChild("EntranceTeleporter")
            exitTeleporter = v22:FindFirstChild("ExitTeleporter")

            if entranceTeleporter and exitTeleporter and entranceTeleporter:FindFirstChild("Root") and exitTeleporter:FindFirstChild("Root") and (v16.Position - entranceTeleporter.Root.Position).Magnitude < 100 then
                n4 = 8
            else
                n4 = 6
            end
        elseif n4 == 8 then
            v16.CFrame = exitTeleporter.Root.CFrame * CFrame.new(0, 3, 0)
            tp2Done = true
            n4 = 1
        elseif n4 == 9 then
            tp2Done = false
            n4 = 1
        elseif n4 == 10 then
            return
        end
    end
end)

GetHighestFloor = function()
    local v16 = nil

    for k, child in pairs(workspace.Map.Dungeon:GetChildren()) do
        local num = tonumber(child.Name)

        if num and (not v16 or tonumber(v16.Name) < num) then
            v16 = child
        end
    end

    return v16
end

task.spawn(function()
    while task.wait(0.3) do
        if _G.TPFloor3 then
            if not tp3Done then
                local v16 = GetHighestFloor()

                if v16 and v16:FindFirstChild("ExitTeleporter") and v16.ExitTeleporter:FindFirstChild("Root") then
                    GetHRP().CFrame = v16.ExitTeleporter.Root.CFrame * CFrame.new(0, 3, 0)
                    tp3Done = true
                end
            end
        else
            tp3Done = false
        end
    end
end)

GetNearestExit = function()
    local v16 = GetHRP()
    if not v16 then
        return
    end
    local root = nil
    local huge = math.huge

    for k, child in pairs(workspace.Map.Dungeon:GetChildren()) do
        local exitTeleporter = child:FindFirstChild("ExitTeleporter")

        if exitTeleporter and exitTeleporter:FindFirstChild("Root") then
            local magnitude = (v16.Position - exitTeleporter.Root.Position).Magnitude

            if magnitude < huge then
                huge = magnitude
                root = exitTeleporter.Root
            end
        end
    end

    return root
end

task.spawn(function()
    while task.wait(0.3) do
        if _G.TPFloor4 then
            if not tp4Done then
                local v16 = GetNearestExit()

                if v16 then
                    GetHRP().CFrame = v16.CFrame * CFrame.new(0, 3, 0)
                    tp4Done = true
                end
            end
        else
            tp4Done = false
        end
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.AimMethod and ABmethod == "Aim Player" then
                local v16 = Players2:FindFirstChild(getgenv().PlayersList)

                if v16 and v16.Character and v16.Character:FindFirstChild("HumanoidRootPart") and v16.Team ~= localPlayer4.Team then
                    MousePos = v16.Character.HumanoidRootPart.Position
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.AimMethod and ABmethod == "Nearest Aim" then
                local huge = math.huge

                for k, player in pairs(Players2:GetPlayers()) do
                    if player ~= localPlayer4 and player.Team ~= localPlayer4.Team and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local magnitude = (player.Character.HumanoidRootPart.Position - localPlayer4.Character.HumanoidRootPart.Position).Magnitude

                        if magnitude < huge then
                            huge = magnitude
                            MousePos = player.Character.HumanoidRootPart.Position
                        end
                    end
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(Sec) do
        pcall(function()
            if _G.AimCam then
                local currentCamera = workspace.CurrentCamera

                closestplayer = function()
                    local huge = math.huge
                    local v16 = nil
                    local v17 = next
                    local players, v18 = ply:GetPlayers()

                    for k, v19 in v17, players, v18 do
                        if v19 ~= localPlayer4 and v19.Character and v19.Character:FindFirstChild("Head") and _G.AimCam and v19.Character.Humanoid.Health > 0 then
                            local magnitude = (v19.Character.Head.Position - localPlayer4.Character.Head.Position).Magnitude

                            if magnitude < huge then
                                huge = magnitude
                                v16 = v19
                            end
                        end
                    end

                    return v16
                end

                repeat
                    task.wait()
                    currentCamera.CFrame = CFrame.new(currentCamera.CFrame.Position, closestplayer().Character.HumanoidRootPart.Position)
                until _G.AimCam == false or dist < Mag
            end
        end)
    end
end)

spawn(function()
    while task.wait(1) do
        if _G.AutoReceivePlayerQuest then
            pcall(function()
                if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
                end
            end)
        end
    end
end)

spawn(function()
    local n4 = 0

    while task.wait() do
        if _G.AutoPlayerHunter then
            pcall(function()
                local main, text, v16, v17, v18, v19, v20, v21, flag7, flag8, humanoidRootPart2, humanoid, n5
                n5 = 1

                while true do
                    if n5 == 1 then
                        main = game.Players.LocalPlayer.PlayerGui.Main

                        if main.Quest.Visible == false then
                            n5 = 18
                        else
                            n5 = 2
                        end
                    elseif n5 == 2 then
                        text = main.Quest.Container.QuestTitle.Title.Text
                        v16, v17, v18 = pairs(game:GetService("Workspace").Characters:GetChildren())
                        v19 = v18
                        n5 = 3
                    elseif n5 == 3 then
                        v20, v21 = v16(v17, v19)

                        if v20 == nil then
                            n5 = 20
                        else
                            n5 = 4
                        end
                    elseif n5 == 4 then
                        v19 = v20

                        if _G.AutoPlayerHunter then
                            n5 = 5
                        else
                            n5 = 20
                        end
                    elseif n5 == 5 then
                        if v21 ~= game.Players.LocalPlayer.Character and string.find(text, v21.Name, 1, true) then
                            n5 = 6
                        else
                            n5 = 3
                        end
                    elseif n5 == 6 then
                        flag7 = false
                        flag8 = false
                        n5 = 7
                    elseif n5 == 7 then
                        task.wait()
                        humanoidRootPart2 = v21:FindFirstChild("HumanoidRootPart")
                        humanoid = v21:FindFirstChild("Humanoid")

                        if v21.Parent and humanoidRootPart2 and humanoid then
                            n5 = 9
                        else
                            n5 = 8
                        end
                    elseif n5 == 8 then
                        flag8 = true
                        n5 = 16
                    elseif n5 == 9 then
                        if humanoid.Health <= 0 then
                            n5 = 15
                        else
                            n5 = 10
                        end
                    elseif n5 == 10 then
                        if AutoHaki then
                            n5 = 11
                        else
                            n5 = 12
                        end
                    elseif n5 == 11 then
                        AutoHaki()
                        n5 = 12
                    elseif n5 == 12 then
                        if EquipWeapon then
                            n5 = 13
                        else
                            n5 = 14
                        end
                    elseif n5 == 13 then
                        EquipWeapon(_G.SelectWeapon)
                        n5 = 14
                    elseif n5 == 14 then
                        Useskill = true
                        _tp(humanoidRootPart2.CFrame * CFrame.new(1, 7, 3))
                        humanoidRootPart2.Size = Vector3.new(60, 60, 60)
                        game:GetService("VirtualUser"):CaptureController()
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))

                        if _G.AutoPlayerHunter == false then
                            n5 = 16
                        else
                            n5 = 7
                        end
                    elseif n5 == 15 then
                        flag7 = true
                        n5 = 16
                    elseif n5 == 16 then
                        Useskill = false

                        if (flag7 or flag8) and _G.AutoPlayerHunter and tick() - n4 > 5 then
                            n5 = 17
                        else
                            n5 = 3
                        end
                    elseif n5 == 17 then
                        n4 = tick()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                        n5 = 3
                    elseif n5 == 18 then
                        task.wait(0.5)

                        if _G.AutoPlayerHunter then
                            n5 = 19
                        else
                            n5 = 20
                        end
                    elseif n5 == 19 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
                        n5 = 20
                    elseif n5 == 20 then
                        return
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait(0.5) do
        if _G.AutoPvP then
            local playerGui = game.Players.LocalPlayer.PlayerGui

            if playerGui and playerGui.Main and playerGui.Main:FindFirstChild("PvpDisabled") and playerGui.Main.PvpDisabled.Visible then
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                end)
            end
        end
    end
end)

spawn(function()
    while task.wait(0.1) do
        if _G.SafeMode then
            local character3 = game.Players.LocalPlayer.Character
            local humanoidRootPart2 = character3 and character3:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart2 then
                local n4 = humanoidRootPart2.CFrame * CFrame.new(0, 1000, 0)
                _tp(n4)
            end
        end
    end
end)

local Players3 = game:GetService("Players")
local UserInputService2 = game:GetService("UserInputService")
local RunService3 = game:GetService("RunService")
local localPlayer5 = Players3.LocalPlayer
local flag7 = false
local n4 = 50
local connection = nil
local tbl17 = {}
tbl17.f = 0
tbl17.b = 0
tbl17.l = 0
tbl17.r = 0
local bodyGyro = nil
local bodyVelocity = nil

updateControlsFromJoystick = function()
    local character3 = localPlayer5.Character
    local humanoid = character3 and character3:FindFirstChildOfClass("Humanoid")

    if humanoid then
        local moveDirection = humanoid.MoveDirection
        local currentCamera = workspace.CurrentCamera
        local cFrame = currentCamera and workspace.CurrentCamera.CFrame

        if cFrame and moveDirection.Magnitude > 0.05 then
            local v16 = cFrame:VectorToObjectSpace(moveDirection)
            local f = v16.Z < -0.1 and 1 or (v16.Z > 0.1 and -1 or 0)
            tbl17.f = f
            tbl17.b = 0
            local l = v16.X < -0.1 and -1 or 0
            tbl17.l = l
            local r = v16.X > 0.1 and 1 or 0
            tbl17.r = r
        else
            tbl17.f = 0
            tbl17.b = 0
            tbl17.l = 0
            tbl17.r = 0
        end
    end
end

UserInputService2.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and flag7 then
        if input.KeyCode == Enum.KeyCode.W then
            tbl17.f = 1
        elseif input.KeyCode == Enum.KeyCode.S then
            tbl17.b = -1
        elseif input.KeyCode == Enum.KeyCode.A then
            tbl17.l = -1
        elseif input.KeyCode == Enum.KeyCode.D then
            tbl17.r = 1
        end
    end
end)

UserInputService2.InputEnded:Connect(function(input, gameProcessed)
    if flag7 then
        if input.KeyCode == Enum.KeyCode.W and tbl17.f == 1 then
            tbl17.f = 0
        elseif input.KeyCode == Enum.KeyCode.S and tbl17.b == -1 then
            tbl17.b = 0
        elseif input.KeyCode == Enum.KeyCode.A and tbl17.l == -1 then
            tbl17.l = 0
        elseif input.KeyCode == Enum.KeyCode.D and tbl17.r == 1 then
            tbl17.r = 0
        end
    end
end)

setupMobileControls = function()
    local connection2 = nil

    connection2 = RunService3.Heartbeat:Connect(function()
        if flag7 then
            updateControlsFromJoystick()
        elseif connection2 then
            connection2:Disconnect()
        end
    end)
end

toggleFly = function(arg)
    flag7 = arg

    if flag7 then
        if not localPlayer5.Character then
            return
        end
        local humanoid = localPlayer5.Character:FindFirstChildOfClass("Humanoid")
        local torso

        if localPlayer5.Character:FindFirstChild("Torso") then
            torso = localPlayer5.Character.Torso
        else
            torso = localPlayer5.Character.UpperTorso
        end

        if not humanoid or not torso then
            return
        end

        for i, descendant in ipairs(localPlayer5.Character:GetDescendants()) do
            if descendant:IsA("BasePart") then
                descendant.CanCollide = false
                descendant.Massless = true
            end
        end

        localPlayer5.Character.DescendantAdded:Connect(function(descendant)
            if flag7 and descendant:IsA("BasePart") then
                descendant.CanCollide = false
                descendant.Massless = true
            end
        end)

        bodyGyro = Instance.new("BodyGyro", torso)
        bodyGyro.P = 90000
        local vector = Vector3.new(9000000000, 9000000000, 9000000000)
        bodyGyro.maxTorque = vector
        bodyGyro.cframe = torso.CFrame
        bodyVelocity = Instance.new("BodyVelocity", torso)
        local vector2 = Vector3.new(0, 0, 0)
        bodyVelocity.velocity = vector2
        local vector3 = Vector3.new(9000000000, 9000000000, 9000000000)
        bodyVelocity.maxForce = vector3
        humanoid.PlatformStand = true
        setupMobileControls()

        connection = RunService3.Heartbeat:Connect(function()
            if not flag7 or not localPlayer5.Character then
                return
            end

            for i, descendant in ipairs(localPlayer5.Character:GetDescendants()) do
                if descendant:IsA("BasePart") and descendant.CanCollide then
                    descendant.CanCollide = false
                end
            end

            if tbl17.l + tbl17.r == 0 and tbl17.f + tbl17.b == 0 then
                local vector4 = Vector3.new(0, 0, 0)
                bodyVelocity.velocity = vector4
            else
                local velocity = (workspace.CurrentCamera.CoordinateFrame.lookVector * (tbl17.f + tbl17.b) + (workspace.CurrentCamera.CoordinateFrame * CFrame.new(tbl17.l + tbl17.r, (tbl17.f + tbl17.b) * 0.2, 0).p - workspace.CurrentCamera.CoordinateFrame.p)) * n4
                bodyVelocity.velocity = velocity
            end

            bodyGyro.cframe = workspace.CurrentCamera.CoordinateFrame
        end)
    else
        if connection then
            connection:Disconnect()
            connection = nil
        end

        if localPlayer5.Character then
            local humanoid = localPlayer5.Character:FindFirstChildOfClass("Humanoid")

            if humanoid then
                humanoid.PlatformStand = false
            end

            for i, descendant in ipairs(localPlayer5.Character:GetDescendants()) do
                if descendant:IsA("BasePart") then
                    descendant.CanCollide = true
                    descendant.Massless = false
                end
            end

            if bodyGyro then
                bodyGyro:Destroy()
            end

            if bodyVelocity then
                bodyVelocity:Destroy()
            end
        end

        tbl17 = {f = 0, b = 0, l = 0, r = 0}
    end
end

_G.toggleFly = toggleFly

updateFlySpeed = function(arg)
    n4 = arg
end

_G.updateFlySpeed = updateFlySpeed

NoCooldown = function()
    local dodge = game.Players.LocalPlayer.Character:WaitForChild("Dodge")
    local v16, v17 = getgc()
    local v18 = v17
    local v19 = next
    local v20 = v16

    while true do
        local v21, v22 = v19(v20, v18)
        if v21 == nil then
            break
        end
        v18 = v21

        if typeof(v22) == "function" and getfenv(v22).script == dodge then
            local v23 = next
            local v24, v25 = getupvalues(v22)

            for k, v26 in v23, v24, v25 do
                if tostring(v26) == "0.4" then
                    setupvalue(v22, k, 0)
                end
            end

            v18 = v21
        end
    end
end

spawn(function()
    while wait(0.2) do
        pcall(function()
            if InfAblities then
                if not localPlayer4.Character.HumanoidRootPart:FindFirstChild("Agility") then
                    local clone = ReplicatedStorage4.FX.Agility:Clone()
                    clone.Name = "Agility"
                    clone.Parent = localPlayer4.Character.HumanoidRootPart
                end
            else
                local agility = localPlayer4.Character.HumanoidRootPart:FindFirstChild("Agility")

                if agility then
                    agility:Destroy()
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.AcceptAlly then
            pcall(function()
                for k, child in pairs(ply:GetChildren()) do
                    if child.Name ~= localPlayer4.Name and child:FindFirstChild("Humanoid") and child:FindFirstChild("HumanoidRootPart") then
                        ReplicatedStorage4:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("AcceptAlly", child.Name)
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.TPNpc then
            pcall(function()
                for k, child in pairs(ReplicatedStorage4.NPCs:GetChildren()) do
                    if child.Name == NPClist then
                        _tp(child.HumanoidRootPart.CFrame)
                    end
                end
            end)
        end
    end
end)

local ReplicatedStorage5 = game:GetService("ReplicatedStorage")

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.PortalUnLock then
                if Attack.Pos(CstlePos_Miti, 8) then
                    ReplicatedStorage5.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
                elseif Attack.Pos(Man3Pos_Miti, 8) then
                    ReplicatedStorage5.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5072.08984375, 314.5412902832, -3151.1098632812))
                elseif Attack.Pos(HydraPos_Miti, 8) then
                    ReplicatedStorage5.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5748.7587890625, 610.44982910156, -267.81704711914))
                elseif Attack.Pos(HydratoCastle, 8) then
                    ReplicatedStorage5.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5072.08984375, 314.5412902832, -3151.1098632812))
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.daylightN then
            if _G.SelectDN == "Day" then
                Lighting.ClockTime = 12
            elseif _G.SelectDN == "Night" then
                Lighting.ClockTime = 0
            end
        end
    end
end)

spawn(function()
    while task.wait() do
        if _G.WalkWater then
            pcall(function()
                if localPlayer4.Character and localPlayer4.Character:FindFirstChild("LeftFoot") then
                    local clone = ReplicatedStorage5.Assets.Models.IceSpikes4:Clone()
                    clone.Parent = workspace
                    clone.Size = Vector3.new(3 + math.random(10, 12), 1.7, 3 + math.random(10, 12))
                    clone.Color = Color3.fromRGB(128, 187, 219)
                    clone.CFrame = CFrame.new(localPlayer4.Character.Head.Position.X, -3.8, localPlayer4.Character.Head.Position.Z) * CFrame.Angles((math.random() - 0.5) * 0.06, math.random() * 7, (math.random() - 0.5) * 0.07)
                    local tbl18 = {Size = Vector3.new(0, 0.3, 0)}
                    local tween = TW:Create(clone, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), tbl18)

                    tween.Completed:Connect(function()
                        clone:Destroy()
                    end)

                    tween:Play()
                end
            end)
        end
    end
end)

local v16 = Number
local n5 = v16 or math.random(1, 1000000)
Number = n5
local team = localPlayer4.Team

EspPly = function()
    local v17 = next
    local children, v18 = game.Players:GetChildren()

    for k, v19 in v17, children, v18 do
        pcall(function()
            if not isnil(v19.Character) then
                if PlayerEsp then
                    if not isnil(v19.Character.Head) and not v19.Character.Head:FindFirstChild("NameEsp" .. Number) then
                        local billboardGui = Instance.new("BillboardGui", v19.Character.Head)
                        billboardGui.Name = "NameEsp" .. Number
                        billboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
                        billboardGui.Size = UDim2.new(1, 200, 1, 30)
                        billboardGui.Adornee = v19.Character.Head
                        billboardGui.AlwaysOnTop = true
                        local textLabel = Instance.new("TextLabel", billboardGui)
                        textLabel.Font = Enum.Font.Code
                        textLabel.FontSize = "Size14"
                        textLabel.TextWrapped = true
                        textLabel.Text = v19.Name .. " \n" .. round((localPlayer4.Character.Head.Position - v19.Character.Head.Position).Magnitude / 3) .. " M"
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.TextYAlignment = "Top"
                        textLabel.BackgroundTransparency = 1
                        textLabel.TextStrokeTransparency = 0.5

                        if v19.Team == team then
                            textLabel.TextColor3 = Color3.new(0, 0, 254)
                        else
                            textLabel.TextColor3 = Color3.new(255, 0, 0)
                        end
                    elseif v19.Character.Head:FindFirstChild("NameEsp" .. Number) then
                        v19.Character.Head["NameEsp" .. Number].TextLabel.Text = v19.Name .. " | " .. round((localPlayer4.Character.Head.Position - v19.Character.Head.Position).Magnitude / 3) .. " M\nHealth : " .. round(v19.Character.Humanoid.Health * 100 / v19.Character.Humanoid.MaxHealth) .. "%"
                    end
                elseif v19.Character.Head:FindFirstChild("NameEsp" .. Number) then
                    v19.Character.Head:FindFirstChild("NameEsp" .. Number):Destroy()
                end
            end
        end)
    end
end

LocationEsp = function()
    local v17 = next
    local children, v18 = workspace._WorldOrigin.Locations:GetChildren()

    for k, v19 in v17, children, v18 do
        pcall(function()
            if IslandESP then
                if v19.Name ~= "Sea" then
                    if v19:FindFirstChild("NameEsp") then
                        v19.NameEsp.TextLabel.Text = v19.Name .. "   \n" .. round((localPlayer4.Character.Head.Position - v19.Position).Magnitude / 3) .. " M"
                    else
                        local billboardGui = Instance.new("BillboardGui", v19)
                        billboardGui.Name = "NameEsp"
                        billboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
                        billboardGui.Size = UDim2.new(1, 200, 1, 30)
                        billboardGui.Adornee = v19
                        billboardGui.AlwaysOnTop = true
                        local textLabel = Instance.new("TextLabel", billboardGui)
                        textLabel.Font = Enum.Font.Code
                        textLabel.FontSize = "Size14"
                        textLabel.TextWrapped = true
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.TextYAlignment = "Top"
                        textLabel.BackgroundTransparency = 1
                        textLabel.TextStrokeTransparency = 0.5
                        textLabel.TextColor3 = Color3.fromRGB(98, 252, 252)
                        textLabel.Text = v19.Name .. "   \n" .. round((localPlayer4.Character.Head.Position - v19.Position).Magnitude / 3) .. " M"
                    end
                end
            elseif v19:FindFirstChild("NameEsp") then
                v19:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end

DevEsp = function()
    local v17 = next
    local children, v18 = workspace:GetChildren()

    for k, v19 in v17, children, v18 do
        pcall(function()
            if DevilFruitESP then
                if string.find(v19.Name, "Fruit") then
                    if v19.Handle:FindFirstChild("NameEsp" .. Number) then
                        v19.Handle["NameEsp" .. Number].TextLabel.Text = "[" .. v19.Name .. "]   \n" .. round((localPlayer4.Character.Head.Position - v19.Handle.Position).Magnitude / 3) .. " M"
                    else
                        local billboardGui = Instance.new("BillboardGui", v19.Handle)
                        billboardGui.Name = "NameEsp" .. Number
                        billboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
                        billboardGui.Size = UDim2.new(1, 200, 1, 30)
                        billboardGui.Adornee = v19.Handle
                        billboardGui.AlwaysOnTop = true
                        local textLabel = Instance.new("TextLabel", billboardGui)
                        textLabel.Font = Enum.Font.Code
                        textLabel.FontSize = "Size14"
                        textLabel.TextWrapped = true
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.TextYAlignment = "Top"
                        textLabel.BackgroundTransparency = 1
                        textLabel.TextStrokeTransparency = 0.5
                        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                        textLabel.Text = v19.Name .. " \n" .. round((localPlayer4.Character.Head.Position - v19.Handle.Position).Magnitude / 3) .. " M"
                    end
                end
            elseif v19:FindFirstChild("Handle") and v19.Handle:FindFirstChild("NameEsp" .. Number) then
                v19.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end)
    end
end

flowerEsp = function()
    for k, child in pairs(workspace:GetChildren()) do
        pcall(function()
            if child.Name == "Flower2" or child.Name == "Flower1" then
                if FlowerESP then
                    if child:FindFirstChild("NameEsp" .. Number) then
                        child["NameEsp" .. Number].TextLabel.Text = child.Name .. "   \n" .. round((localPlayer4.Character.Head.Position - child.Position).Magnitude / 3) .. " M"
                    else
                        local billboardGui = Instance.new("BillboardGui", child)
                        billboardGui.Name = "NameEsp" .. Number
                        billboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
                        billboardGui.Size = UDim2.new(1, 200, 1, 30)
                        billboardGui.Adornee = child
                        billboardGui.AlwaysOnTop = true
                        local textLabel = Instance.new("TextLabel", billboardGui)
                        textLabel.Font = Enum.Font.Code
                        textLabel.FontSize = "Size14"
                        textLabel.TextWrapped = true
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.TextYAlignment = "Top"
                        textLabel.BackgroundTransparency = 1
                        textLabel.TextStrokeTransparency = 0.5
                        textLabel.TextColor3 = Color3.fromRGB(88, 214, 252)

                        if child.Name == "Flower1" then
                            textLabel.Text = "Blue Flower \n" .. round((localPlayer4.Character.Head.Position - child.Position).Magnitude / 3) .. " M"
                        elseif child.Name == "Flower2" then
                            textLabel.Text = "Red Flower \n" .. round((localPlayer4.Character.Head.Position - child.Position).Magnitude / 3) .. " M"
                        end
                    end
                elseif child:FindFirstChild("NameEsp" .. Number) then
                    child:FindFirstChild("NameEsp" .. Number):Destroy()
                end
            end
        end)
    end
end

EventIslandEsp = function()
    for k, child in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
        pcall(function()
            if EspEventIsland then
                if child.Name == "Mirage Island" or child.Name == "Prehistoric Island" or child.Name == "Kitsune Island" then
                    if child:FindFirstChild("NameEsp") then
                        child.NameEsp.TextLabel.Text = child.Name .. "   \n" .. round((localPlayer4.Character.Head.Position - child.Position).Magnitude / 3) .. " M"
                    else
                        local billboardGui = Instance.new("BillboardGui", child)
                        billboardGui.Name = "NameEsp"
                        billboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
                        billboardGui.Size = UDim2.new(1, 200, 1, 30)
                        billboardGui.Adornee = child
                        billboardGui.AlwaysOnTop = true
                        local textLabel = Instance.new("TextLabel", billboardGui)
                        textLabel.Font = "Code"
                        textLabel.FontSize = "Size14"
                        textLabel.TextWrapped = true
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.TextYAlignment = "Top"
                        textLabel.BackgroundTransparency = 1
                        textLabel.TextStrokeTransparency = 0.5
                        textLabel.TextColor3 = Color3.fromRGB(80, 245, 245)
                        textLabel.Text = child.Name .. "   \n" .. round((localPlayer4.Character.Head.Position - child.Position).Magnitude / 3) .. " M"
                    end
                end
            elseif child:FindFirstChild("NameEsp") then
                child:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end

gearEsp = function()
    local mysticIsland = workspace.Map:FindFirstChild("MysticIsland")
    if not mysticIsland then
        return
    end

    for k, descendant in pairs(mysticIsland:GetDescendants()) do
        pcall(function()
            if ESPGear then
                if descendant.Name == "Part" and descendant.Material == Enum.Material.Neon then
                    if descendant:FindFirstChild("NameEsp") then
                        descendant.NameEsp.TextLabel.Text = "Gear   \n" .. round((localPlayer4.Character.Head.Position - descendant.Position).Magnitude / 3) .. " M"
                    else
                        local billboardGui = Instance.new("BillboardGui", descendant)
                        billboardGui.Name = "NameEsp"
                        billboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
                        billboardGui.Size = UDim2.new(1, 200, 1, 30)
                        billboardGui.Adornee = descendant
                        billboardGui.AlwaysOnTop = true
                        local textLabel = Instance.new("TextLabel", billboardGui)
                        textLabel.Font = "Code"
                        textLabel.FontSize = "Size14"
                        textLabel.TextWrapped = true
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.TextYAlignment = "Top"
                        textLabel.BackgroundTransparency = 1
                        textLabel.TextStrokeTransparency = 0.5
                        textLabel.TextColor3 = Color3.fromRGB(80, 245, 245)
                        textLabel.Text = "Gear   \n" .. round((localPlayer4.Character.Head.Position - descendant.Position).Magnitude / 3) .. " M"
                    end
                end
            elseif descendant:FindFirstChild("NameEsp") then
                descendant:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end

AdvanFruitEsp = function()
    if advanEsp then
        for k, child in pairs(ReplicatedStorage5.NPCs:GetChildren()) do
            if child.Name == "Advanced Fruit Dealer" then
                if workspace:FindFirstChild("Adv") then
                    if workspace:FindFirstChild("Adv") then
                        if Adv:FindFirstChild("NameEsp") then
                            Adv.NameEsp.TextLabel.Text = child.Name .. "   \n" .. round((localPlayer4.Character.Head.Position - child.HumanoidRootPart.Position).Magnitude / 3) .. " M"
                        else
                            local billboardGui = Instance.new("BillboardGui", Adv)
                            billboardGui.Name = "NameEsp"
                            billboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
                            billboardGui.Size = UDim2.new(1, 200, 1, 30)
                            billboardGui.Adornee = Adv
                            billboardGui.AlwaysOnTop = true
                            local textLabel = Instance.new("TextLabel", billboardGui)
                            textLabel.Font = "Code"
                            textLabel.FontSize = "Size14"
                            textLabel.TextWrapped = true
                            textLabel.Size = UDim2.new(1, 0, 1, 0)
                            textLabel.TextYAlignment = "Top"
                            textLabel.BackgroundTransparency = 1
                            textLabel.TextStrokeTransparency = 0.5
                            textLabel.TextColor3 = Color3.fromRGB(80, 245, 245)
                            textLabel.Text = child.Name .. "   \n" .. round((localPlayer4.Character.Head.Position - child.HumanoidRootPart.Position).Magnitude / 3) .. " M"
                        end
                    end
                else
                    local part2 = Instance.new("Part")
                    Adv = part2
                    Adv.Name = "Adv"
                    Adv.Transparency = 1
                    Adv.Size = Vector3.new(1, 1, 1)
                    Adv.Anchored = true
                    Adv.CanCollide = false
                    Adv.Parent = workspace
                    Adv.CFrame = child.HumanoidRootPart.CFrame
                end
            end
        end
    elseif workspace:FindFirstChild("Adv") then
        workspace:FindFirstChild("Adv"):Destroy()
    end
end

HakiClorEsp = function()
    if ColorEsp then
        for k, child in pairs(ReplicatedStorage5.NPCs:GetChildren()) do
            if child.Name == "Barista Cousin" then
                if workspace:FindFirstChild("Gay") then
                    if workspace:FindFirstChild("Gay") then
                        if Gay:FindFirstChild("NameEsp") then
                            Gay.NameEsp.TextLabel.Text = child.Name .. "   \n" .. round((localPlayer4.Character.Head.Position - child.HumanoidRootPart.Position).Magnitude / 3) .. " M"
                        else
                            local billboardGui = Instance.new("BillboardGui", Gay)
                            billboardGui.Name = "NameEsp"
                            billboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
                            billboardGui.Size = UDim2.new(1, 200, 1, 30)
                            billboardGui.Adornee = Gay
                            billboardGui.AlwaysOnTop = true
                            local textLabel = Instance.new("TextLabel", billboardGui)
                            textLabel.Font = "Code"
                            textLabel.FontSize = "Size14"
                            textLabel.TextWrapped = true
                            textLabel.Size = UDim2.new(1, 0, 1, 0)
                            textLabel.TextYAlignment = "Top"
                            textLabel.BackgroundTransparency = 1
                            textLabel.TextStrokeTransparency = 0.5
                            textLabel.TextColor3 = Color3.fromRGB(80, 245, 245)
                            textLabel.Text = child.Name .. "   \n" .. round((localPlayer4.Character.Head.Position - child.HumanoidRootPart.Position).Magnitude / 3) .. " M"
                        end
                    end
                else
                    local part2 = Instance.new("Part")
                    Gay = part2
                    Gay.Name = "Gay"
                    Gay.Transparency = 1
                    Gay.Size = Vector3.new(1, 1, 1)
                    Gay.Anchored = true
                    Gay.CanCollide = false
                    Gay.Parent = workspace
                    Gay.CFrame = child.HumanoidRootPart.CFrame
                end
            end
        end
    elseif workspace:FindFirstChild("Gay") then
        workspace:FindFirstChild("Gay"):Destroy()
    end
end

LegenSword = function()
    if LegenS then
        for k, child in pairs(ReplicatedStorage5.NPCs:GetChildren()) do
            if child.Name == "Legendary Sword Dealer" then
                if workspace:FindFirstChild("Lgd") then
                    if workspace:FindFirstChild("Lgd") then
                        if Lgd:FindFirstChild("NameEsp") then
                            Lgd.NameEsp.TextLabel.Text = child.Name .. "   \n" .. round((localPlayer4.Character.Head.Position - child.HumanoidRootPart.Position).Magnitude / 3) .. " M"
                        else
                            local billboardGui = Instance.new("BillboardGui", Lgd)
                            billboardGui.Name = "NameEsp"
                            billboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
                            billboardGui.Size = UDim2.new(1, 200, 1, 30)
                            billboardGui.Adornee = Lgd
                            billboardGui.AlwaysOnTop = true
                            local textLabel = Instance.new("TextLabel", billboardGui)
                            textLabel.Font = "Code"
                            textLabel.FontSize = "Size14"
                            textLabel.TextWrapped = true
                            textLabel.Size = UDim2.new(1, 0, 1, 0)
                            textLabel.TextYAlignment = "Top"
                            textLabel.BackgroundTransparency = 1
                            textLabel.TextStrokeTransparency = 0.5
                            textLabel.TextColor3 = Color3.fromRGB(80, 245, 245)
                            textLabel.Text = child.Name .. "   \n" .. round((localPlayer4.Character.Head.Position - child.HumanoidRootPart.Position).Magnitude / 3) .. " M"
                        end
                    end
                else
                    local part2 = Instance.new("Part")
                    Lgd = part2
                    Lgd.Name = "Lgd"
                    Lgd.Transparency = 1
                    Lgd.Size = Vector3.new(1, 1, 1)
                    Lgd.Anchored = true
                    Lgd.CanCollide = false
                    Lgd.Parent = workspace
                    Lgd.CFrame = child.HumanoidRootPart.CFrame
                end
            end
        end
    elseif workspace:FindFirstChild("Lgd") then
        workspace:FindFirstChild("Lgd"):Destroy()
    end
end

ChestEsp = function()
    if ChestESP then
        local tagged = game:GetService("CollectionService"):GetTagged("_ChestTagged")

        for i, v17 in ipairs(tagged) do
            pcall(function()
                local magnitude = (v17:GetPivot().Position - localPlayer4.Character.Head.Position).Magnitude
                v17:GetFullName():gsub("[^%w_]", "_")
                local chestEspAttachment = v17:FindFirstChild("ChestEspAttachment")

                if not chestEspAttachment then
                    local attachment = Instance.new("Attachment")
                    attachment.Name = "ChestEspAttachment"
                    attachment.Parent = v17
                    attachment.Position = Vector3.new(0, 3, 0)
                    local billboardGui = Instance.new("BillboardGui")
                    billboardGui.Name = "NameEsp"
                    billboardGui.Size = UDim2.new(0, 200, 0, 30)
                    billboardGui.Adornee = attachment
                    billboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
                    billboardGui.AlwaysOnTop = true
                    billboardGui.Parent = attachment
                    local textLabel = Instance.new("TextLabel")
                    textLabel.Font = Enum.Font.Code
                    textLabel.TextSize = 14
                    textLabel.TextWrapped = true
                    textLabel.Size = UDim2.new(1, 0, 1, 0)
                    textLabel.TextYAlignment = Enum.TextYAlignment.Top
                    textLabel.BackgroundTransparency = 1
                    textLabel.TextStrokeTransparency = 0.5
                    textLabel.TextColor3 = Color3.fromRGB(80, 245, 245)
                    textLabel.Parent = billboardGui
                end

                local nameEsp = chestEspAttachment and chestEspAttachment:FindFirstChild("NameEsp")

                if nameEsp then
                    local n6 = math.floor(magnitude / 3)
                    local str = v17.Name:gsub("Label", "")
                    nameEsp.TextLabel.Text = string.format("[%s] %d M", str, n6)
                end
            end)
        end
    else
        for i, v17 in ipairs(game:GetService("CollectionService"):GetTagged("_ChestTagged")) do
            local chestEspAttachment = v17:FindFirstChild("ChestEspAttachment")

            if chestEspAttachment then
                chestEspAttachment:Destroy()
            end
        end
    end
end

berriesEsp = function()
    if BerryEsp then
        local tagged = game:GetService("CollectionService"):GetTagged("BerryBush")

        for i, v17 in ipairs(tagged) do
            pcall(function()
                local position = v17.Parent:GetPivot().Position

                for k, v18 in pairs(v17:GetAttributes()) do
                    if v18 then
                        local name = "BerryEspPart_" .. v18 .. "_" .. tostring(position)
                        local v19 = workspace:FindFirstChild(name)
                        local v20 = v19

                        if not v19 then
                            local part2 = Instance.new("Part")
                            v20 = part2
                            part2.Name = name
                            part2.Transparency = 1
                            part2.Size = Vector3.new(1, 1, 1)
                            part2.Anchored = true
                            part2.CanCollide = false
                            part2.Parent = workspace
                            part2.CFrame = CFrame.new(position)
                        end

                        if not v20:FindFirstChild("NameEsp") then
                            local billboardGui = Instance.new("BillboardGui", v20)
                            billboardGui.Name = "NameEsp"
                            billboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
                            billboardGui.Size = UDim2.new(0, 200, 0, 30)
                            billboardGui.Adornee = v20
                            billboardGui.AlwaysOnTop = true
                            local textLabel = Instance.new("TextLabel", billboardGui)
                            textLabel.Font = Enum.Font.Code
                            textLabel.TextSize = 14
                            textLabel.TextWrapped = true
                            textLabel.Size = UDim2.new(1, 0, 1, 0)
                            textLabel.TextYAlignment = Enum.TextYAlignment.Top
                            textLabel.BackgroundTransparency = 1
                            textLabel.TextStrokeTransparency = 0.5
                            textLabel.TextColor3 = Color3.fromRGB(80, 245, 245)
                        end

                        local nameEsp = v20:FindFirstChild("NameEsp")
                        local n6 = (localPlayer4.Character.Head.Position - position).Magnitude / 3

                        if nameEsp then
                            nameEsp.TextLabel.Text = "[" .. v18 .. "] " .. math.round(n6) .. " M"
                        end
                    end
                end
            end)
        end
    else
        for i, child in ipairs(workspace:GetChildren()) do
            if child:IsA("Part") and child.Name:match("BerryEspPart_.*") then
                child:Destroy()
            end
        end
    end
end

Core.EspPly = EspPly
Core.LocationEsp = LocationEsp
Core.DevEsp = DevEsp
Core.flowerEsp = flowerEsp
Core.EventIslandEsp = EventIslandEsp
Core.gearEsp = gearEsp
Core.AdvanFruitEsp = AdvanFruitEsp
Core.HakiClorEsp = HakiClorEsp
Core.LegenSword = LegenSword
Core.ChestEsp = ChestEsp
Core.berriesEsp = berriesEsp

if Core.Halloween then
    Core.Halloween:Destroy()
end

local halloween = {
    Enabled = {},
    Status = "Idle",
    Connections = {},
    Live = true,
    Errors = 0,
    NextAction = 0,
    NextSummon = 0,
    NextGacha = 0,
}

Core.Halloween = halloween
local localPlayer6 = game:GetService("Players").LocalPlayer
local ReplicatedStorage6 = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")
local remotes = ReplicatedStorage6:WaitForChild("Remotes")
local halloweenEvent = remotes:FindFirstChild("HalloweenEvent")
local halloweenFunction = remotes:FindFirstChild("HalloweenFunction")
local Global = require(ReplicatedStorage6.Global)
local obj = setmetatable({}, {__mode = "k"})

halloween.StopMovement = function(arg)
    if arg.Moving then
        if Core.HalloweenStopTween then
            Core.HalloweenStopTween()
        else
            local v17 = arg:Root()

            if v17 then
                _tp(v17.CFrame)
            end
        end

        arg.Moving = false
    end
end

halloween.Destroy = function(arg)
    arg.Live = false
    arg:StopMovement()

    for i, connection2 in ipairs(arg.Connections) do
        connection2:Disconnect()
    end
end

halloween.SetEnabled = function(arg, arg2, arg3)
    local enabled = arg.Enabled
    local flag8 = arg3 == true
    enabled[arg2] = flag8
    arg:StopMovement()
    local status = arg3 and "Starting " .. arg2 or "Idle"
    arg.Status = status
end

halloween.Root = function(arg)
    local character3 = localPlayer6.Character
    local humanoid = character3 and character3:FindFirstChildOfClass("Humanoid")
    local humanoidRootPart2 = humanoid and humanoid.Health > 0 and character3:FindFirstChild("HumanoidRootPart") or nil
    return humanoidRootPart2
end

halloween.Position = function(arg, arg2)
    if arg2:IsA("BasePart") then
        return arg2.CFrame
    end

    if arg2:IsA("Model") then
        return arg2:GetPivot()
    end
    local basePart = arg2:FindFirstChildWhichIsA("BasePart", true)
    local cFrame = basePart and basePart.CFrame
    return cFrame
end

halloween.Move = function(arg, arg2, arg3)
    local v17 = arg:Root()
    if not v17 or not arg2 then
        return false
    end
    local magnitude = (v17.Position - arg2.Position).Magnitude
    local n6 = arg3 or 8
    if magnitude <= n6 then
        arg:StopMovement()
        return true
    end
    arg.Moving = true
    _tp(arg2)
    return false
end

halloween.Nearest = function(arg, arg2, arg3)
    local v17 = arg:Root()
    if not v17 then
        return
    end
    local v18 = nil
    local v19 = nil

    for i, v20 in ipairs(arg2) do
        if v20.Parent and (not arg3 or arg3(v20)) then
            local v21 = arg:Position(v20)

            if v21 then
                local magnitude = (v21.Position - v17.Position).Magnitude

                if not v19 or magnitude < v19 then
                    v18 = v20
                    v19 = magnitude
                end
            end
        end
    end

    return v18
end

halloween.Fight = function(arg, arg2)
    arg.Status = "Fighting " .. arg2.Name
    arg.Moving = true
    Attack.Kill(arg2, true)
    local character3 = localPlayer6.Character
    local tool = character3 and character3:FindFirstChildOfClass("Tool")

    if tool then
        arg:Strike(tool)
    end
end

halloween.Strike = function(arg, arg2)
    local v17 = getthreadidentity
    local n6 = v17 and getthreadidentity() or 8

    if setthreadidentity then
        setthreadidentity(2)
    end

    local ok, result = pcall(function()
        require(ReplicatedStorage6.Controllers.CombatController):Attack(arg2)
    end)

    if setthreadidentity then
        setthreadidentity(n6)
    end

    if not ok then
        error(result)
    end
end

halloween.Enemy = function(arg, arg2)
    local enemies = workspace:FindFirstChild("Enemies")

    local v17 = enemies and arg:Nearest(enemies:GetChildren(), function(arg3)
        local attribute2 = arg3:GetAttribute("LocalEnemy")
        local humanoid = arg3:FindFirstChildOfClass("Humanoid")
        local flag8

        if attribute2 then
            flag8 = false
        else
            flag8 = true
        end

        if not flag8 then
            flag8 = attribute2 == localPlayer6.Name
        end

        if flag8 then
            flag8 = humanoid
        end

        if flag8 then
            flag8 = humanoid.Health > 0
        end

        if flag8 then
            flag8 = arg3:FindFirstChild("HumanoidRootPart")
        end

        if flag8 then
            flag8 = arg2(arg3)
        end

        return flag8
    end)

    return v17
end

halloween.Prompt = function(arg, arg2)
    local proximityPrompt = arg2:FindFirstChildWhichIsA("ProximityPrompt", true)
    if not proximityPrompt or not proximityPrompt.Enabled then
        return false
    end
    local parent = proximityPrompt.Parent
    local isAttachment = parent:IsA("Attachment")
    local worldCFrame = isAttachment and parent.WorldCFrame or arg:Position(parent)

    if arg:Move(worldCFrame, math.min(proximityPrompt.MaxActivationDistance, 8)) then
        local now = os.clock()

        if arg.NextAction <= now then
            arg.NextAction = os.clock() + 0.5

            if fireproximityprompt then
                fireproximityprompt(proximityPrompt)
            else
                proximityPrompt:InputHoldBegin()
                task.wait(proximityPrompt.HoldDuration)
                proximityPrompt:InputHoldEnd()
            end
        end
    end

    return true
end

halloween.DoorStep = function(arg)
    local n6, n7, n8, n9, v17, part2, doorEventName, str, map, v18, part3, proximity, cframe3, now, now2, eventIslands, v19, str2, v20, v21
    local flag8, now3, eventTravelAt, n10, n11
    n11 = 1

    while true do
        if n11 == 1 then
            if halloweenEvent and halloweenFunction then
                n11 = 3
            else
                n11 = 2
            end
        elseif n11 == 2 then
            arg.Status = "Halloween doors unavailable"
            return
        elseif n11 == 3 then
            n6 = 760540691

            if arg.Door and not arg.Door.Parent then
                n11 = 4
            else
                n11 = 5
            end
        elseif n11 == 4 then
            arg.Door = nil
            n11 = 5
        elseif n11 == 5 then
            n7 = 1027460414
            n8 = 875520391
            n9 = nil

            if not Global.ALREADYINDOOR and not arg.Door then
                n11 = 16
            else
                n11 = 6
            end
        elseif n11 == 6 then
            v17 = arg:Enemy(function(arg2)
                n9 = 280113029
                local flag9 = arg2:GetAttribute("LocalEnemy") == localPlayer6.Name
                return flag9
            end)

            if v17 then
                n11 = 7
            else
                n11 = 8
            end
        elseif n11 == 7 then
            arg:Fight(v17)
            return
        elseif n11 == 8 then
            if arg.Enabled.Bosses and arg.Door and arg.Door:GetAttribute("BOSS_ACTIVE") then
                n11 = 9
            else
                n11 = 11
            end
        elseif n11 == 9 then
            part2 = arg.Door:FindFirstChild("Part")

            if part2 then
                n11 = 10
            else
                n11 = 11
            end
        elseif n11 == 10 then
            arg.Status = "Entering Hellfire boss door"
            arg:Move(part2.CFrame * CFrame.new(0, 0, 4), 2)
            return
        elseif n11 == 11 then
            arg:StopMovement()
            doorEventName = arg.DoorEventName
            str = doorEventName

            if doorEventName then
                n11 = 13
            else
                n11 = 12
            end
        elseif n11 == 12 then
            str = "door challenge"
            n11 = 13
        elseif n11 == 13 then
            arg.Status = "Completing " .. str
            arg:Cards()
            arg:Dialogue()

            if arg.Door and not Global.ALREADYINDOOR and os.clock() - arg.OpenedAt > 12 then
                n11 = 14
            else
                n11 = 15
            end
        elseif n11 == 14 then
            arg.Door = nil
            n11 = 15
        elseif n11 == 15 then
            return
        elseif n11 == 16 then
            if workspace:GetAttribute("HalloweenEventActive") then
                n11 = 17
            else
                n11 = 50
            end
        elseif n11 == 17 then
            map = workspace:FindFirstChild("Map")
            v18 = map

            if map then
                n11 = 18
            else
                n11 = 19
            end
        elseif n11 == 18 then
            v18 = arg:Nearest(map:QueryDescendants("#HalloweenDoor"), function(arg2)
                local flag9

                if arg2:GetAttribute("DoorOpen") then
                    flag9 = false
                else
                    flag9 = true
                end

                if flag9 then
                    local num = tonumber(arg2:GetAttribute("CooldownUntil"))
                    local n12 = num or 0
                    flag9 = n12 <= workspace:GetServerTimeNow()
                end

                if flag9 then
                    local v22 = obj[arg2]
                    local n12 = v22 or 0
                    flag9 = n12 < os.clock()
                end

                return flag9
            end)

            n11 = 19
        elseif n11 == 19 then
            if v18 then
                n11 = 20
            else
                n11 = 29
            end
        elseif n11 == 20 then
            arg.Status = "Moving to ready Halloween door"
            part3 = v18:FindFirstChild("Part")
            proximity = part3

            if part3 then
                n11 = 22
            else
                n11 = 21
            end
        elseif n11 == 21 then
            proximity = v18:FindFirstChild("Proximity")
            n11 = 22
        elseif n11 == 22 then
            cframe3 = proximity

            if proximity then
                n11 = 23
            else
                n11 = 24
            end
        elseif n11 == 23 then
            cframe3 = CFrame.lookAt(proximity.Position + proximity.CFrame.LookVector * 5, proximity.Position)
            n11 = 24
        elseif n11 == 24 then
            if proximity and arg:Move(cframe3, 3) then
                n11 = 25
            else
                n11 = 28
            end
        elseif n11 == 25 then
            now = os.clock()

            if arg.NextAction <= now then
                n11 = 26
            else
                n11 = 28
            end
        elseif n11 == 26 then
            arg.NextAction = os.clock() + 1
            obj[v18] = os.clock() + 20
            now2 = os.clock()
            arg.Door = v18
            arg.OpenedAt = now2

            if halloweenFunction:InvokeServer(v18) then
                n11 = 28
            else
                n11 = 27
            end
        elseif n11 == 27 then
            arg.Door = nil
            n11 = 28
        elseif n11 == 28 then
            return
        elseif n11 == 29 then
            eventIslands = require(ReplicatedStorage6.Modules.Data.SharedEventData).Halloween2025.EventIslands
            v19 = World3
            str2 = v19

            if v19 then
                n11 = 30
            else
                n11 = 31
            end
        elseif n11 == 30 then
            str2 = "Sea3"
            n11 = 31
        elseif n11 == 31 then
            if str2 then
                n11 = 36
            else
                n11 = 32
            end
        elseif n11 == 32 then
            v20 = World2
            str2 = v20

            if v20 then
                n11 = 33
            else
                n11 = 34
            end
        elseif n11 == 33 then
            str2 = "Sea2"
            n11 = 34
        elseif n11 == 34 then
            if str2 then
                n11 = 36
            else
                n11 = 35
            end
        elseif n11 == 35 then
            str2 = "Sea1"
            n11 = 36
        elseif n11 == 36 then
            v21 = eventIslands[str2]

            if localPlayer6:GetAttribute("CurrentLocation") == v21 then
                n11 = 38
            else
                n11 = 37
            end
        elseif n11 == 37 then
            flag8 = false
            n11 = 39
        elseif n11 == 38 then
            flag8 = true
            n11 = 39
        elseif n11 == 39 then
            if flag8 then
                n11 = 43
            else
                n11 = 40
            end
        elseif n11 == 40 then
            if localPlayer6:GetAttribute("ExactLocation") == v21 then
                n11 = 42
            else
                n11 = 41
            end
        elseif n11 == 41 then
            flag8 = false
            n11 = 43
        elseif n11 == 42 then
            flag8 = true
            n11 = 43
        elseif n11 == 43 then
            if flag8 then
                n11 = 47
            else
                n11 = 44
            end
        elseif n11 == 44 then
            now3 = os.clock()
            eventTravelAt = arg.EventTravelAt
            n10 = eventTravelAt

            if eventTravelAt then
                n11 = 46
            else
                n11 = 45
            end
        elseif n11 == 45 then
            n10 = 0
            n11 = 46
        elseif n11 == 46 then
            if n10 <= now3 then
                n11 = 48
            else
                n11 = 47
            end
        elseif n11 == 47 then
            arg.Status = "Waiting for a ready door"
            n11 = 49
        elseif n11 == 48 then
            arg:StopMovement()
            arg.EventTravelAt = os.clock() + 15
            arg.TravelUntil = os.clock() + 8
            arg.Status = "Traveling to Trick Or Treat event"
            remotes.CommF_:InvokeServer("TeleportToSpawn", true)
            n11 = 49
        elseif n11 == 49 then
            return
        elseif n11 == 50 then
            arg.Status = "Waiting for Trick Or Treat event"
            return
        end
    end
end

halloween.PumpkinStep = function(arg)
    local pumpkinHunt = workspace:FindFirstChild("PumpkinHunt")

    local v17 = pumpkinHunt and arg:Nearest(pumpkinHunt:GetChildren(), function(arg2)
        local attribute2 = arg2:GetAttribute("PumpkinState")
        local flag8 = attribute2 == nil or attribute2 == "Idle" or attribute2 == "Whole"
        return flag8
    end)

    if not v17 then
        arg.Status = "Waiting for pumpkins"
        arg:StopMovement()
        return
    end

    arg.Status = "Breaking pumpkin"

    if arg:Move(arg:Position(v17) * CFrame.new(0, 0, 4), 7) then
        EquipWeapon(_G.SelectWeapon)
        local tool = localPlayer6.Character:FindFirstChildOfClass("Tool")

        if tool and (tool.ToolTip == "Melee" or tool.ToolTip == "Sword") then
            local v18 = arg:Root()
            local position = v17:GetPivot().Position
            v18.CFrame = CFrame.lookAt(v18.Position, Vector3.new(position.X, v18.Position.Y, position.Z))
            arg:Strike(tool)
        else
            arg.Status = "Select a melee weapon or sword"
        end
    end
end

halloween.SummonStep = function(arg)
    local n6, dapperJackGateway, n7, dapperJackRitual, v17, now, ritualCheckAt, n8, ritualStatus, dapperJackGateway2, v18, costs, tbl18, v19, v20, v21, v22, v23, v24, response
    local worldOrigin, locations, eventIslands, v25, str, v26, v27, kingdomOfRose, v28, v29, n9
    n9 = 1

    while true do
        if n9 == 1 then
            n6 = 977999639

            if arg.RitualPendingUntil and os.clock() < arg.RitualPendingUntil then
                n9 = 46
            else
                n9 = 2
            end
        elseif n9 == 2 then
            n7 = 827506125

            if os.clock() < arg.NextSummon then
                n9 = 45
            else
                n9 = 3
            end
        elseif n9 == 3 then
            dapperJackRitual = remotes:FindFirstChild("DapperJackRitual")

            if dapperJackRitual then
                n9 = 4
            else
                n9 = 44
            end
        elseif n9 == 4 then
            v17 = arg:Nearest(CollectionService:GetTagged("DapperJackCauldron"), function(arg2)
                return arg2:IsDescendantOf(workspace)
            end)

            if arg.RitualStatus then
                n9 = 5
            else
                n9 = 8
            end
        elseif n9 == 5 then
            now = os.clock()
            ritualCheckAt = arg.RitualCheckAt
            n8 = ritualCheckAt

            if ritualCheckAt then
                n9 = 7
            else
                n9 = 6
            end
        elseif n9 == 6 then
            n8 = 0
            n9 = 7
        elseif n9 == 7 then
            if n8 <= now then
                n9 = 8
            else
                n9 = 9
            end
        elseif n9 == 8 then
            arg.RitualStatus = dapperJackRitual:InvokeServer("Status")
            arg.RitualCheckAt = os.clock() + 5
            n9 = 9
        elseif n9 == 9 then
            ritualStatus = arg.RitualStatus
            arg.NextSummon = os.clock() + 5

            if type(ritualStatus) == "table" and ritualStatus.Open then
                n9 = 11
            else
                n9 = 10
            end
        elseif n9 == 10 then
            arg.Status = "Waiting for Great Pumpkin ritual"
            return false
        elseif n9 == 11 then
            if not ritualStatus.Active and not ritualStatus.Busy then
                n9 = 16
            else
                n9 = 12
            end
        elseif n9 == 12 then
            arg.NextSummon = 0
            arg.Status = "Great Pumpkin ritual active"
            dapperJackGateway2 = workspace:FindFirstChild("DapperJackGateway")

            if dapperJackGateway2 then
                n9 = 13
            else
                n9 = 14
            end
        elseif n9 == 13 then
            arg:Prompt(dapperJackGateway2)
            n9 = 15
        elseif n9 == 14 then
            arg:StopMovement()
            n9 = 15
        elseif n9 == 15 then
            return true
        elseif n9 == 16 then
            v18 = ipairs
            costs = ritualStatus.Costs
            tbl18 = costs

            if costs then
                n9 = 18
            else
                n9 = 17
            end
        elseif n9 == 17 then
            tbl18 = {}
            n9 = 18
        elseif n9 == 18 then
            v19, v20, v21 = v18(tbl18)
            v22 = v21
            n9 = 19
        elseif n9 == 19 then
            v23, v24 = v19(v20, v22)

            if v23 == nil then
                n9 = 22
            else
                n9 = 20
            end
        elseif n9 == 20 then
            v22 = v23

            if v24.Have < v24.Amount then
                n9 = 21
            else
                n9 = 19
            end
        elseif n9 == 21 then
            arg.Status = "Need " .. v24.Amount .. " " .. v24.Name
            return false
        elseif n9 == 22 then
            if v17 then
                n9 = 23
            else
                n9 = 28
            end
        elseif n9 == 23 then
            arg.NextSummon = 0
            arg.Status = "Moving to Witch ritual"

            if arg:Move(arg:Position(v17), 8) then
                n9 = 24
            else
                n9 = 27
            end
        elseif n9 == 24 then
            response = dapperJackRitual:InvokeServer("Summon")
            arg.Status = "Ritual: " .. tostring(response)

            if response ~= "Started" and response ~= "Active" then
                n9 = 26
            else
                n9 = 25
            end
        elseif n9 == 25 then
            arg.RitualPendingUntil = os.clock() + 30
            n9 = 26
        elseif n9 == 26 then
            arg.RitualStatus = nil
            arg.NextSummon = os.clock() + 15
            n9 = 27
        elseif n9 == 27 then
            return true
        elseif n9 == 28 then
            worldOrigin = workspace:FindFirstChild("_WorldOrigin")
            locations = worldOrigin

            if worldOrigin then
                n9 = 29
            else
                n9 = 30
            end
        elseif n9 == 29 then
            locations = worldOrigin:FindFirstChild("Locations")
            n9 = 30
        elseif n9 == 30 then
            eventIslands = require(ReplicatedStorage6.Modules.Data.SharedEventData).Halloween2025.EventIslands
            v25 = World3
            str = v25

            if v25 then
                n9 = 31
            else
                n9 = 32
            end
        elseif n9 == 31 then
            str = "Sea3"
            n9 = 32
        elseif n9 == 32 then
            if str then
                n9 = 37
            else
                n9 = 33
            end
        elseif n9 == 33 then
            v26 = World2
            str = v26

            if v26 then
                n9 = 34
            else
                n9 = 35
            end
        elseif n9 == 34 then
            str = "Sea2"
            n9 = 35
        elseif n9 == 35 then
            if str then
                n9 = 37
            else
                n9 = 36
            end
        elseif n9 == 36 then
            str = "Sea1"
            n9 = 37
        elseif n9 == 37 then
            v27 = eventIslands[str]
            kingdomOfRose = locations

            if locations then
                n9 = 38
            else
                n9 = 41
            end
        elseif n9 == 38 then
            v28 = locations:FindFirstChild(v27)
            kingdomOfRose = v28

            if v28 then
                n9 = 41
            else
                n9 = 39
            end
        elseif n9 == 39 then
            v29 = World2
            kingdomOfRose = v29

            if v29 then
                n9 = 40
            else
                n9 = 41
            end
        elseif n9 == 40 then
            kingdomOfRose = locations:FindFirstChild("Kingdom of Rose")
            n9 = 41
        elseif n9 == 41 then
            arg.Status = "Traveling to Witch cauldron"
            arg.NextSummon = 0

            if kingdomOfRose then
                n9 = 42
            else
                n9 = 43
            end
        elseif n9 == 42 then
            arg:Move(arg:Position(kingdomOfRose), 10)
            n9 = 43
        elseif n9 == 43 then
            return true
        elseif n9 == 44 then
            arg.Status = "Great Pumpkin ritual unavailable in this sea"
            return false
        elseif n9 == 45 then
            return false
        elseif n9 == 46 then
            dapperJackGateway = workspace:FindFirstChild("DapperJackGateway")
            arg.Status = "Waiting for Great Pumpkin gateway"

            if dapperJackGateway then
                n9 = 47
            else
                n9 = 48
            end
        elseif n9 == 47 then
            arg:Prompt(dapperJackGateway)
            n9 = 49
        elseif n9 == 48 then
            arg:StopMovement()
            n9 = 49
        elseif n9 == 49 then
            return true
        end
    end
end

halloween.Dialogue = function(arg)
    local dialogueGui = localPlayer6.PlayerGui:FindFirstChild("DialogueGui")

    if dialogueGui and dialogueGui.Enabled and require(ReplicatedStorage6.DialogueController).Active then
        local now = os.clock()
        local nextClick = arg.NextClick
        local n6 = nextClick or 0

        if n6 <= now then
            local v17 = nil
            local v18 = nil

            for i, v19 in ipairs(dialogueGui:QueryDescendants("GuiButton")) do
                local num = tonumber(v19.Parent.Name:match("option(%d+)$"))

                if v19.Name == "advanceButton" or v19.Name == "pageButton" then
                    num = 100
                end

                if num and v19.Visible and v19.Active and v19.Interactable and (not v18 or num < v18) then
                    v17 = v19
                    v18 = num
                end
            end

            if v17 then
                if firesignal then
                    if #getconnections(v17.Activated) > 0 then
                        firesignal(v17.Activated)
                    else
                        firesignal(v17.MouseButton1Click)
                    end
                end

                arg.NextClick = os.clock() + 0.25
                return
            end
        end
    end

    local main = localPlayer6.PlayerGui:FindFirstChild("Main")
    local dialogue = main and main:FindFirstChild("Dialogue")

    if dialogue and dialogue.Visible then
        local now = os.clock()
        local nextClick = arg.NextClick
        local n6 = nextClick or 0

        if now >= n6 then
            for i, v17 in ipairs(dialogue:QueryDescendants("TextButton, ImageButton")) do
                if v17.Visible and v17.Active then
                    local isTextButton = v17:IsA("TextButton")
                    local text = isTextButton and v17.Text or ""
                    local textLabel = v17:FindFirstChildWhichIsA("TextLabel", true)

                    if textLabel then
                        text = textLabel.Text
                    end

                    local str = text:lower()

                    if str ~= "" and not str:find("decline") and not str:find("cancel") and not str:find("leave") and not str:find("robux") then
                        if firesignal then
                            firesignal(v17.Activated)
                            firesignal(v17.MouseButton1Click)
                        end

                        arg.NextClick = os.clock() + 0.25
                        break
                    end
                end
            end

            return
        end
    end
end

halloween.Cards = function(arg)
    local now = os.clock()
    local nextCard = arg.NextCard
    local n6 = nextCard or 0
    if now < n6 then
        return
    end
    local ConcentrationGame = require(ReplicatedStorage6.Controllers.UI.ConcentrationGame)
    if not ConcentrationGame.IsInitialized or not ConcentrationGame._IsOpen or not ConcentrationGame._GameId then
        return
    end
    local serverBoard = ConcentrationGame._ServerBoard
    if not serverBoard or not serverBoard.Cells then
        return
    end

    if arg.CardGame ~= ConcentrationGame._GameId then
        arg.CardGame = ConcentrationGame._GameId
        arg.CardMemory = {}
    end

    local v17 = nil
    local v18 = nil
    local tbl18 = nil
    local tbl19 = {}

    for i, cell in ipairs(serverBoard.Cells) do
        if cell.Id then
            arg.CardMemory[i] = cell.Id
        end

        if cell.State ~= "Matched" then
            if cell.State == "Revealed" and not ConcentrationGame._HiddenCells[i] then
                v17 = i
            end

            local v19 = arg.CardMemory[i]

            if v19 and tbl19[v19] then
                tbl18 = {tbl19[v19], i}
            elseif v19 then
                tbl19[v19] = i
            end

            if not v19 and not v18 then
                v18 = i
            end
        end
    end

    if ConcentrationGame._IsBusy then
        return
    end
    local v19 = nil
    local v20

    if v17 then
        for k, v21 in pairs(arg.CardMemory) do
            if k ~= v17 and v21 == arg.CardMemory[v17] and serverBoard.Cells[k].State ~= "Matched" then
                v19 = k
                break
            end
        end

        local v21 = v19 or v18
        v20 = v21
    elseif tbl18 then
        v20 = tbl18[1]
    else
        v20 = v18
    end

    if not v20 then
        return
    end

    if not arg.FlipCard and filtergc then
        arg.FlipCard = filtergc("function", {Constants = {"Flip", "GameId", "CellIndex"}}, true)
    end

    if not arg.FlipCard then
        arg.Status = "Card solver unavailable in this executor"
        return
    end
    local v21 = getthreadidentity
    local n7 = v21 and getthreadidentity() or 8

    if setthreadidentity then
        setthreadidentity(2)
    end

    local ok, result = pcall(arg.FlipCard, ConcentrationGame, v20)

    if setthreadidentity then
        setthreadidentity(n7)
    end

    if not ok then
        error(result)
    end

    local now2 = os.clock()
    local n8 = v17 and 0.35 or 0.08
    arg.NextCard = now2 + n8
end

halloween.GachaStep = function(arg)
    if os.clock() < arg.NextGacha then
        return
    end
    arg.NextGacha = os.clock() + 10
    local GachaClient = require(ReplicatedStorage6.Controllers.GachaClient)
    local Halloween26Gacha = GachaClient.CheckGachaAsync("Halloween26Gacha", "Blox Fruit Gacha")

    if type(Halloween26Gacha) == "table" then
        local keys = Halloween26Gacha.Keys
        local requirementMet = keys and Halloween26Gacha.Keys.Silver and Halloween26Gacha.Keys.Silver.RequirementMet
        local paidRandomItemsRestricted = Halloween26Gacha.PaidRandomItemsRestricted
        local value = paidRandomItemsRestricted and Halloween26Gacha.PaidRandomItemsRestricted.Value
        local flag8

        if Halloween26Gacha.Level then
            flag8 = false
        else
            flag8 = true
        end

        if not flag8 then
            flag8 = Halloween26Gacha.Level.RequirementMet ~= false
        end

        local flag9 = flag8

        if flag8 then
            if value then
                flag9 = false
            else
                flag9 = true
            end
        end

        if flag9 then
            flag9 = requirementMet

            if not requirementMet then
                local cooldown = Halloween26Gacha.Cooldown
                flag9 = cooldown and Halloween26Gacha.Cooldown.RequirementMet and Halloween26Gacha.Price and Halloween26Gacha.Price.RequirementMet
            end
        end

        if flag9 then
            local Halloween26Gacha2 = GachaClient.PurchaseGachaAsync("Halloween26Gacha")
            local spookyGacha = type(Halloween26Gacha2) == "table"

            if spookyGacha then
                local v17 = tostring
                local type_ = Halloween26Gacha2.Type
                local success = type_ or Halloween26Gacha2.Success or Halloween26Gacha2.Message or "response received"
                spookyGacha = v17(success)
            end

            if not spookyGacha then
                spookyGacha = tostring(Halloween26Gacha2)
            end

            arg.GachaStatus = "Spooky Gacha: " .. spookyGacha
            arg.NextGacha = os.clock() + 15
        else
            local errorMessage = Halloween26Gacha.ErrorMessage
            local gachaStatus = errorMessage or "Waiting for key, 500 Candy Corn or cooldown"
            arg.GachaStatus = gachaStatus
        end

        arg.Status = arg.GachaStatus
        return
    end

    arg.GachaStatus = "Gacha unavailable"
end

if halloweenEvent then
    table.insert(halloween.Connections, halloweenEvent.OnClientEvent:Connect(function(arg, door, arg2, arg3)
        if arg == "DapperJackCard" and (halloween.Enabled.Bosses or halloween.Enabled.Summon) then
            halloween.BossRewardAt = os.clock() + 2
        end

        if arg == "DoorOpened" and arg2 == localPlayer6 then
            local now = os.clock()
            halloween.Door = door
            halloween.OpenedAt = now
            local event = type(arg3) == "table" and arg3.Event or nil
            halloween.DoorEventName = event
        end

        if arg == "EventFinished" and halloween.Door == door then
            halloween.Door = nil
            halloween.DoorEventName = nil
        end

        if halloween.Enabled.TrickOrTreat and arg == "PromptEventTeleport" then
            halloween:StopMovement()
            halloween.TravelUntil = os.clock() + 8
            halloweenEvent:FireServer("AcceptEventTeleport")
        end
    end))
end

halloween.Step = function(arg)
    local enabled = arg.Enabled
    local flag8 = false

    for k, v17 in pairs(enabled) do
        if v17 then
            flag8 = true
            break
        end
        continue
    end

    if not flag8 then
        arg:StopMovement()
        arg.Status = "Idle"
        return
    end

    if not arg:Root() then
        arg:StopMovement()
        arg.Status = "Waiting for respawn"
        return
    end

    if arg.BossRewardAt then
        local now = os.clock()

        if arg.BossRewardAt <= now and (enabled.Bosses or enabled.Summon) then
            arg.BossRewardAt = nil

            if halloweenEvent then
                halloweenEvent:FireServer("DapperJackCardClaim")
            end
        end
    end

    if arg.TravelUntil and os.clock() < arg.TravelUntil then
        arg:StopMovement()
        arg.Status = "Waiting for event teleport"
        return
    end

    if enabled.Gacha then
        arg:GachaStep()
    end

    local v17 = arg:Enemy(function(arg2)
        local str = arg2.Name:lower()
        local jack = enabled.Jack
        local flag9 = jack

        if not jack then
            local pumpkins = enabled.Pumpkins
            flag9 = pumpkins and (arg2:GetPivot().Position - arg:Root().Position).Magnitude < 120
        end

        local bosses = enabled.Bosses
        local pos = bosses

        if bosses then
            local pos2 = str:find("hellfire")
            pos = pos2 or str:find("hellrider") or str:find("dapper jack") or str:find("great pumpkin")
        end

        if not pos then
            pos = flag9

            if flag9 then
                local trickOrTreat = enabled.TrickOrTreat
                local attribute2 = trickOrTreat and workspace:GetAttribute("HalloweenEventActive")

                if attribute2 then
                    pos = false
                else
                    pos = true
                end
            end

            if pos then
                local pos2 = str:find("jack o")
                pos = pos2 or str:find("pumpkin snowman")
            end
        end

        if not pos then
            local trickOrTreat = enabled.TrickOrTreat
            pos = trickOrTreat and arg2:GetAttribute("LocalEnemy") == localPlayer6.Name
        end

        return pos
    end)

    if not v17 then
        if enabled.Bosses then
            local v18 = arg:Nearest(CollectionService:GetTagged("HellfireBossDoor"), function(arg2)
                local v18 = arg2:IsDescendantOf(workspace)
                local flag9 = v18 and arg2:GetAttribute("BOSS_ACTIVE") == true
                return flag9
            end)

            local part2 = v18 and v18:FindFirstChild("Part")

            if part2 then
                arg.Status = "Entering spawned Hellfire boss"
                arg:Move(part2.CFrame * CFrame.new(0, 0, 4), 2)
                return
            end
        end

        if enabled.TrickOrTreat and (arg.Door or Global.ALREADYINDOOR) then
            arg:DoorStep()
            return
        end

        if enabled.Summon and arg:SummonStep() then
            return
        end

        if enabled.DogHouse and workspace:GetAttribute("DogHouseAdminAbuseActive") then
            local dogHouseAdminAbuseEnvironment = workspace:FindFirstChild("DogHouseAdminAbuseEnvironment")
            local v18 = dogHouseAdminAbuseEnvironment and arg:Position(dogHouseAdminAbuseEnvironment)

            local v19 = v18 and arg:Enemy(function(arg2)
                local flag9 = (arg2:GetPivot().Position - v18.Position).Magnitude < 1200
                return flag9
            end)

            if not v19 then
                if workspace:GetAttribute("DogHouseJoinable") then
                    local now = os.clock()
                    local nextDogHouse = arg.NextDogHouse
                    local n6 = nextDogHouse or 0

                    if n6 <= now then
                        local doghouse = workspace.NPCs:FindFirstChild("Doghouse")
                        local dogHouse = doghouse or workspace.NPCs:FindFirstChild("Dog House")
                        if dogHouse and not arg:Move(arg:Position(dogHouse), 8) then
                            arg.Status = "Moving to Dog House"
                            return
                        end
                        arg.NextDogHouse = os.clock() + 10
                        remotes.CommF_:InvokeServer("DogHouse", "indra")
                    end
                end

                arg.Status = "Waiting for Dog House wave"
                return
            end

            arg:Fight(v19)
            return
        end

        if enabled.TrickOrTreat and workspace:GetAttribute("HalloweenEventActive") then
            arg:DoorStep()
            return
        end

        if not enabled.Pumpkins then
            if enabled.Candy then
                local v18 = World3
                local flag9 = v18 and (localPlayer6.Data.Level.Value >= 2600 or IsInSubmergedIsland())
                local v19 = World3
                local v20 = v19

                if v19 then
                    v20 = flag9

                    if flag9 then
                        local tbl18 = {}
                        v20 = tbl18
                        tbl18[1] = "Reef Bandit"
                        tbl18[2] = "Coral Pirate"
                        tbl18[3] = "Sea Chanter"
                        tbl18[4] = "Ocean Prophet"
                        tbl18[5] = "High Disciple"
                        tbl18[6] = "Grand Devotee"
                    end

                    if not v20 then
                        local tbl18 = {}
                        v20 = tbl18
                        tbl18[1] = "Isle Outlaw"
                        tbl18[2] = "Island Boy"
                        tbl18[3] = "Sun-kissed Warrior"
                        tbl18[4] = "Isle Champion"
                    end
                end

                if not v20 then
                    local v21 = World2
                    v20 = v21

                    if v21 then
                        local tbl18 = {}
                        v20 = tbl18
                        tbl18[1] = "Sea Soldier"
                        tbl18[2] = "Water Fighter"
                    end

                    if not v20 then
                        local tbl18 = {}
                        v20 = tbl18
                        tbl18[1] = "Galley Pirate"
                        tbl18[2] = "Galley Captain"
                    end
                end

                local v21 = arg:Enemy(function(arg2)
                    local flag10 = table.find(v20, arg2.Name) ~= nil
                    return flag10
                end)

                if v21 then
                    arg:Fight(v21)
                    return
                end
                local worldOrigin = workspace:FindFirstChild("_WorldOrigin")
                local enemySpawns = worldOrigin and worldOrigin:FindFirstChild("EnemySpawns")

                local v22 = enemySpawns and arg:Nearest(enemySpawns:GetChildren(), function(arg2)
                    for i, v22 in ipairs(v20) do
                        if arg2.Name:find(v22, 1, true) then
                            return true
                        end
                    end

                    return false
                end)

                arg.Status = "Moving to candy NPCs at the final island"
                if v22 then
                    arg:Move(arg:Position(v22), 10)
                    return
                end
                local locations = worldOrigin and worldOrigin:FindFirstChild("Locations")
                local v23 = World3
                local str = v23 and (flag9 and "Submerged Island" or "Tiki Outpost")

                if not str then
                    local v24 = World2
                    str = v24 and "Forgotten Island" or "Fountain City"
                end

                local v24 = locations and locations:FindFirstChild(str)
                if v24 then
                    arg:Move(arg:Position(v24), 10)
                    return
                end
                arg.Status = "Waiting for final-island enemy spawns"
            elseif enabled.TrickOrTreat then
                arg:DoorStep()
            elseif not enabled.Bosses and not enabled.Jack then
                if enabled.DogHouse then
                    arg.Status = "Waiting for Dog House event"
                end
            else
                arg.Status = "Waiting for Halloween enemies"
            end

            arg:StopMovement()
            return
        end

        arg:PumpkinStep()
        return
    end

    arg:Fight(v17)
end

task.spawn(function()
    while halloween.Live and task.wait(0.25) do
        local ok, result = pcall(halloween.Step, halloween)

        if not ok then
            halloween.Errors = halloween.Errors + 1
            halloween.LastError = tostring(result)
            halloween:StopMovement()
            halloween.Status = "Halloween error: " .. halloween.LastError
            task.wait(2)
        end
    end
end)
