GLOBAL.setmetatable(env,{__index=function(t,k) return GLOBAL.rawget(GLOBAL,k) end})--GLOBAL相关照抄

-- mode 增加的物品文件，scripts/prefabs 下的文件名
PrefabFiles = {
	"fruit_skewers",
    "ice_honey_black_tea",
	"watermelon_bo",
}

-- 注册冰蜜红茶制作方式
local makeIceHoneyBlackTea =
{
	name = "ice_honey_black_tea",
	test = function(cooker, names, tags) 
		return names.robin and names.ice == 2 and names.honey 
	end,
	foodtype = FOODTYPE.VEGGIE,
	perishtime = TUNING.PERISH_FAST / 3, --腐烂时间
	priority = 100,
	health = 15,
	hunger = 15,
	sanity = 15,
	weight = 1,
	cooktime = 0.25,

	cookbook_tex = "ice_honey_black_tea.tex",
	cookbook_atlas = "images/inventoryimages/ice_honey_black_tea.xml",
	cookbook_category = "cookpot",
}

AddIngredientValues({ "robin" }, { meat = 1 }, true)
AddCookerRecipe("cookpot", makeIceHoneyBlackTea)

-- 注册西瓜啵制作方式
local makeWatermelonBo =
{
	name = "watermelon_bo",
	test = function(cooker, names, tags) 
		return names.watermelon and names.ice and names.honey and names.ice_honey_black_tea
	end,
	foodtype = FOODTYPE.VEGGIE,
	perishtime = TUNING.PERISH_FAST / 3, --腐烂时间
	priority = 100,
	health = 10,
	hunger = 10,
	sanity = 30,
	weight = 1,
	cooktime = 0.25,

	cookbook_tex = "watermelon_bo.tex",
	cookbook_atlas = "images/inventoryimages/watermelon_bo.xml",
	cookbook_category = "cookpot",
	oneat_desc = "加速30%，持续5分钟",
}
AddIngredientValues({ "ice_honey_black_tea" }, { fruit = 1 }, true)
AddCookerRecipe("cookpot", makeWatermelonBo)

-- 注册果串零食制作方式
local makeFruitSkewers =
{
	name = "fruit_skewers",
	test = function(cooker, names, tags) 
		return names.twigs and names.jammypreserves == 3
	end,
	foodtype = FOODTYPE.VEGGIE,
	perishtime = TUNING.PERISH_FAST / 3, --腐烂时间
	priority = 100,
	hunger = 10,
	health = 20,
	sanity = 20,
	weight = 1,
	cooktime = 0.25,

	cookbook_tex = "fruit_skewers.tex",
	cookbook_atlas = "images/inventoryimages/fruit_skewers.xml",
	cookbook_category = "cookpot",
	oneat_desc = "无",
}
AddIngredientValues({ "jammypreserves" }, { fruit = 2 }, true)
AddCookerRecipe("cookpot", makeFruitSkewers)
