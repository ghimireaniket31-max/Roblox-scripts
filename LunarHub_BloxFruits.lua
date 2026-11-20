ply = game.Players
plr = ply.LocalPlayer
Root = plr.Character.HumanoidRootPart
replicated = game:GetService("ReplicatedStorage")
Lv = game.Players.LocalPlayer.Data.Level.Value
TeleportService = game:GetService("TeleportService")
TW = game:GetService("TweenService")
Lighting = game:GetService("Lighting")
Enemies = workspace.Enemies
vim1 = game:GetService("VirtualInputManager")
vim2 = game:GetService("VirtualUser")
TeamSelf = plr.Team
RunSer = game:GetService("RunService")
Stats = game:GetService("Stats")
Energy = plr.Character.Energy.Value
BringConnections = {}
BossList = {}
MaterialList = {}
NPCList = {}
shouldTween = false
SoulGuitar = false
KenTest = true
debug = false
Brazier1 = false
Brazier2 = false
Brazier3 = false
Sec = 0.1
ClickState = 0
Num_self = 25

local Loading

repeat
	Loading = plr.PlayerGui:WaitForChild("Main"):WaitForChild("Loading") and game:IsLoaded()
	wait()
until Loading

World1 = game.PlaceId == 2753915549 or game.PlaceId == 85211729168715
World2 = game.PlaceId == 4442272183 or game.PlaceId == 79091703265657
World3 = game.PlaceId == 7449423635 or game.PlaceId == 100117331123089
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
		"Greybeard"
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
		"Order"
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
		"Tyrant of the Skies"
	}
end

if World1 then
	MaterialList = {
		"Leather + Scrap Metal",
		"Angel Wings",
		"Magma Ore",
		"Fish Tail"
	}
elseif World2 then
	MaterialList = {
		"Leather + Scrap Metal",
		"Radioactive Material",
		"Ectoplasm",
		"Mystic Droplet",
		"Magma Ore",
		"Vampire Fang"
	}
elseif World3 then
	MaterialList = {
		"Scrap Metal",
		"Demonic Wisp",
		"Conjured Cocoa",
		"Dragon Scale",
		"Gunpowder",
		"Fish Tail",
		"Mini Tusk"
	}
end

local t1 = {
	"Snow Lurker",
	"Arctic Warrior",
	"Hidden Key",
	"Awakened Ice Admiral"
}
local t2 = {
	"Part",
	"SpawnLocation",
	"Terrain",
	"WedgePart",
	"MeshPart"
}
local t3 = {
	"Swan Pirate",
	"Jeremy"
}
local t4 = {
	"Fajita",
	"Jeremy",
	"Diamond"
}
local t5 = { "Cookie Crafter" }
local t6 = { "Reborn Skeleton" }
local t7 = {
	["Pirate Millionaire"] = CFrame.new(-712.8272705078125, 98.577049255371094, 5711.9541015625),
	["Pistol Billionaire"] = CFrame.new(-723.43316650390625, 147.42906188964844, 5931.9931640625),
	["Dragon Crew Warrior"] = CFrame.new(7021.50439453125, 55.762702941894531, -730.12908935546875),
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
	Ghost = CFrame.new(5251, 5, 1111)
}
local t8 = {
	RFJobsRemoteFunction = replicated.Modules.Net["RF/JobsRemoteFunction"],
	RFCraft = replicated:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/Craft")
}

EquipWeapon = function(p1)
	local Character = plr.Character

	Character = Character and plr.Character:FindFirstChildOfClass("Humanoid")

	if not plr.Character or not Character then
		return false
	end

	local v11 = p1 and plr.Backpack:FindFirstChild(p1)

	if not v11 and p1 then
		v11 = plr.Character:FindFirstChild(p1)
	end

	if not v11 and _G.ChooseWP then
		for _, child in ipairs(plr.Backpack:GetChildren()) do
			if child:IsA("Tool") and child.ToolTip == _G.ChooseWP then
				v11 = child
				_G.SelectWeapon = child.Name

				break
			end
		end
	end

	if v11 and v11.Parent ~= plr.Character then
		Character:EquipTool(v11)
	end

	return v11 ~= nil
end
weaponSc = function(p2)
	if not p2 then
		return false
	end

	for _, child in ipairs(plr.Backpack:GetChildren()) do
		if child:IsA("Tool") then
			if child.ToolTip ~= p2 then
				continue
			end

			_G.SelectWeapon = child.Name
			EquipWeapon(child.Name)

			return true
		end
	end

	return false
end
task.spawn(function()
	while task.wait(0.35) do
		pcall(function()
			if _G.ChooseWP then
				if getgenv().OnFarm then
					local Character = plr.Character
					local Tool = Character and Character:FindFirstChildOfClass("Tool")

					if not Tool or Tool.ToolTip ~= _G.ChooseWP then
						weaponSc(_G.ChooseWP)
					end

					return
				end
			end
		end)
	end
end)

local t9 = {}

t9.__index = t9
t9.Alive = function(p3)
	if not p3 then
		return false
	end

	local Humanoid = p3:FindFirstChild("Humanoid")
	local HumanoidRootPart = p3:FindFirstChild("HumanoidRootPart")

	return Humanoid and HumanoidRootPart and Humanoid.Health > 0
end
t9.Pos = function(p4, p5)
	return (Root.Position - mode.Position).Magnitude <= p5
end
t9.Dist = function(p6, p7)
	return (Root.Position - p6:FindFirstChild("HumanoidRootPart").Position).Magnitude <= p7
end
t9.DistH = function(p8, p9)
	return (Root.Position - p8:FindFirstChild("HumanoidRootPart").Position).Magnitude > p9
end

local u21
local n1 = 0

local function v23(p10)
	if p10 then
		if p10.Parent and t9.Alive(p10) then
			if u21 and u21 ~= p10 then
				if u21.Parent and t9.Alive(u21) and tick() < n1 then
					return false
				end

				u21 = nil
			end

			u21 = p10
			n1 = tick() + 3

			return true
		end
	end

	if u21 == p10 then
		u21 = nil
	end

	return false
end

t9.Kill = function(p11, p12)
	if p11 then
		if p12 then
			if not v23(p11) then
				return
			end

			if not p11:GetAttribute("Locked") then
				p11:SetAttribute("Locked", p11.HumanoidRootPart.CFrame)
			end

			PosMon = p11:GetAttribute("Locked").Position
			BringEnemy()
			EquipWeapon(_G.SelectWeapon)

			local Tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
			local ToolTip = Tool and Tool.ToolTip

			if (ToolTip or "") == "Blox Fruit" then
				_tp(p11.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0) * CFrame.Angles(0, math.rad(90), 0))
			else
				_tp(p11.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0) * CFrame.Angles(0, math.rad(180), 0))
			end

			if RandomCFrame then
				wait(0.5)
				_tp(p11.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
				wait(0.5)
				_tp(p11.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0))
				wait(0.5)
				_tp(p11.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
				wait(0.5)
				_tp(p11.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
				wait(0.5)
				_tp(p11.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
			end
		end
	end
end
t9.Kill2 = function(p13, p14)
	if p13 and p14 then
		if not v23(p13) then
			return
		end

		if not p13:GetAttribute("Locked") then
			p13:SetAttribute("Locked", p13.HumanoidRootPart.CFrame)
		end

		PosMon = p13:GetAttribute("Locked").Position
		BringEnemy()
		EquipWeapon(_G.SelectWeapon)

		local Tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")

		if (Tool and Tool.ToolTip or "") == "Blox Fruit" then
			_tp(p13.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0) * CFrame.Angles(0, math.rad(90), 0))
		else
			_tp(p13.HumanoidRootPart.CFrame * CFrame.new(0, 30, 8) * CFrame.Angles(0, math.rad(180), 0))
		end

		if RandomCFrame then
			wait(0.1)
			_tp(p13.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
			wait(0.1)
			_tp(p13.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0))
			wait(0.1)
			_tp(p13.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
			wait(0.1)
			_tp(p13.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
			wait(0.1)
			_tp(p13.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
		end
	end
end
t9.KillSea = function(p15, p16)
	if p15 then
		if p16 then
			if not v23(p15) then
				return
			end

			if not p15:GetAttribute("Locked") then
				p15:SetAttribute("Locked", p15.HumanoidRootPart.CFrame)
			end

			PosMon = p15:GetAttribute("Locked").Position
			BringEnemy()
			EquipWeapon(_G.SelectWeapon)

			local Tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")

			if (Tool and Tool.ToolTip or "") == "Blox Fruit" then
				_tp(p15.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0) * CFrame.Angles(0, math.rad(90), 0))
			else
				notween(p15.HumanoidRootPart.CFrame * CFrame.new(0, 50, 8))
				wait(0.85)
				notween(p15.HumanoidRootPart.CFrame * CFrame.new(0, 400, 0))
				wait(1)
			end
		end
	end
end
t9.Sword = function(p17, p18)
	if p17 and p18 then
		if not v23(p17) then
			return
		end

		if not p17:GetAttribute("Locked") then
			p17:SetAttribute("Locked", p17.HumanoidRootPart.CFrame)
		end

		PosMon = p17:GetAttribute("Locked").Position
		BringEnemy()
		weaponSc("Sword")
		_tp(p17.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))

		if RandomCFrame then
			wait(0.1)
			_tp(p17.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
			wait(0.1)
			_tp(p17.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0))
			wait(0.1)
			_tp(p17.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
			wait(0.1)
			_tp(p17.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
			wait(0.1)
			_tp(p17.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
		end
	end
end
t9.Mas = function(p19, p20)
	if p19 and p20 then
		if not v23(p19) then
			return
		end

		if not p19:GetAttribute("Locked") then
			p19:SetAttribute("Locked", p19.HumanoidRootPart.CFrame)
		end

		PosMon = p19:GetAttribute("Locked").Position
		BringEnemy()

		if p19.Humanoid.Health <= HealthM then
			_tp(p19.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
			Useskills("Blox Fruit", "Z")
			Useskills("Blox Fruit", "X")
			Useskills("Blox Fruit", "C")
		else
			weaponSc("Melee")
			_tp(p19.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
		end
	end
end
t9.Masgun = function(p21, p22)
	if p21 and p22 then
		if not v23(p21) then
			return
		end

		if not p21:GetAttribute("Locked") then
			p21:SetAttribute("Locked", p21.HumanoidRootPart.CFrame)
		end

		PosMon = p21:GetAttribute("Locked").Position
		BringEnemy()

		if p21.Humanoid.Health <= HealthM then
			_tp(p21.HumanoidRootPart.CFrame * CFrame.new(0, 35, 8))
			Useskills("Gun", "Z")
			Useskills("Gun", "X")
		else
			weaponSc("Melee")
			_tp(p21.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
		end
	end
end
statsSetings = function(p23, p24)
	if p23 == "Melee" then
		if plr.Data.Points.Value ~= 0 then
			replicated.Remotes.CommF_:InvokeServer("AddPoint", "Melee", p24)
		end
	elseif p23 == "Defense" then
		if plr.Data.Points.Value ~= 0 then
			replicated.Remotes.CommF_:InvokeServer("AddPoint", "Defense", p24)
		end
	elseif p23 == "Sword" then
		if plr.Data.Points.Value ~= 0 then
			replicated.Remotes.CommF_:InvokeServer("AddPoint", "Sword", p24)
		end
	elseif p23 == "Gun" then
		if plr.Data.Points.Value ~= 0 then
			replicated.Remotes.CommF_:InvokeServer("AddPoint", "Gun", p24)
		end
	elseif p23 == "Devil" and plr.Data.Points.Value ~= 0 then
		replicated.Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", p24)
	end
end
BringEnemy = function(p25)
	if not _B then
		return
	end

	if not p25 then
		local HumanoidRootPart = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")

		if not HumanoidRootPart then
			return
		end

		local huge = math.huge

		for _, child in ipairs(workspace.Enemies:GetChildren()) do
			local Humanoid = child:FindFirstChildOfClass("Humanoid")
			local HumanoidRootPart2 = child:FindFirstChild("HumanoidRootPart")

			if Humanoid and HumanoidRootPart2 and Humanoid.Health > 0 then
				local Magnitude = (HumanoidRootPart2.Position - HumanoidRootPart.Position).Magnitude

				if Magnitude < huge then
					huge = Magnitude
					p25 = child
				end
			end
		end

		if not p25 then
			return
		end
	end

	local u35 = false

	local function v36(p26)
		local Humanoid = p26:FindFirstChildOfClass("Humanoid")
		local HumanoidRootPart = p26:FindFirstChild("HumanoidRootPart")

		return Humanoid and HumanoidRootPart and Humanoid.Health > 0, HumanoidRootPart, Humanoid
	end
	local function v39(p27)
		if isnetworkowner then
			return isnetworkowner(p27)
		end

		return p27.ReceiveAge == 0 and not p27.Anchored and p27.Velocity.Magnitude > 0
	end

	pcall(function()
		if sethiddenproperty then
			sethiddenproperty(plr, "SimulationRadius", math.huge)
		end

		local Position = p25.HumanoidRootPart.Position

		for _, child in ipairs(workspace.Enemies:GetChildren()) do
			if child ~= p25 then
				local v43, v44, v45 = v36(child)

				if v43 and child.Name == p25.Name then
					local Magnitude = (v44.Position - Position).Magnitude

					if Magnitude <= 3000 then
						if not v44:FindFirstChild("BodyVelocity") then
							local BodyVelocity = Instance.new("BodyVelocity")

							BodyVelocity.Name = "BodyVelocity"
							BodyVelocity.MaxForce = Vector3.new(1e9, 1e9, 1e9)
							BodyVelocity.Velocity = Vector3.zero
							BodyVelocity.Parent = v44
						end

						if Magnitude <= 10 then
							u35 = true
						end

						if not u35 and v39(v44) then
							v44.CFrame = CFrame.new(Position)
						end

						v44.CanCollide = false
						v45.WalkSpeed = 0
						v45.JumpPower = 0
					end
				end
			end
		end

		if p25 and p25:FindFirstChild("HumanoidRootPart") then
			p25.HumanoidRootPart.CanCollide = false
			p25.Humanoid.WalkSpeed = 0
			p25.Humanoid.JumpPower = 0
		end
	end)
end
Useskills = function(p28, p29)
	if p28 == "Melee" then
		weaponSc("Melee")

		if p29 == "Z" then
			vim1:SendKeyEvent(true, "Z", false, game)
			vim1:SendKeyEvent(false, "Z", false, game)
		elseif p29 == "X" then
			vim1:SendKeyEvent(true, "X", false, game)
			vim1:SendKeyEvent(false, "X", false, game)
		elseif p29 == "C" then
			vim1:SendKeyEvent(true, "C", false, game)
			vim1:SendKeyEvent(false, "C", false, game)
		end
	elseif p28 == "Sword" then
		weaponSc("Sword")

		if p29 == "Z" then
			vim1:SendKeyEvent(true, "Z", false, game)
			vim1:SendKeyEvent(false, "Z", false, game)
		elseif p29 == "X" then
			vim1:SendKeyEvent(true, "X", false, game)
			vim1:SendKeyEvent(false, "X", false, game)
		end
	elseif p28 == "Blox Fruit" then
		weaponSc("Blox Fruit")

		if p29 == "Z" then
			vim1:SendKeyEvent(true, "Z", false, game)
			vim1:SendKeyEvent(false, "Z", false, game)
		elseif p29 == "X" then
			vim1:SendKeyEvent(true, "X", false, game)
			vim1:SendKeyEvent(false, "X", false, game)
		elseif p29 == "C" then
			vim1:SendKeyEvent(true, "C", false, game)
			vim1:SendKeyEvent(false, "C", false, game)
		elseif p29 == "V" then
			vim1:SendKeyEvent(true, "V", false, game)
			vim1:SendKeyEvent(false, "V", false, game)
		end
	elseif p28 == "Gun" then
		weaponSc("Gun")

		if p29 == "Z" then
			vim1:SendKeyEvent(true, "Z", false, game)
			vim1:SendKeyEvent(false, "Z", false, game)
		elseif p29 == "X" then
			vim1:SendKeyEvent(true, "X", false, game)
			vim1:SendKeyEvent(false, "X", false, game)
		end
	end

	if p28 == "nil" and p29 == "Y" then
		vim1:SendKeyEvent(true, "Y", false, game)
		vim1:SendKeyEvent(false, "Y", false, game)
	end
end

local v48 = getrawmetatable(game)
local __namecall = v48.__namecall

setreadonly(v48, false)
v48.__namecall = newcclosure(function(...)
	local v50 = getnamecallmethod()
	local t10 = { ... }

	if tostring(v50) == "FireServer" and tostring(t10[1]) == "RemoteEvent" then
		if tostring(t10[2]) ~= "true" then
			if tostring(t10[2]) ~= "false" and (_G.FarmMastery_G and not SoulGuitar or _G.FarmMastery_Dev or _G.FarmBlazeEM or _G.Prehis_Skills or _G.SeaBeast1 or _G.FishBoat or _G.PGB or _G.Leviathan1 or _G.Complete_Trials or _G.AimMethod and ABmethod == "Aim Player" or _G.AimMethod and ABmethod == "Nearest Aim") then
				t10[2] = MousePos

				return __namecall(unpack(t10))
			end
		end
	end

	return __namecall(...)
end)
GetConnectionEnemies = function(p30)
	for _, child in pairs(replicated:GetChildren()) do
		if child:IsA("Model") then
			if not (typeof(p30) == "table" and table.find(p30, child.Name) or child.Name == p30) then
				continue
			end

			if not child:FindFirstChild("Humanoid") then
				continue
			end

			if child.Humanoid.Health > 0 then
				return child
			end
		end
	end

	local children, v55 = game.Workspace.Enemies:GetChildren()

	for _, v in next, children, v55 do
		if v:IsA("Model") and (typeof(p30) == "table" and table.find(p30, v.Name) or v.Name == p30) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
			return v
		end
	end
end
LowCpu = function()
	local Terrain = game.Workspace.Terrain

	Terrain.WaterWaveSize = 0
	Terrain.WaterWaveSpeed = 0
	Terrain.WaterReflectance = 0
	Terrain.WaterTransparency = 0
	game.Lighting.GlobalShadows = false
	game.Lighting.FogEnd = 9e9
	game.Lighting.Brightness = 0
	settings().Rendering.QualityLevel = "Level01"

	for _, descendant in pairs(game:GetDescendants()) do
		if descendant:IsA("Part") or descendant:IsA("Union") or descendant:IsA("CornerWedgePart") or descendant:IsA("TrussPart") then
			descendant.Material = "Plastic"
			descendant.Reflectance = 0
		else
			if not descendant:IsA("Decal") then
				if not descendant:IsA("Texture") then
					if descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") then
						descendant.Lifetime = NumberRange.new(0)
					elseif descendant:IsA("Explosion") then
						descendant.BlastPressure = 1
						descendant.BlastRadius = 1
					elseif descendant:IsA("Fire") or descendant:IsA("SpotLight") or descendant:IsA("Smoke") or descendant:IsA("Sparkles") then
						descendant.Enabled = false
					elseif descendant:IsA("MeshPart") then
						descendant.Material = "Plastic"
						descendant.Reflectance = 0
						descendant.TextureID = 10385902758728956
					end

					continue
				end
			end

			descendant.Transparency = 1
		end
	end

	for _, child in pairs(game.Lighting:GetChildren()) do
		if child:IsA("BlurEffect") or child:IsA("SunRaysEffect") or child:IsA("ColorCorrectionEffect") or child:IsA("BloomEffect") or child:IsA("DepthOfFieldEffect") then
			child.Enabled = false
		end
	end
end
CheckF = function()
	if GetBP("Dragon-Dragon") or GetBP("Gas-Gas") or GetBP("Yeti-Yeti") or GetBP("Kitsune-Kitsune") or GetBP("T-Rex-T-Rex") then
		return true
	end
end
CheckBoat = function()
	for _, child in pairs(workspace.Boats:GetChildren()) do
		if tostring(child.Owner.Value) == tostring(plr.Name) then
			return child
		end
	end

	return false
end
CheckEnemiesBoat = function()
	for _, child in pairs(workspace.Enemies:GetChildren()) do
		if child.Name == "FishBoat" and child:FindFirstChild("Health").Value > 0 then
			return true
		end
	end

	return false
end
CheckPirateGrandBrigade = function()
	for _, child in pairs(workspace.Enemies:GetChildren()) do
		if (child.Name == "PirateGrandBrigade" or child.Name == "PirateBrigade") and child:FindFirstChild("Health").Value > 0 then
			return true
		end
	end

	return false
end
CheckShark = function()
	for _, child in pairs(workspace.Enemies:GetChildren()) do
		if child.Name == "Shark" and t9.Alive(child) then
			return true
		end
	end

	return false
end
CheckTerrorShark = function()
	for _, child in pairs(workspace.Enemies:GetChildren()) do
		if child.Name == "Terrorshark" then
			if t9.Alive(child) then
				return true
			end
		end
	end

	return false
end
CheckPiranha = function()
	for _, child in pairs(workspace.Enemies:GetChildren()) do
		if child.Name == "Piranha" and t9.Alive(child) then
			return true
		end
	end

	return false
end
CheckFishCrew = function()
	for _, child in pairs(workspace.Enemies:GetChildren()) do
		if child.Name ~= "Fish Crew Member" then
			if child.Name ~= "Haunted Crew Member" then
				continue
			end
		end

		if t9.Alive(child) then
			return true
		end
	end

	return false
end
CheckHauntedCrew = function()
	for _, child in pairs(workspace.Enemies:GetChildren()) do
		if child.Name == "Haunted Crew Member" and t9.Alive(child) then
			return true
		end
	end

	return false
end
CheckSeaBeast = function()
	if workspace.SeaBeasts:FindFirstChild("SeaBeast1") then
		return true
	end

	return false
end
CheckLeviathan = function()
	if workspace.SeaBeasts:FindFirstChild("Leviathan") then
		return true
	end

	return false
end
UpdStFruit = function()
	local children, v80 = plr.Backpack:GetChildren()

	for _, v in next, children, v80 do
		StoreFruit = v:FindFirstChild("EatRemote", true)

		if StoreFruit then
			replicated.Remotes.CommF_:InvokeServer("StoreFruit", StoreFruit.Parent:GetAttribute("OriginalName"), plr.Backpack:FindFirstChild(v.Name))
		end
	end
end
collectFruits = function(p31)
	if p31 then
		local Character = plr.Character

		for _, child in pairs(workspace:GetChildren()) do
			if string.find(child.Name, "Fruit") then
				child.Handle.CFrame = Character.HumanoidRootPart.CFrame
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

	if World3 then
		return Lighting.Sky.MoonTextureId
	end
end
DropFruits = function()
	local children, v87 = plr.Backpack:GetChildren()

	for _, v in next, children, v87 do
		if string.find(v.Name, "Fruit") then
			EquipWeapon(v.Name)
			wait(0.1)

			if plr.PlayerGui.Main.Dialogue.Visible == true then
				plr.PlayerGui.Main.Dialogue.Visible = false
			end

			EquipWeapon(v.Name)
			plr.Character:FindFirstChild(v.Name).EatRemote:InvokeServer("Drop")
		end
	end

	for _, child in pairs(plr.Character:GetChildren()) do
		if string.find(child.Name, "Fruit") then
			EquipWeapon(child.Name)
			wait(0.1)

			if plr.PlayerGui.Main.Dialogue.Visible == true then
				plr.PlayerGui.Main.Dialogue.Visible = false
			end

			EquipWeapon(child.Name)
			plr.Character:FindFirstChild(child.Name).EatRemote:InvokeServer("Drop")
		end
	end
end
GetBP = function(p32)
	return plr.Backpack:FindFirstChild(p32) or plr.Character:FindFirstChild(p32)
end
GetIn = function(p33)
	for _, v in pairs(replicated.Remotes.CommF_:InvokeServer("getInventory")) do
		if type(v) == "table" then
			if v.Name == p33 then
				return true
			end

			if plr.Character:FindFirstChild(p33) then
				return true
			end

			if plr.Backpack:FindFirstChild(p33) then
				return true
			end
		end
	end

	return false
end
GetM = function(p34)
	for _, v in pairs(replicated.Remotes.CommF_:InvokeServer("getInventory")) do
		if type(v) == "table" then
			if v.Type ~= "Material" then
				continue
			end

			if v.Name == p34 then
				return v.Count
			end
		end
	end

	return 0
end
GetWP = function(p35)
	for _, v in pairs(replicated.Remotes.CommF_:InvokeServer("getInventory")) do
		if type(v) == "table" and v.Type == "Sword" then
			if v.Name == p35 then
				return true
			end

			if plr.Character:FindFirstChild(p35) then
				return true
			end

			if plr.Backpack:FindFirstChild(p35) then
				return true
			end
		end
	end

	return false
end
getInfinity_Ability = function(p36, p37)
	if not Root then
		return
	end

	if p36 == "Soru" and p37 then
		local next_ = next
		local v99, v100 = getgc()

		for _, v in next_, v99, v100 do
			if plr.Character.Soru and typeof(v) == "function" and getfenv(v).script == plr.Character.Soru then
				local next_2 = next
				local v104, v105 = getupvalues(v)

				for _, v2 in next_2, v104, v105 do
					if typeof(v2) == "table" then
						repeat
							wait(Sec)
							v2.LastUse = 0
						until plr.Character.Humanoid.Health <= 0
					end
				end
			end
		end
	elseif p36 == "Energy" and p37 then
		plr.Character.Energy.Changed:connect(function()
			if p37 then
				plr.Character.Energy.Value = Energy
			end
		end)
	elseif p36 == "Observation" and p37 then
		plr.VisionRadius.Value = math.huge
	end
end
Hop = function()
	pcall(function()
		for i = math.random(1, math.random(40, 75)), 100 do
			for k, v in next, replicated.__ServerBrowser:InvokeServer(i), nil do
				if tonumber(v.Count) < 12 then
					TeleportService:TeleportToPlaceInstance(game.PlaceId, k)
				end
			end
		end
	end)
end

local Part = Instance.new("Part", workspace)

Part.Size = Vector3.new(1, 1, 1)
Part.Name = "Rip_Indra"
Part.Anchored = true
Part.CanCollide = false
Part.CanTouch = false
Part.Transparency = 1

local PartName = workspace:FindFirstChild(Part.Name)

if PartName and PartName ~= Part then
	PartName:Destroy()
end

task.spawn(function()
	while task.wait() do
		if Part and Part.Parent == workspace then
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
	local LocalPlayer = game.Players.LocalPlayer

	while true do
		task.wait()

		if not LocalPlayer.Character then
			continue
		end

		if LocalPlayer.Character.PrimaryPart then
			break
		end
	end

	Part.CFrame = LocalPlayer.Character.PrimaryPart.CFrame

	while task.wait() do
		pcall(function()
			if getgenv().OnFarm then
				if Part and Part.Parent == workspace then
					local PrimaryPart = LocalPlayer.Character and LocalPlayer.Character.PrimaryPart

					if PrimaryPart and (PrimaryPart.Position - Part.Position).Magnitude <= 200 then
						PrimaryPart.CFrame = Part.CFrame
					else
						Part.CFrame = PrimaryPart.CFrame
					end
				end

				local Character = LocalPlayer.Character

				if Character then
					for _, child in pairs(Character:GetChildren()) do
						if child:IsA("BasePart") then
							child.CanCollide = false
						end
					end
				end
			else
				local Character = LocalPlayer.Character

				if Character then
					for _, child in pairs(Character:GetChildren()) do
						if child:IsA("BasePart") then
							child.CanCollide = true
						end
					end
				end
			end
		end)
	end
end)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer

sea1 = game.PlaceId == 2753915549 or game.PlaceId == 85211729168715
sea2 = game.PlaceId == 4442272183 or game.PlaceId == 79091703265657
sea3 = game.PlaceId == 7449423635 or game.PlaceId == 100117331123089

local t11 = {
	["Tween Speed"] = 175,
	["Bypass Teleport"] = true,
	["Up Y"] = false,
	["Up Y When Low Health"] = false,
	["Same Y"] = false
}
local n2 = 0
local u127
local cFrame = CFrame.new(10641.0918, -1953.92981, 9825.07031, -0.652825892, -9.2805891e-08, -0.757508039, -2.73638356e-08, 1, -9.89323823e-08, 0.757508039, -4.38572947e-08, -0.652825892)
local cFrame2 = CFrame.new(-16271.126, 25.5847301, 1371.98755, 0.999396622, -5.78875188e-08, -0.0347310975, 5.52972779e-08, 1, -8.7544322e-08, 0.034731105, 8.28877091e-08, 0.999396741)

Convert_CFrame = function(p38)
	if not p38 then
		return
	end

	if typeof(p38) == "Vector3" then
		return CFrame.new(p38)
	end

	if typeof(p38) == "CFrame" then
		return p38
	end

	if typeof(p38) == "Model" then
		return p38:GetPivot()
	end

	if p38.CFrame then
		return p38.CFrame
	end

	return nil
end
GetDistance = function(p39, p40, p41)
	if p39 == nil then
		return 9e9
	end

	local Character = LocalPlayer.Character

	if not Character then
		return 9e9
	end

	local Humanoid = Character:FindFirstChild("Humanoid")

	if not Humanoid or Humanoid.Health <= 0 then
		return 9e9
	end

	if p40 == nil then
		p40 = Character:FindFirstChild("HumanoidRootPart")

		if not p40 then
			return 9e9
		end
	end

	local v132 = Convert_CFrame(p39)
	local v133 = Convert_CFrame(p40)

	if p41 then
		return (Vector3.new(v132.X, 0, v132.Z) - Vector3.new(v133.X, 0, v133.Z)).Magnitude
	end

	return (v132.Position - v133.Position).Magnitude
end
InArea = function(p42)
	local _WorldOrigin = workspace:FindFirstChild("_WorldOrigin")

	if not _WorldOrigin then
		return {
			Name = ""
		}
	end

	local v135 = Convert_CFrame(p42)
	local children, v137 = _WorldOrigin.Locations:GetChildren()

	for _, v in next, children, v137 do
		if v:FindFirstChild("Mesh") and (v135.Position - v.Position).Magnitude <= v.Mesh.Scale.X then
			return v
		end
	end

	return {
		Name = ""
	}
end
GetSpawnPoint = function(p43)
	local Pirates_ = workspace:FindFirstChild("_WorldOrigin") and workspace._WorldOrigin:FindFirstChild("PlayerSpawns") and workspace._WorldOrigin.PlayerSpawns:FindFirstChild("Pirates")

	if not Pirates_ then
		return
	end

	local children, v142 = Pirates_:GetChildren()

	for _, v in next, children, v142 do
		if v:FindFirstChild("Part") then
			if (v.Part.Position - p43.Position).Magnitude <= 2500 then
				return v
			end
		end
	end
end
CheckLegendaryItems = function()
	local function v145(p44)
		local children, v147 = LocalPlayer.Backpack:GetChildren()

		for _, v in next, children, v147 do
			if v:IsA("Tool") and (v.Name == p44 or string.find(v.Name, p44)) then
				return v
			end
		end

		local children2, v151 = LocalPlayer.Character:GetChildren()

		for _, v in next, children2, v151 do
			if v:IsA("Tool") and (v.Name == p44 or string.find(v.Name, p44)) then
				return v
			end
		end
	end

	if v145("God's Chalice") or v145("Fist of Darkness") or v145("Sweet Chalice") or v145("Hallow Essence") or v145("Flower1") then
		return true
	end

	return false
end
WaitForHumanoid = function()
	local Character = LocalPlayer.Character

	if not Character then
		return nil
	end

	local Humanoid = Character:FindFirstChild("Humanoid")

	if Humanoid then
		return Humanoid
	end

	local v156 = tick() + 5
	local Humanoid2

	while true do
		if not (tick() < v156) then
			return nil
		end

		Humanoid2 = Character:FindFirstChild("Humanoid")

		if Humanoid2 then
			break
		end

		task.wait(0.1)
	end

	return Humanoid2
end
checkinventory = function(p45)
	if p45 then
		for _, v in pairs(ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory")) do
			if v.Name == p45 then
				return true
			end
		end
	end

	return false
end
getdis = function(p46, p47)
	local CFrame_ = p47 or LocalPlayer.Character.HumanoidRootPart.CFrame

	return (CFrame.new(p46.X, CFrame_.Y, p46.Z).Position - CFrame.new(CFrame_.X, CFrame_.Y, CFrame_.Z).Position).Magnitude
end
CanBypassTeleport = function(p48)
	local Name = InArea(p48).Name

	if Name == "" then
		return false
	end

	if t11["Bypass Teleport"] then
		if not Name:find("Dimension") and not Name:find("Submerged") and Name ~= "Sealed Cavern" then
			if not Name:lower():find("under") and not CheckLegendaryItems() then
				if LocalPlayer.Data and LocalPlayer.Data.LastSpawnPoint and LocalPlayer.Data.LastSpawnPoint.Value == "SubmergedIsland" then
					return false
				end

				if GetDistance(p48.Position) <= 3500 then
					return false
				end

				return true
			end
		end
	end

	return false
end
GetBypassCFrame = function(p49)
	local huge = math.huge
	local v163
	local children = workspace._WorldOrigin.PlayerSpawns.Pirates:GetChildren()
	local HumanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

	if not HumanoidRootPart then
		return nil
	end

	for _, v in next, children, nil do
		if v:FindFirstChild("Part") and (p49.Position - HumanoidRootPart.Position).Magnitude >= 3000 and GetSpawnPoint(v.Part) ~= GetSpawnPoint(HumanoidRootPart) and (v.Part.Position - HumanoidRootPart.Position).Magnitude <= 10000 and (v.Part.Position - p49.Position).Magnitude <= huge then
			huge = (v.Part.Position - p49.Position).Magnitude
			v163 = v
		end
	end

	return v163
end
BypassTP = function(p50)
	if _G.Level then
		return
	end

	local Character = LocalPlayer.Character

	if not Character then
		return
	end

	local v169 = WaitForHumanoid()

	if not v169 or v169.Health <= 0 then
		return
	end

	if CanBypassTeleport(p50) and GetBypassCFrame(p50) then
		local v170 = GetBypassCFrame(p50)

		if v170 and v170:FindFirstChild("Part") then
			Character.LastSpawnPoint.Disabled = true
			ReplicatedStorage.Remotes.CommF_:InvokeServer("SetLastSpawnPoint", v170.Name)
			ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
			Character:PivotTo(v170.Part.CFrame)
			v169:ChangeState(15)

			while true do
				task.wait()

				if not LocalPlayer.Character then
					continue
				end

				if WaitForHumanoid() and WaitForHumanoid().Health > 0 then
					break
				end
			end
		end
	end
end
totopofgreattree = function()
	if getdis(CFrame.new(28310.0234, 14895.1123, 109.456741)) > 1500 then
		ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28310.0234, 14895.1123, 109.456741))
		wait(0.3)
	end

	local cFrame3 = CFrame.new(28607.5352, 14896.5449, 106.011726)

	_tp(cFrame3)

	repeat
		wait()
	until getdis(cFrame3) <= 5

	wait(0.5)

	for i = 1, 4 do
		ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "TeleportBack")
	end
end
requestentrance = function(p51)
	local Position = p51

	if typeof(p51) == "CFrame" then
		Position = p51.Position
	end

	local t12

	if sea1 then
		t12 = {
			Sky3 = Vector3.new(-7894, 5547, -380),
			Sky3Exit = Vector3.new(-4607, 874, -1667),
			UnderWater = Vector3.new(61163, 11, 1819),
			["Underwater City"] = Vector3.new(61165.19140625, 0.18704631924629211, 1897.379150390625),
			["Pirate Village"] = Vector3.new(-1242.4625244140625, 4.7870597839355469, 3901.282958984375),
			UnderwaterExit = Vector3.new(4050, -1, -1814)
		}
	elseif sea2 then
		t12 = {
			["Swan Mansion"] = Vector3.new(-390, 332, 673),
			["Swan Room"] = Vector3.new(2285, 15, 905),
			["Cursed Ship"] = Vector3.new(923, 126, 32852),
			["Zombie Island"] = Vector3.new(-6509, 83, -133)
		}
	else
		t12 = {
			["Hydra Island"] = Vector3.new(5657.88623046875, 1013.0790405273438, -335.4996337890625),
			Mansion = Vector3.new(-12462, 375, -7552),
			Castle = Vector3.new(-5036, 315, -3179),
			["Temple of Time"] = Vector3.new(28286, 14897, 103),
			["Greate Tree"] = Vector3.new(3024.1709, 2280.69434, -7325.12793)
		}

		if not checkinventory("Valkyrie Helm") then
			return
		end
	end

	local v175
	local huge = math.huge

	for _, v in pairs(t12) do
		local Magnitude = typeof(v) == "Vector3" and (v - Position).Magnitude or (v.Position - Position).Magnitude

		if Magnitude < huge then
			huge = Magnitude
			v175 = v
		end
	end

	if v175 and huge and huge < getdis(p51) then
		n2 += 1
		pcall(function()
			if _G.TweenCache then
				_G.TweenCache:Cancel()
			end

			if _G.TweenConnection then
				_G.TweenConnection:Disconnect()
			end
		end)
		_G.TweenCache = nil
		_G.TweenConnection = nil
		u127 = nil

		local ok = not (typeof(v175) == "Vector3" and v175.X == 3024.1709 and v175.Y == 2280.69434 and v175.Z == -7325.12793)

		if not ok then
			ok = not (ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check") >= 2)
		end

		if ok then
			if huge < getdis(p51) then
				ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", typeof(v175) == "Vector3" and v175 or v175.Position)
				wait(1)
			end
		else
			totopofgreattree()
			wait(1)
		end
	end
end
_tp = function(p52)
	local cFrame3

	if typeof(p52) == "Vector3" then
		cFrame3 = CFrame.new(p52)
	elseif typeof(p52) == "CFrame" then
		cFrame3 = p52
	elseif p52 then
		cFrame3 = p52.CFrame or p52.GetPivot and p52:GetPivot()
	end

	if not cFrame3 then
		return
	end

	local HumanoidRootPart = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")

	if not plr.Character or not HumanoidRootPart then
		return
	end

	pcall(function()
		if not _G.Level and CanBypassTeleport(cFrame3) then
			BypassTP(cFrame3)
			task.wait(0.5)
		end
	end)
	pcall(function()
		requestentrance(p52)
	end)

	if sea3 and getdis(cFrame3.Position, cFrame.Position) < 2000 then
		local HumanoidRootPart2 = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")

		if HumanoidRootPart2 and math.abs(cFrame.Position.Y - HumanoidRootPart2.Position.Y) > 1000 then
			repeat
				task.wait()
				old_tp(cFrame2)

				if getdis(cFrame2) < 10 then
					local Net = ReplicatedStorage.Modules.Net

					Net["RF/SubmarineWorkerSpeak"]:InvokeServer("AskKilledTikiBoss")
					task.wait(0.5)
					Net["RF/SubmarineWorkerSpeak"]:InvokeServer("TravelToSubmergedIsland")
				end
			until getdis(cFrame3.Position) < 2000

			task.wait(0.6)
		end
	end

	local HumanoidRootPart2 = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")

	if not plr.Character or not HumanoidRootPart2 then
		return
	end

	local Magnitude = (cFrame3.Position - HumanoidRootPart2.Position).Magnitude

	if _G.TweenCache and _G.TweenCache.PlaybackState == Enum.PlaybackState.Playing and u127 and (u127.Position - cFrame3.Position).Magnitude <= 12 and _G.TweenConnection then
		return _G.TweenCache
	end

	n2 += 1

	local v187 = n2

	pcall(function()
		if _G.TweenCache then
			_G.TweenCache:Cancel()
		end

		if _G.TweenConnection then
			_G.TweenConnection:Disconnect()
		end
	end)
	_G.TweenCache = nil
	_G.TweenConnection = nil

	if Magnitude <= 6 then
		n2 += 1
		u127 = nil
		HumanoidRootPart2.CFrame = cFrame3

		return nil
	end

	Part.CFrame = HumanoidRootPart2.CFrame

	local tween_ = TweenService:Create(Part, TweenInfo.new(math.max(Magnitude / math.max(tonumber(t11["Tween Speed"]) or 175, 1), 0.12), Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		CFrame = cFrame3
	})

	_G.TweenCache = tween_
	u127 = cFrame3

	local connection

	connection = RunService.Heartbeat:Connect(function()
		if v187 == n2 and tween_.PlaybackState == Enum.PlaybackState.Playing and plr.Character.Parent and HumanoidRootPart2.Parent then
			HumanoidRootPart2.CFrame = Part.CFrame

			return
		end

		if connection then
			connection:Disconnect()
		end

		if _G.TweenConnection == connection then
			_G.TweenConnection = nil
		end
	end)
	_G.TweenConnection = connection
	tween_.Completed:Connect(function()
		if v187 ~= n2 then
			return
		end

		if connection then
			connection:Disconnect()
		end

		if HumanoidRootPart2 and HumanoidRootPart2.Parent then
			HumanoidRootPart2.CFrame = cFrame3
		end

		if _G.TweenCache == tween_ then
			_G.TweenCache = nil
			u127 = nil
		end

		if _G.TweenConnection == connection then
			_G.TweenConnection = nil
		end
	end)
	tween_:Play()

	return tween_
end
old_tp = function(p53)
	if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
		plr.Character.HumanoidRootPart.CFrame = p53
	end
end
TeleportToTarget = function(p54)
	if (p54.Position - plr.Character.HumanoidRootPart.Position).Magnitude > 1000 then
		_tp(p54)
	else
		_tp(p54)
	end
end
notween = function(p55)
	plr.Character.HumanoidRootPart.CFrame = p55
end
BTP = function(p56)
	local Character = game.Players.LocalPlayer.Character
	local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

	if HumanoidRootPart and p56 then
		HumanoidRootPart.CFrame = p56
	end
end
spawn(function()
	while task.wait() do
		pcall(function()
			if _G.SailBoat_Hydra or _G.WardenBoss or _G.AutoFactory or _G.HighestMirage or _G.HCM or _G.PGB or _G.Leviathan1 or _G.UPGDrago or _G.Complete_Trials or _G.TpDrago_Prehis or _G.BuyDrago or _G.AutoFireFlowers or _G.DT_Uzoth or _G.AutoBerry or _G.Prefully or _G.Prehis_Find or _G.Prehis_Skills or _G.Prehis_DB or _G.Prehis_DE or _G.FarmBlazeEM or _G.Dojoo or _G.CollectPresent or _G.AutoLawKak or _G.TpLab or _G.AutoPhoenixF or _G.AutoFarmChest or _G.AutoHytHallow or _G.LongsWord or _G.BlackSpikey or _G.AutoHolyTorch or _G.TrainDrago or _G.AutoSaber or _G.FarmMastery_Dev or _G.CitizenQuest or _G.AutoEctoplasm or _G.KeysRen or _G.Auto_Rainbow_Haki or _G.obsFarm or _G.AutoBigmom or _G.Doughv2 or _G.AuraBoss or _G.Raiding or _G.Auto_Cavender or _G.TpPly or _G.Bartilo_Quest or _G.Level or _G.FarmEliteHunt or _G.AutoZou or _G.AutoFarm_Bone or getgenv().AutoMaterial or _G.CraftVM or _G.FrozenTP or _G.TPDoor or _G.AcientOne or _G.AutoFarmNear or _G.AutoRaidCastle or _G.DarkBladev3 or _G.AutoFarmRaid or _G.Auto_Cake_Prince or _G.Addealer or _G.TPNpc or _G.TwinHook or _G.FindMirage or _G.FarmChestM or _G.Shark or _G.TerrorShark or _G.Piranha or _G.MobCrew or _G.SeaBeast1 or _G.FishBoat or _G.AutoPole or _G.AutoPoleV2 or _G.Auto_SuperHuman or _G.AutoDeathStep or _G.Auto_SharkMan_Karate or _G.Auto_Electric_Claw or _G.AutoDragonTalon or _G.Auto_Def_DarkCoat or _G.Auto_God_Human or _G.Auto_Tushita or _G.AutoMatSoul or _G.AutoKenVTWO or _G.AutoSerpentBow or _G.AutoFMon or _G.Auto_Soul_Guitar or _G.TPGEAR or _G.AutoSaw or _G.AutoTridentW2 or _G.AutoEvoRace or _G.AutoGetQuestBounty or _G.MarinesCoat or _G.TravelDres or _G.Defeating or _G.DummyMan or _G.Auto_Yama or _G.Auto_SwanGG or _G.SwanCoat or _G.AutoEcBoss or _G.Auto_Mink or _G.Auto_Human or _G.Auto_Skypiea or _G.Auto_Fish or _G.CDK_TS or _G.CDK_YM or _G.CDK or _G.AutoFarmGodChalice or _G.AutoFistDarkness or _G.AutoMiror or _G.Teleport or _G.AutoKilo or _G.AutoGetUsoap or _G.Praying or _G.TryLucky or _G.AutoColShad or _G.AutoUnHaki or _G.Auto_DonAcces or _G.AutoRipIngay or _G.DragoV3 or _G.DragoV1 or _G.SailBoats or NextIs or _G.FarmGodChalice or _G.IceBossRen or senth or senth2 or _G.Lvthan or _G.beasthunter or _G.DangerLV or _G.Relic123 or _G.tweenKitsune or _G.Collect_Ember or _G.AutofindKitIs or _G.snaguine or _G.TwFruits or _G.tweenKitShrine or _G.Tp_LgS or _G.Tp_MasterA or _G.tweenShrine or _G.FarmMastery_G or _G.FarmMastery_S or _G.FarmBoss or _G.AutoFarmAllBoss or _G.AutoFishSlap or _G.FarmTyrant or _G.FarmPhaBinh or _G.AutoSpawnCP or _G.AutoBerryH or _G.AutoChestBP or _G.FarmEliteHop or _G.AutoHop_Dough or _G.AutoDoughKing or _G.AutoAttackDoughKing or _G.AutoChipFruit or _G.AutoChipBeli or _G.StartEvent or _G.AutoMysticIsland or _G.AutoPlayerHunter or _G.SafeMode or _G.AutoKillMob or _G.AutoStartPrehistoric or _G.AutoUnHaki or _G.AutoAttackRipIndra or _G.AutoFarmIsland or _G.AutoFarmDungeon or _G.AutoFarmCandy or _G.AutoTP_Gift or _G.AutoTPGift or _G.AutoTPAndCollect or _G.MasterAutoLevel or _G.MasterAutoCandy or _G.TPFloor1 or _G.TPFloor2 or _G.TPFloor3 or _G.TPFloor4 then
				shouldTween = true

				if not plr.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
					local BodyVelocity = Instance.new("BodyVelocity")

					BodyVelocity.Name = "BodyClip"
					BodyVelocity.Parent = plr.Character.HumanoidRootPart
					BodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
					BodyVelocity.Velocity = Vector3.new(0, 0, 0)
				end

				if not plr.Character:FindFirstChild("highlight") then
					local Highlight = Instance.new("Highlight")

					Highlight.Name = "highlight"
					Highlight.Enabled = true
					Highlight.FillColor = Color3.fromHex("#fecb3e")
					Highlight.OutlineColor = Color3.fromHex("#fecb3e")
					Highlight.FillTransparency = 0.5
					Highlight.OutlineTransparency = 0
					Highlight.Parent = plr.Character
				end

				for _, descendant in pairs(plr.Character:GetDescendants()) do
					if descendant:IsA("BasePart") then
						descendant.CanCollide = false
					end
				end
			else
				shouldTween = false

				if plr.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
					plr.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
				end

				if plr.Character:FindFirstChild("highlight") then
					plr.Character:FindFirstChild("highlight"):Destroy()
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
			PosQBoss = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
			PosB = CFrame.new(-1088.75977, 8.13463783, -488.559906, -0.707134247, 0, 0.707079291, 0, 1, 0, -0.707079291, 0, -0.707134247)
		elseif _G.FindBoss == "Bobby" then
			bMon = "Bobby"
			Qname = "BuggyQuest1"
			Qdata = 3
			PosQBoss = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
			PosB = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)
		elseif _G.FindBoss == "The Saw" then
			bMon = "The Saw"
			PosB = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)
		elseif _G.FindBoss == "Yeti" then
			bMon = "Yeti"
			Qname = "SnowQuest"
			Qdata = 3
			PosQBoss = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
			PosB = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
		elseif _G.FindBoss == "Mob Leader" then
			bMon = "Mob Leader"
			PosB = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)
		elseif _G.FindBoss == "Vice Admiral" then
			bMon = "Vice Admiral"
			Qname = "MarineQuest2"
			Qdata = 2
			PosQBoss = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
			PosB = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
		elseif _G.FindBoss == "Saber Expert" then
			bMon = "Saber Expert"
			PosB = CFrame.new(-1458.89502, 29.8870335, -50.633564)
		elseif _G.FindBoss == "Warden" then
			bMon = "Warden"
			Qname = "ImpelQuest"
			Qdata = 1
			PosB = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, -4.49946401e-06, 0.975376427, -1.95412576e-05, 1, 9.03162072e-06, -0.975376427, -2.10519756e-05, 0.220546961)
			PosQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
		elseif _G.FindBoss == "Chief Warden" then
			bMon = "Chief Warden"
			Qname = "ImpelQuest"
			Qdata = 2
			PosB = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749, 0.00191645394, 0.999998152, -2.80422337e-05, -0.939682961, 0.00181045406, 0.342041939)
			PosQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
		elseif _G.FindBoss == "Swan" then
			bMon = "Swan"
			Qname = "ImpelQuest"
			Qdata = 3
			PosB = CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812)
			PosQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
		elseif _G.FindBoss == "Magma Admiral" then
			bMon = "Magma Admiral"
			Qname = "MagmaQuest"
			Qdata = 3
			PosQBoss = CFrame.new(-5314.6220703125, 12.262420654297, 8517.279296875)
			PosB = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)
		elseif _G.FindBoss == "Fishman Lord" then
			bMon = "Fishman Lord"
			Qname = "FishmanQuest"
			Qdata = 3
			PosQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
			PosB = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
		elseif _G.FindBoss == "Wysper" then
			bMon = "Wysper"
			Qname = "SkyExp1Quest"
			Qdata = 3
			PosQBoss = CFrame.new(-7861.947265625, 5545.517578125, -379.85974121094)
			PosB = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)
		elseif _G.FindBoss == "Thunder God" then
			bMon = "Thunder God"
			Qname = "SkyExp2Quest"
			Qdata = 3
			PosQBoss = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
			PosB = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)
		elseif _G.FindBoss == "Cyborg" then
			bMon = "Cyborg"
			Qname = "FountainQuest"
			Qdata = 3
			PosQBoss = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
			PosB = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
		elseif _G.FindBoss == "Ice Admiral" then
			bMon = "Ice Admiral"
			Qdata = nil
			PosQBoss = CFrame.new(1266.08948, 26.1757946, -1399.57678, -0.573599219, 0, -0.81913656, 0, 1, 0, 0.81913656, 0, -0.573599219)
			PosB = CFrame.new(1266.08948, 26.1757946, -1399.57678, -0.573599219, 0, -0.81913656, 0, 1, 0, 0.81913656, 0, -0.573599219)
		elseif _G.FindBoss == "Greybeard" then
			bMon = "Greybeard"
			Qdata = nil
			PosQBoss = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
			PosB = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
		end
	end

	if World2 then
		if _G.FindBoss == "Diamond" then
			bMon = "Diamond"
			Qname = "Area1Quest"
			Qdata = 3
			PosQBoss = CFrame.new(-427.5666809082, 73.313781738281, 1835.4208984375)
			PosB = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
		elseif _G.FindBoss == "Jeremy" then
			bMon = "Jeremy"
			Qname = "Area2Quest"
			Qdata = 3
			PosQBoss = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
			PosB = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
		elseif _G.FindBoss == "Orbitus" then
			bMon = "Orbitus"
			Qname = "MarineQuest3"
			Qdata = 3
			PosQBoss = CFrame.new(-2441.986328125, 73.359344482422, -3217.5324707031)
			PosB = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
		elseif _G.FindBoss == "Don Swan" then
			bMon = "Don Swan"
			PosB = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
		elseif _G.FindBoss == "Smoke Admiral" then
			bMon = "Smoke Admiral"
			Qname = "IceSideQuest"
			Qdata = 3
			PosQBoss = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
			PosB = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
		elseif _G.FindBoss == "Awakened Ice Admiral" then
			bMon = "Awakened Ice Admiral"
			Qname = "FrostQuest"
			Qdata = 3
			PosQBoss = CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813)
			PosB = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)
		elseif _G.FindBoss == "Tide Keeper" then
			bMon = "Tide Keeper"
			Qname = "ForgottenQuest"
			Qdata = 3
			PosQBoss = CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625)
			PosB = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)
		elseif _G.FindBoss == "Darkbeard" then
			bMon = "Darkbeard"
			Qdata = nil
			PosQBoss = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
			PosB = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
		elseif _G.FindBoss == "Cursed Captaim" then
			bMon = "Cursed Captain"
			Qdata = nil
			PosQBoss = CFrame.new(916.928589, 181.092773, 33422)
			PosB = CFrame.new(916.928589, 181.092773, 33422)
		elseif _G.FindBoss == "Order" then
			bMon = "Order"
			Qdata = nil
			PosQBoss = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
			PosB = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
		end
	end

	if World3 then
		if _G.FindBoss == "Stone" then
			bMon = "Stone"
			Qname = "PiratePortQuest"
			Qdata = 3
			PosQBoss = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
			PosB = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
		elseif _G.FindBoss == "Hydra Leader" then
			bMon = "Hydra Leader"
			Qname = "VenomCrewQuest"
			Qdata = 3
			PosQBoss = CFrame.new(5211.021484375, 1004.35778859375, 758.18475341796875)
			PosB = CFrame.new(5821.89794921875, 1019.0950927734375, -73.719230651855469)
		elseif _G.FindBoss == "Kilo Admiral" then
			bMon = "Kilo Admiral"
			Qname = "MarineTreeIsland"
			Qdata = 3
			PosQBoss = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
			PosB = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
		elseif _G.FindBoss == "Captain Elephant" then
			bMon = "Captain Elephant"
			Qname = "DeepForestIsland"
			Qdata = 3
			PosQBoss = CFrame.new(-13232.682617188, 332.40396118164, -7626.01171875)
			PosB = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
		elseif _G.FindBoss == "Beautiful Pirate" then
			bMon = "Beautiful Pirate"
			Qname = "DeepForestIsland2"
			Qdata = 3
			PosQBoss = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
			PosB = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)
		elseif _G.FindBoss == "Cake Queen" then
			bMon = "Cake Queen"
			Qname = "IceCreamIslandQuest"
			Qdata = 3
			PosQBoss = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
			PosB = CFrame.new(-678.648804, 381.353943, -11114.2012, -0.908641815, 0.00149294338, 0.41757378, 0.00837114919, 0.999857843, 0.0146408929, -0.417492568, 0.0167988986, -0.90852499)
		elseif _G.FindBoss == "Longma" then
			bMon = "Longma"
			Qdata = nil
			PosQBoss = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
			PosB = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
		elseif _G.FindBoss == "Soul Reaper" then
			bMon = "Soul Reaper"
			Qdata = nil
			PosQBoss = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
			PosB = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
		end
	end
end
QuestBeta = function()
	QuestB()

	return {
		[0] = _G.FindBoss,
		bMon,
		Qdata,
		Qname,
		PosB,
		PosQBoss
	}
end

local Quests = require(game:GetService("ReplicatedStorage"):WaitForChild("Quests"))
local GuideModule = require(game:GetService("ReplicatedStorage"):WaitForChild("GuideModule"))
local t13 = {
	"MarineQuest",
	"BartiloQuest",
	"CitizenQuest",
	"Trainees"
}

CheckSea = function(p57)
	if game.PlaceId == 2753915549 or game.PlaceId == 85211729168715 then
		if p57 == 1 then
			return true
		end
	end

	if (game.PlaceId == 4442272183 or game.PlaceId == 79091703265657) and p57 == 2 then
		return true
	end

	if (game.PlaceId == 7449423635 or game.PlaceId == 100117331123089) and p57 == 3 then
		return true
	end

	return false
end
GetQuestPointFromNPC = function(p58)
	if typeof(p58) == "Instance" then
		p58 = p58.Name
	elseif type(p58) == "table" and p58.Name then
		p58 = p58.Name
	end

	if not p58 then
		return nil
	end

	for _, child in pairs(workspace.NPCs:GetChildren()) do
		if child.Name ~= p58 then
			continue
		end

		if child:FindFirstChild("HumanoidRootPart") then
			return child.HumanoidRootPart.CFrame
		end
	end

	for _, child in pairs(replicated.NPCs:GetChildren()) do
		if child.Name == p58 and child:FindFirstChild("HumanoidRootPart") then
			return child.HumanoidRootPart.CFrame
		end
	end

	return nil
end
GetQuests = function()
	local Value = plr.Data.Level.Value
	local n3 = 0
	local t14 = {}

	if Value >= 700 and CheckSea(1) then
		t14.Mob = "Galley Captain"
		t14.NameQuest = "FountainQuest"
		t14.ID = 2
		t14.LevelReq = 700
	elseif Value >= 1500 and CheckSea(2) then
		t14.Mob = "Water Fighter"
		t14.NameQuest = "ForgottenQuest"
		t14.ID = 2
		t14.LevelReq = 1450
	else
		for k, Quest in pairs(Quests) do
			for k2, v in pairs(Quest) do
				local LevelReq = v.LevelReq

				for k3 in pairs(v.Task) do
					if LevelReq <= Value and n3 <= LevelReq and v.Task[k3] > 1 and not table.find(t13, k) then
						n3 = LevelReq
						t14.Mob = k3
						t14.NameQuest = k
						t14.ID = k2
						t14.LevelReq = LevelReq
					end
				end
			end
		end
	end

	return t14
end
GetQuestPoint = function()
	if GuideModule and GuideModule.Data and GuideModule.Data.LastClosestNPC then
		return GetQuestPointFromNPC(GuideModule.Data.LastClosestNPC)
	end

	return nil
end

local t15 = {
	PiratePortQuest = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625),
	VenomCrewQuest = CFrame.new(5211.021484375, 1004.3577880859, 758.184753418),
	MarineTreeIsland = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938),
	DeepForestIsland = CFrame.new(-13232.682617188, 332.40396118164, -7626.01171875),
	DeepForestIsland2 = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375),
	DeepForestIsland3 = CFrame.new(-10990, 332, -8940),
	HauntedQuest1 = CFrame.new(-9516.9931640625, 172.01718139648, 6078.4653320313),
	HauntedQuest2 = CFrame.new(-9516.9931640625, 172.01718139648, 6078.4653320313),
	IceCreamIslandQuest = CFrame.new(-819.37670898438, 64.925979614258, -10967.283203125),
	CakeQuest1 = CFrame.new(-1927.9200439453, 37.799999237061, -12842.5400390625),
	CakeQuest2 = CFrame.new(-1927.9200439453, 37.799999237061, -12842.5400390625),
	ChocQuest1 = CFrame.new(231.7, 24.4, -12704.7),
	ChocQuest2 = CFrame.new(231.7, 24.4, -12704.7),
	TikiQuest1 = CFrame.new(-16547, 55, -16452),
	TikiQuest2 = CFrame.new(-16547, 55, -16452)
}

local function v213(p59)
	local v214 = t7[p59]

	if not v214 then
		return nil
	end

	local CFrame_
	local u216

	local function v217(p60)
		if not p60 then
			return
		end

		for _, child in pairs(p60:GetChildren()) do
			local HumanoidRootPart = child:FindFirstChild("HumanoidRootPart")
			local v221 = string.lower(child.Name)

			if HumanoidRootPart and (string.find(v221, "quest", 1, true) or string.find(v221, "giver", 1, true)) then
				local Magnitude = (HumanoidRootPart.Position - v214.Position).Magnitude

				if not u216 or Magnitude < u216 then
					CFrame_ = HumanoidRootPart.CFrame
					u216 = Magnitude
				end
			end
		end
	end

	v217(workspace:FindFirstChild("NPCs"))

	if not CFrame_ then
		v217(replicated:FindFirstChild("NPCs"))
	end

	return CFrame_
end
local function v223(p61)
	local NPCList_ = GuideModule and GuideModule.Data and GuideModule.Data.NPCList

	if not NPCList_ or not p61 or not p61.LevelReq then
		return nil
	end

	local Position
	local v226 = t7[p61.Mob]

	if v226 then
		Position = v226.Position
	elseif World3 and p61.LevelReq >= 2600 then
		Position = cFrame.Position
	end

	local v227
	local huge = math.huge

	for _, v in pairs(NPCList_) do
		local v231 = false
		local pairs_ = pairs
		local Levels = v.Levels or {}

		for _, Level in pairs_(Levels) do
			if tonumber(Level) == tonumber(p61.LevelReq) then
				v231 = true

				break
			end
		end

		local Position2 = v.Position and Convert_CFrame(v.Position)

		if v231 and Position2 then
			local Magnitude = Position and (Position2.Position - Position).Magnitude or 0

			if Magnitude < huge then
				v227 = Position2
				huge = Magnitude
			end
		end
	end

	return v227
end
local function v238(p62)
	if not p62 then
		return nil
	end

	local v239 = v223(p62)

	if v239 then
		return v239
	end

	if World3 and tonumber(p62.LevelReq) and p62.LevelReq >= 2600 then
		return cFrame
	end

	if World3 then
		local v240 = t15[p62.NameQuest]

		if v240 then
			return v240
		end

		local v241 = v213(p62.Mob)

		if v241 then
			return v241
		end
	end

	return GetQuestPoint()
end

MaterialMon = function()
	local LocalPlayer2 = game.Players.LocalPlayer
	local HumanoidRootPart = LocalPlayer2.Character and LocalPlayer2.Character:FindFirstChild("HumanoidRootPart")

	if not HumanoidRootPart then
		return
	end

	shouldRequestEntrance = function(p63, p64)
		if p64 <= (HumanoidRootPart.Position - p63).Magnitude then
			replicated.Remotes.CommF_:InvokeServer("requestEntrance", p63)
		end
	end

	if World1 then
		if SelectMaterial == "Angel Wings" then
			MMon = {
				"Shanda",
				"Royal Squad",
				"Royal Soldier",
				"Wysper",
				"Thunder God"
			}
			MPos = CFrame.new(-4698, 845, -1912)
			SP = "Default"
			shouldRequestEntrance(Vector3.new(-4607.82275, 872.54248, -1667.55688), 10000)
		elseif SelectMaterial == "Leather + Scrap Metal" then
			MMon = {
				"Brute",
				"Pirate"
			}
			MPos = CFrame.new(-1145, 15, 4350)
			SP = "Default"
		elseif SelectMaterial == "Magma Ore" then
			MMon = {
				"Military Soldier",
				"Military Spy",
				"Magma Admiral"
			}
			MPos = CFrame.new(-5815, 84, 8820)
			SP = "Default"
		elseif SelectMaterial == "Fish Tail" then
			MMon = {
				"Fishman Warrior",
				"Fishman Commando",
				"Fishman Lord"
			}
			MPos = CFrame.new(61123, 19, 1569)
			SP = "Default"
			shouldRequestEntrance(Vector3.new(61163.8515625, 5.3423423767089844, 1819.7841796875), 17000)
		end
	elseif World2 then
		if SelectMaterial == "Leather + Scrap Metal" then
			MMon = { "Marine Captain" }
			MPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
			SP = "Default"
		elseif SelectMaterial == "Magma Ore" then
			MMon = {
				"Magma Ninja",
				"Lava Pirate"
			}
			MPos = CFrame.new(-5428, 78, -5959)
			SP = "Default"
		elseif SelectMaterial == "Ectoplasm" then
			MMon = {
				"Ship Deckhand",
				"Ship Engineer",
				"Ship Steward",
				"Ship Officer"
			}
			MPos = CFrame.new(911.35827636719, 125.95812988281, 33159.5390625)
			SP = "Default"
			shouldRequestEntrance(Vector3.new(61163.8515625, 5.3423423767089844, 1819.7841796875), 18000)
		elseif SelectMaterial == "Mystic Droplet" then
			MMon = { "Water Fighter" }
			MPos = CFrame.new(-3385, 239, -10542)
			SP = "Default"
		elseif SelectMaterial == "Radioactive Material" then
			MMon = { "Factory Staff" }
			MPos = CFrame.new(295, 73, -56)
			SP = "Default"
		elseif SelectMaterial == "Vampire Fang" then
			MMon = { "Vampire" }
			MPos = CFrame.new(-6033, 7, -1317)
			SP = "Default"
		end
	elseif World3 then
		if SelectMaterial == "Scrap Metal" then
			MMon = {
				"Jungle Pirate",
				"Forest Pirate"
			}
			MPos = CFrame.new(-11975.78515625, 331.77340698242188, -10620.0302734375)
			SP = "Default"
		elseif SelectMaterial == "Fish Tail" then
			MMon = {
				"Fishman Raider",
				"Fishman Captain"
			}
			MPos = CFrame.new(-10993, 332, -8940)
			SP = "Default"
		elseif SelectMaterial == "Conjured Cocoa" then
			MMon = {
				"Chocolate Bar Battler",
				"Cocoa Warrior"
			}
			MPos = CFrame.new(620.63446044921875, 78.936447143554688, -12581.369140625)
			SP = "Default"
		elseif SelectMaterial == "Dragon Scale" then
			MMon = {
				"Dragon Crew Archer",
				"Dragon Crew Warrior"
			}
			MPos = CFrame.new(6594, 383, 139)
			SP = "Default"
		elseif SelectMaterial == "Gunpowder" then
			MMon = { "Pistol Billionaire" }
			MPos = CFrame.new(-84.855690002441406, 85.620613098144531, 6132.0087890625)
			SP = "Default"
		elseif SelectMaterial == "Mini Tusk" then
			MMon = { "Mythological Pirate" }
			MPos = CFrame.new(-13545, 470, -6917)
			SP = "Default"
		elseif SelectMaterial == "Demonic Wisp" then
			MMon = { "Demonic Soul" }
			MPos = CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)
			SP = "Default"
		end
	end
end
QuestNeta = function()
	local v244 = GetQuests()

	return {
		v244.Mob,
		v244.ID,
		v244.NameQuest,
		v244.LevelReq,
		v244.Mob,
		(v238(v244))
	}
end

-- ============================================================
--  Lunar Hub | Blox Fruits  (UI: WindUI)
-- ============================================================
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local BRAND = "Lunar Hub"
local LOGO = "moon"

local WindUIWindow = WindUI:CreateWindow({
	Title = BRAND,
	Icon = LOGO,
	Author = "Blox Fruits",
	Folder = "LunarHub",
	Size = UDim2.fromOffset(600, 460),
	Theme = "Dark",
	Transparent = true,
	SideBarWidth = 190,
	HasOutline = true
})

pcall(function()
	WindUIWindow:SetToggleKey(Enum.KeyCode.RightShift)
end)
pcall(function()
	WindUIWindow:EditOpenButton({
		Title = BRAND,
		Icon = LOGO,
		CornerRadius = UDim.new(0, 16),
		StrokeThickness = 2,
		Color = ColorSequence.new(Color3.fromHex("#6d5dfc"), Color3.fromHex("#b9a8ff")),
		Draggable = true
	})
end)
pcall(function()
	WindUIWindow:Tag({
		Title = "Moon",
		Color = Color3.fromHex("#6d5dfc")
	})
end)

local v249 = {
	Window = WindUIWindow
}

v249.SetUIScale = function(_, scale)
	pcall(function()
		WindUIWindow:SetUIScale(tonumber(scale) or 1)
	end)
end
v249.Notify = function(_, opts)
	local o = opts or {}

	return WindUI:Notify({
		Title = o.Title or BRAND,
		Content = o.Content or o.Description or "",
		Icon = o.Icon or LOGO,
		Duration = o.Duration or o.Time or 5
	})
end

local function dropdownValues(list)
	local out = {}

	if type(list) ~= "table" then
		return out
	end

	if #list > 0 then
		for _, v in ipairs(list) do
			table.insert(out, tostring(v))
		end
	else
		for k in pairs(list) do
			table.insert(out, tostring(k))
		end
	end

	return out
end

local function v259(title, icon)
	local tab = WindUIWindow:Tab({
		Title = title,
		Icon = icon
	})

	return {
		AddSection = function(self, text)
			tab:Section({
				Title = tostring(text or "")
			})

			return self
		end,
		AddParagraph = function(self, title2, desc)
			local p = tab:Paragraph({
				Title = tostring(title2 or ""),
				Desc = tostring(desc or "")
			})

			return {
				SetDesc = function(_, d)
					pcall(function()
						p:SetDesc(tostring(d or ""))
					end)
				end
			}
		end,
		AddToggle = function(self, o)
			o = o or {}

			return tab:Toggle({
				Title = o.Name or "Toggle",
				Desc = o.Description,
				Value = o.Default == true,
				Callback = o.Callback or function() end
			})
		end,
		AddDropdown = function(self, o)
			o = o or {}

			local values = dropdownValues(o.Options or o.Values)
			local default = o.Default

			if default == nil then
				default = values[1]
			end

			return tab:Dropdown({
				Title = o.Name or "Dropdown",
				Desc = o.Description,
				Values = values,
				Value = default,
				Multi = false,
				AllowNone = false,
				Callback = o.Callback or function() end
			})
		end,
		AddSlider = function(self, o)
			o = o or {}

			local min, max = o.Min or 0, o.Max or 100

			return tab:Slider({
				Title = o.Name or "Slider",
				Desc = o.Description,
				Step = o.Increment or 1,
				Value = {
					Min = min,
					Max = max,
					Default = o.Default or min
				},
				Callback = o.Callback or function() end
			})
		end,
		AddTextBox = function(self, o)
			o = o or {}

			return tab:Input({
				Title = o.Name or "Input",
				Desc = o.Description,
				Value = tostring(o.Default or ""),
				Placeholder = o.Placeholder or "",
				Callback = o.Callback or function() end
			})
		end,
		AddButton = function(self, o)
			if type(o) == "string" then
				o = {
					Name = o
				}
			end

			o = o or {}

			return tab:Button({
				Title = o.Name or o.Text or "Button",
				Desc = o.Description,
				Callback = o.Callback or o.Func or function() end
			})
		end,
		AddDiscordInvite = function(self, o)
			o = o or {}

			tab:Paragraph({
				Title = o.Title or "Discord",
				Desc = o.Description or ""
			})

			if o.Invite then
				tab:Button({
					Title = "Copy Discord Invite",
					Callback = function()
						if setclipboard then
							setclipboard(o.Invite)
						end
					end
				})
			end
		end
	}
end

local t16 = {
	Info = v259("Tab Info And Status", "info"),
	Main = v259("Tab Farming", "swords"),
	Settings = v259("Tab Setting", "settings"),
	Fish = v259("Tab Fishing", "fish"),
	Quests = v259("Tab Quest And Item", "scroll-text"),
	SeaEvent = v259("Tab Sea Event", "ship"),
	Race = v259("Tab Mirage And Race", "trophy"),
	Prehistoric = v259("🌋 Tab Volcano Event", "flame"),
	Esp = v259("Tab Stats And Esp", "activity"),
	Raids = v259("Tab Fruit And Raid", "swords"),
	Combat = v259("Tab Local Player", "user"),
	Travel = v259("Tab Teleport", "map"),
	Shop = v259("Tab Shopping", "shopping-cart"),
	Misc = v259("Tab Miscellaneous", "wrench")
}
local v277 = v259("UI Settings", "settings")
v277:AddSection("Menu")
v277:AddDropdown({
	Name = "Theme",
	Options = { "Dark", "Light", "Rose", "Plant", "Red", "Indigo", "Sky", "Violet", "Amber", "Emerald" },
	Default = "Dark",
	Callback = function(theme)
		pcall(function()
			WindUI:SetTheme(theme)
		end)
	end
})
v277:AddParagraph("Menu Key", "Press RightShift or tap the moon button to show/hide Lunar Hub.")
v277:AddButton({
	Name = "Unload Lunar Hub",
	Callback = function()
		pcall(function()
			WindUIWindow:Destroy()
		end)
	end
})
t16.Info:AddSection("Information")
t16.Info:AddDiscordInvite({
	Title = "Lunar Hub | Blox Fruits Community",
	Description = "A community for Lunar Hub users!",
	Banner = "moon",
	Logo = "moon",
	Invite = "https://discord.gg/YOUR_INVITE_HERE",
	Members = 67777777,
	Online = 67777777
})
t16.Info:AddSection("Status Server")

local v279 = t16.Info:AddParagraph("Time Zone", "")

UpdateOS = function()
	local v280 = os.date("*t")
	local v281 = v280.hour % 24
	local v282 = string.format("%02i:%02i:%02i %s", (v281 - 1) % 12 + 1, v280.min, v280.sec, v281 < 12 and "AM" or "PM")
	local v283 = string.format("%02d/%02d/%04d", v280.day, v280.month, v280.year)
	local LocalizationService = game:GetService("LocalizationService")
	local LocalPlayer2 = game:GetService("Players").LocalPlayer
	local countryRegionCode

	if getgenv().countryRegionCode then
		countryRegionCode = getgenv().countryRegionCode
	else
		local ok

		ok, countryRegionCode = pcall(function()
			return LocalizationService:GetCountryRegionForPlayerAsync(LocalPlayer2)
		end)

		if ok then
			getgenv().countryRegionCode = countryRegionCode
		else
			getgenv().countryRegionCode = "Unknown"
		end
	end

	v279:SetDesc(v283 .. " - " .. v282 .. " [ " .. countryRegionCode .. " ]")
end
spawn(function()
	while true do
		UpdateOS()
		wait(1)
	end
end)

local v288 = t16.Info:AddParagraph("Game Time", "")

UpdateGameTime = function()
	local v289 = math.floor(workspace.DistributedGameTime + 0.5)

	v288:SetDesc(math.floor(v289 / 3600) % 24 .. " Hour (h) " .. math.floor(v289 / 60) % 60 .. " Minute (m) " .. math.floor(v289 / 1) % 60 .. " Second (s)")
end
spawn(function()
	while true do
		UpdateGameTime()
		wait(1)
	end
end)

local v290 = t16.Info:AddParagraph("Mirage Island", "Status: ")
local s1 = ""

spawn(function()
	pcall(function()
		while true do
			wait(1)

			local status = game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") ~= nil and "✅" or "❌"

			if status ~= s1 then
				v290:SetDesc("Status: " .. status)
				s1 = status
			end
		end
	end)
end)

local v293 = t16.Info:AddParagraph("Kitsune Island", "Status: ")
local s2 = ""

spawn(function()
	while task.wait(1) do
		local status = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") and "✅" or "❌"

		if status ~= s2 then
			v293:SetDesc("Status: " .. status)
			s2 = status
		end
	end
end)

local v296 = t16.Info:AddParagraph("Prehistoric Island", "Status: ")
local s3 = ""

task.spawn(function()
	while task.wait(1) do
		local status = game.Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") and "✅" or "❌"

		if status ~= s3 then
			v296:SetDesc("Status: " .. status)
			s3 = status
		end
	end
end)

local v299 = t16.Info:AddParagraph("Frozen Dimension", "Status: ")
local s4 = ""

spawn(function()
	while wait(1) do
		local status = game.Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension") and "✅" or "❌"

		if status ~= s4 then
			v299:SetDesc("Status: " .. status)
			s4 = status
		end
	end
end)

local v302 = t16.Info:AddParagraph("Cake Prince", "")

spawn(function()
	while wait(1) do
		local response = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
		local s5 = "Cake Prince: ✅"

		if string.len(response) >= 86 then
			s5 = "Killed: " .. string.sub(response, 39, 41)
		end

		v302:SetDesc(s5)
	end
end)

local v305 = t16.Info:AddParagraph("Rip Indra", "Status: ")
local s6 = ""

spawn(function()
	while wait(1) do
		local status = (game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form") or game:GetService("Workspace").Enemies:FindFirstChild("rip_indra")) and "✅" or "❌"

		if status ~= s6 then
			v305:SetDesc("Status: " .. status)
			s6 = status
		end
	end
end)

local v308 = t16.Info:AddParagraph("Dough King", "Status: ")
local s7 = ""

spawn(function()
	while wait(1) do
		local DoughKing = game:GetService("ReplicatedStorage"):FindFirstChild("Dough King")

		if not DoughKing then
			DoughKing = game:GetService("Workspace").Enemies:FindFirstChild("Dough King")
		end

		DoughKing = DoughKing and "✅"
		DoughKing = DoughKing or "❌"

		if DoughKing ~= s7 then
			v308:SetDesc("Status: " .. DoughKing)
			s7 = DoughKing
		end
	end
end)

local v311 = t16.Info:AddParagraph("Full Moon", "")

task.spawn(function()
	while task.wait(1) do
		local MoonTextureId = game:GetService("Lighting").Sky.MoonTextureId
		local s8 = "Moon: 0/5"

		if MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
			s8 = "Moon: 5/5 (Full Moon) ✅"
		elseif MoonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
			s8 = "Moon: 4/5"
		elseif MoonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
			s8 = "Moon: 3/5"
		elseif MoonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
			s8 = "Moon: 2/5"
		elseif MoonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
			s8 = "Moon: 1/5"
		end

		v311:SetDesc(s8)
	end
end)

local v314 = t16.Info:AddParagraph("Legendary Sword", "Status: ")

spawn(function()
	while wait(1) do
		local s9 = "Not Found"

		if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1") then
			s9 = "Shisui ✅"
		elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2") then
			s9 = "Wando ✅"
		elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3") then
			s9 = "Saddi ✅"
		end

		v314:SetDesc(s9)
	end
end)

local Bone_ = t16.Info:AddParagraph("Bone", "")

spawn(function()
	while wait(1) do
		local response = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check")

		Bone_:SetDesc("You Have: " .. tostring(response) .. " Bones")
	end
end)
_G.ChooseWP = "Melee"
WeaponDropdown = t16.Main:AddDropdown({
	Name = "Select Weapon",
	Options = {
		"Melee",
		"Sword",
		"Blox Fruit",
		"Gun"
	},
	Default = "Melee",
	Callback = function(p95)
		_G.ChooseWP = p95
	end
})
spawn(function()
	while task.wait(0.5) do
		pcall(function()
			if _G.ChooseWP == "Melee" then
				for _, child in pairs(plr.Backpack:GetChildren()) do
					if child.ToolTip == "Melee" then
						_G.SelectWeapon = child.Name
					end
				end
			elseif _G.ChooseWP == "Sword" then
				for _, child in pairs(plr.Backpack:GetChildren()) do
					if child.ToolTip == "Sword" then
						_G.SelectWeapon = child.Name
					end
				end
			elseif _G.ChooseWP == "Gun" then
				for _, child in pairs(plr.Backpack:GetChildren()) do
					if child.ToolTip == "Gun" then
						_G.SelectWeapon = child.Name
					end
				end
			elseif _G.ChooseWP == "Blox Fruit" then
				for _, child in pairs(plr.Backpack:GetChildren()) do
					if child.ToolTip == "Blox Fruit" then
						_G.SelectWeapon = child.Name
					end
				end
			end
		end)
	end
end)
t16.Main:AddDropdown({
	Name = "UI Scale",
	Options = {
		"Small",
		"Normal",
		"Big"
	},
	Default = "Normal",
	Callback = function(p96)
		v249:SetUIScale(({
			Small = 0.8,
			Normal = 1,
			Big = 1.2
		})[p96])
	end
})
t16.Main:AddSection("Farming")

local u326 = false
local n5 = 0

FarmLevel = t16.Main:AddToggle({
	Name = "Auto Farm Level",
	Description = "",
	Default = false,
	Callback = function(p97)
		_G.Level = p97

		if not p97 then
			u326 = false
			n5 = 0
		end
	end
})

local n6 = 0
local u329

local function v330(p98)
	if not p98 or not p98:IsA("Model") or p98 == plr.Character then
		return false
	end

	local Humanoid = p98:FindFirstChildOfClass("Humanoid")
	local HumanoidRootPart = p98:FindFirstChild("HumanoidRootPart")

	if not Humanoid or not HumanoidRootPart or Humanoid.Health <= 0 then
		return false
	end

	local v333 = string.lower(p98.Name .. " " .. tostring(Humanoid.DisplayName or ""))

	if string.find(v333, "magnet", 1, true) or string.find(v333, "overcharged", 1, true) then
		return true
	end

	for _, descendant in ipairs(p98:GetDescendants()) do
		if not descendant:IsA("TextLabel") and not descendant:IsA("TextButton") then
			if descendant.Name == "Magnet" or descendant.Name == "Magnetized" or descendant.Name == "Overcharged" or descendant.Name == "Halo" then
				return true
			end

			continue
		end

		local v336 = string.lower(tostring(descendant.Text or ""))

		if string.find(v336, "magnet", 1, true) or string.find(v336, "overcharged", 1, true) then
			return true
		end
	end

	return false
end
local function v337()
	local HumanoidRootPart = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")

	if not HumanoidRootPart then
		return nil
	end

	local v339
	local huge = math.huge
	local Enemies_ = workspace:FindFirstChild("Enemies")

	if Enemies_ then
		for _, child in ipairs(Enemies_:GetChildren()) do
			if v330(child) then
				local HumanoidRootPart2 = child:FindFirstChild("HumanoidRootPart")
				local Magnitude = HumanoidRootPart2 and (HumanoidRootPart2.Position - HumanoidRootPart.Position).Magnitude

				if Magnitude and Magnitude < huge then
					v339 = child
					huge = Magnitude
				end
			end
		end
	end

	return v339
end
local function v346()
	n6 += 1

	local v347 = n6

	task.spawn(function()
		while _G.AutoFarmMagnet and v347 == n6 do
			pcall(function()
				local Character = plr.Character

				Character = Character and plr.Character:FindFirstChild("HumanoidRootPart")

				local Humanoid = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")

				if not Character or not Humanoid or Humanoid.Health <= 0 then
					u329 = nil

					return
				end

				if not v330(u329) then
					u329 = v337()
				end

				local v350 = u329
				local HumanoidRootPart = v350 and v350:FindFirstChild("HumanoidRootPart")
				local Humanoid2 = v350 and v350:FindFirstChildOfClass("Humanoid")

				if not HumanoidRootPart or not Humanoid2 or Humanoid2.Health <= 0 then
					u329 = nil

					return
				end

				shouldTween = true

				if not plr.Character:FindFirstChild("HasBuso") then
					replicated.Remotes.CommF_:InvokeServer("Buso")
				end

				EquipWeapon(_G.SelectWeapon)
				_tp(HumanoidRootPart.CFrame * CFrame.new(0, 26, 0))
				HumanoidRootPart.CanCollide = false
				HumanoidRootPart.Size = Vector3.new(50, 50, 50)
				Humanoid2.WalkSpeed = 0
				Humanoid2.JumpPower = 0
				MousePos = HumanoidRootPart.Position

				if type(AttackNoCoolDown) == "function" then
					AttackNoCoolDown()
				end
			end)
			task.wait(0.08)
		end
	end)
end

t16.Main:AddToggle({
	Name = "Auto Farm Magnet",
	Default = false,
	Callback = function(p99)
		_G.AutoFarmMagnet = p99
		u329 = nil
		n6 += 1

		if p99 then
			v346()
		end
	end
})

local function v353()
	if not plr.Character then
		return false
	end

	local HumanoidRootPart = plr.Character:FindFirstChild("HumanoidRootPart")

	if not HumanoidRootPart then
		return false
	end

	local vector3 = Vector3.new(11520.8017578125, 0, 9829.513671875)

	return (Vector3.new(HumanoidRootPart.Position.X, 0, HumanoidRootPart.Position.Z) - vector3).Magnitude < 2000
end
local function v356(p100, p101)
	if not p100 or not p101 then
		return false
	end

	local v357 = string.lower(tostring(p100))
	local v358 = string.lower(tostring(p101))

	if string.find(v357, v358, 1, true) then
		return true
	end

	if string.sub(v358, -1) == "s" or not string.find(v357, v358 .. "s", 1, true) then
		return false
	end

	return true
end

local v359

local function v360(p102)
	if not p102 then
		return ""
	end

	local Container = p102:FindFirstChild("Container")
	local QuestTitle = Container and Container:FindFirstChild("QuestTitle")
	local Title = QuestTitle and QuestTitle:FindFirstChild("Title")

	return tostring(Title and Title.Text or "")
end
local function v364(p103, p104)
	if v359() ~= nil then
		return true
	end

	if not p103 or p103.Visible ~= true then
		return false
	end

	local v365 = v360(p103)

	return v365 == "" or not p104 or v356(v365, p104)
end
local function v366(p105)
	local function v367(p106)
		if not p106 then
			return nil, nil
		end

		for _, descendant in ipairs(p106:GetDescendants()) do
			if not descendant:IsA("TextLabel") and not descendant:IsA("TextButton") then
				continue
			end

			local v370, v371 = string.match(tostring(descendant.Text), "(%d+)%s*/%s*(%d+)")

			if v370 and v371 then
				return tonumber(v370), tonumber(v371)
			end
		end

		return nil, nil
	end

	local TrackedQuestFrame = plr.PlayerGui:FindFirstChild("TrackedQuestFrame")
	local v373, v374 = v367(TrackedQuestFrame and TrackedQuestFrame:FindFirstChild("Frame"))

	if v373 and v374 then
		return v373, v374
	end

	return v367(p105)
end

v359 = function()
	local PlayerGui = plr:FindFirstChild("PlayerGui")
	local TrackedQuestFrame = PlayerGui and PlayerGui:FindFirstChild("TrackedQuestFrame")

	if TrackedQuestFrame then
		return TrackedQuestFrame:FindFirstChild("Frame")
	end

	return nil
end

local function v377(p107, p108)
	return p107 and p107.Name == p108 and t9.Alive(p107)
end
local function v378(p109)
	for _, v in ipairs({
		workspace:FindFirstChild("Enemies"),
		replicated:FindFirstChild("Enemies")
	}) do
		if v then
			for _, child in ipairs(v:GetChildren()) do
				if v377(child, p109) then
					return child
				end
			end
		end
	end

	for _, child in pairs(replicated:GetChildren()) do
		if v377(child, p109) then
			return child
		end
	end

	return nil
end

task.spawn(function()
	while task.wait(Sec) do
		if _G.Level then
			pcall(function()
				Root = (plr.Character or plr.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")

				if not Root then
					return
				end

				local Value = plr.Data.Level.Value
				local v386 = v353()
				local Main = plr.PlayerGui:FindFirstChild("Main")
				local Quest = Main and Main:FindFirstChild("Quest")

				v364(Quest)

				local v389 = tick() - n5 < 0.75
				local v390, v391 = v366(Quest)
				local v392 = World3 and Value >= 2600

				if v392 and not v386 and not u326 then
					u326 = true

					local cFrame3 = CFrame.new(-16269.7041, 25.2288494, 1373.65955)
					local n7 = 0

					while true do
						task.wait(Sec)
						_tp(cFrame3)
						n7 += 1

						if _G.Level then
							if (Root.Position - cFrame3.Position).Magnitude <= 8 or n7 > 20 then
								break
							end
						else
							break
						end
					end

					if not _G.Level then
						u326 = false

						return
					end

					task.wait(1)
					pcall(function()
						game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer(unpack({ "TravelToSubmergedIsland" }))
					end)

					local now = tick()

					while true do
						task.wait(0.5)

						local v396 = v353()
						local v397 = (Root.Position - cFrame3.Position).Magnitude > 50

						if v396 then
							break
						elseif v397 or not _G.Level or tick() - now > 15 then
							break
						end
					end

					task.wait(2)
					u326 = false
				elseif not v392 or v386 then
					u326 = false

					local v398 = QuestNeta()

					if v398 then
						if v398[1] then
							local v399 = v360(Quest)

							if Quest and Quest.Visible == true and not (v399 == "" or v356(v399, v398[1])) then
								pcall(function()
									replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
								end)
								task.wait(0.2)

								return
							end

							local v400 = v364(Quest, v398[1])

							if v400 and v390 and v391 and v391 <= v390 then
								task.wait(0.35)

								return
							end

							if not v400 and not v389 then
								local v401 = v398[6]

								if v401 then
									_tp(v401)

									local v402 = tick() + 20

									while true do
										task.wait(math.max(Sec, 0.25))

										if _G.Level then
											if (Root.Position - v401.Position).Magnitude <= 10 or v402 <= tick() then
												break
											end
										else
											break
										end
									end

									if _G.Level and (Root.Position - v401.Position).Magnitude <= 10 then
										pcall(function()
											replicated.Remotes.CommF_:InvokeServer("StartQuest", v398[3], v398[2])
										end)
										n5 = tick()
										task.wait(1)
									end
								else
									pcall(function()
										replicated.Remotes.CommF_:InvokeServer("StartQuest", v398[3], v398[2])
									end)
									n5 = tick()
									task.wait(0.25)
								end

								return
							end

							local v403 = v398[1]
							local v404 = false
							local v405 = v378(v403)

							if v405 then
								v404 = true

								while true do
									task.wait(Sec)
									_tp(v405.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
									t9.Kill(v405, _G.Level)

									local v406, v407 = v366(Quest)

									if v364(Quest, v403) then
										if v406 and v407 and v407 <= v406 or not _G.Level or not t9.Alive(v405) then
											break
										end
									else
										break
									end
								end
							end

							if not v404 then
								local CFrame_
								local EnemySpawns = workspace:FindFirstChild("_WorldOrigin") and workspace._WorldOrigin:FindFirstChild("EnemySpawns")

								if EnemySpawns then
									for _, child in pairs(EnemySpawns:GetChildren()) do
										if string.find(string.lower(child.Name), string.lower(v403), 1, true) and child:IsA("BasePart") then
											CFrame_ = child.CFrame

											break
										end
									end
								end

								local CFrame_2 = CFrame_ or v398[6]

								CFrame_2 = CFrame_2 or Root.CFrame

								for _, v in ipairs({
									CFrame.new(0, 20, 0),
									CFrame.new(35, 20, 0),
									CFrame.new(-35, 20, 0),
									CFrame.new(0, 20, 35),
									CFrame.new(0, 20, -35)
								}) do
									if _G.Level then
										if v378(v403) then
											v404 = true
										end

										if not v404 then
											_tp(CFrame_2 * v)
											task.wait(math.max(Sec, 0.25))

											continue
										end
									end

									break
								end
							end

							return
						end
					end

					task.wait(1)

					return
				end
			end)
		else
			u326 = false
		end
	end
end)
ClosetMons = t16.Main:AddToggle({
	Name = "Auto Farm Nearest",
	Description = "",
	Default = false,
	Callback = function(p110)
		_G.AutoFarmNear = p110
	end
})
spawn(function()
	while wait() do
		pcall(function()
			if _G.AutoFarmNear then
				for _, child in pairs(workspace.Enemies:GetChildren()) do
					if t9.Alive(child) then
						while true do
							wait()
							t9.Kill(child, _G.AutoFarmNear)

							if _G.AutoFarmNear then
								if not t9.Alive(child) then
									break
								end
							else
								break
							end
						end
					end
				end
			end
		end)
	end
end)
FactoryRaids = t16.Main:AddToggle({
	Name = "Auto Factory Raid",
	Description = "",
	Default = false,
	Callback = function(p111)
		_G.AutoFactory = p111
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.AutoFactory then
				local Core = GetConnectionEnemies("Core")

				if Core then
					while true do
						wait()
						EquipWeapon(_G.SelectWeapon)
						_tp(CFrame.new(448.46756, 199.356781, -441.389252))

						if Core.Humanoid.Health <= 0 then
							break
						elseif _G.AutoFactory == false then
							break
						end
					end
				else
					_tp(CFrame.new(448.46756, 199.356781, -441.389252))
				end
			end
		end)
	end
end)
CastleRaids = t16.Main:AddToggle({
	Name = "Auto Pirate Raid",
	Description = "",
	Default = false,
	Callback = function(p112)
		_G.AutoRaidCastle = p112
	end
})
spawn(function()
	while wait(Sec) do
		if _G.AutoRaidCastle then
			pcall(function()
				local cFrame3 = CFrame.new(-5496.17432, 313.768921, -2841.53027, 0.924894512, 7.37058015e-09, 0.380223751, 3.5881019e-08, 1, -1.06665446e-07, -0.380223751, 1.12297109e-07, 0.924894512)

				if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - Root.Position).Magnitude <= 500 then
					for _, child in pairs(workspace.Enemies:GetChildren()) do
						if child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 and child.Name and (child.HumanoidRootPart.Position - Root.Position).Magnitude <= 2000 then
							while true do
								wait()
								t9.Kill(child, _G.AutoRaidCastle)

								if _G.AutoRaidCastle then
									if not child.Parent then
										break
									end

									if child.Humanoid.Health <= 0 then
										break
									end

									if not workspace.Enemies:FindFirstChild(child.Name) then
										break
									end

									continue
								end

								break
							end
						end
					end
				else
					local t17 = {
						"Galley Pirate",
						"Galley Captain",
						"Raider",
						"Mercenary",
						"Vampire",
						"Zombie",
						"Snow Trooper",
						"Winter Warrior",
						"Lab Subordinate",
						"Horned Warrior",
						"Magma Ninja",
						"Lava Pirate",
						"Ship Deckhand",
						"Ship Engineer",
						"Ship Steward",
						"Ship Officer",
						"Arctic Warrior",
						"Snow Lurker",
						"Sea Soldier",
						"Water Fighter"
					}

					for i = 1, #t17 do
						if replicated:FindFirstChild(t17[i]) then
							for _, child in pairs(replicated:GetChildren()) do
								if table.find(t17, child.Name) then
									_tp(cFrame3)
								end
							end
						end
					end
				end
			end)
		end
	end
end)
Ecto = t16.Main:AddToggle({
	Name = "Auto Farm Ectoplasm",
	Description = "",
	Default = false,
	Callback = function(p113)
		_G.AutoEctoplasm = p113
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.AutoEctoplasm then
				local v425 = GetConnectionEnemies({
					"Ship Deckhand",
					"Ship Engineer",
					"Ship Steward",
					"Ship Officer",
					"Arctic Warrior"
				})

				if t9.Alive(v425) then
					while true do
						wait()
						t9.Kill(v425, _G.AutoEctoplasm)

						if _G.AutoEctoplasm then
							if not v425.Parent or v425.Humanoid.Health <= 0 then
								break
							end
						else
							break
						end
					end
				else
					replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
				end
			end
		end)
	end
end)
t16.Main:AddSection("Chest")
ChestTW = t16.Main:AddToggle({
	Name = "Auto Farm Chest",
	Description = "",
	Default = false,
	Callback = function(p114)
		_G.AutoFarmChest = p114
	end
})
spawn(function()
	while wait(Sec) do
		if _G.AutoFarmChest then
			pcall(function()
				local CollectionService = game:GetService("CollectionService")
				local LocalPlayer2 = game:GetService("Players").LocalPlayer
				local Character = LocalPlayer2.Character or LocalPlayer2.CharacterAdded:Wait()

				if not Character then
					return
				end

				local Position = Character:GetPivot().Position
				local tagged = CollectionService:GetTagged("_ChestTagged")
				local huge = math.huge
				local v432

				for i = 1, #tagged do
					local v434 = tagged[i]
					local Magnitude = (v434:GetPivot().Position - Position).Magnitude

					if (not SelectedIsland or v434:IsDescendantOf(SelectedIsland)) and not v434:GetAttribute("IsDisabled") and Magnitude < huge then
						huge = Magnitude
						v432 = v434
					end
				end

				if v432 then
					_tp(v432:GetPivot())
				end
			end)
		end
	end
end)
ChestBP = t16.Main:AddToggle({
	Name = "Auto Chest Bypass",
	Description = "",
	Default = false,
	Callback = function(p115)
		_G.AutoChestBP = p115

		if p115 then
			local LocalPlayer2 = game:GetService("Players").LocalPlayer
			local u437 = false
			local t18 = {}
			local u439 = true

			local function v440()
				if not LocalPlayer2.Character then
					LocalPlayer2.CharacterAdded:Wait()
				end

				LocalPlayer2.Character:WaitForChild("HumanoidRootPart")

				return LocalPlayer2.Character
			end
			local function v441()
				if u439 then
					u439 = false

					for _, descendant in pairs(game:GetDescendants()) do
						if descendant.Name:find("Chest") and descendant.ClassName == "Part" then
							table.insert(t18, descendant)
						end
					end
				end

				local t19 = {}

				for _, v in pairs(t18) do
					if v:FindFirstChild("TouchInterest") then
						table.insert(t19, v)
					end
				end

				local LowerTorso = v440().LowerTorso

				table.sort(t19, function(p116, p117)
					return (LowerTorso.Position - p116.Position).Magnitude < (LowerTorso.Position - p117.Position).Magnitude
				end)

				return t19
			end
			local function v448()
				if u437 then
					return
				end

				u437 = true
				task.spawn(function()
					while _G.AutoChestBP and LocalPlayer2.Character do
						if not LocalPlayer2.Character.Parent then
							break
						end

						local v449 = v441()

						if #v449 > 0 then
							v440().HumanoidRootPart.CFrame = v449[1].CFrame
						end

						task.wait(0.1)
					end

					u437 = false
				end)
			end

			LocalPlayer2.CharacterAdded:Connect(function()
				v440()
				task.wait(0.5)

				if _G.AutoChestBP then
					v448()
				end
			end)
			v448()
		end
	end
})
StopI = t16.Main:AddToggle({
	Name = "Stop Items",
	Description = "",
	Default = true,
	Callback = function(p118)
		_G.StopWhenChalice = p118
	end
})
spawn(function()
	while wait(0.2) do
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
t16.Main:AddSection("Collect Berry")
Berry = t16.Main:AddToggle({
	Name = "Auto Farm Berry",
	Description = "",
	Default = false,
	Callback = function(p119)
		_G.AutoBerry = p119
	end
})
spawn(function()
	while wait(Sec) do
		if _G.AutoBerry then
			local CollectionService = game:GetService("CollectionService")
			local LocalPlayer2 = game:GetService("Players").LocalPlayer
			local tagged = CollectionService:GetTagged("BerryBush")

			for i = 1, #tagged do
				local v454 = tagged[i]

				for _, v in pairs(v454:GetAttributes()) do
					if not BerryArray or table.find(BerryArray, v) then
						_tp(v454.Parent:GetPivot())

						for i2 = 1, #tagged do
							for _, child in pairs(tagged[i2]:GetChildren()) do
								if not BerryArray or table.find(BerryArray, child) then
									_tp(child.WorldPivot)
									fireproximityprompt(child.ProximityPrompt, math.huge)
								end
							end
						end
					end
				end
			end
		end
	end
end)
BerryH = t16.Main:AddToggle({
	Name = "Auto Farm Berry + Hop",
	Description = "",
	Default = false,
	Callback = function(p120)
		_G.AutoBerryH = p120
	end
})
spawn(function()
	while wait(Sec) do
		if _G.AutoBerryH then
			local CollectionService = game:GetService("CollectionService")
			local LocalPlayer2 = game:GetService("Players").LocalPlayer
			local tagged = CollectionService:GetTagged("BerryBush")

			if #tagged == 0 then
				local TeleportService_ = game:GetService("TeleportService")
				local t20 = {}
				local ok = pcall(function()
					t20 = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
				end)

				if ok and t20.data then
					for _, v in pairs(t20.data) do
						if v.playing < v.maxPlayers and v.id ~= game.JobId then
							TeleportService_:TeleportToPlaceInstance(game.PlaceId, v.id, LocalPlayer2)

							break
						end
					end
				end
			else
				for i = 1, #tagged do
					local v470 = tagged[i]

					for _, v in pairs(v470:GetAttributes()) do
						if BerryArray then
							if not table.find(BerryArray, v) then
								continue
							end
						end

						_tp(v470.Parent:GetPivot())

						for i2 = 1, #tagged do
							for _, child in pairs(tagged[i2]:GetChildren()) do
								if BerryArray then
									if not table.find(BerryArray, child.Name) then
										continue
									end
								end

								_tp(child.WorldPivot)
								fireproximityprompt(child.ProximityPrompt, math.huge)
							end
						end
					end
				end
			end
		end
	end
end)
t16.Main:AddSection("Farm Mob")

if World1 then
	t16.Main:AddDropdown({
		Name = "Select Mob",
		Default = Bandit,
		Options = {
			"Bandit",
			"Monkey",
			"Gorilla",
			"Pirate",
			"Brute",
			"Desert Bandit",
			"Desert Officer",
			"Snow Bandit",
			"Snowman",
			"Chief Petty Officer",
			"Sky Bandit",
			"Dark Master",
			"Toga Warrior",
			"Gladiator",
			"Military Soldier",
			"Military Spy",
			"Fishman Warrior",
			"Fishman Commando",
			"God's Guard",
			"Shanda",
			"Royal Squad",
			"Royal Soldier",
			"Galley Pirate",
			"Galley Captain"
		},
		Callback = function(p121)
			getgenv().SelectMob = p121
		end
	})
end

if World2 then
	t16.Main:AddDropdown({
		Name = "Select Mob",
		Default = Raider,
		Options = {
			"Raider",
			"Mercenary",
			"Swan Pirate",
			"Factory Staff",
			"Marine Lieutenant",
			"Marine Captain",
			"Zombie",
			"Vampire",
			"Snow Trooper",
			"Winter Warrior",
			"Lab Subordinate",
			"Horned Warrior",
			"Magma Ninja",
			"Lava Pirate",
			"Ship Deckhand",
			"Ship Engineer",
			"Ship Steward",
			"Ship Officer",
			"Arctic Warrior",
			"Snow Lurker",
			"Sea Soldier",
			"Water Fighter"
		},
		Callback = function(p122)
			getgenv().SelectMob = p122
		end
	})
end

if World3 then
	t16.Main:AddDropdown({
		Name = "Select Mob",
		Options = {
			"Pirate Millionaire",
			"Dragon Crew Warrior",
			"Dragon Crew Archer",
			"Female Islander",
			"Giant Islander",
			"Marine Commodore",
			"Marine Rear Admiral",
			"Fishman Raider",
			"Fishman Captain",
			"Forest Pirate",
			"Mythological Pirate",
			"Jungle Pirate",
			"Musketeer Pirate",
			"Reborn Skeleton",
			"Living Zombie",
			"Demonic Soul",
			"Posessed Mummy",
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
			"Isle Outlaw",
			"Island Boy",
			"Sun-kissed Warrior",
			"Isle Champion"
		},
		Callback = function(p123)
			getgenv().SelectMob = p123
		end
	})
end

t16.Main:AddToggle({
	Name = "Auto Kill Mob",
	Default = false,
	Callback = function(p124)
		_G.AutoKillMob = p124
	end
})
spawn(function()
	while wait() do
		if _G.AutoKillMob then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild(getgenv().SelectMob) then
					for _, child in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if child.Name == getgenv().SelectMob and child:FindFirstChild("Humanoid") and child:FindFirstChild("HumanoidRootPart") and child.Humanoid.Health > 0 then
							while true do
								game:GetService("RunService").Heartbeat:Wait()
								t9.Kill(child, _G.AutoKillMob)

								if _G.AutoKillMob then
									if not child.Parent or child.Humanoid.Health <= 0 then
										break
									end
								else
									break
								end
							end
						end
					end
				end
			end)
		end
	end
end)
t16.Main:AddSection("Farm All Island")

local t21 = {
	Pirates = {
		CFrame = CFrame.new(-2709.67944, 24.5206585, 2104.24585, -0.744724929, -3.97967455e-08, -0.667371571, 4.32403588e-08, 1, -1.07884304e-07, 0.667371571, -1.09201515e-07, -0.744724929),
		Mobs = { "Bandit" }
	},
	Marine = {
		CFrame = CFrame.new(-2709.67944, 24.5206585, 2104.24585, -0.744724929, -3.97967455e-08, -0.667371571, 4.32403588e-08, 1, -1.07884304e-07, 0.667371571, -1.09201515e-07, -0.744724929),
		Mobs = { "Trainee" }
	},
	Jungle = {
		CFrame = CFrame.new(-1600, 36, 150),
		Mobs = {
			"Monkey",
			"Gorilla"
		}
	},
	["Pirate Village"] = {
		CFrame = CFrame.new(-1100, 4, 3850),
		Mobs = {
			"Pirate",
			"Brute"
		}
	},
	Desert = {
		CFrame = CFrame.new(1090, 7, 4370),
		Mobs = {
			"Desert Bandit",
			"Desert Officer"
		}
	},
	["Frozen Village"] = {
		CFrame = CFrame.new(1200, 28, -1500),
		Mobs = {
			"Snow Bandit",
			"Snowman"
		}
	},
	["Marine Fortress"] = {
		CFrame = CFrame.new(-4500, 20, 4250),
		Mobs = { "Chief Petty Officer" }
	},
	["Skylands Lower"] = {
		CFrame = CFrame.new(-5000, 700, -2500),
		Mobs = {
			"Sky Bandit",
			"Dark Master"
		}
	},
	Prison = {
		CFrame = CFrame.new(4875, 6, 735),
		Mobs = {
			"Prisoner",
			"Dangerous Prisoner"
		}
	},
	Colosseum = {
		CFrame = CFrame.new(-1500, 60, -290),
		Mobs = {
			"Toga Warrior",
			"Gladiator"
		}
	},
	["Magma Village"] = {
		CFrame = CFrame.new(-5200, 8, 8400),
		Mobs = {
			"Military Soldier",
			"Military Spy"
		}
	},
	["Underwater City"] = {
		CFrame = CFrame.new(61160, 5, 1819),
		Mobs = {
			"Fishman Warrior",
			"Fishman Commando"
		}
	},
	["Skylands Upper"] = {
		CFrame = CFrame.new(-7880, 5545, -380),
		Mobs = {
			"Shanda",
			"Royal Squad",
			"Royal Soldier"
		}
	}
}
local t22 = {
	["Kingdom of Rose"] = {
		CFrame = CFrame.new(-321, 73, 297),
		Mobs = {
			"Raider",
			"Mercenary",
			"Swan Pirate",
			"Factory Staff"
		}
	},
	["Green Zone"] = {
		CFrame = CFrame.new(-2447, 73, -3211),
		Mobs = {
			"Marine Lieutenant",
			"Marine Captain"
		}
	},
	["Graveyard Island"] = {
		CFrame = CFrame.new(-9515, 142, 5536),
		Mobs = {
			"Zombie",
			"Vampire"
		}
	},
	["Snow Mountain"] = {
		CFrame = CFrame.new(561, 401, -5306),
		Mobs = {
			"Snow Trooper",
			"Winter Warrior"
		}
	},
	["Hot and Cold (Cold)"] = {
		CFrame = CFrame.new(-6026, 15, -5062),
		Mobs = {
			"Lab Subordinate",
			"Horned Warrior"
		}
	},
	["Hot and Cold (Hot)"] = {
		CFrame = CFrame.new(-5478, 15, -5240),
		Mobs = {
			"Magma Ninja",
			"Lava Pirate"
		}
	},
	["Cursed Ship"] = {
		CFrame = CFrame.new(902, 126, 33071),
		Mobs = {
			"Ship Deckhand",
			"Ship Engineer",
			"Ship Steward",
			"Ship Officer"
		}
	},
	["Ice Castle"] = {
		CFrame = CFrame.new(6137, 294, -6747),
		Mobs = {
			"Arctic Warrior",
			"Snow Lurker"
		}
	},
	["Forgotten Island"] = {
		CFrame = CFrame.new(-3043, 238, -10191),
		Mobs = {
			"Sea Soldier",
			"Water Fighter"
		}
	}
}
local t23 = {
	["Port Town"] = {
		CFrame = CFrame.new(-290, 44, 5450),
		Mobs = {
			"Pirate Millionaire",
			"Pistol Billionaire"
		}
	},
	["Hydra Island"] = {
		CFrame = CFrame.new(5228, 604, 345),
		Mobs = {
			"Dragon Crew Warrior",
			"Dragon Crew Archer",
			"Female Islander",
			"Giant Islander",
			"Training Dummy"
		}
	},
	["Great Tree"] = {
		CFrame = CFrame.new(2682, 1682, -7190),
		Mobs = {
			"Marine Commodore",
			"Marine Rear Admiral"
		}
	},
	["Floating Turtle"] = {
		CFrame = CFrame.new(-12000, 331, -8500),
		Mobs = {
			"Forest Pirate",
			"Mythological Pirate",
			"Jungle Pirate",
			"Musketeer Pirate",
			"Fishman Raider",
			"Fishman Captain"
		}
	},
	["Haunted Castle"] = {
		CFrame = CFrame.new(-9515, 142, 5536),
		Mobs = {
			"Reborn Skeleton",
			"Living Zombie",
			"Demonic Soul",
			"Posessed Mummy"
		}
	},
	["Sea of Treats"] = {
		CFrame = CFrame.new(-1145, 13, -14450),
		Mobs = {
			"Peanut Scout",
			"Peanut President",
			"Ice Cream Commander",
			"Cookie Crafter",
			"Cake Guard",
			"Baking Staff",
			"Head Baker",
			"Cocoa Warrior",
			"Chocolate Bar Battler",
			"Sweet Thief",
			"Candy Rebel"
		}
	},
	["Tiki Outpost"] = {
		CFrame = CFrame.new(-16200, 90, -17300),
		Mobs = {
			"Isle Outlaw",
			"Island Boy",
			"Sun-kissed Warrior",
			"Isle Champion"
		}
	},
	["Submerged Island"] = {
		CFrame = CFrame.new(-3200, -10, -10000),
		Mobs = {
			"Reef Bandit",
			"Coral Pirate",
			"Sea Chanter",
			"Ocean Prophet",
			"High Disciple",
			"Grand Devotee"
		}
	}
}

if World1 then
	t16.Main:AddDropdown({
		Name = "Select Island",
		Options = {
			"Pirates",
			"Marine",
			"Jungle",
			"Pirate Village",
			"Desert",
			"Frozen Village",
			"Marine Fortress",
			"Skylands Lower",
			"Prison",
			"Colosseum",
			"Magma Village",
			"Underwater City",
			"Skylands Upper"
		},
		Callback = function(p125)
			_G.SelectIsland = p125
		end
	})
end

if World2 then
	t16.Main:AddDropdown({
		Name = "Select Island",
		Options = {
			"Kingdom of Rose",
			"Green Zone",
			"Graveyard Island",
			"Snow Mountain",
			"Hot and Cold (Cold)",
			"Hot and Cold (Hot)",
			"Cursed Ship",
			"Ice Castle",
			"Forgotten Island"
		},
		Callback = function(p126)
			_G.SelectIsland = p126
		end
	})
end

if World3 then
	t16.Main:AddDropdown({
		Name = "Select Island",
		Options = {
			"Port Town",
			"Hydra Island",
			"Great Tree",
			"Floating Turtle",
			"Haunted Castle",
			"Sea of Treats",
			"Tiki Outpost",
			"Submerged Island"
		},
		Callback = function(p127)
			_G.SelectIsland = p127
		end
	})
end

local v481

if World1 then
	v481 = t21
elseif World2 then
	v481 = t22
elseif World3 then
	v481 = t23
end

t16.Main:AddToggle({
	Name = "Auto Farm All Island",
	Default = false,
	Callback = function(p128)
		_G.AutoFarmIsland = p128
	end
})
task.spawn(function()
	while task.wait(0.2) do
		if _G.AutoFarmIsland then
			if _G.SelectIsland and v481 then
				local v482 = v481[_G.SelectIsland]

				if v482 then
					local CFrame_ = v482.CFrame
					local t24 = {}

					for _, mob in ipairs(v482.Mobs) do
						t24[mob] = true
					end

					local v487 = false

					for _, child in pairs(workspace.Enemies:GetChildren()) do
						if t24[child.Name] then
							if child:FindFirstChild("Humanoid") then
								if child:FindFirstChild("HumanoidRootPart") then
									if child.Humanoid.Health > 0 then
										v487 = true

										while true do
											task.wait()
											_tp(child.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0))
											t9.Kill(child, true)

											if _G.AutoFarmIsland then
												if not child.Parent then
													break
												end

												if child.Humanoid.Health <= 0 then
													break
												end

												continue
											end

											break
										end
									end
								end
							end
						end
					end

					if not v487 then
						_tp(CFrame_)
					end
				end
			end
		end
	end
end)
t16.Main:AddSection("Farm Elite Hunter")

local v490 = t16.Main:AddParagraph("Elites Process", "")

spawn(function()
	while wait(Sec) do
		pcall(function()
			v490:SetDesc("Elite Progress : " .. replicated.Remotes.CommF_:InvokeServer("EliteHunter", "Progress"))
		end)
	end
end)

local v491 = t16.Main:AddParagraph("Elite Spawn", "Status: ")

spawn(function()
	local s10 = ""

	while wait(1) do
		local v493 = (game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban")) and "✅" or "❌"
		local response = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress")

		if v493 ~= s10 then
			v491:SetDesc("Status: " .. v493 .. " | Killed: " .. response)
			s10 = v493
		end
	end
end)
EliteQ = t16.Main:AddToggle({
	Name = "Auto Farm Elite",
	Description = "",
	Default = false,
	Callback = function(p129)
		_G.FarmEliteHunt = p129
	end
})
spawn(function()
	while wait(1) do
		pcall(function()
			if _G.FarmEliteHunt then
				local Quest = plr.PlayerGui.Main.Quest
				local Text = Quest.Container.QuestTitle.Title.Text

				if Quest.Visible then
					local v497

					for _, v in pairs({
						"Diablo",
						"Urban",
						"Deandre"
					}) do
						if string.find(Text, v) then
							v497 = v

							break
						end
					end

					if v497 then
						local v500

						for _, child in pairs(replicated:GetChildren()) do
							if child.Name == v497 and child:FindFirstChild("HumanoidRootPart") then
								v500 = child

								break
							end
						end

						for _, child in pairs(Enemies:GetChildren()) do
							if child.Name == v497 then
								if t9.Alive(child) then
									v500 = child

									break
								end
							end
						end

						if v500 and v500:FindFirstChild("HumanoidRootPart") then
							_tp(v500.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))

							while true do
								wait()
								t9.Kill(v500, _G.FarmEliteHunt)

								if _G.FarmEliteHunt then
									if not v500.Parent or v500.Humanoid.Health <= 0 or not Quest.Visible then
										break
									end
								else
									break
								end
							end
						else
							wait(5)
						end
					else
						replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
					end
				else
					local response = replicated.Remotes.CommF_:InvokeServer("EliteHunter")

					if response == nil or string.find(response, "Cooldown") then
						wait(10)

						return
					end

					task.wait(1)
				end
			end
		end)
	end
end)
EliteH = t16.Main:AddToggle({
	Name = "Auto Farm Elite + Hop",
	Description = "",
	Default = false,
	Callback = function(p130)
		_G.FarmEliteH = p130
	end
})

local function v506()
	local HttpService = game:GetService("HttpService")
	local TeleportService_ = game:GetService("TeleportService")
	local s11 = ""
	local v510 = false

	repeat
		local ok, result = pcall(function()
			return game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. s11)
		end)

		if ok and result then
			local data = HttpService:JSONDecode(result)

			if data.data then
				for _, v in pairs(data.data) do
					if v.playing < v.maxPlayers and v.id ~= game.JobId then
						v510 = true
						TeleportService_:TeleportToPlaceInstance(game.PlaceId, v.id)

						break
					end
				end

				s11 = data.nextPageCursor or ""
			end
		end
	until not s11 or v510
end

spawn(function()
	while task.wait(1) do
		pcall(function()
			if _G.FarmEliteH then
				local Quest = plr.PlayerGui.Main.Quest
				local Text = Quest.Container.QuestTitle.Title.Text

				if Quest.Visible then
					local v518

					for _, v in pairs({
						"Diablo",
						"Urban",
						"Deandre"
					}) do
						if string.find(Text, v) then
							v518 = v

							break
						end
					end

					if v518 then
						local v521

						for _, child in pairs(replicated:GetChildren()) do
							if child.Name == v518 and child:FindFirstChild("HumanoidRootPart") then
								v521 = child

								break
							end
						end

						for _, child in pairs(workspace.Enemies:GetChildren()) do
							if child.Name == v518 and t9.Alive(child) then
								v521 = child

								break
							end
						end

						if not v521 then
							task.wait(5)
							v506()

							return
						end

						if v521:FindFirstChild("HumanoidRootPart") then
							_tp(v521.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))

							while true do
								wait()
								t9.Kill(v521, _G.FarmEliteH)

								if _G.FarmEliteH then
									if not v521.Parent or v521.Humanoid.Health <= 0 or not Quest.Visible then
										break
									end
								else
									break
								end
							end
						else
							task.wait(5)
							v506()
						end
					else
						replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
						task.wait(1)
						v506()
					end
				else
					local response = replicated.Remotes.CommF_:InvokeServer("EliteHunter")

					if response == nil or string.find(response, "Cooldown") then
						v506()

						return
					end

					task.wait(1)
				end
			end
		end)
	end
end)
t16.Main:AddSection("Farm Rip Indra")
t16.Main:AddToggle({
	Name = "Auto Attack Rip Indra",
	Description = "",
	Default = false,
	Callback = function(p131)
		_G.AutoRipIngay = p131
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.AutoRipIngay then
				local ripIndra = GetConnectionEnemies("rip_indra")

				if GetWP("Dark Dagger") then
					if not GetIn("Valkyrie") and ripIndra then
						while true do
							wait()
							t9.Kill(ripIndra, _G.AutoRipIngay)

							if _G.AutoRipIngay then
								if not ripIndra.Parent or ripIndra.Humanoid.Health <= 0 then
									break
								end
							else
								break
							end
						end
					else
						replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5097.93164, 316.447021, -3142.66602, -0.405007899, -4.31682743e-08, 0.914313197, -1.90943332e-08, 1, 3.8755779e-08, -0.914313197, -1.76180437e-09, -0.405007899))
						wait(0.1)
						_tp(CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781))
					end
				else
					while true do
						wait()
						t9.Kill(ripIndra, _G.AutoRipIngay)

						if _G.AutoRipIngay then
							if not ripIndra.Parent or ripIndra.Humanoid.Health <= 0 then
								break
							end
						else
							break
						end
					end
				end
			end
		end)
	end
end)
t16.Main:AddToggle({
	Name = "Auto Unlocked Haki",
	Description = "",
	Default = false,
	Callback = function(p132)
		_G.AutoUnHaki = p132
	end
})
AuraSkin = function(p133)
	local t25 = { {
		StorageName = p133,
		Type = "AuraSkin",
		Context = "Equip"
	} }

	replicated:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/FruitCustomizerRF"):InvokeServer(unpack(t25))
end
VaildColor = function(p134)
	if p134 then
		if p134.BrickColor then
			return tostring(p134.BrickColor) == "Lime green"
		end
	end
end
HakiCalculate = function(p135)
	local t26 = {
		["Really red"] = "Pure Red",
		Oyster = "Snow White",
		["Hot pink"] = "Winter Sky"
	}

	if p135 and p135.BrickColor then
		return t26[tostring(p135.BrickColor)]
	end
end
spawn(function()
	while wait(Sec) do
		if _G.AutoUnHaki then
			pcall(function()
				local Summoner = workspace.Map["Boat Castle"]:FindFirstChild("Summoner")

				if Summoner and Summoner:FindFirstChild("Circle") then
					local pairs_ = pairs
					local Circle = Summoner:FindFirstChild("Circle")

					for _, child in pairs_(Circle:GetChildren()) do
						if child.Name == "Part" then
							local Part2 = child:FindFirstChild("Part")

							if VaildColor(Part2) == false then
								AuraSkin(HakiCalculate(child))

								while true do
									wait()
									_tp(child.CFrame)

									if VaildColor(Part2) == true then
										break
									elseif not _G.AutoUnHaki then
										break
									end
								end
							end
						end
					end
				end
			end)
		end
	end
end)
t16.Main:AddSection("Farming Cake")

local v536 = t16.Main:AddParagraph("Cake Princes", "")

spawn(function()
	while wait(0.2) do
		pcall(function()
			local v537 = string.match(replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner"), "%d+")

			if v537 then
				v536:SetDesc("Killed : " .. (500 - tonumber(v537) or 0))
			end
		end)
	end
end)
Cake = t16.Main:AddToggle({
	Name = "Auto Farm Cake Prince",
	Description = "",
	Default = false,
	Callback = function(p136)
		_G.Auto_Cake_Prince = p136
	end
})
spawn(function()
	while task.wait() do
		if _G.Auto_Cake_Prince and not _G.AutoRaidCastle then
			pcall(function()
				local LocalPlayer2 = game.Players.LocalPlayer
				local HumanoidRootPart = LocalPlayer2.Character and LocalPlayer2.Character:FindFirstChild("HumanoidRootPart")
				local Quest = LocalPlayer2.PlayerGui.Main.Quest
				local CakeLoaf = workspace.Map:FindFirstChild("CakeLoaf")
				local BigMirror = CakeLoaf and CakeLoaf:FindFirstChild("BigMirror")

				if not HumanoidRootPart then
					return
				end

				if _G.AcceptQuestC and Quest and not Quest.Visible then
					local cFrame3 = CFrame.new(-1927.92, 37.8, -12842.54)

					_tp(cFrame3)

					while (cFrame3.Position - HumanoidRootPart.Position).Magnitude > 50 do
						task.wait(0.2)
					end

					local v544 = math.random(1, 4)
					local t27 = {
						{
							"StartQuest",
							"CakeQuest2",
							2
						},
						{
							"StartQuest",
							"CakeQuest2",
							1
						},
						{
							"StartQuest",
							"CakeQuest1",
							1
						},
						{
							"StartQuest",
							"CakeQuest1",
							2
						}
					}

					pcall(function()
						game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(t27[v544]))
					end)
				end

				if not CakeLoaf then
					_tp(CFrame.new(-2077, 252, -12373))
					task.wait(2)

					return
				end

				if BigMirror and (BigMirror.Other.Transparency == 0 or workspace.Enemies:FindFirstChild("Cake Prince")) then
					local v546 = GetConnectionEnemies("Cake Prince")

					if v546 then
						while true do
							task.wait()
							t9.Kill2(v546, _G.Auto_Cake_Prince)

							if _G.Auto_Cake_Prince then
								if not v546.Parent or v546.Humanoid.Health <= 0 then
									break
								end
							else
								break
							end
						end
					else
						_tp(CFrame.new(-2151.82, 149.32, -12404.91))
					end
				else
					local v547 = GetConnectionEnemies({
						"Cookie Crafter",
						"Cake Guard",
						"Baking Staff",
						"Head Baker"
					})

					if v547 then
						while true do
							task.wait()
							t9.Kill(v547, _G.Auto_Cake_Prince)

							if _G.Auto_Cake_Prince and v547.Parent and not (v547.Humanoid.Health <= 0) then
								if BigMirror and BigMirror.Other.Transparency == 0 then
									break
								end
							else
								break
							end
						end
					else
						_tp(CFrame.new(-2077, 252, -12373))
					end
				end
			end)
		end
	end
end)
CakeQ = t16.Main:AddToggle({
	Name = "Accept Quests",
	Description = "",
	Default = false,
	Callback = function(p137)
		_G.AcceptQuestC = p137
	end
})
CakeSM = t16.Main:AddToggle({
	Name = "Auto Summon Cake Prince",
	Description = "",
	Default = false,
	Callback = function(p138)
		_G.AutoSpawnCP = p138
	end
})
spawn(function()
	while task.wait(2) do
		if _G.AutoSpawnCP then
			pcall(function()
				local CommF_ = game.ReplicatedStorage.Remotes.CommF_
				local BigMirror = workspace.Map.CakeLoaf:FindFirstChild("BigMirror")

				if not BigMirror then
					return
				end

				if workspace.Enemies:FindFirstChild("Cake Prince") then
					return
				end

				if BigMirror.Other.Transparency == 0 then
					return
				end

				CommF_:InvokeServer("CakePrinceSpawner", true)
			end)
		end
	end
end)
t16.Main:AddToggle({
	Name = "Auto Dough King [Fully]",
	Default = false,
	Callback = function(p139)
		_G.AutoDoughKing = p139
	end
})
spawn(function()
	while wait() do
		if _G.AutoDoughKing then
			pcall(function()
				if not workspace.Map.CakeLoaf:FindFirstChild("RedDoor") then
					if GetBP("Red Key") then
						replicated.Remotes.CommF_:InvokeServer("CakeScientist", "Check")
						replicated.Remotes.CommF_:InvokeServer("RaidsNpc", "Check")
					end
				elseif workspace.Map.CakeLoaf:FindFirstChild("RedDoor") then
					if GetBP("Red Key") then
						while true do
							task.wait()
							_tp(CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-08, 0.98883605, 3.60619588e-08, 1, 1.35681812e-08, -0.98883605, 3.36376011e-08, 0.149007782))

							if getgenv().AutoDoughKing then
								if (plr.Character.HumanoidRootPart.CFrame - CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-08, 0.98883605, 3.60619588e-08, 1, 1.35681812e-08, -0.98883605, 3.36376011e-08, 0.149007782)).Magnitude <= 5 then
									break
								end
							else
								break
							end
						end

						EquipWeapon("Red Key")
					end
				elseif GetConnectionEnemies("Dough King") then
					local v550 = GetConnectionEnemies("Dough King")

					if v550 then
						while true do
							task.wait()
							t9.Kill(v550, _G.AutoDoughKing)

							if _G.AutoDoughKing then
								if not v550.Parent or v550.Humanoid.Health <= 0 then
									break
								end
							else
								break
							end
						end
					else
						_tp(CFrame.new(-1943.676513671875, 251.50956726074219, -12337.880859375))
					end
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

				local ok = not plr.Backpack:FindFirstChild("God's Chalice")

				if not ok then
					ok = not not plr.Character:FindFirstChild("God's Chalice")
				end

				if ok then
					_G.FarmEliteHunt = true
				else
					_G.FarmEliteHunt = false
				end

				if GetM("Conjured Cocoa") <= 10 then
					local v552 = GetConnectionEnemies({
						"Cocoa Warrior",
						"Chocolate Bar Battler"
					})

					if v552 then
						while true do
							task.wait()
							t9.Kill(v552, _G.AutoDoughKing)

							if _G.AutoDoughKing == false then
								break
							elseif not v552.Parent or v552.Humanoid.Health <= 0 then
								break
							end
						end
					else
						_tp(CFrame.new(402.71890258789062, 81.060501098632812, -12259.54296875))
					end
				end
			end)
		end
	end
end)
t16.Main:AddToggle({
	Name = "Auto Farm Dough King",
	Default = false,
	Callback = function(p140)
		_G.AutoAttackDoughKing = p140
	end
})
spawn(function()
	while wait() do
		if _G.AutoAttackDoughKing then
			pcall(function()
				local v553 = GetConnectionEnemies("Dough King")

				if v553 then
					while true do
						task.wait()
						t9.Kill(v553, _G.AutoAttackDoughKing)

						if _G.AutoAttackDoughKing then
							if not v553.Parent or v553.Humanoid.Health <= 0 then
								break
							end
						else
							break
						end
					end
				else
					_tp(CFrame.new(-1943.6765, 251.5095, -12337.8809))
				end
			end)
		end
	end
end)
t16.Main:AddToggle({
	Name = "Auto Farm Dough King + Hop",
	Default = false,
	Callback = function(p141)
		_G.AutoHop_Dough = p141
	end
})

local function v554()
	pcall(function()
		local HttpService = game:GetService("HttpService")
		local t28 = {}
		local response = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")

		for _, v in pairs(HttpService:JSONDecode(response).data) do
			if v.playing < v.maxPlayers then
				table.insert(t28, v.id)
			end
		end

		if #t28 > 0 then
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, t28[math.random(1, #t28)], game.Players.LocalPlayer)
		end
	end)
end

spawn(function()
	while task.wait() do
		if _G.AutoHop_Dough then
			pcall(function()
				local v560 = GetConnectionEnemies("Dough King")

				if v560 then
					while true do
						task.wait()
						t9.Kill(v560, _G.AutoHop_Dough)

						if _G.AutoHop_Dough then
							if not v560.Parent or v560.Humanoid.Health <= 0 then
								break
							end
						else
							break
						end
					end
				else
					_tp(CFrame.new(-1943.6765, 251.5095, -12337.8809))
					task.wait(2)

					if not GetConnectionEnemies("Dough King") and _G.AutoHop_Dough then
						v554()
					end
				end
			end)
		end
	end
end)
t16.Main:AddSection("Farming Bone")

local Bones = t16.Main:AddParagraph("Bones", "")

spawn(function()
	while wait(0.2) do
		pcall(function()
			Bones:SetDesc("Bones : " .. GetM("Bones"))
		end)
	end
end)
t16.Main:AddToggle({
	Name = "Auto Farm Bone",
	Description = "",
	Default = false,
	Callback = function(p142)
		_G.AutoFarm_Bone = p142
	end
})
spawn(function()
	local LocalPlayer2 = game.Players.LocalPlayer
	local t29 = {
		"Reborn Skeleton",
		"Living Zombie",
		"Demonic Soul",
		"Possessed Mummy"
	}

	while wait(0.5) do
		if _G.AutoFarm_Bone then
			pcall(function()
				local Character = LocalPlayer2.Character
				local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

				if not HumanoidRootPart then
					return
				end

				local Quest = LocalPlayer2.PlayerGui:FindFirstChild("Main") and LocalPlayer2.PlayerGui.Main:FindFirstChild("Quest")
				local v567 = GetConnectionEnemies(t29)

				if _G.AcceptQuestB and Quest and not Quest.Visible then
					local cFrame3 = CFrame.new(-9516.99316, 172.01718, 6078.46533)

					_tp(cFrame3)

					while true do
						wait(2)

						if _G.AutoFarm_Bone then
							if (cFrame3.Position - HumanoidRootPart.Position).Magnitude <= 50 then
								break
							end
						else
							break
						end
					end

					if not _G.AutoFarm_Bone then
						return
					end

					local t30 = {
						{
							"StartQuest",
							"HauntedQuest2",
							2
						},
						{
							"StartQuest",
							"HauntedQuest2",
							1
						},
						{
							"StartQuest",
							"HauntedQuest1",
							1
						},
						{
							"StartQuest",
							"HauntedQuest1",
							2
						}
					}

					game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(t30[math.random(1, #t30)]))
				end

				if v567 then
					while true do
						wait()
						t9.Kill(v567, true)

						if _G.AutoFarm_Bone then
							if not v567.Parent or v567.Humanoid.Health <= 0 then
								break
							end
						else
							break
						end
					end
				else
					_tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
				end
			end)
		end
	end
end)
BoneQ = t16.Main:AddToggle({
	Name = "Accept Quests",
	Description = "",
	Default = false,
	Callback = function(p143)
		_G.AcceptQuestB = p143
	end
})
t16.Main:AddToggle({
	Name = "Auto Soul Reaper",
	Description = "",
	Default = false,
	Callback = function(p144)
		_G.AutoHytHallow = p144
	end
})
spawn(function()
	while wait(Sec) do
		if _G.AutoHytHallow then
			pcall(function()
				local v570 = GetConnectionEnemies("Soul Reaper")

				if v570 then
					while true do
						task.wait()
						t9.Kill(v570, _G.AutoHytHallow)

						if v570.Humanoid.Health <= 0 then
							break
						elseif _G.AutoHytHallow == false then
							break
						end
					end
				elseif GetBP("Hallow Essence") then
					while true do
						wait(0.1)
						_tp(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))

						if _G.AutoHytHallow == false then
							break
						elseif plr.Character.HumanoidRootPart.CFrame == CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125) then
							break
						end
					end

					EquipWeapon("Hallow Essence")
				else
					while true do
						task.wait(0.1)
						replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)

						if _G.AutoHytHallow == false then
							break
						elseif GetBP("Hallow Essence") then
							break
						end
					end
				end
			end)
		end
	end
end)
RanBone = t16.Main:AddToggle({
	Name = "Auto Random Bones",
	Description = "",
	Default = false,
	Callback = function(p145)
		_G.Auto_Random_Bone = p145
	end
})
spawn(function()
	while wait(Sec) do
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
Lucky = t16.Main:AddToggle({
	Name = "Auto Try Luck Gravestone",
	Description = "",
	Default = false,
	Callback = function(p146)
		_G.TryLucky = p146
	end
})
spawn(function()
	while wait(Sec) do
		if _G.TryLucky then
			local cFrame3 = CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813)

			if plr.Character.HumanoidRootPart.CFrame ~= cFrame3 then
				_tp(CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813))
			elseif plr.Character.HumanoidRootPart.CFrame == cFrame3 then
				replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 1)
			end
		end
	end
end)
Pray = t16.Main:AddToggle({
	Name = "Auto Pray Gravestone",
	Description = "",
	Default = false,
	Callback = function(p147)
		_G.Praying = p147
	end
})
spawn(function()
	while wait(Sec) do
		if _G.Praying then
			local cFrame3 = CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813)

			if plr.Character.HumanoidRootPart.CFrame ~= cFrame3 then
				_tp(CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813))
			elseif plr.Character.HumanoidRootPart.CFrame == cFrame3 then
				replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2)
			end
		end
	end
end)
t16.Main:AddSection("Tyrant of the Skies")

local v573 = t16.Main:AddParagraph("Boss Spawn", "")

spawn(function()
	pcall(function()
		while wait(1) do
			if workspace.Enemies:FindFirstChild("Tyrant of the Skies") then
				v573:SetDesc("✅")
			else
				v573:SetDesc("❌")
			end
		end
	end)
end)

local v574 = t16.Main:AddParagraph("Check Status Eyes", "")

Check_Eye = function()
	local IslandModel = workspace.Map.TikiOutpost.IslandModel
	local n8 = 0

	for _, v in ipairs({
		IslandModel.Eye1,
		IslandModel.Eye2,
		IslandModel.IslandChunks.E.Eye3,
		IslandModel.IslandChunks.E.Eye4
	}) do
		if v and v.Transparency ~= 1 then
			n8 += 1
		end
	end

	return n8, n8 == 4
end
task.spawn(function()
	local v579 = false

	while task.wait(1) do
		local v580, v581 = Check_Eye()

		v574:SetDesc("Eyes: " .. v580 .. "/4")

		if v581 and not v579 then
			v579 = true
		elseif not v581 then
			v579 = false
		end
	end
end)
FarmTyrant = t16.Main:AddToggle({
	Name = "Auto Farm Boss TOTS",
	Description = "",
	Default = false,
	Callback = function(p148)
		_G.FarmTyrant = p148
	end
})
spawn(function()
	while wait(Sec) do
		if _G.FarmTyrant then
			pcall(function()
				if not plr.Character then
					return
				end

				local HumanoidRootPart = plr.Character:FindFirstChild("HumanoidRootPart")

				if not HumanoidRootPart then
					return
				end

				local vector3 = Vector3.new(-16268.287, 152.616, 1390.773)

				if (HumanoidRootPart.Position - vector3).Magnitude > 5 then
					_tp(CFrame.new(vector3))

					while true do
						wait()

						if _G.FarmTyrant then
							if plr.Character then
								if not plr.Character:FindFirstChild("HumanoidRootPart") or not ((plr.Character.HumanoidRootPart.Position - vector3).Magnitude <= 5) then
									continue
								end
							else
								continue
							end

							break
						end

						break
					end
				end

				local TyrantOfTheSkies = workspace.Enemies:FindFirstChild("Tyrant of the Skies")

				if TyrantOfTheSkies and TyrantOfTheSkies:FindFirstChild("Humanoid") and TyrantOfTheSkies.Humanoid.Health > 0 then
					while _G.FarmTyrant do
						if t9 and t9.Kill then
							t9.Kill(TyrantOfTheSkies, _G.FarmTyrant)
						end

						wait()

						if not _G.FarmTyrant or not TyrantOfTheSkies.Parent or TyrantOfTheSkies.Humanoid.Health <= 0 then
							break
						end
					end

					return
				end

				for _, v in ipairs({
					"Serpent Hunter",
					"Skull Slayer",
					"Isle Champion",
					"Sun-kissed Warrior"
				}) do
					if not _G.FarmTyrant then
						break
					end

					for _, child in pairs(workspace.Enemies:GetChildren()) do
						if not _G.FarmTyrant then
							break
						end

						if child and child.Name == v and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 then
							if (HumanoidRootPart.Position - child.HumanoidRootPart.Position).Magnitude > 5000 then
								_tp(child.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))

								local now = tick()

								repeat
									wait()
									HumanoidRootPart = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
								until not _G.FarmTyrant or not HumanoidRootPart or (HumanoidRootPart.Position - child.HumanoidRootPart.Position).Magnitude <= 6 or tick() - now > 8
							end

							while _G.FarmTyrant do
								if t9 and t9.Kill then
									t9.Kill(child, _G.FarmTyrant)
								end

								wait()

								if not _G.FarmTyrant or not child.Parent or child.Humanoid.Health <= 0 then
									break
								end
							end
						end
					end
				end
			end)
		end
	end
end)
FarmPhaBinh = t16.Main:AddToggle({
	Name = "Auto Summon Boss",
	Description = "",
	Default = false,
	Callback = function(p149)
		_G.FarmPhaBinh = p149
	end
})

local function v590(p150)
	local VirtualInputManager = game:GetService("VirtualInputManager")

	VirtualInputManager:SendKeyEvent(true, p150, false, game)
	wait(0.05)
	VirtualInputManager:SendKeyEvent(false, p150, false, game)
end
local function v592(p151)
	if not plr.Character or not plr.Character:FindFirstChild("Humanoid") or not (plr.Character.Humanoid.Health > 0) then
		return
	end

	for _, child in pairs(plr.Backpack:GetChildren()) do
		if child:IsA("Tool") and child.ToolTip == p151 then
			child.Parent = plr.Character
			wait(0.12)

			for _, v in ipairs({
				"Z",
				"X",
				"C",
				"V",
				"F"
			}) do
				if not _G.FarmPhaBinh then
					break
				end

				pcall(function()
					v590(v)
				end)
				wait(0.12)
			end

			child.Parent = plr.Backpack

			return
		end
	end
end

local t31 = {
	CFrame.new(-16332.5263671875, 158.07200622558594, 1440.324951171875),
	CFrame.new(-16288.609375, 158.16700744628906, 1470.3680419921875),
	CFrame.new(-16245.412109375, 158.43699645996094, 1463.365966796875),
	CFrame.new(-16212.46875, 158.16700744628906, 1466.343994140625),
	CFrame.new(-16211.9462890625, 158.07200622558594, 1322.39794921875),
	CFrame.new(-16260.921875, 154.92100524902344, 1323.615966796875),
	CFrame.new(-16297.0595703125, 159.322998046875, 1317.2239990234375),
	CFrame.new(-16335.0966796875, 159.33399963378906, 1324.885986328125)
}

spawn(function()
	while wait(Sec) do
		if _G.FarmPhaBinh then
			pcall(function()
				if plr and plr.Character then
					if plr.Character:FindFirstChild("HumanoidRootPart") then
						if plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
							for _, v in ipairs(t31) do
								if not _G.FarmPhaBinh then
									break
								end

								_tp(v)

								local v600 = false
								local now = tick()

								while tick() - now < 12 and _G.FarmPhaBinh do
									local HumanoidRootPart = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")

									if not HumanoidRootPart then
										break
									end

									if (HumanoidRootPart.Position - v.Position).Magnitude <= 3 then
										v600 = true

										break
									end

									wait(0.1)
								end

								if _G.FarmPhaBinh and v600 then
									v592("Melee")
									v592("Sword")
									v592("Gun")
								end
							end

							return
						end
					end
				end
			end)
		end
	end
end)
t16.Main:AddSection("Farm Material")
Test = t16.Main:AddDropdown({
	Name = "Choose Material",
	Description = "",
	Options = MaterialList,
	Callback = function(p152)
		getgenv().SelectMaterial = p152
	end
})
Toggle = t16.Main:AddToggle({
	Name = "Auto Farm Materials",
	Description = "",
	Default = false,
	Callback = function(p153)
		getgenv().AutoMaterial = p153
	end
})
spawn(function()
	local function v603(p154, p155)
		if p154:FindFirstChild("Humanoid") and p154:FindFirstChild("HumanoidRootPart") and p154.Humanoid.Health > 0 and p154.Name == p155 then
			while true do
				wait()
				t9.Kill(p154, getgenv().AutoMaterial)

				if getgenv().AutoMaterial then
					if not p154.Parent or p154.Humanoid.Health <= 0 then
						break
					end
				else
					break
				end
			end
		end
	end
	local function v604()
		for _, child in pairs(game:GetService("Workspace")._WorldOrigin.EnemySpawns:GetChildren()) do
			for _, v in ipairs(MMon) do
				if string.find(child.Name, v) and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - child.Position).Magnitude >= 10 then
					_tp(child.CFrame * Pos)
				end
			end
		end
	end

	while wait() do
		if getgenv().AutoMaterial then
			pcall(function()
				if getgenv().SelectMaterial then
					MaterialMon(getgenv().SelectMaterial)
					_tp(MPos)
				end

				for _, v in ipairs(MMon) do
					for _, child in pairs(workspace.Enemies:GetChildren()) do
						v603(child, v)
					end
				end

				v604()
			end)
		end
	end
end)
t16.Main:AddSection("Farm Boss")
BossDropdown = t16.Main:AddDropdown({
	Name = "Select Boss",
	Description = "",
	Options = BossList,
	Callback = function(p156)
		_G.FindBoss = p156
	end
})
FarmBoss = t16.Main:AddToggle({
	Name = "Auto Farm Boss",
	Description = "",
	Default = false,
	Callback = function(p157)
		_G.FarmBoss = p157
		spawn(function()
			while wait(Sec) do
				if _G.FarmBoss then
					pcall(function()
						local v613 = QuestBeta()[2] ~= nil and QuestBeta()[3] ~= nil
						local Text = plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text

						if _G.AcceptQuestBoss and v613 then
							if not string.find(Text, QuestBeta()[0]) then
								replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
							end

							if plr.PlayerGui.Main.Quest.Visible == false then
								_tp(QuestBeta()[5])

								if (Root.Position - QuestBeta()[5].Position).Magnitude <= 5 then
									replicated.Remotes.CommF_:InvokeServer("StartQuest", QuestBeta()[3], QuestBeta()[2])
								end
							elseif plr.PlayerGui.Main.Quest.Visible == true then
								if workspace.Enemies:FindFirstChild(QuestBeta()[1]) then
									for _, child in pairs(workspace.Enemies:GetChildren()) do
										if t9.Alive(child) and child.Name == QuestBeta()[1] then
											if string.find(Text, QuestBeta()[0]) then
												while true do
													wait()
													t9.Kill(child, _G.FarmBoss)

													if _G.FarmBoss then
														if child.Humanoid.Health <= 0 or not child.Parent or plr.PlayerGui.Main.Quest.Visible == false then
															break
														end
													else
														break
													end
												end
											else
												replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
											end
										end
									end
								else
									_tp(QuestBeta()[4])

									if replicated:FindFirstChild(QuestBeta()[1]) then
										_tp(replicated:FindFirstChild(QuestBeta()[1]).HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
									end
								end
							end
						elseif workspace.Enemies:FindFirstChild(QuestBeta()[1]) then
							for _, child in pairs(workspace.Enemies:GetChildren()) do
								if t9.Alive(child) and child.Name == QuestBeta()[1] then
									while true do
										wait()
										t9.Kill(child, _G.FarmBoss)

										if _G.FarmBoss then
											if child.Humanoid.Health <= 0 or not child.Parent then
												break
											end
										else
											break
										end
									end
								end
							end
						else
							_tp(QuestBeta()[4])

							if replicated:FindFirstChild(QuestBeta()[1]) then
								_tp(replicated:FindFirstChild(QuestBeta()[1]).HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
							end
						end
					end)
				end
			end
		end)
	end
})
BossQ = t16.Main:AddToggle({
	Name = "Accept Quests",
	Description = "",
	Default = true,
	Callback = function(p158)
		_G.AcceptQuestBoss = p158
	end
})
FarmAllBoss = t16.Main:AddToggle({
	Name = "Auto Farm All Boss",
	Default = false,
	Callback = function(p159)
		_G.AutoFarmAllBoss = p159
	end
})
task.spawn(function()
	while task.wait(0.3) do
		if _G.AutoFarmAllBoss then
			pcall(function()
				local LocalPlayer2 = game.Players.LocalPlayer

				if LocalPlayer2.Character then
					if LocalPlayer2.Character:FindFirstChild("HumanoidRootPart") then
						local HumanoidRootPart = LocalPlayer2.Character.HumanoidRootPart
						local v621
						local huge = math.huge

						for _, child in pairs(workspace.Enemies:GetChildren()) do
							if child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 and table.find(BossList, child.Name) then
								local Magnitude = (HumanoidRootPart.Position - child.HumanoidRootPart.Position).Magnitude

								if Magnitude < huge then
									v621 = child
									huge = Magnitude
								end
							end
						end

						if v621 and v621:FindFirstChild("HumanoidRootPart") then
							local HumanoidRootPart2 = v621.HumanoidRootPart
							local Humanoid = v621.Humanoid

							repeat
								task.wait(0.1)

								if not _G.AutoFarmAllBoss then
									break
								end

								local v628 = HumanoidRootPart2.CFrame * CFrame.new(0, 5, 0)

								if (HumanoidRootPart.Position - v628.Position).Magnitude > 100 then
									LocalPlayer2.Character:PivotTo(v628)
								else
									_tp(v628)
								end

								if t9 and typeof(t9.Kill) == "function" then
									t9.Kill(v621, true)
								end
							until not v621.Parent or Humanoid.Health <= 0 or not _G.AutoFarmAllBoss
						end

						return
					end
				end
			end)
		end
	end
end)
t16.Main:AddSection("Farming Mastery")
t16.Main:AddDropdown({
	Name = "Choose Island",
	Description = "",
	Options = {
		"Cake",
		"Bone"
	},
	Default = Bone,
	Callback = function(p160)
		SelectIsland = p160
	end
})
t16.Main:AddToggle({
	Name = "Auto Mastery Fruits",
	Description = "",
	Default = false,
	Callback = function(p161)
		_G.FarmMastery_Dev = p161
	end
})
spawn(function()
	RunSer.RenderStepped:Connect(function()
		pcall(function()
			if _G.FarmMastery_Dev or _G.FarmMastery_G or _G.FarmMastery_S then
				for _, child in pairs(plr.PlayerGui.Notifications:GetChildren()) do
					if child.Name == "NotificationTemplate" and string.find(child.Text, "Skill locked!") then
						child:Destroy()
					end
				end
			end
		end)
	end)
end)
spawn(function()
	while wait(Sec) do
		if _G.FarmMastery_Dev then
			pcall(function()
				if SelectIsland == "Cake" then
					local v631 = GetConnectionEnemies(t5)

					if v631 then
						HealthM = v631.Humanoid.MaxHealth * 70 / 100

						while true do
							wait()
							MousePos = v631.HumanoidRootPart.Position
							t9.Mas(v631, _G.FarmMastery_Dev)

							if _G.FarmMastery_Dev == false then
								break
							elseif v631.Humanoid.Health <= 0 or not v631.Parent then
								break
							end
						end
					else
						_tp(CFrame.new(-1943.676513671875, 251.50956726074219, -12337.880859375))
					end
				elseif SelectIsland == "Bone" then
					local v632 = GetConnectionEnemies(t6)

					if v632 then
						HealthM = v632.Humanoid.MaxHealth * 70 / 100

						while true do
							wait()
							MousePos = v632.HumanoidRootPart.Position
							t9.Mas(v632, _G.FarmMastery_Dev)

							if _G.FarmMastery_Dev == false or v632.Humanoid.Health <= 0 then
								break
							elseif not v632.Parent then
								break
							end
						end
					else
						_tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
					end
				end
			end)
		end
	end
end)
t16.Main:AddToggle({
	Name = "Auto Mastery Gun",
	Description = "",
	Default = false,
	Callback = function(p162)
		_G.FarmMastery_G = p162
	end
})
spawn(function()
	while wait(Sec) do
		if _G.FarmMastery_G then
			pcall(function()
				if SelectIsland == "Cake" then
					local v633 = GetConnectionEnemies(t5)

					if v633 then
						HealthM = v633.Humanoid.MaxHealth * 70 / 100

						while true do
							wait()
							MousePos = v633.HumanoidRootPart.Position
							t9.Masgun(v633, _G.FarmMastery_G)

							local REShootGunEvent = replicated:FindFirstChild("Modules"):FindFirstChild("Net"):FindFirstChild("RE/ShootGunEvent")

							if plr.Character:FindFirstChildOfClass("Tool").ToolTip ~= "Gun" then
								break
							end

							local ok = not plr.Character:FindFirstChildOfClass("Tool")

							if not ok then
								ok = plr.Character:FindFirstChildOfClass("Tool").Name ~= "Skull Guitar"
							end

							if not ok then
								SoulGuitar = true
								plr.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer("TAP", MousePos)

								if _G.FarmMastery_G then
									vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1)
									wait(0.05)
									vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1)
									wait(0.05)
								end
							elseif plr.Character:FindFirstChildOfClass("Tool") then
								if plr.Character:FindFirstChildOfClass("Tool").Name ~= "Skull Guitar" then
									SoulGuitar = false
									REShootGunEvent:FireServer(MousePos, { v633.HumanoidRootPart })

									if _G.FarmMastery_G then
										vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1)
										wait(0.05)
										vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1)
										wait(0.05)
									end
								end
							end

							if _G.FarmMastery_G == false or v633.Humanoid.Health <= 0 or not v633.Parent then
								SoulGuitar = false

								return
							end
						end

						return
					end

					_tp(CFrame.new(-1943.676513671875, 251.50956726074219, -12337.880859375))
				elseif SelectIsland == "Bone" then
					local v636 = GetConnectionEnemies(t6)

					if v636 then
						HealthM = v636.Humanoid.MaxHealth * 70 / 100

						while true do
							wait()
							MousePos = v636.HumanoidRootPart.Position
							t9.Masgun(v636, _G.FarmMastery_G)

							local REShootGunEvent = replicated:FindFirstChild("Modules"):FindFirstChild("Net"):FindFirstChild("RE/ShootGunEvent")

							if plr.Character:FindFirstChildOfClass("Tool").ToolTip ~= "Gun" then
								break
							end

							local ok2 = not plr.Character:FindFirstChildOfClass("Tool")

							if not ok2 then
								ok2 = plr.Character:FindFirstChildOfClass("Tool").Name ~= "Skull Guitar"
							end

							if not ok2 then
								SoulGuitar = true
								plr.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer("TAP", MousePos)

								if _G.FarmMastery_G then
									vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1)
									wait(0.05)
									vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1)
									wait(0.05)
								end
							elseif plr.Character:FindFirstChildOfClass("Tool") then
								if plr.Character:FindFirstChildOfClass("Tool").Name ~= "Skull Guitar" then
									SoulGuitar = false
									REShootGunEvent:FireServer(MousePos, { v636.HumanoidRootPart })

									if _G.FarmMastery_G then
										vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1)
										wait(0.05)
										vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1)
										wait(0.05)
									end
								end
							end

							if _G.FarmMastery_G == false or v636.Humanoid.Health <= 0 or not v636.Parent then
								SoulGuitar = false

								return
							end
						end

						return
					end

					_tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
				end
			end)
		end
	end
end)
t16.Main:AddToggle({
	Name = "Auto Mastery All Sword",
	Description = "",
	Default = false,
	Callback = function(p163)
		_G.FarmMastery_S = p163
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.FarmMastery_S then
				if SelectIsland == "Cake" then
					local next_ = next
					local response, v641 = replicated.Remotes.CommF_:InvokeServer("getInventory")
					local exitTo
					local v643

					for _, v in next_, response, v641 do
						if type(v) == "table" and v.Type == "Sword" then
							v643 = v
							exitTo = 1

							break
						end
					end

					if exitTo == 1 then
						SwordName = v643.Name

						if tonumber(v643.Mastery) >= 1 or tonumber(v643.Mastery) <= 599 then
							local v646 = GetConnectionEnemies(t5)

							if GetBP(SwordName) then
								if v646 then
									while true do
										wait()
										t9.Sword(v646, _G.FarmMastery_S)

										if _G.FarmMastery_S == false then
											break
										elseif not v646.Parent or v646.Humanoid.Health <= 0 then
											break
										end
									end
								else
									_tp(CFrame.new(-1943.676513671875, 251.50956726074219, -12337.880859375))
								end
							else
								replicated.Remotes.CommF_:InvokeServer("LoadItem", SwordName)
							end
						elseif tonumber(v643.Mastery) >= 600 then
							if GetBP(SwordName) then
								return nil
							end

							replicated.Remotes.CommF_:InvokeServer("LoadItem", SwordName)
						end
					end
				elseif SelectIsland == "Bone" then
					local next_ = next
					local response, v649 = replicated.Remotes.CommF_:InvokeServer("getInventory")
					local exitTo2
					local v651

					for _, v in next_, response, v649 do
						if type(v) == "table" and v.Type == "Sword" then
							v651 = v
							exitTo2 = 1

							break
						end
					end

					if exitTo2 == 1 then
						SwordName = v651.Name

						if tonumber(v651.Mastery) >= 1 or tonumber(v651.Mastery) <= 599 then
							local v654 = GetConnectionEnemies(t6)

							if GetBP(SwordName) then
								if v654 then
									while true do
										wait()
										t9.Sword(v654, _G.FarmMastery_S)

										if _G.FarmMastery_S == false then
											break
										elseif not v654.Parent or v654.Humanoid.Health <= 0 then
											break
										end
									end
								else
									_tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
								end
							else
								replicated.Remotes.CommF_:InvokeServer("LoadItem", SwordName)
							end
						elseif tonumber(v651.Mastery) >= 600 then
							if GetBP(SwordName) then
								return nil
							end

							replicated.Remotes.CommF_:InvokeServer("LoadItem", SwordName)
						end
					end
				end
			end
		end)
	end
end)
t16.Settings:AddSection("Settings / Configure")
t16.Settings:AddSlider({
	Name = "Tween Speed",
	Description = "Lower values make movement smoother and reduce target swapping.",
	Min = 150,
	Max = 350,
	Default = 175,
	Increment = 5,
	Suffix = " studs/s",
	Callback = function(p164)
		t11["Tween Speed"] = p164
	end
})
Initialize = t16.Settings:AddToggle({
	Name = "Fast Attack",
	Description = "",
	Default = true,
	Callback = function(p165)
		_G.Seriality = p165
	end
})
Bringmob = t16.Settings:AddToggle({
	Name = "Bring Mobs",
	Description = "",
	Default = true,
	Callback = function(p166)
		_B = p166
	end
})
t16.Settings:AddToggle({
	Name = "Auto Hop Server with time",
	Default = false,
	Callback = function(p167)
		_G.AutoHopServer = p167

		if not p167 then
			_G.HopTimer = nil
		end
	end
})
Spawn(function()
	while Wait(1) do
		if _G.AutoHopServer then
			pcall(function()
				if not _G.HopTimer then
					_G.HopTimer = tick()
				end

				if _G.HopDelay <= tick() - _G.HopTimer then
					_G.HopTimer = tick()

					if syn and syn.queue_on_teleport then
						syn.queue_on_teleport("loadstring(game:HttpGet('https://pastefy.app/iiFOhcot/raw'))()")
					end

					game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
				end
			end)
		end
	end
end)
t16.Settings:AddSlider({
	Name = "Hop Delay (Minutes)",
	Min = 5,
	Max = 120,
	Default = 30,
	Increment = 1,
	Callback = function(p168)
		_G.HopDelay = p168 * 60
	end
})
t16.Settings:AddToggle({
	Name = "Auto Set Spawn Point",
	Default = false,
	Callback = function(p169)
		getgenv().Set = p169

		if p169 then
			pcall(function()
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			end)
		end
	end
})
BusuAura = t16.Settings:AddToggle({
	Name = "Auto Turn on Buso",
	Description = "",
	Default = true,
	Callback = function(p170)
		Boud = p170
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if Boud then
				local t32 = {
					"HasBuso",
					"Buso"
				}

				if not plr.Character:FindFirstChild(t32[1]) then
					replicated.Remotes.CommF_:InvokeServer(t32[2])
				end
			end
		end)
	end
end)
t16.Settings:AddToggle({
	Name = "Auto Haki Observation",
	Default = false,
	Callback = function(p171)
		getgenv().Observation = p171
	end
})
spawn(function()
	while wait() do
		if getgenv().Observation then
			pcall(function()
				game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true)
			end)
		end
	end
end)
RaceV3Aura = t16.Settings:AddToggle({
	Name = "Auto Turn on Race V3",
	Description = "",
	Default = false,
	Flag = "AutoTurnonRaceV3",
	Callback = function(p172)
		_G.RaceClickAutov3 = p172
	end
})
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
RaceV4Aura = t16.Settings:AddToggle({
	Name = "Auto Turn on Race V4",
	Description = "",
	Default = false,
	Callback = function(p173)
		_G.RaceClickAutov4 = p173
	end
})
spawn(function()
	while wait(0.2) do
		pcall(function()
			if _G.RaceClickAutov4 then
				if plr.Character:FindFirstChild("RaceEnergy") then
					if plr.Character:FindFirstChild("RaceEnergy").Value == 1 then
						Useskills("nil", "Y")
					end
				end
			end
		end)
	end
end)
RandomAround = t16.Settings:AddToggle({
	Name = "Auto Turn on Spin  xyz",
	Description = "",
	Default = false,
	Callback = function(p174)
		RandomCFrame = p174
	end
})
SafeModes = t16.Settings:AddToggle({
	Name = "Safe Mode",
	Description = "",
	Default = false,
	Callback = function(p175)
		_G.Safemode = p175
	end
})
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
DisableHitVFX = t16.Settings:AddToggle({
	Name = "Remove Hit VFX",
	Description = "Removes slash and sword visual effects for better visibility",
	Default = false,
	Callback = function(p176)
		_G.DestroyHit = p176
	end
})

local t33 = {
	"SlashHit",
	"CurvedRing",
	"SwordSlash",
	"SlashTail"
}

task.spawn(function()
	while task.wait(Sec) do
		if _G.DestroyHit then
			pcall(function()
				for _, child in pairs(workspace._WorldOrigin:GetChildren()) do
					if table.find(t33, child.Name) then
						child:Destroy()
					end
				end
			end)
		end
	end
end)
RmvVFX = t16.Settings:AddToggle({
	Name = "Remove Death & Respawned VFX",
	Description = "",
	Default = false,
	Callback = function(p177)
		RDeath = p177
	end
})
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
DisblesNotify = t16.Settings:AddToggle({
	Name = "Disable Notify",
	Description = "",
	Default = false,
	Callback = function(p178)
		RemoveDamage = p178
	end
})
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
t16.Settings:AddToggle({
	Name = "Anti AFK",
	Default = true,
	Callback = function(p179)
		if p179 then
			local VirtualUser = game:GetService("VirtualUser")

			repeat
				wait()
			until game:IsLoaded()

			game:GetService("Players").LocalPlayer.Idled:Connect(function()
				VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
				wait(1)
				VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
			end)
		end
	end
})
t16.Settings:AddToggle({
	Name = "Auto Anti - Admin Join Server",
	Description = "",
	Default = true,
	Callback = function(p180)
		getgenv().HopServerAdmin = p180
	end
})
spawn(function()
	while wait() do
		pcall(function()
			if getgenv().HopServerAdmin then
				for _, player in pairs(game.Players:GetPlayers()) do
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
						"Hingoi"
					}, player.Name) then
						Hop()
					end
				end
			end
		end)
	end
end)
t16.Settings:AddToggle({
	Name = "No Clip",
	Default = false,
	Callback = function(p181)
		getgenv().NoClip = p181
	end
})
spawn(function()
	pcall(function()
		game:GetService("RunService").Stepped:Connect(function()
			if getgenv().NoClip then
				for _, descendant in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
					if descendant:IsA("BasePart") or descendant:IsA("Part") then
						descendant.CanCollide = false
					end
				end
			end
		end)
	end)
end)
t16.Esp:AddSection("Stats Upgrade")
StatusSelect = t16.Esp:AddSlider({
	Name = "Stats Value",
	Description = "",
	Default = 10,
	Min = 0,
	Max = 1000,
	Rounding = 1,
	Callback = function(p182)
		pSats = p182
	end
})
StatsUpg = t16.Esp:AddToggle({
	Name = "Auto Melee",
	Description = "",
	Default = false,
	Callback = function(p183)
		_G.Auto_Melee = p183
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.Auto_Melee then
				statsSetings("Melee", pSats)
			end
		end)
	end
end)
StatsUpg = t16.Esp:AddToggle({
	Name = "Auto Swords",
	Description = "",
	Default = false,
	Callback = function(p184)
		_G.Auto_Sword = p184
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.Auto_Sword then
				statsSetings("Sword", pSats)
			end
		end)
	end
end)
StatsUpg = t16.Esp:AddToggle({
	Name = "Auto Gun",
	Description = "",
	Default = false,
	Callback = function(p185)
		_G.Auto_Gun = p185
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.Auto_Gun then
				statsSetings("Gun", pSats)
			end
		end)
	end
end)
StatsUpg = t16.Esp:AddToggle({
	Name = "Auto Blox Fruit",
	Description = "",
	Default = false,
	Callback = function(p186)
		_G.Auto_DevilFruit = p186
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.Auto_DevilFruit then
				statsSetings("Devil", pSats)
			end
		end)
	end
end)
StatsUpg = t16.Esp:AddToggle({
	Name = "Auto Defense",
	Description = "",
	Default = false,
	Callback = function(p187)
		_G.Auto_Defense = p187
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.Auto_Defense then
				statsSetings("Defense", pSats)
			end
		end)
	end
end)
t16.Fish:AddSection("Fishing")
t16.Fish:AddDropdown({
	Name = "Select Fishing Rod",
	Description = "",
	Options = {
		"Fishing Rod",
		"Gold Rod",
		"Shark Rod",
		"Shell Rod",
		"Treasure Rod"
	},
	Default = "Fishing Rod",
	Callback = function(p188)
		_G.SelectedRod = p188
	end
})
BaitDropdown = t16.Fish:AddDropdown({
	Name = "Select Bait",
	Description = "",
	Options = {
		"Basic Bait",
		"Kelp Bait",
		"Good Bait",
		"Abyssal Bait",
		"Frozen Bait",
		"Epic Bait",
		"Carnivore Bait"
	},
	Default = "Basic Bait",
	Callback = function(p189)
		_G.SelectedBait = p189

		if _G.AutoBuyBait then
			pcall(function()
				t8.RFCraft:InvokeServer("Craft", _G.SelectedBait, {})
			end)
		end
	end
})
BuyBaitToggle = t16.Fish:AddToggle({
	Name = "Auto Buy Bait",
	Description = "",
	Default = false,
	Callback = function(p190)
		_G.AutoBuyBait = p190

		if p190 then
			pcall(function()
				t8.RFCraft:InvokeServer("Craft", _G.SelectedBait, {})
			end)
		end
	end
})
task.spawn(function()
	while task.wait(2) do
		if _G.AutoBuyBait and _G.SelectedBait then
			pcall(function()
				t8.RFCraft:InvokeServer("Craft", _G.SelectedBait, {})
			end)
		end
	end
end)
FishingToggle = t16.Fish:AddToggle({
	Name = "Auto Fishing",
	Description = "",
	Default = false,
	Callback = function(p191)
		_G.AutoFishing = p191
	end
})

local Players = game:GetService("Players")
local LocalPlayer2 = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
local FishReplicated = ReplicatedStorage2:WaitForChild("FishReplicated")
local FishingRequest = FishReplicated:WaitForChild("FishingRequest")
local Config = require(FishReplicated.FishingClient.Config)
local GetWaterHeightAtLocation = require(ReplicatedStorage2.Util.GetWaterHeightAtLocation)
local MaxLaunchDistance = Config.Rod.MaxLaunchDistance

task.spawn(function()
	while task.wait(0.5) do
		if _G.AutoFishing then
			pcall(function()
				local Character = LocalPlayer2.Character or LocalPlayer2.CharacterAdded:Wait()
				local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

				if not HumanoidRootPart then
					return
				end

				local Tool = Character:FindFirstChildOfClass("Tool")

				if _G.SelectedRod and (not Tool or Tool.Name ~= _G.SelectedRod) then
					local _GSelectedRod = LocalPlayer2.Backpack:FindFirstChild(_G.SelectedRod)

					if _GSelectedRod then
						Character.Humanoid:EquipTool(_GSelectedRod)
						Tool = _GSelectedRod
					end
				end

				if Tool then
					local v677 = GetWaterHeightAtLocation(HumanoidRootPart.Position)
					local _, v679 = Workspace:FindPartOnRayWithIgnoreList(Ray.new(Character.Head.Position, HumanoidRootPart.CFrame.LookVector * MaxLaunchDistance), {
						Character,
						Workspace.Characters,
						Workspace.Enemies
					})
					local vector3 = v679 and Vector3.new(v679.X, math.max(v679.Y, v677), v679.Z)
					local attribute = Tool:GetAttribute("State")
					local attribute2 = Tool:GetAttribute("ServerState")

					if vector3 and (attribute == "ReeledIn" or attribute2 == "ReeledIn") then
						FishingRequest:InvokeServer("StartCasting")
						task.wait()
						FishingRequest:InvokeServer("CastLineAtLocation", vector3, 100, true)
					elseif attribute2 == "Biting" then
						FishingRequest:InvokeServer("Catching", true)
						task.wait(0.1)
						FishingRequest:InvokeServer("Catch", 1)
					end
				end
			end)
		end
	end
end)
FishingQ = t16.Fish:AddToggle({
	Name = "Auto Quest Fishing",
	Description = "",
	Default = false,
	Callback = function(p192)
		_G.AutoFishingQuest = p192
	end
})

local LocalPlayer3 = game:GetService("Players").LocalPlayer
local RFJobsRemoteFunction = game:GetService("ReplicatedStorage").Modules.Net:WaitForChild("RF/JobsRemoteFunction")

local function v685()
	local Quest = LocalPlayer3.PlayerGui:FindFirstChild("Quest")

	Quest = Quest or LocalPlayer3.PlayerGui:FindFirstChild("QuestGui")

	if Quest and Quest:FindFirstChild("Container") then
		if Quest.Container:FindFirstChild("QuestTitle") then
			return true
		end
	end

	return false
end

task.spawn(function()
	while task.wait(1) do
		if _G.AutoFishingQuest then
			pcall(function()
				if not v685() then
					RFJobsRemoteFunction:InvokeServer("FishingNPC", "Angler", "AskQuest")
				end
			end)
		end
	end
end)
QuestToggle = t16.Fish:AddToggle({
	Name = "Auto Complete Quest",
	Description = "",
	Default = false,
	Callback = function(p193)
		_G.AutoQuestComplete = p193

		if p193 then
			pcall(function()
				t8.RFJobsRemoteFunction:InvokeServer("FishingNPC", "FinishQuest")
			end)
		end
	end
})
task.spawn(function()
	while task.wait(5) do
		if _G.AutoQuestComplete then
			pcall(function()
				t8.RFJobsRemoteFunction:InvokeServer("FishingNPC", "FinishQuest")
			end)
		end
	end
end)
SellFishToggle = t16.Fish:AddToggle({
	Name = "Auto Sell Fish",
	Description = "",
	Default = false,
	Callback = function(p194)
		_G.AutoSellFish = p194

		if p194 then
			pcall(function()
				t8.RFJobsRemoteFunction:InvokeServer("FishingNPC", "SellFish")
			end)
		end
	end
})
task.spawn(function()
	while task.wait(5) do
		if _G.AutoSellFish then
			pcall(function()
				t8.RFJobsRemoteFunction:InvokeServer("FishingNPC", "SellFish")
			end)
		end
	end
end)
SpamSkillZ = t16.Fish:AddToggle({
	Name = "Auto Spam Skill Z",
	Description = "",
	Default = false,
	Callback = function(p195)
		_G.AutoSkillZ = p195
	end
})

local RFJobToolAbilities = game:GetService("ReplicatedStorage").Modules.Net:WaitForChild("RF/JobToolAbilities")

task.spawn(function()
	while task.wait(0.5) do
		if _G.AutoSkillZ then
			pcall(function()
				RFJobToolAbilities:InvokeServer("Z", true)
			end)
		end
	end
end)
TravelDress = t16.Quests:AddToggle({
	Name = "Auto Quest Sea 2",
	Description = "",
	Default = false,
	Callback = function(p196)
		_G.TravelDres = p196
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.TravelDres and plr.Data.Level.Value >= 700 then
				if workspace.Map.Ice.Door.CanCollide == true and workspace.Map.Ice.Door.Transparency == 0 then
					replicated.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
					EquipWeapon("Key")

					while true do
						wait()
						_tp(CFrame.new(1347.7124, 37.3751602, -1325.6488))

						if _G.TravelDres then
							if Root.Position == CFrame.new(1347.7124, 37.3751602, -1325.6488).Position then
								break
							end
						else
							break
						end
					end
				elseif workspace.Map.Ice.Door.CanCollide == false and workspace.Map.Ice.Door.Transparency == 1 then
					if Enemies:FindFirstChild("Ice Admiral") then
						for _, child in pairs(Enemies:GetChildren()) do
							if child.Name == "Ice Admiral" and t9.Alive(child) then
								while true do
									task.wait()
									t9.Kill(child, _G.TravelDres)

									if _G.TravelDres == false then
										break
									elseif child.Humanoid.Health <= 0 then
										break
									end
								end

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
Zou = t16.Quests:AddToggle({
	Name = "Auto Quest Sea 3",
	Description = "",
	Default = false,
	Callback = function(p197)
		_G.AutoZou = p197
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.AutoZou and plr.Data.Level.Value >= 1500 then
				if replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 3 then
					if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess ~= nil then
						replicated.Remotes.CommF_:InvokeServer("F_", "TravelZou")

						if replicated.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 0 then
							local ripIndra = GetConnectionEnemies("rip_indra")

							if ripIndra then
								while true do
									wait()
									t9.Kill(ripIndra, _G.AutoZou)

									if _G.AutoZou then
										if not ripIndra.Parent or ripIndra.Humanoid.Health <= 0 then
											break
										end
									else
										break
									end
								end

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
							local v691 = GetConnectionEnemies("Don Swan")

							if v691 then
								while true do
									wait()
									t9.Kill(v691, _G.AutoZou)

									if _G.AutoZou then
										if not v691.Parent or v691.Humanoid.Health <= 0 then
											break
										end
									else
										break
									end
								end
							else
								while true do
									wait()
									_tp(CFrame.new(2288.802, 15.1870775, 863.034607))

									if _G.AutoZou then
										if Root.Position == CFrame.new(2288.802, 15.1870775, 863.034607).Position then
											break
										end
									else
										break
									end
								end

								if Root.CFrame == CFrame.new(2288.802, 15.1870775, 863.034607) then
									notween(CFrame.new(2288.802, 15.1870775, 863.034607))
								end
							end
						end
					elseif replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
						TabelDevilFruitStore = {}
						TabelDevilFruitOpen = {}

						for _, v in pairs(replicated.Remotes.CommF_:InvokeServer("getInventoryFruits")) do
							for k, v2 in pairs(v) do
								if k == "Name" then
									table.insert(TabelDevilFruitStore, v2)
								end
							end
						end

						local next_ = next
						local response, v698 = game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits")

						for _, v in next_, response, v698 do
							if v.Price >= 1000000 then
								table.insert(TabelDevilFruitOpen, v.Name)
							end
						end

						for _, v in pairs(TabelDevilFruitOpen) do
							for _, v2 in pairs(TabelDevilFruitStore) do
								if v == v2 then
									if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
										if plr.Backpack:FindFirstChild(v2) then
											replicated.Remotes.CommF_:InvokeServer("F_", "TalkTrevor", "1")
											replicated.Remotes.CommF_:InvokeServer("F_", "TalkTrevor", "2")
											replicated.Remotes.CommF_:InvokeServer("F_", "TalkTrevor", "3")
										else
											replicated.Remotes.CommF_:InvokeServer("F_", "LoadFruit", v2)
										end
									end
								end
							end
						end

						replicated.Remotes.CommF_:InvokeServer("F_", "TalkTrevor", "1")
						replicated.Remotes.CommF_:InvokeServer("F_", "TalkTrevor", "2")
						replicated.Remotes.CommF_:InvokeServer("F_", "TalkTrevor", "3")
					end
				elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 0 then
					if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and plr.PlayerGui.Main.Quest.Visible == true then
						local v705 = GetConnectionEnemies("Swan Pirate")

						if v705 then
							pcall(function()
								while true do
									wait()
									t9.Kill(v705, _G.AutoZou)

									if v705.Parent and not (v705.Humanoid.Health <= 0) then
										if _G.AutoZou == false or plr.PlayerGui.Main.Quest.Visible == false then
											break
										end
									else
										break
									end
								end
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
						while true do
							wait()
							t9.Kill(Jeremy, _G.AutoZou)

							if Jeremy.Parent then
								if Jeremy.Humanoid.Health <= 0 or _G.AutoZou == false then
									break
								end
							else
								break
							end
						end
					else
						_tp(CFrame.new(2099.88159, 448.931, 648.997375))
					end
				elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 2 then
					while true do
						wait()
						_tp(CFrame.new(-1836, 11, 1714))

						if _G.AutoZou then
							if Root.Position == CFrame.new(-1836, 11, 1714).Position then
								break
							end
						else
							break
						end
					end

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
t16.Quests:AddSection("Tushita + Yama")
Q = t16.Quests:AddToggle({
	Name = "Auto Tushita Sword",
	Description = "",
	Default = false,
	Callback = function(p198)
		_G.Auto_Tushita = p198
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.Auto_Tushita then
				if workspace.Map.Turtle:FindFirstChild("TushitaGate") then
					if GetBP("Holy Torch") then
						EquipWeapon("Holy Torch")
						task.wait(1)

						while true do
							task.wait()
							_tp(CFrame.new(-10752, 417, -9366))

							if _G.Auto_Tushita then
								if (CFrame.new(-10752, 417, -9366).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
									break
								end
							else
								break
							end
						end

						wait(0.7)

						while true do
							task.wait()
							_tp(CFrame.new(-11672, 334, -9474))

							if _G.Auto_Tushita then
								if (CFrame.new(-11672, 334, -9474).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
									break
								end
							else
								break
							end
						end

						wait(0.7)

						while true do
							task.wait()
							_tp(CFrame.new(-12132, 521, -10655))

							if _G.Auto_Tushita then
								if (CFrame.new(-12132, 521, -10655).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
									break
								end
							else
								break
							end
						end

						wait(0.7)

						while true do
							task.wait()
							_tp(CFrame.new(-13336, 486, -6985))

							if _G.Auto_Tushita then
								if (CFrame.new(-13336, 486, -6985).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
									break
								end
							else
								break
							end
						end

						wait(0.7)

						while true do
							task.wait()
							_tp(CFrame.new(-13489, 332, -7925))

							if _G.Auto_Tushita then
								if (CFrame.new(-13489, 332, -7925).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
									break
								end
							else
								break
							end
						end
					else
						_tp(CFrame.new(5148.03613, 162.352493, 910.548218))
						wait(0.7)
					end
				else
					local Longma = GetConnectionEnemies("Longma")

					if Longma then
						while true do
							task.wait()
							t9.Kill(Longma, _G.Auto_Tushita)

							if Longma.Humanoid.Health <= 0 then
								break
							elseif not _G.Auto_Tushita or not Longma.Parent then
								break
							end
						end
					elseif replicated:FindFirstChild("Longma") then
						_tp(replicated:FindFirstChild("Longma").HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
					end
				end
			end
		end)
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Yama Sword",
	Description = "",
	Default = false,
	Callback = function(p199)
		_G.Auto_Yama = p199
	end
})
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
							while true do
								wait()
								t9.Kill(Ghost, _G.Auto_Yama)

								if Ghost.Humanoid.Health <= 0 then
									break
								elseif not Ghost.Parent or not _G.Auto_Yama then
									break
								end
							end

							fireclickdetector(workspace.Map.Waterfall.SealedKatana.Handle.ClickDetector)
						end
					end
				end
			end
		end)
	end
end)
t16.Quests:AddSection("Skull Guitars / Misc")

local v709 = t16.Quests:AddParagraph("Skull Guitar Quests", "")

spawn(function()
	while wait(0.2) do
		pcall(function()
			if Quest1 == true then
				v709:SetDesc("Quest Number : Quest1")
			elseif Quest2 == true then
				v709:SetDesc("Quest Number : Quest2")
			elseif Quest3 == true then
				v709:SetDesc("Quest Number : Quest3")
			elseif Quest4 == true then
				v709:SetDesc("Quest Number : Quest4")
			elseif GetWP("Skull Guitar") then
				v709:SetDesc("Quest Number : Collect!!")
			else
				v709:SetDesc("Quest Number : No Quest!!")
			end
		end)
	end
end)
t16.Quests:AddToggle({
	Name = "Auto Skull Guitar",
	Description = "",
	Default = false,
	Callback = function(p200)
		_G.Auto_Soul_Guitar = p200
	end
})
task.spawn(function()
	while wait() do
		if _G.Auto_Soul_Guitar then
			pcall(function()
				local v710 = GetConnectionEnemies("Living Zombie")

				if v710 then
					v710.HumanoidRootPart.CFrame = CFrame.new(-10138.3974609375, 138.6524658203125, 5902.89208984375)
					v710.Head.CanCollide = false
					v710.Humanoid.Sit = false
					v710.HumanoidRootPart.CanCollide = false
					v710.Humanoid.JumpPower = 0
					v710.Humanoid.WalkSpeed = 0

					if v710.Humanoid:FindFirstChild("Animator") then
						v710.Humanoid:FindFirstChild("Animator"):Destroy()
					end
				end
			end)
		end
	end
end)
getT = function(p201)
	local Rotation

	if p201 == 1 then
		Rotation = workspace.Map["Haunted Castle"].Tablet.Segment1.Line.Rotation
	elseif p201 == 3 then
		Rotation = workspace.Map["Haunted Castle"].Tablet.Segment3.Line.Rotation
	elseif p201 == 4 then
		Rotation = workspace.Map["Haunted Castle"].Tablet.Segment4.Line.Rotation
	elseif p201 == 7 then
		Rotation = workspace.Map["Haunted Castle"].Tablet.Segment7.Line.Rotation
	elseif p201 == 10 then
		Rotation = workspace.Map["Haunted Castle"].Tablet.Segment10.Line.Rotation
	end

	if Rotation then
		return Rotation.Z
	end
end
getRT = function(p202)
	local Rotation

	for _, child in pairs(workspace.Map["Haunted Castle"].Trophies.Quest:GetChildren()) do
		if p202 == 1 and child.Name == "Trophy1" and child:FindFirstChild("Handle") then
			Rotation = child.Handle.Rotation
		elseif p202 == 2 and child.Name == "Trophy2" and child:FindFirstChild("Handle") then
			Rotation = child.Handle.Rotation
		elseif p202 == 3 and child.Name == "Trophy3" and child:FindFirstChild("Handle") then
			Rotation = child.Handle.Rotation
		elseif p202 == 4 and child.Name == "Trophy4" and child:FindFirstChild("Handle") then
			Rotation = child.Handle.Rotation
		elseif p202 == 5 and child.Name == "Trophy5" and child:FindFirstChild("Handle") then
			Rotation = child.Handle.Rotation
		end

		if Rotation then
			return Rotation.Z
		end
	end
end
GetFirePlacard = function(p203, p204)
	if tostring(workspace.Map["Haunted Castle"]["Placard" .. p203][p204].Indicator.BrickColor) ~= "Pearl" then
		fireclickdetector(workspace.Map["Haunted Castle"]["Placard" .. p203][p204].ClickDetector)
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
					_tp(CFrame.new(-8655.0166015625, 141.31669616699219, 6160.0224609375))
					replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2)
					replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
				elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check").Swamp == false then
					Quest1 = true
					Quest2 = false
					Quest3 = false
					Quest4 = false

					local v715 = GetConnectionEnemies("Living Zombie")

					if v715 then
						while true do
							task.wait()
							t9.Kill(v715, _G.Auto_Soul_Guitar)

							if _G.Auto_Soul_Guitar then
								if v715.Humanoid.Health <= 0 or not v715.Parent or workspace.Map["Haunted Castle"].SwampWater.Color ~= Color3.fromRGB(117, 0, 0) then
									break
								end
							else
								break
							end
						end
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
					_tp(CFrame.new(-9532.8232421875, 6.4716677665710449, 6078.068359375))

					local v716, v717

					repeat
						wait()
						v717 = getRT(1)
						v716 = getT(1)

						if v717 and v716 then
							fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment1:FindFirstChild("ClickDetector"))
						end
					until v717 == v716

					local v718, v719

					repeat
						wait()
						v719 = getRT(2)
						v718 = getT(3)

						if v719 and v718 then
							fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment3:FindFirstChild("ClickDetector"))
						end
					until v719 == v718

					local v720, v721

					repeat
						wait()
						v721 = getRT(3)
						v720 = getT(4)

						if v721 and v720 then
							fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment4:FindFirstChild("ClickDetector"))
						end
					until v721 == v720

					local v722, v723

					repeat
						wait()
						v723 = getRT(4)
						v722 = getT(7)

						if v723 and v722 then
							fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment7:FindFirstChild("ClickDetector"))
						end
					until v723 == v722

					local v724, v725

					repeat
						wait()
						v725 = getRT(5)
						v724 = getT(10)

						if v725 and v724 then
							fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment10:FindFirstChild("ClickDetector"))
						end
					until v725 == v724

					while true do
						wait()
						fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment2:FindFirstChild("ClickDetector"))
						fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment5:FindFirstChild("ClickDetector"))
						fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment6:FindFirstChild("ClickDetector"))
						fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment8:FindFirstChild("ClickDetector"))
						fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment9:FindFirstChild("ClickDetector"))

						if workspace.Map["Haunted Castle"].Tablet.Segment2.Line.Rotation.Z == 0 then
							break
						elseif workspace.Map["Haunted Castle"].Tablet.Segment5.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment6.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment8.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment9.Line.Rotation.Z == 0 then
							break
						end
					end
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
t16.Quests:AddToggle({
	Name = "Auto Farm Material Skull Guitar",
	Description = "",
	Default = false,
	Callback = function(p205)
		_G.AutoMatSoul = p205
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.AutoMatSoul then
				if GetWP("Skull Guitar") == false then
					if GetM("Bones") >= 500 and GetM("Ectoplasm") >= 250 and GetM("Dark Fragment") >= 1 then
						replicated.Remotes.CommF_:InvokeServer("soulGuitarBuy", true)
					elseif GetM("Ectoplasm") <= 250 then
						if _G.AutoMatSoul and World2 then
							local v726 = GetConnectionEnemies({
								"Ship Deckhand",
								"Ship Engineer",
								"Ship Steward",
								"Ship Officer",
								"Arctic Warrior"
							})

							if v726 then
								while true do
									task.wait()
									t9.Kill(v726, _G.AutoMatSoul)

									if _G.AutoMatSoul then
										if not v726.Parent or v726.Humanoid.Health <= 0 then
											break
										end
									else
										break
									end
								end
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
								while true do
									task.wait()
									t9.Kill(Darkbeard, _G.AutoMatSoul)

									if _G.AutoMatSoul then
										break
									elseif Darkbeard.Humanoid.Health <= 0 then
										break
									end
								end
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
							local v728 = GetConnectionEnemies({
								"Reborn Skeleton",
								"Living Zombie",
								"Demonic Soul",
								"Posessed Mummy"
							})

							if v728 then
								while true do
									task.wait()
									t9.Kill(v728, _G.AutoMatSoul)

									if _G.AutoMatSoul then
										if v728.Humanoid.Health <= 0 or not v728.Parent or v728.Humanoid.Health <= 0 then
											break
										end
									else
										break
									end
								end
							else
								_tp(CFrame.new(-9504.8564453125, 172.14292907714844, 6057.259765625))
							end
						else
							replicated.Remotes.CommF_:InvokeServer("TravelZou")
						end
					end
				end
			end
		end)
	end
end)
t16.Quests:AddSection("Cursed Dual Katana")

local v729 = t16.Quests:AddParagraph("Number Cursed dual katana quests", "Quest Numbers :")

spawn(function()
	while wait(0.2) do
		if QuestYama_1 == true then
			v729:SetDesc("Quest Numbers : yama quest 1")
		elseif QuestYama_2 == true then
			v729:SetDesc("Quest Numbers : yama quest 2")
		elseif QuestYama_3 == true then
			v729:SetDesc("Quest Numbers : yama quest 3")
		elseif QuestTushita_1 == true then
			v729:SetDesc("Quest Numbers : tushita quest 1")
		elseif QuestTushita_2 == true then
			v729:SetDesc("Quest Numbers : tushita quest 2")
		elseif GetWP("Cursed Dual Katana") then
			v729:SetDesc("Quest Numbers : CDK done!!")
		end
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Get CDK [ Last Quest ]",
	Description = "",
	Default = false,
	Callback = function(p206)
		_G.CDK = p206
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.CDK then
				replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
				replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
				replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Boss")

				local v730 = GetConnectionEnemies("Cursed Skeleton Boss")

				if v730 then
					repeat
						wait()

						if plr.Character:FindFirstChild("Yama") then
							EquipWeapon("Yama")
							_tp(v730.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))

							if not _G.CDK or not v730.Parent or v730.Humanoid.Health <= 0 then
								break
							end
						end

						if plr.Backpack:FindFirstChild("Yama") then
							EquipWeapon("Yama")
						elseif plr.Character:FindFirstChild("Tushita") then
							EquipWeapon("Tushita")
							_tp(v730.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))

							if not _G.CDK or not v730.Parent or v730.Humanoid.Health <= 0 then
								break
							end
						elseif plr.Backpack:FindFirstChild("Tushita") then
							EquipWeapon("Tushita")
						end

						_tp(v730.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
					until not _G.CDK or not v730.Parent or v730.Humanoid.Health <= 0
				else
					_tp(CFrame.new(-12318.193359375, 601.95184326171875, -6538.662109375))
					wait(0.5)
					_tp(workspace.Map.Turtle.Cursed.BossDoor.CFrame)
				end
			end
		end)
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Yama CDK",
	Description = "",
	Default = false,
	Callback = function(p207)
		_G.CDK_YM = p207
	end
})
spawn(function()
	while wait() do
		pcall(function()
			if _G.CDK_YM then
				if tostring(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")) ~= "opened" then
					replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")
					replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor", true)
				elseif replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Finished == nil then
					replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
					replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
				elseif replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Finished == false then
					if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) == -3 then
						QuestYama_1 = true
						QuestYama_2 = false
						QuestYama_3 = false

						repeat
							task.wait()

							if not workspace.Enemies:FindFirstChild("Forest Pirate") then
								_tp(CFrame.new(-13223.521484375, 428.19381713867188, -7766.06787109375))
							elseif GetConnectionEnemies("Forest Pirate") then
								_tp(workspace.Enemies:FindFirstChild("Forest Pirate").HumanoidRootPart.CFrame)
							end
						until tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) == 1 or not _G.CDK_YM
					elseif tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) == -4 then
						QuestYama_1 = false
						QuestYama_2 = true
						QuestYama_3 = false

						for _, child in pairs(game:GetService("Players").LocalPlayer.QuestHaze:GetChildren()) do
							for k, v in pairs(t7) do
								if string.find(k, child.Name) and child.Value > 0 then
									if (v.Position - Root.Position).Magnitude <= 1000 then
										if workspace.Enemies:FindFirstChild(k) then
											for _, child2 in pairs(workspace.Enemies:GetChildren()) do
												if child2:FindFirstChild("HumanoidRootPart") and child2:FindFirstChild("Humanoid") and child2:FindFirstChild("Humanoid").Health > 0 and child2:FindFirstChild("HazeESP") then
													while true do
														wait()
														t9.Kill(child2, _G.CDK_YM)

														if not _G.CDK_YM then
															break
														end

														if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) ~= 2 then
															if child2:FindFirstChild("HazeESP") and not (child2.Humanoid.Health <= 0) then
																continue
															end
														end

														break
													end
												end
											end

											continue
										end
									end

									_tp(v)
								end
							end
						end
					elseif tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) == -5 then
						QuestYama_1 = false
						QuestYama_2 = false
						QuestYama_3 = true

						if workspace.Map:FindFirstChild("HellDimension") and (Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 1000 then
							for k in pairs(workspace.Map.HellDimension.Exit:GetChildren()) do
								if tonumber(k) == 2 then
									while true do
										task.wait()
										Root.CFrame = workspace.Map.HellDimension.Exit.CFrame

										if _G.CDK_YM then
											if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) == 3 then
												break
											end
										else
											break
										end
									end
								end
							end

							EquipWeapon(_G.SelectWeapon)

							if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) ~= 3 then
								while true do
									task.wait()

									repeat
										task.wait()
										_tp(workspace.Map.HellDimension.Torch1.Particles.CFrame)

										for _, descendant in pairs(workspace.Map.HellDimension:GetDescendants()) do
											if descendant:IsA("ProximityPrompt") then
												fireproximityprompt(descendant)
											end
										end
									until (workspace.Map.HellDimension.Torch1.Particles.Position - Root.Position).Magnitude < 5

									wait(2)
									_G.T1Yama = true

									if _G.CDK_YM and not _G.T1Yama then
										if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) ~= 3 then
											continue
										end
									end

									break
								end

								while true do
									task.wait()

									repeat
										task.wait()
										_tp(workspace.Map.HellDimension.Torch2.Particles.CFrame)

										for _, descendant in pairs(workspace.Map.HellDimension:GetDescendants()) do
											if descendant:IsA("ProximityPrompt") then
												fireproximityprompt(descendant)
											end
										end
									until (workspace.Map.HellDimension.Torch2.Particles.Position - Root.Position).Magnitude < 5

									wait(2)
									_G.T2Yama = true

									if not _G.T2Yama and _G.CDK_YM ~= false then
										if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) ~= 3 then
											continue
										end
									end

									break
								end

								while true do
									wait()

									repeat
										task.wait()
										_tp(workspace.Map.HellDimension.Torch3.Particles.CFrame)

										for _, descendant in pairs(workspace.Map.HellDimension:GetDescendants()) do
											if descendant:IsA("ProximityPrompt") then
												fireproximityprompt(descendant)
											end
										end
									until (workspace.Map.HellDimension.Torch3.Particles.Position - Root.Position).Magnitude < 5

									wait(2)
									_G.T3Yama = true

									if not _G.T3Yama and _G.CDK_YM ~= false then
										if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) ~= 3 then
											continue
										end
									end

									break
								end
							end

							for _, child in pairs(workspace.Enemies:GetChildren()) do
								if (child:FindFirstChild("HumanoidRootPart").Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 300 and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child:FindFirstChild("Humanoid").Health > 0 then
									while true do
										task.wait()
										t9.Kill(child, _G.CDK_YM)

										if _G.CDK_YM and not (child.Humanoid.Health <= 0) and child.Parent then
											if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) == 3 then
												break
											end
										else
											break
										end
									end
								end
							end
						end
					end
				end
			end
		end)
	end
end)
spawn(function()
	while wait() do
		pcall(function()
			if _G.CDK_YM then
				if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) == -5 then
					if not workspace.Map:FindFirstChild("HellDimension") or (Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude > 1000 then
						local v746 = GetConnectionEnemies("Soul Reaper")

						if v746 then
							while true do
								task.wait()
								_tp(v746.HumanoidRootPart.CFrame)

								if not (v746.Humanoid.Health <= 0) and _G.CDK_YM and v746.Parent then
									if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) ~= 3 then
										if not workspace.Map:FindFirstChild("HellDimension") or not ((Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 1000) then
											continue
										end
									end

									break
								end

								break
							end
						else
							if plr.Backpack:FindFirstChild("Hallow Essence") then
								repeat
									_tp(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
									task.wait()
								until (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - Root.Position).Magnitude <= 8

								EquipWeapon("Hallow Essence")

								return
							end

							if plr.Character:FindFirstChild("Hallow Essence") then
								repeat
									_tp(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
									task.wait()
								until (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - Root.Position).Magnitude <= 8

								EquipWeapon("Hallow Essence")
							else
								local ok4 = not replicated:FindFirstChild("Soul Reaper")

								if not ok4 then
									ok4 = not (replicated:FindFirstChild("Soul Reaper").Humanoid.Health > 0)
								end

								if ok4 then
									if not (replicated.Remotes.CommF_:InvokeServer("Bones", "Check") < 50) then
										replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)

										return
									end

									if workspace.Enemies:FindFirstChild("Soul Reaper") then
										replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)

										return
									end

									if replicated:FindFirstChild("Soul Reaper") then
										replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)

										return
									end

									if workspace.Map:FindFirstChild("HellDimension") then
										replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
									else
										local ok = workspace.Enemies:FindFirstChild("Reborn Skeleton")

										if not ok then
											ok = workspace.Enemies:FindFirstChild("Living Zombie")
										end

										local ok2 = ok

										if not ok2 then
											ok2 = workspace.Enemies:FindFirstChild("Domenic Soul")
										end

										local ok3 = ok2

										if not ok3 then
											ok3 = not not workspace.Enemies:FindFirstChild("Posessed Mummy")
										end

										if ok3 then
											for _, child in pairs(workspace.Enemies:GetChildren()) do
												if (child.Name == "Reborn Skeleton" or child.Name == "Living Zombie" or child.Name == "Demonic Soul" or child.Name == "Posessed Mummy") and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child:FindFirstChild("Humanoid").Health > 0 then
													while true do
														task.wait()
														t9.Kill(child, _G.CDK_YM)

														if _G.CDK_YM then
															if child.Humanoid.Health <= 0 then
																break
															end

															if not child.Parent then
																break
															end

															continue
														end

														break
													end
												end
											end
										else
											_tp(CFrame.new(-9515.2255859375, 164.0062255859375, 5785.38330078125))
										end
									end
								else
									_tp(replicated:FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame)
								end
							end
						end
					end
				end
			end
		end)
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Tushita CDK",
	Description = "",
	Default = false,
	Callback = function(p208)
		_G.CDK_TS = p208
	end
})
spawn(function()
	while wait() do
		pcall(function()
			if _G.CDK_TS then
				if tostring(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")) ~= "opened" then
					wait(0.7)
					replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")
					wait(0.3)
					replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor", true)
				elseif replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Finished == nil then
					replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
				elseif replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Finished == false then
					if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Good) == -3 then
						QuestTushita_1 = true
						QuestTushita_2 = false
						QuestTushita_3 = false

						while true do
							wait()
							_tp(CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875))

							if not ((CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) and _G.CDK_TS then
								if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Good) == 1 then
									break
								end
							else
								break
							end
						end

						if (CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
							wait(0.7)
							replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"), "Check")
							wait(0.5)
							replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
						end

						wait(1)

						while true do
							wait()
							_tp(CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125))

							if not ((CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) and _G.CDK_TS then
								if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Good) == 1 then
									break
								end
							else
								break
							end
						end

						if (CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
							wait(0.7)
							replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"), "Check")
							wait(0.5)
							replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
						end

						wait(1)

						while true do
							wait()
							_tp(CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625))

							if not ((CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) and _G.CDK_TS then
								if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Good) == 1 then
									break
								end
							else
								break
							end
						end

						if (CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
							wait(0.7)
							replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"), "Check")
							wait(0.5)
							replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
						end

						wait(1)
					elseif tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Good) == -4 then
						QuestTushita_1 = false
						QuestTushita_2 = true
						QuestTushita_3 = false

						while true do
							wait()
							_G.AutoRaidCastle = true

							if _G.CDK_TS then
								if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Good) == 2 then
									break
								end
							else
								break
							end
						end

						_G.AutoRaidCastle = false
					elseif tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Good) == -5 then
						QuestTushita_1 = false
						QuestTushita_2 = false
						QuestTushita_3 = true

						if workspace.Enemies:FindFirstChild("Cake Queen") then
							for _, child in pairs(workspace.Enemies:GetChildren()) do
								if child.Name == "Cake Queen" and child:FindFirstChild("Humanoid") and child:FindFirstChild("HumanoidRootPart") and child.Humanoid.Health > 0 then
									while true do
										wait()
										t9.Kill(child, _G.CDK_TS)

										if _G.CDK_TS and child.Parent and not (child.Humanoid.Health <= 0) then
											if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Good) == 3 then
												break
											end
										else
											break
										end
									end
								end
							end
						else
							local ok = not replicated:FindFirstChild("Cake Queen")

							if not ok then
								ok = not (replicated:FindFirstChild("Cake Queen").Humanoid.Health > 0)
							end

							if ok then
								if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - workspace.Map.HeavenlyDimension.Spawn.Position).Magnitude <= 1000 then
									for k in pairs(workspace.Map.HeavenlyDimension.Exit:GetChildren()) do
										Ex = k
									end

									if Ex == 2 then
										while true do
											wait()
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.HeavenlyDimension.Exit.CFrame

											if _G.CDK_TS then
												if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Good) == 3 then
													break
												end
											else
												break
											end
										end
									end

									repeat
										wait()

										repeat
											wait()
											_tp(CFrame.new(-22529.6171875, 5275.77392578125, 3873.5712890625))

											for _, descendant in pairs(workspace.Map.HeavenlyDimension:GetDescendants()) do
												if descendant:IsA("ProximityPrompt") then
													fireproximityprompt(descendant)
												end
											end
										until (CFrame.new(-22529.6171875, 5275.77392578125, 3873.5712890625).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5

										wait(2)
										_G.DoneT1 = true
									until not _G.CDK_TS or _G.DoneT1

									repeat
										wait()

										repeat
											wait()
											_tp(CFrame.new(-22637.291015625, 5281.365234375, 3749.28857421875))

											for _, descendant in pairs(workspace.Map.HeavenlyDimension:GetDescendants()) do
												if descendant:IsA("ProximityPrompt") then
													fireproximityprompt(descendant)
												end
											end
										until (CFrame.new(-22637.291015625, 5281.365234375, 3749.28857421875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5

										wait(2)
										_G.DoneT2 = true
									until _G.DoneT2 or _G.CDK_TS == false

									repeat
										wait()

										repeat
											task.wait()
											_tp(CFrame.new(-22791.14453125, 5277.16552734375, 3764.570068359375))

											for _, descendant in pairs(workspace.Map.HeavenlyDimension:GetDescendants()) do
												if descendant:IsA("ProximityPrompt") then
													fireproximityprompt(descendant)
												end
											end
										until (CFrame.new(-22791.14453125, 5277.16552734375, 3764.570068359375).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5

										wait(2)
										_G.DoneT3 = true
									until _G.DoneT3 or _G.CDK_TS == false

									for _, child in pairs(workspace.Enemies:GetChildren()) do
										if (child:FindFirstChild("HumanoidRootPart").Position - CFrame.new(-22695.7012, 5270.93652, 3814.42847, 0.11794927, 3.32185834e-08, 0.99301964, -8.73070718e-08, 1, -2.30819008e-08, -0.99301964, -8.3975138e-08, 0.11794927).Position).Magnitude <= 300 and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child:FindFirstChild("Humanoid").Health > 0 then
											while true do
												wait()
												t9.Kill(child, _G.CDK_TS)

												if _G.CDK_TS then
													if child.Humanoid.Health <= 0 or not child.Parent then
														break
													end
												else
													break
												end
											end
										end
									end
								end
							else
								_tp(replicated:FindFirstChild("Cake Queen").HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
							end
						end
					end
				end
			end
		end)
	end
end)
t16.Quests:AddSection("True Triple Katana Sword")
t16.Quests:AddButton({
	Name = "Buy Legendary Sword",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
		replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
		replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3")
	end
})
t16.Quests:AddButton({
	Name = "Buy True Triple Katana Sword",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("MysteriousMan", "2")
	end
})
Q = t16.Quests:AddToggle({
	Name = "Tween to Legendary Sword Dealer",
	Description = "",
	Default = false,
	Callback = function(p209)
		_G.Tp_LgS = p209
	end
})
spawn(function()
	while wait(Sec) do
		if _G.Tp_LgS then
			pcall(function()
				for _, child in pairs(replicated.NPCs:GetChildren()) do
					if child.Name == "Legendary Sword Dealer " then
						_tp(child.HumanoidRootPart.CFrame)
					end
				end
			end)
		end
	end
end)
t16.Quests:AddSection("Pole / God Enal's")
Q = t16.Quests:AddToggle({
	Name = "Auto Pole V1",
	Description = "",
	Default = false,
	Callback = function(p210)
		_G.AutoPole = p210
	end
})
spawn(function()
	while wait(Sec) do
		if _G.AutoPole then
			pcall(function()
				local v767 = GetConnectionEnemies("Thunder God")

				if v767 then
					while true do
						task.wait()
						t9.Kill(v767, _G.AutoPole)

						if _G.AutoPole then
							if not v767.Parent or v767.Humanoid.Health <= 0 then
								break
							end
						else
							break
						end
					end
				else
					_tp(CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188))
				end
			end)
		end
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Pole V2 [Beta]",
	Description = "",
	Default = false,
	Callback = function(p211)
		_G.AutoPoleV2 = p211
	end
})
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

				local ok2 = not GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("Z")

				if not ok2 then
					ok2 = not GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("X")
				end

				local ok3 = ok2

				if not ok3 then
					ok3 = not GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("C")
				end

				local ok4 = ok3

				if not ok4 then
					ok4 = not GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("V")
				end

				local ok5 = ok4

				if not ok5 then
					ok5 = not GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("F")
				end

				if ok5 then
					local ok = replicated.Remotes.CommF_:InvokeServer("Awakener", "Check") == nil

					if not ok then
						ok = replicated.Remotes.CommF_:InvokeServer("Awakener", "Check") == 0
					end

					if ok then
						_G.SelectChip = "Rumble"

						local response = replicated.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)

						if response then
							response:Stop()
						end

						_G.Raiding = true
						_G.Auto_Awakener = true
					end
				else
					_G.SelectChip = nil
					_G.Raiding = false
					_G.Auto_Awakener = false

					if plr.Data.Fragments.Value >= 5000 then
						replicated.Remotes.CommF_:InvokeServer("Thunder God", "Talk")
						wait(Sec)
						replicated.Remotes.CommF_:InvokeServer("Thunder God", "Sure")
					end
				end
			end
		end)
	end
end)
t16.Quests:AddToggle({
	Name = "Auto Saw Sword",
	Description = "",
	Default = false,
	Callback = function(p212)
		_G.AutoSaw = p212
	end
})
spawn(function()
	while wait(0.2) do
		pcall(function()
			if _G.AutoSaw then
				local v774 = GetConnectionEnemies("The Saw")

				if v774 then
					while true do
						task.wait()
						t9.Kill(v774, _G.AutoSaw)

						if _G.AutoSaw == false then
							break
						elseif v774.Humanoid.Health <= 0 then
							break
						end
					end
				else
					_tp(CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906))
				end
			end
		end)
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Saber Sword",
	Description = "",
	Default = false,
	Callback = function(p213)
		_G.AutoSaber = p213
	end
})
spawn(function()
	while wait(0.2) do
		pcall(function()
			if _G.AutoSaber and plr.Data.Level.Value >= 200 then
				if not plr.Backpack:FindFirstChild("Saber") then
					if not plr.Character:FindFirstChild("Saber") then
						if workspace.Map.Jungle.Final.Part.Transparency ~= 0 then
							local ok2 = workspace.Enemies:FindFirstChild("Saber Expert")

							if not ok2 then
								ok2 = not not replicated:FindFirstChild("Saber Expert")
							end

							if ok2 then
								for _, child in pairs(workspace.Enemies:GetChildren()) do
									if child.Name == "Saber Expert" and t9.Alive(child) then
										while true do
											task.wait()
											t9.Kill(child, _G.AutoSaber)

											if child.Humanoid.Health <= 0 then
												break
											elseif _G.AutoSaber == false then
												break
											end
										end

										if child.Humanoid.Health <= 0 then
											replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic")
										end
									end
								end
							else
								_tp(CFrame.new(-1401.85046, 29.9773273, 8.81916237, 0.85820812, 8.76083845e-08, 0.513301849, -8.55007443e-08, 1, -2.77243419e-08, -0.513301849, -2.00944328e-08, 0.85820812))
							end
						elseif workspace.Map.Jungle.QuestPlates.Door.Transparency == 0 then
							if (CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 100 then
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
							else
								_tp(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279))
							end
						elseif workspace.Map.Desert.Burn.Part.Transparency == 0 then
							if plr.Backpack:FindFirstChild("Torch") then
								EquipWeapon("Torch")
								firetouchinterest(plr.Character.Torch.Handle, workspace.Map.Desert.Burn.Fire, 0)
								firetouchinterest(plr.Character.Torch.Handle, workspace.Map.Desert.Burn.Fire, 1)
								_tp(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-09, 0.761243105, -5.70652914e-10, 1, 1.20584542e-09, -0.761243105, 3.47544882e-10, -0.648466587))

								return
							elseif plr.Character:FindFirstChild("Torch") then
								EquipWeapon("Torch")
								firetouchinterest(plr.Character.Torch.Handle, workspace.Map.Desert.Burn.Fire, 0)
								firetouchinterest(plr.Character.Torch.Handle, workspace.Map.Desert.Burn.Fire, 1)
								_tp(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-09, 0.761243105, -5.70652914e-10, 1, 1.20584542e-09, -0.761243105, 3.47544882e-10, -0.648466587))
							else
								_tp(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 3.42372805e-05, -0.258850515, 0.965917408))
							end
						elseif replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan") ~= 0 then
							replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup")
							wait(0.5)
							EquipWeapon("Cup")
							wait(0.5)
							replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "FillCup", plr.Character.Cup)
							wait(Sec)
							replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan")
						elseif replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == nil then
							replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
						elseif replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 0 then
							local ok = workspace.Enemies:FindFirstChild("Mob Leader")

							if not ok then
								ok = not not replicated:FindFirstChild("Mob Leader")
							end

							if ok then
								_tp(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559))

								for _, child in pairs(workspace.Enemies:GetChildren()) do
									if child.Name == "Mob Leader" and t9.Alive(child) then
										while true do
											task.wait()
											t9.Kill(child, _G.AutoSaber)

											if child.Humanoid.Health <= 0 then
												break
											elseif _G.AutoSaber == false then
												break
											end
										end
									end
								end
							end
						elseif replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 1 then
							replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
							EquipWeapon("Relic")
							_tp(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-09, 0.481375456, 2.53851997e-08, 1, -5.79995607e-08, -0.481375456, 6.30572643e-08, 0.876514494))
						end
					end
				end
			end
		end)
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Cybrog",
	Description = "",
	Default = false,
	Callback = function(p214)
		_G.AutoColShad = p214
	end
})
spawn(function()
	while wait(0.2) do
		if _G.AutoColShad then
			pcall(function()
				local Cyborg = GetConnectionEnemies("Cyborg")

				if Cyborg then
					while true do
						task.wait()
						t9.Kill(Cyborg, _G.AutoColShad)

						if _G.AutoColShad == false then
							break
						elseif not Cyborg.Parent or Cyborg.Humanoid.Health <= 0 then
							break
						end
					end
				else
					_tp(CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813))
				end
			end)
		end
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Usoap's Hat",
	Description = "",
	Default = false,
	Callback = function(p215)
		_G.AutoGetUsoap = p215
	end
})
spawn(function()
	while task.wait(Sec) do
		pcall(function()
			if _G.AutoGetUsoap then
				for _, child in pairs(workspace.Characters:GetChildren()) do
					if child.Name ~= plr.Name and child.Humanoid.Health > 0 and child:FindFirstChild("HumanoidRootPart") and child.Parent and (Root.Position - child.HumanoidRootPart.Position).Magnitude <= 230 then
						while true do
							task.wait()
							EquipWeapon(_G.SelectWeapon)
							_tp(child.HumanoidRootPart.CFrame * CFrame.new(1, 1, 2))

							if _G.AutoGetUsoap == false then
								break
							elseif child.Humanoid.Health <= 0 or not child.Parent or not child:FindFirstChild("HumanoidRootPart") or not child:FindFirstChild("Humanoid") then
								break
							end
						end
					end
				end
			end
		end)
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Bisento V2",
	Description = "",
	Default = false,
	Callback = function(p216)
		_G.Greybeard = p216
	end
})
spawn(function()
	while wait(Sec) do
		if _G.Greybeard then
			pcall(function()
				if not GetWP("Bisento") then
					replicated.Remotes.CommF_:InvokeServer("BuyItem", "Bisento")
				elseif GetWP("Bisento") then
					replicated.Remotes.CommF_:InvokeServer("LoadItem", "Bisento")

					local Greybeard = GetConnectionEnemies("Greybeard")

					if Greybeard then
						while true do
							wait()
							t9.Kill(Greybeard, _G.Greybeard)

							if _G.Greybeard == false then
								break
							elseif not Greybeard.Parent or Greybeard.Humanoid.Health <= 0 then
								break
							end
						end
					else
						_tp(CFrame.new(-5023.38330078125, 28.652032852172852, 4332.3818359375))
					end
				end
			end)
		end
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Warden Sword",
	Description = "",
	Default = false,
	Callback = function(p217)
		_G.WardenBoss = p217
	end
})
spawn(function()
	while wait(0.1) do
		if _G.WardenBoss then
			pcall(function()
				local v785 = GetConnectionEnemies("Chief Warden")

				if v785 then
					while true do
						wait()
						t9.Kill(v785, _G.WardenBoss)

						if _G.WardenBoss == false then
							break
						elseif not v785.Parent or v785.Humanoid.Health <= 0 then
							break
						end
					end
				else
					_tp(CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749, 0.00191645394, 0.999998152, -2.80422337e-05, -0.939682961, 0.00181045406, 0.342041939))
				end
			end)
		end
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Marine Coat",
	Description = "",
	Default = false,
	Callback = function(p218)
		_G.MarinesCoat = p218
	end
})
spawn(function()
	while wait(0.1) do
		if _G.MarinesCoat then
			pcall(function()
				local v786 = GetConnectionEnemies("Vice Admiral")

				if v786 then
					while true do
						wait()
						t9.Kill(v786, _G.MarinesCoat)

						if _G.MarinesCoat == false then
							break
						elseif not v786.Parent or v786.Humanoid.Health <= 0 then
							break
						end
					end
				else
					_tp(CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375))
				end
			end)
		end
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Swan Coat",
	Description = "",
	Default = false,
	Callback = function(p219)
		_G.SwanCoat = p219
	end
})
spawn(function()
	while wait(0.1) do
		if _G.SwanCoat then
			pcall(function()
				local Swan = GetConnectionEnemies("Swan")

				if Swan then
					while true do
						wait()
						t9.Kill(Swan, _G.SwanCoat)

						if _G.SwanCoat == false then
							break
						elseif not Swan.Parent or Swan.Humanoid.Health <= 0 then
							break
						end
					end
				else
					_tp(CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812))
				end
			end)
		end
	end
end)
t16.Quests:AddSection("Rengoku Sword")
Q = t16.Quests:AddToggle({
	Name = "Auto Rengoku Sword",
	Description = "",
	Default = false,
	Callback = function(p220)
		_G.IceBossRen = p220
	end
})
spawn(function()
	pcall(function()
		while wait(0.1) do
			if _G.IceBossRen then
				local v788 = GetConnectionEnemies("Awakened Ice Admiral")

				if v788 then
					while true do
						task.wait()
						t9.Kill(v788, _G.IceBossRen)

						if _G.IceBossRen == false then
							break
						elseif not v788.Parent or v788.Humanoid.Health <= 0 then
							break
						end
					end
				else
					_tp(CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813))
				end
			end
		end
	end)
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Key Rengoku",
	Description = "",
	Default = false,
	Callback = function(p221)
		_G.KeysRen = p221
	end
})
spawn(function()
	while wait(0.1) do
		pcall(function()
			if _G.KeysRen then
				if plr.Backpack:FindFirstChild(t1[3]) then
					EquipWeapon(t1[3])
					wait(0.1)
					_tp(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))

					return
				end

				if plr.Character:FindFirstChild(t1[3]) then
					EquipWeapon(t1[3])
					wait(0.1)
					_tp(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
				else
					local v789 = GetConnectionEnemies(t1)

					if v789 then
						while true do
							task.wait()
							t9.Kill(v789, _G.KeysRen)

							if plr.Backpack:FindFirstChild(t1[3]) then
								break
							elseif _G.KeysRen == false or not v789.Parent or v789.Humanoid.Health <= 0 then
								break
							end
						end
					else
						_tp(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
					end
				end
			end
		end)
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Dragon Trident",
	Description = "",
	Default = false,
	Callback = function(p222)
		_G.AutoTridentW2 = p222
	end
})
spawn(function()
	while wait(0.1) do
		pcall(function()
			if _G.AutoTridentW2 then
				local v790 = GetConnectionEnemies("Tide Keeper")

				if v790 then
					while true do
						task.wait()
						t9.Kill(v790, _G.AutoTridentW2)

						if _G.AutoTridentW2 == false then
							break
						elseif not v790.Parent or v790.Humanoid.Health <= 0 then
							break
						end
					end
				else
					_tp(CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188))
				end
			end
		end)
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Long Sword",
	Description = "",
	Default = false,
	Callback = function(p223)
		_G.LongsWord = p223
	end
})
spawn(function()
	while wait(0.1) do
		pcall(function()
			if _G.LongsWord then
				local Diamond = GetConnectionEnemies("Diamond")

				if Diamond then
					while true do
						task.wait()
						t9.Kill(Diamond, _G.LongsWord)

						if _G.LongsWord == false then
							break
						elseif not Diamond.Parent or Diamond.Humanoid.Health <= 0 then
							break
						end
					end
				else
					_tp(CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407))
				end
			end
		end)
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Black Spikey",
	Description = "",
	Default = false,
	Callback = function(p224)
		_G.BlackSpikey = p224
	end
})
spawn(function()
	while wait(0.1) do
		if _G.BlackSpikey then
			pcall(function()
				local Jeremy = GetConnectionEnemies("Jeremy")

				if Jeremy then
					while true do
						wait()
						t9.Kill(Jeremy, _G.BlackSpikey)

						if _G.BlackSpikey == false then
							break
						elseif not Jeremy.Parent or Jeremy.Humanoid.Health <= 0 then
							break
						end
					end
				else
					_tp(CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109))
				end
			end)
		end
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Dark Blade V3",
	Description = "",
	Default = false,
	Callback = function(p225)
		_G.DarkBladev3 = p225
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.DarkBladev3 then
				if World2 then
					if not GetBP("Dark Blade") then
						replicated.Remotes.CommF_:InvokeServer("LoadItem", "Dark Blade")
					end

					if not (GetBP("Fist of Darkness") > 1) then
						_G.AutoFarmChest = true
					elseif not workspace.Enemies:FindFirstChild("Darkbeard") then
						_tp(CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531))
					elseif GetConnectionEnemies("Darkbeard") and GetBP("Fist of Darkness") >= 1 then
						while true do
							wait()
							_tp(CFrame.new(-5719.36376953125, 48.505905151367188, -782.9759521484375))

							if _G.DarkBladev3 then
								if Root.Position == CFrame.new(-5719.36376953125, 48.505905151367188, -782.9759521484375).Position then
									break
								end
							else
								break
							end
						end

						fireclickdetector(workspace.Map.GraveIsland.Mountain.Rocks.Button.ClickDetector)
					end
				end
			end
		end)
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Midnight Blade",
	Description = "",
	Default = false,
	Callback = function(p226)
		_G.AutoEcBoss = p226
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.AutoEcBoss then
				if GetM("Ectoplasm") >= 99 then
					replicated.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 3)
				elseif GetM("Ectoplasm") <= 99 then
					local v793 = GetConnectionEnemies("Cursed Captain")

					if v793 then
						while true do
							wait()
							t9.Kill(v793, _G.AutoEcBoss)

							if _G.AutoEcBoss then
								if not v793.Parent or v793.Humanoid.Health <= 0 then
									break
								end
							else
								break
							end
						end
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
Q = t16.Quests:AddToggle({
	Name = "Auto Darkbeard",
	Description = "",
	Default = false,
	Callback = function(p227)
		_G.Auto_Def_DarkCoat = p227
	end
})
spawn(function()
	while wait(0.1) do
		if _G.Auto_Def_DarkCoat then
			pcall(function()
				local ok = not GetBP("Fist of Darkness")

				if not ok then
					ok = workspace.Enemies:FindFirstChild("Darkbeard")
				end

				if not ok then
					_tp(CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531))
				elseif GetConnectionEnemies("Darkbeard") then
					local Darkbeard = GetConnectionEnemies("Darkbeard")

					if Darkbeard then
						while true do
							wait()
							t9.Kill(Darkbeard, _G.Auto_Def_DarkCoat)

							if _G.Auto_Def_DarkCoat == false then
								break
							elseif not Darkbeard.Parent or Darkbeard.Humanoid.Helath <= 0 then
								break
							end
						end
					end
				elseif not GetBP("Fist of Darkness") and not GetConnectionEnemies("Darkbeard") then
					while true do
						wait(0.1)
						_G.AutoFarmChest = true

						if _G.Auto_Def_DarkCoat then
							if GetBP("Fist of Darkness") or GetConnectionEnemies("Darkbeard") then
								break
							end
						else
							break
						end
					end

					_G.AutoFarmChest = false
				end
			end)
		end
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Unlocked DonSwan",
	Description = "",
	Default = false,
	Callback = function(p228)
		_G.Auto_DonAcces = p228
	end
})
spawn(function()
	while wait(0.1) do
		if _G.Auto_DonAcces then
			pcall(function()
				if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil and plr.Data.Level.Value >= 1500 then
					FruitPrice = {}
					FruitStore = {}

					local next_ = next
					local response, v798 = replicated:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits")

					for _, v in next_, response, v798 do
						if v.Price >= 1000000 then
							table.insert(FruitPrice, v.Name)
						end
					end

					for _, v in pairs(replicated.Remotes.CommF_:InvokeServer("getInventoryFruits")) do
						for k, v2 in pairs(v) do
							if k == "Name" then
								table.insert(FruitStore, v2)
							end
						end

						replicated.Remotes.CommF_:InvokeServer("Cousin", "Buy")

						for _, v2 in pairs(FruitPrice) do
							for _, v3 in pairs(FruitStore) do
								if v2 == v3 then
									if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
										_G.StoreF = false

										if plr.Backpack:FindFirstChild(FruitStore) then
											replicated.Remotes.CommF_:InvokeServer("TalkTrevor", "1")
											replicated.Remotes.CommF_:InvokeServer("TalkTrevor", "2")
											replicated.Remotes.CommF_:InvokeServer("TalkTrevor", "3")
										else
											replicated.Remotes.CommF_:InvokeServer("LoadFruit", tostring(v2))
										end
									end
								end
							end
						end

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
Q = t16.Quests:AddToggle({
	Name = "Auto Swan Glasses",
	Description = "",
	Default = false,
	Callback = function(p229)
		_G.Auto_SwanGG = p229
	end
})
spawn(function()
	while wait(0.2) do
		if _G.Auto_SwanGG then
			pcall(function()
				local v809 = GetConnectionEnemies("Don Swan")

				if v809 then
					while true do
						wait()
						t9.Kill(v809, _G.Auto_SwanGG)

						if _G.Auto_SwanGG == false then
							break
						elseif not v809.Parent or v809.Humanoid.Health <= 0 then
							break
						end
					end
				else
					_tp(CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875))
				end
			end)
		end
	end
end)
t16.Quests:AddSection("Cavender + Twin Hooks + Bigmom")
Q = t16.Quests:AddToggle({
	Name = "Auto Bigmom",
	Description = "",
	Default = false,
	Callback = function(p230)
		_G.AutoBigmom = p230
	end
})
spawn(function()
	while wait(Sec) do
		if _G.AutoBigmom then
			pcall(function()
				local v810 = GetConnectionEnemies("Cake Queen")

				if v810 then
					while true do
						task.wait()
						t9.Kill(v810, _G.AutoBigmom)

						if _G.AutoBigmom then
							if not v810.Parent or v810.Humanoid.Health <= 0 then
								break
							end
						else
							break
						end
					end
				else
					_tp(CFrame.new(-709.31329345703125, 381.6005859375, -11011.396484375))
				end
			end)
		end
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Canvendish Sword",
	Description = "",
	Default = false,
	Callback = function(p231)
		_G.Auto_Cavender = p231
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.Auto_Cavender then
				local v811 = GetConnectionEnemies("Beautiful Pirate")

				if v811 then
					while true do
						wait()
						t9.Kill(v811, _G.Auto_Cavender)

						if _G.Auto_Cavender then
							if v811.Humanoid.Health <= 0 then
								break
							end
						else
							break
						end
					end
				else
					_tp(CFrame.new(5283.609375, 22.56223487854, -110.78285217285))
				end
			end
		end)
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Twin Hooks",
	Description = "",
	Default = false,
	Callback = function(p232)
		_G.TwinHook = p232
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.TwinHook then
				local v812 = GetConnectionEnemies("Captain Elephant")

				if v812 then
					while true do
						wait()
						t9.Kill(v812, _G.TwinHook)

						if _G.TwinHook then
							if v812.Humanoid.Health <= 0 then
								break
							end
						else
							break
						end
					end
				else
					replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
					wait(0.2)
					_tp(CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125))
				end
			end
		end)
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Serpent Bow",
	Description = "",
	Default = false,
	Callback = function(p233)
		_G.AutoSerpentBow = p233
	end
})
spawn(function()
	while wait(Sec) do
		if _G.AutoSerpentBow then
			local v813 = GetConnectionEnemies("Hydra Leader")

			if v813 then
				while true do
					wait()
					t9.Kill(v813, _G.AutoSerpentBow)

					if _G.AutoSerpentBow then
						if not v813.Parent or v813.Humanoid.Health <= 0 then
							break
						end
					else
						break
					end
				end
			else
				_tp(CFrame.new(5821.89794921875, 1019.0950927734375, -73.719230651855469))
			end
		end
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Lei Accessory",
	Description = "",
	Default = false,
	Callback = function(p234)
		_G.AutoKilo = p234
	end
})
spawn(function()
	while wait(0.2) do
		if _G.AutoKilo then
			pcall(function()
				local v814 = GetConnectionEnemies("Kilo Admiral")

				if v814 then
					while true do
						task.wait()
						t9.Kill(v814, _G.AutoKilo)

						if _G.AutoKilo then
							if not v814.Parent or v814.Humanoid.Health <= 0 then
								break
							end
						else
							break
						end
					end
				else
					_tp(CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125))
				end
			end)
		end
	end
end)
t16.Quests:AddSection("Buso/Aura Colours")
Q = t16.Quests:AddToggle({
	Name = "Auto Teleport Barista Cousin",
	Description = "",
	Default = false,
	Callback = function(p235)
		_G.Tp_MasterA = p235
	end
})
spawn(function()
	while wait() do
		if _G.Tp_MasterA then
			pcall(function()
				for _, child in pairs(replicated.NPCs:GetChildren()) do
					if child.Name == "Barista Cousin" then
						_tp(child.HumanoidRootPart.CFrame)
					end
				end
			end)
		end
	end
end)
t16.Quests:AddButton({
	Name = "Buy Buso Colors",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("ColorsDealer", "2")
	end
})
Q = t16.Quests:AddToggle({
	Name = "Auto Rainbow Colors",
	Description = "",
	Default = false,
	Callback = function(p236)
		_G.Auto_Rainbow_Haki = p236
	end
})
spawn(function()
	pcall(function()
		while wait(Sec) do
			if _G.Auto_Rainbow_Haki then
				if plr.PlayerGui.Main.Quest.Visible ~= false then
					if plr.PlayerGui.Main.Quest.Visible == true then
						if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
							local Stone = GetConnectionEnemies("Stone")

							if Stone then
								while true do
									wait()
									t9.Kill(Stone, _G.Auto_Rainbow_Haki)

									if _G.Auto_Rainbow_Haki == false or Stone.Humanoid.Health <= 0 or not Stone.Parent then
										break
									elseif plr.PlayerGui.Main.Quest.Visible == false then
										break
									end
								end
							else
								_tp(CFrame.new(-1086.11621, 38.8425903, 6768.71436, 0.0231462717, -0.592676699, 0.805107772, 2.03251839e-05, 0.805323839, 0.592835128, -0.999732077, -0.0137055516, 0.0186523199))
							end

							continue
						end
					end

					if plr.PlayerGui.Main.Quest.Visible == true then
						if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Hydra Leader") then
							local v818 = GetConnectionEnemies("Hydra Leader")

							if v818 then
								while true do
									task.wait()
									t9.Kill(v818, _G.Auto_Rainbow_Haki)

									if _G.Auto_Rainbow_Haki == false then
										break
									elseif v818.Humanoid.Health <= 0 or not v818.Parent or plr.PlayerGui.Main.Quest.Visible == false then
										break
									end
								end
							else
								replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5643.45263671875, 1013.0858154296875, -340.51025390625))

								local vector3 = Vector3.new(5643.45263671875, 1013.0858154296875, -340.51025390625)
								local cFrame3 = CFrame.new(5821.89794921875, 1019.0950927734375, -73.719230651855469)

								if plr.Character.HumanoidRootPart.CFrame.Position == vector3 then
									_tp(cFrame3)
								end
							end

							continue
						end
					end

					if plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
						local v821 = GetConnectionEnemies("Kilo Admiral")

						if v821 then
							while true do
								task.wait()
								t9.Kill(v821, _G.Auto_Rainbow_Haki)

								if _G.Auto_Rainbow_Haki == false or v821.Humanoid.Health <= 0 then
									break
								elseif not v821.Parent or plr.PlayerGui.Main.Quest.Visible == false then
									break
								end
							end
						else
							_tp(CFrame.new(2877.61743, 423.558685, -7207.31006, -0.989591599, -0, -0.143904909, -0, 1.00000012, -0, 0.143904924, 0, -0.989591479))
						end
					elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
						local v822 = GetConnectionEnemies("Captain Elephant")

						if v822 then
							while true do
								task.wait()
								t9.Kill(v822, _G.Auto_Rainbow_Haki)

								if _G.Auto_Rainbow_Haki == false then
									break
								elseif v822.Humanoid.Health <= 0 or not v822.Parent or plr.PlayerGui.Main.Quest.Visible == false then
									break
								end
							end
						else
							local vector3 = Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375)
							local cFrame3 = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)

							if plr.Character.HumanoidRootPart.CFrame.Position ~= vector3 then
								replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
							elseif plr.Character.HumanoidRootPart.CFrame.Position == vector3 then
								_tp(cFrame3)
							end
						end
					elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
						local v825 = GetConnectionEnemies("Captain Elephant")

						if v825 then
							while true do
								task.wait()
								t9.Kill(v825, _G.Auto_Rainbow_Haki)

								if _G.Auto_Rainbow_Haki == false then
									break
								elseif v825.Humanoid.Health <= 0 or not v825.Parent or plr.PlayerGui.Main.Quest.Visible == false then
									break
								end
							end
						else
							replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5314.54638671875, 22.562219619750977, -127.06755065917969))
						end
					end
				elseif _G.GetQFast then
					if plr.PlayerGui.Main.Quest.Visible == false then
						replicated.Remotes.CommF_:InvokeServer("HornedMan", "Bet")
					end
				else
					Rainbow1 = CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875)

					if plr.Character.HumanoidRootPart.CFrame ~= Rainbow1 then
						_tp(Rainbow1)
					elseif plr.Character.HumanoidRootPart.CFrame == Rainbow1 then
						wait(1)
						replicated.Remotes.CommF_:InvokeServer("HornedMan", "Bet")
					end
				end
			end
		end
	end)
end)
Q = t16.Quests:AddToggle({
	Name = "Accept Rainbow Quest Faster",
	Description = "",
	Default = false,
	Callback = function(p237)
		_G.GetQFast = p237
	end
})
t16.Quests:AddSection("Instinct / Observation")
Q = t16.Quests:AddToggle({
	Name = "Auto Farm Observation",
	Description = "",
	Default = false,
	Callback = function(p238)
		_G.obsFarm = p238
	end
})
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
							while true do
								wait()
								plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(3, 0, 0)

								if _G.obsFarm == false then
									break
								elseif KenTest == false then
									break
								end
							end
						else
							while true do
								wait()
								plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)

								if _G.obsFarm == false then
									break
								elseif KenTest then
									break
								end
							end
						end
					else
						_tp(CFrame.new(5533.29785, 88.1079102, 4852.3916))
					end
				elseif World2 then
					if workspace.Enemies:FindFirstChild("Lava Pirate") then
						if KenTest then
							while true do
								wait()
								plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(3, 0, 0)

								if _G.obsFarm == false then
									break
								elseif KenTest == false then
									break
								end
							end
						else
							while true do
								wait()
								plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)

								if _G.obsFarm == false then
									break
								elseif KenTest then
									break
								end
							end
						end
					else
						_tp(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
					end
				elseif World3 then
					if workspace.Enemies:FindFirstChild("Venomous Assailant") then
						if KenTest then
							while true do
								wait()
								_tp(workspace.Enemies:FindFirstChild("Venomous Assailant").HumanoidRootPart.CFrame * CFrame.new(3, 0, 0))

								if _G.obsFarm == false then
									break
								elseif KenTest == false then
									break
								end
							end
						else
							while true do
								wait()
								_tp(workspace.Enemies:FindFirstChild("Venomous Assailant").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))

								if _G.obsFarm == false then
									break
								elseif KenTest then
									break
								end
							end
						end
					else
						_tp(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789))
					end
				end
			end
		end)
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Observation V2",
	Description = "",
	Default = false,
	Callback = function(p239)
		_G.AutoKenVTWO = p239
	end
})
spawn(function()
	while wait(Sec) do
		if _G.AutoKenVTWO then
			pcall(function()
				local _
				local state = 1
				local cFrame3, cFrame4, cFrame5, cFrame6, v843, v844, forIter, forState, forControl, v848, forIter2, forState2, forControl2, v852, forIter3, forState3, forControl3, v856

				while true do
					if state == 1 then
						cFrame3 = CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)
						cFrame4 = CFrame.new(-10920.125, 624.20275878906, -10266.995117188)
						cFrame5 = CFrame.new(-13277.568359375, 370.34185791016, -7821.1572265625)
						cFrame6 = CFrame.new(-13493.12890625, 318.89553833008, -8373.7919921875)

						if plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Defeat 50 Forest Pirates") then
							state = 9
						else
							state = 2
						end
					elseif state == 2 then
						if plr.PlayerGui.Main.Quest.Visible == true then
							state = 5
						else
							state = 3
						end
					elseif state == 3 then
						if plr.PlayerGui.Main.Quest.Visible == false then
							state = 4
						else
							state = 13
						end
					elseif state == 4 then
						replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
						wait(0.1)
						replicated.Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1)
						state = 13
					elseif state == 5 then
						v843 = GetConnectionEnemies("Captain Elephant")

						if v843 then
							state = 7
						else
							state = 6
						end
					elseif state == 6 then
						_tp(cFrame6)
						state = 13
					elseif state == 7 then
						wait()
						t9.Kill(v843, _G.AutoKenVTWO)

						if _G.AutoKenVTWO then
							state = 8
						else
							state = 13
						end
					elseif state == 8 then
						if v843.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false then
							state = 13
						else
							state = 7
						end
					elseif state == 9 then
						v844 = GetConnectionEnemies("Forest Pirate")

						if v844 then
							state = 11
						else
							state = 10
						end
					elseif state == 10 then
						_tp(cFrame5)
						state = 13
					elseif state == 11 then
						wait()
						t9.Kill(v844, _G.AutoKenVTWO)

						if _G.AutoKenVTWO then
							state = 12
						else
							state = 13
						end
					elseif state == 12 then
						if v844.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false then
							state = 13
						else
							state = 11
						end
					elseif state == 13 then
						if replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 2 then
							state = 14
						else
							state = 15
						end
					elseif state == 14 then
						_tp(CFrame.new(-12513.51953125, 340.11373901367188, -9873.048828125))
						state = 15
					elseif state == 15 then
						if plr.Backpack:FindFirstChild("Fruit Bowl") then
							state = 16
						else
							state = 18
						end
					elseif state == 16 then
						if plr.Character:FindFirstChild("Fruit Bowl") then
							state = 17
						else
							state = 18
						end
					else
						if state == 17 then
							return
						end

						if state == 18 then
							if GetBP("Fruit Bowl") then
								state = 35
							else
								state = 19
							end
						elseif state == 19 then
							if GetBP("Apple") then
								state = 20
							else
								state = 32
							end
						elseif state == 20 then
							if GetBP("Banana") then
								state = 21
							else
								state = 27
							end
						elseif state == 21 then
							if GetBP("Pineapple") then
								state = 35
							else
								state = 22
							end
						elseif state == 22 then
							_tp(CFrame.new(-712.8272705078125, 98.577049255371094, 5711.9541015625))
							state = 23
						elseif state == 23 then
							forIter, forState, forControl = pairs(workspace:GetDescendants())

							if type(forIter) == 'table' then
								local forMeta = getmetatable(forIter)

								if type(forMeta) == 'table' and forMeta['__iter'] then
									forIter, forState, forControl = (forMeta['__iter'](forIter))
								else
									forIter, forState, forControl = next, forIter, nil
								end
							end

							state = 24
						elseif state == 24 then
							local v858

							v858, v848 = (forIter(forState, forControl))

							if v858 == nil then
								state = 35
							else
								forControl = v858
								state = 25
							end
						elseif state == 25 then
							if v848.Name == "Pineapple" then
								state = 26
							else
								state = 24
							end
						elseif state == 26 then
							v848.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10)
							wait()
							firetouchinterest(plr.Character.HumanoidRootPart, v848.Handle, 0)
							wait()
							state = 24
						elseif state == 27 then
							_tp(CFrame.new(2286.0078125, 73.133918762207031, -7159.80908203125))
							state = 28
						elseif state == 28 then
							forIter2, forState2, forControl2 = pairs(workspace:GetDescendants())

							if type(forIter2) == 'table' then
								local forMeta2 = getmetatable(forIter2)

								if type(forMeta2) == 'table' and forMeta2['__iter'] then
									forIter2, forState2, forControl2 = (forMeta2['__iter'](forIter2))
								else
									forIter2, forState2, forControl2 = next, forIter2, nil
								end
							end

							state = 29
						elseif state == 29 then
							local v860

							v860, v852 = (forIter2(forState2, forControl2))

							if v860 == nil then
								state = 35
							else
								forControl2 = v860
								state = 30
							end
						elseif state == 30 then
							if v852.Name == "Banana" then
								state = 31
							else
								state = 29
							end
						elseif state == 31 then
							v852.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10)
							wait()
							firetouchinterest(plr.Character.HumanoidRootPart, v852.Handle, 0)
							wait()
							state = 29
						elseif state == 32 then
							replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
							state = 33
						elseif state == 33 then
							forIter3, forState3, forControl3 = pairs(workspace:GetDescendants())

							if type(forIter3) == 'table' then
								local forMeta3 = getmetatable(forIter3)

								if type(forMeta3) == 'table' and forMeta3['__iter'] then
									forIter3, forState3, forControl3 = (forMeta3['__iter'](forIter3))
								else
									forIter3, forState3, forControl3 = next, forIter3, nil
								end
							end

							state = 34
						elseif state == 34 then
							local v862

							v862, v856 = (forIter3(forState3, forControl3))

							if v862 == nil then
								state = 35
							else
								forControl3 = v862
								state = 54
							end
						elseif state == 35 then
							if plr.Backpack:FindFirstChild("Banana") then
								state = 36
							else
								state = 38
							end
						elseif state == 36 then
							if plr.Backpack:FindFirstChild("Apple") then
								state = 37
							else
								state = 38
							end
						elseif state == 37 then
							if plr.Backpack:FindFirstChild("Pineapple") then
								state = 41
							else
								state = 38
							end
						elseif state == 38 then
							if plr:FindFirstChild("Banana") then
								state = 39
							else
								state = 44
							end
						elseif state == 39 then
							if plr:FindFirstChild("Apple") then
								state = 40
							else
								state = 44
							end
						elseif state == 40 then
							if plr:FindFirstChild("Pineapple") then
								state = 41
							else
								state = 44
							end
						elseif state == 41 then
							wait()
							_tp(cFrame3)

							if _G.AutoKenVTWO then
								state = 43
							else
								state = 42
							end
						elseif state == 42 then
							if plr.Character.HumanoidRootPart.CFrame == cFrame3 then
								state = 43
							else
								state = 41
							end
						elseif state == 43 then
							replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
							state = 44
						elseif state == 44 then
							if plr.Backpack:FindFirstChild("Fruit Bowl") then
								state = 47
							else
								state = 45
							end
						elseif state == 45 then
							if plr.Character:FindFirstChild("Fruit Bowl") then
								state = 47
							else
								state = 46
							end
						else
							if state == 46 then
								return
							end

							if state == 47 then
								if plr.Character.HumanoidRootPart.CFrame == cFrame4 then
									state = 48
								else
									state = 52
								end
							elseif state == 48 then
								if plr.Character.HumanoidRootPart.CFrame == cFrame4 then
									state = 49
								else
									state = 51
								end
							elseif state == 49 then
								replicated.Remotes.CommF_:InvokeServer("KenTalk2", "Start")
								wait(0.1)
								replicated.Remotes.CommF_:InvokeServer("KenTalk2", "Buy")
								state = 50
							else
								if state == 50 then
									return
								end

								if state == 51 then
									return
								end

								if state == 52 then
									_tp(cFrame4)
									state = 53
								else
									if state == 53 then
										return
									end

									if state == 54 then
										if v856.Name == "Apple" then
											state = 55
										else
											state = 34
										end
									elseif state == 55 then
										v856.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10)
										wait()
										firetouchinterest(plr.Character.HumanoidRootPart, v856.Handle, 0)
										wait()
										state = 34
									end
								end
							end
						end
					end
				end
			end)
		end
	end
end)
Bartilo = t16.Quests:AddToggle({
	Name = "Auto Done Bartilo Quest",
	Description = "",
	Default = false,
	Callback = function(p240)
		_G.Bartilo_Quest = p240
	end
})
spawn(function()
	while wait(0.1) do
		pcall(function()
			if _G.Bartilo_Quest and Lv >= 850 then
				local Quest = plr.PlayerGui.Main.Quest

				if replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 0 then
					_G.Level = false

					if Quest.Visible == true then
						if GetConnectionEnemies("Swan Pirate") then
							local v864 = GetConnectionEnemies(t3)

							if v864 then
								repeat
									task.wait()

									if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirate") then
										t9.Kill(v864, _G.Bartilo_Quest)
									else
										replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
									end
								until _G.Bartilo_Quest == false or not v864.Parent or v864.Humanoid.Health <= 0 or Quest.Visible == false or not v864:FindFirstChild("HumanoidRootPart")
							end
						else
							_tp(CFrame.nee(970.369446, 142.653198, 1217.3667, 0.162079468, -4.85452638e-08, -0.986777723, 1.03357589e-08, 1, -4.74980872e-08, 0.986777723, -2.50063148e-09, 0.162079468))
						end
					else
						while true do
							wait()
							_tp(CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, -0, -0.998706102, 0, 1, -0, 0.998706102, 0, 0.050853312))

							if (CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, -0, -0.998706102, 0, 1, -0, 0.998706102, 0, 0.050853312).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 20 then
								break
							elseif _G.Bartilo_Quest == false then
								break
							end
						end

						if (CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, -0, -0.998706102, 0, 1, -0, 0.998706102, 0, 0.050853312).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 1 then
							replicated.Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest", 1)
						end
					end
				elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 1 then
					_G.Level = false

					local Jeremy = GetConnectionEnemies("Jeremy")

					if Jeremy then
						while true do
							task.wait()
							t9.Kill(Jeremy, _G.Bartilo_Quest)

							if _G.Bartilo_Quest == false then
								break
							elseif not Jeremy.Parent or Jeremy.Humanoid.Health <= 0 or Quest.Visible == false or not Jeremy:FindFirstChild("HumanoidRootPart") then
								break
							end
						end
					else
						_tp(CFrame.new(2158.97412, 449.056244, 705.411682, -0.754199564, -4.17389057e-09, -0.656645238, -4.47752875e-08, 1, 4.50709301e-08, 0.656645238, 6.3393955e-08, -0.754199564))
					end
				elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 2 then
					while true do
						wait()
						_tp(CFrame.new(-1830.83972, 10.5578213, 1680.60229, 0.979988456, -2.02152783e-08, -0.199054286, 2.20792113e-08, 1, 7.1442483e-09, 0.199054286, -1.13962431e-08, 0.979988456))

						if (CFrame.new(-1830.83972, 10.5578213, 1680.60229, 0.979988456, -2.02152783e-08, -0.199054286, 2.20792113e-08, 1, 7.1442483e-09, 0.199054286, -1.13962431e-08, 0.979988456).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 1 then
							break
						elseif _G.Bartilo_Quest == false then
							break
						end
					end

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
CitizenQ = t16.Quests:AddToggle({
	Name = "Auto Done Citizen Quest",
	Description = "",
	Default = false,
	Callback = function(p241)
		_G.CitizenQuest = p241
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.CitizenQuest then
				local ok2 = not (Lv >= 1800)

				if not ok2 then
					ok2 = replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits ~= false
				end

				if ok2 then
					local ok = not (Lv >= 1800)

					if not ok then
						ok = replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss ~= false
					end

					if not ok then
						local v868 = GetConnectionEnemies("Captain Elephant")

						if plr.PlayerGui.Main.Quest.Visible and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and plr.PlayerGui.Main.Quest.Visible == true then
							if v868 then
								while true do
									task.wait()
									t9.Kill(v868, _G.CitizenQuest)

									if _G.CitizenQuest == false then
										break
									elseif v868.Humanoid.Health <= 0 or not v868.Parent or plr.PlayerGui.Main.Quest.Visible == false then
										break
									end
								end
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
					elseif Lv >= 1800 then
						if replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 2 then
							_tp(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125))
						end
					end
				elseif string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and plr.PlayerGui.Main.Quest.Visible == true then
					local v869 = GetConnectionEnemies("Forest Pirate")

					if v869 then
						while true do
							task.wait()
							t9.Kill(v869, _G.CitizenQuest)

							if _G.CitizenQuest == false then
								break
							elseif not v869.Parent or v869.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false then
								break
							end
						end
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
			end
		end)
	end
end)
Q = t16.Quests:AddToggle({
	Name = "Auto Training Dummy",
	Description = "",
	Default = false,
	Callback = function(p242)
		_G.DummyMan = p242
	end
})
spawn(function()
	while wait(Sec) do
		if _G.DummyMan then
			pcall(function()
				if plr.PlayerGui.Main.Quest.Visible == false then
					replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack({ "ArenaTrainer" }))
				else
					local v870 = GetConnectionEnemies("Training Dummy")

					if v870 then
						while true do
							wait()
							t9.Kill(v870, _G.DummyMan)

							if _G.DummyMan then
								if not v870.Parent or v870.Humanoid.Health <= 0 then
									break
								end
							else
								break
							end
						end
					else
						_tp(CFrame.new(3688.005126953125, 12.746943473815918, 170.20953369140625))
					end
				end
			end)
		end
	end
end)
t16.Quests:AddSection("Fighting Melee Styles")
SuperHuman = t16.Quests:AddToggle({
	Name = "Auto Superhuman",
	Description = "",
	Default = false,
	Callback = function(p243)
		_G.Auto_SuperHuman = p243
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.Auto_SuperHuman then
				local Value = plr.Data.Beli.Value
				local Value2 = plr.Data.Fragments.Value

				if plr:FindFirstChild("WeaponAssetCache") and not GetBP("Superhuman") then
					if not GetBP("Black Leg") then
						if Value >= 150000 then
							replicated.Remotes.CommF_:InvokeServer("BuyBlackLeg")
						end
					elseif GetBP("Black Leg") and GetBP("Black Leg").Level.Value < 299 then
						_G.Level = true
					elseif GetBP("Black Leg") and GetBP("Black Leg").Level.Value >= 300 then
						_G.Level = false
					end

					if not GetBP("Electro") then
						if Value >= 500000 then
							replicated.Remotes.CommF_:InvokeServer("BuyElectro")
						end
					elseif GetBP("Electro") and GetBP("Electro").Level.Value < 299 then
						_G.Level = true
					elseif GetBP("Electro") and GetBP("Electro").Level.Value >= 300 then
						_G.Level = false
					end

					if not GetBP("Fishman Karate") then
						if Value >= 750000 then
							replicated.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
						end
					elseif GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value < 299 then
						_G.Level = true
					elseif GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value >= 300 then
						_G.Level = false
					end

					if not GetBP("Dragon Claw") then
						if Value2 >= 1500 then
							replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
						end
					elseif GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value < 299 then
						_G.Level = true
					elseif GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value >= 300 then
						_G.Level = false
					end

					replicated.Remotes.CommF_:InvokeServer("BuySuperhuman")
				end
			end
		end)
	end
end)
DeathStep = t16.Quests:AddToggle({
	Name = "Auto DeathStep",
	Description = "",
	Default = false,
	Callback = function(p244)
		_G.AutoDeathStep = p244
	end
})
spawn(function()
	while wait(Sec) do
		if _G.AutoDeathStep then
			pcall(function()
				if plr:FindFirstChild("WeaponAssetCache") then
					if not GetBP("Death Step") then
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
								while true do
									wait()
									_tp(CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375))

									if _G.AutoDeathStep then
										if Root.Position == CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375).Position then
											break
										end
									else
										break
									end
								end

								if Root.CFrame == CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375) then
									replicated.Remotes.CommF_:InvokeServer("BuyDeathStep")
								end
							elseif not GetBP("Library Key") then
								local v873 = GetConnectionEnemies("Awakened Ice Admiral")

								if v873 then
									while true do
										wait()
										t9.Kill(v873, _G.AutoDeathStep)

										if v873.Parent then
											if v873.Humanoid.Health <= 0 or _G.AutoDeathStep == false or GetBP("Library Key") or GetBP("Death Step") then
												break
											end
										else
											break
										end
									end
								else
									_tp(CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813))
								end
							end
						end
					end
				end
			end)
		end
	end
end)
SharkManV2 = t16.Quests:AddToggle({
	Name = "Auto Sharkman Karate",
	Description = "",
	Default = false,
	Callback = function(p245)
		_G.Auto_SharkMan_Karate = p245
	end
})
spawn(function()
	while wait(Sec) do
		if _G.Auto_SharkMan_Karate then
			pcall(function()
				if plr:FindFirstChild("WeaponAssetCache") then
					if not GetBP("Sharkman Karate") then
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
									while true do
										wait()
										_tp(CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365))

										if _G.Auto_SharkMan_Karate then
											if Root.Position == CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365).Position then
												break
											end
										else
											break
										end
									end

									replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
								end
							elseif not GetBP("Water Key") then
								local v874 = GetConnectionEnemies("Tide Keeper")

								if v874 then
									while true do
										wait()
										t9.Kill(v874, _G.Auto_SharkMan_Karate)

										if v874.Parent then
											if v874.Humanoid.Health <= 0 or _G.Auto_SharkMan_Karate == false or GetBP("Water Key") or GetBP("Sharkman Karate") then
												break
											end
										else
											break
										end
									end
								else
									_tp(CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625))
								end
							end
						end
					end
				end
			end)
		end
	end
end)
ElectricClaw = t16.Quests:AddToggle({
	Name = "Auto ElectricClaw",
	Description = "",
	Default = false,
	Callback = function(p246)
		_G.Auto_Electric_Claw = p246
	end
})
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
						while true do
							_G.AutoFarm_Bone = true
							wait()

							if _G.Auto_Electric_Claw then
								if GetBP("Electric Claw") then
									break
								end
							else
								break
							end
						end

						_G.AutoFarm_Bone = false
					end
				end
			end)
		end
	end
end)
DragonTalon = t16.Quests:AddToggle({
	Name = "Auto DragonTalon",
	Description = "",
	Default = false,
	Callback = function(p247)
		_G.AutoDragonTalon = p247
	end
})
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
						while true do
							_G.AutoFarm_Bone = true
							wait()

							if _G.AutoDragonTalon then
								if GetBP("Dragon Talon") then
									break
								end
							else
								break
							end
						end

						_G.AutoFarm_Bone = false
					end
				end
			end)
		end
	end
end)
Godhuman = t16.Quests:AddToggle({
	Name = "Auto Godhuman",
	Description = "",
	Default = false,
	Callback = function(p248)
		_G.Auto_God_Human = p248
	end
})
spawn(function()
	while wait() do
		pcall(function()
			if _G.Auto_God_Human then
				if replicated.Remotes.CommF_:InvokeServer("BuyGodhuman", true) ~= "Bring me 20 Fish Tails, 20 Magma Ore, 10 Dragon Scales and 10 Mystic Droplets." then
					if replicated.Remotes.CommF_:InvokeServer("BuyGodhuman", true) == 3 then
						return nil
					end

					replicated.Remotes.CommF_:InvokeServer("BuyGodhuman")
				elseif GetM("Dragon Scale") == false or GetM("Dragon Scale") < 10 then
					if World3 then
						Lv = 1575
						_G.Level = true
					else
						replicated.Remotes.CommF_:InvokeServer("TravelZou")
					end
				elseif GetM("Fish Tail") == false or GetM("Fish Tail") < 20 then
					if World3 then
						Lv = 1775
						_G.Level = true
					else
						replicated.Remotes.CommF_:InvokeServer("TravelZou")
					end
				elseif GetM("Mystic Droplet") == false or GetM("Mystic Droplet") < 10 then
					if World2 then
						Lv = 1425
						_G.Level = true
					else
						replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
					end
				elseif GetM("Magma Ore") == false or GetM("Magma Ore") < 20 then
					if World2 then
						Lv = 1175
						_G.Level = true
					else
						replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
					end
				end
			end
		end)
	end
end)
SanguineArt = t16.Quests:AddToggle({
	Name = "Auto SanguineArt",
	Description = "",
	Default = false,
	Callback = function(p249)
		_G.Snaguine = p249
	end
})
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
								while true do
									task.wait()
									t9.Kill(Vampire, _G.Snaguine)

									if _G.Snaguine then
										if Vampire.Humanoid.Health <= 0 or not Vampire.Parent then
											break
										end
									else
										break
									end
								end
							else
								_tp(CFrame.new(-6041.29248046875, 6.4027109146118164, -1304.63330078125))
							end
						else
							replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
						end
					end

					if GetM("Vampire Fang") >= 20 and GetM("Demonic Wisp") <= 19 then
						if World3 then
							local v876 = GetConnectionEnemies("Demonic Soul")

							if v876 then
								while true do
									task.wait()
									t9.Kill(v876, _G.Snaguine)

									if _G.Snaguine then
										if v876.Humanoid.Health <= 0 or not v876.Parent then
											break
										end
									else
										break
									end
								end
							else
								_tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
							end
						else
							replicated.Remotes.CommF_:InvokeServer("TravelZou")
						end
					end

					if GetM("Vampire Fang") >= 20 and GetM("Demonic Wisp") >= 20 and GetM("Dark Fragment") <= 1 then
						if World2 then
							if GetConnectionEnemies("Darkbeard") then
								while true do
									task.wait()
									t9.Kill(black, _G.Snaguine)

									if _G.Snaguine then
										break
									elseif black.Humanoid.Health <= 0 or not black.Parent then
										break
									end
								end
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
t16.Race:AddSection("Mystic Island / Full Moon")

local v877 = t16.Race:AddParagraph("FullMoon Status", "")
local v878 = t16.Race:AddParagraph("Mirage Island Status", "")

spawn(function()
	while wait(0.2) do
		if not workspace.Map:FindFirstChild("MysticIsland") then
			if not workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") then
				v878:SetDesc("Mirage Island : False")

				continue
			end
		end

		v878:SetDesc("Mirage Island : True")
	end
end)
spawn(function()
	while wait(0.2) do
		pcall(function()
			local v879 = Getmoon()

			if v879 == "http://www.roblox.com/asset/?id=9709135895" then
				v877:SetDesc("Moon : 0 / 8")
			elseif v879 == "http://www.roblox.com/asset/?id=9709139597" then
				v877:SetDesc("Moon : 1 / 8")
			elseif v879 == "http://www.roblox.com/asset/?id=9709143733" then
				v877:SetDesc("Moon : 2 / 8")
			elseif v879 == "http://www.roblox.com/asset/?id=9709149052" then
				v877:SetDesc("Moon : 3 / 8 [ Next Night ]")
			elseif v879 == "http://www.roblox.com/asset/?id=9709149431" then
				v877:SetDesc("Moon : 4 / 8 [ Full Moon ]")
			elseif v879 == "http://www.roblox.com/asset/?id=9709149680" then
				v877:SetDesc("Moon : 5 / 8 [ Last Night ]")
			elseif v879 == "http://www.roblox.com/asset/?id=9709150086" then
				v877:SetDesc("Moon : 6 / 8")
			elseif v879 == "http://www.roblox.com/asset/?id=9709150401" then
				v877:SetDesc("Moon : 7 / 8")
			end
		end)
	end
end)
t16.Race:AddToggle({
	Name = "Auto Find Mirage Island",
	Description = "",
	Default = false,
	Callback = function(p250)
		_G.FindMirage = p250
	end
})
spawn(function()
	while wait() do
		if _G.FindMirage then
			pcall(function()
				if workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island", true) then
					_tp(workspace.Map.MysticIsland.Center.CFrame * CFrame.new(0, 300, 0))
				else
					local v880 = CheckBoat()

					if not v880 then
						local cFrame3 = CFrame.new(-16927.451, 9.086, 433.864)

						TeleportToTarget(cFrame3)

						if (cFrame3.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
							replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
						end
					elseif plr.Character.Humanoid.Sit == false then
						_tp(v880.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
					else
						while true do
							wait()

							local cFrame3 = CFrame.new(-10000000, 31, 37016.25)

							if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then
								_tp(CFrame.new(-10000000, 150, 37016.25))
							else
								_tp(CFrame.new(-10000000, 31, 37016.25))
							end

							if _G.FindMirage and not ((cFrame3.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10) then
								if not workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") and plr.Character.Humanoid.Sit ~= false then
									continue
								end
							end

							break
						end

						plr.Character.Humanoid.Sit = false
					end
				end
			end)
		end
	end
end)
t16.Race:AddToggle({
	Name = "Esp Mirage Island",
	Description = "",
	Value = false,
	Callback = function(p251)
		MirageIslandESP = p251

		if MirageIslandESP then
			task.spawn(function()
				while MirageIslandESP do
					UpdateIslandMirageESP()
					task.wait(1)
				end
			end)
		else
			UpdateIslandMirageESP()
		end
	end
})
t16.Race:AddToggle({
	Name = "Auto Tween To Mirage Island",
	Description = "",
	Default = false,
	Callback = function(p252)
		_G.AutoMysticIsland = p252
	end
})
spawn(function()
	while task.wait(0.1) do
		pcall(function()
			if _G.AutoMysticIsland then
				for _, child in pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
					if child.Name == "Mirage Island" then
						topos(child.CFrame * CFrame.new(0, 333, 0))
					end
				end
			end
		end)
	end
end)
t16.Race:AddToggle({
	Name = "Auto Tween To Highest Point",
	Description = "",
	Default = false,
	Callback = function(p253)
		_G.HighestMirage = p253
	end
})
spawn(function()
	while wait(Sec) do
		if _G.HighestMirage then
			pcall(function()
				if workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island", true) then
					_tp(workspace.Map.MysticIsland.Center.CFrame * CFrame.new(0, 400, 0))
				end
			end)
		end
	end
end)
t16.Race:AddToggle({
	Name = "Auto Collect Gear",
	Description = "",
	Default = false,
	Callback = function(p254)
		_G.TPGEAR = p254
	end
})
spawn(function()
	pcall(function()
		while wait(0.1) do
			if _G.TPGEAR then
				local pairs_ = pairs
				local MysticIsland = workspace.Map:FindFirstChild("MysticIsland")

				for _, child in pairs_(MysticIsland:GetChildren()) do
					if child.Name == "Part" then
						if child.ClassName == "MeshPart" then
							_tp(child.CFrame)
						end
					end
				end
			end
		end
	end)
end)
t16.Race:AddToggle({
	Name = "Change Transparency can see",
	Description = "",
	Default = false,
	Callback = function(p255)
		_G.can = p255
	end
})
spawn(function()
	pcall(function()
		while wait(Sec) do
			if _G.can then
				local pairs_ = pairs
				local MysticIsland = workspace.Map:FindFirstChild("MysticIsland")

				for _, child in pairs_(MysticIsland:GetChildren()) do
					if child.Name == "Part" then
						if child.ClassName == "MeshPart" then
							child.Transparency = 0
						else
							child.Transparency = 1
						end
					end
				end
			end
		end
	end)
end)
t16.Race:AddToggle({
	Name = "Auto Tween Advanced Fruit Dealer",
	Description = "",
	Default = false,
	Callback = function(p256)
		_G.Addealer = p256
	end
})
spawn(function()
	while wait() do
		if _G.Addealer then
			pcall(function()
				for _, child in pairs(replicated.NPCs:GetChildren()) do
					if child.Name == "Advanced Fruit Dealer" then
						_tp(child.HumanoidRootPart.CFrame)
					end
				end
			end)
		end
	end
end)
t16.Race:AddToggle({
	Name = "Auto Collect Mirage Chest",
	Description = "",
	Default = false,
	Callback = function(p257)
		_G.FarmChestM = p257
	end
})
spawn(function()
	while wait(0.2) do
		if _G.FarmChestM then
			pcall(function()
				local ok = workspace.Map.MysticIsland.Chests:FindFirstChild("DiamondChest")

				if not ok then
					ok = not not workspace.Map.MysticIsland.Chests:FindFirstChild("FragChest")
				end

				if ok then
					local CollectionService = game:GetService("CollectionService")
					local LocalPlayer4 = game:GetService("Players").LocalPlayer
					local Character = LocalPlayer4.Character or LocalPlayer4.CharacterAdded:Wait()

					if not Character then
						return
					end

					local Position = Character:GetPivot().Position
					local tagged = CollectionService:GetTagged("_ChestTagged")
					local huge = math.huge
					local v902

					for i = 1, #tagged do
						local v904 = tagged[i]
						local Magnitude = (v904:GetPivot().Position - Position).Magnitude

						if (not SelectedIsland or v904:IsDescendantOf(SelectedIsland)) and not v904:GetAttribute("IsDisabled") and Magnitude < huge then
							huge = Magnitude
							v902 = v904
						end
					end

					if v902 then
						_tp(v902:GetPivot())
					end
				end
			end)
		end
	end
end)
t16.Race:AddButton({
	Name = "Talk With Stone",
	Description = "",
	Callback = function()
		replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "Begin")
		replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "Check")
		replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "Teleport")
		replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "Continue")
	end
})
t16.Race:AddToggle({
	Name = "Auto Look At Moon",
	Description = "",
	Default = false,
	Callback = function(p258)
		LookM = p258
	end
})
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
t16.Race:AddToggle({
	Name = "Look Moon + Auto V3",
	Description = "",
	Default = false,
	Callback = function(p259)
		LookMV3 = p259
	end
})
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
			UIS:SendKeyEvent(true, "T", false, game)
			wait(0.5)
			UIS:SendKeyEvent(false, "T", false, game)
		end
	end
end)
t16.Race:AddSection("Upgrade Races V2 And V3")
RaceMink = t16.Race:AddToggle({
	Name = "Auto Upgrade Mink",
	Description = "",
	Default = false,
	Callback = function(p260)
		_G.Auto_Mink = p260
	end
})
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
					local ok2 = plr.Backpack:FindFirstChild("Flower 1")

					if not ok2 then
						ok2 = plr.Character:FindFirstChild("Flower 1")
					end

					if ok2 then
						local ok = plr.Backpack:FindFirstChild("Flower 2")

						if not ok then
							ok = plr.Character:FindFirstChild("Flower 2")
						end

						if not ok then
							_tp(workspace.Flower2.CFrame)
						elseif not plr.Backpack:FindFirstChild("Flower 3") then
							if not plr.Character:FindFirstChild("Flower 3") then
								local v909 = GetConnectionEnemies("Swan Pirate")

								if v909 then
									while true do
										wait()
										t9.Kill(v909, _G.Auto_Mink)

										if GetBP("Flower 3") then
											break
										elseif not v909.Parent or v909.Humanoid.Health <= 0 or _G.Auto_Mink == false then
											break
										end
									end
								else
									_tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
								end
							end
						end
					else
						_tp(workspace.Flower1.CFrame)
					end
				elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
					replicated.Remotes.CommF_:InvokeServer("Alchemist", "3")
				end
			end
		end)
	end
end)
RaceHuman = t16.Race:AddToggle({
	Name = "Auto Upgrade Human",
	Description = "",
	Default = false,
	Callback = function(p261)
		_G.Auto_Human = p261
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.Auto_Human then
				if replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == -2 then
					if replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 0 then
						replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
					elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 1 then
						local v910 = GetConnectionEnemies(t4[1])

						if v910 then
							while true do
								wait()
								t9.Kill(v910, _G.Auto_Human)

								if v910.Humanoid.Health <= 0 then
									break
								elseif not v910.Parent or not _G.Auto_Human then
									break
								end
							end
						else
							_tp(CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625))
						end

						local v911 = GetConnectionEnemies(t4[2])

						if v911 then
							while true do
								wait()
								t9.Kill(v911, _G.Auto_Human)

								if v911.Humanoid.Health <= 0 then
									break
								elseif not v911.Parent or not _G.Auto_Human then
									break
								end
							end
						else
							_tp(CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109))
						end

						local v912 = GetConnectionEnemies(t4[3])

						if v912 then
							while true do
								wait()
								t9.Kill(v912, _G.Auto_Human)

								if v912.Humanoid.Health <= 0 then
									break
								elseif not v912.Parent or not _G.Auto_Human then
									break
								end
							end
						else
							_tp(CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407))
						end
					end
				elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
					replicated.Remotes.CommF_:InvokeServer("Alchemist", "2")
				elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 1 then
					local ok2 = plr.Backpack:FindFirstChild("Flower 1")

					if not ok2 then
						ok2 = plr.Character:FindFirstChild("Flower 1")
					end

					if ok2 then
						local ok = plr.Backpack:FindFirstChild("Flower 2")

						if not ok then
							ok = plr.Character:FindFirstChild("Flower 2")
						end

						if not ok then
							_tp(workspace.Flower2.CFrame)
						elseif not plr.Backpack:FindFirstChild("Flower 3") then
							if not plr.Character:FindFirstChild("Flower 3") then
								local v915 = GetConnectionEnemies("Swan Pirate")

								if v915 then
									while true do
										wait()
										t9.Kill(v915, _G.Auto_Human)

										if plr.Backpack:FindFirstChild("Flower 3") then
											break
										elseif not v915.Parent or v915.Humanoid.Health <= 0 or _G.Auto_Human == false then
											break
										end
									end
								else
									_tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
								end
							end
						end
					else
						_tp(workspace.Flower1.CFrame)
					end
				elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
					replicated.Remotes.CommF_:InvokeServer("Alchemist", "3")
				end
			end
		end)
	end
end)
RaceSky = t16.Race:AddToggle({
	Name = "Auto Upgrade Angel",
	Description = "",
	Default = false,
	Callback = function(p262)
		_G.Auto_Skypiea = p262
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.Auto_Skypiea then
				if replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == -2 then
					if replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 0 then
						replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
					elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 1 then
						for _, child in pairs(game.Players:GetChildren()) do
							if child.Name ~= plr.Name then
								if tostring(child.Data.Race.Value) == "Skypiea" then
									while true do
										task.wait()
										_tp(child.HumanoidRootPart.CFrame * CFrame.new(0, 8, 0) * CFrame.Angles(math.rad(-45), 0, 0))

										if child.Humanoid.Health <= 0 then
											break
										elseif _G.Auto_Skypiea == false then
											break
										end
									end
								end
							end
						end
					end
				elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
					replicated.Remotes.CommF_:InvokeServer("Alchemist", "2")
				elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 1 then
					local ok2 = plr.Backpack:FindFirstChild("Flower 1")

					if not ok2 then
						ok2 = plr.Character:FindFirstChild("Flower 1")
					end

					if ok2 then
						local ok = plr.Backpack:FindFirstChild("Flower 2")

						if not ok then
							ok = plr.Character:FindFirstChild("Flower 2")
						end

						if not ok then
							_tp(workspace.Flower2.CFrame)
						elseif not plr.Backpack:FindFirstChild("Flower 3") then
							if not plr.Character:FindFirstChild("Flower 3") then
								local v920 = GetConnectionEnemies("Swan Pirate")

								if v920 then
									while true do
										wait()
										t9.Kill(v920, _G.Auto_Skypiea)

										if plr.Backpack:FindFirstChild("Flower 3") then
											break
										elseif not v920.Parent or v920.Humanoid.Health <= 0 or _G.Auto_Skypiea == false then
											break
										end
									end
								else
									_tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
								end
							end
						end
					else
						_tp(workspace.Flower1.CFrame)
					end
				elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
					replicated.Remotes.CommF_:InvokeServer("Alchemist", "3")
				end
			end
		end)
	end
end)
RaceFish = t16.Race:AddToggle({
	Name = "Auto Upgrade FishMan",
	Description = "",
	Default = false,
	Callback = function(p263)
		_G.Auto_Fish = p263
	end
})
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
					local ok2 = plr.Backpack:FindFirstChild("Flower 1")

					if not ok2 then
						ok2 = plr.Character:FindFirstChild("Flower 1")
					end

					if ok2 then
						local ok = plr.Backpack:FindFirstChild("Flower 2")

						if not ok then
							ok = plr.Character:FindFirstChild("Flower 2")
						end

						if not ok then
							_tp(workspace.Flower2.CFrame)
						elseif not plr.Backpack:FindFirstChild("Flower 3") then
							if not plr.Character:FindFirstChild("Flower 3") then
								local v923 = GetConnectionEnemies("Swan Pirate")

								if v923 then
									while true do
										wait()
										t9.Kill(v923, _G.Auto_Fish)

										if plr.Backpack:FindFirstChild("Flower 3") then
											break
										elseif not v923.Parent or v923.Humanoid.Health <= 0 or _G.Auto_Fish == false then
											break
										end
									end
								else
									_tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
								end
							end
						end
					else
						_tp(workspace.Flower1.CFrame)
					end
				elseif replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
					replicated.Remotes.CommF_:InvokeServer("Alchemist", "3")
				end
			end
		end)
	end
end)
t16.Race:AddSection("Trials Quest V4")

local v924 = t16.Race:AddParagraph("Tiers V4 Status", "")

spawn(function()
	pcall(function()
		while wait(0.2) do
			v924:SetDesc("Tiers - V4 : " .. " " .. plr.Data.Race.C.Value)
		end
	end)
end)
PullLv = t16.Race:AddToggle({
	Name = "Auto Pull Lever",
	Description = "",
	Default = false,
	Callback = function(p264)
		_G.Lver = p264
	end
})
spawn(function()
	while wait(Sec) do
		if _G.Lver then
			pcall(function()
				for _, descendant in pairs(workspace.Map["Temple of Time"]:GetDescendants()) do
					if descendant.Name == "ProximityPrompt" then
						fireproximityprompt(descendant, math.huge)
					end
				end
			end)
		end
	end
end)
Train = t16.Race:AddToggle({
	Name = "Auto Train V4",
	Description = "",
	Default = false,
	Callback = function(p265)
		_G.AcientOne = p265
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.AcientOne then
				local t34 = {
					"Reborn Skeleton",
					"Living Zombie",
					"Demonic Soul",
					"Posessed Mummy"
				}

				for i = 1, #t34 do
					if plr.Character:FindFirstChild("RaceEnergy").Value == 1 then
						vim1:SendKeyEvent(true, "Y", false, game)
						replicated.Remotes.CommF_:InvokeServer("UpgradeRace", "Buy")
						_tp(CFrame.new(-8987.041015625, 215.862060546875, 5886.71044921875))
					elseif plr.Character:FindFirstChild("RaceTransformed").Value == false then
						local v929 = GetConnectionEnemies(t34)

						if v929 then
							while true do
								wait()
								t9.Kill(v929, _G.AcientOne)

								if _G.AcientOne == false then
									break
								elseif v929.Humanoid.Health <= 0 or not v929.Parent then
									break
								end
							end
						else
							_tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
						end
					end
				end
			end
		end)
	end
end)
t16.Race:AddButton({
	Name = "Teleport to Temple of Time",
	Description = "",
	Callback = function()
		local LocalPlayer4 = game:GetService("Players").LocalPlayer
		local HumanoidRootPart = LocalPlayer4.Character and LocalPlayer4.Character:FindFirstChild("HumanoidRootPart")

		if HumanoidRootPart then
			HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
		end

		if not game:GetService("Workspace").Map:FindFirstChild("Temple of Time") and World3 then
			local MapStash = game:GetService("ReplicatedStorage"):FindFirstChild("MapStash")

			if MapStash and MapStash:FindFirstChild("Temple of Time") then
				MapStash["Temple of Time"].Parent = workspace.Map
			end
		end
	end
})
t16.Race:AddButton({
	Name = "Teleport to Ancient One",
	Description = "",
	Callback = function()
		local LocalPlayer4 = game:GetService("Players").LocalPlayer
		local HumanoidRootPart = LocalPlayer4.Character and LocalPlayer4.Character:FindFirstChild("HumanoidRootPart")

		if HumanoidRootPart then
			HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
		end

		if not game:GetService("Workspace").Map:FindFirstChild("Temple of Time") and World3 then
			local MapStash = game:GetService("ReplicatedStorage"):FindFirstChild("MapStash")

			if MapStash and MapStash:FindFirstChild("Temple of Time") then
				MapStash["Temple of Time"].Parent = workspace.Map
			end
		end

		task.wait(2)
		tween(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
	end
})
t16.Race:AddButton({
	Name = "Teleport to Ancient Clock",
	Description = "",
	Callback = function()
		local LocalPlayer4 = game:GetService("Players").LocalPlayer
		local HumanoidRootPart = LocalPlayer4.Character and LocalPlayer4.Character:FindFirstChild("HumanoidRootPart")
		local cFrame3 = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
		local cFrame4 = CFrame.new(29549, 15069, -88)

		if HumanoidRootPart then
			HumanoidRootPart.CFrame = cFrame3
		end

		task.delay(2, function()
			_tp(cFrame4)
		end)

		if not workspace.Map:FindFirstChild("Temple of Time") and World3 then
			local MapStash = game:GetService("ReplicatedStorage"):FindFirstChild("MapStash")

			if MapStash and MapStash:FindFirstChild("Temple of Time") then
				MapStash["Temple of Time"].Parent = workspace.Map
			end
		end
	end
})
Doors = t16.Race:AddToggle({
	Name = "Auto Teleport to Race Doors",
	Description = "",
	Default = false,
	Callback = function(p266)
		_G.TPDoor = p266
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.TPDoor then
				if tostring(plr.Data.Race.Value) == "Mink" then
					_tp(CFrame.new(29020.66015625, 14889.4267578125, -379.26828002929688))
				elseif tostring(plr.Data.Race.Value) == "Fishman" then
					_tp(CFrame.new(28224.056640625, 14889.4267578125, -210.58720397949219))
				elseif tostring(plr.Data.Race.Value) == "Cyborg" then
					_tp(CFrame.new(28492.4140625, 14894.4267578125, -422.11001586914062))
				elseif tostring(plr.Data.Race.Value) == "Skypiea" then
					_tp(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
				elseif tostring(plr.Data.Race.Value) == "Ghoul" then
					_tp(CFrame.new(28672.720703125, 14889.1279296875, 454.59616088867188))
				elseif tostring(plr.Data.Race.Value) == "Human" then
					_tp(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
				end
			end
		end)
	end
end)
Trials = t16.Race:AddToggle({
	Name = "Auto Complete Trial Race",
	Description = "",
	Default = false,
	Callback = function(p267)
		_G.Complete_Trials = p267
	end
})
GetSeaBeastTrial = function()
	if not workspace.Map:FindFirstChild("FishmanTrial") then
		return nil
	end

	if workspace._WorldOrigin.Locations:FindFirstChild("Trial of Water") then
		FishmanTrial = workspace._WorldOrigin.Locations:FindFirstChild("Trial of Water")
	end

	if FishmanTrial then
		local next_ = next
		local children, v943 = workspace.SeaBeasts:GetChildren()

		for _, v in next_, children, v943 do
			if v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - FishmanTrial.Position).Magnitude <= 1500 and v.Health.Value > 0 then
				return v
			end
		end
	end
end
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.Complete_Trials and tostring(plr.Data.Race.Value) == "Mink" then
				notween(workspace.Map.MinkTrial.Ceiling.CFrame * CFrame.new(0, -20, 0))
			end
		end)
	end
end)
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.Complete_Trials and tostring(plr.Data.Race.Value) == "Fishman" and GetSeaBeastTrial() then
				while true do
					task.wait()
					spawn(function()
						_tp(CFrame.new(GetSeaBeastTrial().HumanoidRootPart.Position.X, game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y + 300, GetSeaBeastTrial().HumanoidRootPart.Position.Z))
					end)
					MousePos = GetSeaBeastTrial().HumanoidRootPart.Position
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

					if _G.Complete_Trials == false then
						break
					elseif not GetSeaBeastTrial() then
						break
					end
				end
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
			if _G.Complete_Trials then
				if tostring(plr.Data.Race.Value) == "Skypiea" then
					notween(workspace.Map.SkyTrial.Model.FinishPart.CFrame)
				end
			end
		end)
	end
end)
spawn(function()
	while wait(0.1) do
		pcall(function()
			if _G.Complete_Trials and (tostring(plr.Data.Race.Value) == "Human" or tostring(plr.Data.Race.Value) == "Ghoul") then
				local v946 = GetConnectionEnemies({
					"Ancient Vampire",
					"Ancient Zombie"
				})

				if v946 then
					while true do
						wait()
						t9.Kill(v946, _G.Complete_Trials)

						if _G.Complete_Trials == false then
							break
						elseif not v946.Parent or v946.Humanoid.Health <= 0 then
							break
						end
					end
				end
			end
		end)
	end
end)
AutoKill = t16.Race:AddToggle({
	Name = "Auto Kill Player After Trial",
	Description = "",
	Default = false,
	Callback = function(p268)
		_G.Defeating = p268
	end
})
spawn(function()
	while task.wait(Sec) do
		pcall(function()
			if _G.Defeating then
				for _, child in pairs(workspace.Characters:GetChildren()) do
					if child.Name ~= plr.Name and child.Humanoid.Health > 0 and child:FindFirstChild("HumanoidRootPart") and child.Parent and (Root.Position - child.HumanoidRootPart.Position).Magnitude <= 250 then
						while true do
							task.wait()
							EquipWeapon(_G.SelectWeapon)
							_tp(child.HumanoidRootPart.CFrame * CFrame.new(0, 0, 15))
							sethiddenproperty(plr, "SimulationRadius", math.huge)

							if _G.Defeating == false then
								break
							elseif child.Humanoid.Health <= 0 or not child.Parent or not child:FindFirstChild("HumanoidRootPart") or not child:FindFirstChild("Humanoid") then
								break
							end
						end
					end
				end
			end
		end)
	end
end)
t16.Prehistoric:AddSection("Dojo Quest")
t16.Prehistoric:AddButton({
	Title = "Teleport To Dragon Dojo",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, -334.96499633789062))
		topos(CFrame.new(5814.42724609375, 1208.3267822265625, 884.57855224609375))
	end
})
DojoQ = t16.Prehistoric:AddToggle({
	Name = "Auto Dojo Trainer",
	Description = "",
	Default = false,
	Callback = function(p269)
		_G.Dojoo = p269
	end
})
printBeltName = function(p270)
	if type(p270) == "table" and p270.Quest.BeltName then
		return p270.Quest.BeltName
	end
end
spawn(function()
	while wait(Sec) do
		if _G.Dojoo then
			pcall(function()
				local response = replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({ {
					NPC = "Dojo Trainer",
					Command = "RequestQuest"
				} }))
				local v950 = printBeltName(response)

				if debug == false and not response and not v950 then
					_tp(CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875))
					debug = true

					if not response then
						debug = false
						replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({ {
							NPC = "Dojo Trainer",
							Command = "ClaimQuest"
						} }))
					end

					return
				end

				if debug ~= true or not ((CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 50) then
					if not response then
						debug = false
						replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({ {
							NPC = "Dojo Trainer",
							Command = "ClaimQuest"
						} }))
					end

					return
				end

				if v950 == "White" then
					local v951 = GetConnectionEnemies("Skull Slayer")

					if not v951 then
						_tp(CFrame.new(-16759.58984375, 71.283767700195312, 1595.3399658203125))

						if not response then
							debug = false
							replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({ {
								NPC = "Dojo Trainer",
								Command = "ClaimQuest"
							} }))
						end

						return
					end

					repeat
						task.wait()
						t9.Kill(v951, _G.Dojoo)
					until not response or not _G.Dojoo or not t9.Alive(v951)

					if not response then
						debug = false
						replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({ {
							NPC = "Dojo Trainer",
							Command = "ClaimQuest"
						} }))
					end

					return
				end

				if v950 == "Yellow" then
					while true do
						task.wait()
						_G.SeaBeast1 = true
						_G.TerrorShark = true
						_G.Shark = true
						_G.Piranha = true
						_G.MobCrew = true
						_G.FishBoat = true
						_G.SailBoats = true

						if _G.Dojoo then
							if not response then
								break
							end
						else
							break
						end
					end

					_G.SeaBeast1 = false
					_G.TerrorShark = false
					_G.Shark = false
					_G.Piranha = false
					_G.MobCrew = false
					_G.FishBoat = false
					_G.SailBoats = false

					if not response then
						debug = false
						replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({ {
							NPC = "Dojo Trainer",
							Command = "ClaimQuest"
						} }))
					end

					return
				end

				if v950 == "Green" then
					while true do
						task.wait()
						_G.SailBoats = true

						if _G.Dojoo then
							if not response then
								break
							end
						else
							break
						end
					end

					_G.SailBoats = false

					if not response then
						debug = false
						replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({ {
							NPC = "Dojo Trainer",
							Command = "ClaimQuest"
						} }))
					end

					return
				end

				if v950 == "Purple" then
					while true do
						task.wait()
						_G.FarmEliteHunt = true

						if _G.Dojoo then
							if not response then
								break
							end
						else
							break
						end
					end

					_G.FarmEliteHunt = false

					if not response then
						debug = false
						replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({ {
							NPC = "Dojo Trainer",
							Command = "ClaimQuest"
						} }))
					end

					return
				end

				if v950 == "Red" then
					while true do
						task.wait()
						_G.SailBoats = true
						_G.FishBoat = true

						if _G.Dojoo then
							if not response then
								break
							end
						else
							break
						end
					end

					_G.SailBoats = false
					_G.FishBoat = false

					if not response then
						debug = false
						replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({ {
							NPC = "Dojo Trainer",
							Command = "ClaimQuest"
						} }))
					end

					return
				end

				if v950 ~= "Black" then
					if v950 ~= "Orange" then
						if v950 ~= "Blue" then
							if not response then
								debug = false
								replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({ {
									NPC = "Dojo Trainer",
									Command = "ClaimQuest"
								} }))
							end

							return
						end
					end

					return nil
				end

				repeat
					task.wait()

					local ActivationPrompt

					if workspace.Map:FindFirstChild("PrehistoricIsland") then
						_G.Prehis_Find = true
						ActivationPrompt = workspace.Map.PrehistoricIsland.Core.ActivationPrompt

						if ActivationPrompt:FindFirstChild("ProximityPrompt", true) then
							_G.Prehis_Skills = false
							_G.Prehis_Find = true
						else
							_G.Prehis_Skills = true
							_G.Prehis_Find = false
						end

						if not _G.Dojoo or not response then
							break
						end
					elseif workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
						_G.Prehis_Find = true
						ActivationPrompt = workspace.Map.PrehistoricIsland.Core.ActivationPrompt

						if ActivationPrompt:FindFirstChild("ProximityPrompt", true) then
							_G.Prehis_Skills = false
							_G.Prehis_Find = true
						else
							_G.Prehis_Skills = true
							_G.Prehis_Find = false
						end
					else
						_G.Prehis_Find = true
						_G.Prehis_Skills = false
					end
				until not _G.Dojoo or not response

				_G.Prehis_Find = false
				_G.Prehis_Skills = false

				if not response then
					debug = false
					replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({ {
						NPC = "Dojo Trainer",
						Command = "ClaimQuest"
					} }))
				end
			end)
		end
	end
end)
BlazeEM = t16.Prehistoric:AddToggle({
	Name = "Auto Dragon Hunter",
	Description = "",
	Default = false,
	Callback = function(p271)
		_G.FarmBlazeEM = p271
	end
})
checkQuesta = function()
	local t35 = { {
		Context = "Check"
	} }
	local response

	pcall(function()
		game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/DragonHunter"):InvokeServer(unpack({ {
			Context = "RequestQuest"
		} }))
	end)

	local _ = pcall(function()
		response = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/DragonHunter"):InvokeServer(unpack(t35))
	end)
	local v957 = false
	local v958
	local v959
	local n9

	if response and response.Text then
		v957 = true

		local Text = response.Text

		if string.find(tostring(Text), "Defeat") then
			n9 = 1

			local v962 = string.sub(tostring(Text), 8, 9)

			v958 = tonumber(v962)

			for _, v in pairs({
				"Hydra Enforcer",
				"Venomous Assailant"
			}) do
				if string.find(Text, v) then
					v959 = v

					break
				end
			end
		elseif string.find(tostring(Text), "Destroy") then
			v958 = 10
			n9 = 2
			v959 = nil
		end
	end

	return v957, v959, v958, n9
end
BackTODoJo = function()
	for _, child in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
		if child.Name == "NotificationTemplate" and string.find(child.Text, "Head back to the Dojo to complete more tasks") then
			return true
		end
	end

	return false
end
DragonMobClear = function(p272, p273, p274)
	if workspace.Enemies:FindFirstChild(p273) then
		for _, child in pairs(workspace.Enemies:GetChildren()) do
			if child.Name == p273 and t9.Alive(child) and p272 then
				t9.Kill(child, p272)
			end
		end
	else
		_tp(p274)
	end
end
spawn(function()
	while wait() do
		if _G.FarmBlazeEM then
			pcall(function()
				local v969, v970, _, v972 = checkQuesta()

				if v969 ~= true or BackTODoJo() then
					_tp(CFrame.new(5813, 1208, 884))
					DragonMobClear(false, nil, nil)
				elseif v972 == 1 then
					if v970 == "Hydra Enforcer" or v970 == "Venomous Assailant" then
						while true do
							wait()
							DragonMobClear(true, v970, CFrame.new(4620.61572265625, 1002.2954711914062, 399.08688354492188))

							if _G.FarmBlazeEM then
								if BackTODoJo() then
									break
								end
							else
								break
							end
						end
					end
				elseif v972 == 2 then
					if workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true) then
						repeat
							wait()
							spawn(function()
								_tp(workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).CFrame * CFrame.new(4, 0, 0))
							end)

							if (workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).Position - Root.Position).Magnitude <= 200 then
								MousePos = workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).Position
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
						until not _G.FarmBlazeEM or BackTODoJo()
					end
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
t16.Prehistoric:AddSection("Drago Trial")
GetQuestDracoLevel = function()
	return replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({ {
		NPC = "Dragon Wizard",
		Command = "Upgrade"
	} }))
end
Toggle = t16.Prehistoric:AddToggle({
	Name = "Tween To Upgrade Droco Trial",
	Description = "",
	Default = false,
	Callback = function(p275)
		_G.UPGDrago = p275
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.UPGDrago then
				if GetQuestDracoLevel() == false then
					return nil
				end

				if GetQuestDracoLevel() == true then
					if (CFrame.new(5814.42724609375, 1208.3267822265625, 884.57855224609375).Position - Root.Position).Magnitude >= 300 then
						_tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.57855224609375))
					else
						_tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.57855224609375))
						replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({ {
							NPC = "Dragon Wizard",
							Command = "Upgrade"
						} }))
					end
				end
			end
		end)
	end
end)
Toggle = t16.Prehistoric:AddToggle({
	Name = "Auto Drago (V1)",
	Description = "",
	Default = false,
	Callback = function(p276)
		_G.DragoV1 = p276
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.DragoV1 and GetM("Dragon Egg") <= 0 then
				while true do
					wait()
					_G.Prehis_Find = true
					_G.Prehis_Skills = true
					_G.Prehis_DE = true

					if _G.DragoV1 then
						if GetM("Dragon Egg") >= 1 then
							break
						end
					else
						break
					end
				end

				_G.Prehis_Find = false
				_G.Prehis_Skills = false
				_G.Prehis_DE = false
			end
		end)
	end
end)
fireflower = t16.Prehistoric:AddToggle({
	Name = "Auto Drago (V2)",
	Description = "",
	Default = false,
	Callback = function(p277)
		_G.AutoFireFlowers = p277
	end
})
spawn(function()
	while wait(Sec) do
		if _G.AutoFireFlowers then
			local FireFlowers = workspace:FindFirstChild("FireFlowers")
			local v974 = GetConnectionEnemies("Forest Pirate")

			if v974 then
				while true do
					wait()
					t9.Kill(v974, _G.AutoFireFlowers)

					if _G.AutoFireFlowers and v974.Parent then
						if v974.Humanoid.Health <= 0 or FireFlowers then
							break
						end
					else
						break
					end
				end
			else
				_tp(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
			end

			if FireFlowers then
				for _, child in pairs(FireFlowers:GetChildren()) do
					if child:IsA("Model") then
						if child.PrimaryPart then
							local Position = child.PrimaryPart.Position

							if (Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
								vim1:SendKeyEvent(true, "E", false, game)
								wait(1.5)
								vim1:SendKeyEvent(false, "E", false, game)
							else
								_tp(CFrame.new(Position))
							end
						end
					end
				end
			end
		end
	end
end)
Toggle = t16.Prehistoric:AddToggle({
	Name = "Auto Drago (V3)",
	Description = "",
	Default = false,
	Callback = function(p278)
		_G.DragoV3 = p278
	end
})
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
Toggle = t16.Prehistoric:AddToggle({
	Name = "Auto Relic Drago Trial [Beta]",
	Description = "",
	Default = false,
	Callback = function(p279)
		_G.Relic123 = p279
	end
})
spawn(function()
	while wait(Sec) do
		if _G.Relic123 then
			pcall(function()
				if workspace.Map:FindFirstChild("DracoTrial") then
					replicated.Remotes.DracoTrial:InvokeServer()
					wait(0.5)

					while true do
						wait()
						_tp(CFrame.new(-39934.9765625, 10685.359375, 22999.34375))

						if _G.Relic123 then
							if Root.Position == CFrame.new(-39934.9765625, 10685.359375, 22999.34375).Position then
								break
							end
						else
							break
						end
					end

					while true do
						wait()
						_tp(CFrame.new(-40511.25390625, 9376.4013671875, 23458.37890625))

						if _G.Relic123 then
							if Root.Position == CFrame.new(-40511.25390625, 9376.4013671875, 23458.37890625).Position then
								break
							end
						else
							break
						end
					end

					wait(2.5)

					while true do
						wait()
						_tp(CFrame.new(-39914.65625, 10685.384765625, 23000.177734375))

						if _G.Relic123 then
							if Root.Position == CFrame.new(-39914.65625, 10685.384765625, 23000.177734375).Position then
								break
							end
						else
							break
						end
					end

					while true do
						wait()
						_tp(CFrame.new(-40045.83203125, 9376.3984375, 22791.287109375))

						if _G.Relic123 then
							if Root.Position == CFrame.new(-40045.83203125, 9376.3984375, 22791.287109375).Position then
								break
							end
						else
							break
						end
					end

					wait(2.5)

					while true do
						wait()
						_tp(CFrame.new(-39908.5, 10685.4052734375, 22990.04296875))

						if _G.Relic123 then
							if Root.Position == CFrame.new(-39908.5, 10685.4052734375, 22990.04296875).Position then
								break
							end
						else
							break
						end
					end

					while true do
						wait()
						_tp(CFrame.new(-39609.5, 9376.400390625, 23472.94335975))

						if _G.Relic123 then
							if Root.Position == CFrame.new(-39609.5, 9376.400390625, 23472.94335975).Position then
								break
							end
						else
							break
						end
					end
				else
					local TrialTeleport = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")

					if TrialTeleport then
						if TrialTeleport:IsA("Part") then
							_tp(CFrame.new(TrialTeleport.Position))
						end
					end
				end
			end)
		end
	end
end)
Toggle = t16.Prehistoric:AddToggle({
	Name = "Auto Train Drago v4",
	Description = "",
	Default = false,
	Callback = function(p280)
		_G.TrainDrago = p280
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.TrainDrago then
				local t36 = {
					"Venomous Assailant",
					"Hydra Enforcer"
				}

				for i = 1, #t36 do
					if plr.Character:FindFirstChild("RaceEnergy").Value == 1 then
						vim1:SendKeyEvent(true, "Y", false, game)
						replicated.Remotes.CommF_:InvokeServer("UpgradeRace", "Buy", 2)
						_tp(CFrame.new(4620.61572265625, 1002.2954711914062, 399.08688354492188))
					elseif plr.Character:FindFirstChild("RaceTransformed").Value == false then
						local v981 = GetConnectionEnemies(t36)

						if v981 then
							while true do
								wait()
								t9.Kill(v981, _G.TrainDrago)

								if _G.TrainDrago == false then
									break
								elseif v981.Humanoid.Health <= 0 or not v981.Parent then
									break
								end
							end
						else
							_tp(CFrame.new(4620.61572265625, 1002.2954711914062, 399.08688354492188))
						end
					end
				end
			end
		end)
	end
end)
dragoTpVolcano = t16.Prehistoric:AddToggle({
	Name = "Tween to Drago Trials",
	Description = "",
	Default = false,
	Callback = function(p281)
		_G.TpDrago_Prehis = p281
	end
})
spawn(function()
	while wait(Sec) do
		if _G.TpDrago_Prehis then
			local TrialTeleport = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")

			if TrialTeleport and TrialTeleport:IsA("Part") then
				_tp(CFrame.new(TrialTeleport.Position))
			end
		end
	end
end)
bdrago = t16.Prehistoric:AddToggle({
	Name = "Swap Drago Race",
	Description = "",
	Default = false,
	Callback = function(p282)
		_G.BuyDrago = p282
	end
})
spawn(function()
	while wait(Sec) do
		if _G.BuyDrago then
			pcall(function()
				if (CFrame.new(5814.42724609375, 1208.3267822265625, 884.57855224609375).Position - Root.Position).Magnitude >= 300 then
					_tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.57855224609375))
				else
					_tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.57855224609375))
					replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({ {
						NPC = "Dragon Wizard",
						Command = "DragonRace"
					} }))
				end
			end)
		end
	end
end)
UpTalon = t16.Prehistoric:AddToggle({
	Name = "Upgrade Dragon Talon With Uzoth",
	Description = "",
	Default = false,
	Callback = function(p283)
		_G.DT_Uzoth = p283
	end
})
spawn(function()
	while wait(Sec) do
		if _G.DT_Uzoth then
			local cFrame3 = CFrame.new(5661.89014, 1211.31909, 864.836731, 0.811413169, -1.36805838e-08, -0.584473014, 4.75227395e-08, 1, 4.25682458e-08, 0.584473014, -6.23161966e-08, 0.811413169)

			_tp(cFrame3)

			if (cFrame3.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 25 then
				replicated.Modules.Net["RF/InteractDragonQuest"]:InvokeServer({
					NPC = "Uzoth",
					Command = "Upgrade"
				})
			end
		end
	end
end)
t16.Prehistoric:AddSection("Volcanic Crafting")
t16.Prehistoric:AddButton({
	Name = "Craft Dragonheart",
	Description = "",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
			"CraftItem",
			"Craft",
			"Dragonheart"
		}))
	end
})
t16.Prehistoric:AddButton({
	Name = "Craft Dragonstorm",
	Description = "",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
			"CraftItem",
			"Craft",
			"Dragonstorm"
		}))
	end
})
t16.Prehistoric:AddButton({
	Name = "Craft Dino Hood",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
			"CraftItem",
			"Craft",
			"DinoHood"
		}))
	end
})
t16.Prehistoric:AddButton({
	Name = "Craft T-Rex Skull",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
			"CraftItem",
			"Craft",
			"TRexSkull"
		}))
	end
})
t16.Prehistoric:AddSection("Prehistoric Island")

local v984 = t16.Prehistoric:AddParagraph("Prehistoric Island Status", "")

spawn(function()
	while wait(0.2) do
		if not workspace.Map:FindFirstChild("PrehistoricIsland") then
			if not workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
				v984:SetDesc("Prehistoric Island : False")

				continue
			end
		end

		v984:SetDesc("Prehistoric Island : True")
	end
end)
t16.Prehistoric:AddButton({
	Name = "Craft Volcanic Magnet",
	Callback = function()
		game:GetService("ReplicatedStorage").Modules.Net["RF/Craft"]:InvokeServer("PossibleHardcode", "Volcanic Magnet")
	end
})
t16.Prehistoric:AddToggle({
	Name = "Craft Volcanic Magnet",
	Default = false,
	Callback = function(p284)
		getgenv().AutoCraftVolcanic = p284
	end
})
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
t16.Prehistoric:AddToggle({
	Name = "Auto Find Prehistoric Island",
	Description = "",
	Default = false,
	Callback = function(p285)
		_G.Prehis_Find = p285
	end
})

local u986

spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.Prehis_Find then
				local Character = plr.Character

				if not Character then
					return
				end

				local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
				local Humanoid = Character:FindFirstChild("Humanoid")

				if not HumanoidRootPart or not Humanoid or Humanoid.Health <= 0 then
					return
				end

				local PrehistoricIsland = workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island", true)

				if PrehistoricIsland then
					local HeadTeleport = PrehistoricIsland:FindFirstChild("HeadTeleport", true) or PrehistoricIsland:FindFirstChild("Teleport_Head", true) or PrehistoricIsland:FindFirstChild("Head", true)

					if HeadTeleport then
						local CFrame_ = HeadTeleport.CFrame
						local v993 = CFrame_.Position - CFrame_.LookVector * 40 + Vector3.new(0, 20, 0)

						if (v993 - HumanoidRootPart.Position).Magnitude > 30 then
							_tp(CFrame.new(v993))
						end
					else
						local Position = PrehistoricIsland.CFrame.Position

						_tp(CFrame.new(Position - (Position - HumanoidRootPart.Position).Unit * 250 + Vector3.new(0, 60, 0)))
					end
				else
					local v995 = CheckBoat()

					if not v995 then
						local cFrame3 = CFrame.new(-16927.451, 9.086, 433.864)

						TeleportToTarget(cFrame3)

						if (cFrame3.Position - HumanoidRootPart.Position).Magnitude <= 10 then
							replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat or "Guardian")
						end

						return
					end

					if Humanoid.Sit == false then
						_tp(v995.VehicleSeat.CFrame * CFrame.new(0, 1, 0))

						return
					end

					local cFrame3 = CFrame.new(-10000000, 31, 37016.25)

					u986 = cFrame3

					if CheckEnemiesBoat() then
						_tp(CFrame.new(-10000000, 150, 37016.25))

						return
					elseif CheckTerrorShark() or CheckPirateGrandBrigade() then
						_tp(CFrame.new(-10000000, 150, 37016.25))
					else
						_tp(cFrame3)
					end
				end
			end
		end)
	end
end)
t16.Prehistoric:AddToggle({
	Name = "Auto Start Prehistoric Event",
	Default = false,
	Callback = function(p286)
		_G.AutoStartPrehistoric = p286
	end
})
spawn(function()
	while wait() do
		if _G.AutoStartPrehistoric then
			pcall(function()
				if workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island", true) then
					if workspace.Map:FindFirstChild("PrehistoricIsland", true) then
						local ActivationPrompt = workspace.Map.PrehistoricIsland.Core:FindFirstChild("ActivationPrompt", true)

						if ActivationPrompt and ActivationPrompt:FindFirstChild("ProximityPrompt") then
							if plr:DistanceFromCharacter(ActivationPrompt.CFrame.Position) <= 150 then
								fireproximityprompt(ActivationPrompt.ProximityPrompt, math.huge)
								vim1:SendKeyEvent(true, "E", false, game)
								wait(1.5)
								vim1:SendKeyEvent(false, "E", false, game)
							end

							_tp(ActivationPrompt.CFrame)
						end
					end
				end
			end)
		end
	end
end)
t16.Prehistoric:AddToggle({
	Name = "Auto Patch Prehistoric Event",
	Description = "",
	Default = false,
	Callback = function(p287)
		_G.Prehis_Skills = p287
	end
})
spawn(function()
	while wait(0.3) do
		if _G.Prehis_Skills then
			pcall(function()
				local PrehistoricIsland = workspace.Map:FindFirstChild("PrehistoricIsland")

				if not PrehistoricIsland then
					return
				end

				for _, descendant in pairs(PrehistoricIsland:GetDescendants()) do
					if descendant:IsA("BasePart") or descendant:IsA("MeshPart") then
						if descendant.Name:lower():find("lava") then
							descendant:Destroy()
						end
					end
				end

				local Core = PrehistoricIsland:FindFirstChild("Core")

				if Core then
					local InteriorLava = Core:FindFirstChild("InteriorLava")

					if InteriorLava then
						InteriorLava:Destroy()
					end
				end

				local TrialTeleport = PrehistoricIsland:FindFirstChild("TrialTeleport")

				for _, descendant in pairs(PrehistoricIsland:GetDescendants()) do
					if descendant.Name == "TouchInterest" and (not TrialTeleport or not descendant:IsDescendantOf(TrialTeleport)) then
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
				local v1007 = GetConnectionEnemies("Lava Golem")

				if v1007 then
					if v1007:FindFirstChild("Humanoid") then
						while true do
							wait(0.1)
							t9.Kill(v1007, true)
							v1007.Humanoid:ChangeState(15)

							if _G.Prehis_Skills then
								if not v1007.Parent or v1007.Humanoid.Health <= 0 then
									break
								end
							else
								break
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
		if _G.Prehis_Skills then
			pcall(function()
				local PrehistoricIsland = workspace.Map:FindFirstChild("PrehistoricIsland")

				if not PrehistoricIsland then
					return
				end

				local Core = PrehistoricIsland:FindFirstChild("Core")

				if not Core then
					return
				end

				local VolcanoRocks = Core:FindFirstChild("VolcanoRocks")

				if not VolcanoRocks then
					return
				end

				for _, child in pairs(VolcanoRocks:GetChildren()) do
					local VFXLayer = child:FindFirstChild("VFXLayer")
					local At0 = VFXLayer and VFXLayer:FindFirstChild("At0")
					local Glow = At0 and At0:FindFirstChild("Glow")

					if Glow and Glow.Enabled then
						repeat
							wait(0.1)
							_tp(VFXLayer.CFrame)

							if plr:DistanceFromCharacter(VFXLayer.CFrame.Position) <= 150 then
								MousePos = VFXLayer.CFrame.Position
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
							end
						until not _G.Prehis_Skills or not Glow.Enabled
					end
				end
			end)
		end
	end
end)
Kaura = t16.Prehistoric:AddToggle({
	Name = "Kill Aura",
	Description = "",
	Default = false,
	Callback = function(p288)
		_G.KillAuraFull = p288
	end
})
spawn(function()
	while task.wait(2) do
		if _G.KillAuraFull then
			pcall(function()
				local LocalPlayer4 = game.Players.LocalPlayer
				local Character = LocalPlayer4.Character
				local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

				if not HumanoidRootPart then
					return
				end

				sethiddenproperty(LocalPlayer4, "SimulationRadius", math.huge)

				for _, child in pairs(workspace.Enemies:GetChildren()) do
					if child:FindFirstChild("Humanoid") and child:FindFirstChild("HumanoidRootPart") and (child.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude <= 500 and child.Humanoid.Health > 0 then
						child.Humanoid.Health = 0
						child.HumanoidRootPart.CanCollide = false
						child:BreakJoints()
					end
				end
			end)
		end
	end
end)
Vocan = t16.Prehistoric:AddToggle({
	Name = "Auto Collect Dino Bones",
	Description = "",
	Default = false,
	Callback = function(p289)
		_G.Prehis_DB = p289
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.Prehis_DB then
				if workspace:FindFirstChild("DinoBone") then
					for _, child in pairs(workspace:GetChildren()) do
						if child.Name == "DinoBone" then
							_tp(child.CFrame)
						end
					end
				end
			end
		end)
	end
end)
Vocan = t16.Prehistoric:AddToggle({
	Name = "Auto Collect Dragon Eggs",
	Description = "",
	Default = false,
	Callback = function(p290)
		_G.Prehis_DE = p290
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.Prehis_DE then
				if workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:FindFirstChild("DragonEgg") then
					_tp(workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:FindFirstChild("DragonEgg").Molten.CFrame)
					fireproximityprompt(workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs.DragonEgg.Molten.ProximityPrompt, 30)
				end
			end
		end)
	end
end)
Toggle = t16.Prehistoric:AddToggle({
	Name = "Auto Reset When Complete Volcano",
	Description = "",
	Default = false,
	Callback = function(p291)
		_G.ResetPH = p291
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.ResetPH and not _G.Level then
				local TrialTeleport = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")

				if TrialTeleport and TrialTeleport:FindFirstChild("TouchInterest") then
					plr.Character.Humanoid.Health = 0
				elseif workspace:FindFirstChild("DinoBone") then
					for _, child in pairs(workspace:GetChildren()) do
						if child.Name == "DinoBone" then
							_tp(child.CFrame)
						end
					end
				end
			end
		end)
	end
end)
t16.SeaEvent:AddSection("Sea Event / Setting Sail")

local t37 = {
	"Guardian",
	"PirateGrandBrigade",
	"MarineGrandBrigade",
	"PirateBrigade",
	"MarineBrigade",
	"PirateSloop",
	"MarineSloop",
	"Beast Hunter"
}

t16.SeaEvent:AddButton({
	Name = "Remove Lighting Effect",
	Callback = function()
		game:GetService("Lighting").BaseAtmosphere:Destroy()
	end
})
t16.SeaEvent:AddToggle({
	Name = "Ship Speed Modifier",
	Default = false,
	Callback = function(p292)
		getgenv().SpeedBoat = p292
	end
})
game:GetService("RunService").RenderStepped:Connect(function()
	if getgenv().SpeedBoat then
		local LocalPlayer4 = game:GetService("Players").LocalPlayer

		if LocalPlayer4.Character then
			if LocalPlayer4.Character:FindFirstChild("Humanoid") and LocalPlayer4.Character.Humanoid.Sit then
				for _, child in pairs(game:GetService("Workspace").Boats:GetChildren()) do
					local VehicleSeat = child:FindFirstChildWhichIsA("VehicleSeat")

					if VehicleSeat then
						VehicleSeat.MaxSpeed = SetSpeedBoat
					end
				end
			end
		end
	end
end)
t16.SeaEvent:AddSlider({
	Name = "Ship Speed",
	Min = 0,
	Max = 1000,
	Increment = 1,
	Default = 300,
	Callback = function(p293)
		SetSpeedBoat = p293
	end
})
t16.SeaEvent:AddToggle({
	Name = "Auto Press W",
	Default = false,
	Callback = function(p294)
		getgenv().AutoPressW = p294
	end
})
spawn(function()
	while wait() do
		pcall(function()
			if getgenv().AutoPressW then
				if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
					game:GetService("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
				end
			end
		end)
	end
end)
t16.SeaEvent:AddToggle({
	Name = "No Clip Ship",
	Default = false,
	Callback = function(p295)
		getgenv().NoClipShip = p295
	end
})
spawn(function()
	while wait() do
		pcall(function()
			for _, child in pairs(game:GetService("Workspace").Boats:GetChildren()) do
				for _, descendant in pairs(child:GetDescendants()) do
					if descendant:IsA("BasePart") then
						if getgenv().NoClipShip or getgenv().FindPrehistoric then
							descendant.CanCollide = false
						else
							descendant.CanCollide = true
						end
					end
				end
			end
		end)
	end
end)
t16.SeaEvent:AddSection("Crafting Items")
t16.SeaEvent:AddButton({
	Name = "Craft SharkTooth",
	Description = "",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
			"CraftItem",
			"Craft",
			"SharkTooth"
		}))
	end
})
t16.SeaEvent:AddButton({
	Name = "Craft TerrorJaw",
	Description = "",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
			"CraftItem",
			"Craft",
			"TerrorJaw"
		}))
	end
})
t16.SeaEvent:AddButton({
	Name = "Craft SharkAnchor",
	Description = "",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
			"CraftItem",
			"Craft",
			"SharkAnchor"
		}))
	end
})
t16.SeaEvent:AddButton({
	Name = "Craft LeviathanCrown",
	Description = "",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
			"CraftItem",
			"Craft",
			"LeviathanCrown"
		}))
	end
})
t16.SeaEvent:AddButton({
	Name = "Craft LeviathanShield",
	Description = "",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
			"CraftItem",
			"Craft",
			"LeviathanShield"
		}))
	end
})
t16.SeaEvent:AddButton({
	Name = "Craft LeviathanBoat",
	Description = "",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
			"CraftItem",
			"Craft",
			"LeviathanBoat"
		}))
	end
})
t16.SeaEvent:AddButton({
	Name = "Craft LegendaryScroll",
	Description = "",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
			"CraftItem",
			"Craft",
			"LegendaryScroll"
		}))
	end
})
t16.SeaEvent:AddButton({
	Name = "Craft MythicalScroll",
	Description = "",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
			"CraftItem",
			"Craft",
			"MythicalScroll"
		}))
	end
})
t16.SeaEvent:AddSection("Choose Sea Event")
Q = t16.SeaEvent:AddDropdown({
	Name = "Select Boats",
	Options = t37,
	Callback = function(p296)
		_G.SelectedBoat = p296
	end
})
t16.SeaEvent:AddButton({
	Name = "Buy Boats",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
	end
})
Q = t16.SeaEvent:AddDropdown({
	Name = "Select Sea Level",
	Options = {
		"Lv 1",
		"Lv 2",
		"Lv 3",
		"Lv 4",
		"Lv 5",
		"Lv 6",
		"Lv Infinite"
	},
	Callback = function(p297)
		_G.DangerSc = p297
	end
})
Q = t16.SeaEvent:AddToggle({
	Name = "Auto Sail Boat",
	Description = "",
	Default = false,
	Callback = function(p298)
		_G.SailBoats = p298
	end
})
spawn(function()
	while wait() do
		if _G.SailBoats then
			pcall(function()
				local v1035 = CheckBoat()
				local Character

				if not v1035 and (not CheckShark() or not _G.Shark) and (not CheckTerrorShark() or not _G.TerrorShark) and (not CheckFishCrew() or not _G.MobCrew) then
					local ok

					if not CheckPiranha() or not _G.Piranha then
						if CheckEnemiesBoat() and _G.FishBoat or CheckSeaBeast() and _G.SeaBeast1 or _G.PGB and CheckPirateGrandBrigade() or _G.HCM and CheckHauntedCrew() or _G.Leviathan1 and CheckLeviathan() then
							if v1035 and (not CheckShark() or not _G.Shark) and (not CheckTerrorShark() or not _G.TerrorShark) and (not CheckFishCrew() or not _G.MobCrew) and (not CheckPiranha() or not _G.Piranha) and (not CheckEnemiesBoat() or not _G.FishBoat) then
								ok = not CheckSeaBeast()

								if not ok then
									ok = not _G.SeaBeast1

									if ok and (not _G.PGB or not CheckPirateGrandBrigade()) and (not _G.HCM or not CheckHauntedCrew()) and (not _G.Leviathan1 or not CheckLeviathan()) then
										if plr.Character.Humanoid.Sit == false then
											_tp(v1035.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
										else
											if _G.DangerSc == "Lv 1" then
												CFrameSelectedZone = CFrame.new(-21998.375, 30.0006084, -682.309143)
											elseif _G.DangerSc == "Lv 2" then
												CFrameSelectedZone = CFrame.new(-26779.5215, 30.0005474, -822.858032)
											elseif _G.DangerSc == "Lv 3" then
												CFrameSelectedZone = CFrame.new(-31171.957, 30.0001011, -2256.93774)
											elseif _G.DangerSc == "Lv 4" then
												CFrameSelectedZone = CFrame.new(-34054.6875, 30.2187767, -2560.12012)
											elseif _G.DangerSc == "Lv 5" then
												CFrameSelectedZone = CFrame.new(-38887.5547, 30.0004578, -2162.99023)
											elseif _G.DangerSc == "Lv 6" then
												CFrameSelectedZone = CFrame.new(-44541.7617, 30.0003204, -1244.8584)
											elseif _G.DangerSc == "Lv Infinite" then
												CFrameSelectedZone = CFrame.new(-10000000, 31, 37016.25)
											end

											while true do
												wait()

												if not _G.FishBoat and CheckEnemiesBoat() or not _G.PGB and CheckPirateGrandBrigade() or not _G.TerrorShark and CheckTerrorShark() then
													_tp(CFrameSelectedZone * CFrame.new(0, 150, 0))
												else
													_tp(CFrameSelectedZone)
												end

												if _G.SailBoats ~= false and (not CheckShark() or not _G.Shark) and (not CheckTerrorShark() or not _G.TerrorShark) and (not CheckFishCrew() or not _G.MobCrew) and (not CheckPiranha() or not _G.Piranha) and (not CheckSeaBeast() or not _G.SeaBeast1) and (not CheckEnemiesBoat() or not _G.FishBoat) and (not _G.Leviathan1 or not CheckLeviathan()) and (not _G.HCM or not CheckHauntedCrew()) then
													if not _G.PGB or not CheckPirateGrandBrigade() then
														Character = plr.Character

														if Character:WaitForChild("Humanoid").Sit ~= false then
															continue
														end
													end
												end

												break
											end

											plr.Character.Humanoid.Sit = false
										end
									end
								elseif (not _G.PGB or not CheckPirateGrandBrigade()) and (not _G.HCM or not CheckHauntedCrew()) and (not _G.Leviathan1 or not CheckLeviathan()) then
									if plr.Character.Humanoid.Sit == false then
										_tp(v1035.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
									else
										if _G.DangerSc == "Lv 1" then
											CFrameSelectedZone = CFrame.new(-21998.375, 30.0006084, -682.309143)
										elseif _G.DangerSc == "Lv 2" then
											CFrameSelectedZone = CFrame.new(-26779.5215, 30.0005474, -822.858032)
										elseif _G.DangerSc == "Lv 3" then
											CFrameSelectedZone = CFrame.new(-31171.957, 30.0001011, -2256.93774)
										elseif _G.DangerSc == "Lv 4" then
											CFrameSelectedZone = CFrame.new(-34054.6875, 30.2187767, -2560.12012)
										elseif _G.DangerSc == "Lv 5" then
											CFrameSelectedZone = CFrame.new(-38887.5547, 30.0004578, -2162.99023)
										elseif _G.DangerSc == "Lv 6" then
											CFrameSelectedZone = CFrame.new(-44541.7617, 30.0003204, -1244.8584)
										elseif _G.DangerSc == "Lv Infinite" then
											CFrameSelectedZone = CFrame.new(-10000000, 31, 37016.25)
										end

										while true do
											wait()

											if not _G.FishBoat and CheckEnemiesBoat() or not _G.PGB and CheckPirateGrandBrigade() or not _G.TerrorShark and CheckTerrorShark() then
												_tp(CFrameSelectedZone * CFrame.new(0, 150, 0))
											else
												_tp(CFrameSelectedZone)
											end

											if _G.SailBoats ~= false and (not CheckShark() or not _G.Shark) and (not CheckTerrorShark() or not _G.TerrorShark) and (not CheckFishCrew() or not _G.MobCrew) and (not CheckPiranha() or not _G.Piranha) and (not CheckSeaBeast() or not _G.SeaBeast1) and (not CheckEnemiesBoat() or not _G.FishBoat) and (not _G.Leviathan1 or not CheckLeviathan()) and (not _G.HCM or not CheckHauntedCrew()) then
												if not _G.PGB or not CheckPirateGrandBrigade() then
													Character = plr.Character

													if Character:WaitForChild("Humanoid").Sit ~= false then
														continue
													end
												end
											end

											break
										end

										plr.Character.Humanoid.Sit = false
									end
								end
							end
						else
							local cFrame3 = CFrame.new(-16927.451, 9.086, 433.864)

							TeleportToTarget(cFrame3)

							if (cFrame3.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
								replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
							end
						end
					elseif v1035 and (not CheckShark() or not _G.Shark) and (not CheckTerrorShark() or not _G.TerrorShark) and (not CheckFishCrew() or not _G.MobCrew) and (not CheckPiranha() or not _G.Piranha) and (not CheckEnemiesBoat() or not _G.FishBoat) then
						ok = not CheckSeaBeast()

						if not ok then
							ok = not _G.SeaBeast1

							if ok and (not _G.PGB or not CheckPirateGrandBrigade()) and (not _G.HCM or not CheckHauntedCrew()) and (not _G.Leviathan1 or not CheckLeviathan()) then
								if plr.Character.Humanoid.Sit == false then
									_tp(v1035.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
								else
									if _G.DangerSc == "Lv 1" then
										CFrameSelectedZone = CFrame.new(-21998.375, 30.0006084, -682.309143)
									elseif _G.DangerSc == "Lv 2" then
										CFrameSelectedZone = CFrame.new(-26779.5215, 30.0005474, -822.858032)
									elseif _G.DangerSc == "Lv 3" then
										CFrameSelectedZone = CFrame.new(-31171.957, 30.0001011, -2256.93774)
									elseif _G.DangerSc == "Lv 4" then
										CFrameSelectedZone = CFrame.new(-34054.6875, 30.2187767, -2560.12012)
									elseif _G.DangerSc == "Lv 5" then
										CFrameSelectedZone = CFrame.new(-38887.5547, 30.0004578, -2162.99023)
									elseif _G.DangerSc == "Lv 6" then
										CFrameSelectedZone = CFrame.new(-44541.7617, 30.0003204, -1244.8584)
									elseif _G.DangerSc == "Lv Infinite" then
										CFrameSelectedZone = CFrame.new(-10000000, 31, 37016.25)
									end

									while true do
										wait()

										if not _G.FishBoat and CheckEnemiesBoat() or not _G.PGB and CheckPirateGrandBrigade() or not _G.TerrorShark and CheckTerrorShark() then
											_tp(CFrameSelectedZone * CFrame.new(0, 150, 0))
										else
											_tp(CFrameSelectedZone)
										end

										if _G.SailBoats ~= false and (not CheckShark() or not _G.Shark) and (not CheckTerrorShark() or not _G.TerrorShark) and (not CheckFishCrew() or not _G.MobCrew) and (not CheckPiranha() or not _G.Piranha) and (not CheckSeaBeast() or not _G.SeaBeast1) and (not CheckEnemiesBoat() or not _G.FishBoat) and (not _G.Leviathan1 or not CheckLeviathan()) and (not _G.HCM or not CheckHauntedCrew()) then
											if not _G.PGB or not CheckPirateGrandBrigade() then
												Character = plr.Character

												if Character:WaitForChild("Humanoid").Sit ~= false then
													continue
												end
											end
										end

										break
									end

									plr.Character.Humanoid.Sit = false
								end
							end
						elseif (not _G.PGB or not CheckPirateGrandBrigade()) and (not _G.HCM or not CheckHauntedCrew()) and (not _G.Leviathan1 or not CheckLeviathan()) then
							if plr.Character.Humanoid.Sit == false then
								_tp(v1035.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
							else
								if _G.DangerSc == "Lv 1" then
									CFrameSelectedZone = CFrame.new(-21998.375, 30.0006084, -682.309143)
								elseif _G.DangerSc == "Lv 2" then
									CFrameSelectedZone = CFrame.new(-26779.5215, 30.0005474, -822.858032)
								elseif _G.DangerSc == "Lv 3" then
									CFrameSelectedZone = CFrame.new(-31171.957, 30.0001011, -2256.93774)
								elseif _G.DangerSc == "Lv 4" then
									CFrameSelectedZone = CFrame.new(-34054.6875, 30.2187767, -2560.12012)
								elseif _G.DangerSc == "Lv 5" then
									CFrameSelectedZone = CFrame.new(-38887.5547, 30.0004578, -2162.99023)
								elseif _G.DangerSc == "Lv 6" then
									CFrameSelectedZone = CFrame.new(-44541.7617, 30.0003204, -1244.8584)
								elseif _G.DangerSc == "Lv Infinite" then
									CFrameSelectedZone = CFrame.new(-10000000, 31, 37016.25)
								end

								while true do
									wait()

									if not _G.FishBoat and CheckEnemiesBoat() or not _G.PGB and CheckPirateGrandBrigade() or not _G.TerrorShark and CheckTerrorShark() then
										_tp(CFrameSelectedZone * CFrame.new(0, 150, 0))
									else
										_tp(CFrameSelectedZone)
									end

									if _G.SailBoats ~= false and (not CheckShark() or not _G.Shark) and (not CheckTerrorShark() or not _G.TerrorShark) and (not CheckFishCrew() or not _G.MobCrew) and (not CheckPiranha() or not _G.Piranha) and (not CheckSeaBeast() or not _G.SeaBeast1) and (not CheckEnemiesBoat() or not _G.FishBoat) and (not _G.Leviathan1 or not CheckLeviathan()) and (not _G.HCM or not CheckHauntedCrew()) then
										if not _G.PGB or not CheckPirateGrandBrigade() then
											Character = plr.Character

											if Character:WaitForChild("Humanoid").Sit ~= false then
												continue
											end
										end
									end

									break
								end

								plr.Character.Humanoid.Sit = false
							end
						end
					end
				elseif v1035 and (not CheckShark() or not _G.Shark) and (not CheckTerrorShark() or not _G.TerrorShark) and (not CheckFishCrew() or not _G.MobCrew) and (not CheckPiranha() or not _G.Piranha) and (not CheckEnemiesBoat() or not _G.FishBoat) then
					if not CheckSeaBeast() then
						if (not _G.PGB or not CheckPirateGrandBrigade()) and (not _G.HCM or not CheckHauntedCrew()) and (not _G.Leviathan1 or not CheckLeviathan()) then
							if plr.Character.Humanoid.Sit == false then
								_tp(v1035.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
							else
								if _G.DangerSc == "Lv 1" then
									CFrameSelectedZone = CFrame.new(-21998.375, 30.0006084, -682.309143)
								elseif _G.DangerSc == "Lv 2" then
									CFrameSelectedZone = CFrame.new(-26779.5215, 30.0005474, -822.858032)
								elseif _G.DangerSc == "Lv 3" then
									CFrameSelectedZone = CFrame.new(-31171.957, 30.0001011, -2256.93774)
								elseif _G.DangerSc == "Lv 4" then
									CFrameSelectedZone = CFrame.new(-34054.6875, 30.2187767, -2560.12012)
								elseif _G.DangerSc == "Lv 5" then
									CFrameSelectedZone = CFrame.new(-38887.5547, 30.0004578, -2162.99023)
								elseif _G.DangerSc == "Lv 6" then
									CFrameSelectedZone = CFrame.new(-44541.7617, 30.0003204, -1244.8584)
								elseif _G.DangerSc == "Lv Infinite" then
									CFrameSelectedZone = CFrame.new(-10000000, 31, 37016.25)
								end

								while true do
									wait()

									if not _G.FishBoat and CheckEnemiesBoat() or not _G.PGB and CheckPirateGrandBrigade() or not _G.TerrorShark and CheckTerrorShark() then
										_tp(CFrameSelectedZone * CFrame.new(0, 150, 0))
									else
										_tp(CFrameSelectedZone)
									end

									if _G.SailBoats ~= false and (not CheckShark() or not _G.Shark) and (not CheckTerrorShark() or not _G.TerrorShark) and (not CheckFishCrew() or not _G.MobCrew) and (not CheckPiranha() or not _G.Piranha) and (not CheckSeaBeast() or not _G.SeaBeast1) and (not CheckEnemiesBoat() or not _G.FishBoat) and (not _G.Leviathan1 or not CheckLeviathan()) and (not _G.HCM or not CheckHauntedCrew()) then
										if not _G.PGB or not CheckPirateGrandBrigade() then
											Character = plr.Character

											if Character:WaitForChild("Humanoid").Sit ~= false then
												continue
											end
										end
									end

									break
								end

								plr.Character.Humanoid.Sit = false
							end
						end
					elseif not _G.SeaBeast1 and (not _G.PGB or not CheckPirateGrandBrigade()) and (not _G.HCM or not CheckHauntedCrew()) and (not _G.Leviathan1 or not CheckLeviathan()) then
						if plr.Character.Humanoid.Sit == false then
							_tp(v1035.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
						else
							if _G.DangerSc == "Lv 1" then
								CFrameSelectedZone = CFrame.new(-21998.375, 30.0006084, -682.309143)
							elseif _G.DangerSc == "Lv 2" then
								CFrameSelectedZone = CFrame.new(-26779.5215, 30.0005474, -822.858032)
							elseif _G.DangerSc == "Lv 3" then
								CFrameSelectedZone = CFrame.new(-31171.957, 30.0001011, -2256.93774)
							elseif _G.DangerSc == "Lv 4" then
								CFrameSelectedZone = CFrame.new(-34054.6875, 30.2187767, -2560.12012)
							elseif _G.DangerSc == "Lv 5" then
								CFrameSelectedZone = CFrame.new(-38887.5547, 30.0004578, -2162.99023)
							elseif _G.DangerSc == "Lv 6" then
								CFrameSelectedZone = CFrame.new(-44541.7617, 30.0003204, -1244.8584)
							elseif _G.DangerSc == "Lv Infinite" then
								CFrameSelectedZone = CFrame.new(-10000000, 31, 37016.25)
							end

							while true do
								wait()

								if not _G.FishBoat and CheckEnemiesBoat() or not _G.PGB and CheckPirateGrandBrigade() or not _G.TerrorShark and CheckTerrorShark() then
									_tp(CFrameSelectedZone * CFrame.new(0, 150, 0))
								else
									_tp(CFrameSelectedZone)
								end

								if _G.SailBoats ~= false and (not CheckShark() or not _G.Shark) and (not CheckTerrorShark() or not _G.TerrorShark) and (not CheckFishCrew() or not _G.MobCrew) and (not CheckPiranha() or not _G.Piranha) and (not CheckSeaBeast() or not _G.SeaBeast1) and (not CheckEnemiesBoat() or not _G.FishBoat) and (not _G.Leviathan1 or not CheckLeviathan()) and (not _G.HCM or not CheckHauntedCrew()) then
									if not _G.PGB or not CheckPirateGrandBrigade() then
										if plr.Character:WaitForChild("Humanoid").Sit ~= false then
											continue
										end
									end
								end

								break
							end

							plr.Character.Humanoid.Sit = false
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
			for _, child in pairs(workspace.Boats:GetChildren()) do
				for _, descendant in pairs(workspace.Boats[child.Name]:GetDescendants()) do
					if descendant:IsA("BasePart") then
						if _G.SailBoats or _G.Prehis_Find or _G.FindMirage or _G.SailBoat_Hydra or _G.AutofindKitIs then
							descendant.CanCollide = false
						else
							descendant.CanCollide = true
						end
					end
				end
			end
		end)
	end
end)
t16.SeaEvent:AddSection("Entity Sea Event")
t16.SeaEvent:AddToggle({
	Name = "Auto Shark",
	Description = "",
	Default = false,
	Callback = function(p299)
		_G.Shark = p299
	end
})
t16.SeaEvent:AddToggle({
	Name = "Auto Piranha",
	Description = "",
	Default = false,
	Callback = function(p300)
		_G.Piranha = p300
	end
})
t16.SeaEvent:AddToggle({
	Name = "Auto Terror Shark",
	Description = "",
	Default = false,
	Callback = function(p301)
		_G.TerrorShark = p301
	end
})
t16.SeaEvent:AddToggle({
	Name = "Auto Fish Crew Member",
	Description = "",
	Default = false,
	Callback = function(p302)
		_G.MobCrew = p302
	end
})
t16.SeaEvent:AddToggle({
	Name = "Auto Haunted Crew Member",
	Description = "",
	Default = false,
	Callback = function(p303)
		_G.HCM = p303
	end
})
t16.SeaEvent:AddToggle({
	Name = "Auto Attack PirateGrandBrigade",
	Description = "",
	Default = false,
	Callback = function(p304)
		_G.PGB = p304
	end
})
t16.SeaEvent:AddToggle({
	Name = "Auto Attack Fish Boat",
	Description = "",
	Default = false,
	Callback = function(p305)
		_G.FishBoat = p305
	end
})
t16.SeaEvent:AddToggle({
	Name = "Auto Attack Sea Beast",
	Description = "",
	Default = false,
	Callback = function(p306)
		_G.SeaBeast1 = p306
	end
})
spawn(function()
	while wait() do
		pcall(function()
			if _G.Shark then
				local t38 = { "Shark" }

				if CheckShark() then
					for _, child in pairs(workspace.Enemies:GetChildren()) do
						if table.find(t38, child.Name) and t9.Alive(child) then
							while true do
								task.wait()
								t9.Kill(child, _G.Shark)

								if _G.Shark == false then
									break
								elseif not child.Parent or child.Humanoid.Health <= 0 then
									break
								end
							end
						end
					end
				end
			end

			if _G.TerrorShark then
				local t39 = { "Terrorshark" }

				if CheckTerrorShark() then
					for _, child in pairs(workspace.Enemies:GetChildren()) do
						if table.find(t39, child.Name) and t9.Alive(child) then
							while true do
								task.wait()
								t9.KillSea(child, _G.TerrorShark)

								if _G.TerrorShark == false then
									break
								elseif not child.Parent or child.Humanoid.Health <= 0 then
									break
								end
							end
						end
					end
				end
			end

			if _G.Piranha then
				local t40 = { "Piranha" }

				if CheckPiranha() then
					for _, child in pairs(workspace.Enemies:GetChildren()) do
						if table.find(t40, child.Name) and t9.Alive(child) then
							while true do
								task.wait()
								t9.Kill(child, _G.Piranha)

								if _G.Piranha == false or not child.Parent then
									break
								elseif child.Humanoid.Health <= 0 then
									break
								end
							end
						end
					end
				end
			end

			if _G.MobCrew then
				local t41 = { "Fish Crew Member" }

				if CheckFishCrew() then
					for _, child in pairs(workspace.Enemies:GetChildren()) do
						if table.find(t41, child.Name) and t9.Alive(child) then
							while true do
								task.wait()
								t9.Kill(child, _G.MobCrew)

								if _G.MobCrew == false then
									break
								elseif not child.Parent or child.Humanoid.Health <= 0 then
									break
								end
							end
						end
					end
				end
			end

			if _G.HCM then
				local t42 = { "Haunted Crew Member" }

				if CheckHauntedCrew() then
					for _, child in pairs(workspace.Enemies:GetChildren()) do
						if table.find(t42, child.Name) and t9.Alive(child) then
							repeat
								task.wait()
								t9.Kill(child, _G.HCM)

								if _G.HCM == false then
									break
								end

								if not child.Parent then
									break
								end
							until child.Humanoid.Health <= 0
						end
					end
				end
			end

			if _G.SeaBeast1 then
				if workspace.SeaBeasts:FindFirstChild("SeaBeast1") then
					for _, child in pairs(workspace.SeaBeasts:GetChildren()) do
						if child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Health") and child.Health.Value > 0 then
							repeat
								task.wait()
								spawn(function()
									_tp(CFrame.new(child.HumanoidRootPart.Position.X, game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y + 200, child.HumanoidRootPart.Position.Z))
								end)

								if plr:DistanceFromCharacter(child.HumanoidRootPart.CFrame.Position) <= 500 then
									AitSeaSkill_Custom = child.HumanoidRootPart.CFrame
									MousePos = AitSeaSkill_Custom.Position

									if CheckF() then
										weaponSc("Blox Fruit")
										Useskills("Blox Fruit", "Z")
										Useskills("Blox Fruit", "X")
										Useskills("Blox Fruit", "C")
									else
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
									end
								end
							until _G.SeaBeast1 == false or not child:FindFirstChild("HumanoidRootPart") or not child.Parent or child.Health.Value <= 0
						end
					end
				end
			end

			if _G.Leviathan1 then
				if workspace.SeaBeasts:FindFirstChild("Leviathan") then
					for _, child in pairs(workspace.SeaBeasts:GetChildren()) do
						if child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Leviathan Segment") and child:FindFirstChild("Health") and child.Health.Value > 0 then
							repeat
								task.wait()
								spawn(function()
									_tp(CFrame.new(child.HumanoidRootPart.Position.X, game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y + 200, child.HumanoidRootPart.Position.Z))
								end)

								if plr:DistanceFromCharacter(child.HumanoidRootPart.CFrame.Position) <= 500 then
									MousePos = child:FindFirstChild("Leviathan Segment").Position

									if CheckF() then
										weaponSc("Blox Fruit")
										Useskills("Blox Fruit", "Z")
										Useskills("Blox Fruit", "X")
										Useskills("Blox Fruit", "C")
									else
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
									end
								end
							until _G.Leviathan1 == false or not child:FindFirstChild("HumanoidRootPart") or not child.Parent or child.Health.Value <= 0
						end
					end
				end
			end

			if _G.FishBoat and CheckEnemiesBoat() then
				for _, child in pairs(workspace.Enemies:GetChildren()) do
					if child:FindFirstChild("Health") and child.Health.Value > 0 and child:FindFirstChild("VehicleSeat") then
						repeat
							task.wait()
							spawn(function()
								if child.Name == "FishBoat" then
									_tp(child.Engine.CFrame * CFrame.new(0, -50, -25))
								end
							end)

							if plr:DistanceFromCharacter(child.Engine.CFrame.Position) <= 150 then
								AitSeaSkill_Custom = child.Engine.CFrame
								MousePos = AitSeaSkill_Custom.Position

								if CheckF() then
									weaponSc("Blox Fruit")
									Useskills("Blox Fruit", "Z")
									Useskills("Blox Fruit", "X")
									Useskills("Blox Fruit", "C")
								else
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
								end
							end
						until _G.FishBoat == false or not child:FindFirstChild("VehicleSeat") or child.Health.Value <= 0
					end
				end
			end

			if _G.PGB and CheckPirateGrandBrigade() then
				for _, child in pairs(workspace.Enemies:GetChildren()) do
					if child:FindFirstChild("Health") and child.Health.Value > 0 and child:FindFirstChild("VehicleSeat") then
						repeat
							task.wait()
							spawn(function()
								if child.Name == "PirateBrigade" then
									_tp(child.Engine.CFrame * CFrame.new(0, -30, -10))
								elseif child.Name == "PirateGrandBrigade" then
									_tp(child.Engine.CFrame * CFrame.new(0, -50, -50))
								end
							end)

							if plr:DistanceFromCharacter(child.Engine.CFrame.Position) <= 150 then
								AitSeaSkill_Custom = child.Engine.CFrame
								MousePos = AitSeaSkill_Custom.Position

								if CheckF() then
									weaponSc("Blox Fruit")
									Useskills("Blox Fruit", "Z")
									Useskills("Blox Fruit", "X")
									Useskills("Blox Fruit", "C")
								else
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
								end
							end
						until _G.PGB == false or not child:FindFirstChild("VehicleSeat") or child.Health.Value <= 0
					end
				end
			end
		end)
	end
end)
t16.SeaEvent:AddSection("Kitsune Island / Event")

local v1066 = t16.SeaEvent:AddParagraph("Kitsune Island Status", "")

spawn(function()
	while wait(0.2) do
		if not workspace.Map:FindFirstChild("KitsuneIsland") then
			if not workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then
				v1066:SetDesc("Kitsune Island : False")

				continue
			end
		end

		v1066:SetDesc("Kitsune Island : True")
	end
end)
t16.SeaEvent:AddToggle({
	Name = "Auto Find Kitsune Island",
	Description = "",
	Default = false,
	Callback = function(p307)
		_G.AutofindKitIs = p307
	end
})
spawn(function()
	while wait() do
		if _G.AutofindKitIs then
			pcall(function()
				if workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island", true) then
					_tp(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame * CFrame.new(0, 500, 0))
				else
					local v1067 = CheckBoat()

					if not v1067 then
						local cFrame3 = CFrame.new(-16927.451, 9.086, 433.864)

						TeleportToTarget(cFrame3)

						if (cFrame3.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
							replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
						end
					elseif plr.Character.Humanoid.Sit == false then
						_tp(v1067.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
					else
						local cFrame3 = CFrame.new(-10000000, 31, 37016.25)

						while true do
							wait()

							local Locations

							if CheckEnemiesBoat() then
								_tp(CFrame.new(-10000000, 150, 37016.25))

								if _G.AutofindKitIs and not ((cFrame3.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10) then
									Locations = workspace._WorldOrigin.Locations

									if not Locations:FindFirstChild("Kitsune Island") and plr.Character.Humanoid.Sit ~= false then
										continue
									end
								end

								break
							elseif CheckTerrorShark() or CheckPirateGrandBrigade() then
								_tp(CFrame.new(-10000000, 150, 37016.25))
							else
								_tp(CFrame.new(-10000000, 31, 37016.25))
							end

							if _G.AutofindKitIs and not ((cFrame3.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10) then
								Locations = workspace._WorldOrigin.Locations

								if not Locations:FindFirstChild("Kitsune Island") and plr.Character.Humanoid.Sit ~= false then
									continue
								end
							end

							break
						end

						plr.Character.Humanoid.Sit = false
					end
				end
			end)
		end
	end
end)
t16.SeaEvent:AddToggle({
	Name = "Auto Teleport to Shrine Actived",
	Description = "",
	Default = false,
	Callback = function(p308)
		_G.tweenShrine = p308
	end
})
spawn(function()
	while wait(0.1) do
		if _G.tweenShrine then
			pcall(function()
				local KitsuneIsland = workspace.Map:FindFirstChild("KitsuneIsland") or game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island")
				local ShrineActive = KitsuneIsland:FindFirstChild("ShrineActive")

				if ShrineActive then
					local next_ = next
					local descendants, v1075 = ShrineActive:GetDescendants()

					for _, v in next_, descendants, v1075 do
						if v:IsA("BasePart") then
							if v.Name:find("NeonShrinePart") then
								replicated.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()

								while true do
									wait()
									_tp(v.CFrame * CFrame.new(0, 2, 0))

									if _G.tweenShrine == false then
										break
									elseif not KitsuneIsland then
										break
									end
								end
							end
						end
					end
				else
					_tp(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame * CFrame.new(0, 500, 0))
				end
			end)
		end
	end
end)
t16.SeaEvent:AddToggle({
	Name = "Auto Collect Azure Ember",
	Description = "",
	Default = false,
	Callback = function(p309)
		_G.Collect_Ember = p309
	end
})
spawn(function()
	while wait(0.1) do
		if _G.Collect_Ember then
			pcall(function()
				if workspace:WaitForChild("AttachedAzureEmber") then
					notween(workspace:WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame)

					return
				elseif workspace:WaitForChild("EmberTemplate") then
					notween(workspace:WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame)
				else
					_tp(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame * CFrame.new(0, 500, 0))
					replicated.Modules.Net["RF/KitsuneStatuePray"]:InvokeServer()
				end
			end)
		end
	end
end)
t16.SeaEvent:AddToggle({
	Name = "Auto Trade Azure Ember",
	Description = "",
	Default = false,
	Callback = function(p310)
		_G.Trade_Ember = p310
	end
})
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
t16.SeaEvent:AddButton({
	Name = "Trade Items Azure",
	Description = "",
	Callback = function()
		replicated.Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
	end
})
t16.SeaEvent:AddButton({
	Name = "Talk with kitsune statue",
	Description = "",
	Callback = function()
		replicated.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()
	end
})
t16.SeaEvent:AddSection("Frozen Dimension Event")

local v1078 = t16.SeaEvent:AddParagraph("FrozenDimension Status", "")

spawn(function()
	pcall(function()
		while wait(0.2) do
			if workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension") then
				v1078:SetDesc("Frozen Dimension : True")
			else
				v1078:SetDesc("Frozen Dimension : False")
			end
		end
	end)
end)

local v1079 = t16.SeaEvent:AddParagraph("Spy Status", "")

spawn(function()
	while wait(0.2) do
		pcall(function()
			local v1080 = string.match(replicated.Remotes.CommF_:InvokeServer("InfoLeviathan", "1"), "%d+")

			if v1080 then
				v1079:SetDesc("Spy Leviathan : " .. tostring(v1080))

				if tonumber(v1080) == 5 then
					v1079:SetDesc("Spy Leviathan : Already Done!!")
				end
			end
		end)
	end
end)
t16.SeaEvent:AddButton({
	Name = "Buy Spy",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("InfoLeviathan", "2")
	end
})
t16.SeaEvent:AddToggle({
	Name = "Auto Teleport Frozen Dimension",
	Description = "",
	Default = false,
	Callback = function(p311)
		_G.FrozenTP = p311
	end
})
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
t16.SeaEvent:AddToggle({
	Name = "Auto Drive To Hydra Island",
	Description = "",
	Default = false,
	Callback = function(p312)
		_G.SailBoat_Hydra = p312
	end
})
spawn(function()
	while wait() do
		if _G.SailBoat_Hydra then
			pcall(function()
				local v1081 = CheckBoat()

				if not v1081 then
					local cFrame3 = CFrame.new(-16927.451, 9.086, 433.864)

					TeleportToTarget(cFrame3)

					if (cFrame3.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
						replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
					end
				elseif plr.Character.Humanoid.Sit == false then
					_tp(v1081.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
				else
					while true do
						wait()

						if CheckEnemiesBoat() or CheckPirateGrandBrigade() or CheckTerrorShark() then
							_tp(CFrame.new(5433, 150, 290))
						else
							_tp(CFrame.new(5433, 35, 290))
						end

						if _G.SailBoat_Hydra ~= false then
							if plr.Character:WaitForChild("Humanoid").Sit ~= false then
								continue
							end
						end

						break
					end

					plr.Character.Humanoid.Sit = false
				end
			end)
		end
	end
end)
t16.SeaEvent:AddToggle({
	Name = "Auto Attack Leviathan",
	Description = "",
	Default = false,
	Callback = function(p313)
		_G.Leviathan1 = p313
	end
})
t16.Esp:AddSection("Esp")
isnil = function(p314)
	return p314 == nil
end

local function v1083(p315)
	return math.floor(tonumber(p315) + 0.5)
end

Number = math.random(1, 1000000)

local LocalPlayer4 = game:GetService("Players").LocalPlayer
local ReplicatedStorage3 = game:GetService("ReplicatedStorage")
local Team = LocalPlayer4.Team

EspPly = function()
	local children, v1088 = game.Players:GetChildren()

	for _, v in next, children, v1088 do
		pcall(function()
			if not isnil(v.Character) then
				if PlayerEsp then
					local ok = isnil(v.Character.Head)

					if not ok then
						ok = v.Character.Head:FindFirstChild("NameEsp" .. Number)
					end

					if ok then
						if v.Character.Head:FindFirstChild("NameEsp" .. Number) then
							v.Character.Head["NameEsp" .. Number].TextLabel.Text = v.Name .. " | " .. v1083((LocalPlayer4.Character.Head.Position - v.Character.Head.Position).Magnitude / 3) .. " M\nHealth : " .. v1083(v.Character.Humanoid.Health * 100 / v.Character.Humanoid.MaxHealth) .. "%"
						end
					else
						local BillboardGui = Instance.new("BillboardGui", v.Character.Head)

						BillboardGui.Name = "NameEsp" .. Number
						BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
						BillboardGui.Size = UDim2.new(1, 200, 1, 30)
						BillboardGui.Adornee = v.Character.Head
						BillboardGui.AlwaysOnTop = true

						local TextLabel = Instance.new("TextLabel", BillboardGui)

						TextLabel.Font = Enum.Font.Code
						TextLabel.FontSize = "Size14"
						TextLabel.TextWrapped = true
						TextLabel.Text = v.Name .. " \n" .. v1083((LocalPlayer4.Character.Head.Position - v.Character.Head.Position).Magnitude / 3) .. " M"
						TextLabel.Size = UDim2.new(1, 0, 1, 0)
						TextLabel.TextYAlignment = "Top"
						TextLabel.BackgroundTransparency = 1
						TextLabel.TextStrokeTransparency = 0.5

						if v.Team == Team then
							TextLabel.TextColor3 = Color3.new(0, 0, 254)
						else
							TextLabel.TextColor3 = Color3.new(255, 0, 0)
						end
					end
				elseif v.Character.Head:FindFirstChild("NameEsp" .. Number) then
					v.Character.Head:FindFirstChild("NameEsp" .. Number):Destroy()
				end
			end
		end)
	end
end
LocationEsp = function()
	local children, v1095 = workspace._WorldOrigin.Locations:GetChildren()

	for _, v in next, children, v1095 do
		pcall(function()
			if IslandESP then
				if v.Name ~= "Sea" then
					if v:FindFirstChild("NameEsp") then
						v.NameEsp.TextLabel.Text = v.Name .. "   \n" .. v1083((LocalPlayer4.Character.Head.Position - v.Position).Magnitude / 3) .. " M"
					else
						local BillboardGui = Instance.new("BillboardGui", v)

						BillboardGui.Name = "NameEsp"
						BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
						BillboardGui.Size = UDim2.new(1, 200, 1, 30)
						BillboardGui.Adornee = v
						BillboardGui.AlwaysOnTop = true

						local TextLabel = Instance.new("TextLabel", BillboardGui)

						TextLabel.Font = Enum.Font.Code
						TextLabel.FontSize = "Size14"
						TextLabel.TextWrapped = true
						TextLabel.Size = UDim2.new(1, 0, 1, 0)
						TextLabel.TextYAlignment = "Top"
						TextLabel.BackgroundTransparency = 1
						TextLabel.TextStrokeTransparency = 0.5
						TextLabel.TextColor3 = Color3.fromRGB(98, 252, 252)
						TextLabel.Text = v.Name .. "   \n" .. v1083((LocalPlayer4.Character.Head.Position - v.Position).Magnitude / 3) .. " M"
					end
				end
			elseif v:FindFirstChild("NameEsp") then
				v:FindFirstChild("NameEsp"):Destroy()
			end
		end)
	end
end
DevEsp = function()
	local children, v1101 = workspace:GetChildren()

	for _, v in next, children, v1101 do
		pcall(function()
			if DevilFruitESP then
				if string.find(v.Name, "Fruit") then
					if v.Handle:FindFirstChild("NameEsp" .. Number) then
						v.Handle["NameEsp" .. Number].TextLabel.Text = "[" .. v.Name .. "]" .. "   \n" .. v1083((LocalPlayer4.Character.Head.Position - v.Handle.Position).Magnitude / 3) .. " M"
					else
						local BillboardGui = Instance.new("BillboardGui", v.Handle)

						BillboardGui.Name = "NameEsp" .. Number
						BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
						BillboardGui.Size = UDim2.new(1, 200, 1, 30)
						BillboardGui.Adornee = v.Handle
						BillboardGui.AlwaysOnTop = true

						local TextLabel = Instance.new("TextLabel", BillboardGui)

						TextLabel.Font = Enum.Font.Code
						TextLabel.FontSize = "Size14"
						TextLabel.TextWrapped = true
						TextLabel.Size = UDim2.new(1, 0, 1, 0)
						TextLabel.TextYAlignment = "Top"
						TextLabel.BackgroundTransparency = 1
						TextLabel.TextStrokeTransparency = 0.5
						TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel.Text = v.Name .. " \n" .. v1083((LocalPlayer4.Character.Head.Position - v.Handle.Position).Magnitude / 3) .. " M"
					end
				end
			elseif v:FindFirstChild("Handle") then
				if v.Handle:FindFirstChild("NameEsp" .. Number) then
					v.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
				end
			end
		end)
	end
end
flowerEsp = function()
	for _, child in pairs(workspace:GetChildren()) do
		pcall(function()
			if child.Name == "Flower2" or child.Name == "Flower1" then
				if FlowerESP then
					if child:FindFirstChild("NameEsp" .. Number) then
						child["NameEsp" .. Number].TextLabel.Text = child.Name .. "   \n" .. v1083((LocalPlayer4.Character.Head.Position - child.Position).Magnitude / 3) .. " M"
					else
						local BillboardGui = Instance.new("BillboardGui", child)

						BillboardGui.Name = "NameEsp" .. Number
						BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
						BillboardGui.Size = UDim2.new(1, 200, 1, 30)
						BillboardGui.Adornee = child
						BillboardGui.AlwaysOnTop = true

						local TextLabel = Instance.new("TextLabel", BillboardGui)

						TextLabel.Font = Enum.Font.Code
						TextLabel.FontSize = "Size14"
						TextLabel.TextWrapped = true
						TextLabel.Size = UDim2.new(1, 0, 1, 0)
						TextLabel.TextYAlignment = "Top"
						TextLabel.BackgroundTransparency = 1
						TextLabel.TextStrokeTransparency = 0.5
						TextLabel.TextColor3 = Color3.fromRGB(88, 214, 252)

						if child.Name == "Flower1" then
							TextLabel.Text = "Blue Flower" .. " \n" .. v1083((LocalPlayer4.Character.Head.Position - child.Position).Magnitude / 3) .. " M"
						elseif child.Name == "Flower2" then
							TextLabel.Text = "Red Flower" .. " \n" .. v1083((LocalPlayer4.Character.Head.Position - child.Position).Magnitude / 3) .. " M"
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
	for _, child in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
		pcall(function()
			if EspEventIsland then
				if child.Name == "Mirage Island" or child.Name == "Prehistoric Island" or child.Name == "Kitsune Island" then
					if child:FindFirstChild("NameEsp") then
						child.NameEsp.TextLabel.Text = child.Name .. "   \n" .. v1083((LocalPlayer4.Character.Head.Position - child.Position).Magnitude / 3) .. " M"
					else
						local BillboardGui = Instance.new("BillboardGui", child)

						BillboardGui.Name = "NameEsp"
						BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
						BillboardGui.Size = UDim2.new(1, 200, 1, 30)
						BillboardGui.Adornee = child
						BillboardGui.AlwaysOnTop = true

						local TextLabel = Instance.new("TextLabel", BillboardGui)

						TextLabel.Font = "Code"
						TextLabel.FontSize = "Size14"
						TextLabel.TextWrapped = true
						TextLabel.Size = UDim2.new(1, 0, 1, 0)
						TextLabel.TextYAlignment = "Top"
						TextLabel.BackgroundTransparency = 1
						TextLabel.TextStrokeTransparency = 0.5
						TextLabel.TextColor3 = Color3.fromRGB(80, 245, 245)
						TextLabel.Text = child.Name .. "   \n" .. v1083((LocalPlayer4.Character.Head.Position - child.Position).Magnitude / 3) .. " M"
					end
				end
			elseif child:FindFirstChild("NameEsp") then
				child:FindFirstChild("NameEsp"):Destroy()
			end
		end)
	end
end
gearEsp = function()
	for _, descendant in pairs(workspace.Map.MysticIsland:GetDescendants()) do
		pcall(function()
			if ESPGear then
				if descendant.Name == "Part" and descendant.Material == Enum.Material.Neon then
					if descendant:FindFirstChild("NameEsp") then
						descendant.NameEsp.TextLabel.Text = "Gear" .. "   \n" .. v1083((LocalPlayer4.Character.Head.Position - descendant.Position).Magnitude / 3) .. " M"
					else
						local BillboardGui = Instance.new("BillboardGui", descendant)

						BillboardGui.Name = "NameEsp"
						BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
						BillboardGui.Size = UDim2.new(1, 200, 1, 30)
						BillboardGui.Adornee = descendant
						BillboardGui.AlwaysOnTop = true

						local TextLabel = Instance.new("TextLabel", BillboardGui)

						TextLabel.Font = "Code"
						TextLabel.FontSize = "Size14"
						TextLabel.TextWrapped = true
						TextLabel.Size = UDim2.new(1, 0, 1, 0)
						TextLabel.TextYAlignment = "Top"
						TextLabel.BackgroundTransparency = 1
						TextLabel.TextStrokeTransparency = 0.5
						TextLabel.TextColor3 = Color3.fromRGB(80, 245, 245)
						TextLabel.Text = "Gear" .. "   \n" .. v1083((LocalPlayer4.Character.Head.Position - descendant.Position).Magnitude / 3) .. " M"
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
		for _, child in pairs(ReplicatedStorage3.NPCs:GetChildren()) do
			if child.Name == "Advanced Fruit Dealer" then
				if not workspace:FindFirstChild("Adv") then
					Adv = Instance.new("Part")
					Adv.Name = "Adv"
					Adv.Transparency = 1
					Adv.Size = Vector3.new(1, 1, 1)
					Adv.Anchored = true
					Adv.CanCollide = false
					Adv.Parent = workspace
					Adv.CFrame = child.HumanoidRootPart.CFrame
				elseif workspace:FindFirstChild("Adv") then
					if Adv:FindFirstChild("NameEsp") then
						Adv.NameEsp.TextLabel.Text = child.Name .. "   \n" .. v1083((LocalPlayer4.Character.Head.Position - child.HumanoidRootPart.Position).Magnitude / 3) .. " M"
					else
						local BillboardGui = Instance.new("BillboardGui", Adv)

						BillboardGui.Name = "NameEsp"
						BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
						BillboardGui.Size = UDim2.new(1, 200, 1, 30)
						BillboardGui.Adornee = Adv
						BillboardGui.AlwaysOnTop = true

						local TextLabel = Instance.new("TextLabel", BillboardGui)

						TextLabel.Font = "Code"
						TextLabel.FontSize = "Size14"
						TextLabel.TextWrapped = true
						TextLabel.Size = UDim2.new(1, 0, 1, 0)
						TextLabel.TextYAlignment = "Top"
						TextLabel.BackgroundTransparency = 1
						TextLabel.TextStrokeTransparency = 0.5
						TextLabel.TextColor3 = Color3.fromRGB(80, 245, 245)
						TextLabel.Text = child.Name .. "   \n" .. v1083((LocalPlayer4.Character.Head.Position - child.HumanoidRootPart.Position).Magnitude / 3) .. " M"
					end
				end
			end
		end
	elseif workspace:FindFirstChild("Adv") then
		workspace:FindFirstChild("Adv"):Destroy()
	end
end
HakiClorEsp = function()
	if ColorEsp then
		for _, child in pairs(ReplicatedStorage3.NPCs:GetChildren()) do
			if child.Name == "Barista Cousin" then
				if not workspace:FindFirstChild("Gay") then
					Gay = Instance.new("Part")
					Gay.Name = "Gay"
					Gay.Transparency = 1
					Gay.Size = Vector3.new(1, 1, 1)
					Gay.Anchored = true
					Gay.CanCollide = false
					Gay.Parent = workspace
					Gay.CFrame = child.HumanoidRootPart.CFrame
				elseif workspace:FindFirstChild("Gay") then
					if Gay:FindFirstChild("NameEsp") then
						Gay.NameEsp.TextLabel.Text = child.Name .. "   \n" .. v1083((LocalPlayer4.Character.Head.Position - child.HumanoidRootPart.Position).Magnitude / 3) .. " M"
					else
						local BillboardGui = Instance.new("BillboardGui", Gay)

						BillboardGui.Name = "NameEsp"
						BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
						BillboardGui.Size = UDim2.new(1, 200, 1, 30)
						BillboardGui.Adornee = Gay
						BillboardGui.AlwaysOnTop = true

						local TextLabel = Instance.new("TextLabel", BillboardGui)

						TextLabel.Font = "Code"
						TextLabel.FontSize = "Size14"
						TextLabel.TextWrapped = true
						TextLabel.Size = UDim2.new(1, 0, 1, 0)
						TextLabel.TextYAlignment = "Top"
						TextLabel.BackgroundTransparency = 1
						TextLabel.TextStrokeTransparency = 0.5
						TextLabel.TextColor3 = Color3.fromRGB(80, 245, 245)
						TextLabel.Text = child.Name .. "   \n" .. v1083((LocalPlayer4.Character.Head.Position - child.HumanoidRootPart.Position).Magnitude / 3) .. " M"
					end
				end
			end
		end
	elseif workspace:FindFirstChild("Gay") then
		workspace:FindFirstChild("Gay"):Destroy()
	end
end
LegenSword = function()
	if LegenS then
		for _, child in pairs(ReplicatedStorage3.NPCs:GetChildren()) do
			if child.Name == "Legendary Sword Dealer" then
				if not workspace:FindFirstChild("Lgd") then
					Lgd = Instance.new("Part")
					Lgd.Name = "Lgd"
					Lgd.Transparency = 1
					Lgd.Size = Vector3.new(1, 1, 1)
					Lgd.Anchored = true
					Lgd.CanCollide = false
					Lgd.Parent = workspace
					Lgd.CFrame = child.HumanoidRootPart.CFrame
				elseif workspace:FindFirstChild("Lgd") then
					if Lgd:FindFirstChild("NameEsp") then
						Lgd.NameEsp.TextLabel.Text = child.Name .. "   \n" .. v1083((LocalPlayer4.Character.Head.Position - child.HumanoidRootPart.Position).Magnitude / 3) .. " M"
					else
						local BillboardGui = Instance.new("BillboardGui", Lgd)

						BillboardGui.Name = "NameEsp"
						BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
						BillboardGui.Size = UDim2.new(1, 200, 1, 30)
						BillboardGui.Adornee = Lgd
						BillboardGui.AlwaysOnTop = true

						local TextLabel = Instance.new("TextLabel", BillboardGui)

						TextLabel.Font = "Code"
						TextLabel.FontSize = "Size14"
						TextLabel.TextWrapped = true
						TextLabel.Size = UDim2.new(1, 0, 1, 0)
						TextLabel.TextYAlignment = "Top"
						TextLabel.BackgroundTransparency = 1
						TextLabel.TextStrokeTransparency = 0.5
						TextLabel.TextColor3 = Color3.fromRGB(80, 245, 245)
						TextLabel.Text = child.Name .. "   \n" .. v1083((LocalPlayer4.Character.Head.Position - child.HumanoidRootPart.Position).Magnitude / 3) .. " M"
					end
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

		for _, v in ipairs(tagged) do
			pcall(function()
				local Magnitude = (v:GetPivot().Position - LocalPlayer4.Character.Head.Position).Magnitude

				v:GetFullName():gsub("[^%w_]", "_")

				local ChestEspAttachment = v:FindFirstChild("ChestEspAttachment")

				if not ChestEspAttachment then
					local Attachment = Instance.new("Attachment")

					Attachment.Name = "ChestEspAttachment"
					Attachment.Parent = v
					Attachment.Position = Vector3.new(0, 3, 0)

					local BillboardGui = Instance.new("BillboardGui")

					BillboardGui.Name = "NameEsp"
					BillboardGui.Size = UDim2.new(0, 200, 0, 30)
					BillboardGui.Adornee = Attachment
					BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
					BillboardGui.AlwaysOnTop = true
					BillboardGui.Parent = Attachment

					local TextLabel = Instance.new("TextLabel")

					TextLabel.Font = Enum.Font.Code
					TextLabel.TextSize = 14
					TextLabel.TextWrapped = true
					TextLabel.Size = UDim2.new(1, 0, 1, 0)
					TextLabel.TextYAlignment = Enum.TextYAlignment.Top
					TextLabel.BackgroundTransparency = 1
					TextLabel.TextStrokeTransparency = 0.5
					TextLabel.TextColor3 = Color3.fromRGB(80, 245, 245)
					TextLabel.Parent = BillboardGui
				end

				local NameEsp = ChestEspAttachment and ChestEspAttachment:FindFirstChild("NameEsp")

				if NameEsp then
					local v1139 = math.floor(Magnitude / 3)

					NameEsp.TextLabel.Text = string.format("[%s] %d M", v.Name:gsub("Label", ""), v1139)
				end
			end)
		end
	else
		for _, v in ipairs(game:GetService("CollectionService"):GetTagged("_ChestTagged")) do
			local ChestEspAttachment = v:FindFirstChild("ChestEspAttachment")

			if ChestEspAttachment then
				ChestEspAttachment:Destroy()
			end
		end
	end
end
berriesEsp = function()
	if BerryEsp then
		local tagged = game:GetService("CollectionService"):GetTagged("BerryBush")

		for _, v in ipairs(tagged) do
			pcall(function()
				local Position = v.Parent:GetPivot().Position

				for _, v2 in pairs(v:GetAttributes()) do
					if v2 then
						local name = "BerryEspPart_" .. v2 .. "_" .. tostring(Position)
						local Part2 = workspace:FindFirstChild(name)

						if not Part2 then
							Part2 = Instance.new("Part")
							Part2.Name = name
							Part2.Transparency = 1
							Part2.Size = Vector3.new(1, 1, 1)
							Part2.Anchored = true
							Part2.CanCollide = false
							Part2.Parent = workspace
							Part2.CFrame = CFrame.new(Position)
						end

						if not Part2:FindFirstChild("NameEsp") then
							local BillboardGui = Instance.new("BillboardGui", Part2)

							BillboardGui.Name = "NameEsp"
							BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
							BillboardGui.Size = UDim2.new(0, 200, 0, 30)
							BillboardGui.Adornee = Part2
							BillboardGui.AlwaysOnTop = true

							local TextLabel = Instance.new("TextLabel", BillboardGui)

							TextLabel.Font = Enum.Font.Code
							TextLabel.TextSize = 14
							TextLabel.TextWrapped = true
							TextLabel.Size = UDim2.new(1, 0, 1, 0)
							TextLabel.TextYAlignment = Enum.TextYAlignment.Top
							TextLabel.BackgroundTransparency = 1
							TextLabel.TextStrokeTransparency = 0.5
							TextLabel.TextColor3 = Color3.fromRGB(80, 245, 245)
						end

						local NameEsp = Part2:FindFirstChild("NameEsp")
						local v1154 = (LocalPlayer4.Character.Head.Position - Position).Magnitude / 3

						if NameEsp then
							NameEsp.TextLabel.Text = "[" .. v2 .. "]" .. " " .. math.round(v1154) .. " M"
						end
					end
				end
			end)
		end
	else
		for _, child in ipairs(workspace:GetChildren()) do
			if child:IsA("Part") then
				if child.Name:match("BerryEspPart_.*") then
					child:Destroy()
				end
			end
		end
	end
end
t16.Esp:AddToggle({
	Name = "Esp Berry",
	Description = "",
	Default = false,
	Callback = function(p316)
		BerryEsp = p316

		if p316 then
			task.spawn(function()
				while BerryEsp do
					berriesEsp()
					task.wait()
				end
			end)
		else
			for _, child in ipairs(workspace:GetChildren()) do
				if child:IsA("Part") then
					if child.Name:match("BerryEspPart_.*") then
						child:Destroy()
					end
				end
			end
		end
	end
})
t16.Esp:AddToggle({
	Name = "Esp Player",
	Description = "",
	Default = false,
	Callback = function(p317)
		PlayerEsp = p317

		if p317 then
			task.spawn(function()
				while PlayerEsp do
					EspPly()
					task.wait()
				end
			end)
		else
			local next_ = next
			local children, v1161 = game.Players:GetChildren()

			for _, v in next_, children, v1161 do
				pcall(function()
					if not isnil(v.Character) and not isnil(v.Character.Head) then
						if v.Character.Head:FindFirstChild("NameEsp" .. Number) then
							v.Character.Head:FindFirstChild("NameEsp" .. Number):Destroy()
						end
					end
				end)
			end
		end
	end
})
t16.Esp:AddToggle({
	Name = "Esp Chest",
	Description = "",
	Default = false,
	Callback = function(p318)
		ChestESP = p318

		if p318 then
			task.spawn(function()
				while ChestESP do
					ChestEsp()
					task.wait()
				end
			end)
		else
			for _, v in ipairs(game:GetService("CollectionService"):GetTagged("_ChestTagged")) do
				local ChestEspAttachment = v:FindFirstChild("ChestEspAttachment")

				if ChestEspAttachment then
					ChestEspAttachment:Destroy()
				end
			end
		end
	end
})
t16.Esp:AddToggle({
	Name = "Esp Fruit",
	Description = "",
	Default = false,
	Callback = function(p319)
		DevilFruitESP = p319

		if p319 then
			task.spawn(function()
				while DevilFruitESP do
					DevEsp()
					task.wait()
				end
			end)
		else
			local next_ = next
			local children, v1169 = workspace:GetChildren()

			for _, v in next_, children, v1169 do
				pcall(function()
					if v:FindFirstChild("Handle") then
						if v.Handle:FindFirstChild("NameEsp" .. Number) then
							v.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
						end
					end
				end)
			end
		end
	end
})
t16.Esp:AddToggle({
	Name = "Esp Island",
	Description = "",
	Default = false,
	Callback = function(p320)
		IslandESP = p320

		if p320 then
			task.spawn(function()
				while IslandESP do
					LocationEsp()
					task.wait()
				end
			end)
		else
			local next_ = next
			local children, v1174 = workspace._WorldOrigin.Locations:GetChildren()

			for _, v in next_, children, v1174 do
				pcall(function()
					if v:FindFirstChild("NameEsp") then
						v:FindFirstChild("NameEsp"):Destroy()
					end
				end)
			end
		end
	end
})
t16.Esp:AddToggle({
	Name = "Esp Flower",
	Description = "",
	Default = false,
	Callback = function(p321)
		FlowerESP = p321

		if p321 then
			task.spawn(function()
				while FlowerESP do
					flowerEsp()
					task.wait()
				end
			end)
		else
			for _, child in pairs(workspace:GetChildren()) do
				pcall(function()
					if (child.Name == "Flower2" or child.Name == "Flower1") and child:FindFirstChild("NameEsp" .. Number) then
						child:FindFirstChild("NameEsp" .. Number):Destroy()
					end
				end)
			end
		end
	end
})
t16.Esp:AddToggle({
	Name = "Esp Legendary Sword",
	Description = "",
	Default = false,
	Callback = function(p322)
		LegenS = p322

		if p322 then
			task.spawn(function()
				while LegenS do
					LegenSword()
					task.wait()
				end
			end)
		elseif workspace:FindFirstChild("Lgd") then
			workspace:FindFirstChild("Lgd"):Destroy()
		end
	end
})
t16.Esp:AddToggle({
	Name = "Esp Haki Color",
	Description = "",
	Default = false,
	Callback = function(p323)
		ColorEsp = p323

		if p323 then
			task.spawn(function()
				while ColorEsp do
					HakiClorEsp()
					task.wait()
				end
			end)
		elseif workspace:FindFirstChild("Gay") then
			workspace:FindFirstChild("Gay"):Destroy()
		end
	end
})
t16.Esp:AddToggle({
	Name = "Esp Gear",
	Description = "",
	Default = false,
	Callback = function(p324)
		ESPGear = p324

		if p324 then
			task.spawn(function()
				while ESPGear do
					gearEsp()
					task.wait()
				end
			end)
		else
			for _, descendant in pairs(workspace.Map.MysticIsland:GetDescendants()) do
				pcall(function()
					if descendant:FindFirstChild("NameEsp") then
						descendant:FindFirstChild("NameEsp"):Destroy()
					end
				end)
			end
		end
	end
})
t16.Esp:AddToggle({
	Name = "Esp SeaEvent Island",
	Description = "",
	Default = false,
	Callback = function(p325)
		EspEventIsland = p325

		if p325 then
			task.spawn(function()
				while EspEventIsland do
					EventIslandEsp()
					task.wait()
				end
			end)
		else
			for _, child in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
				pcall(function()
					if child:FindFirstChild("NameEsp") then
						child:FindFirstChild("NameEsp"):Destroy()
					end
				end)
			end
		end
	end
})
t16.Esp:AddToggle({
	Name = "Esp Advanced Dealer",
	Description = "",
	Default = false,
	Callback = function(p326)
		advanEsp = p326

		if p326 then
			task.spawn(function()
				while advanEsp do
					AdvanFruitEsp()
					task.wait()
				end
			end)
		elseif workspace:FindFirstChild("Adv") then
			workspace:FindFirstChild("Adv"):Destroy()
		end
	end
})
t16.Raids:AddSection("Fruits Options")

local function v1183(p327)
	local v1184 = tostring(p327)
	local v1185

	repeat
		v1184, v1185 = v1184:gsub("^(-?%d+)(%d%d%d)", "%1,%2")
	until v1185 == 0

	return v1184
end
local function v1186()
	local s12 = "Advance Fruit Stock\n"
	local ok, result = pcall(function()
		return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits", true)
	end)

	if ok and result then
		local v1190 = false

		for _, v in pairs(result) do
			if v.OnSale then
				v1190 = true
				s12 ..= v.Name .. " - $" .. v1183(v.Price) .. "\n"
			end
		end

		if not v1190 then
			s12 ..= "- No fruit.\n"
		end
	else
		s12 ..= "- Error while retrieving data.\n"
	end

	local v1193 = s12 .. "\nNormal Fruit Stock\n"
	local ok2, result2 = pcall(function()
		return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
	end)

	if ok2 and result2 then
		local v1196 = false

		for _, v in pairs(result2) do
			if v.OnSale then
				v1196 = true
				v1193 ..= v.Name .. " - $" .. v1183(v.Price) .. "\n"
			end
		end

		if not v1196 then
			v1193 ..= "- No fruit.\n"
		end
	else
		v1193 ..= "- Error while retrieving data.\n"
	end

	return v1193
end

local v1199 = t16.Raids:AddParagraph("Stock Fruit", "Loading...")

task.spawn(function()
	while task.wait(60) do
		pcall(function()
			v1199:SetDesc(v1186())
		end)
	end
end)
pcall(function()
	v1199:SetDesc(v1186())
end)
RandomFF = t16.Raids:AddToggle({
	Name = "Auto Random Fruit",
	Description = "",
	Default = false,
	Callback = function(p328)
		_G.Random_Auto = p328
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.Random_Auto then
				ReplicatedStorage3.Remotes.CommF_:InvokeServer("Cousin", "Buy")
			end
		end)
	end
end)
DropF = t16.Raids:AddToggle({
	Name = "Auto Drop Fruit",
	Description = "",
	Default = false,
	Callback = function(p329)
		_G.DropFruit = p329
	end
})
spawn(function()
	while wait(Sec) do
		if _G.DropFruit then
			pcall(function()
				DropFruits()
			end)
		end
	end
end)
StoredF = t16.Raids:AddToggle({
	Name = "Auto Store Fruit",
	Description = "",
	Default = false,
	Callback = function(p330)
		_G.StoreF = p330
	end
})
spawn(function()
	while wait(Sec) do
		if _G.StoreF then
			pcall(function()
				UpdStFruit()
			end)
		end
	end
end)
TwF = t16.Raids:AddToggle({
	Name = "Auto Tween to Fruit",
	Description = "",
	Default = false,
	Callback = function(p331)
		_G.TwFruits = p331
	end
})
spawn(function()
	while wait(Sec) do
		if _G.TwFruits then
			pcall(function()
				for _, child in pairs(workspace:GetChildren()) do
					if string.find(child.Name, "Fruit") then
						_tp(child.Handle.CFrame)
					end
				end
			end)
		end
	end
end)
BringF = t16.Raids:AddToggle({
	Name = "Auto Collect Fruit",
	Description = "",
	Default = false,
	Callback = function(p332)
		_G.InstanceF = p332
	end
})
spawn(function()
	while wait(Sec) do
		if _G.InstanceF then
			pcall(function()
				collectFruits(_G.InstanceF)
			end)
		end
	end
end)
t16.Raids:AddDropdown({
	Name = "Select Fruit Shop",
	Options = {
		"Rocket-Rocket",
		"Spin-Spin",
		"Blade-Blade",
		"Spring-Spring",
		"Bomb-Bomb",
		"Smoke-Smoke",
		"Spike-Spike",
		"Flame-Flame",
		"Ice-Ice",
		"Sand-Sand",
		"Dark-Dark",
		"Eagle-Eagle",
		"Diamond-Diamond",
		"Light-Light",
		"Rubber-Rubber",
		"Ghost-Ghost",
		"Magma-Magma",
		"Quake-Quake",
		"Buddha-Buddha",
		"Love-Love",
		"Creation-Creation",
		"Spider-Spider",
		"Sound-Sound",
		"Phoenix-Phoenix",
		"Portal-Portal",
		"Lightning-Lightning",
		"Pain-Pain",
		"Blizzard-Blizzard",
		"Gravity-Gravity",
		"T-Rex-T-Rex",
		"Mammoth-Mammoth",
		"Dough-Dough",
		"Shadow-Shadow",
		"Venom-Venom",
		"Gas-Gas",
		"Control-Control",
		"Spirit-Spirit",
		"Leopard-Leopard",
		"Yeti-Yeti",
		"Kitsune-Kitsune",
		"Dragon-Dragon"
	},
	Callback = function(p333)
		getgenv().SelectFruit = p333
	end
})
t16.Raids:AddToggle({
	Name = "Auto Buy Fruit Shop",
	Default = false,
	Callback = function(p334)
		getgenv().AutoBuyFruitSniper = p334
	end
})
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
t16.Raids:AddSection("Dungeon Event / Raiding")

local t43 = {
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
	"Dough"
}

Q = t16.Raids:AddDropdown({
	Name = "Select Chip",
	Description = "",
	Options = t43,
	Callback = function(p335)
		_G.SelectChip = p335
	end
})
Q = t16.Raids:AddToggle({
	Name = "Auto Select Dungeon Chip",
	Description = "",
	Default = false,
	Callback = function(p336)
		_G.AutoSelectDungeon = p336
	end
})
t16.Raids:AddToggle({
	Name = "Get Fruit In Inventory Below 1M",
	Default = false,
	Callback = function(p337)
		getgenv().AutoGetFruit = p337
	end
})
spawn(function()
	while wait() do
		pcall(function()
			if getgenv().AutoGetFruit then
				for _, v in ipairs({
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
					"Barrier-Barrier"
				}) do
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
						"LoadFruit",
						v
					}))
				end
			end
		end)
	end
end)
t16.Raids:AddButton({
	Name = "Buy Dungeon Chips [Beli]",
	Description = "",
	Callback = function()
		if not GetBP("Special Microchip") then
			ReplicatedStorage3.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
		end
	end
})
t16.Raids:AddButton({
	Name = "Buy Dungeon Chips [Devil Fruit]",
	Description = "",
	Callback = function()
		if GetBP("Special Microchip") then
			return
		end

		local t44 = {}
		local response, v1207 = ReplicatedStorage3:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits")

		for _, v in next, response, v1207 do
			if v.Price <= 490000 then
				table.insert(t44, v.Name)
			end
		end

		for _, v in pairs(t44) do
			for _ in pairs(t43) do
				if not GetBP("Special Microchip") then
					ReplicatedStorage3.Remotes.CommF_:InvokeServer("LoadFruit", tostring(v))
					ReplicatedStorage3.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
				end
			end
		end
	end
})
AutoChipBeli = t16.Raids:AddToggle({
	Name = "Auto Buy Chip [Beli]",
	Description = "",
	Default = false,
	Callback = function(p338)
		_G.AutoChipBeli = p338
	end
})
task.spawn(function()
	while task.wait(1) do
		if _G.AutoChipBeli then
			pcall(function()
				if not GetBP("Special Microchip") then
					ReplicatedStorage3.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
				end
			end)
		end
	end
end)
AutoChipFruit = t16.Raids:AddToggle({
	Name = "Auto Buy Chip [Devil Fruit]",
	Description = "",
	Default = false,
	Callback = function(p339)
		_G.AutoChipFruit = p339
	end
})
task.spawn(function()
	while task.wait(1) do
		if _G.AutoChipFruit then
			pcall(function()
				if not GetBP("Special Microchip") then
					local response = ReplicatedStorage3.Remotes.CommF_:InvokeServer("GetFruits")
					local Name

					for _, v in pairs(response) do
						if v.Price <= 490000 then
							Name = v.Name

							break
						end
					end

					if Name then
						ReplicatedStorage3.Remotes.CommF_:InvokeServer("LoadFruit", tostring(Name))
						ReplicatedStorage3.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
					end
				end
			end)
		end
	end
end)
StartR = t16.Raids:AddToggle({
	Name = "Auto Start Raid",
	Description = "",
	Default = false,
	Callback = function(p340)
		_G.Auto_StartRaid = p340
	end
})
task.spawn(function()
	while task.wait(Sec) do
		if _G.Auto_StartRaid then
			pcall(function()
				local PlayerGui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
				local Main = PlayerGui and PlayerGui:FindFirstChild("Main")
				local TopHUDList = Main and Main:FindFirstChild("TopHUDList")

				if not TopHUDList or TopHUDList.RaidTimer.Visible then
					return
				end

				if not GetBP("Special Microchip") then
					return
				end

				if World2 then
					local Main2 = workspace.Map.CircleIsland.RaidSummon2.Button.Main

					if Main2 then
						if Main2:FindFirstChild("ProximityPrompt") then
							fireproximityprompt(Main2.ProximityPrompt)
						elseif Main2:FindFirstChild("ClickDetector") then
							fireclickdetector(Main2.ClickDetector)
						end
					end
				end

				if World3 then
					local Main2 = workspace.Map["Boat Castle"].RaidSummon2.Button.Main

					if Main2 then
						if Main2:FindFirstChild("ProximityPrompt") then
							fireproximityprompt(Main2.ProximityPrompt)
						elseif Main2:FindFirstChild("ClickDetector") then
							fireclickdetector(Main2.ClickDetector)
						end
					end
				end
			end)
		end
	end
end)
Raiding = t16.Raids:AddToggle({
	Name = "Auto Raid + Next Island",
	Description = "",
	Default = false,
	Callback = function(p341)
		_G.Raiding = p341
	end
})
spawn(function()
	local Locations = workspace._WorldOrigin.Locations
	local t45 = {
		"Island 1",
		"Island 2",
		"Island 3",
		"Island 4",
		"Island 5"
	}
	local v1224

	while task.wait(0.3) do
		if _G.Raiding and LocalPlayer4.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
			local Character = LocalPlayer4.Character

			if Character then
				local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
				local Humanoid = Character:FindFirstChildOfClass("Humanoid")

				if HumanoidRootPart and Humanoid and not (Humanoid.Health <= 0) and not Humanoid.Sit and not Humanoid.PlatformStand and not HumanoidRootPart.Anchored then
					local n10 = 999999

					for _, v in ipairs(t45) do
						local v1231 = Locations:FindFirstChild(v)

						if v1231 then
							local Magnitude = (HumanoidRootPart.Position - v1231.Position).Magnitude

							if Magnitude < n10 then
								n10 = Magnitude
								v1224 = v
							end
						end
					end

					if v1224 then
						local v1233 = Locations:FindFirstChild(v1224)

						if v1233 then
							local v1234 = false

							for _, child in ipairs(workspace.Enemies:GetChildren()) do
								local Humanoid2 = child:FindFirstChild("Humanoid")
								local HumanoidRootPart2 = child:FindFirstChild("HumanoidRootPart")

								if Humanoid2 and HumanoidRootPart2 and Humanoid2.Health > 0 and (HumanoidRootPart2.Position - v1233.Position).Magnitude < 450 then
									v1234 = true

									while true do
										task.wait()
										t9.Kill(child, _G.Raiding)

										if _G.Raiding then
											if not child.Parent then
												break
											end

											if Humanoid2.Health <= 0 then
												break
											end

											continue
										end

										break
									end
								end
							end

							if not v1234 then
								local v1239 = table.find(t45, v1224)

								if v1239 and t45[v1239 + 1] then
									local v1240 = Locations:FindFirstChild(t45[v1239 + 1])

									if v1240 then
										_tp(v1240.CFrame * CFrame.new(0, 45, 120))
									end

									v1224 = t45[v1239 + 1]
									task.wait(1)
								end
							end
						end
					end
				end
			end
		end
	end
end)
t16.Raids:AddToggle({
	Name = "Auto Awakening",
	Description = "",
	Default = false,
	Callback = function(p342)
		_G.Auto_Awakener = p342
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.Auto_Awakener then
				ReplicatedStorage3.Remotes.CommF_:InvokeServer("Awakener", "Check")
				ReplicatedStorage3.Remotes.CommF_:InvokeServer("Awakener", "Awaken")
			end
		end)
	end
end)
t16.Raids:AddToggle({
	Name = "Auto Teleport To Lab",
	Default = false,
	Callback = function(p343)
		_G.TpLab = p343
		StopTween(_G.TpLab)

		while _G.TpLab do
			wait()

			if _G.TpLab then
				if World2 and _G.TpLab then
					topos(CFrame.new(-6438.73535, 250.645355, -4501.50684))
				elseif World3 and _G.TpLab then
					topos(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499e-08, -0.378151238, 4.55503146e-09, 1, 1.07377559e-07, 0.378151238, 9.7681621e-08, -0.925743818))
				end
			end
		end
	end
})
t16.Raids:AddSection("Items Law/Order Sword")
t16.Raids:AddButton({
	Name = "Buy Microchip Law",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
	end
})
t16.Raids:AddButton({
	Name = "Start Law Raids",
	Description = "",
	Callback = function()
		fireclickdetector(workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
	end
})
t16.Raids:AddToggle({
	Name = "Auto Buy Microchip Law",
	Description = "",
	Default = false,
	Callback = function(p344)
		getgenv().AutoBuyMicrochipLaw = p344
	end
})
spawn(function()
	while task.wait(1) do
		if getgenv().AutoBuyMicrochipLaw then
			pcall(function()
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
			end)
		end
	end
end)
t16.Raids:AddToggle({
	Name = "Auto Start Law Raids",
	Description = "",
	Default = false,
	Callback = function(p345)
		getgenv().AutoStartLawRaids = p345
	end
})
spawn(function()
	while task.wait(1) do
		if getgenv().AutoStartLawRaids then
			pcall(function()
				fireclickdetector(workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
			end)
		end
	end
end)
t16.Raids:AddToggle({
	Name = "Auto Kill Law",
	Description = "",
	Default = false,
	Callback = function(p346)
		_G.AutoLawKak = p346
	end
})
spawn(function()
	while wait(Sec) do
		if _G.AutoLawKak then
			pcall(function()
				local Order = GetConnectionEnemies("Order")

				if Order then
					while true do
						task.wait()
						t9.Kill(Order, _G.AutoLawKak)

						if _G.AutoLawKak == false then
							break
						elseif not Order.Parent or Order.Humanoid.Health <= 0 then
							break
						end
					end
				else
					_tp(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
				end
			end)
		end
	end
end)
t16.Raids:AddSection("Raids Dungeons")

local LocalPlayer5 = game.Players.LocalPlayer

local function v1243()
	local Character = LocalPlayer5.Character

	return Character and Character:FindFirstChild("HumanoidRootPart")
end

t16.Raids:AddToggle({
	Name = "Auto Farm Dungeon",
	Description = "",
	Default = false,
	Callback = function(p347)
		_G.AutoFarmDungeon = p347
	end
})
spawn(function()
	while task.wait(0.15) do
		if _G.AutoFarmDungeon then
			pcall(function()
				local Character = game.Players.LocalPlayer.Character
				local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
				local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

				if not HumanoidRootPart or not Humanoid or Humanoid.Health <= 0 then
					return
				end

				for _, child in pairs(workspace.Enemies:GetChildren()) do
					if not _G.AutoFarmDungeon then
						break
					end

					local Humanoid2 = child:FindFirstChild("Humanoid")
					local HumanoidRootPart2 = child:FindFirstChild("HumanoidRootPart")

					if Humanoid2 and HumanoidRootPart2 and Humanoid2.Health > 0 and (HumanoidRootPart2.Position - HumanoidRootPart.Position).Magnitude <= 5000 then
						while true do
							task.wait()
							t9.Kill(child, true)

							if _G.AutoFarmDungeon then
								if not child.Parent or Humanoid2.Health <= 0 then
									break
								end
							else
								break
							end
						end
					end
				end
			end)
		end
	end
end)
t16.Raids:AddToggle({
	Name = "TP Exit (1)",
	Default = false,
	Callback = function(p348)
		_G.TPFloor1 = p348
	end
})

local u1252 = false

local function v1253()
	local v1254 = v1243()

	if not v1254 then
		return
	end

	for _, child in pairs(workspace.Map.Dungeon:GetChildren()) do
		local ExitTeleporter = child:FindFirstChild("ExitTeleporter")

		if ExitTeleporter and ExitTeleporter:FindFirstChild("Root") and (v1254.Position - ExitTeleporter.Root.Position).Magnitude < 200 then
			return ExitTeleporter.Root
		end
	end
end

task.spawn(function()
	while task.wait(0.3) do
		if not _G.TPFloor1 then
			u1252 = false
		elseif not u1252 then
			local v1258 = v1253()

			if v1258 then
				local cFrame3 = v1258.CFrame * CFrame.new(0, 3, 0)

				v1243().CFrame = cFrame3
				u1252 = true
			end
		end
	end
end)
t16.Raids:AddToggle({
	Name = "TP Exit (2)",
	Default = false,
	Callback = function(p349)
		_G.TPFloor2 = p349
	end
})

local u1260 = false

task.spawn(function()
	while task.wait(0.3) do
		if not _G.TPFloor2 then
			u1260 = false
		elseif not u1260 then
			local v1261 = v1243()

			if v1261 then
				for _, child in pairs(workspace.Map.Dungeon:GetChildren()) do
					local EntranceTeleporter = child:FindFirstChild("EntranceTeleporter")
					local ExitTeleporter = child:FindFirstChild("ExitTeleporter")

					if EntranceTeleporter and ExitTeleporter and EntranceTeleporter:FindFirstChild("Root") and ExitTeleporter:FindFirstChild("Root") and (v1261.Position - EntranceTeleporter.Root.Position).Magnitude < 100 then
						v1261.CFrame = ExitTeleporter.Root.CFrame * CFrame.new(0, 3, 0)
						u1260 = true

						break
					end
				end
			end
		end
	end
end)
t16.Raids:AddToggle({
	Name = "TP Exit (3)",
	Default = false,
	Callback = function(p350)
		_G.TPFloor3 = p350
	end
})

local u1266 = false

local function v1267()
	local v1268

	for _, child in pairs(workspace.Map.Dungeon:GetChildren()) do
		local v1271 = tonumber(child.Name)

		if v1271 and (not v1268 or tonumber(v1268.Name) < v1271) then
			v1268 = child
		end
	end

	return v1268
end

task.spawn(function()
	while task.wait(0.3) do
		if not _G.TPFloor3 then
			u1266 = false
		elseif not u1266 then
			local v1272 = v1267()

			if v1272 and v1272:FindFirstChild("ExitTeleporter") then
				if v1272.ExitTeleporter:FindFirstChild("Root") then
					v1243().CFrame = v1272.ExitTeleporter.Root.CFrame * CFrame.new(0, 3, 0)
					u1266 = true
				end
			end
		end
	end
end)
t16.Raids:AddToggle({
	Name = "TP Exit (4)",
	Default = false,
	Callback = function(p351)
		_G.TPFloor4 = p351
	end
})

local u1273 = false

local function v1274()
	local v1275 = v1243()

	if not v1275 then
		return
	end

	local Root_
	local huge = math.huge

	for _, child in pairs(workspace.Map.Dungeon:GetChildren()) do
		local ExitTeleporter = child:FindFirstChild("ExitTeleporter")

		if ExitTeleporter and ExitTeleporter:FindFirstChild("Root") then
			local Magnitude = (v1275.Position - ExitTeleporter.Root.Position).Magnitude

			if Magnitude < huge then
				huge = Magnitude
				Root_ = ExitTeleporter.Root
			end
		end
	end

	return Root_
end

task.spawn(function()
	while task.wait(0.3) do
		if not _G.TPFloor4 then
			u1273 = false
		elseif not u1273 then
			local v1282 = v1274()

			if v1282 then
				v1243().CFrame = v1282.CFrame * CFrame.new(0, 3, 0)
				u1273 = true
			end
		end
	end
end)
t16.Combat:AddSection("Combat / AimBot")

local v1283 = t16.Combat:AddParagraph("All Players On Server", "")

spawn(function()
	while wait(Sec) do
		pcall(function()
			local v1284 = #game:GetService("Players"):GetPlayers()

			if v1284 == 12 then
				v1283:SetDesc("All Players : " .. v1284 .. " / 12 [Max]")
			else
				v1283:SetDesc("All Players : " .. v1284 .. " / 12")
			end
		end)
	end
end)

local v1285 = t16.Combat:AddParagraph("Aimbot Status", "")

Checking_AimStatus = function()
	if _G.AimCam then
		return "Aimbot Camera"
	end

	if _G.AimbotGun then
		return "Aimbot Guns"
	end

	return ""
end
spawn(function()
	while wait(0.2) do
		pcall(function()
			if _G.AimMethod then
				if _G.AimCam or _G.AimbotGun then
					v1285:SetDesc("Aimbot - " .. Checking_AimStatus() .. " : True")
				else
					v1285:SetDesc("Aimbot - Skills : True")
				end
			else
				v1285:SetDesc("Aimbot - Skills : False")
			end
		end)
	end
end)

local t46 = {}
local Players2 = game:GetService("Players")

for _, child in pairs(Players2:GetChildren()) do
	table.insert(t46, child.Name)
end

t16.Combat:AddDropdown({
	Name = "Select Players",
	Description = "",
	Options = t46,
	Callback = function(p352)
		_G.PlayersList = p352
	end
})
t16.Combat:AddToggle({
	Name = "Teleport To Select Players",
	Description = "",
	Default = false,
	Callback = function(p353)
		_G.TpPly = p353
		spawn(function()
			pcall(function()
				while _G.TpPly do
					wait()
					_tp(game:GetService("Players")[_G.PlayersList].Character.HumanoidRootPart.CFrame)
				end
			end)
		end)
	end
})
t16.Combat:AddToggle({
	Name = "Spectate Select Players",
	Description = "",
	Default = false,
	Callback = function(p354)
		SpectatePlys = p354
		spawn(function()
			repeat
				task.wait(0.1)

				if game:GetService("Players"):FindFirstChild(_G.PlayersList) then
					workspace.Camera.CameraSubject = game:GetService("Players"):FindFirstChild(_G.PlayersList).Character.Humanoid
				end
			until not SpectatePlys

			workspace.Camera.CameraSubject = LocalPlayer5.Character.Humanoid
		end)
	end
})
t16.Combat:AddDropdown({
	Name = "Select Aim Method",
	Description = "",
	Options = {
		"Aim Player",
		"Nearest Aim"
	},
	Callback = function(p355)
		ABmethod = p355
	end
})
t16.Combat:AddToggle({
	Name = "Aimbot Method Skills",
	Description = "",
	Default = false,
	Callback = function(p356)
		_G.AimMethod = p356
	end
})
spawn(function()
	while wait() do
		pcall(function()
			if _G.AimMethod then
				if ABmethod == "Aim Player" then
					local v1290 = Players:FindFirstChild(getgenv().PlayersList)

					if v1290 and v1290.Character then
						if v1290.Character:FindFirstChild("HumanoidRootPart") and v1290.Team ~= LocalPlayer5.Team then
							MousePos = v1290.Character.HumanoidRootPart.Position
						end
					end
				end
			end
		end)
	end
end)
spawn(function()
	while wait() do
		pcall(function()
			if _G.AimMethod then
				if ABmethod == "Nearest Aim" then
					local huge = math.huge

					for _, player in pairs(Players:GetPlayers()) do
						if player ~= LocalPlayer5 and player.Team ~= LocalPlayer5.Team and player.Character then
							if player.Character:FindFirstChild("HumanoidRootPart") then
								local Magnitude = (player.Character.HumanoidRootPart.Position - LocalPlayer5.Character.HumanoidRootPart.Position).Magnitude

								if Magnitude < huge then
									huge = Magnitude
									MousePos = player.Character.HumanoidRootPart.Position
								end
							end
						end
					end
				end
			end
		end)
	end
end)
t16.Combat:AddToggle({
	Name = "Aimbot Camera Closet Players",
	Description = "",
	Default = false,
	Callback = function(p357)
		_G.AimCam = p357
	end
})
task.spawn(function()
	while task.wait(Sec) do
		pcall(function()
			if _G.AimCam then
				local CurrentCamera = workspace.CurrentCamera

				closestplayer = function()
					local huge = math.huge
					local v1297
					local players, v1299 = ply:GetPlayers()

					for _, v in next, players, v1299 do
						if v ~= LocalPlayer5 and v.Character then
							if v.Character:FindFirstChild("Head") and _G.AimCam and v.Character.Humanoid.Health > 0 then
								local Magnitude = (v.Character.Head.Position - LocalPlayer5.Character.Head.Position).Magnitude

								if Magnitude < huge then
									huge = Magnitude
									v1297 = v
								end
							end
						end
					end

					return v1297
				end

				while true do
					task.wait()
					CurrentCamera.CFrame = CFrame.new(CurrentCamera.CFrame.Position, closestplayer().Character.HumanoidRootPart.Position)

					if _G.AimCam == false then
						break
					elseif dist < Mag then
						break
					end
				end
			end
		end)
	end
end)
t16.Combat:AddSection("Quests Players")
t16.Combat:AddButton({
	Name = "Get player quests",
	Description = "",
	Callback = function()
		pcall(function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
		end)
	end
})
t16.Combat:AddToggle({
	Name = "Auto Get PlayerQuest",
	Description = "",
	Default = false,
	Callback = function(p358)
		_G.AutoReceivePlayerQuest = p358
	end
})
spawn(function()
	while task.wait(1) do
		if _G.AutoReceivePlayerQuest then
			pcall(function()
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
			end)
		end
	end
end)
t16.Combat:AddToggle({
	Name = "Auto Kill Player Quest",
	Default = false,
	Callback = function(p359)
		_G.AutoPlayerHunter = p359
	end
})
spawn(function()
	while task.wait() do
		if _G.AutoPlayerHunter then
			if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
				task.wait(0.5)
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
			else
				for _, child in pairs(game:GetService("Workspace").Characters:GetChildren()) do
					if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, child.Name) then
						repeat
							task.wait()

							if AutoHaki then
								AutoHaki()
							end

							if EquipWeapon then
								EquipWeapon(_G.SelectWeapon)
							end

							Useskill = true
							_tp(child.HumanoidRootPart.CFrame * CFrame.new(1, 7, 3))
							child.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
							game:GetService("VirtualUser"):CaptureController()
							game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
						until _G.AutoPlayerHunter == false or child.Humanoid.Health <= 0

						Useskill = false
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
					end
				end
			end
		end
	end
end)
t16.Combat:AddToggle({
	Name = "Auto Enable PvP",
	Description = "",
	Default = false,
	Callback = function(p360)
		_G.AutoPvP = p360
	end
})
spawn(function()
	while task.wait(0.5) do
		if _G.AutoPvP then
			local PlayerGui = game.Players.LocalPlayer.PlayerGui

			if PlayerGui and PlayerGui.Main then
				if PlayerGui.Main:FindFirstChild("PvpDisabled") and PlayerGui.Main.PvpDisabled.Visible then
					pcall(function()
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
					end)
				end
			end
		end
	end
end)
t16.Combat:AddToggle({
	Name = "Auto Safe Mode",
	Default = false,
	Callback = function(p361)
		_G.SafeMode = p361
	end
})
spawn(function()
	while task.wait(0.1) do
		if _G.SafeMode then
			local Character = game.Players.LocalPlayer.Character
			local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

			if HumanoidRootPart then
				_tp(HumanoidRootPart.CFrame * CFrame.new(0, 1000, 0))
			end
		end
	end
end)
t16.Combat:AddSection("LocalPlayer Settings")

local Players3 = game:GetService("Players")

game:GetService("UserInputService")

local RunService2 = game:GetService("RunService")
local LocalPlayer6 = Players3.LocalPlayer
local u1311 = false
local n11 = 50
local connection
local t47 = {
	f = 0,
	b = 0,
	l = 0,
	r = 0
}
local BodyGyro
local BodyVelocity

local function v1317()
	local function v1318()
		local Character = LocalPlayer6.Character

		if not Character then
			return
		end

		local Humanoid = Character:FindFirstChildOfClass("Humanoid")

		if not Humanoid then
			return
		end

		local MoveDirection = Humanoid.MoveDirection

		t47.f = 0
		t47.b = 0
		t47.l = 0
		t47.r = 0

		if MoveDirection.Z < -0.1 then
			t47.f = 1
		elseif MoveDirection.Z > 0.1 then
			t47.b = 1
		end

		if MoveDirection.X < -0.1 then
			t47.l = 1
		elseif MoveDirection.X > 0.1 then
			t47.r = 1
		end
	end

	local connection2

	connection2 = RunService2.Heartbeat:Connect(function()
		if u1311 then
			v1318()
		elseif connection2 then
			connection2:Disconnect()
		end
	end)
end
local function v1323(p362)
	u1311 = p362

	if u1311 then
		if not LocalPlayer6.Character then
			return
		end

		local Humanoid = LocalPlayer6.Character:FindFirstChildOfClass("Humanoid")
		local Torso

		if LocalPlayer6.Character:FindFirstChild("Torso") then
			Torso = LocalPlayer6.Character.Torso
		else
			Torso = LocalPlayer6.Character.UpperTorso
		end

		if not Humanoid or not Torso then
			return
		end

		for _, descendant in ipairs(LocalPlayer6.Character:GetDescendants()) do
			if descendant:IsA("BasePart") then
				descendant.CanCollide = false
				descendant.Massless = true
			end
		end

		LocalPlayer6.Character.DescendantAdded:Connect(function(descendant)
			if u1311 and descendant:IsA("BasePart") then
				descendant.CanCollide = false
				descendant.Massless = true
			end
		end)
		BodyGyro = Instance.new("BodyGyro", Torso)
		BodyGyro.P = 90000
		BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BodyGyro.cframe = Torso.CFrame
		BodyVelocity = Instance.new("BodyVelocity", Torso)
		BodyVelocity.velocity = Vector3.new(0, 0, 0)
		BodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)
		Humanoid.PlatformStand = true
		v1317()
		connection = RunService2.Heartbeat:Connect(function()
			if not u1311 or not LocalPlayer6.Character then
				return
			end

			for _, descendant in ipairs(LocalPlayer6.Character:GetDescendants()) do
				if descendant:IsA("BasePart") and descendant.CanCollide then
					descendant.CanCollide = false
				end
			end

			if t47.l + t47.r == 0 then
				if t47.f + t47.b == 0 then
					BodyVelocity.velocity = Vector3.new(0, 0, 0)
				else
					BodyVelocity.velocity = (workspace.CurrentCamera.CoordinateFrame.lookVector * (t47.f + t47.b) + (workspace.CurrentCamera.CoordinateFrame * CFrame.new(t47.l + t47.r, (t47.f + t47.b) * 0.2, 0).p - workspace.CurrentCamera.CoordinateFrame.p)) * n11
				end
			else
				BodyVelocity.velocity = (workspace.CurrentCamera.CoordinateFrame.lookVector * (t47.f + t47.b) + (workspace.CurrentCamera.CoordinateFrame * CFrame.new(t47.l + t47.r, (t47.f + t47.b) * 0.2, 0).p - workspace.CurrentCamera.CoordinateFrame.p)) * n11
				BodyGyro.cframe = workspace.CurrentCamera.CoordinateFrame

				return
			end

			BodyGyro.cframe = workspace.CurrentCamera.CoordinateFrame
		end)
	else
		if connection then
			connection:Disconnect()
			connection = nil
		end

		if LocalPlayer6.Character then
			local Humanoid = LocalPlayer6.Character:FindFirstChildOfClass("Humanoid")

			if Humanoid then
				Humanoid.PlatformStand = false
			end

			for _, descendant in ipairs(LocalPlayer6.Character:GetDescendants()) do
				if descendant:IsA("BasePart") then
					descendant.CanCollide = true
					descendant.Massless = false
				end
			end

			if BodyGyro then
				BodyGyro:Destroy()
			end

			if BodyVelocity then
				BodyVelocity:Destroy()
			end
		end

		t47 = {
			f = 0,
			b = 0,
			l = 0,
			r = 0
		}
	end
end
local function v1333(p363)
	n11 = p363
end

LocalPlayer6.CharacterAdded:Connect(function()
	wait(1)

	if u1311 then
		v1323(false)
		wait(0.1)
		v1323(true)
	end
end)
t16.Combat:AddToggle({
	Name = "Enable Fly",
	Default = false,
	Callback = function(p364)
		v1323(p364)
	end
})
t16.Combat:AddSlider({
	Name = "Speed Fly Mode",
	Min = 10,
	Max = 200,
	Default = 50,
	Callback = function(p365)
		v1333(p365)
	end
})
t16.Combat:AddToggle({
	Name = "Dash No Cooldown",
	Default = false,
	Callback = function(p366)
		getgenv().DodgeNoCD = p366
	end
})

local function v1334()
	local Dodge = game.Players.LocalPlayer.Character:WaitForChild("Dodge")
	local v1336, v1337 = getgc()

	for _, v in next, v1336, v1337 do
		if typeof(v) == "function" and getfenv(v).script == Dodge then
			local next_ = next
			local v1341, v1342 = getupvalues(v)

			for k, v2 in next_, v1341, v1342 do
				if tostring(v2) == "0.4" then
					setupvalue(v, k, 0)
				end
			end
		end
	end
end

t16.Combat:AddToggle({
	Name = "Instance Mink V3 [ INF ]",
	Description = "",
	Default = false,
	Callback = function(p367)
		InfAblities = p367
	end
})
spawn(function()
	while wait(0.2) do
		pcall(function()
			if InfAblities then
				if not LocalPlayer5.Character.HumanoidRootPart:FindFirstChild("Agility") then
					local clone = ReplicatedStorage3.FX.Agility:Clone()

					clone.Name = "Agility"
					clone.Parent = LocalPlayer5.Character.HumanoidRootPart
				end
			else
				LocalPlayer5.Character.HumanoidRootPart.Agility:Destroy()
			end
		end)
	end
end)
t16.Combat:AddToggle({
	Name = "Instance Energy [ INF ]",
	Description = "",
	Default = false,
	Callback = function(p368)
		infEnergy = p368

		if p368 then
			getInfinity_Ability("Energy", infEnergy)
		end
	end
})
t16.Combat:AddToggle({
	Name = "Instance Soru [ INF ]",
	Description = "",
	Default = false,
	Callback = function(p369)
		_G.InfSoru = p369

		if p369 then
			getInfinity_Ability("Soru", _G.InfSoru)
		end
	end
})
t16.Combat:AddToggle({
	Name = "Instance Observation Range [ INF ]",
	Description = "",
	Default = false,
	Callback = function(p370)
		_G.InfiniteObRange = p370

		if p370 then
			getInfinity_Ability("Observation", _G.InfiniteObRange)
		end
	end
})
t16.Combat:AddToggle({
	Name = "Ignore Same Teams",
	Description = "",
	Default = false,
	Callback = function(p371)
		_G.NoAimTeam = p371
	end
})
t16.Combat:AddToggle({
	Name = "Accept Allies",
	Description = "",
	Default = false,
	Callback = function(p372)
		_G.AcceptAlly = p372
	end
})
spawn(function()
	while wait(Sec) do
		if _G.AcceptAlly then
			pcall(function()
				for _, child in pairs(ply:GetChildren()) do
					if child.Name ~= LocalPlayer5.Name and child:FindFirstChild("Humanoid") and child:FindFirstChild("HumanoidRootPart") then
						ReplicatedStorage3:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("AcceptAlly", child.Name)
					end
				end
			end)
		end
	end
end)
t16.Travel:AddSection("Travel - Worlds")
t16.Travel:AddButton({
	Name = "Travel East Blue (World 1)",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("TravelMain")
	end
})
t16.Travel:AddButton({
	Name = "Travel Dressrosa (World 2)",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("TravelDressrosa")
	end
})
t16.Travel:AddButton({
	Name = "Travel Zou (World 3)",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("TravelZou")
	end
})
t16.Travel:AddSection("Travel - Island")
Location = {}

for _, child in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
	table.insert(Location, child.Name)
end

Travelllll = t16.Travel:AddDropdown({
	Name = "Select Travelling",
	Description = "",
	Options = Location,
	Callback = function(p373)
		_G.Island = p373
	end
})
GoIsland = t16.Travel:AddToggle({
	Name = "Auto Travel",
	Description = "",
	Default = false,
	Callback = function(p374)
		_G.Teleport = p374

		if p374 then
			for _, child in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
				if child.Name == _G.Island then
					while true do
						wait()
						_tp(child.CFrame * CFrame.new(0, 30, 0))

						if _G.Teleport then
							if Root.CFrame == child.CFrame then
								break
							end
						else
							break
						end
					end
				end
			end
		end
	end
})
t16.Travel:AddSection("Travel - Portal")

if World1 then
	Location_Portal = {
		"Sky",
		"UnderWater"
	}
elseif World2 then
	Location_Portal = {
		"SwanRoom",
		"Cursed Ship"
	}
elseif World3 then
	Location_Portal = {
		"Castle On The Sea",
		"Mansion Cafe",
		"Hydra Teleport",
		"Canvendish Room",
		"Temple of Time"
	}
end

PortalTP = t16.Travel:AddDropdown({
	Name = "Select Portal",
	Options = Location_Portal,
	Callback = function(p375)
		_G.Island_PT = p375
	end
})
t16.Travel:AddButton({
	Name = "requestEntrance",
	Description = "",
	Callback = function()
		if _G.Island_PT == "Sky" then
			ReplicatedStorage3.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894, 5547, -380))
		elseif _G.Island_PT == "UnderWater" then
			ReplicatedStorage3.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163, 11, 1819))
		elseif _G.Island_PT == "SwanRoom" then
			ReplicatedStorage3.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2285, 15, 905))
		elseif _G.Island_PT == "Cursed Ship" then
			ReplicatedStorage3.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923, 126, 32852))
		elseif _G.Island_PT == "Castle On The Sea" then
			ReplicatedStorage3.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5097.93164, 316.447021, -3142.66602, -0.405007899, -4.31682743e-08, 0.914313197, -1.90943332e-08, 1, 3.8755779e-08, -0.914313197, -1.76180437e-09, -0.405007899))
		elseif _G.Island_PT == "Mansion Cafe" then
			ReplicatedStorage3.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
		elseif _G.Island_PT == "Hydra Teleport" then
			ReplicatedStorage3.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5643.45263671875, 1013.0858154296875, -340.51025390625))
		elseif _G.Island_PT == "Canvendish Room" then
			ReplicatedStorage3.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5314.54638671875, 22.562219619750977, -127.06755065917969))
		elseif _G.Island_PT == "Temple of Time" then
			ReplicatedStorage3.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28310.0234, 14895.1123, 109.456741, -0.469690144, -2.85620132e-08, -0.882831335, -3.23509219e-08, 1, -1.51411736e-08, 0.882831335, 2.14487486e-08, -0.469690144))
		end
	end
})
t16.Travel:AddSection("Travel - NPCs")

for _, child in pairs(ReplicatedStorage3.NPCs:GetChildren()) do
	table.insert(NPCList, child.Name)
end

NPCsPos = t16.Travel:AddDropdown({
	Name = "Select NPCs",
	Options = NPCList,
	Callback = function(p376)
		NPClist = p376
	end
})
GoNPCs = t16.Travel:AddToggle({
	Name = "Auto Tween to NPC",
	Description = "",
	Default = false,
	Callback = function(p377)
		_G.TPNpc = p377
	end
})
spawn(function()
	while wait(Sec) do
		if _G.TPNpc then
			pcall(function()
				for _, child in pairs(ReplicatedStorage3.NPCs:GetChildren()) do
					if child.Name == NPClist then
						_tp(child.HumanoidRootPart.CFrame)
					end
				end
			end)
		end
	end
end)
t16.Shop:AddSection("Shop Options")
t16.Shop:AddButton({
	Name = "Buy Buso",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
	end
})
t16.Shop:AddButton({
	Name = "Buy Geppo",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
	end
})
t16.Shop:AddButton({
	Name = "Buy Soru",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
	end
})
t16.Shop:AddButton({
	Name = "Buy Ken",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("KenTalk", "Buy")
	end
})
t16.Shop:AddSection("Fighting - Style")
t16.Shop:AddButton({
	Name = "Buy Black Leg",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyBlackLeg")
	end
})
t16.Shop:AddButton({
	Name = "Buy Electro",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyElectro")
	end
})
t16.Shop:AddButton({
	Name = "Buy Fishman Karate",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
	end
})
t16.Shop:AddButton({
	Name = "Buy DragonClaw",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
	end
})
t16.Shop:AddButton({
	Name = "Buy Superhuman",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuySuperhuman")
	end
})
t16.Shop:AddButton({
	Name = "Buy Death Step",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyDeathStep")
	end
})
t16.Shop:AddButton({
	Name = "Buy Sharkman Karate",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
	end
})
t16.Shop:AddButton({
	Name = "Buy ElectricClaw",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyElectricClaw")
	end
})
t16.Shop:AddButton({
	Name = "Buy DragonTalon",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyDragonTalon")
	end
})
t16.Shop:AddButton({
	Name = "Buy Godhuman",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyGodhuman")
	end
})
t16.Shop:AddButton({
	Name = "Buy SanguineArt",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuySanguineArt")
	end
})
t16.Shop:AddSection("Accessory")
t16.Shop:AddButton({
	Name = "Buy Tomoe Ring",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyItem", "Tomoe Ring")
	end
})
t16.Shop:AddButton({
	Name = "Buy Black Cape",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyItem", "Black Cape")
	end
})
t16.Shop:AddButton({
	Name = "Buy Swordsman Hat",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyItem", "Swordsman Hat")
	end
})
t16.Shop:AddButton({
	Name = "Buy Bizarre Rifle",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 1)
	end
})
t16.Shop:AddButton({
	Name = "Buy Ghoul Mask",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 2)
	end
})
t16.Shop:AddSection("Weapon World1")
t16.Shop:AddButton({
	Name = "Buy Cutlass",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyItem", "Cutlass")
	end
})
t16.Shop:AddButton({
	Name = "Buy Katana",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyItem", "Katana")
	end
})
t16.Shop:AddButton({
	Name = "Buy Iron Mace",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace")
	end
})
t16.Shop:AddButton({
	Name = "Buy Duel Katana",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyItem", "Duel Katana")
	end
})
t16.Shop:AddButton({
	Name = "Buy Triple Katana",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana")
	end
})
t16.Shop:AddButton({
	Name = "Buy Pipe",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyItem", "Pipe")
	end
})
t16.Shop:AddButton({
	Name = "Buy Dual-Headed Blade",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade")
	end
})
t16.Shop:AddButton({
	Name = "Buy Bisento",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyItem", "Bisento")
	end
})
t16.Shop:AddButton({
	Name = "Buy Soul Cane",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane")
	end
})
t16.Shop:AddButton({
	Name = "Buy Slingshot",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyItem", "Slingshot")
	end
})
t16.Shop:AddButton({
	Name = "Buy Musket",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyItem", "Musket")
	end
})
t16.Shop:AddButton({
	Name = "Buy Dual Flintlock",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyItem", "Dual Flintlock")
	end
})
t16.Shop:AddButton({
	Name = "Buy Flintlock",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyItem", "Flintlock")
	end
})
t16.Shop:AddButton({
	Name = "Buy Refined Flintlock",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyItem", "Refined Flintlock")
	end
})
t16.Shop:AddButton({
	Name = "Buy Cannon",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BuyItem", "Cannon")
	end
})
t16.Shop:AddButton({
	Name = "Buy Kabucha",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "2")
	end
})
t16.Shop:AddSection("Fragments shop")
t16.Shop:AddButton({
	Name = "Buy Refund Stats",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2")
	end
})
t16.Shop:AddButton({
	Name = "Buy Reroll Race",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
	end
})
t16.Shop:AddButton({
	Name = "Buy Ghoul Race",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("Ectoplasm", " Change", 4)
	end
})
t16.Shop:AddButton({
	Name = "Buy Cyborg Race (2.5k)",
	Description = "",
	Callback = function()
		ReplicatedStorage3.Remotes.CommF_:InvokeServer("CyborgTrainer", " Buy")
	end
})
t16.Shop:AddButton({
	Name = "Buy Draco Race",
	Callback = function()
		_tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.57855224609375))

		local vector3 = Vector3.new(5814.42724609375, 1208.3267822265625, 884.57855224609375)
		local LocalPlayer7 = game.Players.LocalPlayer
		local Character = LocalPlayer7.Character or LocalPlayer7.CharacterAdded:Wait()

		repeat
			wait()
		until (Character.HumanoidRootPart.Position - vector3).Magnitude < 1

		game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({ {
			NPC = "Dragon Wizard",
			Command = "DragonRace"
		} }))
	end
})
t16.Misc:AddSection("Server - Function")
t16.Misc:AddButton({
	Name = "Redeem All Codes",
	Description = "",
	Callback = function()
		local t48 = {
			"LIGHTNINGABUSE",
			"1LOSTADMIN",
			"ADMINFIGHT",
			"GIFTING_HOURS",
			"NOMOREHACK",
			"BANEXPLOIT",
			"WildDares",
			"BossBuild",
			"GetPranked",
			"EARN_FRUITS",
			"SUB2GAMERROBOT_RESET1",
			"KITT_RESET",
			"Bignews",
			"CHANDLER",
			"Fudd10",
			"fudd10_v2",
			"Sub2UncleKizaru",
			"FIGHT4FRUIT",
			"kittgaming",
			"TRIPLEABUSE",
			"Sub2CaptainMaui",
			"Sub2Fer999",
			"Enyu_is_Pro",
			"Magicbus",
			"JCWK",
			"Starcodeheo",
			"Bluxxy",
			"SUB2GAMERROBOT_EXP1",
			"Sub2NoobMaster123",
			"Sub2Daigrock",
			"Axiore",
			"TantaiGaming",
			"StrawHatMaine",
			"Sub2OfficialNoobie",
			"TheGreatAce",
			"JULYUPDATE_RESET",
			"ADMINHACKED",
			"SEATROLLING",
			"24NOADMIN",
			"ADMIN_TROLL",
			"NEWTROLL",
			"SECRET_ADMIN",
			"staffbattle",
			"NOEXPLOIT",
			"NOOB2ADMIN",
			"CODESLIDE",
			"fruitconcepts",
			"krazydares"
		}
		local Redeem = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):FindFirstChild("Redeem")

		if not Redeem then
			return
		end

		for _, v in ipairs(t48) do
			task.wait(0)
			pcall(function()
				if Redeem.InvokeServer then
					Redeem:InvokeServer(v)
				else
					Redeem:FireServer(v)
				end
			end)
		end
	end
})
t16.Misc:AddButton({
	Name = "Rejoin Server",
	Description = "",
	Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
	end
})
t16.Misc:AddButton({
	Name = "Hop Server",
	Description = "",
	Callback = function()
		task.spawn(function()
			local HttpService = game:GetService("HttpService")
			local TeleportService_ = game:GetService("TeleportService")
			local Players4 = game:GetService("Players")
			local ok, result = pcall(function()
				local response = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")

				return HttpService:JSONDecode(response).data
			end)

			if ok and result then
				local id

				for _, v in pairs(result) do
					if v.playing < v.maxPlayers then
						id = v.id
					end
				end

				if id then
					pcall(function()
						TeleportService_:TeleportToPlaceInstance(game.PlaceId, id, Players4.LocalPlayer)
					end)
				end
			end
		end)
	end
})
t16.Misc:AddButton({
	Name = "Hop to Lowest Players",
	Description = "",
	Callback = function()
		local HttpService = game:GetService("HttpService")
		local TeleportService_ = game:GetService("TeleportService")
		local v1374 = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"

		ListServers = function(p378)
			local v1375 = v1374
			local v1376 = p378 and "&cursor=" .. p378
			local response = game:HttpGet(v1375 .. (v1376 or ""))

			return HttpService:JSONDecode(response)
		end

		local nextPageCursor
		local v1379

		repeat
			local v1380 = ListServers(nextPageCursor)

			v1379 = v1380.data[1]
			nextPageCursor = v1380.nextPageCursor
		until v1379

		TeleportService_:TeleportToPlaceInstance(game.PlaceId, v1379.id, LocalPlayer5)
	end
})
t16.Misc:AddButton({
	Name = "Hop to Lowest Pings Server",
	Description = "",
	Callback = function()
		local HttpService = game:GetService("HttpService")
		local TeleportService_ = game:GetService("TeleportService")
		local Stats_ = game:GetService("Stats")

		local function v1384(p379, p380)
			local v1385 = string.format("https://games.roblox.com/v1/games/%d/servers/Public?limit=%d", p379, p380)
			local ok, result = pcall(function()
				return HttpService:JSONDecode(game:HttpGet(v1385))
			end)

			if ok and result and result.data then
				return result.data
			end

			return nil
		end

		local v1388 = v1384(game.PlaceId, 100)

		if not v1388 then
			return
		end

		local v1389 = v1388[1]

		for _, v in pairs(v1388) do
			if v.ping < v1389.ping and v.playing < v.maxPlayers then
				v1389 = v
			end
		end

		task.wait(0.5)

		if tonumber(Stats_.Network.ServerStatsItem["Data Ping"]:GetValueString():match("(%d+)")) >= 100 then
			TeleportService_:TeleportToPlaceInstance(game.PlaceId, v1389.id)
		end
	end
})

local ReplicatedStorage4 = game:GetService("ReplicatedStorage")

t16.Misc:AddTextBox({
	Name = "Input Job Id",
	Placeholder = "Job ID",
	ClearOnFocus = true,
	Callback = function(p381)
		getgenv().Job = p381
	end
})
t16.Misc:AddButton({
	Name = "Teleport [Job ID]",
	Callback = function()
		if getgenv().Job and getgenv().Job ~= "" then
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, getgenv().Job, game.Players.LocalPlayer)
		end
	end
})
t16.Misc:AddButton({
	Name = "Copy JobID",
	Description = "",
	Callback = function()
		setclipboard(tostring(game.JobId))
	end
})
t16.Misc:AddSection("Player Gui / Others")
t16.Misc:AddButton({
	Name = "Open Awakenings Expert",
	Description = "",
	Callback = function()
		LocalPlayer5.PlayerGui.Main.AwakeningToggler.Visible = true
	end
})
t16.Misc:AddButton({
	Name = "Open Title Selection",
	Description = "",
	Callback = function()
		ReplicatedStorage4.Remotes.CommF_:InvokeServer("getTitles", true)
		LocalPlayer5.PlayerGui.Main.Titles.Visible = true
	end
})
DisbleChat = t16.Misc:AddToggle({
	Name = "Disable Chat GUI",
	Description = "",
	Default = false,
	Callback = function(p382)
		_G.Rechat = p382

		if _G.Rechat == true then
			game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
		elseif _G.chat == false then
			game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
		end
	end
})
DisbleLeaderB = t16.Misc:AddToggle({
	Name = "Disable Leader Board GUI",
	Description = "",
	Default = false,
	Callback = function(p383)
		ReLeader = p383

		if ReLeader == true then
			game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
		elseif ReLeader == false then
			game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
		end
	end
})
t16.Misc:AddButton({
	Name = "Set Pirate Team",
	Description = "",
	Callback = function()
		Pirates()
	end
})
t16.Misc:AddButton({
	Name = "Set Marine Team",
	Description = "",
	Callback = function()
		Marines()
	end
})
UnPortal = t16.Misc:AddToggle({
	Name = "Unlock All Portals",
	Description = "",
	Default = false,
	Callback = function(p384)
		_G.PortalUnLock = p384
	end
})
spawn(function()
	while wait(Sec) do
		pcall(function()
			if _G.PortalUnLock then
				if t9.Pos(CstlePos_Miti, 8) then
					ReplicatedStorage4.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
				elseif t9.Pos(Man3Pos_Miti, 8) then
					ReplicatedStorage4.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5072.08984375, 314.5412902832, -3151.1098632812))
				elseif t9.Pos(HydraPos_Miti, 8) then
					ReplicatedStorage4.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5748.7587890625, 610.44982910156, -267.81704711914))
				elseif t9.Pos(HydratoCastle, 8) then
					ReplicatedStorage4.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5072.08984375, 314.5412902832, -3151.1098632812))
				end
			end
		end)
	end
end)
t16.Misc:AddSection("Graphics / Haki Stats")
HakiSt = {
	"State 0",
	"State 1",
	"State 2",
	"State 3",
	"State 4",
	"State 5"
}
HakiStat = t16.Misc:AddDropdown({
	Name = "Select Haki States",
	Options = HakiSt,
	Callback = function(p385)
		_G.SelectStateHaki = p385
	end
})
t16.Misc:AddButton({
	Name = "ChangeBusoStage",
	Description = "",
	Callback = function()
		if _G.SelectStateHaki == "State 0" then
			ReplicatedStorage4.Remotes.CommF_:InvokeServer("ChangeBusoStage", 0)
		elseif _G.SelectStateHaki == "State 1" then
			ReplicatedStorage4.Remotes.CommF_:InvokeServer("ChangeBusoStage", 1)
		elseif _G.SelectStateHaki == "State 2" then
			ReplicatedStorage4.Remotes.CommF_:InvokeServer("ChangeBusoStage", 2)
		elseif _G.SelectStateHaki == "State 3" then
			ReplicatedStorage4.Remotes.CommF_:InvokeServer("ChangeBusoStage", 3)
		elseif _G.SelectStateHaki == "State 4" then
			ReplicatedStorage4.Remotes.CommF_:InvokeServer("ChangeBusoStage", 4)
		elseif _G.SelectStateHaki == "State 5" then
			ReplicatedStorage4.Remotes.CommF_:InvokeServer("ChangeBusoStage", 5)
		end
	end
})
rtxM = t16.Misc:AddToggle({
	Name = "Turn on RTX Mode",
	Description = "",
	Default = false,
	Callback = function(p386)
		_G.RTXMode = p386

		local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect", game.Lighting)
		local ColorCorrectionEffect2 = Instance.new("ColorCorrectionEffect", game.Lighting)

		OldAmbient = game.Lighting.Ambient
		OldBrightness = game.Lighting.Brightness
		OldColorShift_Top = game.Lighting.ColorShift_Top
		OldBrightnessc = ColorCorrectionEffect.Brightness
		OldContrastc = ColorCorrectionEffect.Contrast
		OldTintColorc = ColorCorrectionEffect.TintColor
		OldTintColore = ColorCorrectionEffect2.TintColor

		if not _G.RTXMode then
			return
		end

		while _G.RTXMode do
			wait()
			game.Lighting.Ambient = Color3.fromRGB(33, 33, 33)
			game.Lighting.Brightness = 0.3
			ColorCorrectionEffect.Brightness = 0.176
			ColorCorrectionEffect.Contrast = 0.39
			ColorCorrectionEffect.TintColor = Color3.fromRGB(217, 145, 57)
			game.Lighting.FogEnd = 999

			if not LocalPlayer5.Character.HumanoidRootPart:FindFirstChild("PointLight") then
				local PointLight = Instance.new("PointLight")

				PointLight.Parent = LocalPlayer5.Character.HumanoidRootPart
				PointLight.Range = 15
				PointLight.Color = Color3.fromRGB(217, 145, 57)
			end

			if not _G.RTXMode then
				game.Lighting.Ambient = OldAmbient
				game.Lighting.Brightness = OldBrightness
				game.Lighting.ColorShift_Top = OldColorShift_Top
				ColorCorrectionEffect.Contrast = OldContrastc
				ColorCorrectionEffect.Brightness = OldBrightnessc
				ColorCorrectionEffect.TintColor = OldTintColorc
				ColorCorrectionEffect2.TintColor = OldTintColore
				game.Lighting.FogEnd = 2500
				LocalPlayer5.Character.HumanoidRootPart:FindFirstChild("PointLight"):Destroy()
			end
		end
	end
})
t16.Misc:AddButton({
	Name = "Turn on Fast Mode",
	Description = "",
	Callback = function()
		local descendants, v1397 = workspace:GetDescendants()

		for _, v in next, descendants, v1397 do
			if table.find(t2, v.ClassName) then
				v.Material = "Plastic"
			end
		end
	end
})
t16.Misc:AddButton({
	Name = "Turn on Low CPU",
	Description = "",
	Callback = function()
		LowCpu()
	end
})
t16.Misc:AddButton({
	Name = "Turn on increase Boats",
	Description = "",
	Callback = function()
		for _, descendant in pairs(workspace.Boats:GetDescendants()) do
			if table.find(t37, descendant.Name) and tostring(descendant.Owner.Value) == tostring(LocalPlayer5.Name) then
				descendant.VehicleSeat.MaxSpeed = 350
				descendant.VehicleSeat.Torque = 0.2
				descendant.VehicleSeat.TurnSpeed = 5
				descendant.VehicleSeat.HeadsUpDisplay = true
			end
		end
	end
})
t16.Misc:AddButton({
	Name = "Remove Sky Fog",
	Description = "",
	Callback = function()
		if Lighting:FindFirstChild("LightingLayers") then
			Lighting.LightingLayers:Destroy()
		end

		if Lighting:FindFirstChild("SeaTerrorCC") then
			Lighting.SeaTerrorCC:Destroy()
		end

		if Lighting:FindFirstChild("FantasySky") then
			Lighting.FantasySky:Destroy()
		end
	end
})
t16.Misc:AddSection("Configure - God")
t16.Misc:AddButton({
	Name = "Rain Fruits (Client)",
	Description = "",
	Callback = function()
		for _, child in pairs(game:GetObjects("rbxassetid://14759368201")[1]:GetChildren()) do
			child.Parent = game.Workspace.Map
			child:MoveTo(LocalPlayer5.Character.PrimaryPart.Position + Vector3.new(math.random(-50, 50), 100, math.random(-50, 50)))

			if child.Fruit:FindFirstChild("AnimationController") then
				child.Fruit:FindFirstChild("AnimationController"):LoadAnimation(child.Fruit:FindFirstChild("Idle")):Play()
			end

			child.Handle.Touched:Connect(function(part)
				if part.Parent == LocalPlayer5.Character then
					child.Parent = LocalPlayer5.Backpack
					LocalPlayer5.Character.Humanoid:EquipTool(child)
				end
			end)
		end
	end
})
briggt1 = t16.Misc:AddToggle({
	Name = "Turn on Full Bright",
	Description = "",
	Default = false,
	Callback = function(p387)
		bright = p387

		if p387 == true then
			Lighting.Ambient = Color3.new(1, 1, 1)
			Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
			Lighting.ColorShift_Top = Color3.new(1, 1, 1)
		else
			Lighting.Ambient = Color3.new(0, 0, 0)
			Lighting.ColorShift_Bottom = Color3.new(0, 0, 0)
			Lighting.ColorShift_Top = Color3.new(0, 0, 0)
		end
	end
})
DayN = t16.Misc:AddDropdown({
	Name = "Select Time",
	Description = "",
	Options = {
		"Day",
		"Night"
	},
	Default = Day,
	Callback = function(p388)
		_G.SelectDN = p388
	end
})
dayornight = t16.Misc:AddToggle({
	Name = "Turn on Time",
	Description = "",
	Default = false,
	Callback = function(p389)
		_G.daylightN = p389
	end
})
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
walkWater = t16.Misc:AddToggle({
	Name = "Turn on Walk on Water",
	Description = "",
	Default = true,
	Callback = function(p390)
		_G.WalkWater_Part = p390

		if _G.WalkWater_Part then
			game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000)
		else
			game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)
		end
	end
})
iceWalk = t16.Misc:AddToggle({
	Name = "Turn on Ice Walk",
	Description = "",
	Default = false,
	Callback = function(p391)
		_G.WalkWater = p391
	end
})
spawn(function()
	while task.wait() do
		if _G.WalkWater then
			pcall(function()
				if LocalPlayer5.Character then
					if LocalPlayer5.Character:FindFirstChild("LeftFoot") then
						local clone = ReplicatedStorage4.Assets.Models.IceSpikes4:Clone()

						clone.Parent = workspace
						clone.Size = Vector3.new(3 + math.random(10, 12), 1.7, 3 + math.random(10, 12))
						clone.Color = Color3.fromRGB(128, 187, 219)
						clone.CFrame = CFrame.new(LocalPlayer5.Character.Head.Position.X, -3.8, LocalPlayer5.Character.Head.Position.Z) * CFrame.Angles((math.random() - 0.5) * 0.06, math.random() * 7, (math.random() - 0.5) * 0.07)

						local t49 = {
							Size = Vector3.new(0, 0.3, 0)
						}
						local tween_ = TW:Create(clone, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), t49)

						tween_.Completed:Connect(function()
							clone:Destroy()
						end)
						tween_:Play()
					end
				end
			end)
		end
	end
end)

local LocalPlayer7 = game.Players.LocalPlayer

local function v1408(p392)
	if p392 then
		local Humanoid = p392:FindFirstChild("Humanoid")

		return Humanoid and Humanoid.Health > 0
	end

	return false
end
local function v1410(p393, p394)
	local children = game:GetService("Workspace").Enemies:GetChildren()
	local players = game:GetService("Players"):GetPlayers()
	local t50 = {}
	local Position = p393:GetPivot().Position

	for _, child in ipairs(children) do
		local HumanoidRootPart = child:FindFirstChild("HumanoidRootPart")

		if HumanoidRootPart and v1408(child) and (HumanoidRootPart.Position - Position).Magnitude <= p394 then
			table.insert(t50, child)
		end
	end

	for _, player in ipairs(players) do
		if player ~= LocalPlayer7 and player.Character then
			local HumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

			if HumanoidRootPart and v1408(player.Character) then
				if (HumanoidRootPart.Position - Position).Magnitude <= p394 then
					table.insert(t50, player.Character)
				end
			end
		end
	end

	return t50
end

AttackNoCoolDown = function()
	local LocalPlayer8 = game:GetService("Players").LocalPlayer
	local Character = LocalPlayer8.Character

	if not Character then
		return
	end

	local v1423

	for _, child in ipairs(Character:GetChildren()) do
		if child:IsA("Tool") then
			v1423 = child

			break
		end
	end

	if not v1423 then
		return
	end

	local v1426 = v1410(Character, 60)

	if #v1426 == 0 then
		return
	end

	local ReplicatedStorage5 = game:GetService("ReplicatedStorage")
	local Modules = ReplicatedStorage5:FindFirstChild("Modules")

	if not Modules then
		return
	end

	local RERegisterAttack = ReplicatedStorage5:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack")
	local RERegisterHit = ReplicatedStorage5:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit")

	if not RERegisterAttack or not RERegisterHit then
		return
	end

	local t51 = {}
	local v1432

	for _, v in ipairs(v1426) do
		if not v:GetAttribute("IsBoat") then
			local t52 = {
				"RightLowerArm",
				"RightUpperArm",
				"LeftLowerArm",
				"LeftUpperArm",
				"RightHand",
				"LeftHand"
			}
			local PrimaryPart = v:FindFirstChild(t52[math.random(#t52)]) or v.PrimaryPart

			if PrimaryPart then
				table.insert(t51, {
					v,
					PrimaryPart
				})
				v1432 = PrimaryPart
			end
		end
	end

	if not v1432 then
		return
	end

	RERegisterAttack:FireServer(0)

	local PlayerScripts = LocalPlayer8:FindFirstChild("PlayerScripts")

	if not PlayerScripts then
		return
	end

	local LocalScript = PlayerScripts:FindFirstChildOfClass("LocalScript")

	while not LocalScript do
		PlayerScripts.ChildAdded:Wait()
		LocalScript = PlayerScripts:FindFirstChildOfClass("LocalScript")
	end

	local SendHitsToServer

	if getsenv then
		local ok, result = pcall(getsenv, LocalScript)

		if ok and result then
			SendHitsToServer = result._G.SendHitsToServer
		end
	end

	local ok, result = pcall(function()
		return require(Modules.Flags).COMBAT_REMOTE_THREAD or false
	end)

	if ok and result and SendHitsToServer then
		SendHitsToServer(v1432, t51)
	elseif ok and not result then
		RERegisterHit:FireServer(v1432, t51)
	end
end
CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
CameraShakerR:Stop()
get_Monster = function()
	for _, child in pairs(workspace.Enemies:GetChildren()) do
		local UpperTorso = child:FindFirstChild("UpperTorso") or child:FindFirstChild("Head")

		if child:FindFirstChild("HumanoidRootPart", true) and UpperTorso and (child.Head.Position - LocalPlayer5.Character.HumanoidRootPart.Position).Magnitude <= 50 then
			return true, UpperTorso.Position
		end
	end

	for _, child in pairs(workspace.SeaBeasts:GetChildren()) do
		if child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Health") and child.Health.Value > 0 then
			return true, child.HumanoidRootPart.Position
		end
	end

	for _, child in pairs(workspace.Enemies:GetChildren()) do
		if child:FindFirstChild("Health") and child.Health.Value > 0 and child:FindFirstChild("VehicleSeat") then
			return true, child.Engine.Position
		end
	end
end
Actived = function()
	local Tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
	local v1452, v1453 = getconnections(Tool.Activated)

	for _, v in next, v1452, v1453 do
		if typeof(v.Function) == "function" then
			getupvalues(v.Function)
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

			local Tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
			local ToolTip = Tool.ToolTip
			local v1458 = get_Monster()

			if ToolTip == "Blox Fruit" then
				if v1458 then
					local LeftClickRemote = Tool:FindFirstChild("LeftClickRemote")

					if LeftClickRemote then
						Actived()
						LeftClickRemote:FireServer(Vector3.new(0.01, -500, 0.01), 1, true)
						LeftClickRemote:FireServer(false)
					end
				end
			end
		end)
	end)
end)

local Players4 = game:GetService("Players")
local RunService3 = game:GetService("RunService")
local ReplicatedStorage5 = game:GetService("ReplicatedStorage")
local Workspace2 = game:GetService("Workspace")
local LocalPlayer8 = Players4.LocalPlayer

if not LocalPlayer8.Character then
	LocalPlayer8.CharacterAdded:Wait()
end

local function v1468(p395, p396)
	local _, result = pcall(function()
		return p395:WaitForChild(p396)
	end)

	return result
end

local enemies = v1468(Workspace2, "Enemies")
local characters = v1468(Workspace2, "Characters")
local modules = v1468(ReplicatedStorage5, "Modules")
local net = v1468(modules, "Net")
local t53 = {
	Rate = 2e-09,
	Enabled = true,
	IsAlive = function(p397)
		local Humanoid = p397:FindFirstChild("Humanoid")

		if Humanoid and Humanoid.Health > 0 then
			return true
		end

		return false
	end,
	GetNearbyTargets = function(p398, p399)
		local Position = p398:GetPivot().Position
		local t55 = {}
		local children = p399:GetChildren()

		for i = 1, #children do
			local v1480 = children[i]
			local Humanoid = v1480:FindFirstChild("Humanoid")
			local HumanoidRootPart = v1480:FindFirstChild("HumanoidRootPart")

			if Humanoid and HumanoidRootPart and Humanoid.Health > 0 and (HumanoidRootPart.Position - Position).Magnitude <= 60 then
				table.insert(t55, v1480)
			end
		end

		return t55
	end,
	GetTargetParts = function(p400)
		local t56 = {}

		for i = 1, #p400 do
			local v1485 = p400[i]
			local Head = v1485:FindFirstChild("Head") or v1485.PrimaryPart

			if Head then
				table.insert(t56, {
					v1485,
					Head
				})
			end
		end

		return t56
	end
}

t53.GetAllTargets = function(p401)
	local v1487 = t53.GetNearbyTargets(p401, enemies)
	local v1488 = t53.GetNearbyTargets(p401, characters)
	local t57 = {}

	for i = 1, #v1487 do
		table.insert(t57, v1487[i])
	end

	for i = 1, #v1488 do
		table.insert(t57, v1488[i])
	end

	return t57
end
t53.ExecuteFastAttack = function()
	local j = LocalPlayer8.Character

	if not j then
		return
	end

	local W = j:FindFirstChildOfClass("Tool")

	if not W then
		return
	end

	local W = t53.GetAllTargets(j)

	if #W < 1 then
		return
	end

	local j = t53.GetTargetParts(W)

	if #j < 1 then
		return
	end

	local W = net["RE/RegisterAttack"]
	local t = net["RE/RegisterHit"]

	W:FireServer(t53.Rate)

	local A = j[1][2]

	t:FireServer(A, j)
end

local u1499
local attribute

local function v1501()
	for _, v in ipairs({
		ReplicatedStorage5.Util,
		ReplicatedStorage5.Common,
		ReplicatedStorage5.Remotes,
		ReplicatedStorage5.Assets,
		ReplicatedStorage5.FX
	}) do
		local children = v:GetChildren()

		for _, child in ipairs(children) do
			if child:IsA("RemoteEvent") and child:GetAttribute("Id") then
				u1499 = child
				attribute = child:GetAttribute("Id")
			end
		end

		v.ChildAdded:Connect(function(child)
			if child:IsA("RemoteEvent") and child:GetAttribute("Id") then
				u1499 = child
				attribute = child:GetAttribute("Id")
			end
		end)
	end
end

v1501()

local t54 = {
	Execute = function()
		local j = LocalPlayer8.Character

		if not j then
			return
		end

		local t = j:FindFirstChild("HumanoidRootPart")

		if not t then
			return
		end

		local i = {}

		local function e(K)
			local X = K:GetChildren()

			for K = 1, #X do
				local _ = X[K]
				local K = _:FindFirstChild("Humanoid")
				local X = _:FindFirstChild("HumanoidRootPart")

				if K and X and K.Health > 0 and _ ~= j then
					local K = (X.Position - t.Position).Magnitude

					if K <= 60 then
						local t = _:GetChildren()

						for K, K in ipairs(t) do
							if K:IsA("BasePart") then
								table.insert(i, { _, K })
							end
						end
					end
				end
			end
		end

		e(enemies)
		e(characters)

		local Z = j:FindFirstChildOfClass("Tool")

		if #i > 0 and Z and (Z:GetAttribute("WeaponType") == "Melee" or Z:GetAttribute("WeaponType") == "Sword") then
			local j = modules.Net.seed:InvokeServer()
			local Z = net["RE/RegisterAttack"]
			local t = net["RE/RegisterHit"]

			Z:FireServer()

			local W = i[1][1]:FindFirstChild("Head")

			if not W then
				return
			end

			t:FireServer(W, i, {})

			if u1499 then
				local Z = math.floor(Workspace2:GetServerTimeNow() / 10 % 10) + 1
				local t = string.gsub("RE/RegisterHit", ".", function(x)
					return string.char(bit32.bxor(string.byte(x), Z))
				end)
				local Z = bit32.bxor(attribute + 909090, j * 2)

				cloneref(u1499):FireServer(t, Z, W, i)
			end
		end
	end
}

local function v1528()
	require(ReplicatedStorage5.Util.CameraShaker):Stop()
end
local function v1529()
	task.spawn(function()
		while task.wait(t53.Rate) do
			t53.ExecuteFastAttack()
		end
	end)
	RunService3.Heartbeat:Connect(function()
		pcall(t54.Execute)
	end)
end

v1529()

v249:Notify({
	Title = "Lunar Hub",
	Content = "Thanks for using Lunar Hub!",
	Icon = "moon",
	Duration = 5
})
