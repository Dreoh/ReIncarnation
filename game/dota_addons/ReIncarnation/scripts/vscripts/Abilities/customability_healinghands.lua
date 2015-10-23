require("popup")
require("Abilities/customability_spellcraft")

function HealingHands(keys)
	local 	ability = keys.ability
	local	Caster = keys.caster
	local	heal = keys.heal / 100	--Comes in at non % value
	local 	Target = keys.target

	heal = Caster:GetIntellect() * heal

	HealNumbers(Target, heal)
	Target:Heal(heal, Caster)
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