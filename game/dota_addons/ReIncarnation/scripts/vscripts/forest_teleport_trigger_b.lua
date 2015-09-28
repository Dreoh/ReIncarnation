function OnStartTouch(trigger)
 
	print(trigger.activator)
	print(trigger.caller)
	local occupied = 0
	local point = Entities:FindByName( nil, "forest_teleport_point_a" ):GetAbsOrigin()
	for _, unit in pairs(FindUnitsInRadius( DOTA_UNIT_TARGET_TEAM_BOTH, point, nil , 75, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_ALL, 0, 0, false)) do
		if unit:IsHero() or unit:IsSummoned() or unit:IsCreature() then
			occupied = 1;
		end
	end
	if occupied == 0 then
		trigger.activator:SetAbsOrigin(point)
		trigger.activator:Stop()
		SendToConsole("dota_camera_center")
	end
 
end
 
function OnEndTouch(trigger)
 
	print(trigger.activator)
	print(trigger.caller)
 
end