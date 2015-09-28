function Dialogue_TravellingMerchant1()
	GameRules:SendCustomMessage("<font color='#37FF00'>Travelling Merchant:</font> Did you just come from the old graveyard?", 0, 0)
end

_tmd2bool = 0	--Travelling Merchant Dialogue 2 bool - check if function has been called before
function Dialogue_TravellingMerchant2()
	GameRules:SendCustomMessage("<font color='#37FF00'>Travelling Merchant:</font> Uhh... Hello? You speak at all?", 0, 0)
	_tmd2bool = 1
end

function Dialogue_TravellingMerchant3()
	if _tmd2bool == 1 then
		GameRules:SendCustomMessage("<font color='#37FF00'>Travelling Merchant:</font> Uhh... Hello? You speak at all?", 0, 0)
	end
end