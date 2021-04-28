-- 
local function createLuckyTea(mc)
	STRINGS.NAMES[string.upper(mc)] = "幸运红茶"

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
	
        inst.AnimState:SetBank(mc)
        inst.AnimState:SetBuild(mc)
        inst.AnimState:PlayAnimation("idle")

        -- 可食用
        inst:AddComponent("edible")
	    inst.components.edible.healthvalue = 15
	    inst.components.edible.hungervalue = 15
	    inst.components.edible.sanityvalue = 15

        -- 腐烂
        inst:AddComponent("perishable")
	    inst.components.perishable:SetPerishTime(TUNING.PERISH_MED)
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

        -- 食用效果
        inst.components.edible:SetOnEatenFn(function (inst, eater)
            eater.components.locomotor:SetExternalSpeedMultiplier(eater, mc .. "buff", 1.80)
            eater:DoTaskInTime(60, function()
                eater.components.locomotor:RemoveExternalSpeedMultiplier(eater,  mc .. "buff")
            end)
        end)

        return inst
    end,
    {
        Asset("ANIM", "anim/" .. mc .. ".zip"),
        Asset("ATLAS", "images/inventoryimages/" .. mc ..".xml"),
    })
end

--
return createLuckyTea("lucky_tea")