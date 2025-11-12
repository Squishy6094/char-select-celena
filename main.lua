-- name: [CS] Character Select Template
-- description: Write mod description here!\n\nMade by: You!\n\n\\#ff7777\\This Pack requires Character Select\nto use as a Library!

--[[
    API Documentation for Character Select can be found below:
    https://github.com/Squishy6094/character-select-coop/wiki/API-Documentation

    Use this if you're curious on how anything here works >v<
]]

-- Replace Mod Name with your Character/Pack name.
local TEXT_MOD_NAME = "Celena"

-- Stops mod from loading if Character Select isn't on, Does not need to be touched
if not _G.charSelectExists then
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod\nand Restart the Room!", 6)
    return 0
end

--[[
    Everything from here down is character data, and is loaded at the end of the file

    Note that most things here are noted out via use of '--', if there is any
    functionality you'd want to use then remove the '--' in front of the functions.

    If needbe, Replace CHAR in the tables with your character's name
    Ex: E_MODEL_CHAR -> E_MODEL_SQUISHY

    Ensure all file naming is unique from other mods.
    Prefixing your files with your character's name should work fine
    Ex: life-icon.png -> squis
]]

local E_MODEL_CHAR =      smlua_model_util_get_id("celena_geo")      -- Located in "actors"
-- local E_MODEL_CHAR_STAR = smlua_model_util_get_id("custom_model_star_geo") -- Located in "actors"

local TEX_CHAR_LIFE_ICON = get_texture_info("celena-icon") -- Located in "textures"
-- local TEX_CHAR_STAR_ICON = get_texture_info("exclamation-icon") -- Located in "textures"

-- All sound files are located in "sound" folder
-- Remember to include the file extention in the name
--[[
local VOICETABLE_CHAR = {
    [CHAR_SOUND_OKEY_DOKEY] =        'CharStartGame.ogg', -- Starting game
	[CHAR_SOUND_LETS_A_GO] =         'CharStartLevel.ogg', -- Starting level
	[CHAR_SOUND_GAME_OVER] =         'CharGameOver.ogg', -- Game Overed
	[CHAR_SOUND_PUNCH_YAH] =         'CharPunch1.ogg', -- Punch 1
	[CHAR_SOUND_PUNCH_WAH] =         'CharPunch2.ogg', -- Punch 2
	[CHAR_SOUND_PUNCH_HOO] =         'CharPunch3.ogg', -- Punch 3
	[CHAR_SOUND_YAH_WAH_HOO] =       {'CharJump1.ogg', 'CharJump2.ogg', 'CharJump3.ogg'}, -- First Jump Sounds
	[CHAR_SOUND_HOOHOO] =            'CharDoubleJump.ogg', -- Second jump sound
	[CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'CharTripleJump1.ogg', 'CharTripleJump2.ogg'}, -- Triple jump sounds
	[CHAR_SOUND_UH] =                'CharBonk.ogg', -- Soft wall bonk
	[CHAR_SOUND_UH2] =               'CharLedgeGetUp.ogg', -- Quick ledge get up
	[CHAR_SOUND_UH2_2] =             'CharLongJumpLand.ogg', -- Landing after long jump
	[CHAR_SOUND_DOH] =               'CharBonk.ogg', -- Hard wall bonk
	[CHAR_SOUND_OOOF] =              'CharBonk.ogg', -- Attacked in air
	[CHAR_SOUND_OOOF2] =             'CharBonk.ogg', -- Land from hard bonk
	[CHAR_SOUND_HAHA] =              'CharTripleJumpLand.ogg', -- Landing triple jump
	[CHAR_SOUND_HAHA_2] =            'CharWaterLanding.ogg', -- Landing in water from big fall
	[CHAR_SOUND_YAHOO] =             'CharLongJump.ogg', -- Long jump
	[CHAR_SOUND_DOH] =               'CharBonk.ogg', -- Long jump wall bonk
	[CHAR_SOUND_WHOA] =              'CharGrabLedge.ogg', -- Grabbing ledge
	[CHAR_SOUND_EEUH] =              'CharClimbLedge.ogg', -- Climbing over ledge
	[CHAR_SOUND_WAAAOOOW] =          'CharFalling.ogg', -- Falling a long distance
	[CHAR_SOUND_TWIRL_BOUNCE] =      'CharFlowerBounce.ogg', -- Bouncing off of a flower spring
	[CHAR_SOUND_GROUND_POUND_WAH] =  'CharGroundPound.ogg', -- Ground Pound after startup
	[CHAR_SOUND_WAH2] =              'CharThrow.ogg', -- Throwing something
	[CHAR_SOUND_HRMM] =              'CharLift.ogg', -- Lifting something
	[CHAR_SOUND_HERE_WE_GO] =        'CharGetStar.ogg', -- Star get
	[CHAR_SOUND_SO_LONGA_BOWSER] =   'CharThrowBowser.ogg', -- Throwing Bowser
--DAMAGE
	[CHAR_SOUND_ATTACKED] =          'CharDamaged.ogg', -- Damaged
	[CHAR_SOUND_PANTING] =           'CharPanting.ogg', -- Low health
	[CHAR_SOUND_PANTING_COLD] =      'CharPanting.ogg', -- Getting cold
	[CHAR_SOUND_ON_FIRE] =           'CharBurned.ogg', -- Burned
--SLEEP SOUNDS
	[CHAR_SOUND_IMA_TIRED] =         'CharTired.ogg', -- Mario feeling tired
	[CHAR_SOUND_YAWNING] =           'CharYawn.ogg', -- Mario yawning before he sits down to sleep
	[CHAR_SOUND_SNORING1] =          'CharSnore.ogg', -- Snore Inhale
	[CHAR_SOUND_SNORING2] =          'CharExhale.ogg', -- Exhale
	[CHAR_SOUND_SNORING3] =          'CharSleepTalk.ogg', -- Sleep talking / mumbling
--COUGHING (USED IN THE GAS MAZE)
	[CHAR_SOUND_COUGHING1] =         'CharCough1.ogg', -- Cough take 1
	[CHAR_SOUND_COUGHING2] =         'CharCough2.ogg', -- Cough take 2
	[CHAR_SOUND_COUGHING3] =         'CharCough3.ogg', -- Cough take 3
--DEATH
	[CHAR_SOUND_DYING] =             'CharDying.ogg', -- Dying from damage
	[CHAR_SOUND_DROWNING] =          'CharDrowning.ogg', -- Running out of air underwater
	[CHAR_SOUND_MAMA_MIA] =          'CharLeaveLevel.ogg' -- Booted out of level
}
]]

