
local foods = {
    -- 冰蜜红茶制作方式
    iceHoneyBlackTea =
    {
	    name = "ice_honey_black_tea",
	    test = function(cooker, names, tags) 
		    return names.robin and names.ice == 2 and names.honey 
	    end,
	    foodtype = FOODTYPE.VEGGIE,
	    perishtime = TUNING.PERISH_FAST / 2, --腐烂时间
	    priority = 100,
	    hunger = 0,
	    sanity = 30,
	    health = 12,
	    weight = 1,
	    cooktime = 0.75,

	    cookbook_tex = "ice_honey_black_tea.tex",
	    cookbook_atlas = "images/inventoryimages/ice_honey_black_tea.xml",
	    cookbook_category = "cookpot",
    },

    -- 西瓜啵制作方式
    makeWatermelonBo =
    {
	    name = "watermelon_bo",
	    test = function(cooker, names, tags) 
		    return names.watermelon and names.ice and names.berries_juicy and names.ice_honey_black_tea
	    end,
	    foodtype = FOODTYPE.VEGGIE,
	    perishtime = TUNING.PERISH_FAST / 2, --腐烂时间
	    priority = 100,
	    hunger = 0,
	    sanity = 50,
	    health = 25,
	    weight = 1,
	    cooktime = 0.75,

	    cookbook_tex = "watermelon_bo.tex",
	    cookbook_atlas = "images/inventoryimages/watermelon_bo.xml",
	    cookbook_category = "cookpot",
	    oneat_desc = "加速30%，持续5分钟",
    },

    -- 果串零食制作方式
    makeFruitSkewers =
    {
	    name = "fruit_skewers",
	    test = function(cooker, names, tags) 
		    return names.twigs and names.berries == 3
	    end,
	    foodtype = FOODTYPE.VEGGIE,
	    perishtime = TUNING.PERISH_FAST / 3, --腐烂时间
	    priority = 100,
	    hunger = 15,
	    sanity = 10,
	    health = 10,
	    weight = 1,
	    cooktime = 0.75,

	    cookbook_tex = "fruit_skewers.tex",
	    cookbook_atlas = "images/inventoryimages/fruit_skewers.xml",
	    cookbook_category = "cookpot",
	    oneat_desc = "无",
    },
}

return foods