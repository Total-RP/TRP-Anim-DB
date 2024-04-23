----------------------------------------------------------------------------------
-- Total RP 3: Dialogues animations
-- ---------------------------------------------------------------------------
-- Copyright 2015 Sylvain Cossement (telkostrasz@totalrp3.info)
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
-- http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
----------------------------------------------------------------------------------

local MAJOR, MINOR = "TRP-Dialog-Scaling-DB", 2

local Lib = LibStub:NewLibrary(MAJOR, MINOR)

if not Lib then return end

--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
-- Model scaling
-- Give the scaling between two models
--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

local CHAR_TO_ID = {
    -- Alliance
	HUMAN = {
		FEMALE = "1000764",
		MALE = "1011653",
	},
	NIGHT_ELF = {
		FEMALE = "921844",
		MALE = "974343",
	},
	DWARF = {
		FEMALE = "950080",
		MALE = "878772",
	},
	GNOME = {
		FEMALE = "940356",
		MALE = "900914",
	},
	DRAENEI = {
		FEMALE = "1022598",
		MALE = "1005887",
	},
	WORGEN = {
		FEMALE = "307453",
		MALE = "307454",
	},
    VOIDELF = {
        FEMALE = "1733758",
        MALE = "1734034",
    },
    LIGHTFORGED = {
        FEMALE = "1593999",
        MALE = "1620605",
    },
    KULTIRAN = {
        FEMALE = "1886724",
        MALE = "1721003",
    },
    DARKIRON = {
        FEMALE = "1890763",
        MALE = "1890765",
    },
    MECHAGNOME = {
        FEMALE = "2564806",
        MALE = "2622502",
    },
    -- Horde
	ORC = {
		FEMALE = "949470",
		MALE = "917116",
        MALE_UPRIGHT = "1968587",
	},
	GOBLIN = {
		FEMALE = "119369",
		MALE = "119376",
	},
	BLOOD_ELF = {
		FEMALE = "1100258",
		MALE = "1100087",
	},
	TAUREN = {
		FEMALE = "986648",
		MALE = "968705",
	},
	TROLL = {
		FEMALE = "1018060",
		MALE = "1022938",
	},
	UNDEAD = {
		FEMALE = "997378",
		MALE = "959310",
	},
    HIGHMOUNTAIN = {
        FEMALE = "1630402",
        MALE = "1630218",
    },
    NIGHTBORNE = {
        FEMALE = "1810676",
        MALE = "1814471",
    },
    ZANDALARI = {
        FEMALE = "1662187",
        MALE = "1630447",
    },
    -- Maghar is just orc
    VULPERA = {
        FEMALE = "1890759",
        MALE = "1890761",
    },
    -- Neutral
    PANDAREN = {
        FEMALE = "589715",
        MALE = "535052",
    },
	DRACTHYR = {
		FEMALE = "4220448",
		MALE = "4395382",
		DRAGON = "4207724",
	},
	EARTHEN = {
		FEMALE = "5548259",
		MALE = "5548261",
	}
}

-- Allied races scale matches
local CHAR_TO_CHAR = {
    [CHAR_TO_ID.VOIDELF.MALE] = CHAR_TO_ID.BLOOD_ELF.MALE,
    [CHAR_TO_ID.VOIDELF.FEMALE] = CHAR_TO_ID.BLOOD_ELF.FEMALE,

    [CHAR_TO_ID.LIGHTFORGED.MALE] = CHAR_TO_ID.DRAENEI.MALE,
    [CHAR_TO_ID.LIGHTFORGED.FEMALE] = CHAR_TO_ID.DRAENEI.FEMALE,

    [CHAR_TO_ID.DARKIRON.MALE] = CHAR_TO_ID.DWARF.MALE,
    [CHAR_TO_ID.DARKIRON.FEMALE] = CHAR_TO_ID.DWARF.FEMALE,

    [CHAR_TO_ID.MECHAGNOME.MALE] = CHAR_TO_ID.GNOME.MALE,
    [CHAR_TO_ID.MECHAGNOME.FEMALE] = CHAR_TO_ID.GNOME.FEMALE,

    [CHAR_TO_ID.HIGHMOUNTAIN.MALE] = CHAR_TO_ID.TAUREN.MALE,
    [CHAR_TO_ID.HIGHMOUNTAIN.FEMALE] = CHAR_TO_ID.TAUREN.FEMALE,

    [CHAR_TO_ID.NIGHTBORNE.MALE] = CHAR_TO_ID.NIGHT_ELF.MALE,
    [CHAR_TO_ID.NIGHTBORNE.FEMALE] = CHAR_TO_ID.NIGHT_ELF.FEMALE,

    [CHAR_TO_ID.VULPERA.MALE] = CHAR_TO_ID.GOBLIN.MALE,
    [CHAR_TO_ID.VULPERA.FEMALE] = CHAR_TO_ID.GOBLIN.FEMALE,

    [CHAR_TO_ID.DRACTHYR.MALE] = CHAR_TO_ID.BLOOD_ELF.MALE,
    [CHAR_TO_ID.DRACTHYR.FEMALE] = CHAR_TO_ID.HUMAN.FEMALE,
}

