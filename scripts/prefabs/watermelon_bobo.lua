-- 
local function createWatermelonBobo(mc)
	STRINGS.NAMES[string.upper(mc)] = "秘制西瓜啵啵"
	STRINGS.CHARACTERS.GENERIC.DESCRIBE[string.upper(mc)] = "秘制西瓜啵啵"

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
	    inst.components.edible.healthvalue = 10
	    inst.components.edible.hungervalue = 10
	    inst.components.edible.sanityvalue = 60
    
        -- 堆积
        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = 40

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
return createWatermelonBobo("watermelon_bobo")