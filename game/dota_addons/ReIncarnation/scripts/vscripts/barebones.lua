print ('[BAREBONES] barebones.lua' )
require('popup')
_Version = "0.1.6c"

ENABLE_HERO_RESPAWN = true              -- Should the heroes automatically respawn on a timer or stay dead until manually respawned
UNIVERSAL_SHOP_MODE = false             -- Should the main shop contain Secret Shop items as well as regular items
ALLOW_SAME_HERO_SELECTION = true        -- Should we let people select the same hero as each other

HERO_SELECTION_TIME = 0.0              -- How long should we let people select their hero?
PRE_GAME_TIME = 0.0                    -- How long after people select their heroes should the horn blow and the game start?
POST_GAME_TIME = 0.0                   -- How long should we let people look at the scoreboard before closing the server automatically?
TREE_REGROW_TIME = 60.0                 -- How long should it take individual trees to respawn after being cut down/destroyed?

GOLD_PER_TICK = 0                     -- How much gold should players get per tick?
GOLD_TICK_TIME = 60                      -- How long should we wait in seconds between gold ticks?

RECOMMENDED_BUILDS_DISABLED = true     -- Should we disable the recommened builds for heroes (Note: this is not working currently I believe)
CAMERA_DISTANCE_OVERRIDE = 1134.0        -- How far out should we allow the camera to go?  1134 is the default in Dota

MINIMAP_ICON_SIZE = 1                 -- What icon size should we use for our heroes?
MINIMAP_CREEP_ICON_SIZE = 1             -- What icon size should we use for creeps?
MINIMAP_RUNE_ICON_SIZE = 1            -- What icon size should we use for runes?

RUNE_SPAWN_TIME = 120                    -- How long in seconds should we wait between rune spawns?
CUSTOM_BUYBACK_COST_ENABLED = true      -- Should we use a custom buyback cost setting?
CUSTOM_BUYBACK_COOLDOWN_ENABLED = true  -- Should we use a custom buyback time?
BUYBACK_ENABLED = false                 -- Should we allow people to buyback when they die?

DISABLE_FOG_OF_WAR_ENTIRELY = false      -- Should we disable fog of war entirely for both teams?
--USE_STANDARD_DOTA_BOT_THINKING = false  -- Should we have bots act like they would in Dota? (This requires 3 lanes, normal items, etc)
USE_STANDARD_HERO_GOLD_BOUNTY = true    -- Should we give gold for hero kills the same as in Dota, or allow those values to be changed?

USE_CUSTOM_TOP_BAR_VALUES = true        -- Should we do customized top bar values or use the default kill count per team?
TOP_BAR_VISIBLE = false                  -- Should we display the top bar score/count at all?
SHOW_KILLS_ON_TOPBAR = true             -- Should we display kills only on the top bar? (No denies, suicides, kills by neutrals)  Requires USE_CUSTOM_TOP_BAR_VALUES

ENABLE_TOWER_BACKDOOR_PROTECTION = false-- Should we enable backdoor protection for our towers?
REMOVE_ILLUSIONS_ON_DEATH = false       -- Should we remove all illusions if the main hero dies?
DISABLE_GOLD_SOUNDS = false             -- Should we disable the gold sound when players get gold?

END_GAME_ON_KILLS = false                -- Should the game end after a certain number of kills?
KILLS_TO_END_GAME_FOR_TEAM = 50         -- How many kills for a team should signify an end of game?

USE_CUSTOM_HERO_LEVELS = true           -- Should we allow heroes to have custom levels?
MAX_LEVEL = 50                          -- What level should we let heroes get to?
USE_CUSTOM_XP_VALUES = true             -- Should we use custom XP values to level up heroes, or the default Dota numbers?

-- Fill this table up with the required XP per level if you want to change it
XP_PER_LEVEL_TABLE = {}
for i=1,MAX_LEVEL do
	if i == 1 then
		XP_PER_LEVEL_TABLE[i] = 0
	else
		XP_PER_LEVEL_TABLE[i] = (XP_PER_LEVEL_TABLE[i - 1] + i * 100)
	end
end

-- Generated from template
if CReIncarnationGameMode == nil then
    print ( '[BAREBONES] creating barebones game mode' )
    CReIncarnationGameMode = class({})
end


