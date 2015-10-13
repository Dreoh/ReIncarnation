require("popup")
require("physics")
require("Abilities/customability_spellcraft")

function Gale(keys)
	local	Target = keys.target
	local	Caster = keys.caster
	local   ability = keys.ability
	local	damage = keys.damage / 100
	local 	force  = keys.force--keys.force
	local   direction = ability.direction
	--local   point = keys.target_points[1]
	
	dmg = Caster:GetIntellect() * damage		--Get Intelligence scaled
	print("Gale damage is " .. dmg)
	
	DealDamage(Caster, Target, dmg, DAMAGE_TYPE_MAGICAL, nil)
	WindDamageManual(Target, dmg)

	--Apply force
	if direction == nil then
		--ability.point = point
		print("Direction was nil")
		local dir = Caster:GetAbsOrigin() - Target:GetAbsOrigin()
		dir = dir:Normalized() * -1
		ability.direction = dir
		direction = dir
	end
	Physics:Unit(Target)
	--Target:SetPhysicsFriction (.05)
	Target:AddPhysicsVelocity((direction * force))

	--RemoveAttunement(Caster)
end

function ClearDirection(keys)
	print("Clearing Direction")
	local ability = keys.ability
	ability.direction = nil
end

function Attunement(keys)
	print("Attunement called")
	local Caster = keys.caster
	local ability = keys.ability
	RemoveAttunement(Caster)
	ability:ApplyDataDrivenModifier(Caster,Caster, ("modifier_attunement_wind"), nil)
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