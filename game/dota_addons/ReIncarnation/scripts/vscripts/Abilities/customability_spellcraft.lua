function SpellcraftToggleOn(keys)
	Caster = keys.caster
	attunement = GetAttunement(Caster)
	if attunement ~= nil then
		print("Spellcraft toggled on. Attunement is: " .. attunement)
	end
end

function SpellcraftToggleOff(keys)
	Caster = keys.caster
	attunement = GetAttunement(Caster)
	if attunement ~= nil then
		print("Spellcraft toggled off. Attunement is: " .. attunement)
	end
end
	
function GetAttunement(keys)
	local Caster = keys
	if Caster:HasModifier("modifier_attunement_fire") then
		return "fire"
	elseif Caster:HasModifier("modifier_attunement_water") then
		return "water"
	elseif Caster:HasModifier("modifier_attunement_earth") then
		return "earth"
	elseif Caster:HasModifier("modifier_attunement_wind") then
		return "wind"
	else
		print("Attunement not found")
	end
end

function RemoveAttunement(keys)
	local Caster = keys
	print("Caster: " .. Caster:GetName())
	if Caster:HasModifier("modifier_attunement_fire") then
		Caster:RemoveModifierByName("modifier_attunement_fire")
				print("Attunement fire found and removed")
	elseif Caster:HasModifier("modifier_attunement_water") then
		Caster:RemoveModifierByName("modifier_attunement_water")
				print("Attunement water found and removed")
	elseif Caster:HasModifier("modifier_attunement_earth") then
		Caster:RemoveModifierByName("modifier_attunement_earth")
				print("Attunement earth found and removed")
	elseif Caster:HasModifier("modifier_attunement_wind") then
		Caster:RemoveModifierByName("modifier_attunement_wind")
		print("Attunement wind found and removed")
	else
		print("Attunement not found and not removed")
	end
	--print("Attunement found and removed")
end