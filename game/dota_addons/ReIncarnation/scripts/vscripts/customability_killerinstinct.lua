require("popup")

function Daggers(keys)
	local Caster = keys.caster
	local Target = keys.target
	local Ability = Caster:GetAbilityByIndex(5)
	local radius = keys.radius
	local particle = "particles/daggers.vpcf"
	
	if Ability:GetAbilityName() == "customability_herbalism_empty1" then
		particle = "particles/daggers.vpcf"
	elseif Ability:GetAbilityName() == "customability_herbalism_slow" then
		particle = "particles/daggers_slow.vpcf"
	elseif Ability:GetAbilityName() == "customability_herbalism_frailty" then
		particle = "particles/daggers_frailty.vpcf"
	elseif Ability:GetAbilityName() == "customability_herbalism_damage" then
		particle = "particles/daggers_damage.vpcf"
	end	
		
	--particle = "particles/hw_rosh_fireball.vpcf" --test
	
	for _, unit in pairs(Entities:FindAllInSphere(Caster:GetAbsOrigin(), radius)) do
		if (unit:GetClassname() == "npc_dota_creature" or unit:GetClassname() == "npc_dota_creep_neutral") and unit:GetTeamNumber() == 3 and unit:IsAlive() then
			print("The unit found is " .. unit:GetName())
			print(unit:GetAbsOrigin())
			print(Caster:GetAbsOrigin())
			print(particle)
			print(Caster:GetForwardVector())
			local info = 
			{
				Ability = Caster:GetAbilityByIndex(1),
				Target = unit,
				Source = Caster,
				EffectName = particle,
				vSpawnOrigin = Caster:GetAbsOrigin(),
				--vSourceLoc = Caster:GetAbsOrigin(),	--test
				fDistance = 2000,
				fStartRadius = 64,
				fEndRadius = 64,
				iMoveSpeed = 450,
				bHasFrontalCone = false,
				bReplaceExisting = false,
				--iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION,	--test
				iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
				iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
				iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
				fExpireTime = GameRules:GetGameTime() + 10.0,
				bDeleteOnHit = true,
				vVelocity = Caster:GetForwardVector() * 1800,
				bProvidesVision = false,
				iVisionRadius = 0,
				iVisionTeamNumber = Caster:GetTeamNumber()
			}
			
			projectile = ProjectileManager:CreateTrackingProjectile(info)
		end
	end
end

function DaggerHit(keys)
	local Caster = keys.caster
	local Target = keys.target
	local Ability = Caster:GetAbilityByIndex(5)
	local radius = keys.radius
	local dmg = keys.damage / 100
	local mod = nil

	dmg =  Caster:GetAgility() * dmg
	
	if Ability:GetAbilityName() == "customability_herbalism_empty1" then
			mod = nil
		elseif Ability:GetAbilityName() == "customability_herbalism_slow" then
			mod = "modifier_slow"
		elseif Ability:GetAbilityName() == "customability_herbalism_frailty" then
			mod = "modifier_frailty"
		elseif Ability:GetAbilityName() == "customability_herbalism_damage" then
			mod = "modifier_damage"
	end	
	
	DealDamage( Caster, Target, dmg, DAMAGE_TYPE_PHYSICAL )
	PhysicalDamageManual(Target, dmg)
	if mod ~= nil then
		GiveUnitDataDrivenModifier(Caster, Target, mod, 5) -- "-1" means that it will last forever (or until its removed)
	end
end

function GiveUnitDataDrivenModifier(source, target, modifier, dur)
    --source and target should be hscript-units. The same unit can be in both source and target
    local item = CreateItem( "item_apply_modifiers", source, source)
    item:ApplyDataDrivenModifier( source, target, modifier, {duration=dur} )
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