local DEFAULT_PROPERTIES = {
	scale = 1.45,
	feet = 0.4,
	offset = 0.215,
	facing = 0.75
};

Lib.DEFAULT_PROPERTIES = DEFAULT_PROPERTIES;

local SCALE_MAPPING = {

	-- NIGHT ELF FEMALE

	[CHAR_TO_ID.NIGHT_ELF.FEMALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.MALE] = {
		1.56, -- [1]
		1.41, -- [2]
	},

	-- NIGHT ELF FEMALE

	[CHAR_TO_ID.NIGHT_ELF.MALE .. "~" .. CHAR_TO_ID.DWARF.MALE] = {
		1.38, -- [1]
		2.03, -- [2]
	},

	-- ORC FEMALE

	[CHAR_TO_ID.ORC.FEMALE .. "~" .. CHAR_TO_ID.TROLL.FEMALE] = {
		1.56, -- [1]
		1.42, -- [2]
	},
	[CHAR_TO_ID.ORC.FEMALE .. "~" .. CHAR_TO_ID.TROLL.MALE] = {
		1.63, -- [1]
		1.45, -- [2]
	},
	[CHAR_TO_ID.ORC.FEMALE .. "~" .. CHAR_TO_ID.ORC.MALE] = {
		1.54, -- [1]
		1.45, -- [2]
	},
	[CHAR_TO_ID.ORC.FEMALE .. "~" .. CHAR_TO_ID.PANDAREN.MALE] = {
		1.52, -- [1]
		1.2, -- [2]
	},

	-- BLOOD ELF FEMALE
	[CHAR_TO_ID.BLOOD_ELF.FEMALE .. "~" .. CHAR_TO_ID.PANDAREN.FEMALE] = {
		1.53, -- [1]
		1.39, -- [2]
	},
	[CHAR_TO_ID.BLOOD_ELF.FEMALE .. "~" .. CHAR_TO_ID.BLOOD_ELF.MALE] = {
		1.5, -- [1]
		1.33, -- [2]
	},
	[CHAR_TO_ID.BLOOD_ELF.FEMALE .. "~" .. CHAR_TO_ID.TROLL.FEMALE] = {
		1.55, -- [1]
		1.25, -- [2]
	},
	[CHAR_TO_ID.BLOOD_ELF.FEMALE .. "~" .. CHAR_TO_ID.TAUREN.MALE] = {
		1.79, -- [1]
		1.05, -- [2]
	},

	-- DWARF FEMALE
	[CHAR_TO_ID.DWARF.FEMALE .. "~" .. CHAR_TO_ID.GNOME.FEMALE] = {
		1.299, -- [1]
		1.799, -- [2]
	},
	[CHAR_TO_ID.DWARF.FEMALE .. "~" .. CHAR_TO_ID.WORGEN.MALE] = {
		1.639, -- [1]
		1.299, -- [2]
	},
	[CHAR_TO_ID.DWARF.FEMALE .. "~" .. CHAR_TO_ID.DWARF.MALE] = {
		1.299, -- [1]
		1.179, -- [2]
	},
	[CHAR_TO_ID.DWARF.FEMALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.MALE] = {
		1.709, -- [1]
		1.23, -- [2]
	},
	[CHAR_TO_ID.DWARF.FEMALE .. "~" .. CHAR_TO_ID.TAUREN.MALE] = {
		2, -- [1]
		1.029, -- [2]
	},
	[CHAR_TO_ID.DWARF.FEMALE .. "~" .. CHAR_TO_ID.PANDAREN.MALE] = {
		1.769, -- [1]
		1.299, -- [2]
	},

	-- GNOME MALE
	[CHAR_TO_ID.GNOME.MALE .. "~" .. CHAR_TO_ID.HUMAN.MALE] = {
		2.06, -- [1]
		1.3, -- [2]
	},
	[CHAR_TO_ID.GNOME.MALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.MALE] = {
		2.389, -- [1]
		1.26, -- [2]
	},
	[CHAR_TO_ID.GNOME.MALE .. "~" .. CHAR_TO_ID.DWARF.MALE] = {
		1.58, -- [1]
		1.08, -- [2]
	},
	[CHAR_TO_ID.GNOME.MALE .. "~" .. CHAR_TO_ID.WORGEN.MALE] = {
		2.5, -- [1]
		1.3, -- [2]
	},
	[CHAR_TO_ID.GNOME.MALE .. "~" .. CHAR_TO_ID.PANDAREN.MALE] = {
		2.599, -- [1]
		1.12, -- [2]
	},
	[CHAR_TO_ID.GNOME.MALE .. "~" .. CHAR_TO_ID.DWARF.FEMALE] = {
		1.6, -- [1]
		1.21, -- [2]
	},
	[CHAR_TO_ID.GNOME.MALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.FEMALE] = {
		2.5199, -- [1]
		1.35, -- [2]
	},
	[CHAR_TO_ID.GNOME.MALE .. "~" .. CHAR_TO_ID.PANDAREN.FEMALE] = {
		2.24, -- [1]
		1.37, -- [2]
	},

	-- WORGEN MALE
	[CHAR_TO_ID.WORGEN.MALE .. "~" .. CHAR_TO_ID.DWARF.MALE] = {
		1.41, -- [1]
		1.78
	},
	[CHAR_TO_ID.WORGEN.MALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.MALE] = {
		1.45, -- [1]
		1.35, -- [2]
	},
	[CHAR_TO_ID.WORGEN.MALE .. "~" .. CHAR_TO_ID.HUMAN.FEMALE] = {
		1.39, -- [1]
		1.62, -- [2]
	},
	[CHAR_TO_ID.WORGEN.MALE .. "~" .. CHAR_TO_ID.HUMAN.MALE] = {
		1.52, -- [1]
		1.56, -- [2]
	},
	[CHAR_TO_ID.WORGEN.MALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.FEMALE] = {
		1.45, -- [1]
		1.45, -- [2]
	},
	[CHAR_TO_ID.WORGEN.MALE .. "~" .. CHAR_TO_ID.GNOME.FEMALE] = {
		1.41, -- [1]
		2.72, -- [2]
	},
	[CHAR_TO_ID.WORGEN.MALE .. "~" .. CHAR_TO_ID.PANDAREN.MALE] = {
		1.45, -- [1]
		1.35, -- [2]
	},
	[CHAR_TO_ID.WORGEN.MALE .. "~" .. CHAR_TO_ID.PANDAREN.FEMALE] = {
		1.45, -- [1]
		1.63, -- [2]
	},

	-- WORGEN FEMALE
	[CHAR_TO_ID.WORGEN.FEMALE .. "~" .. CHAR_TO_ID.HUMAN.MALE] = {
		1.49, -- [1]
		1.61, -- [2]
	},
	[CHAR_TO_ID.WORGEN.FEMALE .. "~" .. CHAR_TO_ID.HUMAN.FEMALE] = {
		1.42, -- [1]
		1.67, -- [2]
	},
	[CHAR_TO_ID.WORGEN.FEMALE .. "~" .. CHAR_TO_ID.WORGEN.MALE] = {
		1.53, -- [1]
		1.49, -- [2]
	},
	[CHAR_TO_ID.WORGEN.FEMALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.FEMALE] = {
		1.45, -- [1]
		1.45, -- [2]
	},

	-- DRAENEI MALE
	[CHAR_TO_ID.DRAENEI.MALE .. "~" .. CHAR_TO_ID.ORC.FEMALE] = {
		1.42, -- [1]
		1.68, -- [2]
	},
	[CHAR_TO_ID.DRAENEI.MALE .. "~" .. CHAR_TO_ID.DRAENEI.FEMALE] = {
		1.43, -- [1]
		1.48, -- [2]
	},
	[CHAR_TO_ID.DRAENEI.MALE .. "~" .. CHAR_TO_ID.WORGEN.MALE] = {
		1.45, -- [1]
		1.65, -- [2]
	},
	[CHAR_TO_ID.DRAENEI.MALE .. "~" .. CHAR_TO_ID.GNOME.FEMALE] = {
		1.44, -- [1]
		2.7599, -- [2]
	},
	[CHAR_TO_ID.DRAENEI.MALE .. "~" .. CHAR_TO_ID.GNOME.MALE] = {
		1.45,
		2.43,
	},
	[CHAR_TO_ID.DRAENEI.MALE .. "~" .. CHAR_TO_ID.DWARF.MALE] = {
		1.45,
		2.04,
	},
	[CHAR_TO_ID.DRAENEI.MALE .. "~" .. CHAR_TO_ID.DWARF.FEMALE] = {
		1.45,
		2.02,
	},
	[CHAR_TO_ID.DRAENEI.MALE .. "~" .. CHAR_TO_ID.PANDAREN.FEMALE] = {
		1.45,
		1.7,
	},
	[CHAR_TO_ID.DRAENEI.MALE .. "~1284603"] = { -- Odyn
		4,
		1.31,
	},
	[CHAR_TO_ID.DRAENEI.MALE .. "~1286521"] = {
		1.9,
		1.31,
	},

	-- DRAENEI FEMALE
	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.DWARF.FEMALE] = {
		1.27, -- [1]
		1.83, -- [2]
	},
	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.DWARF.MALE] = {
		1.32, -- [1]
		2.01, -- [2]
	},
	[CHAR_TO_ID.DRAENEI.FEMALE .. "~~" .. CHAR_TO_ID.BLOOD_ELF.FEMALE] = {
		1.36, -- [1]
		1.63, -- [2]
	},
	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.FEMALE] = {
		1.39, -- [1]
		1.54, -- [2]
	},
	[CHAR_TO_ID.DRAENEI.FEMALE .. "~~" .. CHAR_TO_ID.UNDEAD.MALE] = {
		1.37, -- [1]
		1.66, -- [2]
	},
	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.MALE] = {
		1.46, -- [1]
		1.41, -- [2]
	},
	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.GNOME.MALE] = {
		1.36, -- [1]
		2.66, -- [2]
	},
	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.PANDAREN.FEMALE] = {
		1.4, -- [1]
		1.61, -- [2]
	},
	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.PANDAREN.MALE] = {
		1.45, -- [1]
		1.39, -- [2]
	},
	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.WORGEN.MALE] = {
		1.45, -- [1]
		1.57, -- [2]
	},
	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.GNOME.FEMALE] = {
		1.44, -- [1]
		2.5599, -- [2]
	},
	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.ORC.FEMALE] = {
		1.38, -- [1]
		1.62, -- [2]
	},
	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.HUMAN.MALE] = {
		1.4, -- [1]
		1.64, -- [2]
	},
	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.WORGEN.FEMALE] = {
		1.38, -- [1]
		1.6, -- [2]
	},
	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.BLOOD_ELF.MALE] = {
		1.41, -- [1]
		1.57, -- [2]
	},
	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.ORC.MALE] = {
		1.41, -- [1]
		1.58, -- [2]
	},

	-- HUMAN MALE
	[CHAR_TO_ID.HUMAN.MALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.FEMALE] = {
		1.389, -- [1]
		1.299, -- [2]
	},
	[CHAR_TO_ID.HUMAN.MALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.MALE] = {
		1.59, -- [1]
		1.28, -- [2]
	},
	[CHAR_TO_ID.HUMAN.MALE .. "~" .. CHAR_TO_ID.DWARF.MALE] = {
		1.29, -- [1]
		1.55, -- [2]
	},
	[CHAR_TO_ID.HUMAN.MALE .. "~" .. CHAR_TO_ID.PANDAREN.FEMALE] = {
		1.399, -- [1]
		1.35, -- [2]
	},
	[CHAR_TO_ID.HUMAN.MALE .. "~" .. CHAR_TO_ID.DWARF.FEMALE] = {
		1.279, -- [1]
		1.599, -- [2]
	},
	[CHAR_TO_ID.HUMAN.MALE .. "~" .. CHAR_TO_ID.GNOME.FEMALE] = {
		1.29, -- [1]
		1.99, -- [2]
	},
	[CHAR_TO_ID.HUMAN.MALE .. "~" .. CHAR_TO_ID.ORC.MALE] = {
		1.289, -- [1]
		1.429, -- [2]
	},
	[CHAR_TO_ID.HUMAN.MALE .. "~" .. CHAR_TO_ID.GOBLIN.FEMALE] = {
		1.279, -- [1]
		1.959, -- [2]
	},
	[CHAR_TO_ID.HUMAN.MALE .. "~" .. CHAR_TO_ID.DRAENEI.MALE] = {
		1.65, -- [1]
		1.45
	},

	-- HUMAN FEMALE
	[CHAR_TO_ID.HUMAN.FEMALE .. "~" .. CHAR_TO_ID.DRAENEI.FEMALE] = {
		1.81, -- [1]
		1.31, -- [2]
	},
	[CHAR_TO_ID.HUMAN.FEMALE .. "~" .. CHAR_TO_ID.HUMAN.MALE] = {
		1.56, -- [1]
	},
	[CHAR_TO_ID.HUMAN.FEMALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.FEMALE] = {
		1.61, -- [1]
		1.32, -- [2]
	},
	[CHAR_TO_ID.HUMAN.FEMALE .. "~" .. CHAR_TO_ID.PANDAREN.FEMALE] = {
		1.58, -- [1]
		1.38, -- [2]
	},
	[CHAR_TO_ID.HUMAN.FEMALE .. "~" .. CHAR_TO_ID.DRAENEI.MALE] = {
		1.63, -- [1]
		1.27, -- [2]
	},
	[CHAR_TO_ID.HUMAN.FEMALE .. "~" .. CHAR_TO_ID.GOBLIN.MALE] = {
		1.4, -- [1]
		1.91, -- [2]
	},
	[CHAR_TO_ID.HUMAN.FEMALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.MALE] = {
		1.61, -- [1]
		1.27, -- [2]
	},
	[CHAR_TO_ID.HUMAN.FEMALE .. "~" .. CHAR_TO_ID.PANDAREN.MALE] = {
		1.58, -- [1]
		1.13, -- [2]
	},
	[CHAR_TO_ID.HUMAN.FEMALE .. "~" .. CHAR_TO_ID.DWARF.MALE] = {
		1.45, -- [1]
		1.63, -- [2]
	},
}

