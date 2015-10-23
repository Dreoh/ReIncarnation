require("popup")
require("physics")
require("Abilities/customability_spellcraft")

function JudgementDay(keys)
	local	Target = keys.target
	local	Caster = keys.caster
	local   ability = keys.ability
	local	damage = keys.damage / 100
	local 	heal = keys.damage / 100

	--JudgementDay = ParticleManager:CreateParticle("particles/cultist/judgementday_pulse.vpcf", PATTACH_ABSORIGIN, Caster)
	--ParticleManager:SetParticleControl(JudgementDay,0,point)

	--EmitSoundOnLocationWithCaster(point, "Hero_Invoker.ForgeSpirit", Caster)
	print("Caster's team is " .. Caster:GetTeamNumber())
	print("Target's team is " .. Target:GetTeamNumber())
	
	
	if Target:GetTeamNumber() ~= Caster:GetTeamNumber() then
		dmg = Caster:GetIntellect() * damage		--Get Intelligence scaled
		print("Judgement Day damage is " .. dmg)
		DarkDamageManual(Target, dmg)
		DealDamage(Caster, Target, dmg, DAMAGE_TYPE_MAGICAL, nil)
	else
		heal = Caster:GetIntellect() * heal
		print("Judgement Day heal is " .. heal)
		Target:Heal(heal, Caster)
		HealNumbers(Target, heal)
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