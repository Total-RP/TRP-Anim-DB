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
	PANDAREN = {
		FEMALE = "589715",
		MALE = "535052",
	},
	ORC = {
		FEMALE = "949470",
		MALE = "917116",
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
}

local DEFAULT_SCALE = {
	me = {
		scale = 1.45,
		feet = 0.4,
		offset = 0.215,
		facing = 0.75
	}
};
DEFAULT_SCALE.you = DEFAULT_SCALE.me;

Lib.DEFAULT_SCALE = DEFAULT_SCALE;

local SCALE_MAPPING = {

	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
	-- Worgen female
	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

	[CHAR_TO_ID.WORGEN.FEMALE .. "~" .. CHAR_TO_ID.HUMAN.FEMALE] = {
		["me"] = {
			["scale"] = 1.42,
		},
		["you"] = {
			["scale"] = 1.67,
		}
	},

	[CHAR_TO_ID.WORGEN.FEMALE .. "~" .. CHAR_TO_ID.HUMAN.MALE] = {
		["me"] = {
			["scale"] = 1.49,
		},
		["you"] = {
			["scale"] = 1.61,
		}
	},

	[CHAR_TO_ID.WORGEN.FEMALE .. "~" .. CHAR_TO_ID.WORGEN.MALE] = {
		["me"] = {
			["scale"] = 1.53,
		},
		["you"] = {
			["scale"] = 1.49,
		}
	},

	[CHAR_TO_ID.WORGEN.FEMALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.FEMALE] = {
		["me"] = {
			["scale"] = 1.45,
		},
		["you"] = {
			["scale"] = 1.45,
		}
	},

	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
	-- Worgen male
	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

	[CHAR_TO_ID.WORGEN.MALE .. "~" .. CHAR_TO_ID.HUMAN.FEMALE] = {
		["me"] = {
			["scale"] = 1.39,
		},
		["you"] = {
			["scale"] = 1.62,
		}
	},

	[CHAR_TO_ID.WORGEN.MALE .. "~" .. CHAR_TO_ID.HUMAN.MALE] = {
		["me"] = {
			["scale"] = 1.52,
		},
		["you"] = {
			["scale"] = 1.56,
		}
	},

	[CHAR_TO_ID.WORGEN.MALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.FEMALE] = {
		["me"] = {
			["scale"] = 1.45,
		},
		["you"] = {
			["scale"] = 1.45,
		}
	},

	[CHAR_TO_ID.WORGEN.MALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.FALE] = {
		["me"] = {
			["scale"] = 1.45,
		},
		["you"] = {
			["scale"] = 1.35,
		}
	},

	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
	-- Human female
	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

	-- VS player models
	[CHAR_TO_ID.HUMAN.FEMALE .. "~" .. CHAR_TO_ID.HUMAN.MALE] = {
		["me"] = {
			["scale"] = 1.56,
		},
	},
	[CHAR_TO_ID.HUMAN.FEMALE .. "~" .. CHAR_TO_ID.GNOME.FEMALE] = {
		["you"] = {
			["scale"] = 2.2,
		},
	},
	[CHAR_TO_ID.HUMAN.FEMALE .. "~" .. CHAR_TO_ID.DRAENEI.MALE] = {
		["you"] = {
			["scale"] = 1.27,
		},
		["me"] = {
			["scale"] = 1.63,
		},
	},
	[CHAR_TO_ID.HUMAN.FEMALE .. "~" .. CHAR_TO_ID.DRAENEI.FEMALE] = {
		["me"] = {
			["scale"] = 1.81,
		},
		["you"] = {
			["scale"] = 1.31,
		},
	},
	[CHAR_TO_ID.HUMAN.FEMALE .. "~" .. CHAR_TO_ID.PANDAREN.MALE] = {
		["me"] = {
			["scale"] = 1.58,
		},
		["you"] = {
			["scale"] = 1.13,
		},
	},
	[CHAR_TO_ID.HUMAN.FEMALE .. "~" .. CHAR_TO_ID.PANDAREN.FEMALE] = {
		["me"] = {
			["scale"] = 1.58,
		},
		["you"] = {
			["scale"] = 1.38,
		},
	},
	[CHAR_TO_ID.HUMAN.FEMALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.FEMALE] = {
		["me"] = {
			["scale"] = 1.61,
		},
		["you"] = {
			["scale"] = 1.32,
		},
	},
	[CHAR_TO_ID.HUMAN.FEMALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.MALE] = {
		["me"] = {
			["scale"] = 1.61,
		},
		["you"] = {
			["scale"] = 1.27,
		},
	},
	[CHAR_TO_ID.HUMAN.FEMALE .. "~" .. CHAR_TO_ID.GNOME.MALE] = {
		["you"] = {
			["scale"] = 2,
		},
	},
	[CHAR_TO_ID.HUMAN.FEMALE .. "~" .. CHAR_TO_ID.DWARF.FEMALE] = {
		["you"] = {
			["scale"] = 1.61,
		},
	},
	[CHAR_TO_ID.HUMAN.FEMALE .. "~" .. CHAR_TO_ID.DWARF.MALE] = {
		["you"] = {
			["scale"] = 1.34,
		},
	},
	[CHAR_TO_ID.HUMAN.FEMALE .. "~" .. CHAR_TO_ID.GOBLIN.MALE] = {
		["you"] = {
			["scale"] = 1.91,
		},
		["me"] = {
			["scale"] = 1.4,
		},
	},

	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
	-- Human male
	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

	-- VS player models
	[CHAR_TO_ID.HUMAN.MALE .. "~" .. CHAR_TO_ID.GNOME.FEMALE] = {
		["you"] = {
			["scale"] = 1.99,
		},
		["me"] = {
			["scale"] = 1.29,
		},
	},
	[CHAR_TO_ID.HUMAN.MALE .. "~" .. CHAR_TO_ID.DWARF.MALE] = {
		["me"] = {
			["scale"] = 1.29,
		},
		["you"] = {
			["scale"] = 1.55,
		},
	},
	[CHAR_TO_ID.HUMAN.MALE .. "~" .. CHAR_TO_ID.PANDAREN.FEMALE] = {
		["you"] = {
			["scale"] = 1.350,
		},
		["me"] = {
			["scale"] = 1.399,
		},
	},
	[CHAR_TO_ID.HUMAN.MALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.FEMALE] = {
		["you"] = {
			["scale"] = 1.299,
		},
		["me"] = {
			["scale"] = 1.389,
		},
	},
	[CHAR_TO_ID.HUMAN.MALE .. "~" .. CHAR_TO_ID.GOBLIN.FEMALE] = {
		["me"] = {
			["scale"] = 1.279,
		},
		["you"] = {
			["scale"] = 1.959,
		},
	},
	[CHAR_TO_ID.HUMAN.MALE .. "~" .. CHAR_TO_ID.DWARF.FEMALE] = {
		["you"] = {
			["scale"] = 1.599,
		},
		["me"] = {
			["scale"] = 1.279,
		},
	},
	[CHAR_TO_ID.HUMAN.MALE .. "~" .. CHAR_TO_ID.ORC.MALE] = {
		["me"] = {
			["scale"] = 1.289,
		},
		["you"] = {
			["scale"] = 1.429,
		},
	},
	[CHAR_TO_ID.HUMAN.MALE .. "~" .. CHAR_TO_ID.DRAENEI.MALE] = {
		["me"] = {
			["scale"] = 1.65,
		},
	},
	[CHAR_TO_ID.HUMAN.MALE .. "~" .. CHAR_TO_ID.PANDAREN.MALE] = {
		["you"] = {
			["scale"] = 1.15,
		},
	},
	[CHAR_TO_ID.HUMAN.MALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.MALE] = {
		["me"] = {
			["scale"] = 1.59,
		},
		["you"] = {
			["scale"] = 1.28,
		},
	},

	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
	-- Draenei male
	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

	-- VS player models
	[CHAR_TO_ID.DRAENEI.MALE .. "~" .. CHAR_TO_ID.WORGEN.FEMALE] = {
		["you"] = {
			["scale"] = 1.23,
		},
	},
	[CHAR_TO_ID.DRAENEI.MALE .. "~" .. CHAR_TO_ID.DWARF.FEMALE] = {
		["you"] = {
			["scale"] = 2.1,
		},
	},
	[CHAR_TO_ID.DRAENEI.MALE .. "~" .. CHAR_TO_ID.GNOME.MALE] = {
		["you"] = {
			["scale"] = 2.52,
		},
	},
	[CHAR_TO_ID.DRAENEI.MALE .. "~" .. CHAR_TO_ID.PANDAREN.FEMALE] = {
		["you"] = {
			["scale"] = 1.82,
		},
	},
	[CHAR_TO_ID.DRAENEI.MALE .. "~" .. CHAR_TO_ID.PANDAREN.MALE] = {
		["you"] = {
			["scale"] = 1.31,
		},
	},
	[CHAR_TO_ID.DRAENEI.MALE .. "~" .. CHAR_TO_ID.BLOOD_ELF.MALE] = {
		["you"] = {
			["scale"] = 1.7,
		},
	},
	[CHAR_TO_ID.DRAENEI.MALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.FEMALE] = {
		["you"] = {
			["scale"] = 1.57,
		},
	},
	[CHAR_TO_ID.DRAENEI.MALE .. "~" .. CHAR_TO_ID.GNOME.FEMALE] = {
		["you"] = {
			["scale"] = 2.7599,
		},
		["me"] = {
			["scale"] = 1.44,
		},
	},
	[CHAR_TO_ID.DRAENEI.MALE .. "~" .. CHAR_TO_ID.DWARF.MALE] = {
		["you"] = {
			["scale"] = 1.9,
		},
	},
	[CHAR_TO_ID.DRAENEI.MALE .. "~" .. CHAR_TO_ID.GOBLIN.FEMALE] = {
		["you"] = {
			["scale"] = 2.25,
		},
	},
	[CHAR_TO_ID.DRAENEI.MALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.MALE] = {
		["you"] = {
			["scale"] = 1.42,
		},
	},
	[CHAR_TO_ID.DRAENEI.MALE .. "~" .. CHAR_TO_ID.GOBLIN.MALE] = {
		["you"] = {
			["scale"] = 2.399,
		},
	},
	[CHAR_TO_ID.DRAENEI.MALE .. "~" .. CHAR_TO_ID.ORC.FEMALE] = {
		["me"] = {
			["scale"] = 1.42,
		},
		["you"] = {
			["scale"] = 1.68,
		},
	},
	[CHAR_TO_ID.DRAENEI.MALE .. "~" .. CHAR_TO_ID.DRAENEI.FEMALE] = {
		["me"] = {
			["scale"] = 1.43,
		},
		["you"] = {
			["scale"] = 1.48,
		}
	},
	[CHAR_TO_ID.DRAENEI.MALE .. "~" .. CHAR_TO_ID.WORGEN.MALE] = {
		["me"] = {
			["scale"] = 1.45,
		},
		["you"] = {
			["scale"] = 1.65,
		}
	},

	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
	-- Draenei female
	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.HUMAN.MALE] = {
		["me"] = {
			["scale"] = 1.4,
		},
		["you"] = {
			["scale"] = 1.64,
		}
	},

	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.FEMALE] = {
		["me"] = {
			["scale"] = 1.39,
		},
		["you"] = {
			["scale"] = 1.54,
		}
	},

	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.MALE] = {
		["me"] = {
			["scale"] = 1.46,
		},
		["you"] = {
			["scale"] = 1.41,
		}
	},

	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.UNDEAD.MALE] = {
		["me"] = {
			["scale"] = 1.37,
		},
		["you"] = {
			["scale"] = 1.66,
		}
	},

	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.BLOOD_ELF.FEMALE] = {
		["me"] = {
			["scale"] = 1.36,
		},
		["you"] = {
			["scale"] = 1.63,
		}
	},

	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.ORC.FEMALE] = {
		["me"] = {
			["scale"] = 1.38,
		},
		["you"] = {
			["scale"] = 1.62,
		}
	},

	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.GNOME.FEMALE] = {
		["me"] = {
			["scale"] = 1.44,
		},
		["you"] = {
			["scale"] = 2.5599,
		}
	},

	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.GNOME.MALE] = {
		["me"] = {
			["scale"] = 1.36,
		},
		["you"] = {
			["scale"] = 2.66,
		}
	},

	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.DWARF.MALE] = {
		["me"] = {
			["scale"] = 1.32,
		},
		["you"] = {
			["scale"] = 2.01,
		}
	},

	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.ORC.MALE] = {
		["me"] = {
			["scale"] = 1.41,
		},
		["you"] = {
			["scale"] = 1.58,
		}
	},

	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.BLOOD_ELF.MALE] = {
		["me"] = {
			["scale"] = 1.41,
		},
		["you"] = {
			["scale"] = 1.57,
		}
	},

	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.DWARF.FEMALE] = {
		["me"] = {
			["scale"] = 1.27,
		},
		["you"] = {
			["scale"] = 1.83,
		}
	},

	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.WORGEN.MALE] = {
		["me"] = {
			["scale"] = 1.45,
		},
		["you"] = {
			["scale"] = 1.57,
		}
	},

	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.PANDAREN.FEMALE] = {
		["me"] = {
			["scale"] = 1.4,
		},
		["you"] = {
			["scale"] = 1.61,
		}
	},

	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.PANDAREN.MALE] = {
		["me"] = {
			["scale"] = 1.45,
		},
		["you"] = {
			["scale"] = 1.39,
		}
	},

	[CHAR_TO_ID.DRAENEI.FEMALE .. "~" .. CHAR_TO_ID.WORGEN.FEMALE] = {
		["me"] = {
			["scale"] = 1.38,
		},
		["you"] = {
			["scale"] = 1.6,
		}
	},

	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
	-- Gnome male
	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

	[CHAR_TO_ID.GNOME.MALE .. "~" .. CHAR_TO_ID.DWARF.MALE] = {
		["me"] = {
			["scale"] = 1.58,
		},
		["you"] = {
			["scale"] = 1.08,
		},
	},
	[CHAR_TO_ID.GNOME.MALE .. "~" .. CHAR_TO_ID.HUMAN.MALE] = {
		["me"] = {
			["scale"] = 2.06,
		},
		["you"] = {
			["scale"] = 1.3,
		},
	},
	[CHAR_TO_ID.GNOME.MALE .. "~" .. CHAR_TO_ID.WORGEN.MALE] = {
		["me"] = {
			["scale"] = 2.5,
		},
		["you"] = {
			["scale"] = 1.3,
		},
	},
	[CHAR_TO_ID.GNOME.MALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.FEMALE] = {
		["me"] = {
			["scale"] = 2.5199,
		},
		["you"] = {
			["scale"] = 1.35,
		},
	},
	[CHAR_TO_ID.GNOME.MALE .. "~" .. CHAR_TO_ID.PANDAREN.FEMALE] = {
		["you"] = {
			["scale"] = 1.37,
		},
		["me"] = {
			["scale"] = 2.24,
		},
	},
	[CHAR_TO_ID.GNOME.MALE .. "~" .. CHAR_TO_ID.PANDAREN.MALE] = {
		["me"] = {
			["scale"] = 2.599,
		},
		["you"] = {
			["scale"] = 1.12,
		},
	},
	[CHAR_TO_ID.GNOME.MALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.MALE] = {
		["me"] = {
			["scale"] = 2.389,
		},
		["you"] = {
			["scale"] = 1.26,
		},
	},
	[CHAR_TO_ID.GNOME.MALE .. "~" .. CHAR_TO_ID.GOBLIN.MALE] = {
		["you"] = {
			["scale"] = 1.34,
		},
	},
	[CHAR_TO_ID.GNOME.MALE .. "~" .. CHAR_TO_ID.DWARF.FEMALE] = {
		["you"] = {
			["scale"] = 1.21,
		},
		["me"] = {
			["scale"] = 1.6,
		},
	},
	[CHAR_TO_ID.GNOME.MALE .. "~" .. CHAR_TO_ID.GOBLIN.FEMALE] = {
		["you"] = {
			["scale"] = 1.41,
		},
	},

	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
	-- Dwarf female
	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

	-- VS player models
	[CHAR_TO_ID.DWARF.FEMALE .. "~" .. CHAR_TO_ID.DWARF.MALE] = {
		["me"] = {
			["scale"] = 1.299,
		},
		["you"] = {
			["scale"] = 1.179,
		},
	},
	[CHAR_TO_ID.DWARF.FEMALE .. "~" .. CHAR_TO_ID.TAUREN.MALE] = {
		["you"] = {
			["scale"] = 1.029,
		},
		["me"] = {
			["scale"] = 2,

		},
	},
	[CHAR_TO_ID.DWARF.FEMALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.MALE] = {
		["you"] = {
			["scale"] = 1.23,
		},
		["me"] = {
			["scale"] = 1.709,
		},
	},
	[CHAR_TO_ID.DWARF.FEMALE .. "~" .. CHAR_TO_ID.WORGEN.MALE] = {
		["me"] = {
			["scale"] = 1.639,
		},
		["you"] = {
			["scale"] = 1.299,
		},
	},
	[CHAR_TO_ID.DWARF.FEMALE .. "~" .. CHAR_TO_ID.GNOME.FEMALE] = {
		["me"] = {
			["scale"] = 1.299,
		},
		["you"] = {
			["scale"] = 1.799,
		},
	},
	[CHAR_TO_ID.DWARF.FEMALE .. "~" .. CHAR_TO_ID.PANDAREN.MALE] = {
		["you"] = {
			["scale"] = 1.299,
		},
		["me"] = {
			["scale"] = 1.769,
		},
	},

	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
	-- Night elves Female
	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

	-- VS player models
	[CHAR_TO_ID.NIGHT_ELF.FEMALE .. "~" .. CHAR_TO_ID.NIGHT_ELF.MALE] = {
		["you"] = {
			["scale"] = 1.41,
		},
		["me"] = {
			["scale"] = 1.56,
		},
	},

	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
	-- Blood elves Female
	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

	-- VS player models
	[CHAR_TO_ID.BLOOD_ELF.FEMALE .. "~" .. CHAR_TO_ID.TROLL.FEMALE] = {
		["you"] = {
			["scale"] = 1.25,
		},
		["me"] = {
			["scale"] = 1.55,
		},
	},
	[CHAR_TO_ID.BLOOD_ELF.FEMALE .. "~" .. CHAR_TO_ID.TAUREN.MALE] = {
		["me"] = {
			["scale"] = 1.79,
		},
		["you"] = {
			["scale"] = 1.05,
		},
	},

	[CHAR_TO_ID.BLOOD_ELF.FEMALE .. "~" .. CHAR_TO_ID.BLOOD_ELF.MALE] = {
		["me"] = {
			["scale"] = 1.5,
		},
		["you"] = {
			["scale"] = 1.33,
		}
	},

	[CHAR_TO_ID.BLOOD_ELF.FEMALE .. "~" .. CHAR_TO_ID.PANDAREN.FEMALE] = {
		["me"] = {
			["scale"] = 1.53,
		},
		["you"] = {
			["scale"] = 1.39,
		}
	},

	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
	-- Troll male
	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*


	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
	-- Orc female
	--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

	[CHAR_TO_ID.ORC.FEMALE .. "~" .. CHAR_TO_ID.PANDAREN.MALE] = {
		["me"] = {
			["scale"] = 1.52,
		},
		["you"] = {
			["scale"] = 1.2,
		}
	},

	[CHAR_TO_ID.ORC.FEMALE .. "~" .. CHAR_TO_ID.ORC.MALE] = {
		["me"] = {
			["scale"] = 1.54,
		},
		["you"] = {
			["scale"] = 1.45,
		}
	},

	[CHAR_TO_ID.ORC.FEMALE .. "~" .. CHAR_TO_ID.TROLL.MALE] = {
		["me"] = {
			["scale"] = 1.63,
		},
		["you"] = {
			["scale"] = 1.45,
		}
	},

	[CHAR_TO_ID.ORC.FEMALE .. "~" .. CHAR_TO_ID.TROLL.FEMALE] = {
		["me"] = {
			["scale"] = 1.56,
		},
		["you"] = {
			["scale"] = 1.42,
		}
	},
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

