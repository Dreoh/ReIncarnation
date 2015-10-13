function Reset(keys)
	print("classchange_reset casted")
	local items = {}
	local Caster = keys.caster
	for i = 0, 5 do
		if Caster:GetItemInSlot(i) ~= nil and Caster:GetItemInSlot(i):GetName() ~= "item_classchange_reset" then
			itemCopy = CreateItem(Caster:GetItemInSlot(i):GetName(), nil, nil)
			items[i] = itemCopy
		end
	end
	local player = Caster:GetPlayerOwner()
	hero = Caster:GetUnitName()
	print("Caster = " .. hero)
	local heroLevel = Caster:GetLevel()
	local loc = Caster:GetAbsOrigin()
	PlayerResource:ReplaceHeroWith( Caster:GetPlayerID(), "npc_dota_hero_kunkka", Caster:GetGold(), 0 )
	local newHero = player:GetAssignedHero()
	for i = 0, 5 do
		if items[i] ~= nil then
			newHero:AddItem(items[i])
		end
	end
	newHero:SetAbsOrigin(loc)
	ShowGenericPopupToPlayer( player , "popup_title_reincarnate", "popup_body_reincarnate", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
	----SendToConsole("dota_camera_center")
end

function Devout(keys)

	print("classchange_devout casted")
	local items = {}
	local Caster = keys.caster
	for i = 0, 5 do
		if Caster:GetItemInSlot(i) ~= nil and Caster:GetItemInSlot(i):GetName() ~= "item_classchange_devout" then
			itemCopy = CreateItem(Caster:GetItemInSlot(i):GetName(), nil, nil)
			items[i] = itemCopy
		end
	end
	local player = Caster:GetPlayerOwner()
	hero = Caster:GetUnitName()
	print("Caster = " .. hero)
	local heroLevel = Caster:GetLevel()
	if hero == "npc_dota_hero_kunkka" and Caster:GetLevel() >= 5 then
		local loc = Caster:GetAbsOrigin()
		PlayerResource:ReplaceHeroWith( Caster:GetPlayerID(), "npc_dota_hero_invoker", Caster:GetGold(), 0 )
		local newHero = player:GetAssignedHero()
		for i = 0, 5 do
			if items[i] ~= nil then
				newHero:AddItem(items[i])
			end
		end
		newHero:SetAbsOrigin(loc)
		ShowGenericPopupToPlayer( player , "popup_title_reincarnate", "popup_body_reincarnate", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
		--SendToConsole("dota_camera_center")
	end
	
end

function Ranger(keys)

	print("classchange_ranger casted")
	local items = {}
	local Caster = keys.caster
	for i = 0, 5 do
		if Caster:GetItemInSlot(i) ~= nil and Caster:GetItemInSlot(i):GetName() ~= "item_classchange_ranger" then
			itemCopy = CreateItem(Caster:GetItemInSlot(i):GetName(), nil, nil)
			items[i] = itemCopy
		end
	end
	local player = Caster:GetPlayerOwner()
	hero = Caster:GetUnitName()
	print("Caster = " .. hero)
	local heroLevel = Caster:GetLevel()
	if hero == "npc_dota_hero_kunkka" and Caster:GetLevel() >= 5 then
		local loc = Caster:GetAbsOrigin()
		PlayerResource:ReplaceHeroWith( Caster:GetPlayerID(), "npc_dota_hero_windrunner", Caster:GetGold(), 0 )
		local newHero = player:GetAssignedHero()
		for i = 0, 5 do
			if items[i] ~= nil then
				newHero:AddItem(items[i])
			end
		end
		newHero:SetAbsOrigin(loc)
		ShowGenericPopupToPlayer( player , "popup_title_reincarnate", "popup_body_reincarnate", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
		--SendToConsole("dota_camera_center")
	end
	
end

function Warrior(keys)

	print("classchange_warrior casted")
	local items = {}
	local Caster = keys.caster
	for i = 0, 5 do
		if Caster:GetItemInSlot(i) ~= nil and Caster:GetItemInSlot(i):GetName() ~= "item_classchange_warrior" then
			itemCopy = CreateItem(Caster:GetItemInSlot(i):GetName(), nil, nil)
			items[i] = itemCopy
		end
	end
	local player = Caster:GetPlayerOwner()
	hero = Caster:GetUnitName()
	print("Caster = " .. hero)
	local heroLevel = Caster:GetLevel()
	if hero == "npc_dota_hero_kunkka" and Caster:GetLevel() >= 5 then
		local loc = Caster:GetAbsOrigin()
		PlayerResource:ReplaceHeroWith( Caster:GetPlayerID(), "npc_dota_hero_dragon_knight", Caster:GetGold(), 0 )
		local newHero = player:GetAssignedHero()
		for i = 0, 5 do
			if items[i] ~= nil then
				newHero:AddItem(items[i])
			end
		end
		newHero:SetAbsOrigin(loc)
		ShowGenericPopupToPlayer( player , "popup_title_reincarnate", "popup_body_reincarnate", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
		--SendToConsole("dota_camera_center")
	end
	
end

function Arcanist(keys)

	print("classchange_arcanist casted")
	local items = {}
	local Caster = keys.caster
	for i = 0, 5 do
		if Caster:GetItemInSlot(i) ~= nil and Caster:GetItemInSlot(i):GetName() ~= "item_classchange_arcanist" then
			itemCopy = CreateItem(Caster:GetItemInSlot(i):GetName(), nil, nil)
			items[i] = itemCopy
		end
	end
	local player = Caster:GetPlayerOwner()
	hero = Caster:GetUnitName()
	print("Caster = " .. hero)
	local heroLevel = Caster:GetLevel()
	if hero == "npc_dota_hero_invoker" and Caster:GetLevel() >= 20 then
		local loc = Caster:GetAbsOrigin()
		PlayerResource:ReplaceHeroWith( Caster:GetPlayerID(), "npc_dota_hero_crystal_maiden", Caster:GetGold(), 0 )
		local newHero = player:GetAssignedHero()
		for i = 0, 5 do
			if items[i] ~= nil then
				newHero:AddItem(items[i])
			end
		end
		newHero:SetAbsOrigin(loc)
		ShowGenericPopupToPlayer( player , "popup_title_reincarnate", "popup_body_reincarnate", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
		--SendToConsole("dota_camera_center")
	end
	
end

function Cultist(keys)

	print("classchange_cultist casted")
	local items = {}
	local Caster = keys.caster
	for i = 0, 5 do
		if Caster:GetItemInSlot(i) ~= nil and Caster:GetItemInSlot(i):GetName() ~= "item_classchange_cultist" then
			itemCopy = CreateItem(Caster:GetItemInSlot(i):GetName(), nil, nil)
			items[i] = itemCopy
		end
	end
	local player = Caster:GetPlayerOwner()
	hero = Caster:GetUnitName()
	print("Caster = " .. hero)
	local heroLevel = Caster:GetLevel()
	if hero == "npc_dota_hero_invoker" and Caster:GetLevel() >= 20 then
		local loc = Caster:GetAbsOrigin()
		PlayerResource:ReplaceHeroWith( Caster:GetPlayerID(), "npc_dota_hero_dazzle", Caster:GetGold(), 0 )
		local newHero = player:GetAssignedHero()
		for i = 0, 5 do
			if items[i] ~= nil then
				newHero:AddItem(items[i])
			end
		end
		newHero:SetAbsOrigin(loc)
		ShowGenericPopupToPlayer( player , "popup_title_reincarnate", "popup_body_reincarnate", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
		--SendToConsole("dota_camera_center")
	end
	
end

function Elementalist(keys)

	print("classchange_elementalist casted")
	PrecacheResource("particle", "particles/inferno.vpcf", context )
	PrecacheResource("particle", "particles/gale.vpcf", context )
	PrecacheResource("particle", "particles/fogofwar.vpcf", context )
	local items = {}
	local Caster = keys.caster
	for i = 0, 5 do
		if Caster:GetItemInSlot(i) ~= nil and Caster:GetItemInSlot(i):GetName() ~= "item_classchange_elementalist" then
			itemCopy = CreateItem(Caster:GetItemInSlot(i):GetName(), nil, nil)
			items[i] = itemCopy
		end
	end
	local player = Caster:GetPlayerOwner()
	hero = Caster:GetUnitName()
	print("Caster = " .. hero)
	local heroLevel = Caster:GetLevel()
	if hero == "npc_dota_hero_invoker" and Caster:GetLevel() >= 20 then
		print("hero and level check is good")
		local loc = Caster:GetAbsOrigin()
		PlayerResource:ReplaceHeroWith( Caster:GetPlayerID(), "npc_dota_hero_storm_spirit", Caster:GetGold(), 0 )
		local newHero = player:GetAssignedHero()
		for i = 0, 5 do
			if items[i] ~= nil then
				newHero:AddItem(items[i])
			end
		end
		newHero:SetAbsOrigin(loc)
		--Level up Spellcraft to level 1
		Ability = newHero:GetAbilityByIndex(5)
		Ability:SetLevel(1)

		ShowGenericPopupToPlayer( player , "popup_title_reincarnate", "popup_body_reincarnate", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
		--SendToConsole("dota_camera_center")
	end
	
end

function Exile(keys)

	print("classchange_exile casted")
	local items = {}
	local Caster = keys.caster
	for i = 0, 5 do
		if Caster:GetItemInSlot(i) ~= nil and Caster:GetItemInSlot(i):GetName() ~= "item_classchange_exile" then
			itemCopy = CreateItem(Caster:GetItemInSlot(i):GetName(), nil, nil)
			items[i] = itemCopy
		end
	end
	local player = Caster:GetPlayerOwner()
	hero = Caster:GetUnitName()
	print("Caster = " .. hero)
	local heroLevel = Caster:GetLevel()
	if hero == "npc_dota_hero_windrunner" and Caster:GetLevel() >= 20 then
		local loc = Caster:GetAbsOrigin()
		PlayerResource:ReplaceHeroWith( Caster:GetPlayerID(), "npc_dota_hero_furion", Caster:GetGold(), 0 )
		local newHero = player:GetAssignedHero()
		for i = 0, 5 do
			if items[i] ~= nil then
				newHero:AddItem(items[i])
			end
		end
		newHero:SetAbsOrigin(loc)
		ShowGenericPopupToPlayer( player , "popup_title_reincarnate", "popup_body_reincarnate", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
		--SendToConsole("dota_camera_center")
	end
	
end

function Trapper(keys)

	print("classchange_trapper casted")
	local items = {}
	local Caster = keys.caster
	for i = 0, 5 do
		if Caster:GetItemInSlot(i) ~= nil and Caster:GetItemInSlot(i):GetName() ~= "item_classchange_trapper" then
			itemCopy = CreateItem(Caster:GetItemInSlot(i):GetName(), nil, nil)
			items[i] = itemCopy
		end
	end
	local player = Caster:GetPlayerOwner()
	hero = Caster:GetUnitName()
	print("Caster = " .. hero)
	local heroLevel = Caster:GetLevel()
	if hero == "npc_dota_hero_windrunner" and Caster:GetLevel() >= 20 then
		local loc = Caster:GetAbsOrigin()
		PlayerResource:ReplaceHeroWith( Caster:GetPlayerID(), "npc_dota_hero_sniper", Caster:GetGold(), 0 )
		local newHero = player:GetAssignedHero()
		for i = 0, 5 do
			if items[i] ~= nil then
				newHero:AddItem(items[i])
			end
		end
		newHero:SetAbsOrigin(loc)
		ShowGenericPopupToPlayer( player , "popup_title_reincarnate", "popup_body_reincarnate", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
		--SendToConsole("dota_camera_center")
	end
	
end

function Monk(keys)

	print("classchange_monk casted")
	local items = {}
	local Caster = keys.caster
	for i = 0, 5 do
		if Caster:GetItemInSlot(i) ~= nil and Caster:GetItemInSlot(i):GetName() ~= "item_classchange_monk" then
			itemCopy = CreateItem(Caster:GetItemInSlot(i):GetName(), nil, nil)
			items[i] = itemCopy
		end
	end
	local player = Caster:GetPlayerOwner()
	hero = Caster:GetUnitName()
	print("Caster = " .. hero)
	local heroLevel = Caster:GetLevel()
	if hero == "npc_dota_hero_dragon_knight" and Caster:GetLevel() >= 20 then
		local loc = Caster:GetAbsOrigin()
		PlayerResource:ReplaceHeroWith( Caster:GetPlayerID(), "npc_dota_hero_lone_druid", Caster:GetGold(), 0 )
		local newHero = player:GetAssignedHero()
		for i = 0, 5 do
			if items[i] ~= nil then
				newHero:AddItem(items[i])
			end
		end
		newHero:SetAbsOrigin(loc)
		ShowGenericPopupToPlayer( player , "popup_title_reincarnate", "popup_body_reincarnate", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
		--SendToConsole("dota_camera_center")
	end
	
end

function Spellblade(keys)

	print("classchange_spellblade casted")
	local items = {}
	local Caster = keys.caster
	for i = 0, 5 do
		if Caster:GetItemInSlot(i) ~= nil and Caster:GetItemInSlot(i):GetName() ~= "item_classchange_spellblade" then
			itemCopy = CreateItem(Caster:GetItemInSlot(i):GetName(), nil, nil)
			items[i] = itemCopy
		end
	end
	local player = Caster:GetPlayerOwner()
	hero = Caster:GetUnitName()
	print("Caster = " .. hero)
	local heroLevel = Caster:GetLevel()
	if hero == "npc_dota_hero_dragon_knight" and Caster:GetLevel() >= 20 then
		local loc = Caster:GetAbsOrigin()
		PlayerResource:ReplaceHeroWith( Caster:GetPlayerID(), "npc_dota_hero_silencer", Caster:GetGold(), 0 )
		local newHero = player:GetAssignedHero()
		for i = 0, 5 do
			if items[i] ~= nil then
				newHero:AddItem(items[i])
			end
		end
		newHero:SetAbsOrigin(loc)
		ShowGenericPopupToPlayer( player , "popup_title_reincarnate", "popup_body_reincarnate", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
		--SendToConsole("dota_camera_center")
	end
	
end

function Wetboy(keys)

	print("classchange_wetboy casted")
	local items = {}
	local Caster = keys.caster
	for i = 0, 5 do
		if Caster:GetItemInSlot(i) ~= nil and Caster:GetItemInSlot(i):GetName() ~= "item_classchange_wetboy" then
			itemCopy = CreateItem(Caster:GetItemInSlot(i):GetName(), nil, nil)
			items[i] = itemCopy
		end
	end
	local player = Caster:GetPlayerOwner()
	hero = Caster:GetUnitName()
	print("Caster = " .. hero)
	local heroLevel = Caster:GetLevel()
	if hero == "npc_dota_hero_windrunner" and Caster:GetLevel() >= 20 then
		local loc = Caster:GetAbsOrigin()
		PlayerResource:ReplaceHeroWith( Caster:GetPlayerID(), "npc_dota_hero_riki", Caster:GetGold(), 0 )
		local newHero = player:GetAssignedHero()
		for i = 0, 5 do
			if items[i] ~= nil then
				newHero:AddItem(items[i])
			end
		end
		newHero:SetAbsOrigin(loc)
		ShowGenericPopupToPlayer( player , "popup_title_reincarnate", "popup_body_reincarnate", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
		--SendToConsole("dota_camera_center")
	end
	
end

function Zerker(keys)

	print("classchange_zerker casted")
	local items = {}
	local Caster = keys.caster
	for i = 0, 5 do
		if Caster:GetItemInSlot(i) ~= nil and Caster:GetItemInSlot(i):GetName() ~= "item_classchange_zerker" then
			itemCopy = CreateItem(Caster:GetItemInSlot(i):GetName(), nil, nil)
			items[i] = itemCopy
		end
	end
	local player = Caster:GetPlayerOwner()
	hero = Caster:GetUnitName()
	print("Caster = " .. hero)
	local heroLevel = Caster:GetLevel()
	if hero == "npc_dota_hero_dragon_knight" and Caster:GetLevel() >= 20 then
		local loc = Caster:GetAbsOrigin()
		PlayerResource:ReplaceHeroWith( Caster:GetPlayerID(), "npc_dota_hero_sven", Caster:GetGold(), 0 )
		local newHero = player:GetAssignedHero()
		for i = 0, 5 do
			if items[i] ~= nil then
				newHero:AddItem(items[i])
			end
		end
		newHero:SetAbsOrigin(loc)
		ShowGenericPopupToPlayer( player , "popup_title_reincarnate", "popup_body_reincarnate", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
		--SendToConsole("dota_camera_center")
	end
	
end