--[[
  This function should be used to set up Async precache calls at the beginning of the game.  The Precache() function 
  in addon_game_mode.lua used to and may still sometimes have issues with client's appropriately precaching stuff.
  If this occurs it causes the client to never precache things configured in that block.

  In this function, place all of your PrecacheItemByNameAsync and PrecacheUnitByNameAsync.  These calls will be made
  after all players have loaded in, but before they have selected their heroes. PrecacheItemByNameAsync can also
  be used to precache dynamically-added datadriven abilities instead of items.  PrecacheUnitByNameAsync will 
  precache the precache{} block statement of the unit and all precache{} block statements for every Ability# 
  defined on the unit.

  This function should only be called once.  If you want to/need to precache more items/abilities/units at a later
  time, you can call the functions individually (for example if you want to precache units in a new wave of
  holdout).
]]
function CReIncarnationGameMode:PostLoadPrecache()
  print("[BAREBONES] Performing Post-Load precache")    
  --PrecacheItemByNameAsync("item_example_item", function(...) end)
  --PrecacheItemByNameAsync("example_ability", function(...) end)

	PrecacheUnitByNameAsync("npc_dota_hero_viper", function(...) end)
	PrecacheUnitByNameAsync("npc_dota_hero_enigma", function(...) end)
  
	PrecacheUnitByNameASync("npc_dota_hero_furion", function(...) end)
	PrecacheUnitByNameASync("npc_dota_hero_kunkka", function(...) end)
	PrecacheUnitByNameASync("npc_dota_hero_witchdoctor", function(...) end)
	PrecacheUnitByNameASync("npc_dota_hero_dragon_knight", function(...) end)
	PrecacheUnitByNameASync("npc_dota_hero_invoker", function(...) end)
	PrecacheUnitByNameASync("npc_dota_hero_windrunner", function(...) end)
	PrecacheUnitByNameASync("npc_dota_hero_broodmother", function(...) end)
	PrecacheUnitByNameASync("npc_dota_hero_juggernaut", function(...) end)
	PrecacheUnitByNameASync("npc_dota_hero_medusa", function(...) end)
	PrecacheUnitByNameASync("npc_dota_hero_sven", function(...) end)
	PrecacheUnitByNameASync("npc_dota_hero_lone_druid", function(...) end)
	PrecacheUnitByNameASync("npc_dota_hero_storm_spirit", function(...) end)
	PrecacheUnitByNameASync("npc_dota_hero_silencer", function(...) end)
	PrecacheUnitByNameASync("npc_dota_hero_sniper", function(...) end)
	PrecacheUnitByNameASync("npc_dota_hero_dazzle", function(...) end)
	PrecacheUnitByNameASync("npc_dota_hero_riki", function(...) end)
	
	PrecacheUnitByNameSync("npc_dota_creature_kobold_tunneler", function(...) end)
	PrecacheUnitByNameASync("npc_dota_creature_gnoll_assassin", function(...) end)
	PrecacheUnitByNameASync("npc_dota_creature_troll_healer", function(...) end)
	PrecacheUnitByNameASync("npc_dota_creature_basic_zombie", function(...) end)
	PrecacheUnitByNameASync("npc_dota_creature_basic_zombie_exploding", function(...) end)
	PrecacheUnitByNameASync("npc_dota_creature_berserk_zombie", function(...) end)
	PrecacheUnitByNameASync("npc_dota_creature_small_spirit_bear", function(...) end)
	PrecacheUnitByNameASync("npc_dota_small_wolf", function(...) end)
	PrecacheUnitByNameASync("npc_dota_creature_king_treant", function(...) end)
	PrecacheUnitByNameASync("npc_dota_creature_corpselord", function(...) end)
	
	PrecacheUnitByNameASync("npc_dota_hero_novice_protagonist", function(...) end)
	
	PrecacheUnitByNameASync('npc_precache_everything', function(...) end)
	PrecacheUnitByNameASync('npc_dota_hero_ancient_apparition', function(...) end)
	PrecacheUnitByNameASync('npc_dota_hero_antimage', function(...) end)
	PrecacheUnitByNameASync('npc_dota_hero_axe', function(...) end)
	PrecacheUnitByNameASync('npc_dota_hero_bane', function(...) end)
	PrecacheUnitByNameASync('npc_dota_hero_beastmaster', function(...) end)
	PrecacheUnitByNameASync('npc_dota_hero_bloodseeker', function(...) end)
	PrecacheUnitByNameASync('npc_dota_hero_chen', function(...) end)
	PrecacheUnitByNameASync('npc_dota_hero_crystal_maiden', function(...) end)
	PrecacheUnitByNameASync('npc_dota_hero_dark_seer', function(...) end)
	PrecacheUnitByNameASync('npc_dota_hero_dazzle', function(...) end)
	PrecacheUnitByNameASync('npc_dota_hero_magnataur', function(...) end)

  --Elementalist spells
  PrecacheResource("particle_folder", "particles/elementalist", context)
  PrecacheResource("particle", "particles/elementalist/inferno.vpcf", context )
  PrecacheResource("particle", "particles/elementalist/gale.vpcf", context )
  PrecacheResource("particle", "particles/elementalist/fogofwar.vpcf", context )
  PrecacheResource("particle", "particles/elementalist/magma.vpcf", context )
  PrecacheResource("particle", "particles/elementalist/attunement_earth_glow.vpcf", context )
  PrecacheResource("particle", "particles/elementalist/attunement_wind_glow.vpcf", context )
  PrecacheResource("particle", "particles/elementalist/attunement_water_glow.vpcf", context )
  PrecacheResource("particle", "particles/elementalist/attunement_fire_glow.vpcf", context )
  PrecacheResource("particle", "particles/elementalist/firetornado.vpcf", context )
  PrecacheResource("particle", "particles/items2_fx/heavens_halberd_debuff_core.vpcf", context )
  PrecacheResource("particle", "particles/elementalist/cloudburst_lightning.vpcf", context)
  PrecacheResource("particle", "particles/units/heroes/hero_zuus/zuus_arc_lightning.vpcf", context)
  PrecacheResource("particle", "particles/elementalist/cloudburst.vpcf", context)
  PrecacheResource("particle", "particles/elementalist/pebblesalvo.vpcf", context)

  --Cultist Spells
  PrecacheResource("particle_folder", "particles/cultist", context)
  PrecacheResource("particle", "particles/cultist/locustswarm.vpcf", context)
  PrecacheResource("particle", "particles/cultist/awakenedspirit.vpcf", context)
  PrecacheResource("particle", "particles/cultist/benediction.vpcf", context)
  PrecacheResource("particle", "particles/cultist/anathema.vpcf", context)
  PrecacheResource("particle", "particles/cultist/judgementday.vpcf", context)
  PrecacheResource("particle", "particles/cultist/judgementday_pulse.vpcf", context)
  PrecacheUnitByNameASync('npc_dota_creature_lesser_daemon', function(...) end)
  PrecacheUnitByNameASync('npc_dota_creature_lesser_paegon', function(...) end)
  PrecacheResource("model", "models/items/courier/dc_angel/dc_angel_flying.vmdl", context)
  PrecacheResource("model", "models/items/courier/dc_demon/dc_demon_flying.vmdl", context)
  PrecacheResource("particle", "particles/cultist/aura_daemon_slow.vpcf", context)
  PrecacheResource("particle", "particles/cultist/aura_paegon_haste.vpcf", context)
end

--[[
  This function is called once and only once as soon as the first player (almost certain to be the server in local lobbies) loads in.
  It can be used to initialize state that isn't initializeable in InitCReIncarnationGameMode() but needs to be done before everyone loads in.
]]
function CReIncarnationGameMode:OnFirstPlayerLoaded()
  print("[BAREBONES] First Player has loaded")
end

--[[
  This function is called once and only once after all players have loaded into the game, right as the hero selection time begins.
  It can be used to initialize non-hero player state or adjust the hero selection (i.e. force random etc)
]]
function CReIncarnationGameMode:OnAllPlayersLoaded()
  print("[BAREBONES] All Players have loaded into the game")
end

--[[
  This function is called once and only once for every player when they spawn into the game for the first time.  It is also called
  if the player's hero is replaced with a new hero for any reason.  This function is useful for initializing heroes, such as adding
  levels, changing the starting gold, removing/adding abilities, adding physics, etc.

  The hero parameter is the hero entity that just spawned in
]]
function CReIncarnationGameMode:OnHeroInGame(hero)
  print("[BAREBONES] Hero spawned in game for first time -- " .. hero:GetUnitName())

  --[[ Multiteam configuration, currently unfinished

  local team = "team1"
  local playerID = hero:GetPlayerID()
  if playerID > 3 then
    team = "team2"
  end
  print("setting " .. playerID .. " to team: " .. team)
  MultiTeam:SetPlayerTeam(playerID, team)]]

  -- This line for example will set the starting gold of every hero to 500 unreliable gold
 -- hero:SetGold(500, false)

  -- These lines will create an item and add it to the player, effectively ensuring they start with the item
  --local item = CreateItem("item_multiteam_action", hero, hero)
  --hero:AddItem(item)

  --[[ --These lines if uncommented will replace the W ability of any hero that loads into the game
    --with the "example_ability" ability

  local abil = hero:GetAbilityByIndex(1)
  hero:RemoveAbility(abil:GetAbilityName())
  hero:AddAbility("example_ability")]]
