
-- 将红鸟设置为可烹饪
AddIngredientValues({ "robin" }, { meat = 1 }, true)
-- 将冰蜜红茶设置为可烹饪
AddIngredientValues({ "ice_honey_black_tea" }, { fruit = 1 }, true)

-- 将食谱添加到烹饪锅
for k, recipe in pairs (require("tp_preparedfoods")) do
	AddCookerRecipe("cookpot", recipe, true)
	AddCookerRecipe("portablecookpot", recipe, true)
	AddCookerRecipe("archive_cookpot", recipe, true)
end