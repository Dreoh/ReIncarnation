function Agi(keys)
	local Caster = keys.caster
	local agility = Caster:GetBaseAgility()
	print("PreAgility: " .. agility)
	 Caster:ModifyAgility(3)
	agility = Caster:GetBaseAgility()
	print("ProAgility: " .. agility)
	for i = 0, 5 do
		if Caster:GetItemInSlot(i) ~= nil and Caster:GetItemInSlot(i):GetName() == "item_custom_tome_agi" then
			local new_charges = Caster:GetItemInSlot(i):GetCurrentCharges() - 1
			if new_charges <= 0 then
    			Caster:RemoveItem(Caster:GetItemInSlot(i))
			elseif new_charges > 0 then
				Caster:GetItemInSlot(i):SetCurrentCharges(new_charges)
			end
		end
	end
end

function Int(keys)
	local Caster = keys.caster
	local intellect = Caster:GetBaseIntellect()
	print("PreIntellect: " .. intellect)
	Caster:ModifyIntellect(3)
	intellect = Caster:GetBaseIntellect()
	print("ProIntellect: " .. intellect)
	for i = 0, 5 do
		if Caster:GetItemInSlot(i) ~= nil and Caster:GetItemInSlot(i):GetName() == "item_custom_tome_int" then
			local new_charges = Caster:GetItemInSlot(i):GetCurrentCharges() - 1
			if new_charges <= 0 then
    			Caster:RemoveItem(Caster:GetItemInSlot(i))
			elseif new_charges > 0 then
				Caster:GetItemInSlot(i):SetCurrentCharges(new_charges)
			end
		end
	end
end

function Str(keys)
	local Caster = keys.caster
	local strength = Caster:GetBaseStrength()
	print("PreStrength: " .. strength)
	Caster:ModifyStrength(3)
	strength = Caster:GetBaseStrength()
	print("ProStrength: " .. strength)
	for i = 0, 5 do
		if Caster:GetItemInSlot(i) ~= nil and Caster:GetItemInSlot(i):GetName() == "item_custom_tome_str" then
			local new_charges = Caster:GetItemInSlot(i):GetCurrentCharges() - 1
			if new_charges <= 0 then
    			Caster:RemoveItem(Caster:GetItemInSlot(i))
			elseif new_charges > 0 then
				Caster:GetItemInSlot(i):SetCurrentCharges(new_charges)
			end
		end
	end
end