function Lib:GetModelScaling(model1, model2)
	local key, inverted = self:GetModelKeys(model1, model2)

	if SCALE_MAPPING[key] then
		return SCALE_MAPPING[key].me or DEFAULT_SCALE.me, SCALE_MAPPING[key].you or DEFAULT_SCALE.you, false;
	end

	if SCALE_MAPPING[inverted] then
		return SCALE_MAPPING[inverted].you or DEFAULT_SCALE.you, SCALE_MAPPING[inverted].me or DEFAULT_SCALE.me, true;
	end

	return DEFAULT_SCALE.me, DEFAULT_SCALE.you;
end

function Lib:GetModelDefaultScaling()
	return DEFAULT_SCALE;
end

function Lib:SetModelHeight(scale, frame)
	scale = scale or DEFAULT_SCALE.me.scale;
	frame.scale = scale;
	frame:InitializeCamera(scale);
end

function Lib:SetModelFacing(facing, frame, isMe)
	facing = facing or DEFAULT_SCALE.me.facing;
	frame.facing = facing;
	frame:SetFacing(facing * (isMe and 1 or -1));
end

function Lib:SetModelFeet(feet, frame)
	feet = feet or DEFAULT_SCALE.me.feet;
	frame.feet = feet;
	frame:SetHeightFactor(feet);
