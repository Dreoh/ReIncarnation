function SpellcraftToggleOn(keys)
	Caster = keys.caster
	ability = keys.ability
	attunement = GetAttunement(Caster)
	if attunement ~= nil then
		print("Spellcraft toggled on. Attunement is: " .. attunement)
		if attunement == "fire" then
			SetUpFireSpells(keys)
		elseif attunement == "water" then
			SetUpWaterSpells(keys)
		elseif attunement == "earth" then
			SetUpEarthSpells(keys)
		elseif attunement == "wind"	then
			SetUpWindSpells(keys, attunement)
		else
			print("Something went wrong with SpellcraftToggleOn, found but could not determine attunement")
		end
	else
		ability:ToggleAbility()
	end
end

function SpellcraftToggleOff(keys)
	Caster = keys.caster
	attunement = GetAttunement(Caster)
	if attunement ~= nil then
		print("Spellcraft toggled off. Attunement is: " .. attunement)
		ResetSpells(keys)
	else
		print("Could not find attunement on ToggleOff")
	end
end
	
function GetAttunement(keys)
	local Caster = keys
	if Caster:HasModifier("modifier_attunement_fire") then
		return "fire"
	elseif Caster:HasModifier("modifier_attunement_water") then
		return "water"
	elseif Caster:HasModifier("modifier_attunement_earth") then
		return "earth"
	elseif Caster:HasModifier("modifier_attunement_wind") then
		return "wind"
	else
		print("Attunement not found")
	end
end

function RemoveAttunement(keys)
	local Caster = keys
	print("Caster: " .. Caster:GetName())
	for i=1, 4 do -- This is to make sure all attunements are deleted in case of multiple attunements bug
		if Caster:HasModifier("modifier_attunement_fire") then
			Caster:RemoveModifierByName("modifier_attunement_fire")
					print("Attunement fire found and removed")
		elseif Caster:HasModifier("modifier_attunement_water") then
			Caster:RemoveModifierByName("modifier_attunement_water")
					print("Attunement water found and removed")
		elseif Caster:HasModifier("modifier_attunement_earth") then
			Caster:RemoveModifierByName("modifier_attunement_earth")
					print("Attunement earth found and removed")
		elseif Caster:HasModifier("modifier_attunement_wind") then
			Caster:RemoveModifierByName("modifier_attunement_wind")
			print("Attunement wind found and removed")
		else
			print("Attunement not found and not removed")
		end
	end
	--print("Attunement found and removed")
end

