require("popup")
require("Abilities/customability_spellcraft")

function OnCast(keys)
	local 	ability = keys.ability
	local	Caster = keys.caster
	local   Target = keys.target
	if Target:GetTeamNumber() ~= Caster:GetTeamNumber() then
		--AnathemaFoe(keys)
		ability:ApplyDataDrivenModifier(Caster,Target, ("modifier_anathema_foe"), nil)
		ability:ApplyDataDrivenModifier(Caster,Target, ("modifier_anathema_resistance"), nil)
	else
		--BenedictionAlly(keys)
		ability:ApplyDataDrivenModifier(Caster,Target, ("modifier_benediction_ally"), nil)
		ability:ApplyDataDrivenModifier(Caster,Target, ("modifier_benediction_resistance"), nil)
	end
end

function Spread(keys, abilitytype)
	local Caster = keys.caster
	local Target = keys.target
	local radius = keys.spreadradius
	local ability = keys.ability

	print("Spreading " .. abilitytype)

	if abilitytype == "benediction" then

		--Benediction spread
		--Ally benediction spread
		for _,unit in pairs (FindUnitsInRadius(Caster:GetTeamNumber(), Target:GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_ALL,  0, FIND_ANY_ORDER, false) ) do
			if unit:HasModifier("modifier_benediction_resistance") then

			else
				ability:ApplyDataDrivenModifier(Caster,unit, ("modifier_benediction_ally"), nil)
				ability:ApplyDataDrivenModifier(Caster,unit, ("modifier_benediction_resistance"), nil)

			end
		end
		--Foe benediction spread
		for _,unit in pairs (FindUnitsInRadius(Caster:GetTeamNumber(), Target:GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_ALL,  0, FIND_ANY_ORDER, false) ) do
			if unit:HasModifier("modifier_benediction_resistance") then

			else
				ability:ApplyDataDrivenModifier(Caster,unit, ("modifier_benediction_foe"), nil)
				ability:ApplyDataDrivenModifier(Caster,unit, ("modifier_benediction_resistance"), nil)
			end
		end
	end

	--Anathema spread
	if abilitytype == "anathema" then

		--Ally anathema spread
		for _,unit in pairs (FindUnitsInRadius(Caster:GetTeamNumber(), Target:GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_ALL,  0, FIND_ANY_ORDER, false) ) do
			if unit:HasModifier("modifier_anathema_resistance") then

			else
				ability:ApplyDataDrivenModifier(Caster,unit, ("modifier_anathema_ally"), nil)
				ability:ApplyDataDrivenModifier(Caster,unit, ("modifier_anathema_resistance"), nil)

			end
		end
		--Foe anathema spread
		for _,unit in pairs (FindUnitsInRadius(Caster:GetTeamNumber(), Target:GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_ALL,  0, FIND_ANY_ORDER, false) ) do
			if unit:HasModifier("modifier_anathema_resistance") then

			else
				ability:ApplyDataDrivenModifier(Caster,unit, ("modifier_anathema_foe"), nil)
				ability:ApplyDataDrivenModifier(Caster,unit, ("modifier_anathema_resistance"), nil)
			end
		end
	end
end

function BenedictionAlly(keys)
	local 	ability = keys.ability
	local	Caster = keys.caster
	local	heal = keys.heal / 100	--Comes in at non % value
	local 	Target = keys.target
	local   abilitytype = "benediction"
	
	Spread(keys, abilitytype)

	if Target:HasModifier("modifier_anathema_ally") or Target:HasModifier("modifier_locustswarm_ally") or Target:HasModifier("modifier_daemon_slow_effect") then
		heal = (Caster:GetIntellect() * heal) * 1.5
	else
	    heal = Caster:GetIntellect() * heal		--Get Intelligence scaled
	end

	HealNumbers(Target, heal)
	Target:Heal(heal, Caster)

	print("Benediction healed " .. Target:GetUnitName() .. " for " .. heal)
end

function BenedictionFoe(keys)
	local 	ability = keys.ability
	local	Caster = keys.caster
	local	heal = keys.heal / 100	--Comes in at non % value
	local 	Target = keys.target
	local   abilitytype = "benediction"

	Spread(keys, abilitytype)

    heal = (Caster:GetIntellect() * heal) * .5		--Get Intelligence scaled
	HealNumbers(Target, heal)
	Target:Heal(heal, Caster)

	print("Benediction healed " .. Target:GetUnitName() .. " for " .. heal)
end

function AnathemaAlly(keys)
	local 	ability = keys.ability
	local	Caster = keys.caster
	local	damage = keys.damage / 100	--Comes in at non % value
	local 	Target = keys.target
	local   abilitytype = "anathema"

	Spread(keys, abilitytype)
	
    dmg = (Caster:GetIntellect() * damage) * .5	--Get Intelligence scaled
	DealDamage(Caster, Target, dmg, DAMAGE_TYPE_MAGICAL, nil)
	DarkDamageManual(Target, dmg)

	print("Anathema damaged " .. Target:GetUnitName() .. " for " .. dmg)
end

function AnathemaFoe(keys)
	local 	ability = keys.ability
	local	Caster = keys.caster
	local	damage = keys.damage / 100	--Comes in at non % value
	local 	Target = keys.target
	local   abilitytype = "anathema"

	Spread(keys, abilitytype)
	
	if Target:HasModifier("modifier_benediction_foe") or Target:HasModifier("modifier_awakenedspirit_foe") or Target:HasModifier("modifier_paegon_haste_effect") then
    	dmg = (Caster:GetIntellect() * damage) * 1.5		--Get Intelligence scaled
    else
    	dmg = Caster:GetIntellect() * damage		--Get Intelligence scaled
    end
	DealDamage(Caster, Target, dmg, DAMAGE_TYPE_MAGICAL, nil)
	DarkDamageManual(Target, dmg)

	print("Anathema damaged " .. Target:GetUnitName() .. " for " .. dmg)
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