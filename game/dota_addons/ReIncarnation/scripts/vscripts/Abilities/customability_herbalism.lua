poisonTable = {} --global table for poisons
require("popup")

function Herbalism(keys)
	local Caster = keys.caster
	local Herb = keys.caster:FindAbilityByName("customability_herbalism"):GetLevel()
	local Ability = Caster:GetAbilityByIndex(5)
	print("Herobology.lua called")
	print("Ability is " .. Ability:GetAbilityName())
	
	if Herb == 1 then
		HerbOne(Caster, Ability)
	end
	if Herb == 2 then
		HerbTwo(Caster, Ability)
	end
	if Herb == 3 then
		HerbThree(Caster, Ability)
	end
	

end

function HerbOne(Caster, Ability)

	if Ability:GetAbilityName() == "customability_herbalism_empty1" then
		--equip slow poison
		print("Equipping slow poison")
		Caster:RemoveAbility("customability_herbalism_empty1")
		
		Ability = Caster:AddAbility("customability_herbalism_slow")
		Ability = Caster:GetAbilityByIndex(5)
		Ability:SetLevel(1)
		--Ability:SetAbilityIndex(5)
	end
end

function HerbTwo(Caster, Ability)
	
	if Ability:GetAbilityName() == "customability_herbalism_empty1" or Ability:GetAbilityName() == "customability_herbalism_frailty" then
		--equip slow poison
		print("Equipping slow poison")
		if Ability:GetAbilityName() == "customability_herbalism_empty1" then
			Caster:RemoveAbility("customability_herbalism_empty1")
		elseif Ability:GetAbilityName() == "customability_herbalism_frailty" then
			Caster:RemoveAbility("customability_herbalism_frailty")
			Caster:RemoveModifierByName("modifier_herbalism_damage")
		end
		
		Ability = Caster:AddAbility("customability_herbalism_slow")
		Ability = Caster:GetAbilityByIndex(5)
		Ability:SetLevel(1)
		--Ability:SetAbilityIndex(5)
		
	elseif Ability:GetAbilityName() == "customability_herbalism_slow" then
		--equip frailty poison
		print("Equipping frailty poison")
		Caster:RemoveAbility("customability_herbalism_slow")
		Caster:RemoveModifierByName("modifier_herbalism_slow")
		Ability = Caster:AddAbility("customability_herbalism_frailty")
		Ability = Caster:GetAbilityByIndex(5)
		Ability:SetLevel(1)
		--Ability:SetAbilityIndex(5)
		
	end
end

function HerbThree(Caster, Ability)

	if Ability:GetAbilityName() == "customability_herbalism_empty1" or Ability:GetAbilityName() == "customability_herbalism_damage" then
		--equip slow poison
		print("Equipping slow poison")
		if Ability:GetAbilityName() == "customability_herbalism_empty1" then
			Caster:RemoveAbility("customability_herbalism_empty1")
		elseif Ability:GetAbilityName() == "customability_herbalism_damage" then
			Caster:RemoveAbility("customability_herbalism_damage")
			Caster:RemoveModifierByName("modifier_herbalism_damage")
		end
		
		Ability = Caster:AddAbility("customability_herbalism_slow")
		Ability = Caster:GetAbilityByIndex(5)
		Ability:SetLevel(1)
		--Ability:SetAbilityIndex(5)
		
	elseif Ability:GetAbilityName() == "customability_herbalism_slow" then
		--equip frailty poison
		print("Equipping frailty poison")
		Caster:RemoveAbility("customability_herbalism_slow")
		Caster:RemoveModifierByName("modifier_herbalism_slow")
		Ability = Caster:AddAbility("customability_herbalism_frailty")
		Ability = Caster:GetAbilityByIndex(5)
		Ability:SetLevel(1)
		--Ability:SetAbilityIndex(5)
		
	elseif Ability:GetAbilityName() == "customability_herbalism_frailty" then
		--equip damage poison
		print("Equipping damage poison")
		Caster:RemoveAbility("customability_herbalism_frailty")
		Caster:RemoveModifierByName("modifier_herbalism_frailty")
		Ability = Caster:AddAbility("customability_herbalism_damage")
		Ability = Caster:GetAbilityByIndex(5)
		Ability:SetLevel(1)
		--Ability:SetAbilityIndex(5)
		
	end
end

function FrailtyApply(keys)
	Target = keys.target
	frailty = 1 - (keys.frailty / 100)
	baseDmgMax = Target:GetBaseDamageMax()
	baseDmgMin = Target:GetBaseDamageMin()
	
	Target:SetBaseDamageMax(baseDmgMax * frailty)
	Target:SetBaseDamageMin(baseDmgMin * frailty)
end

function FrailtyRemove(keys)
	Target = keys.target
	frailty = 100 - keys.frailty
	baseDmgMax = Target:GetBaseDamageMax()
	baseDmgMin = Target:GetBaseDamageMin()
	
	Target:SetBaseDamageMax(100  * (baseDmgMax / frailty))
	Target:SetBaseDamageMin(100  * (baseDmgMin / frailty))
end

function DamagePoison(keys)
	local	Target = keys.target
	local	Caster = keys.caster
	local	dmgperc = keys.damageperc / 100
	local	poison = keys.poison / 100
	
	--print("Attack damage is " .. damage)
	
	damage = Caster:GetAttackDamage() * dmgperc					--Get damage scaled
	poison = Caster:GetIntellect() * poison		--Get Intelligence scaled
	dmg = poison + damage
	
	print( dmgperc .. " of attack damage is " .. damage)
	print("Intellect scale damage is " .. poison)
	print("Poison damage is " .. dmg)
	
	DealDamage(Caster, Target, dmg, DAMAGE_TYPE_MAGICAL, nil)
	PoisonDamageManual(Target, dmg)
	
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