function ResetSpells(keys)
	print("Setting up default spells")
	--temporary attunement check, once all spells finished will just iterate through the spellslots and replace with default
	local caster = keys.caster
	for i=0,3 do
		if i == 0 then
			------------Fire---------------------------------------------------------
			local ability = caster:GetAbilityByIndex(i)
			local abilityname = ability:GetAbilityName()
			local abilitylevel = ability:GetLevel()
			if abilityname == "customability_inferno" then
				print("Ability 1 was Inferno, swapping with Combust")
				caster:SwapAbilities("customability_inferno", "customability_combust", false, true)
				--ability:SetAbilityIndex(5)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			elseif abilityname == "customability_fogofwar" then
				print("Ability 1 was Fog of War, swapping with Combust")
				caster:SwapAbilities("customability_fogofwar", "customability_combust", false, true)
				--ability:SetAbilityIndex(5)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			elseif abilityname == "customability_magma" then
				print("Ability 1 was Magma, swapping with Combust")
				caster:SwapAbilities("customability_magma", "customability_combust", false, true)
				--ability:SetAbilityIndex(5)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			elseif abilityname == "customability_firetornado" then
				print("Ability 1 was Fire Tornado, swapping with Combust")
				caster:SwapAbilities("customability_firetornado", "customability_combust", false, true)
				--ability:SetAbilityIndex(5)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			else
				print("Ability 1 was not Fire Tornado, Magma, Inferno or Fog of War, adding combust")
				caster:RemoveAbility(abilityname)
				local newAbility = caster:AddAbility("customability_combust")
				newAbility:SetLevel(abilitylevel)
				newAbility:SetAbilityIndex(i)
			end
		elseif i == 1 then
			-----------Water-----------------------------------------------------
			local ability = caster:GetAbilityByIndex(i)
			local abilityname = ability:GetAbilityName()
			local abilitylevel = ability:GetLevel()
			if abilityname == "customability_flow" then
				print("Ability 2 was Flow, swapping with Ebb")
				caster:SwapAbilities("customability_flow", "customability_ebb", false, true)
				--ability:SetAbilityIndex(5)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			elseif abilityname == "customability_fogofwar" then
				print("Ability 2 was Fog of War, swapping with Ebb")
				caster:SwapAbilities("customability_fogofwar", "customability_ebb", false, true)
				--ability:SetAbilityIndex(5)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			elseif abilityname == "customability_quagmire" then
				print("Ability 2 was Quagmire, swapping with Ebb")
				caster:SwapAbilities("customability_quagmire", "customability_ebb", false, true)
				--ability:SetAbilityIndex(5)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			elseif abilityname == "customability_cloudburst" then
				print("Ability 2 was Cloudbusrt, swapping with Ebb")
				caster:SwapAbilities("customability_cloudburst", "customability_ebb", false, true)
				--ability:SetAbilityIndex(5)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			else
				print("Ability 2 was not Cloudburst, Quagmire, Flow or Fog of War, adding Ebb")
				caster:RemoveAbility(abilityname)
				local newAbility = caster:AddAbility("customability_ebb")
				newAbility:SetLevel(abilitylevel)
				newAbility:SetAbilityIndex(i)
			end
		elseif i == 2 then
			-------------Earth-------------------------------------------------------
			local ability = caster:GetAbilityByIndex(i)
			local abilityname = ability:GetAbilityName()
			local abilitylevel = ability:GetLevel()
			if abilityname == "customability_reinforce" then
				print("Ability 3 was Reinforce, swapping with Fortify")
				caster:SwapAbilities("customability_reinforce", "customability_fortify", false, true)
				--ability:SetAbilityIndex(5)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			elseif abilityname == "customability_magma" then
				print("Ability 3 was Magma, swapping with Fortify")
				caster:SwapAbilities("customability_magma", "customability_fortify", false, true)
				--ability:SetAbilityIndex(5)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			elseif abilityname == "customability_quagmire" then
				print("Ability 3 was Quagmire, swapping with Fortify")
				caster:SwapAbilities("customability_quagmire", "customability_fortify", false, true)
				--ability:SetAbilityIndex(5)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			elseif abilityname == "customability_pebblesalvo" then
				print("Ability 3 was Pebble Salvo, swapping with Fortify")
				caster:SwapAbilities("customability_pebblesalvo", "customability_fortify", false, true)
				--ability:SetAbilityIndex(5)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			else
				print("Ability 3 was not Quagmire, Magma or Reinforce, adding fortify")
				caster:RemoveAbility(abilityname)
				local newAbility = caster:AddAbility("customability_fortify")
				newAbility:SetLevel(abilitylevel)
				newAbility:SetAbilityIndex(i)
			end
		elseif i == 3 then
			----------------Wind----------------------------------------------------
			local ability = caster:GetAbilityByIndex(i)
			local abilityname = ability:GetAbilityName()
			local abilitylevel = ability:GetLevel()
			if abilityname == "customability_gale" then
				print("Ability 4 was Gale, swapping with Gust")
				caster:SwapAbilities("customability_gale", "customability_gust", false, true)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			elseif abilityname == "customability_firetornado" then
				print("Ability 4 was Fire Tornado, swapping with Gust")
				caster:SwapAbilities("customability_firetornado", "customability_gust", false, true)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			elseif abilityname == "customability_cloudburst" then
				print("Ability 4 was Cloudburst, swapping with Gust")
				caster:SwapAbilities("customability_cloudburst", "customability_gust", false, true)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			elseif abilityname == "customability_pebblesalvo" then
				print("Ability 4 was Pebble Salvo, swapping with Gust")
				caster:SwapAbilities("customability_pebblesalvo", "customability_gust", false, true)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			else
				print("Ability 4 was not Pebble Salvo, Cloudburst, Fire Tornado or Gale, adding Gust")
				caster:RemoveAbility(abilityname)
				local newAbility = caster:AddAbility("customability_gust")
				newAbility:SetLevel(abilitylevel)
				newAbility:SetAbilityIndex(i)
			end
		end
	end