local PLACEMENT_PROPERTIES = {
	[CHAR_TO_ID.WORGEN.MALE] = {
		["offset"] = 0.165,
	},
	[CHAR_TO_ID.DWARF.MALE] = {
		["offset"] = 0.185,
        ["scale"] = 1.62,
	},
	[CHAR_TO_ID.DWARF.FEMALE] = {
		["offset"] = 0.255,
        ["scale"] = 1.59,
	},
	[CHAR_TO_ID.GNOME.MALE] = {
		["offset"] = 0.185,
		["scale"] = 2.66,
	},
	[CHAR_TO_ID.GNOME.FEMALE] = {
		["offset"] = 0.215,
		["scale"] = 2.66,
	},
	[CHAR_TO_ID.HUMAN.FEMALE] = {
		["offset"] = 0.235,
	},
	[CHAR_TO_ID.PANDAREN.MALE] = {
		["offset"] = 0.235,
	},
	[CHAR_TO_ID.PANDAREN.FEMALE] = {
		["offset"] = 0.265,
	},
	[CHAR_TO_ID.DRACTHYR.DRAGON] = {
		["feet"] = 0.43,
		["offset"] = 0.245,
	},
    [CHAR_TO_ID.GOBLIN.MALE] = {
        ["scale"] = 2.32,
    },
    [CHAR_TO_ID.GOBLIN.FEMALE] = {
        ["scale"] = 2.32,
    },
    [CHAR_TO_ID.ORC.MALE_UPRIGHT] = {
        ["scale"] = 1.21,
    },
	[CHAR_TO_ID.EARTHEN.MALE] = {
		["scale"] = 1.75,
	},
	[CHAR_TO_ID.EARTHEN.FEMALE] = {
		["scale"] = 1.66,
		["offset"] = 0.265,
	},



	-- NPCs
	["123455"] = { -- Draenei child female
		["scale"] = 2.82,
	},
	["124495"] = { -- Human child male
		["scale"] = 2.22,
		["feet"] = 0.42,
		["offset"] = 0.125,
	},
	["124456"] = { -- Human child female
		["scale"] = 2.89,
	},
	["126286"] = { -- Tuskarr
		["scale"] = 1.92,
		["offset"] = 0.105,
	},
	["971357"] = { -- Velen
		["scale"] = 0.87,
		["offset"] = 0.255,
	},
	["536149"] = { -- Tyrande
		["scale"] = 1.37,
	},
	["1249799"] = { -- Malfurion
		["scale"] = 0.94,
	},
	["646095"] = { -- Jaina
		["scale"] = 1.43,
		["offset"] = 0.285,
	},
	["977063"] = { -- Elementaire de truc
		["scale"] = 0.83,
	},
	["1281267"] = { -- Valkyr
		["scale"] = 1.01,
	},
	["1286521"] = { -- Valajar
		["scale"] = 1.31,
		["offset"] = 0.265,
	},
	["122815"] = { -- Vrykul
		["scale"] = 1.28,
		["offset"] = 0.295,
	},
	["1324256"] = { -- Druid panel
		["scale"] = 2.82,
		["offset"] = 0.095,
		["facing"] = -3.99,
	},

	--region Shadowlands
	["3307974"] = { -- Shadowlands Maw escape stone
		["scale"] = 10.15,
		["offset"] = 0.105,
	},
	["3527746"] = { -- Oribos floating people
		["scale"] = 1.56,
	},
	["3058051"] = { -- Oribos flaming head people
		["scale"] = 1.78,
	},
	["3023013"] = { -- Swolekin
		["scale"] = 1.66,
		["offset"] = 0.185,
	},
	["2974101"] = { -- Bastion memory bot ladies
		["scale"] = 0.98,
	},
	["3062169"] = { -- Kyrian dude
		["scale"] = 1.32,
	},
	["3065141"] = { -- Kyrian lady
		["scale"] = 1.3,
	},
	["2966413"] = { -- Winged Kyrian lady
		["scale"] = 1.29,
	},
	["3028313"] = { -- Winged Kyrian dude
		["scale"] = 1.23,
	},
	["3431647"] = { -- Kyrian leader
		["scale"] = 0.85,
		["feet"] = 0.0,
	},
	["3028315"] = { -- Shadow winged kyrian dude
		["scale"] = 1.25,
	},
	["3257514"] = { -- Night fae lady
		["scale"] = 1.31,
	},
	["3208389"] = { -- Night Fae centaur soldier
		["scale"] = 1.78,
	},
	["3208391"] = { -- Night Fae centaur soldier lady
		["scale"] = 1.81,
	},
	["3024835"] = { -- Night Fae small fae
		["scale"] = 2.75,
		["feet"] = 0.17,
		["offset"] = 0.205,
	},
	["3052707"] = { -- Night Fae creepy slender tree people
		["scale"] = 0.9,
	},
	["3071370"] = { -- Night Fae fox spirit (player)
		["scale"] = 6.45,
		["feet"] = 0.3,
		["offset"] = 0.285,
		["facing"] = -2.45,
	},
	["3670316"] = { -- Night Fae mushroom transporter
		["scale"] = 8.65,
		["feet"] = 0.35,
		["offset"] = 0.115,
	},
	["3522546"] = { -- Ardenweald pile of dirt
		["scale"] = 5.85,
		["offset"] = 0.105,
	},
	["3196372"] = { -- Maldraxxus multi headed flying beast
		["scale"] = 0.65,
		["offset"] = 0.195,
	},
	["3197237"] = { -- Maldraxxus big fleshy dude
		["scale"] = 1.15,
		["offset"] = 0.205,
	},
	["3284341"] = { -- Maldraxxus big beafy dude
		["scale"] = 0.85,
	},
	["3200265"] = { -- Maldraxxus big daddy
		["scale"] = 1.15,
	},
	["3396107"] = { -- Maldraxxus spider dudes
		["scale"] = 1,
		["offset"] = 0.255,
	},
	["3087468"] = { -- Maldraxxus mage skeleton
		["scale"] = 1.3,
	},
	["3482565"] = { -- Maldraxxus lich
		["scale"] = 1.25,
	},
	["3074845"] = { -- Maldraxxus abomination
		["scale"] = 1.08,
		["offset"] = 0.175,
	},
	["2834279"] = { -- Venthyr dude
		["scale"] = 1.79,
		["offset"] = 0.195,
	},
	["3049899"] = { -- Venthyr lady
		["scale"] = 2.05,
		["offset"] = 0.145,
	},
	["2921972"] = { -- Venthyr small helpers
		["scale"] = 1.91,
		["offset"] = 0.205,
	},
	["3054707"] = { -- Venthyr imp
		["scale"] = 3.12,
		["feet"] = 0.38,
		["offset"] = 0.235,
	},
	["3449671"] = { -- Winged Venthyr lady
		["scale"] = 1.05,
		["offset"] = 0.265,
	},
	["3492361"] = { -- Winged Venthyr dude
		["scale"] = 0.92,
		["offset"] = 0.335,
	},
	["2529386"] = { -- Venthyr winged general
		["scale"] = 0.91,
		["offset"] = 0.285,
	},
	["3387000"] = { -- Venthyr  huge door guard
		["scale"] = 0.45,
		["feet"] = 1.63,
		["offset"] = 0.285,
	},
	["3492867"] = { -- Torghast legendary forging dude
		["scale"] = 0.42,
		["offset"] = 1.235,
	},
	["3677217"] = { -- Torghast tracking pilar
		["scale"] = 3.95,
		["offset"] = 0.125,
	},
	--endregion

	--region Dragonflight
	["3084654"] = { -- Wrathion
		["scale"] = 0.83,
		["feet"] = 0.33,
		["offset"] = 0.375,
		["facing"] = 0.67,
	},
	["4227968"] = { -- Majordomo Selistra (red dragon)
		["scale"] = 0.94,
		["offset"] = 0.395,
		["facing"] = 0.79,
	},
	["4416923"] = { -- Sabellian (black dragon)
		["scale"] = 0.94,
		["offset"] = 0.355,
		["facing"] = 0.79,
	},
	["4216711"] = { -- Caretaker Azkra (dragonspawn)
		["scale"] = 1.15,
		["offset"] = 0.295,
	},
	["3947971"] = { -- Lillistrasza (dragon whelp)
		["scale"] = 2.78,
		["offset"] = 0.185,
		["facing"] = 0.79,
	},
	["4498203"] = { -- Scalecommander Emberthal (Dracthyr Female NPC)
		["scale"] = 1.78,
		["feet"] = 0.44,
	},
	["4183015"] = { -- Krillonn (bulky dragonspawn)
		["scale"] = 1.09,
		["offset"] = 0.305,
	},
	["4081379"] = { -- Scout Tomul (centaur female)
		["scale"] = 1.77,
	},
	["4036647"] = { -- Khansguard Jebotai (centaur male)
		["scale"] = 1.77,
	},
	["4521688"] = { -- Agurahl the Butcher (centaur male)
		["scale"] = 1.19,
		["offset"] = 0.245,
	},
	["2404896"] = { -- Gracus (Ancient)
		["scale"] = 0.85,
		["offset"] = 0.195,
	},
	["3024833"] = { -- Dryad
		["scale"] = 1.27,
	},
	["166523"] = { -- Supply Portal
		["scale"] = 2.82,
		["offset"] = 0.115,
	},
	["4495214"] = { -- Alexstrasza
		["scale"] = 0.98,
		["offset"] = 0.325,
	},
	["4498270"] = { -- Nozdormu
		["scale"] = 0.98,
		["offset"] = 0.325,
	},
	["4496906"] = { -- Kalecgos
		["scale"] = 0.98,
		["offset"] = 0.325,
	},
	["523697"] = { -- Magmasworn Spear
		["scale"] = 2.18,
		["feet"] = 0.23,
		["offset"] = 0.125,
		["facing"] = 0.73,
	},
	["4218359"] = { -- Chromie
		["scale"] = 2.14,
	},
	["4423740"] = { -- Herald Flaps (Protodrake Whelp)
		["scale"] = 2.34,
		["feet"] = 0.35,
	},
	["1355687"] = { -- Jolsai (Nightborne child)
		["scale"] = 2.06,
	},
	["123457"] = { -- Nusall (Draenei child)
		["scale"] = 2.06,
	},
	["652330"] = { -- Ji-eun (Pandaren child)
		["scale"] = 2.06,
	},
	["518459"] = { -- Twinkle (Goblin child)
		["scale"] = 2.06,
	},
	["1608483"] = { -- Ariel (Human child)
		["scale"] = 2.06,
	},
	["1626310"] = { -- Nime (Troll child)
		["scale"] = 2.06,
	},
	["3858816"] = { -- Tarjin the Blind (Djaradin)
		["scale"] = 1.07,
		["offset"] = 0.285,
	},
    ["4485594"] = { -- Runestone
        ["scale"] = 3.21,
        ["offset"] = 0.115,
        ["facing"] = 0.49,
    },
    ["4077816"] = { -- Roki (Bird)
        ["scale"] = 2.47,
        ["offset"] = 0.255,
    },
	["4184229"] = { -- Ingot (drakonid child)
		["scale"] = 2.03,
	},
	["4186587"] = { -- Neelo (tuskarr child)
		["scale"] = 2.13,
	},
	["4048782"] = { -- Duckling
		["scale"] = 5.38,
	},
	["1522882"] = {
		["scale"] = 1.23,
	},
	["1120702"] = { -- Harpy
		["scale"] = 1.18,
	},
	["1135341"] = { -- Brogg the Beast
		["scale"] = 1.04,
		["offset"] = 0.255,
	},
	["3950118"] = { -- Niffen
		["scale"] = 1.92,
	},
	["4575036"] = { -- Newsy (Snail)
		["scale"] = 2.85,
		["offset"] = 0.225,
	},
	["2404898"] = { -- Sprucecrown (tree ancient)
		["scale"] = 0.73,
	},
	["4883916"] = { -- Q'onzu
		["scale"] = 2.95,
		["offset"] = 0.345,
	},
	["1261840"] = { -- Cenarius
		["scale"] = 1.06,
		["offset"] = 0.265,
	},
	["5011146"] = { -- Keeper Amrymn (grove keeper)
		["scale"] = 1.73,
		["offset"] = 0.235,
	},
	["5151105"] = { -- Merithra
		["scale"] = 0.98,
		["offset"] = 0.325,
	},
	["4278602"] = { -- Buri (Protodrake)
		["scale"] = 0.34,
		["offset"] = 0.525,
		["facing"] = 0.77,
	},
	["5091437"] = { -- Bodwin (Owl)
		["scale"] = 2.39,
		["offset"] = 0.235,
	},
	["1139162"] = { -- Kiya Featherpaw (Boomkin)
		["scale"] = 1.02,
	},
	--endregion

	--region War Within
	["3952870"] = { -- Thrall
		["scale"] = 1.3,
	},
	["5767091"] = { -- Dagran Thaurissan II
		["scale"] = 1.87,
	},
	["5353632"] = { -- Magni
		["scale"] = 1.65,
	},
	--endregion
}

