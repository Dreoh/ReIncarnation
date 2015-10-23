require("popup")
require("Abilities/customability_spellcraft")

function OnCast(keys)
	local 	ability = keys.ability
	local	Caster = keys.caster
	local   Target = keys.target
	if Target:GetTeamNumber() ~= Caster:GetTeamNumber() then
		--Locust SwarmFoe(keys)
		ability:ApplyDataDrivenModifier(Caster,Target, ("modifier_locustswarm_foe"), nil)
		ability:ApplyDataDrivenModifier(Caster,Target, ("modifier_locustswarm_resistance"), nil)
		--local mod = Target:FindModifierByName("modifier_locustswarm_foe")
		Target.armorreduction = keys.armorreduction
	else
		--Awakened SpiritAlly(keys)
		ability:ApplyDataDrivenModifier(Caster,Target, ("modifier_awakenedspirit_ally"), nil)
		ability:ApplyDataDrivenModifier(Caster,Target, ("modifier_awakenedspirit_resistance"), nil)
		--local mod = Target:FindModifierByName("modifier_awakenedspirit_ally")
		Target.armorincrease = keys.armorincrease
	end
end

function Spread(keys, abilitytype)
	local Caster = keys.caster
	local Target = keys.target
	local radius = keys.spreadradius
	local ability = keys.ability

	print("Spreading " .. abilitytype)

	if abilitytype == "awakenedspirit" then

		--Awakened Spirit spread
		--Ally awakenedspirit spread
		for _,unit in pairs (FindUnitsInRadius(Caster:GetTeamNumber(), Target:GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_ALL,  0, FIND_ANY_ORDER, false) ) do
			if unit:HasModifier("modifier_awakenedspirit_resistance") then

			else
				ability:ApplyDataDrivenModifier(Caster,unit, ("modifier_awakenedspirit_ally"), nil)
				ability:ApplyDataDrivenModifier(Caster,unit, ("modifier_awakenedspirit_resistance"), nil)
				--local mod = unit:FindModifierByName("modifier_awakenedspirit_ally")
				unit.armorincrease = keys.armorincrease
			end
		end
		--Foe awakenedspirit spread
		for _,unit in pairs (FindUnitsInRadius(Caster:GetTeamNumber(), Target:GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_ALL,  0, FIND_ANY_ORDER, false) ) do
			if unit:HasModifier("modifier_awakenedspirit_resistance") then

			else
				ability:ApplyDataDrivenModifier(Caster,unit, ("modifier_awakenedspirit_foe"), nil)
				ability:ApplyDataDrivenModifier(Caster,unit, ("modifier_awakenedspirit_resistance"), nil)
				--local mod = unit:FindModifierByName("modifier_awakenedspirit_foe")
				unit.armorincrease = keys.armorincrease
			end
		end
	end

	--Locustswarm spread
	if abilitytype == "locustswarm" then

		--Ally locustswarm spread
		for _,unit in pairs (FindUnitsInRadius(Caster:GetTeamNumber(), Target:GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_ALL,  0, FIND_ANY_ORDER, false) ) do
			if unit:HasModifier("modifier_locustswarm_resistance") then

			else
				ability:ApplyDataDrivenModifier(Caster,unit, ("modifier_locustswarm_ally"), nil)
				ability:ApplyDataDrivenModifier(Caster,unit, ("modifier_locustswarm_resistance"), nil)
				--local mod = unit:FindModifierByName("modifier_locustswarm_ally")
				unit.armorreduction = keys.armorreduction
			end
		end
		--Foe locustswarm spread
		for _,unit in pairs (FindUnitsInRadius(Caster:GetTeamNumber(), Target:GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_ALL,  0, FIND_ANY_ORDER, false) ) do
			if unit:HasModifier("modifier_locustswarm_resistance") then

			else
				ability:ApplyDataDrivenModifier(Caster,unit, ("modifier_locustswarm_foe"), nil)
				ability:ApplyDataDrivenModifier(Caster,unit, ("modifier_locustswarm_resistance"), nil)
				--local mod = unit:FindModifierByName("modifier_locustswarm_foe")
				unit.armorreduction = keys.armorreduction
			end
		end
	end
end

function AwakenedSpiritAlly(keys)
	local 	ability = keys.ability
	local	Caster = keys.caster
	local 	Target = keys.target
	local   abilitytype = "awakenedspirit"
	
	Spread(keys, abilitytype)
end

function AwakenedSpiritFoe(keys)
	local 	ability = keys.ability
	local	Caster = keys.caster
	local 	Target = keys.target
	local   abilitytype = "awakenedspirit"

	Spread(keys, abilitytype)
end

function LocustSwarmAlly(keys)
	local 	ability = keys.ability
	local	Caster = keys.caster
	local 	Target = keys.target
	local   abilitytype = "locustswarm"

	Spread(keys, abilitytype)
end

function LocustSwarmFoe(keys)
	local 	ability = keys.ability
	local	Caster = keys.caster
	local 	Target = keys.target
	local   abilitytype = "locustswarm"

	Spread(keys, abilitytype)
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