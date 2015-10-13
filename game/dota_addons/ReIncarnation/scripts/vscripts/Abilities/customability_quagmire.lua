require("popup")
require("physics")
require("Abilities/customability_spellcraft")

function Attunement(keys)
	print("Attunement called")
	local Caster = keys.caster
	local ability = keys.ability
	RemoveAttunement(Caster)
	if ability:GetAbilityIndex() == 1 then
		ability:ApplyDataDrivenModifier(Caster, Caster, ("modifier_attunement_water"), nil)
	elseif ability:GetAbilityIndex() == 2 then
		ability:ApplyDataDrivenModifier(Caster, Caster, ("modifier_attunement_earth"), nil)
	end
	SpellcraftToggleOn(keys)
end

-- a function that makes dealing damage slightly faster.
function DealDamage(source, target, damage, dType, flags)
	local dTable = {
		victim = target,
		attacker = source,
		damage = damage,
		damage_type = dType,
		damage_flags = flags,
		ability = nil
	}
	ApplyDamage(dTable)
end