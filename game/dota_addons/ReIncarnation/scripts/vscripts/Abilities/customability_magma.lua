require("popup")
require("physics")
require("Abilities/customability_spellcraft")

function Magma(keys)
	local	Target = keys.target
	local	Caster = keys.caster
	local   ability = keys.ability
	local	damage = keys.damage / 100
	
	dmg = Caster:GetIntellect() * damage		--Get Intelligence scaled
	print("Magma damage is " .. dmg)
	
	DealDamage(Caster, Target, dmg, DAMAGE_TYPE_MAGICAL, nil)
	FireDamageManual(Target, dmg)
end

function Attunement(keys)
	print("Attunement called")
	local Caster = keys.caster
	local ability = keys.ability
	RemoveAttunement(Caster)
	if ability:GetAbilityIndex() == 0 then
		ability:ApplyDataDrivenModifier(Caster, Caster, ("modifier_attunement_fire"), nil)
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