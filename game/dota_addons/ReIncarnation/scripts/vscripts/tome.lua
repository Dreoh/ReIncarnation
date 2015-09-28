function Agi(keys)
	local Caster = keys.caster
	local agility = Caster:GetBaseAgility()
	print("PreAgility: " .. agility)
	 Caster:ModifyAgility(3)
	agility = Caster:GetBaseAgility()
	print("ProAgility: " .. agility)
end

function Int(keys)
	local Caster = keys.caster
	local intellect = Caster:GetBaseIntellect()
	print("PreIntellect: " .. intellect)
	Caster:ModifyIntellect(3)
	intellect = Caster:GetBaseIntellect()
	print("ProIntellect: " .. intellect)
end

function Str(keys)
	local Caster = keys.caster
	local strength = Caster:GetBaseStrength()
	print("PreStrength: " .. strength)
	Caster:ModifyStrength(3)
	strength = Caster:GetBaseStrength()
	print("ProStrength: " .. strength)
end