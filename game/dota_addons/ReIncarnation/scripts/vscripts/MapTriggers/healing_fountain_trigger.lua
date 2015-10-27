require("physics")

function OnStartTouch(trigger)
 
	print(trigger.activator)
	print(trigger.caller)
	local unit = trigger.activator
	--LinkLuaModifier("modifier_swamp_lua", "Modifiers/modifier_swamp_lua.lua", LUA_MODIFIER_MOTION_NONE)
	if unit:IsHero() or unit:IsIllusion() then
		print("Applying modifier_fountain_heal")
		--Physics:Unit(unit)
		--unit:Slide(true)
		--unit:SetPhysicsFriction(1)
		ApplyModifier(unit, "modifier_fountain_heal")
	end
 
end
 
function OnEndTouch(trigger)
 
	print(trigger.activator)
	print(trigger.caller)
	local unit = trigger.activator
	if unit:HasModifier("modifier_fountain_heal") then
		print("Removing modifier_fountain_heal")
		--unit:SetPhysicsFriction(.05)
		--unit:Slide(false)
		unit:RemoveModifierByName("modifier_fountain_heal")
	end
end