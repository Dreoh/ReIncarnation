function Slow(keys)
	local Target = keys.target
	local moveslow = keys.slow
	local atkslow = keys.atk_slow
	
	Target:SetBaseMoveSpeed(Target:GetBaseMoveSpeed() * (moveslow / 100))
	Target:SetBaseAttackTime(Target:GetBaseAttackTime() * (atkslow / 100))
end

function SlowRemove(keys)
	local Target = keys.target
	local moveslow = 100 - keys.slow
	local atkslow = 100 - keys.atk_slow
	
	--Target:SetBaseDamageMax(100  * (baseDmgMax / frailty))
	--Target:SetBaseDamageMin(100  * (baseDmgMax / frailty))
	Target:SetBaseMoveSpeed(100 * (Target:GetBaseMoveSpeed() / moveslow))
	Target:SetBaseAttackTime(100 * (Target:GetBaseAttackTime() / atkslow))
end