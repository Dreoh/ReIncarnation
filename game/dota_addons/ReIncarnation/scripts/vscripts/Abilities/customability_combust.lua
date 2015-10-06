require("popup")
require("Abilities/customability_spellcraft")

function Combust(keys)
	--local 	Target = nil
	local 	ability = keys.ability
	local 	point  = keys.target_points[1]
	local	Caster = keys.caster
	local	damage = keys.damage / 100	--Comes in at non % value
	local   radius = keys.radius
	local 	attunement = "fire"

	CombustFlame = ParticleManager:CreateParticle("particles/units/heroes/hero_jakiro/jakiro_liquid_fire_explosion.vpcf", PATTACH_ABSORIGIN, Caster)
	ParticleManager:SetParticleControl(CombustFlame,0,point)

	EmitSoundOnLocationWithCaster(point, "Hero_Invoker.ForgeSpirit", Caster)

	local HeroUnits = FindUnitsInRadius( Caster:GetTeamNumber(), point, nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)
	local units = FindUnitsInRadius( Caster:GetTeamNumber(), point, nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)
	
	for key,unit in pairs(HeroUnits) do
	    --print(key,value)
	    local Target = unit
	    dmg = Caster:GetIntellect() * damage		--Get Intelligence scaled
		--print("Combust damage is " .. dmg)
		DealDamage(Caster, Target, dmg, DAMAGE_TYPE_MAGICAL, nil)
		FireDamageManual(Target, dmg)
	end
	--[[if #units == 0 then
		print("No hero targets found for Combust")
	end]]

	for key,unit in pairs(units) do
	    --print(key,value)
	    local Target = unit
	    dmg = Caster:GetIntellect() * damage		--Get Intelligence scaled
		--print("Combust damage is " .. dmg)
		DealDamage(Caster, Target, dmg, DAMAGE_TYPE_MAGICAL, nil)
		FireDamageManual(Target, dmg)
	end
	--[[if #units == 0 then
		print("No non-hero targets found for Combust")
	end]]
	--print("The #" .. i .. " unit found is " .. unit:GetName())

	--RemoveAttunement(Caster)
	--ability:ApplyDataDrivenModifier(Caster,Caster, ("modifier_attunement_fire"), nil)

end

function Attunement(keys)
	print("Attunement called")
	local Caster = keys.caster
	local ability = keys.ability
	RemoveAttunement(Caster)
	ability:ApplyDataDrivenModifier(Caster, Caster, ("modifier_attunement_fire"), nil)
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