end

function Lib:SetModelOffset(offset, frame, isMe)
	offset = offset or DEFAULT_SCALE.me.offset;
	frame.offset = offset;
	frame:SetTargetDistance(offset * (isMe and 1 or -1));
end

--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
-- DEBUG AND MAINTENANCE
-- Don't use it on your code. :)
--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

local debugPlayerModelList = {
	-- Alliance
	"1000764",
	"1011653",
	"940356",
	"900914",
	"950080",
	"878772",
	"1022598",
	"1005887",
	"535052",
	"589715",
	"921844",
	"974343",
	"307453",
	"307454",

	-- Horde
	--	"119376",
	--	"119369",
}

--function TRP3_API.extended.animations.debugMissingScaling()
--	local alreadyTreated = {};
--	local count = 0;
--	for _, firstModel in pairs(debugPlayerModelList) do
--		for _, secondModel in pairs(debugPlayerModelList) do
--			if firstModel ~= secondModel then
--				local key, invertedKey = firstModel .. "~" .. secondModel, secondModel .. "~" .. firstModel;
--				if not TRP3_API.extended.animations.SCALE_MAPPING[key] and not TRP3_API.extended.animations.SCALE_MAPPING[invertedKey] and not alreadyTreated[key] and not alreadyTreated[invertedKey] then
--					alreadyTreated[key] = true;
--					alreadyTreated[invertedKey] = true;
--					count = count + 1;
--					print(("Missing scaling for %s + %s"):format(firstModel, secondModel));
--				end
--			end
--		end
--	end
--	print(("Total %s"):format(count));
--end
--
--local IMPORT = {
--
--}
--
--function TRP3_API.extended.animations.API.debugComplete()
--	if not TRP3_API.extended.animations.Data.debug.finalImport then
--		TRP3_API.extended.animations.Data.debug.finalImport = {};
--	end
--	wipe(TRP3_API.extended.animations.Data.debug.finalImport);
--	-- Find which key to import
--	local toImport = {};
--	for key, info in pairs(IMPORT) do
--		local firstModel = key:sub(1, key:find("~") - 1);
--		local secondModel = key:sub(key:find("~") + 1);
--		local invertedKey = secondModel .. "~" .. firstModel;
--		if not TRP3_API.extended.animations.SCALE_MAPPING[key] and not TRP3_API.extended.animations.SCALE_MAPPING[invertedKey] then
--			print("new to import: " .. key);
--			TRP3_API.extended.animations.Data.debug.finalImport[key] = info;
--		end
--	end
--end