POPUP_SYMBOL_PRE_PLUS = 0
POPUP_SYMBOL_PRE_MINUS = 1
POPUP_SYMBOL_PRE_SADFACE = 2
POPUP_SYMBOL_PRE_BROKENARROW = 3
POPUP_SYMBOL_PRE_SHADES = 4
POPUP_SYMBOL_PRE_MISS = 5
POPUP_SYMBOL_PRE_EVADE = 6
POPUP_SYMBOL_PRE_DENY = 7
POPUP_SYMBOL_PRE_ARROW = 8

POPUP_SYMBOL_POST_EXCLAMATION = 0
POPUP_SYMBOL_POST_POINTZERO = 1
POPUP_SYMBOL_POST_MEDAL = 2
POPUP_SYMBOL_POST_DROP = 3
POPUP_SYMBOL_POST_LIGHTNING = 4
POPUP_SYMBOL_POST_SKULL = 5
POPUP_SYMBOL_POST_EYE = 6
POPUP_SYMBOL_POST_SHIELD = 7
POPUP_SYMBOL_POST_POINTFIVE = 8

function ShockDamage(keys)
	local Target = keys.target
	local dmg = round(keys.damage)
	PopupNumbers(Target, "damage", Vector(37, 150, 241), 3, dmg, 1, 4)	--Magic damage
end

function ShockDamageManual(target, amount)
	local Target = target
	local dmg = round(amount)
	PopupNumbers(Target, "damage", Vector(37, 150, 241), 3, dmg, 1, 4)	--Magic damage
end

function WindDamage(keys)
    local Target = keys.target
    local dmg = round(keys.damage)
    PopupNumbers(Target, "damage", Vector(179, 255, 255), 3, dmg, 1, 4)  --Magic damage
end

function WindDamageManual(target, amount)
    local Target = target
    local dmg = round(amount)
    PopupNumbers(Target, "damage", Vector(179, 255, 255), 3, dmg, 1, 4)  --Magic damage
end

function WaterDamage(keys)
    local Target = keys.target
    local dmg = round(keys.damage)
    PopupNumbers(Target, "damage", Vector(0, 0, 204), 3, dmg, 1, 4)  --Magic damage
end

function WaterDamageManual(target, amount)
    local Target = target
    local dmg = round(amount)
    PopupNumbers(Target, "damage", Vector(0, 0, 204), 3, dmg, 1, 4)  --Magic damage
end

function ArcaneDamage(keys)
	local Target = keys.target
	local dmg = round(keys.damage)
	PopupNumbers(Target, "damage", Vector(22, 231, 225), 3, dmg, 1, 4)	--Magic damage
end

function ArcaneDamageManual(target, amount)
	local Target = target
	local dmg = round(amount)
	PopupNumbers(Target, "damage", Vector(22, 231, 225), 3, dmg, 1, 4)	--Magic damage
end

function FireDamage(keys)
	local dmg = round(keys.damage)
	local Target = keys.target
	PopupNumbers(Target, "damage", Vector(255, 81, 0), 3, dmg, 1, 4)	--Magic damage
end

function FireDamageManual(target, amount)
	local dmg = round(amount)
	local Target = target
	PopupNumbers(Target, "damage", Vector(255, 81, 0), 3, dmg, 1, 4)	--Magic damage
end

-- e.g. when healed by an ability
function HealNumbers(target, amount)
    PopupNumbers(target, "heal", Vector(0, 255, 0), 3.0, round(amount), 0, nil)
end

-- e.g. when given mana by an ability
function ManaNumbers(target, amount)
    PopupNumbers(target, "heal", Vector(0, 150, 200), 3.0, round(amount), 0, nil)
end

-- e.g. when taking damage over time from a poison type spell
function PoisonDamage(keys)
	local dmg = round(keys.damage)
	local Target = keys.target
	PopupNumbers(Target, "poison", Vector(215, 50, 248), 3.0, dmg, 1, 5)
end

function PoisonDamageManual(target, amount)
	local dmg = round(amount)
	local Target = target
	PopupNumbers(Target, "poison", Vector(215, 50, 248), 3.0, dmg, 1, 5)
end

-- e.g. the popup you get when you suddenly take a large portion of your health pool in damage at once
function PhysicalDamage(keys)
	local Target = keys.target
	local dmg = round(keys.damage)
    PopupNumbers(Target, "damage", Vector(255, 0, 0), 3.0, dmg, 1, 3)
end

function PhysicalDamageManual(target, amount)
	local dmg = round(amount)
	local Target = target
    PopupNumbers(Target, "damage", Vector(255, 0, 0), 3.0, dmg, 1, 3)
end

-- e.g. when dealing critical damage
function CriticalDamage(target, amount)
    PopupNumbers(target, "crit", Vector(255, 0, 0), 3.0, round(amount), 1, 0)
end

-- Customizable version.
function PopupNumbers(target, pfx, color, lifetime, number, presymbol, postsymbol, teamNumber)
    local pfxPath = string.format("particles/msg_fx/msg_%s.vpcf", pfx)

    -- msg_gold is dumb and will show '+0' as '++' instead.
    if not number or number == 0 then return end

    -- bounty particles only show to one team, generally on top of the unit that was just killed
    local pidx
    if pfx == "gold" then
        if not teamNumber then teamNumber = target:GetTeamNumber() end -- Use the targets team if no teamNumber parameter was specified
        pidx = ParticleManager:CreateParticleForTeam(pfxPath, PATTACH_CUSTOMORIGIN, target, teamNumber)
        ParticleManager:SetParticleControl(pidx, 0, target:GetAbsOrigin())
    else
        pidx = ParticleManager:CreateParticle(pfxPath, PATTACH_ABSORIGIN_FOLLOW, target)
    end

    local digits = 0
    if number ~= nil then
        digits = #tostring(number)
    end
    if presymbol ~= nil then
        digits = digits + 1
    end
    if postsymbol ~= nil then
        digits = digits + 1
    end

    ParticleManager:SetParticleControl(pidx, 1, Vector(tonumber(presymbol), tonumber(number), tonumber(postsymbol)))
    ParticleManager:SetParticleControl(pidx, 2, Vector(lifetime, digits, 0))
    ParticleManager:SetParticleControl(pidx, 3, color)
end

function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end