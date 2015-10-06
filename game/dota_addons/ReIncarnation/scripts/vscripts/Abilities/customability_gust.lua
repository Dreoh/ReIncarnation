require("popup")
require("physics")
require("Abilities/customability_spellcraft")

function Gust(keys)
	local	Target = keys.target
	local	Caster = keys.caster
	local	damage = keys.damage / 100
	local 	force  = keys.force--keys.force
	
	dmg = Caster:GetIntellect() * damage		--Get Intelligence scaled
	print("Gust damage is " .. dmg)
	
	DealDamage(Caster, Target, dmg, DAMAGE_TYPE_MAGICAL, nil)
	WindDamageManual(Target, dmg)

	--Apply force
	local direction = Caster:GetAbsOrigin() - Target:GetAbsOrigin()
	direction = direction:Normalized() * -1
	Physics:Unit(Target)
	Target:SetPhysicsFriction (.1)
	Target:AddPhysicsVelocity((direction * force))

	--RemoveAttunement(Caster)
end

function Attunement(keys)
	print("Attunement called")
	local Caster = keys.caster
	local ability = keys.ability
	RemoveAttunement(Caster)
	ApplyDataDrivenModifier(Caster,Caster, ("modifier_attunement_wind"), nil)
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