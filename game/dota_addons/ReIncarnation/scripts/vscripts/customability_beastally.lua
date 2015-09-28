SpiderBin = {}  -- Global Table

function BeastAlly(keys)

	local Caster = keys.caster
	local find = Caster:FindAbilityByName("customability_beastally"):GetLevel()
	
	--[[ get all "spider"
		RemoveSpider(Caster)
		
		ally = CreateUnitByName("npc_dota_creature_beastally_spiderling", Caster:GetAbsOrigin() + RandomVector( RandomFloat( 100, 200 ) ), true, Caster, Caster, Caster:GetTeam())
                --table.insert(SpiderBin, ally)
		SpiderBin[Caster:GetPlayerID()] = ally]]
	
	if find == 1 then
	
		-- get all "spider"
		RemoveSpider(Caster)
		
		ally = CreateUnitByName("npc_dota_creature_beastally_spiderling1", Caster:GetAbsOrigin() + RandomVector( RandomFloat( 100, 200 ) ), true, Caster, Caster, Caster:GetTeam())
                --table.insert(SpiderBin, ally)
		SpiderBin[Caster:GetPlayerID()] = ally
	elseif find == 2 then
	
		-- get all "spider"
		RemoveSpider(Caster)
		
		ally = CreateUnitByName("npc_dota_creature_beastally_spiderling2", Caster:GetAbsOrigin() + RandomVector( RandomFloat( 100, 200 ) ), true, Caster, Caster, Caster:GetTeam())
                --table.insert(SpiderBin, ally)
		SpiderBin[Caster:GetPlayerID()] = ally
	elseif find == 3 then
	
		-- get all "spider"
		RemoveSpider(Caster)
		
		ally = CreateUnitByName("npc_dota_creature_beastally_spiderling3", Caster:GetAbsOrigin() + RandomVector( RandomFloat( 100, 200 ) ), true, Caster, Caster, Caster:GetTeam())
                --table.insert(SpiderBin, ally)
		SpiderBin[Caster:GetPlayerID()] = ally
	elseif find == 4 then
	
		-- get all "spider"
		RemoveSpider(Caster)
		
		ally = CreateUnitByName("npc_dota_creature_beastally_spiderling4", Caster:GetAbsOrigin() + RandomVector( RandomFloat( 100, 200 ) ), true, Caster, Caster, Caster:GetTeam())
                --table.insert(SpiderBin, ally)
		SpiderBin[Caster:GetPlayerID()] = ally
	end
	
	ally:SetControllableByPlayer(Caster:GetPlayerID(), true)
	
end

function RemoveSpider(Caster)
	--local LocalSpider = table.remove(SpiderBin) --Remove also acts as a pop. This removes the last entry, but there is only ever 1.
	local LocalSpider = SpiderBin[Caster:GetPlayerID()]
	if LocalSpider ~= nil then
		if LocalSpider:IsNull() == false then
			LocalSpider:ForceKill(true)
		end
	end
end

function Update(keys)

	local Caster = keys.caster
	local hpperc = keys.hpperc / 100
	--print("Hp perc is " .. hpperc)
	local regenperc = keys.regenperc / 100
	local armorperc = keys.armorperc / 100
	local damageperc = keys.damageperc / 100
	local magicarmorperc = keys.magicarmorperc / 100
	local moveperc = keys.moveperc / 100
	local find = keys.caster:FindAbilityByName("customability_beastally"):GetLevel()
	ally = SpiderBin[Caster:GetPlayerID()]
	
	if ally ~= nil and ally:IsNull() == false then
		--ally:SetBaseMaxHealth(Caster:GetMaxHealth() * hpperc)
		ally:SetBaseDamageMax(Caster:GetBaseDamageMax() * damageperc)
		ally:SetBaseDamageMin(Caster:GetBaseDamageMin() * damageperc)
		ally:SetBaseHealthRegen(Caster:GetHealthRegen() * regenperc)
		ally:SetPhysicalArmorBaseValue(Caster:GetPhysicalArmorBaseValue() * armorperc + 4)
		ally:SetBaseMagicalResistanceValue(Caster:GetMagicalArmorValue() * magicarmorperc + 4)
		ally:SetBaseMoveSpeed(Caster:GetBaseMoveSpeed() * moveperc)
		
		if find == 1 then
			ally:SetModelScale(.4)
		elseif find == 2 then
			ally:SetModelScale(.45)
		elseif find == 3 then
			ally:SetModelScale(.5)
		elseif find == 4 then
			ally:SetModelScale(.55)
		end
	end
	
end