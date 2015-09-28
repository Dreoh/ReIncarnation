function WhirlwindBegin(keys)
	local Caster = keys.caster
	
	StartSoundEvent("Hero_Juggernaut.BladeFuryStart", Caster)
end

function WhirlwindEnd(keys)
	local Caster = keys.caster

	StopSoundEvent("Hero_Juggernaut.BladeFuryStart", Caster)
end

function BandageBegin(keys)
	local Caster = keys.caster
	
	StartSoundEvent("Hero_WitchDoctor.Voodoo_Restoration", Caster)
end

function BandageEnd(keys)
	local Caster = keys.caster

	StopSoundEvent("Hero_WitchDoctor.Voodoo_Restoration", Caster)
end