require("popup")

function Whirlwind(keys)
	local	Target = keys.target
	local	Caster = keys.caster
	local	damage = keys.damage / 100
	
	dmg = Caster:GetAttackDamage() * damage		--Get Attack Damage scaled
	--print("Whirlwind damage is " .. dmg)
	
	DealDamage(Caster, Target, dmg, DAMAGE_TYPE_PHYSICAL, nil)
	--SendOverheadEventMessage( caster:GetPlayerOwner(), int_2, handle_3, int_4, handle_5 )
	PhysicalDamageManual(Target, dmg)
	
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