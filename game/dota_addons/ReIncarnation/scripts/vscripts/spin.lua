function Spin(keys)
	local Ability = keys.caster:FindAbilityByName("customability_whirlwind")
	local Caster = keys.caster
	
	--if Ability:IsChanneling() then
		local rot = Caster:GetForwardVector()
		
		Caster:SetForwardVector(RotatePosition(Vector(0,0,0), QAngle(0,250,0), rot))
	--end
end