-- All Located in "actors" folder
-- (Models do not exist in template)
--[[
local CAPTABLE_CHAR = {
    normal = smlua_model_util_get_id("FILENAME_geo"),
    wing = smlua_model_util_get_id("FILENAME_geo"),
    metal = smlua_model_util_get_id("FILENAME_geo"),
}
]]

local PALETTE_CHAR = {
    [PANTS]  = "ffffff",
    [SHIRT]  = "ffffff",
    [GLOVES] = "ffffff",
    [SHOES]  = "ffffff",
    [HAIR]   = "ffffff",
    [SKIN]   = "ffffff",
    [CAP]    = "ffffff",
	[EMBLEM] = "ffffff"
}

-- All Located in "textures" folder
-- (Textures do not exist in template)
--[[
local HEALTH_METER_CHAR = {
    label = {
        left = get_texture_info("healthleft"),
        right = get_texture_info("healthright"),
    },
    pie = {
        [1] = get_texture_info("Pie1"),
        [2] = get_texture_info("Pie2"),
        [3] = get_texture_info("Pie3"),
        [4] = get_texture_info("Pie4"),
        [5] = get_texture_info("Pie5"),
        [6] = get_texture_info("Pie6"),
        [7] = get_texture_info("Pie7"),
        [8] = get_texture_info("Pie8"),
    }
}
]]

local rainbowColor = { r = 255, g = 0, b = 0 }
-- Adds the custom character to the Character Select Menu
CT_CELENA = _G.charSelect.character_add("Celena", "Character Select Lady!!!", "Wall_E20", rainbowColor, E_MODEL_FISH, CT_MARIO, "C", 1)

_G.charSelect.character_add_palette_preset(E_MODEL_CHAR, PALETTE_CHAR)

-- Adds credits to the credits menu
_G.charSelect.credit_add(TEXT_MOD_NAME, "Squishy 6094", "Programming")
_G.charSelect.credit_add(TEXT_MOD_NAME, "Wall_E20", "Design / Model")
_G.charSelect.credit_add(TEXT_MOD_NAME, "Shell", "Textures")

CSloaded = true

local rainbowState = 0
local function update_rainbow_color()
    local speed = 2
    if rainbowState == 0 then
        rainbowColor.r = rainbowColor.r + speed
        if rainbowColor.r >= 255 then rainbowState = 1 end
    elseif rainbowState == 1 then
        rainbowColor.b = rainbowColor.b - speed
        if rainbowColor.b <= 0 then rainbowState = 2 end
    elseif rainbowState == 2 then
        rainbowColor.g = rainbowColor.g + speed
        if rainbowColor.g >= 255 then rainbowState = 3 end
    elseif rainbowState == 3 then
        rainbowColor.r = rainbowColor.r - speed
        if rainbowColor.r <= 0 then rainbowState = 4 end
    elseif rainbowState == 4 then
        rainbowColor.b = rainbowColor.b + speed
        if rainbowColor.b >= 255 then rainbowState = 5 end
    elseif rainbowState == 5 then
        rainbowColor.g = rainbowColor.g - speed
        if rainbowColor.g <= 0 then rainbowState = 0 end
    end
    rainbowColor.r = math.clamp(rainbowColor.r, 0, 255)
    rainbowColor.g = math.clamp(rainbowColor.g, 0, 255)
    rainbowColor.b = math.clamp(rainbowColor.b, 0, 255)
    return rainbowColor
end

local function menu_render()
    -- Update Celena's Menu Color to be RGB
    _G.charSelect.character_edit(CT_CELENA, nil, nil, nil, update_rainbow_color())
end

_G.charSelect.hook_render_in_menu(menu_render, false)
_G.charSelect.config_character_sounds()
