GLOBAL.setmetatable(env,{__index=function(t,k) return GLOBAL.rawget(GLOBAL,k) end})--GLOBAL相关照抄

-- mode 增加的物品文件，scripts/prefabs 下的文件名
PrefabFiles = {
    "lucky_tea",
	"watermelon_bobo",
	"liaoli",
}

-- 注册幸运红茶制作方式
local makeLuckyTea =
{
	name = "lucky_tea",
	test = function(cooker, names, tags) 
		return names.robin and names.ice and names.honey == 2 
	end,
	foodtype = FOODTYPE.VEGGIE,
	perishtime = TUNING.PERISH_MED,--腐烂时间
	priority = 100,
	health = 15,
	hunger = 15,
	sanity = 15,
	weight = 1,
	cooktime = 0.3,

	cookbook_tex = "lucky_tea.tex",
	cookbook_atlas = "images/inventoryimages/lucky_tea.xml",
	cookbook_category = "cookpot",
	oneat_desc = "无",
}

AddCookerRecipe("cookpot", makeLuckyTea)

-- 注册西瓜啵啵制作方式
local makeWatermelonBobo =
{
	name = "watermelon_bobo",
	test = function(cooker, names, tags) 
		return names.watermelon and names.ice and names.honey and names.berries_juicy 
	end,
	foodtype = FOODTYPE.VEGGIE,
	perishtime = TUNING.PERISH_MED,--腐烂时间
	priority = 100,
	health = 15,
	hunger = 15,
	sanity = 15,
	weight = 1,
	cooktime = 0.3,

	cookbook_tex = "watermelon_bobo.tex",
	cookbook_atlas = "images/inventoryimages/watermelon_bobo.xml",
	cookbook_category = "cookpot",
	oneat_desc = "无",
}

AddCookerRecipe("cookpot", makeWatermelonBobo)

local pf = {
	name = "ll",
	test = function(cooker, names, tags)
		return names.honey
		and names.berries_juicy
		and names.ice
		and names.ice
	end,
	priority = 30,
	weight = 1,
	foodtype = FOODTYPE.MEAT,
	health = 36,
	hunger = 36,
	sanity = 36,

	perishtime = TUNING.PERISH_MED,--腐烂时间
	cooktime = 0.1,--烹饪时间

	cookbook_tex = "ll.tex",
	cookbook_atlas = "images/inventoryimages/ll.xml",
	cookbook_category = "cookpot",
	oneat_desc = "无",
}

AddCookerRecipe("cookpot", pf)
