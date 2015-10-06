require("popup")
require("Abilities/customability_spellcraft")

function FortifyCast(keys)
	local caster = keys.caster -- Saving the Caster Handle
    local ability = keys.ability -- Saving The Ability Handle
    local ability_name = ability:GetName()

    ability:ApplyDataDrivenModifier(caster,caster, ("modifier_fortify"), nil)

    -- Setting stack counters
    if (caster:HasModifier("modifier_fortify")) then
        caster:SetModifierStackCount(("modifier_fortify"), caster, (caster:GetModifierStackCount(("modifier_fortify"), caster) + 1))
    else 
        caster:SetModifierStackCount(("modifier_fortify"),caster,1)
    end

    RemoveAttunement(Caster)
end

function Attunement(keys)
    print("Attunement called")
    local Caster = keys.caster
    local ability = keys.ability
    RemoveAttunement(Caster)
    ability:ApplyDataDrivenModifier(Caster, Caster, ("modifier_attunement_earth"), nil)
end

function FortifyMinus(keys)
	local caster = keys.caster -- Saving the Caster Handle
    local ability = keys.ability -- Saving The Ability Handle
    local ability_name = ability:GetName()
    local modifiers = caster:FindAllModifiersByName("modifier_fortify")
    --print("---FortifyMinus called")

    --print(caster:GetName() .. " has " .. #modifiers .. "stacks of modifier_fortify")
    
    --Iterate through applied modifiers MOVED TO FILTERDAMAGE() in BAREBONES.LUA
    --[[caster:RemoveModifierByName("modifier_fortify")
    print("---removed Fortify")
    if caster:HasModifier("modifier_fortify") == 0 then
        caster:RemoveModifierByName("modifier_fortify_check")

    end]]
    
    -- Setting stack counters
        --caster:SetModifierStackCount(("modifier_fortify"), caster, (caster:GetModifierStackCount(("modifier_fortify"), caster) - 1))
    --else 
        --caster:RemoveModifierByName("modifier_fortify")
    --if caster:GetModifierStackCount("modifier_fortify", caster) == 0 then
    --    caster:RemoveModifierByName("modifier_fortify")
    --end

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