end

-----------------------SetUpFireSpells--------------------------
function SetUpFireSpells(keys)
	print("SetUpFireSpells called")
	ResetSpells(keys)
	print("Skills cleared, adding fire spells")
	local caster = keys.caster
	for i=0,3 do
		if i == 0 then
			--Fire spell slot
			local ability = caster:GetAbilityByIndex(i)
			local abilityname = ability:GetAbilityName()
			local abilitylevel = ability:GetLevel()
			if caster:HasAbility("customability_inferno") then
				print("Inferno exists, swapping to replace Combust")
				caster:SwapAbilities("customability_inferno", "customability_combust", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			else
				print("Inferno does not exist, adding, then swapping to replace Combust")
				caster:AddAbility("customability_inferno")
				caster:SwapAbilities("customability_inferno", "customability_combust", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			end
		elseif i == 1 then
			--Water spell slot
			local ability = caster:GetAbilityByIndex(i)
			local abilityname = ability:GetAbilityName()
			local abilitylevel = ability:GetLevel()
			if caster:HasAbility("customability_fogofwar") then
				print("Fog of War exists, swapping to replace Ebb")
				caster:SwapAbilities("customability_fogofwar", "customability_ebb", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			else
				print("Fog of War does not exist, adding, then swapping to replace Ebb")
				caster:AddAbility("customability_fogofwar")
				caster:SwapAbilities("customability_fogofwar", "customability_ebb", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			end
		elseif i == 2 then
			--Earth spell slot
			local ability = caster:GetAbilityByIndex(i)
			local abilityname = ability:GetAbilityName()
			local abilitylevel = ability:GetLevel()
			if caster:HasAbility("customability_magma") then
				print("Magma exists, swapping to replace Fortify")
				caster:SwapAbilities("customability_magma", "customability_fortify", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			else
				print("Magma does not exist, adding, then swapping to replace Fortify")
				caster:AddAbility("customability_magma")
				caster:SwapAbilities("customability_magma", "customability_fortify", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			end
		elseif i == 3 then
			--Wind spell slot
			local ability = caster:GetAbilityByIndex(i)
			local abilityname = ability:GetAbilityName()
			local abilitylevel = ability:GetLevel()
			if caster:HasAbility("customability_firetornado") then
				print("Fire Tornado exists, swapping to replace Gust")
				caster:SwapAbilities("customability_firetornado", "customability_gust", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			else
				print("Fire Tornado does not exist, adding, then swapping to replace Gust")
				caster:AddAbility("customability_firetornado")
				caster:SwapAbilities("customability_firetornado", "customability_gust", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			end
		end
	end
end

-------------------SetUpWaterSpells--------------------------------
function SetUpWaterSpells(keys)
	print("SetUpWaterSpells called")
	ResetSpells(keys)
	print("Skills cleared, adding water spells")
	local caster = keys.caster
	for i=0,3 do
		if i == 0 then
			--Fire spell slot
			local ability = caster:GetAbilityByIndex(i)
			local abilityname = ability:GetAbilityName()
			local abilitylevel = ability:GetLevel()
			if caster:HasAbility("customability_fogofwar") then
				--print("Ability in 6th slot was Gale, swapping with Gust")
				print("Fog of War exists, swapping to replace Combust")
				caster:SwapAbilities("customability_fogofwar", "customability_combust", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			else
				--set up Gale on first cast
				print("Fog of War does not exist, adding, then swapping to replace Combust")
				caster:AddAbility("customability_fogofwar")
				caster:SwapAbilities("customability_fogofwar", "customability_combust", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			end
		elseif i == 1 then
			--Water spell slot
			local ability = caster:GetAbilityByIndex(i)
			local abilityname = ability:GetAbilityName()
			local abilitylevel = ability:GetLevel()
			if caster:HasAbility("customability_flow") then
				--print("Ability in 6th slot was Gale, swapping with Gust")
				print("Flow exists, swapping to replace Ebb")
				caster:SwapAbilities("customability_flow", "customability_ebb", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			else
				--set up Gale on first cast
				print("Flow does not exist, adding, then swapping to replace Ebb")
				caster:AddAbility("customability_flow")
				caster:SwapAbilities("customability_flow", "customability_ebb", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			end
		elseif i == 2 then
			--Earth spell slot
			local ability = caster:GetAbilityByIndex(i)
			local abilityname = ability:GetAbilityName()
			local abilitylevel = ability:GetLevel()
			if caster:HasAbility("customability_quagmire") then
				--print("Ability in 6th slot was Gale, swapping with Gust")
				print("Quagmire exists, swapping to replace Fortify")
				caster:SwapAbilities("customability_quagmire", "customability_fortify", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			else
				--set up Gale on first cast
				print("Quagmire does not exist, adding, then swapping to replace Fortify")
				caster:AddAbility("customability_quagmire")
				caster:SwapAbilities("customability_quagmire", "customability_fortify", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			end
		elseif i == 3 then
			--Wind spell slot
			local ability = caster:GetAbilityByIndex(i)
			local abilityname = ability:GetAbilityName()
			local abilitylevel = ability:GetLevel()
			if caster:HasAbility("customability_cloudburst") then
				--print("Ability in 6th slot was Gale, swapping with Gust")
				print("Cloudburst exists, swapping to replace Fortify")
				caster:SwapAbilities("customability_cloudburst", "customability_gust", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			else
				--set up Gale on first cast
				print("Cloudburst does not exist, adding, then swapping to replace Fortify")
				caster:AddAbility("customability_cloudburst")
				caster:SwapAbilities("customability_cloudburst", "customability_gust", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			end
		end
	end
end

function SetUpEarthSpells(keys)
	print("SetUpEarthSpells called")
	ResetSpells(keys)
	print("Skills cleared, adding earth spells")
	local caster = keys.caster
	for i=0,3 do
		if i == 0 then
			--Fire spell slot
			local ability = caster:GetAbilityByIndex(i)
			local abilityname = ability:GetAbilityName()
			local abilitylevel = ability:GetLevel()
			if caster:HasAbility("customability_magma") then
				print("Magma exists, swapping to replace Combust")
				caster:SwapAbilities("customability_magma", "customability_combust", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			else
				--set up Magma on first cast
				print("Magma does not exist, adding, then swapping to replace Combust")
				caster:AddAbility("customability_magma")
				caster:SwapAbilities("customability_magma", "customability_combust", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			end
		elseif i == 1 then
			--Water spell slot
			local ability = caster:GetAbilityByIndex(i)
			local abilityname = ability:GetAbilityName()
			local abilitylevel = ability:GetLevel()
			if caster:HasAbility("customability_quagmire") then
				print("Quagmire exists, swapping to replace Ebb")
				caster:SwapAbilities("customability_quagmire", "customability_ebb", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			else
				--set up Magma on first cast
				print("Quagmire does not exist, adding, then swapping to replace Ebb")
				caster:AddAbility("customability_quagmire")
				caster:SwapAbilities("customability_quagmire", "customability_ebb", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			end
		elseif i == 2 then
			--Earth spell slot
			local ability = caster:GetAbilityByIndex(i)
			local abilityname = ability:GetAbilityName()
			local abilitylevel = ability:GetLevel()
			if caster:HasAbility("customability_reinforce") then
				--print("Ability in 6th slot was Gale, swapping with Gust")
				print("Reinforce exists, swapping to replace Fortify")
				caster:SwapAbilities("customability_reinforce", "customability_fortify", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			else
				--set up Gale on first cast
				print("Reinforce does not exist, adding, then swapping to replace Fortify")
				caster:AddAbility("customability_reinforce")
				caster:SwapAbilities("customability_reinforce", "customability_fortify", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			end
		elseif i == 3 then
			--Wind spell slot
			local ability = caster:GetAbilityByIndex(i)
			local abilityname = ability:GetAbilityName()
			local abilitylevel = ability:GetLevel()
			if caster:HasAbility("customability_pebblesalvo") then
				--print("Ability in 6th slot was Gale, swapping with Gust")
				print("Pebble Salvo exists, swapping to replace Gust")
				caster:SwapAbilities("customability_pebblesalvo", "customability_gust", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			else
				--set up Gale on first cast
				print("Pebble Salvo does not exist, adding, then swapping to replace Gust")
				caster:AddAbility("customability_pebblesalvo")
				caster:SwapAbilities("customability_pebblesalvo", "customability_gust", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			end
		end
	end
end

function SetUpWindSpells(keys)
	print("SetUpWindSpells called")
	ResetSpells(keys)
	print("Skills cleared, adding wind spells")
	local caster = keys.caster
	for i=0,3 do
		if i == 0 then
			--Fire spell slot
			local ability = caster:GetAbilityByIndex(i)
			local abilityname = ability:GetAbilityName()
			local abilitylevel = ability:GetLevel()
			if caster:HasAbility("customability_firetornado") then
				print("Fire Tornado exists, swapping to replace Combust")
				caster:SwapAbilities("customability_firetornado", "customability_combust", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			else
				--set up Magma on first cast
				print("Fire Tornado does not exist, adding, then swapping to replace Combust")
				caster:AddAbility("customability_firetornado")
				caster:SwapAbilities("customability_firetornado", "customability_combust", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			end
		elseif i == 1 then
			--Water spell slot
			local ability = caster:GetAbilityByIndex(i)
			local abilityname = ability:GetAbilityName()
			local abilitylevel = ability:GetLevel()
			if caster:HasAbility("customability_cloudburst") then
				--print("Ability in 6th slot was Gale, swapping with Gust")
				print("Cloudburst exists, swapping to replace Ebb")
				caster:SwapAbilities("customability_cloudburst", "customability_ebb", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			else
				--set up Gale on first cast
				print("Cloudburst does not exist, adding, then swapping to replace Ebb")
				caster:AddAbility("customability_cloudburst")
				caster:SwapAbilities("customability_cloudburst", "customability_ebb", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			end
		elseif i == 2 then
			--Earth spell slot
			local ability = caster:GetAbilityByIndex(i)
			local abilityname = ability:GetAbilityName()
			local abilitylevel = ability:GetLevel()
			if caster:HasAbility("customability_pebblesalvo") then
				--print("Ability in 6th slot was Gale, swapping with Gust")
				caster:SwapAbilities("customability_pebblesalvo", "customability_fortify", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			else
				--set up Gale on first cast
				caster:AddAbility("customability_pebblesalvo")
				caster:SwapAbilities("customability_pebblesalvo", "customability_fortify", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			end
		elseif i == 3 then
			--Wind spell slot
			local ability = caster:GetAbilityByIndex(i)
			local abilityname = ability:GetAbilityName()
			local abilitylevel = ability:GetLevel()
			if caster:HasAbility("customability_gale") then
				--print("Ability in 6th slot was Gale, swapping with Gust")
				caster:SwapAbilities("customability_gale", "customability_gust", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			else
				--set up Gale on first cast
				caster:AddAbility("customability_gale")
				caster:SwapAbilities("customability_gale", "customability_gust", true, false)
				local newAbility = caster:GetAbilityByIndex(i)
				newAbility:SetLevel(abilitylevel)
			end
		end
	end
end