end

--[[
  This function is called once and only once when the game completely begins (about 0:00 on the clock).  At this point,
  gold will begin to go up in ticks if configured, creeps will spawn, towers will become damageable etc.  This function
  is useful for starting any game logic timers/thinkers, beginning the first round, etc.
]]
function CReIncarnationGameMode:OnGameInProgress()
  print("[BAREBONES] The game has officially begun")

  Timers:CreateTimer(240, -- Start this timer 30 game-time seconds later
  function()
    print("This function is called 240 seconds after the game begins, and every 30 seconds thereafter")
    GameRules:SendCustomMessage("use -suicide if you get stuck. Requires above 75% hp", 0, 0)
    return 240.0 -- Rerun this timer every 30 game-time seconds 
  end)

  Timers:CreateTimer(500, -- Start this timer 30 game-time seconds later
  function()
    print("This function is called 500 seconds after the game begins, and every 500 seconds thereafter")
    GameRules:SendCustomMessage("If you get the error message (Item not allowed for this hero),", 0, 0)
    GameRules:SendCustomMessage("you have too many items in play", 0, 0)
    GameRules:SendCustomMessage("I am working on a fix for this", 0, 0)
    return 500.0 -- Rerun this timer every 30 game-time seconds 
  end)
end




-- Cleanup a player when they leave
function CReIncarnationGameMode:OnDisconnect(keys)
  print('[BAREBONES] Player Disconnected ' .. tostring(keys.userid))
  PrintTable(keys)

  local name = keys.name
  local networkid = keys.networkid
  local reason = keys.reason
  local userid = keys.userid

end
-- The overall game state has changed
function CReIncarnationGameMode:OnGameRulesStateChange(keys)
  print("[BAREBONES] GameRules State Changed")
  PrintTable(keys)

  local newState = GameRules:State_Get()
  if newState == DOTA_GAMERULES_STATE_WAIT_FOR_PLAYERS_TO_LOAD then
    self.bSeenWaitForPlayers = true
  elseif newState == DOTA_GAMERULES_STATE_INIT then
    Timers:RemoveTimer("alljointimer")
  elseif newState == DOTA_GAMERULES_STATE_HERO_SELECTION then
    local et = 6
    if self.bSeenWaitForPlayers then
      et = .01
    end
    Timers:CreateTimer("alljointimer", {
      useGameTime = true,
      endTime = et,
      callback = function()
        if PlayerResource:HaveAllPlayersJoined() then
          CReIncarnationGameMode:PostLoadPrecache()
          CReIncarnationGameMode:OnAllPlayersLoaded()
          return 
        end
        return 1
      end
      })
  elseif newState == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
    CReIncarnationGameMode:OnGameInProgress()
  end
end

