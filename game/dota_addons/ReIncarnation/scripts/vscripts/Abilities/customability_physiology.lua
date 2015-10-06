require("popup")

function Backstab(keys)
	Caster = keys.caster
	Target = keys.target
	backstab = (keys.bonus - 100) / 100
	damage = keys.damage
	bonusdamage = damage * backstab
	
	if Target:GetForwardVector():Dot(Caster:GetForwardVector()) >= 0 then
		DealDamage(Caster, Target, bonusdamage, DAMAGE_TYPE_PHYSICAL, nil)
		CriticalDamage(Target, bonusdamage + damage)
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