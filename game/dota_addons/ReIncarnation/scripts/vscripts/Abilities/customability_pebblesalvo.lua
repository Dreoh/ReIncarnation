require("popup")
require("physics")
require("Abilities/customability_spellcraft")

function PebbleSalvo(keys)
	local	Caster = keys.caster
	local 	distance = 200
	local   ability = keys.ability
	local 	speed  = 1000
	local 	radius = 30
	Attunement(keys)
	local projectileTable = {
    	--target = point
        Ability = ability,
        --EffectName = "particles/units/heroes/hero_windrunner/windrunner_spell_powershot.vpcf",
        EffectName = "particles/elementalist/pebblesalvo.vpcf",
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

    for i=1,24 do
    	local angle = i * 15
    	print("Creating pebble salvo projectile in direction: " .. angle)
	    local rotated = Caster:GetAbsOrigin() + RotatePosition(Vector(0,0,0), QAngle(0,angle,0), Caster:GetForwardVector()) * distance

	    --local point = Caster:GetAbsOrigin() + Caster:GetForwardVector() * distance -- Distance in front of the caster
	    rotated.z = 0

	    local pos = Caster:GetAbsOrigin()
	    pos.z = 0

	    local diff = rotated - pos
	    projectileTable.vVelocity = diff:Normalized() * speed

	    -- Launch the projectile
	    local FlowMissile = ProjectileManager:CreateLinearProjectile( projectileTable )
	end
end

function PebbleSalvoProjectileHit(keys)
	local	Target = keys.target
	local	Caster = keys.caster
	local	damage = keys.damage / 100
	local 	force  = keys.force--keys.force
	
	dmg = Caster:GetIntellect() * damage		--Get Intelligence scaled
	print("PebbleSalvo damage is " .. dmg)
	
	DealDamage(Caster, Target, dmg, DAMAGE_TYPE_MAGICAL, nil)
	EarthDamageManual(Target, dmg)
end

function Attunement(keys)
	print("Attunement called")
	local Caster = keys.caster
	local ability = keys.ability
	RemoveAttunement(Caster)
	if ability:GetAbilityIndex() == 2 then
		ability:ApplyDataDrivenModifier(Caster, Caster, ("modifier_attunement_earth"), nil)
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