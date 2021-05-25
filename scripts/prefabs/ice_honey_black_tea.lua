-- 
local function create(mc)
	STRINGS.NAMES[string.upper(mc)] = "冰蜜红茶"

    STRINGS.CHARACTERS.WILLOW.DESCRIBE[string.upper(mc)] = "ohhh~"
    STRINGS.CHARACTERS.WOLFGANG.DESCRIBE[string.upper(mc)] = "ohhh~"
    STRINGS.CHARACTERS.WENDY.DESCRIBE[string.upper(mc)] = "ohhh~"

    return Prefab(mc, function()
        local inst = CreateEntity()
        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        if not TheWorld.ismastersim then
            return inst
        end	

        MakeInventoryPhysics(inst)
        
        --  scml的文件名对应
        inst.AnimState:SetBuild(mc)
        -- 动画合集名(entity)对应着bank
        inst.AnimState:SetBank("entity_" .. mc)
        -- 动画名对应着Animation
        inst.AnimState:PlayAnimation("idle")

        -- 可食用
        inst:AddComponent("edible")
        inst:AddTag("preparedfood") --厨师可食用
	    inst.components.edible.hungervalue = 0
	    inst.components.edible.sanityvalue = 30
	    inst.components.edible.healthvalue = 12

        -- 腐烂
        inst:AddComponent("perishable")
	    inst.components.perishable:SetPerishTime(TUNING.PERISH_FAST / 2)
	    inst.components.perishable:StartPerishing()
	    inst.components.perishable.onperishreplacement = "spoiled_food"

        -- 堆积
        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM

        -- 可检查
        inst:AddComponent("inspectable")

        -- 库存项目
        inst:AddComponent("inventoryitem")
        inst.components.inventoryitem.atlasname = "images/inventoryimages/" .. mc .. ".xml"

        return inst
    end,
    {
        Asset("ANIM", "anim/" .. mc .. ".zip"),
        Asset("ATLAS", "images/inventoryimages/" .. mc ..".xml"),
    })
end

--
return create("ice_honey_black_tea")