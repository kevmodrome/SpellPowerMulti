-- Basic Options and setup
class = "warlock" -- Change between "warlock", "sp", "frost", "fire"
positionX = 0 -- Change X position of window
positionY = -100 -- Change Y position of window

function checkDebuffs()
  -- Reset debuffs
  spellPowerMulti.cos:SetTextColor(1, 0, 0, 1)
  spellPowerMulti.sb:SetTextColor(1, 0, 0, 1)
  spellPowerMulti.nf:SetTextColor(1, 0, 0, 1)
  spellPowerMulti.sw:SetTextColor(1, 0, 0, 1)
  spellPowerMulti.baseText:SetText(base .. multiplier)
  spellPowerMulti:SetBackdropColor(0, 0, 0, 0.5)
  SWStacks = 0
  multiplier = 1

  for i=1,16 do local name, stack = UnitDebuff("target", i)
    if name == "Interface\\Icons\\Spell_Shadow_CurseOfAchimonde" then -- Check if Curse of Shadows is on target
      spellPowerMulti.cos:SetTextColor(0, 1, 0, 1)
      multiplier = multiplier * 1.1
    end
    if name == "Interface\\Icons\\Spell_Shadow_ShadowBolt" then -- Check for ShadowVuln, currently using fear to spellPowerMulti
      spellPowerMulti.sb:SetTextColor(0, 1, 0, 1)
      multiplier = multiplier * 1.2
    end
    if name == "Interface\\Icons\\Spell_Holy_ElunesGrace" then -- Check if NightFall is on target
      spellPowerMulti.nf:SetTextColor(0, 1, 0, 1)
      multiplier = multiplier * 1.15
    end
    if name == "Interface\\Icons\\Spell_Shadow_BlackPlague" then -- Check if Shadow Weave is on target and how many stacks
      SWStacks = stack
      if SWStacks < 5 then
        spellPowerMulti.sw:SetTextColor(1, 1, 0, 1)
      else
        spellPowerMulti.sw:SetTextColor(0, 1, 0, 1)
      end
      multiplier = multiplier * (1+0.03*SWStacks)
    end
  end
  multiplier = (multiplier * 100) - 100
  multiplier = math.floor(multiplier + 0.5)
  spellPowerMulti.baseText:SetText(base .. multiplier .."%")
  if multiplier > 100 then
    spellPowerMulti.SetBackdropColor(0, 1, 0, 1)
  end
end

local backdrop = {
  bgFile = "Interface\\Icons\\Spell_Shadow_CurseOfAchimonde",
}

base = "Damage added:    "
SWStacks = 0
multiplier = 0

-- Sets up basic frame stuff
spellPowerMulti = CreateFrame('Frame')
spellPowerMulti:SetFrameStrata("BACKGROUND")
spellPowerMulti:SetPoint("CENTER", positionX, positionY)
spellPowerMulti:SetWidth(110)
spellPowerMulti:SetHeight(50)
spellPowerMulti:SetBackdrop(backdrop)
spellPowerMulti:SetBackdropColor(0, 0, 0, 0.5)

-- Makes frame draggable


-- "Damage Multiplier"
spellPowerMulti.baseText = spellPowerMulti:CreateFontString("basetext")
spellPowerMulti.baseText:SetPoint("CENTER", spellPowerMulti, 0, 10)
spellPowerMulti.baseText:SetWidth(spellPowerMulti:GetRight() - spellPowerMulti:GetLeft() - 10)
spellPowerMulti.baseText:SetFont("Interface\\Addons\\SpellPowerMulti\\Fonts\\arial.TTF", 11)
spellPowerMulti.baseText:SetText(base ..  multiplier .. "%")

-- CoS
spellPowerMulti.cos = spellPowerMulti:CreateFontString("cos")
spellPowerMulti.cos:SetPoint("CENTER", spellPowerMulti, "CENTER", -30, -10)
spellPowerMulti.cos:SetWidth(spellPowerMulti:GetRight() - spellPowerMulti:GetLeft() - 10)
spellPowerMulti.cos:SetFont("Interface\\Addons\\spellPowerMulti\\Fonts\\arial.TTF", 9)
spellPowerMulti.cos:SetText("CoS")
spellPowerMulti.cos:SetTextColor(1, 0, 0, 1)

-- Shadow Vuln. "SB"
spellPowerMulti.sb = spellPowerMulti:CreateFontString("sb")
spellPowerMulti.sb:SetPoint("CENTER", spellPowerMulti, "CENTER", -10, -10)
spellPowerMulti.sb:SetWidth(spellPowerMulti:GetRight() - spellPowerMulti:GetLeft() - 10)
spellPowerMulti.sb:SetFont("Interface\\Addons\\spellPowerMulti\\Fonts\\arial.TTF", 9)
spellPowerMulti.sb:SetText("SB")
spellPowerMulti.sb:SetTextColor(1, 0, 0, 1)

-- NightFall
spellPowerMulti.nf = spellPowerMulti:CreateFontString("NF")
spellPowerMulti.nf:SetPoint("CENTER", spellPowerMulti, "CENTER", 10, -10)
spellPowerMulti.nf:SetWidth(spellPowerMulti:GetRight() - spellPowerMulti:GetLeft() - 10)
spellPowerMulti.nf:SetFont("Interface\\Addons\\spellPowerMulti\\Fonts\\arial.TTF", 9)
spellPowerMulti.nf:SetText("NF")
spellPowerMulti.nf:SetTextColor(1, 0, 0, 1)

-- Shadow Weaving "SW (X)"
spellPowerMulti.sw = spellPowerMulti:CreateFontString("sw")
spellPowerMulti.sw:SetPoint("CENTER", spellPowerMulti, "CENTER", 30, -10)
spellPowerMulti.sw:SetWidth(spellPowerMulti:GetRight() - spellPowerMulti:GetLeft() - 10)
spellPowerMulti.sw:SetFont("Interface\\Addons\\spellPowerMulti\\Fonts\\arial.TTF", 9)
spellPowerMulti.sw:SetText("SW")
spellPowerMulti.sw:SetTextColor(1, 0, 0, 1)


spellPowerMulti:SetScript('OnEvent', checkDebuffs)
spellPowerMulti:RegisterEvent('UNIT_AURA')
spellPowerMulti:RegisterEvent('PLAYER_TARGET_CHANGED')

--  TODO
-- Clean up and fix everything
-- Add flashing Icons?

-- List of Things to check for

-- Warlocks: 1*1.2*1.1*1.15*1.15
-- Shadow Vuln: Spell_Shadow_ShadowBolt
-- CoS: Spell_Shadow_CurseOfAchimonde
-- Nightfall: Spell_Holy_ElunesGrace
-- Shadow Weaving (5 stacks):
--

-- Mages:
-- CoE:
-- Nightfall:
-- Winter's Chill (Frost) (5 stacks):
-- Improved Scorch (Fire) (5 stacks):
-- Ignite:
