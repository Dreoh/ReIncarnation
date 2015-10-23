require("popup")

function Chainlightning(keys)
	local dmg = keys.dmg				--base attack damage
	local jumps = keys.maxjumps			--get max jumps from key values
	local shock = keys.shockperc / 100	--%shock damage from keyvalues
	local Target = keys.target			--Attacked unit
	local Caster = keys.caster			--Attacking unit
	local hitTable = {}					--Table of hit units. Lightning never strikes twice in the same place
	
	dmg = (dmg * shock)
	
	local damageTable = {victim = Target, attacker = Caster, damage = dmg, damage_type = DAMAGE_TYPE_MAGICAL}
	ApplyDamage(damageTable)	--Deal damage
	ShockDamageManual(Target, dmg)
	--print("The first unit is " .. Target:GetName())
	table.insert( hitTable, Target)
	lightningBolt = ParticleManager:CreateParticle("particles/units/heroes/hero_zuus/zuus_arc_lightning.vpcf", PATTACH_ABSORIGIN_FOLLOW, Caster)
	ParticleManager:SetParticleControl(lightningBolt,1,Vector(Target:GetAbsOrigin().x,Target:GetAbsOrigin().y,Target:GetAbsOrigin().z+((Target:GetBoundingMaxs().z - Target:GetBoundingMins().z)/2)))
	
	for i = 0, jumps do
		for _, unit in pairs(Entities:FindAllInSphere(Target:GetAbsOrigin(), 400)) do
			if (unit:GetClassname() == "npc_dota_creature" or unit:GetClassname() == "npc_dota_creep_neutral") and unit:GetTeamNumber() == 3 and unit:IsAlive() then
				--print("The #" .. i .. " unit found is " .. unit:GetName())
				local checkunit = 0 					--bool check if we hit this unit before
				
				for c = 0, #hitTable do					--iterate through hit units
					if hitTable[c] == unit then
						checkunit = 1					--unit has been hit
					end
				end
				
				if checkunit == 0 then					--if unit has not been hit
					--print("Dealing " .. dmg .." to " .. unit:GetName())
					prevTarget = Target					--last unit is particle start point
					Target = unit						--unit becomes new start point next iteration
					lightningBolt = ParticleManager:CreateParticle("particles/units/heroes/hero_zuus/zuus_arc_lightning.vpcf", PATTACH_ABSORIGIN_FOLLOW, prevTarget)
					ParticleManager:SetParticleControl(lightningBolt,1,Vector(Target:GetAbsOrigin().x,Target:GetAbsOrigin().y,Target:GetAbsOrigin().z+((Target:GetBoundingMaxs().z - Target:GetBoundingMins().z)/2)))
					table.insert( hitTable, Target )	--log as a hit unit
					damageTable = {victim = Target, attacker = Caster, damage = dmg, damage_type = DAMAGE_TYPE_MAGICAL}
					ApplyDamage(damageTable)	--Deal damage
					ShockDamageManual(Target, dmg)
					break
				end
			end
		end
	end
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