-- An NPC has spawned somewhere in game.  This includes heroes
function CReIncarnationGameMode:OnNPCSpawned(keys)
	print("[BAREBONES] NPC Spawned")
	PrintTable(keys)
	local spawnedUnit = EntIndexToHScript( keys.entindex )

	if spawnedUnit:IsRealHero() and spawnedUnit.bFirstSpawned == nil then
		spawnedUnit.bFirstSpawned = true
		CReIncarnationGameMode:OnHeroInGame(spawnedUnit)
	end
  
	if spawnedUnit:IsCreature() and spawnedUnit:IsControllableByAnyPlayer() == false then
		--spawnedUnit:SetHPGain( spawnedUnit:GetMaxHealth() * numPlayers ) -- LEVEL SCALING VALUE FOR HP
		--spawnedUnit:CreatureLevelUp( numPlayers )
	end

	if spawnedUnit:IsCreature() and spawnedUnit:GetUnitName() == "npc_dota_creature_beastally_spiderling" then
		spawnedUnit.healthBonus = 0
		CReIncarnationGameMode:ModifyBeastAllyStats(spawnedUnit)
	end

	if not spawnedUnit:IsIllusion() and spawnedUnit:IsHero() and spawnedUnit:GetUnitName() == "npc_dota_hero_kunkka" then

    self:HideWearables(spawnedUnit)

    Timers:CreateTimer({
    useGameTime = false,
    endTime = 1, -- when this timer should first execute, you can omit this if you want it to run first on the next frame
    callback = function()
    self:HideWearables(spawnedUnit)
    end
    })
		-- Timers:CreateTimer(function() self:HideWearables(spawnedUnit) return .03 end)
    	
		if spawnedUnit:GetDeaths() == 0 then
			Say(nil,"ReIncarnation Version: " .. _Version, false)
			spawnPot = CreateItem("item_custom_minor_potion", spawnedUnit, spawnedUnit)
			spawnedUnit:AddItem(spawnPot)
			ShowGenericPopupToPlayer( spawnedUnit:GetPlayerOwner() , "popup_title_beginning", "popup_body_beginning", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
		end
	end
end

function CReIncarnationGameMode:HideWearables(keys)

	keys.hiddenWearables = {} -- Keep every wearable handle in a table to show them later
	local model = keys:FirstMoveChild()
	while model ~= nil do
		--print("Getting rid of model ")
		--PrintTable(model)
      if model:GetClassname() == "dota_item_wearable" then
      	--print("model is wearable")
          model:AddEffects(EF_NODRAW) -- Set model hidden
          --table.insert(keys.hiddenWearables, model)
      end
      model = model:NextMovePeer()
	end

end

-- An entity somewhere has been hurt.  This event fires very often with many units so don't do too many expensive
-- operations here
function CReIncarnationGameMode:OnEntityHurt(keys)
  --print("[BAREBONES] Entity Hurt")
  --PrintTable(keys)
  if keys ~= nil then
    local entCause = EntIndexToHScript(keys.entindex_attacker)
    local entVictim = EntIndexToHScript(keys.entindex_killed)
  end
end

-- An item was picked up off the ground
function CReIncarnationGameMode:OnItemPickedUp(keys)
  print ( '[BAREBONES] OnItemPurchased' )
  PrintTable(keys)

  local heroEntity = EntIndexToHScript(keys.HeroEntityIndex)
  local itemEntity = EntIndexToHScript(keys.ItemEntityIndex)
  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local itemname = keys.itemname
end

-- A player has reconnected to the game.  This function can be used to repaint Player-based particles or change
-- state as necessary
function CReIncarnationGameMode:OnPlayerReconnect(keys)
  print ( '[BAREBONES] OnPlayerReconnect' )
  PrintTable(keys) 
end

-- An item was purchased by a player
function CReIncarnationGameMode:OnItemPurchased( keys )
  print ( '[BAREBONES] OnItemPurchased' )
  PrintTable(keys)

  -- The playerID of the hero who is buying something
  local plyID = keys.PlayerID
  if not plyID then return end

  -- The name of the item purchased
  local itemName = keys.itemname 
  
  -- The cost of the item purchased
  local itemcost = keys.itemcost
  
end

-- An ability was used by a player
function CReIncarnationGameMode:OnAbilityUsed(keys)
  print('[BAREBONES] AbilityUsed')
  PrintTable(keys)

  local player = EntIndexToHScript(keys.PlayerID)
  local abilityname = keys.abilityname
end

-- A non-player entity (necro-book, chen creep, etc) used an ability
function CReIncarnationGameMode:OnNonPlayerUsedAbility(keys)
  print('[BAREBONES] OnNonPlayerUsedAbility')
  PrintTable(keys)

  local abilityname=  keys.abilityname
end

-- A player changed their name
function CReIncarnationGameMode:OnPlayerChangedName(keys)
  print('[BAREBONES] OnPlayerChangedName')
  PrintTable(keys)

  local newName = keys.newname
  local oldName = keys.oldName
end

-- A player leveled up an ability
function CReIncarnationGameMode:OnPlayerLearnedAbility( keys)
  print ('[BAREBONES] OnPlayerLearnedAbility')
  PrintTable(keys)

  local player = EntIndexToHScript(keys.player)
  local abilityname = keys.abilityname
end

-- A channelled ability finished by either completing or being interrupted
function CReIncarnationGameMode:OnAbilityChannelFinished(keys)
  print ('[BAREBONES] OnAbilityChannelFinished')
  PrintTable(keys)

  local abilityname = keys.abilityname
  local interrupted = keys.interrupted == 1
end

-- A player leveled up
function CReIncarnationGameMode:OnPlayerLevelUp(keys)
  print ('[BAREBONES] OnPlayerLevelUp')
  PrintTable(keys)

  local player = EntIndexToHScript(keys.player)
  local level = keys.level
end

-- A player last hit a creep, a tower, or a hero
function CReIncarnationGameMode:OnLastHit(keys)
  print ('[BAREBONES] OnLastHit')
  PrintTable(keys)

  local isFirstBlood = keys.FirstBlood == 1
  local isHeroKill = keys.HeroKill == 1
  local isTowerKill = keys.TowerKill == 1
  local player = PlayerResource:GetPlayer(keys.PlayerID)
end

-- A tree was cut down by tango, quelling blade, etc
function CReIncarnationGameMode:OnTreeCut(keys)
  print ('[BAREBONES] OnTreeCut')
  PrintTable(keys)

  local treeX = keys.tree_x
  local treeY = keys.tree_y
end

-- A rune was activated by a player
function CReIncarnationGameMode:OnRuneActivated (keys)
  print ('[BAREBONES] OnRuneActivated')
  PrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local rune = keys.rune

  --[[ Rune Can be one of the following types
  DOTA_RUNE_DOUBLEDAMAGE
  DOTA_RUNE_HASTE
  DOTA_RUNE_HAUNTED
  DOTA_RUNE_ILLUSION
  DOTA_RUNE_INVISIBILITY
  DOTA_RUNE_MYSTERY
  DOTA_RUNE_RAPIER
  DOTA_RUNE_REGENERATION
  DOTA_RUNE_SPOOKY
  DOTA_RUNE_TURBO
  ]]
end

-- A player took damage from a tower
function CReIncarnationGameMode:OnPlayerTakeTowerDamage(keys)
  print ('[BAREBONES] OnPlayerTakeTowerDamage')
  PrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local damage = keys.damage
end

-- An entity died
function CReIncarnationGameMode:OnEntityKilled( keys )
  print( '[BAREBONES] OnEntityKilled Called' )
  PrintTable( keys )
  
  -- The Unit that was Killed
  local killedUnit = EntIndexToHScript( keys.entindex_killed )
  -- The Killing entity
  local killerEntity = nil

  if keys.entindex_attacker ~= nil then
    killerEntity = EntIndexToHScript( keys.entindex_attacker )
  end

	--[[if killedUnit:IsRealHero() then 
    print ("KILLEDKILLER: " .. killedUnit:GetName() .. " -- " .. killerEntity:GetName())
    if killedUnit:GetTeam() == DOTA_TEAM_BADGUYS and killerEntity:GetTeam() == DOTA_TEAM_GOODGUYS then
      self.nRadiantKills = self.nRadiantKills + 1
      if END_GAME_ON_KILLS and self.nRadiantKills >= KILLS_TO_END_GAME_FOR_TEAM then
        GameRules:SetSafeToLeave( true )
        GameRules:SetGameWinner( DOTA_TEAM_GOODGUYS )
      end
    elseif killedUnit:GetTeam() == DOTA_TEAM_GOODGUYS and killerEntity:GetTeam() == DOTA_TEAM_BADGUYS then
      self.nDireKills = self.nDireKills + 1
      if END_GAME_ON_KILLS and self.nDireKills >= KILLS_TO_END_GAME_FOR_TEAM then
        GameRules:SetSafeToLeave( true )
        GameRules:SetGameWinner( DOTA_TEAM_BADGUYS )
      end
    end

    if SHOW_KILLS_ON_TOPBAR then
      GameRules:GetCReIncarnationGameModeEntity():SetTopBarTeamValue ( DOTA_TEAM_BADGUYS, self.nDireKills )
      GameRules:GetCReIncarnationGameModeEntity():SetTopBarTeamValue ( DOTA_TEAM_GOODGUYS, self.nRadiantKills )
    end
  end]]
  
	if killedUnit:IsHero() == false and killedUnit:IsControllableByAnyPlayer() == false and killedUnit:IsSummoned() == false then
		print( killedUnit:GetName() .. " died")
    local seconds = (150 / PlayerResource:GetPlayerCountForTeam(DOTA_TEAM_GOODGUYS))
    if seconds < 30 then
      seconds = 30
    end
		local respawnTime = GameRules:GetGameTime() + seconds
		print("NPC respawn time is " .. respawnTime .. ": " .. seconds .. " seconds")
		table.insert( self.unitsWaitingForRespawnList, {
			szdifficulty = killedUnit.difficulty or "",
			sz_wp = killedUnit:GetInitialGoalEntity() or "", szrespawnTime = respawnTime or ""
		})
		--table.insert( self.unitsWaitingForRespawnArea, killedUnit.difficulty )
		--table.insert( self.unitsWaitingForRespawnSpawner, killedUnit:GetInitialGoalEntity() )
		--table.insert( self.unitsWaitingForRespawnTime, respawnTime)
    self:GoldShare( killedUnit, killerEntity )
		self:CheckForLootItemDrop( killedUnit )
	end
	if killedUnit:IsHero() then
		killedUnit:SetTimeUntilRespawn( 10 )
	end

  -- Put code here to handle when an entity gets killed
end

function CReIncarnationGameMode:GoldShare( unit, killer )
  --[[
  [   VScript ]: ----------Killed Unit Table---------
  [   VScript ]: __self: userdata: 0x032e7d30
  [   VScript ]: Is not a table
  [   VScript ]: difficulty: novice
  [   VScript ]: BountyGoldMax - 27
  [   VScript ]: ------------------------------------
  ]]

  print("----------Killed Unit Table---------")
  PrintTable(unit)
  local bounty = unit:GetGoldBounty()
  print("BountyGoldMax - " .. bounty )
  print("------------------------------------")
  local playerTable = {}
  local check = 0
  killer.lasthitcheck = 1
  table.insert( playerTable, killer )
  for _,entity in pairs (FindUnitsInRadius(killer:GetTeamNumber(), unit:GetAbsOrigin(), nil, 1000, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_ALL,  0, FIND_ANY_ORDER, false) ) do
    print("Found " .. entity:GetUnitName() .. " in death radius")
    if entity:GetPlayerOwnerID() ~= nil then
      for i = 0, #playerTable do
        if playerTable[i] ~= nil then
          if playerTable[i]:GetPlayerOwnerID() == entity:GetPlayerOwnerID() then
            check = 1
          end
        end
      end
      if check == 0 then
        table.insert( playerTable, entity )   
      end
    end
    check = 0
  end
  print("playerTable length is " .. #playerTable)
  print("There are " .. PlayerResource:GetPlayerCountForTeam(killer:GetTeamNumber()) .. " players on killers team")
  bounty = ((bounty / #playerTable) * ((1 / (PlayerResource:GetPlayerCountForTeam(killer:GetTeamNumber()) + 1)) + 0.4))
  print("bounty is " .. bounty)
  for i = 0, #playerTable do
    if playerTable[i] ~= nil then
      print("Killers current gold is " .. PlayerResource:GetGold(playerTable[i]:GetPlayerOwnerID()))
      print("---playerTable---")
      PrintTable(playerTable)
      print("-----------------")
      PlayerResource:ModifyGold(playerTable[i]:GetPlayerOwnerID(), bounty, false, 13)
      print("Adding " .. bounty .. " to player " .. playerTable[i]:GetPlayerOwnerID())
      if playerTable[i].lasthitcheck ~= nil and #playerTable ~= 1 then
        PlayerResource:ModifyGold(playerTable[i]:GetPlayerOwnerID(), (bounty / 5), false, 13)
        print("Last hit bonus bounty of " .. (bounty / 5) .. " added to player " .. playerTable[i]:GetPlayerOwnerID())
      end
    end
  end
  GoldManual(unit, killer, bounty)
  for i = 0, #playerTable do
    playerTable[i] = nil
  end
end

-- This function initializes the game mode and is called before anyone loads into the game
-- It can be used to pre-initialize any values/tables that will be needed later
function CReIncarnationGameMode:InitGameMode()
	CReIncarnationGameMode = self
	print('[BAREBONES] Starting to load Barebones CReIncarnationGameMode...')

  SendToServerConsole( "dota_combine_models 0" ) --combines vanity/wearable items
  
	self.unitsWaitingForRespawnList = {}
	self.unitsWaitingForRespawnArea = {}
	self.unitsWaitingForRespawnTime = {}
	self.unitsWaitingForRespawnSpawner = {}
	
	self._ReadGameConfiguration()
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )

  -- Setup rules
  GameRules:SetHeroRespawnEnabled( ENABLE_HERO_RESPAWN )
  GameRules:SetUseUniversalShopMode( UNIVERSAL_SHOP_MODE )
  GameRules:SetSameHeroSelectionEnabled( ALLOW_SAME_HERO_SELECTION )
  GameRules:SetHeroSelectionTime( HERO_SELECTION_TIME )
  GameRules:SetPreGameTime( PRE_GAME_TIME)
  GameRules:SetPostGameTime( POST_GAME_TIME )
  GameRules:SetTreeRegrowTime( TREE_REGROW_TIME )
  GameRules:SetUseCustomHeroXPValues ( USE_CUSTOM_XP_VALUES )
  GameRules:SetGoldPerTick(GOLD_PER_TICK)
  GameRules:SetGoldTickTime(GOLD_TICK_TIME)
  GameRules:SetRuneSpawnTime(RUNE_SPAWN_TIME)
  GameRules:SetUseBaseGoldBountyOnHeroes(USE_STANDARD_HERO_GOLD_BOUNTY)
  GameRules:SetHeroMinimapIconScale( MINIMAP_ICON_SIZE )
  GameRules:SetCreepMinimapIconScale( MINIMAP_CREEP_ICON_SIZE )
  GameRules:SetRuneMinimapIconScale( MINIMAP_RUNE_ICON_SIZE )
  GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 0 )
  GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 16)
  print('[BAREBONES] GameRules set')

  InitLogFile( "log/barebones.txt","")

  -- Event Hooks
  -- All of these events can potentially be fired by the game, though only the uncommented ones have had
  -- Functions supplied for them.  If you are interested in the other events, you can uncomment the
  -- ListenToGameEvent line and add a function to handle the event
  ListenToGameEvent('dota_player_gained_level', Dynamic_Wrap(CReIncarnationGameMode, 'OnPlayerLevelUp'), self)
  ListenToGameEvent('dota_ability_channel_finished', Dynamic_Wrap(CReIncarnationGameMode, 'OnAbilityChannelFinished'), self)
  ListenToGameEvent('dota_player_learned_ability', Dynamic_Wrap(CReIncarnationGameMode, 'OnPlayerLearnedAbility'), self)
  ListenToGameEvent('entity_killed', Dynamic_Wrap(CReIncarnationGameMode, 'OnEntityKilled'), self)
  ListenToGameEvent('player_connect_full', Dynamic_Wrap(CReIncarnationGameMode, 'OnConnectFull'), self)
  ListenToGameEvent('player_disconnect', Dynamic_Wrap(CReIncarnationGameMode, 'OnDisconnect'), self)
  ListenToGameEvent('dota_item_purchased', Dynamic_Wrap(CReIncarnationGameMode, 'OnItemPurchased'), self)
  ListenToGameEvent('dota_item_picked_up', Dynamic_Wrap(CReIncarnationGameMode, 'OnItemPickedUp'), self)
  ListenToGameEvent('last_hit', Dynamic_Wrap(CReIncarnationGameMode, 'OnLastHit'), self)
  ListenToGameEvent('dota_non_player_used_ability', Dynamic_Wrap(CReIncarnationGameMode, 'OnNonPlayerUsedAbility'), self)
  ListenToGameEvent('player_changename', Dynamic_Wrap(CReIncarnationGameMode, 'OnPlayerChangedName'), self)
  ListenToGameEvent('dota_rune_activated_server', Dynamic_Wrap(CReIncarnationGameMode, 'OnRuneActivated'), self)
  ListenToGameEvent('dota_player_take_tower_damage', Dynamic_Wrap(CReIncarnationGameMode, 'OnPlayerTakeTowerDamage'), self)
  ListenToGameEvent('tree_cut', Dynamic_Wrap(CReIncarnationGameMode, 'OnTreeCut'), self)
  ListenToGameEvent('entity_hurt', Dynamic_Wrap(CReIncarnationGameMode, 'OnEntityHurt'), self)
  ListenToGameEvent('player_connect', Dynamic_Wrap(CReIncarnationGameMode, 'PlayerConnect'), self)
  ListenToGameEvent('dota_player_used_ability', Dynamic_Wrap(CReIncarnationGameMode, 'OnAbilityUsed'), self)
  ListenToGameEvent('game_rules_state_change', Dynamic_Wrap(CReIncarnationGameMode, 'OnGameRulesStateChange'), self)
  ListenToGameEvent('npc_spawned', Dynamic_Wrap(CReIncarnationGameMode, 'OnNPCSpawned'), self)
  ListenToGameEvent("player_reconnected", Dynamic_Wrap(CReIncarnationGameMode, 'OnPlayerReconnect'), self)
  --ListenToGameEvent('player_spawn', Dynamic_Wrap(CReIncarnationGameMode, 'OnPlayerSpawn'), self)
  --ListenToGameEvent('dota_unit_event', Dynamic_Wrap(CReIncarnationGameMode, 'OnDotaUnitEvent'), self)
  --ListenToGameEvent('nommed_tree', Dynamic_Wrap(CReIncarnationGameMode, 'OnPlayerAteTree'), self)
  --ListenToGameEvent('player_completed_game', Dynamic_Wrap(CReIncarnationGameMode, 'OnPlayerCompletedGame'), self)
  --ListenToGameEvent('dota_match_done', Dynamic_Wrap(CReIncarnationGameMode, 'OnDotaMatchDone'), self)
  --ListenToGameEvent('dota_combatlog', Dynamic_Wrap(CReIncarnationGameMode, 'OnCombatLogEvent'), self)
  --ListenToGameEvent('dota_player_killed', Dynamic_Wrap(CReIncarnationGameMode, 'OnPlayerKilled'), self)
  --ListenToGameEvent('player_team', Dynamic_Wrap(CReIncarnationGameMode, 'OnPlayerTeam'), self)
  ListenToGameEvent('player_chat', Dynamic_Wrap(CReIncarnationGameMode, 'OnPlayerChat'), self)



  -- Commands can be registered for debugging purposes or as functions that can be called by the custom Scaleform UI
  Convars:RegisterCommand( "suicide", Dynamic_Wrap(CReIncarnationGameMode, 'Suicide'), "Suicide", 0 )
  
  -- Fill server with fake clients
  -- Fake clients don't use the default bot AI for buying items or moving down lanes and are sometimes necessary for debugging
  Convars:RegisterCommand('fake', function()
    -- Check if the server ran it
    if not Convars:GetCommandClient() then
      -- Create fake Players
      SendToServerConsole('dota_create_fake_clients')
        
      Timers:CreateTimer('assign_fakes', {
        useGameTime = false,
        endTime = Time(),
        callback = function(barebones, args)
          local userID = 20
          for i=0, 9 do
            userID = userID + 1
            -- Check if this player is a fake one
            if PlayerResource:IsFakeClient(i) then
              -- Grab player instance
              local ply = PlayerResource:GetPlayer(i)
              -- Make sure we actually found a player instance
              if ply then
                CreateHeroForPlayer('npc_dota_hero_axe', ply)
                self:OnConnectFull({
                  userid = userID,
                  index = ply:entindex()-1
                })

                ply:GetAssignedHero():SetControllableByPlayer(0, true)
              end
            end
          end
        end})
    end
  end, 'Connects and assigns fake Players.', 0)

  --[[ This block is only used for testing events handling in the event that Valve adds more in the future
  Convars:RegisterCommand('events_test', function()
      CReIncarnationGameMode:StartEventTest()
    end, "events test", 0)]]

  -- Change random seed
  local timeTxt = string.gsub(string.gsub(GetSystemTime(), ':', ''), '0','')
  math.randomseed(tonumber(timeTxt))

  -- Initialized tables for tracking state
  self.vUserIds = {}
  self.vSteamIds = {}
  self.vBots = {}
  self.vBroadcasters = {}

  self.vPlayers = {}
  self.vRadiant = {}
  self.vDire = {}

  self.nRadiantKills = 0
  self.nDireKills = 0

  self.bSeenWaitForPlayers = false

  --GameMode:SetExecuteOrderFilter( Dynamic_Wrap( CReIncarnationGameMode, "FilterExecuteOrder" ), self )
  GameRules:GetGameModeEntity():SetDamageFilter( Dynamic_Wrap( CReIncarnationGameMode, "FilterDamage" ), self )
  GameRules:GetGameModeEntity():SetModifyGoldFilter( Dynamic_Wrap( self, "FilterModifyGold" ), self )

  GameRules.APPLIER = CreateItem("item_apply_modifiers", nil, nil)

  print('[BAREBONES] Done loading Barebones CReIncarnationGameMode!\n\n')
end

mode = nil

-- This function is called as the first player loads and sets up the CReIncarnationGameMode parameters
function CReIncarnationGameMode:CaptureCReIncarnationGameMode()
  if mode == nil then
    -- Set CReIncarnationGameMode parameters
    mode = GameRules:GetGameModeEntity()        
    mode:SetRecommendedItemsDisabled( RECOMMENDED_BUILDS_DISABLED )
    mode:SetCameraDistanceOverride( CAMERA_DISTANCE_OVERRIDE )
    mode:SetCustomBuybackCostEnabled( CUSTOM_BUYBACK_COST_ENABLED )
    mode:SetCustomBuybackCooldownEnabled( CUSTOM_BUYBACK_COOLDOWN_ENABLED )
    mode:SetBuybackEnabled( BUYBACK_ENABLED )
    mode:SetTopBarTeamValuesOverride ( USE_CUSTOM_TOP_BAR_VALUES )
    mode:SetTopBarTeamValuesVisible( TOP_BAR_VISIBLE )
    mode:SetUseCustomHeroLevels ( USE_CUSTOM_HERO_LEVELS )
    mode:SetCustomHeroMaxLevel ( MAX_LEVEL )
    mode:SetCustomXPRequiredToReachNextLevel( XP_PER_LEVEL_TABLE )

    --mode:SetBotThinkingEnabled( USE_STANDARD_DOTA_BOT_THINKING )
    mode:SetTowerBackdoorProtectionEnabled( ENABLE_TOWER_BACKDOOR_PROTECTION )

    mode:SetFogOfWarDisabled(DISABLE_FOG_OF_WAR_ENTIRELY)
    mode:SetGoldSoundDisabled( DISABLE_GOLD_SOUNDS )
    mode:SetRemoveIllusionsOnDeath( REMOVE_ILLUSIONS_ON_DEATH )


    --GameRules:GetCReIncarnationGameModeEntity():SetThink( "Think", self, "GlobalThink", 2 )

    self:SetupMultiTeams()
    self:OnFirstPlayerLoaded()
  end 
end

-- Multiteam support is unfinished currently
function CReIncarnationGameMode:SetupMultiTeams()
  MultiTeam:start()
  MultiTeam:CreateTeam("team1")
  MultiTeam:CreateTeam("team2")
end

-- This function is called 1 to 2 times as the player connects initially but before they 
-- have completely connected
function CReIncarnationGameMode:PlayerConnect(keys)
  print('[BAREBONES] PlayerConnect')
  PrintTable(keys)
  
  if keys.bot == 1 then
    -- This user is a Bot, so add it to the bots table
    self.vBots[keys.userid] = 1
  end
end

-- This function is called once when the player fully connects and becomes "Ready" during Loading
function CReIncarnationGameMode:OnConnectFull(keys)
  print ('[BAREBONES] OnConnectFull')
  PrintTable(keys)
  CReIncarnationGameMode:CaptureCReIncarnationGameMode()
  
  local entIndex = keys.index+1
  -- The Player entity of the joining user
  local ply = EntIndexToHScript(entIndex)
  
  -- The Player ID of the joining player
  local playerID = ply:GetPlayerID()
  
  -- Update the user ID table with this user
  self.vUserIds[keys.userid] = ply

  -- Update the Steam ID table
  self.vSteamIds[PlayerResource:GetSteamAccountID(playerID)] = ply


  
  -- If the player is a broadcaster flag it in the Broadcasters table
  if PlayerResource:IsBroadcaster(playerID) then
    self.vBroadcasters[keys.userid] = 1
    return
  end
end

function CReIncarnationGameMode:FilterDamage( filterTable )
  --[[
  [   VScript              ]: damage: 20
  [   VScript              ]: damagetype_const: 1
  [   VScript              ]: entindex_attacker_const: 347
  [   VScript              ]: entindex_inflictor_const: 359
  [   VScript              ]: entindex_victim_const: 395
]]
  --print("FilterDamage Called")

  local attacker = filterTable.entindex_attacker_const
  if attacker ~= nil then
    attacker = EntIndexToHScript(attacker)
  else
    print("Attacker was nil")
    return true
  end
  local victim = filterTable.entindex_victim_const  
  local defender = EntIndexToHScript(victim)
  local damage = filterTable.damage

  if attacker.IsFriendlyHero and attacker:IsFriendlyHero(victim) then
    return false
  end

  --Elementalist
  if defender:HasModifier("modifier_fortify") then
    print("---Defender has Fortify, Reducing Damage")
    filterTable.damage = 0
    defender:RemoveModifierByName("modifier_fortify")
    print("---removed Fortify")
    if defender:HasModifier("modifier_fortify") == 0 then
        defender:RemoveModifierByName("modifier_fortify_check")
        print("---Fortify was 0 stacks, removed check")
    end
    return true
  end

  --Cultist-----------------------------
  --Awakened Spirit
  if defender:HasModifier("modifier_awakenedspirit_ally") then --Ally
    --local mod = defender:FindModifierByName("modifier_awakenedspirit_ally")
    local armorincrease = defender.armorincrease / 100 --Convert to %
    --Plague check
    if defender:HasModifier("modifier_locustswarm_ally") or defender:HasModifier("modifier_anathema_ally")  or defender:HasModifier("modifier_daemon_slow_effect") then
      armorincrease = armorincrease * 1.5
    end
    dmgdecrease = (damage * armorincrease)
    damage = damage - dmgdecrease
    AwakenedSpiritPopupManual(defender, dmgdecrease)
    filterTable.damage = damage
    print("Awakened Spirit reduced " .. defender:GetUnitName() .. "'s damage by " .. dmgdecrease)

  elseif defender:HasModifier("modifier_awakenedspirit_foe") then --Foe
    --local mod = defender:FindModifierByName("modifier_awakenedspirit_foe")
    local armorincrease = defender.armorincrease / 100 --Convert to %
    armorincrease = armorincrease * .5
    dmgdecrease = (damage * armorincrease)
    damage = damage - dmgdecrease
    AwakenedSpiritPopupManual(defender, dmgdecrease)
    filterTable.damage = damage
    print("Awakened Spirit reduced " .. defender:GetUnitName() .. "'s damage by " .. dmgdecrease)
  end
  --LocustSwarm
  if defender:HasModifier("modifier_locustswarm_ally") then --Ally
    --local mod = defender:FindModifierByName("modifier_locustswarm_ally")
    local armorreduction = defender.armorreduction / 100 --Convert to %
    armorreduction = armorreduction * .5
    dmgincrease = (damage * armorreduction)
    damage = damage + dmgincrease
    DarkDamageManual(defender,dmgincrease)
    filterTable.damage = damage
    print("Locust Swarm increased " .. defender:GetUnitName() .. "'s damage taken by " .. dmgincrease)

  elseif defender:HasModifier("modifier_locustswarm_foe") then --Foe
    --local mod = defender:FindModifierByName("modifier_awakenedspirit_ally")
    local armorreduction = defender.armorreduction / 100 --Convert to %
    --Blessing check
    if defender:HasModifier("modifier_benediction_foe") or defender:HasModifier("modifier_awakenedspirit_foe") or defender:HasModifier("modifier_paegon_haste_effect") then
      armorreduction = armorreduction * 1.5
    end
    dmgincrease = (damage * armorreduction)
    damage = damage + dmgincrease
    DarkDamageManual(defender,dmgincrease)
    filterTable.damage = damage
    print("Locust Swarm increased " .. defender:GetUnitName() .. "'s damage taken by " .. dmgincrease)
  end

  --BasicAttackManual(defender, filterTable.damage)
  return true
end

function CReIncarnationGameMode:FilterModifyGold( filterTable )
  --[[
  [   VScript ]: gold: 25
  [   VScript ]: player_id_const: 0
  [   VScript ]: reason_const: 13
  [   VScript ]: reliable: 0
]]
  --print("---------Gold Filter table--------")
  --PrintTable(filterTable)
  --print("----------------------------------")
  
  print("Gold Filter modifying " .. filterTable.player_id_const .. "'s gold by " .. filterTable.gold .. " because of reason " .. filterTable.reason_const)
  if filterTable.reason_const == 13 then
    return false
  end
  print("Gold Filter reason was not creep kill")
  return true
end

CHEAT_CODES = {
    --["greedisgood"] = function(...) PMP:GreedIsGood(...) end,  -- Gives X gold and lumber
    ["CC"]       = function(...) CReIncarnationGameMode:ChangeClass(...) end,
}

PLAYER_COMMANDS = {
    ["suicide"]       = function(...) CReIncarnationGameMode:Suicide(...) end,
    ["sp"]       = function(...) CReIncarnationGameMode:Debug(...) end,
    ["GM"]       = function(...) CReIncarnationGameMode:GodMode(...) end,
    
}

-- A player has typed something into the chat
function CReIncarnationGameMode:OnPlayerChat(keys)
    local text = keys.text
    local userID = keys.userid
    local playerID = self.vUserIds[keys.userid]:GetPlayerID()

    -- Handle '-command'
    if StringStartsWith(text, "-") then
        text = string.sub(text, 2, string.len(text))
    end

    local input = split(text)
    local command = input[1]
    if CHEAT_CODES[command] and Convars:GetBool('developer') then
        --print('Command:',command, "Player:",playerID, "Parameters",input[2], input[3], input[4])
        CHEAT_CODES[command](playerID, input[2], input[3], input[4])
    
    elseif PLAYER_COMMANDS[command] then
        PLAYER_COMMANDS[command](playerID)
    end
end

function CReIncarnationGameMode:Suicide(pID)
    local player = PlayerResource:GetPlayer(pID)
    local hero = player:GetAssignedHero()
    local herohealthcheck = hero:GetMaxHealth() * 0.75
    print("Suicide")
    if player and hero:GetHealth() > herohealthcheck then
      hero:ForceKill(true)
    end
end

function CReIncarnationGameMode:ChangeClass(pID, class)
    local player = PlayerResource:GetPlayer(pID)
    local hero = player:GetAssignedHero()
    local class = class
    print("Class == " .. class)
    if class == nil then
          GameRules:SendCustomMessage("Class Change options:", 0, 0)
          GameRules:SendCustomMessage("basic", 0, 0)
          GameRules:SendCustomMessage("devout", 0, 0)
          GameRules:SendCustomMessage("ranger", 0, 0)
          GameRules:SendCustomMessage("warrior", 0, 0)
          GameRules:SendCustomMessage("arcanist", 0, 0)
          GameRules:SendCustomMessage("cultist", 0, 0)
          GameRules:SendCustomMessage("elementalist", 0, 0)
          GameRules:SendCustomMessage("exile", 0, 0)
          GameRules:SendCustomMessage("trapper", 0, 0)
          GameRules:SendCustomMessage("monk", 0, 0)
          GameRules:SendCustomMessage("spellblade", 0, 0)
          GameRules:SendCustomMessage("wetboy", 0, 0)
          GameRules:SendCustomMessage("zerker", 0, 0)
    elseif class == "basic" then
      PlayerResource:ReplaceHeroWith( pID, "npc_dota_hero_kunkka", hero:GetGold(), 0 )
    elseif class == "devout" then
      PlayerResource:ReplaceHeroWith( pID, "npc_dota_hero_invoker", hero:GetGold(), 0 )
    elseif class == "ranger" then
      PlayerResource:ReplaceHeroWith( pID, "npc_dota_hero_windrunner", hero:GetGold(), 0 )
    elseif class == "warrior" then
      PlayerResource:ReplaceHeroWith( pID, "npc_dota_hero_dragon_knight", hero:GetGold(), 0 )
    elseif class == "arcanist" then
      PlayerResource:ReplaceHeroWith( pID, "npc_dota_hero_crystal_maiden", hero:GetGold(), 0 )
    elseif class == "cultist" then
      PlayerResource:ReplaceHeroWith( pID, "npc_dota_hero_dazzle", hero:GetGold(), 0 )
    elseif class == "elementalist" then
      PlayerResource:ReplaceHeroWith( pID, "npc_dota_hero_storm_spirit", hero:GetGold(), 0 )
      --PrecacheResource("particle", "particles/inferno.vpcf", context )
      --PrecacheResource("particle", "particles/gale.vpcf", context )
      --PrecacheResource("particle", "particles/fogofwar.vpcf", context )
      local newHero = player:GetAssignedHero()
      local Ability = newHero:GetAbilityByIndex(5)
      Ability:SetLevel(1)
    elseif class == "exile" then
      PlayerResource:ReplaceHeroWith( pID, "npc_dota_hero_furion", hero:GetGold(), 0 )
    elseif class == "trapper" then
      PlayerResource:ReplaceHeroWith( pID, "npc_dota_hero_sniper", hero:GetGold(), 0 )
    elseif class == "monk" then
      PlayerResource:ReplaceHeroWith( pID, "npc_dota_hero_lone_druid", hero:GetGold(), 0 )
    elseif class == "spellblade" then
      PlayerResource:ReplaceHeroWith( pID, "npc_dota_hero_silencer", hero:GetGold(), 0 )
    elseif class == "wetboy"  then
      PlayerResource:ReplaceHeroWith( pID, "npc_dota_hero_riki", hero:GetGold(), 0 )
    elseif class == "zerker" then
      PlayerResource:ReplaceHeroWith( pID, "npc_dota_hero_sven", hero:GetGold(), 0 )
    end
end

function CReIncarnationGameMode:Debug(pID)
    local player = PlayerResource:GetPlayer(pID)
    local hero = player:GetAssignedHero()
    print("Debug")
    if player then
      PlayerResource:SetGold(pID, 5000, false)
      for i=1,21 do
        hero:HeroLevelUp(false)
      end
      hero:SetMana(hero:GetMaxMana())
      hero:SetHealth(hero:GetMaxHealth())
    end
end

function CReIncarnationGameMode:GodMode(pID)
    local player = PlayerResource:GetPlayer(pID)
    local hero = player:GetAssignedHero()
    print("God Mode")
    if player and hero:HasModifier("modifier_god_mode") == false then
      ApplyModifier(hero, "modifier_god_mode")
    elseif player and hero:HasModifier("modifier_god_mode") == true then
      hero:RemoveModifierByName("modifier_god_mode")
    end
end

--require('eventtest')