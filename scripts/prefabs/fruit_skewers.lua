-- 
local function create(mc)
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
        inst:AddTag("preparedfood") --厨师可食用
	    inst.components.edible.hungervalue = 15
	    inst.components.edible.sanityvalue = 10
	    inst.components.edible.healthvalue = 10

        -- 腐烂
        inst:AddComponent("perishable")
	    inst.components.perishable:SetPerishTime(TUNING.PERISH_FAST / 3)
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
return create("fruit_skewers")