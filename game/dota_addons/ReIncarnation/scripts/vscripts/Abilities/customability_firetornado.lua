require("popup")
require("physics")
require("Abilities/customability_spellcraft")

function FireTornado(keys)
	local	Target = keys.target
	local	Caster = keys.caster
	local	damage = keys.damage / 100
	local 	force  = keys.force--keys.force

	--Get random vector
	local fv = Target:GetForwardVector()
	local radius = QAngle(0, RandomInt(1, 360), 0)
	local target_position = Target:GetAbsOrigin()
	local front_position = target_position + fv
	local direction = RandomVector(10)
	
	dmg = Caster:GetIntellect() * damage		--Get Intelligence scaled
	print("Fire Tornado damage is " .. dmg)
	
	DealDamage(Caster, Target, dmg, DAMAGE_TYPE_MAGICAL, nil)
	FireDamageManual(Target, dmg)

	--Apply force
	Physics:Unit(Target)
	Target:AddPhysicsVelocity((direction * force))
end

function Attunement(keys)
	print("Attunement called")
	local Caster = keys.caster
	local ability = keys.ability
	RemoveAttunement(Caster)
	if ability:GetAbilityIndex() == 0 then
		ability:ApplyDataDrivenModifier(Caster, Caster, ("modifier_attunement_fire"), nil)
	elseif ability:GetAbilityIndex() == 3 then
		ability:ApplyDataDrivenModifier(Caster, Caster, ("modifier_attunement_wind"), nil)
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