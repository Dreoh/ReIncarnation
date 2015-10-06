require("popup")

function Fireball(keys)
	local	Target = keys.target
	local	Caster = keys.caster
	local	damage = keys.damage / 100
	
	dmg = Caster:GetIntellect() * damage		--Get Intelligence scaled
	print("Fireball damage is " .. dmg)
	
	DealDamage(Caster, Target, dmg, DAMAGE_TYPE_MAGICAL, nil)
	FireDamageManual(Target, dmg)
	
end

function Burn(keys)
	local	Target = keys.target
	local	Caster = keys.caster
	local	damage = keys.burn / 100
	
	--print("Attack damage is " .. damage)
	
	dmg = Caster:GetIntellect() * damage		--Get Intelligence scaled
	
	DealDamage(Caster, Target, dmg, DAMAGE_TYPE_MAGICAL, nil)
	FireDamageManual(Target, dmg)
	
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