-- Generated from template


require('barebones')
require('timers')
require('util')
require('multiteam')

cntxt = 0

if CReIncarnationGameMode == nil then
	CReIncarnationGameMode = class({})
end

function Precache( context )
	cntxt = context
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
	PrecacheUnitByNameSync("npc_dota_hero_furion", context)
	PrecacheUnitByNameSync("npc_dota_hero_kunkka", context)
	PrecacheUnitByNameSync("npc_dota_hero_witchdoctor", context)
	PrecacheUnitByNameSync("npc_dota_hero_dragon_knight", context)
	PrecacheUnitByNameSync("npc_dota_hero_invoker", context)
	PrecacheUnitByNameSync("npc_dota_hero_windrunner", context)
	PrecacheUnitByNameSync("npc_dota_hero_broodmother", context)
	PrecacheUnitByNameSync("npc_dota_hero_juggernaut", context)
	PrecacheUnitByNameSync("npc_dota_hero_medusa", context)
	PrecacheUnitByNameSync("npc_dota_hero_sven", context)
	PrecacheUnitByNameSync("npc_dota_hero_lone_druid", context)
	PrecacheUnitByNameSync("npc_dota_hero_storm_spirit", context)
	PrecacheUnitByNameSync("npc_dota_hero_silencer", context)
	PrecacheUnitByNameSync("npc_dota_hero_sniper", context)
	PrecacheUnitByNameSync("npc_dota_hero_dazzle", context)
	PrecacheUnitByNameSync("npc_dota_hero_riki", context)
	
	PrecacheUnitByNameSync("npc_dota_creature_kobold_tunneler", context)
	PrecacheUnitByNameSync("npc_dota_creature_gnoll_assassin", context)
	PrecacheUnitByNameSync("npc_dota_creature_troll_healer", context)
	PrecacheUnitByNameSync("npc_dota_creature_basic_zombie", context)
	PrecacheUnitByNameSync("npc_dota_creature_basic_zombie_exploding", context)
	PrecacheUnitByNameSync("npc_dota_creature_berserk_zombie", context)
	PrecacheUnitByNameSync("npc_dota_creature_small_spirit_bear", context)
	PrecacheUnitByNameSync("npc_dota_small_wolf", context)
	PrecacheUnitByNameSync("npc_dota_creature_king_treant", context)
	PrecacheUnitByNameSync("npc_dota_creature_corpselord", context)
	
	PrecacheUnitByNameSync("npc_dota_hero_novice_protagonist", context)
	
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_invoker.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_windrunner.vsndevts", context)
	PrecacheResource("particle", "particles/hw_fx/hw_rosh_fireball.vpcf", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_windrunner", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_invoker", context)
	PrecacheResource("particle", "particles/units/heroes/hero_medusa/medusa_mana_shield.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_dazzle/dazzle_armor_friend_shield.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_medusa/medusa_mana_shield_cast.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_medusa/medusa_mana_shield_spiral02.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_medusa/medusa_mana_shield_oval_highlight.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_medusa/medusa_mana_shield_shell.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_medusa/medusa_mana_shield_oval.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_medusa/medusa_mana_shield_oval2.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_medusa/medusa_mana_shield_oval_highlight2.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_medusa/medusa_mana_shield_end.vpcf", context)
	PrecacheResource("particle", "particles/imposingwill.vpcf", context )
	PrecacheResource("particle", "particles/units/heroes/hero_juggernaut/juggernaut_blade_fury.vpcf", context )
	PrecacheResource("particle", "particles/units/heroes/hero_juggernaut/juggernaut_blade_fury_tgt.vpcf", context )
	PrecacheResource("particle", "particles/coldsteel.vpcf", context )
	PrecacheResource("particle", "particles/coldsteel2.vpcf", context )
	PrecacheResource("particle", "particles/leechblade.vpcf", context )
	PrecacheResource("particle", "particles/pyredge.vpcf", context )
	PrecacheResource("particle", "particles/shockpoint.vpcf", context )
	PrecacheResource("particle", "particles/units/heroes/hero_zuus/zuus_arc_lightning.vpcf", context )
	PrecacheResource("particle", "particles/units/heroes/hero_invoker/invoker_chaos_meteor_burn_debuff.vpcf", context )
	PrecacheResource("particle", "particles/physiology_stunned.vpcf", context )
	PrecacheResource("particle", "particles/daggers.vpcf", context )
	PrecacheResource("particle", "particles/daggers_slow.vpcf", context )
	PrecacheResource("particle", "particles/daggers_frailty.vpcf", context )
	PrecacheResource("particle", "particles/daggers_damage.vpcf", context )
	PrecacheResource("particle", "particles/herbalism_slow_drips.vpcf", context )
	PrecacheResource("particle", "particles/herbalism_frailty_drips.vpcf", context )
	PrecacheResource("particle", "particles/herbalism_damage_drips.vpcf", context )
	PrecacheResource("particle", "particles/herbalism_damage_debuff_drips.vpcf", context )
	PrecacheResource("particle", "particles/herbalism_frailty_debuff_drips.vpcf", context )
	PrecacheResource("particle", "particles/herbalism_slow_debuff_drips.vpcf", context )
	
	PrecacheUnitByNameSync('npc_precache_everything', context)
	PrecacheUnitByNameSync('npc_dota_hero_ancient_apparition', context)
	PrecacheUnitByNameSync('npc_dota_hero_antimage', context)
	PrecacheUnitByNameSync('npc_dota_hero_axe', context)
	PrecacheUnitByNameSync('npc_dota_hero_bane', context)
	PrecacheUnitByNameSync('npc_dota_hero_beastmaster', context)
	PrecacheUnitByNameSync('npc_dota_hero_bloodseeker', context)
	PrecacheUnitByNameSync('npc_dota_hero_chen', context)
	PrecacheUnitByNameSync('npc_dota_hero_crystal_maiden', context)
	PrecacheUnitByNameSync('npc_dota_hero_dark_seer', context)
	PrecacheUnitByNameSync('npc_dota_hero_dazzle', context)
	PrecacheUnitByNameSync('npc_dota_hero_magnataur', context)

	PrecacheResource("particle_folder", "particles/units/heroes/hero_antimage", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_bloodseeker", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_crystalmaiden", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_drow", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_mirana", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_morphling", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_puck", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_pudge", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_vengeful", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_zuus", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_lina", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_enigma", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_sniper", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_queenofpain", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_venomancer", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_faceless_void", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_skeletonking", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_death_prophet", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_rattletrap", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_life_stealer", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_dark_seer", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_omniknight", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_batrider", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_ancient_apparition", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_gyrocopter", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_alchemist", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_invoker", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_obsidian_destroyer", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_meepo", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_disruptor", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_siren", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_keeper_of_the_light", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_wisp", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_magnataur", context)
	PrecacheResource("particle", "particles/units/heroes/hero_magnataur/magnataur_shockwave.vpcf", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_skywrath_mage", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_abaddon", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_ember_spirit", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_earth_spirit", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_windrunner", context)
	PrecacheResource("particle_folder", "particles/frostivus_herofx", context)
	PrecacheResource("particle_folder", "particles/frostivus_gameplay", context)
	PrecacheResource("particle_folder", "particles/test_particle", context)
	PrecacheResource("particle_folder", "particles/reflex_puck", context)
	PrecacheResource("particle_folder", "particles/nian_gameplay", context)
	PrecacheResource("particle_folder", "particles/generic_aoe_shockwave_1/generic_aoe_shockwave_1", context)
	PrecacheResource("particle_folder", "particles/generic_gameplay", context)
	PrecacheResource("particle_folder", "particles/econ/generic/generic_timer", context)
	PrecacheResource("particle_folder", "particles/reflex_ember", context)
	PrecacheResource("particle_folder", "particles/reflex_particles", context)
	PrecacheResource("particle_folder", "particles/items_fx", context)
	PrecacheResource("particle_folder", "particles/items2_fx", context)
	PrecacheResource("particle_folder", "particles/econ/generic", context)
	PrecacheResource("particle_folder", "particles/newplayer_fx", context)

	PrecacheModel("models/heroes/rattletrap/rattletrap_cog.vmdl", context)
	PrecacheModel("models/heroes/nightstalker/nightstalker.vmdl", context)
	PrecacheModel("models/heroes/lycan/lycan_wolf.vmdl", context)
	PrecacheModel("models/development/invisiblebox.vmdl", context)
	PrecacheModel("models/heroes/pudge/weapon.vmdl", context)
	PrecacheModel("models/props_items/necronomicon.vmdl", context)

	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_antimage.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_crystalmaiden.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_drowranger.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_puck.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_pudge.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_vengefulspirit.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_enigma.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_sniper.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_queenofpain.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_venomancer.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_skeletonking.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_rattletrap.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_leshrac.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_life_stealer.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_dark_seer.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_batrider.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_ancient_apparition.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_gyrocopter.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_alchemist.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_invoker.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_lycan.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_meepo.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_ogre_magi.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_disruptor.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_naga_siren.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_keeper_of_the_light.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_wisp.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_magnataur.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_skywrath_mage.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_abaddon.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_ember_spirit.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_earth_spirit.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_windrunner.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_witchdoctor.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_medusa.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_jakiro.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_omniknight.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_bane.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_custom.vsndevts", context)
end

-- Create the game mode when we activate
function Activate()
	GameRules.CReIncarnationGameMode = CReIncarnationGameMode()
	GameRules.CReIncarnationGameMode:InitGameMode()
end

local precache = false

-- Initialize the game
--[[function CReIncarnationGameMode:InitGameMode()
	
	self.unitsWaitingForRespawnList = {}
	self.unitsWaitingForRespawnArea = {}
	self.unitsWaitingForRespawnTime = {}
	self.unitsWaitingForRespawnSpawner = {}
	
	self._ReadGameConfiguration()
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
	ListenToGameEvent('npc_spawned', Dynamic_Wrap( CReIncarnationGameMode, 'OnNPCSpawned'), self )
	ListenToGameEvent('entity_killed', Dynamic_Wrap( CReIncarnationGameMode, 'OnEntityKilled'), self )
	ListenToGameEvent('game_rules_state_change', Dynamic_Wrap(CPRGGameMode, 'OnGameRulesStateChange'), self)

end]]

-- Read and assign configurable keyvalues if applicable
function CReIncarnationGameMode:_ReadGameConfiguration()
	local kv = LoadKeyValues( "scripts/maps/reincarnation.txt" )	--set kv (keyvalue) to ReIncarnation.txt values
	kv = kv or {} -- Handle the case where there is not keyvalues file

	CReIncarnationGameMode:_ReadLootItemDropsConfiguration( kv["ItemDrops"] )
	CReIncarnationGameMode:_ReadSpawnsConfiguration( kv["spawn_info"]["noob_spawns"], kv["spawn_info"]["novice_spawns"], kv["spawn_info"]["medium_spawns"], kv["spawn_info"]["hard_spawns"], kv["spawn_info"]["noob_npcs"], kv["spawn_info"]["novice_npcs"], kv["spawn_info"]["medium_npcs"], kv["spawn_info"]["hard_npcs"], kv["spawn_info"]["hard_boss"], kv["spawn_info"]["hard_boss_npcs"], kv["spawn_info"]["novice_boss"], kv["spawn_info"]["novice_boss_npcs"], kv["spawn_info"]["expert_boss"], kv["spawn_info"]["expert_boss_npcs"]	)
end

-- Evaluate the state of the game
function CReIncarnationGameMode:OnThink()

	self:CheckNPCRespawns()
	
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		--print( "ReIncarnation script is running: " .. GameRules:GetGameTime() )
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end

-- Read Spawns Configurations and creates tables from data
function CReIncarnationGameMode:_ReadSpawnsConfiguration(  kvNoob, kvNovice, kvMedium, kvHard, kvNoobNPC, kvNoviceNPC, kvMediumNPC, kvHardNPC, kvHardBoss, kvHardBossNPC,  kvNoviceBoss, kvNoviceBossNPC, kvExpertBoss, kvExpertBossNPC )
	--Set up Noob spawns tables
	self._vNoobSpawnsList = {}					--The table containing the spawn locations for the area
	self._vRandomNPCSpawnsListNoob = {}			--The table containing the npc's for the area
	for _,sp in pairs( kvNoob ) do			
		table.insert( self._vNoobSpawnsList, {
			szSpawnerName = sp.SpawnerName or "",
			szSpawnMax = sp.SpawnMax or ""
		} )
		--print("SpawnMax" .. sp.SpawnMax)
	end
	for i, sp in pairs(kvNoobNPC) do
		table.insert( self._vRandomNPCSpawnsListNoob, {
			szNPCName = sp.npc or ""
		} )
	end

	--Set up novice spawns tables
	self._vNoviceSpawnsList = {}
	self._vRandomNPCSpawnsListNovice = {}
	for _,sp in pairs( kvNovice ) do			
		table.insert( self._vNoviceSpawnsList, {
			szSpawnerName = sp.SpawnerName or "",
			szSpawnMax = sp.SpawnMax or ""
		} )
		--print("SpawnMax" .. sp.SpawnMax)
	end
	for i, sp in pairs(kvNoviceNPC) do
		table.insert( self._vRandomNPCSpawnsListNovice, {
			szNPCName = sp.npc or ""
		} )
	end

	--Set up hard spawns tables
	self._vHardSpawnsList = {}
	self._vRandomNPCSpawnsListHard = {}
	for _,sp in pairs( kvHard ) do			
		table.insert( self._vHardSpawnsList, {
			szSpawnerName = sp.SpawnerName or "",
			szSpawnMax = sp.SpawnMax or ""
		} )
		--print("SpawnMax" .. sp.SpawnMax)
	end
	for i, sp in pairs(kvHardNPC) do
		table.insert( self._vRandomNPCSpawnsListHard, {
			szNPCName = sp.npc or ""
		} )
	end

	--Set up medium spawns tables
	self._vMediumSpawnsList = {}
	self._vRandomNPCSpawnsListMedium = {}
	for _,sp in pairs( kvMedium ) do			
		table.insert( self._vMediumSpawnsList, {
			szSpawnerName = sp.SpawnerName or "",
			szSpawnMax = sp.SpawnMax or ""
		} )
		--print("SpawnMax" .. sp.SpawnMax)
	end
	for i, sp in pairs(kvMediumNPC) do
		table.insert( self._vRandomNPCSpawnsListMedium, {
			szNPCName = sp.npc or ""
		} ) 
	end
	
	--Set up noviceBoss spawns tables
	self._vNoviceBossSpawnsList = {}
	self._vRandomNPCSpawnsListNoviceBoss = {}
	for _,sp in pairs( kvNoviceBoss ) do			
		table.insert( self._vNoviceBossSpawnsList, {
			szSpawnerName = sp.SpawnerName or "",
			szSpawnMax = sp.SpawnMax or ""
		} )
		--print("SpawnMax" .. sp.SpawnMax)
	end
	for i, sp in pairs(kvNoviceBossNPC) do
		table.insert( self._vRandomNPCSpawnsListNoviceBoss, {
			szNPCName = sp.npc or ""
		} ) 
	end
	
	--Set up hardBoss spawns tables
	self._vHardBossSpawnsList = {}
	self._vRandomNPCSpawnsListHardBoss = {}
	for _,sp in pairs( kvHardBoss ) do			
		table.insert( self._vHardBossSpawnsList, {
			szSpawnerName = sp.SpawnerName or "",
			szSpawnMax = sp.SpawnMax or ""
		} )
		--print("SpawnMax" .. sp.SpawnMax)
	end
	for i, sp in pairs(kvHardBossNPC) do
		table.insert( self._vRandomNPCSpawnsListHardBoss, {
			szNPCName = sp.npc or ""
		} ) 
	end
	
	--Set up expertBoss spawns tables
	self._vExpertBossSpawnsList = {}
	self._vRandomNPCSpawnsListExpertBoss = {}
	for _,sp in pairs( kvExpertBoss ) do			
		table.insert( self._vExpertBossSpawnsList, {
			szSpawnerName = sp.SpawnerName or "",
			szSpawnMax = sp.SpawnMax or ""
		} )
		--print("SpawnMax" .. sp.SpawnMax)
	end
	for i, sp in pairs(kvExpertBossNPC) do
		table.insert( self._vRandomNPCSpawnsListExpertBoss, {
			szNPCName = sp.npc or ""
		} ) 
	end
	
	self:_SetupSpawns()
end

-- Evaluate npc spawning
function CReIncarnationGameMode:_SetupSpawns()
	--print("Function _SetupSpawns")
	
	--Spawn Noob npc's
	--print("Spawn noob npc's")
	for i = 1, #self._vNoobSpawnsList do
		--print("Spawning npc")
		local area = "noob"
		xyz = self._vNoobSpawnsList[i]
		local vBaseSpawnLocation = CReIncarnationGameMode:_GetSpawnLocation(xyz)
		local _waypoint = (xyz.szSpawnerName)
		if Entities:FindByName( nil, (_waypoint) ) then
			_wp = Entities:FindByName( nil, (_waypoint))
		else
			print("waypoint not found")
		end
		if vBaseSpawnLocation ~= nil then
			local vSpawnLocation = vBaseSpawnLocation + RandomVector( RandomFloat( 0, 200 ) )
			for iUnit = 1, xyz.szSpawnMax do
				self:DoSpawn( area, vSpawnLocation, _wp )
			end
		end
	end

	--Spawn Novice npc's
	--print("Spawn Novice npc's")
	for i = 1, #self._vNoviceSpawnsList do
		--print("Spawning npc")
		local area = "novice"
		xyz = self._vNoviceSpawnsList[i]
		local vBaseSpawnLocation = CReIncarnationGameMode:_GetSpawnLocation(xyz)
		local _waypoint = (xyz.szSpawnerName)
		if Entities:FindByName( nil, (_waypoint) ) then
			_wp = Entities:FindByName( nil, (_waypoint))
		else
			print("waypoint not found")
		end
		if vBaseSpawnLocation ~= nil then
			local vSpawnLocation = vBaseSpawnLocation + RandomVector( RandomFloat( 0, 200 ) )
			for iUnit = 1, xyz.szSpawnMax do
				self:DoSpawn( area, vSpawnLocation, _wp )
			end
		end
	end
	
	--Spawn Hard npc's
	--print("Spawn Hard npc's")
	for i = 1, #self._vHardSpawnsList do
		--print("Spawning npc")
		local area = "hard"
		xyz = self._vHardSpawnsList[i]
		local vBaseSpawnLocation = CReIncarnationGameMode:_GetSpawnLocation(xyz)
		local _waypoint = (xyz.szSpawnerName)
		if Entities:FindByName( nil, (_waypoint) ) then
			_wp = Entities:FindByName( nil, (_waypoint))
		else
			print("waypoint not found")
		end
		if vBaseSpawnLocation ~= nil then
			local vSpawnLocation = vBaseSpawnLocation + RandomVector( RandomFloat( 0, 200 ) )
			for iUnit = 1, xyz.szSpawnMax do
				self:DoSpawn( area, vSpawnLocation, _wp )
			end
		end
	end

	--Spawn Medium npc's
	--print("Spawn Medium npc's")
	for i = 1, #self._vMediumSpawnsList do
		--print("Spawning npc")
		local area = "medium"
		xyz = self._vMediumSpawnsList[i]
		local vBaseSpawnLocation = CReIncarnationGameMode:_GetSpawnLocation(xyz)
		local _waypoint = (xyz.szSpawnerName)
		if Entities:FindByName( nil, (_waypoint) ) then
			_wp = Entities:FindByName( nil, (_waypoint))
		else
			print("waypoint not found")
		end
		if vBaseSpawnLocation ~= nil then
			local vSpawnLocation = vBaseSpawnLocation + RandomVector( RandomFloat( 0, 200 ) )
			for iUnit = 1, xyz.szSpawnMax do
				self:DoSpawn( area, vSpawnLocation, _wp )
			end
		end
	end
	
	--Spawn Novice Boss
	--print("Spawn Novice Boss")
	for i = 1, #self._vNoviceBossSpawnsList do
		--print("Spawning npc")
		local area = "noviceBoss"
		xyz = self._vNoviceBossSpawnsList[i]
		local vBaseSpawnLocation = CReIncarnationGameMode:_GetSpawnLocation(xyz)
		local _waypoint = (xyz.szSpawnerName)
		if Entities:FindByName( nil, (_waypoint) ) then
			_wp = Entities:FindByName( nil, (_waypoint))
		else
			print("waypoint not found")
		end
		if vBaseSpawnLocation ~= nil then
			local vSpawnLocation = vBaseSpawnLocation + RandomVector( RandomFloat( 0, 200 ) )
			for iUnit = 1, xyz.szSpawnMax do
				self:DoSpawn( area, vSpawnLocation, _wp )
			end
		end
	end
	
	--Spawn Hard Boss
	--print("Spawn Hard Boss")
	for i = 1, #self._vHardBossSpawnsList do
		--print("Spawning npc")
		local area = "hardBoss"
		xyz = self._vHardBossSpawnsList[i]
		local vBaseSpawnLocation = CReIncarnationGameMode:_GetSpawnLocation(xyz)
		local _waypoint = (xyz.szSpawnerName)
		if Entities:FindByName( nil, (_waypoint) ) then
			_wp = Entities:FindByName( nil, (_waypoint))
		else
			print("waypoint not found")
		end
		if vBaseSpawnLocation ~= nil then
			local vSpawnLocation = vBaseSpawnLocation + RandomVector( RandomFloat( 0, 200 ) )
			for iUnit = 1, xyz.szSpawnMax do
				self:DoSpawn( area, vSpawnLocation, _wp )
			end
		end
	end
	
	--Spawn Expert Boss
	--print("Spawn Expert Boss")
	for i = 1, #self._vExpertBossSpawnsList do
		--print("Spawning npc")
		local area = "expertBoss"
		xyz = self._vExpertBossSpawnsList[i]
		local vBaseSpawnLocation = CReIncarnationGameMode:_GetSpawnLocation(xyz)
		local _waypoint = (xyz.szSpawnerName)
		if Entities:FindByName( nil, (_waypoint) ) then
			_wp = Entities:FindByName( nil, (_waypoint))
		else
			print("waypoint not found")
		end
		if vBaseSpawnLocation ~= nil then
			local vSpawnLocation = vBaseSpawnLocation + RandomVector( RandomFloat( 0, 200 ) )
			for iUnit = 1, xyz.szSpawnMax do
				self:DoSpawn( area, vSpawnLocation, _wp )
			end
		end
	end
end

function CReIncarnationGameMode:DoSpawn( area, vSpawnLocation, _wp )
	print("area = " .. area)
	local unitToSpawn = self:_GetRandomNPC(area)
	print(unitToSpawn.szNPCName .. " is being spawned")
		--PrintTable(vSpawnLocation)
		--print(getmetatable(vSpawnLocation))
		--print("vSpawnLocation is " .. vSpawnLocation)
	local entUnit = CreateUnitByName( unitToSpawn.szNPCName, vSpawnLocation, true, nil, nil, DOTA_TEAM_BADGUYS )
	--local entUnit = CreateUnitByName( unitToSpawn.szNPCName, _wp:GetAbsOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS )
	if _wp and entUnit ~= nil then
		print("entUnit is " .. entUnit:GetName())
		entUnit:SetInitialGoalEntity( _wp )
		entUnit.difficulty = area
	end
end

-- Get the location of the spawner
function CReIncarnationGameMode:_GetSpawnLocation(abc)
	--print("Function _GetSpawnLocation with " .. abc.szSpawnerName .. " and " .. abc.szSpawnMax)
	CReIncarnationGameMode._vecSpawnLocation = Vector( 0, 0, 0 )
	local entSpawner = Entities:FindByName( nil, (abc.szSpawnerName) )
	if entSpawner then
		--print("Spawner found: ")
	elseif entSpawner == nil then
		print("Spawner not found: " .. abc.szSpawnerName)
		return
	end
	CReIncarnationGameMode._vecSpawnLocation = entSpawner:GetAbsOrigin()
	--print("Got spawn location")
	return CReIncarnationGameMode._vecSpawnLocation
end

function CReIncarnationGameMode:_GetRandomNPC( arg )
	local area = arg
	if area == "noob" then
		print("Area is noob")
		return self._vRandomNPCSpawnsListNoob[ RandomInt( 1, #self._vRandomNPCSpawnsListNoob ) ]
	end
	
	if area == "novice" then
		print("Area is novice")
		return self._vRandomNPCSpawnsListNovice[ RandomInt( 1, #self._vRandomNPCSpawnsListNovice ) ]
	end
	
	if area == "hard" then
		print("Area is hard")
		return self._vRandomNPCSpawnsListHard[ RandomInt( 1, #self._vRandomNPCSpawnsListHard ) ]
	end
	
	if area == "medium" then
		print("Area is medium")
		return self._vRandomNPCSpawnsListMedium[ RandomInt( 1, #self._vRandomNPCSpawnsListMedium ) ]
	end
	
	if area == "noviceBoss" then
		print("Area is noviceBoss")
		return self._vRandomNPCSpawnsListNoviceBoss[ RandomInt( 1, #self._vRandomNPCSpawnsListNoviceBoss) ]
	end
	
	if area == "hardBoss" then
		print("Area is hardBoss")
		return self._vRandomNPCSpawnsListHardBoss[ RandomInt( 1, #self._vRandomNPCSpawnsListHardBoss) ]
	end
	
	if area == "expertBoss" then
		print("Area is expertBoss")
		return self._vRandomNPCSpawnsListExpertBoss[ RandomInt( 1, #self._vRandomNPCSpawnsListExpertBoss) ]
	end
	
	print("Area non-existent, area is" .. area)
	
end

--[[function CReIncarnationGameMode:OnNPCSpawned(keys)
	local spawnedUnit = EntIndexToHScript( keys.entindex )
	if spawnedUnit:IsCreature() and spawnedUnit:IsControllableByAnyPlayer() == false then
		--spawnedUnit:SetHPGain( spawnedUnit:GetMaxHealth() * numPlayers ) -- LEVEL SCALING VALUE FOR HP
		--spawnedUnit:CreatureLevelUp( numPlayers )
	end
	
	if spawnedUnit:IsCreature() and spawnedUnit:GetUnitName() == "npc_dota_creature_beastally_spiderling" then
		spawnedUnit.healthBonus = 0
		CReIncarnationGameMode:ModifyBeastAllyStats(spawnedUnit)
	end
	
	if not spawnedUnit:IsIllusion() and spawnedUnit:IsHero() and spawnedUnit:GetUnitName() == "npc_dota_hero_kunkka" and spawnedUnit:GetDeaths() == 0 then
				Say(nil,"ReIncarnation Version: " .. _Version, false)
				spawnPot = CreateItem("item_custom_minor_potion", spawnedUnit, spawnedUnit)
				spawnedUnit:AddItem(spawnPot)
				ShowGenericPopupToPlayer( spawnedUnit:GetPlayerOwner() , "popup_title_beginning", "popup_body_beginning", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
        end
end]]

function CReIncarnationGameMode:CheckNPCRespawns()
	for c, respawnInfo in pairs( self.unitsWaitingForRespawnList ) do
		local area = respawnInfo.szdifficulty
		local respawnTime = respawnInfo.szrespawnTime
		local _wp = respawnInfo.sz_wp
		--print("Spawn location = " .. _wp)
		if area then
			if _wp then
				if respawnTime <= GameRules:GetGameTime() then
					--print("area = " .. area)
					print("respawnTime = " .. respawnTime)
					local vSpawnLocation = _wp:GetAbsOrigin()
					self:DoSpawn( area, vSpawnLocation, _wp )
					table.remove( self.unitsWaitingForRespawnList, c )
				end
			end
		end
	end
end

-- If random drops are defined read in that data
function CReIncarnationGameMode:_ReadLootItemDropsConfiguration( kvLootDrops )
	self._vLootItemDropsList = {}
	if type( kvLootDrops ) ~= "table" then
		return
	end
	for _,lootItem in pairs( kvLootDrops ) do
		table.insert( self._vLootItemDropsList, {
			szItemName = lootItem.Item or "",
			nChance = tonumber( lootItem.Chance or 0 )
		})
	end
end

function CReIncarnationGameMode:CheckForLootItemDrop( killedUnit )
	for _,itemDropInfo in pairs( self._vLootItemDropsList ) do
		if RollPercentage( itemDropInfo.nChance ) then
			local newItem = CreateItem( itemDropInfo.szItemName, nil, nil )
			newItem:SetPurchaseTime( 0 )
			if newItem:IsPermanent() and newItem:GetShareability() == ITEM_FULLY_SHAREABLE then
				item:SetStacksWithOtherOwners( true )
			end
			local drop = CreateItemOnPositionSync( killedUnit:GetAbsOrigin(), newItem )
			drop.RPG_IsLootDrop = true
		end
	end
end

function CReIncarnationGameMode:ModifyBeastAllyStats( unit )
	local spawnedUnitIndex = unit
	print("modifying stat bonuses")
		Timers:CreateTimer(DoUniqueString("updateHealth_" .. spawnedUnitIndex:GetPlayerOwnerID()), {
		endTime = 0.25,
		callback = function()
			-- ==================================
			-- Adjust health based on player health
			-- ==================================

			-- Get unit health
			local playerHero = unit:GetPlayerOwner():GetAssignedHero()
			print("Player hero is " .. playerHero:GetName())
			local playerHealth = playerHero:GetMaxHealth()
			print("Player health is " .. playerHealth)
			local health = spawnedUnitIndex:GetMaxHealth()
			print("Health is " .. health)
			
			--Check if strBonus is stored on hero, if not set it to 0
			if spawnedUnitIndex.healthBonus == nil then
				spawnedUnitIndex.healthBonus = 0
			end

			-- If player strength is different this time around, start the adjustment
			if spawnedUnitIndex.healthBonus ~= playerHealth then
				-- Modifier values
				local bitTable = {512,256,128,64,32,16,8,4,2,1}

				-- Gets the list of modifiers on the hero and loops through removing and health modifier
				for u = 1, #bitTable do
					local val = bitTable[u]
					if spawnedUnitIndex:HasModifier("modifier_health_mod_" .. val)  then
						spawnedUnitIndex:RemoveModifierByName("modifier_health_mod_" .. val)
					end
				end
				
				-- Creates temporary item to steal the modifiers from
				local healthUpdater = CreateItem("item_apply_modifiers_stats", spawnedUnitIndex, spawnedUnitIndex)
				for p=1, #bitTable do
					local val = bitTable[p]
					local count = math.floor(playerHealth / val)
					if count >= 1 then
						healthUpdater:ApplyDataDrivenModifier(spawnedUnitIndex, spawnedUnitIndex, "modifier_health_mod_" .. val, {duration = 5})
						print("count is " .. val)
						playerHealth = playerHealth - val
					end
				end
				-- Cleanup
				--UTIL_RemoveImmediate(healthUpdater)
				--healthUpdater = nil
			end
			-- Updates the stored strength bonus value for next timer cycle
			spawnedUnitIndex.healthBonus = playerHero:GetMaxHealth()
			return 0.25
		end
	})
end