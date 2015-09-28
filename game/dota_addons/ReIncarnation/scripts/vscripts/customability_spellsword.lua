require("popup")
function Spellsword(keys)

	local Ability = keys.caster:FindAbilityByName("customability_spellsword")
	local Manacost = 5
	local Caster = keys.attacker

	if Caster:GetMana() < Manacost then
		Ability:ToggleAbility()
	else
		Caster:SetMana( Caster:GetMana() - Manacost)
	end

end

function DamageNumbers(keys)

	local	Target = keys.target
	local	Caster = keys.caster
	local	dmg = keys.damage
	
	ArcaneDamageManual(Target, dmg)

end