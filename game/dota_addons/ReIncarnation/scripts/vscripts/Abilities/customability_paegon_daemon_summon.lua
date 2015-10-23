require("popup")
require("timers")
require("Abilities/customability_spellcraft")

function Summon(keys)
	local 	ability = keys.ability
	local	Caster = keys.caster
	local   Target = keys.target
	local   duration = keys.duration
	print("duration = " .. duration)
	if Target:GetTeamNumber() ~= Caster:GetTeamNumber() then
		ally = CreateUnitByName("npc_dota_creature_lesser_daemon", Target:GetAbsOrigin() + RandomVector( RandomFloat( 100, 200 ) ), true, Caster, Caster, Caster:GetTeam())
		ally:AddNewModifier(Caster, ability, "modifier_kill", {duration = duration})
	else
		ally = CreateUnitByName("npc_dota_creature_lesser_paegon", Target:GetAbsOrigin() + RandomVector( RandomFloat( 100, 200 ) ), true, Caster, Caster, Caster:GetTeam())
		ally:AddNewModifier(Caster, ability, "modifier_kill", {duration = duration})
	end
	ally:SetControllableByPlayer(Caster:GetPlayerID(), true)
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