SpellMaxTable = {}  -- Global Table
SpellActiveTable = {}
require("popup")

if SpellMaxTable == nil then
	for i = 0, 10, 1 do
		SpellMaxTable[i] = 1
		SpellActiveTable[i] = 0
	end
end

function Update(keys)
	local find = (keys.caster:FindAbilityByName("customability_spellmastery"):GetLevel()) + 1
	local Caster = keys.caster

	if SpellActiveTable[Caster:GetPlayerID()] == nil or SpellActiveTable[Caster:GetPlayerID()] < 0 then
		SpellActiveTable[Caster:GetPlayerID()] = 0
	end
	
	--print("Spell Mastery is level " .. find)
	SpellMaxTable[Caster:GetPlayerID()] = find
end

function Mana(keys)
	
	Update(keys)

	local Caster = keys.attacker
	local mana = keys.mana

	print("Spells active: " .. SpellActiveTable[Caster:GetPlayerID()])
	
	if SpellActiveTable[Caster:GetPlayerID()] == 0 then
		Caster:SetMana( Caster:GetMana() + mana)
		ManaNumbers(Caster, mana)
	end
	
end

------------------------------------------------------------------------------
--Leechblade
------------------------------------------------------------------------------
function LeechToggleOn(keys)
	
	local Ability = keys.caster:FindAbilityByName("customability_leechblade")
	local Caster = keys.caster
	local Manacost = 5
	
	Update(keys)
	
	SpellActiveTable[Caster:GetPlayerID()] = SpellActiveTable[Caster:GetPlayerID()] + 1
	if SpellActiveTable[Caster:GetPlayerID()] > SpellMaxTable[Caster:GetPlayerID()] then
		Ability:ToggleAbility()
		Caster:SetMana( Caster:GetMana() + Manacost)
	end
	
	print("Spells active: " .. SpellActiveTable[Caster:GetPlayerID()])
	print("Max spells: "  .. SpellMaxTable[Caster:GetPlayerID()])

end

function LeechToggleOff(keys)

	Update(keys)
	
	local Ability = keys.caster:FindAbilityByName("customability_leechblade")
	local Caster = keys.caster
	if SpellActiveTable[Caster:GetPlayerID()] > 0 then
		SpellActiveTable[Caster:GetPlayerID()] = SpellActiveTable[Caster:GetPlayerID()] - 1
	end
end

function Leechblade(keys)

	Update(keys)

	local Ability = keys.caster:FindAbilityByName("customability_leechblade")
	local Manacost = 5
	local Caster = keys.attacker
	local dmg = keys.damage
	local leech = keys.leechperc / 100

	if Caster:GetMana() < Manacost then
		Ability:ToggleAbility()
	else
		Caster:SetMana( Caster:GetMana() - Manacost)
		Caster:Heal((dmg * leech), Caster)
		HealNumbers(Caster, dmg * leech)
	end
end
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--Coldsteel
------------------------------------------------------------------------------
function ColdToggleOn(keys)

	local Ability = keys.caster:FindAbilityByName("customability_coldsteel")
	local Caster = keys.caster
	local Manacost = 5
	
	Update(keys)
	
	SpellActiveTable[Caster:GetPlayerID()] = SpellActiveTable[Caster:GetPlayerID()] + 1
	if SpellActiveTable[Caster:GetPlayerID()] > SpellMaxTable[Caster:GetPlayerID()] then
		Ability:ToggleAbility()
		Caster:SetMana( Caster:GetMana() + Manacost)
	end

	print("Spells active: " .. SpellActiveTable[Caster:GetPlayerID()])
	print("Max spells: "  .. SpellMaxTable[Caster:GetPlayerID()])
	
end

function ColdToggleOff(keys)

	Update(keys)
	
	local Ability = keys.caster:FindAbilityByName("customability_coldsteel")
	local Caster = keys.caster
	if SpellActiveTable[Caster:GetPlayerID()] > 0 then
		SpellActiveTable[Caster:GetPlayerID()] = SpellActiveTable[Caster:GetPlayerID()] - 1
	end

end

function Coldsteel(keys)

	Update(keys)

	local Ability = keys.caster:FindAbilityByName("customability_coldsteel")
	local Manacost = 5
	local Caster = keys.attacker

	if Caster:GetMana() < Manacost then
		Ability:ToggleAbility()
	else
		Caster:SetMana( Caster:GetMana() - Manacost)
	end

end
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--Pyredge
------------------------------------------------------------------------------
function PyreToggleOn(keys)
	
	local Ability = keys.caster:FindAbilityByName("customability_pyredge")
	local Caster = keys.caster
	local Manacost = 5
	
	Update(keys)
	
	SpellActiveTable[Caster:GetPlayerID()] = SpellActiveTable[Caster:GetPlayerID()] + 1
	if SpellActiveTable[Caster:GetPlayerID()] > SpellMaxTable[Caster:GetPlayerID()] then
		Ability:ToggleAbility()
		Caster:SetMana( Caster:GetMana() + Manacost)
	end
	
	print("Spells active: " .. SpellActiveTable[Caster:GetPlayerID()])
	print("Max spells: "  .. SpellMaxTable[Caster:GetPlayerID()])

end

function PyreToggleOff(keys)
	
	Update(keys)
	
	local Ability = keys.caster:FindAbilityByName("customability_pyredge")
	local Caster = keys.caster
	if SpellActiveTable[Caster:GetPlayerID()] > 0 then
		SpellActiveTable[Caster:GetPlayerID()] = SpellActiveTable[Caster:GetPlayerID()] - 1
	end

end

function Pyredge(keys)

	Update(keys)

	local Ability = keys.caster:FindAbilityByName("customability_pyredge")
	local Manacost = 5
	local Caster = keys.attacker

	if Caster:GetMana() < Manacost then
		Ability:ToggleAbility()
	else
		Caster:SetMana( Caster:GetMana() - Manacost)
	end

end
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--Shockpoint
------------------------------------------------------------------------------
function ShockToggleOn(keys)
	
	local Ability = keys.caster:FindAbilityByName("customability_shockpoint")
	local Caster = keys.caster
	local Manacost = 5
	
	Update(keys)
	
	SpellActiveTable[Caster:GetPlayerID()] = SpellActiveTable[Caster:GetPlayerID()] + 1
	if SpellActiveTable[Caster:GetPlayerID()] > SpellMaxTable[Caster:GetPlayerID()] then
		Ability:ToggleAbility()
		Caster:SetMana( Caster:GetMana() + Manacost)
	end
	
	print("Spells active: " .. SpellActiveTable[Caster:GetPlayerID()])
	print("Max spells: "  .. SpellMaxTable[Caster:GetPlayerID()])

end

function ShockToggleOff(keys)

	Update(keys)

	local Ability = keys.caster:FindAbilityByName("customability_shockpoint")
	local Caster = keys.caster
	if SpellActiveTable[Caster:GetPlayerID()] > 0 then
		SpellActiveTable[Caster:GetPlayerID()] = SpellActiveTable[Caster:GetPlayerID()] - 1
	end

end

function Shockpoint(keys)

	Update(keys)

	local Ability = keys.caster:FindAbilityByName("customability_shockpoint")
	local Manacost = 5
	local Caster = keys.attacker

	if Caster:GetMana() < Manacost then
		Ability:ToggleAbility()
	else
		Caster:SetMana( Caster:GetMana() - Manacost)
	end

end
------------------------------------------------------------------------------