require("popup")
require("physics")
require("Abilities/customability_spellcraft")

function Cloudburst(keys)
	local	Target = keys.target
	local	Caster = keys.caster
	local   ability = keys.ability
	local	damage = keys.damage / 100
	
	dmg = Caster:GetIntellect() * damage		--Get Intelligence scaled
	print("Magma damage is " .. dmg)

	--lightningBolt = ParticleManager:CreateParticle("particles/cloudburst_lightning.vpcf", PATTACH_ABSORIGIN_FOLLOW, Caster)
	--ParticleManager:SetParticleControl(lightningBolt,0,Vector(Target:GetAbsOrigin().x,Target:GetAbsOrigin().y,Target:GetAbsOrigin().z+((Target:GetBoundingMaxs().z - Target:GetBoundingMins().z)/2)))

	DealDamage(Caster, Target, dmg, DAMAGE_TYPE_MAGICAL, nil)
	ShockDamageManual(Target, dmg)
end

function Attunement(keys)
	print("Attunement called")
	local Caster = keys.caster
	local ability = keys.ability
	RemoveAttunement(Caster)
	if ability:GetAbilityIndex() == 1 then
		ability:ApplyDataDrivenModifier(Caster, Caster, ("modifier_attunement_water"), nil)
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