--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
-- Scaling API
--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

function Lib:GetModelKeys(model1, model2)
	local key = (model1 or "") .. "~" .. (model2 or "");
	local inverted = (model2 or "") .. "~" .. (model1 or "");
	return key, inverted;
end

function Lib:IsRecorded(model1, model2)
	local key, inverted = self:GetModelKeys(model1, model2);
	return SCALE_MAPPING[key] ~= nil or SCALE_MAPPING[inverted] ~= nil;
end

function Lib:GetModelPlacementProperties(model)
	return PLACEMENT_PROPERTIES[model] or DEFAULT_PROPERTIES;
end

function Lib:GetModelCoupleProperties(model1, model2)
    -- Grabbing equivalent scale
    model1 = CHAR_TO_CHAR[model1] or model1;
    model2 = CHAR_TO_CHAR[model2] or model2;

	local key, inverted = self:GetModelKeys(model1, model2);

	local scalingMe, scalingYou;
	if SCALE_MAPPING[key] then
		scalingMe, scalingYou = SCALE_MAPPING[key][1], SCALE_MAPPING[key][2];
	end
	if SCALE_MAPPING[inverted] then
		scalingMe, scalingYou = SCALE_MAPPING[inverted][2], SCALE_MAPPING[inverted][1];
	end

	local propsMe, propsYou = self:GetModelPlacementProperties(model1), self:GetModelPlacementProperties(model2);

	return
	{
		scale = scalingMe or propsMe.scale,
		feet = propsMe.feet,
		offset = propsMe.offset,
		facing = propsMe.facing,
	},
	{
		scale = scalingYou or propsYou.scale,
		feet = propsYou.feet,
		offset = propsYou.offset,
		facing = propsYou.facing,
	};
end

function Lib:SetModelHeight(scale, frame)
	scale = scale or DEFAULT_PROPERTIES.scale;
	frame.scale = scale;
	frame:InitializeCamera(scale);
end

function Lib:SetModelFacing(facing, frame, isMe)
	facing = facing or DEFAULT_PROPERTIES.facing;
	frame.facing = facing;
	frame:SetFacing(facing * (isMe and 1 or -1));
end

function Lib:SetModelFeet(feet, frame)
	feet = feet or DEFAULT_PROPERTIES.feet;
	frame.feet = feet;
	frame:SetHeightFactor(feet);
end

function Lib:SetModelOffset(offset, frame, isMe)
	offset = offset or DEFAULT_PROPERTIES.offset;
	frame.offset = offset;
	frame:SetTargetDistance(offset * (isMe and 1 or -1));
end