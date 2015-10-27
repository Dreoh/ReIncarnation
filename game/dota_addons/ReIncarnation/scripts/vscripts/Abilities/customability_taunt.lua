function Taunt(keys)
	local 	ability = keys.ability
	local	Caster = keys.caster
	local   Target = keys.target

	Target:SetForceAttackTarget(Caster)
	--print(Target:GetName() .. " is now attacking " .. Caster:GetName())
end