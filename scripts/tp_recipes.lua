-- 添加到制作项

-- 合成公式: 魔女之亭
local witch_pavilion = Recipe(
    "witch_pavilion", 
    { 
        Ingredient("twigs", 1) 
    }, 
    GLOBAL.RECIPETABS.FARM, GLOBAL.TECH.SCIENCE, 
    "witch_pavilion_placer"
)

witch_pavilion.atlas = "images/inventoryimages/witch_pavilion.xml"
