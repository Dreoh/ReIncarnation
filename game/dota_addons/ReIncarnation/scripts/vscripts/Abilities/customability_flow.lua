require("popup")
require("sounds")
require("physics")
require("Abilities/customability_spellcraft")

--[[function FlowBarrageStart( keys )
	-- Variables
	local caster = keys.caster
	local point = keys.target_points[1]

	caster.flow_dummy = CreateUnitByName("dummy_unit_vulnerable", point, false, caster, caster, caster:GetTeam())
end

function FlowBarrageEnd( keys )
	local caster = keys.caster
	caster:RemoveModifierByName("modifier_rain_of_fire_channelling")
	
	local flow_dummy_pointer = caster.fire_storm_dummy
    caster.flow_dummy:RemoveSelf()	
end]]

function Flow(keys)
	print("customability_flow.lua function - flow called")
	--local	Target = keys.target
	--local 	point = keys.target_points[1]
	local	Caster = keys.caster
	local	damage = keys.damage / 100
	local 	distance = keys.distance + 50
	local   ability = keys.ability
	local 	speed  = 2500
	local 	radius = 75

	
	dmg = Caster:GetIntellect() * damage		--Get Intelligence scaled
	print("Flow damage is " .. dmg)
	
	--------------------------------------------------------
    local projectileTable = {
    	--target = point
        Ability = ability,
        --EffectName = "particles/units/heroes/hero_windrunner/windrunner_spell_powershot.vpcf",
        EffectName = "particles/elementalist/flow.vpcf",
        vSpawnOrigin = Caster:GetAbsOrigin(),
        fDistance = distance,
        fStartRadius = radius,
        fEndRadius = radius,
        --fExpireTime = GameRules:GetGameTime() + 5,
        Source = Caster,
        bHasFrontalCone = true,
        bReplaceExisting = false,
        bProvidesVision = false,
        iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
        iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
        iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
    }

    -- Set the direction and speed
    local point = Caster:GetAbsOrigin() + Caster:GetForwardVector() * distance -- Distance in front of the caster
    --DebugDrawCircle(point ), Vector(255,0,0), 255, 64, true, 5) -- Debug print the pos
    point.z = 0

    local pos = Caster:GetAbsOrigin()
    pos.z = 0

    local diff = point - pos
    projectileTable.vVelocity = diff:Normalized() * speed
    --print("projectile velocity is " .. projectileTable.vVelocity)

    -- Launch the projectile
    local FlowMissile = ProjectileManager:CreateLinearProjectile( projectileTable )
    --FlowSound(Caster)
	-----------------------------------------------

	
end

function Attunement(keys)
	print("Attunement called")
	local Caster = keys.caster
	local ability = keys.ability
	RemoveAttunement(Caster)
	ability:ApplyDataDrivenModifier(Caster, Caster, ("modifier_attunement_water"), nil)
	SpellcraftToggleOn(keys)
end

function FlowDamageCalculate(keys)
	print("collided")
	local	Target = keys.target
	local	Caster = keys.caster
	local	damage = keys.damage / 100

	dmg = Caster:GetIntellect() * damage		--Get Intelligence scaled
	print("Fireball damage is " .. dmg)

	--Apply force
	local direction = Caster:GetAbsOrigin() - Target:GetAbsOrigin()
	direction = direction:Normalized() * -1
	Physics:Unit(Target)
	--Target:SetPhysicsFriction (.05)
	Target:AddPhysicsVelocity((direction * 100))

	DealDamage(Caster, Target, dmg, DAMAGE_TYPE_MAGICAL, nil)
	WaterDamageManual(Target, dmg)
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