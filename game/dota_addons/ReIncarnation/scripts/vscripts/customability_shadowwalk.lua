function Shadowwalk(keys)
	Caster = keys.caster
	if Caster:HasModifier("modifier_rune_invis") == false then
		Caster:RemoveModifierByName("modifier_shadowwalk_slow")
	end
end