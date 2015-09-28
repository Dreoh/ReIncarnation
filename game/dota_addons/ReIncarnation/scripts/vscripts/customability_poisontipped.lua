require("popup")

function Damage(keys)
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