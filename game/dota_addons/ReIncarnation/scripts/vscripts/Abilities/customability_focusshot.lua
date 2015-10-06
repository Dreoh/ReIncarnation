require("popup")

function Focusshot(keys)
	local	Target = keys.target
	local	Caster = keys.caster
	local	damage = keys.damage / 100
	
	dmg = Caster:GetAgility() * damage		--Get Agility scaled
	print("Focusshot damage is " .. dmg)
	
	DealDamage(Caster, Target, dmg, DAMAGE_TYPE_PHYSICAL, nil)
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