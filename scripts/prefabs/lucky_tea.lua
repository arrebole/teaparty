-- 
local function createLuckyTea(mc)
	STRINGS.NAMES[string.upper(mc)] = "幸运红茶"
	STRINGS.CHARACTERS.GENERIC.DESCRIBE[string.upper(mc)] = "幸运红茶"

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

        inst.components.edible:SetOnEatenFn(function (inst, eater)
            eater.components.locomotor:SetExternalSpeedMultiplier(eater, mc .. "buff", 1.80)
            eater:DoTaskInTime(30, function()
                eater.components.locomotor:RemoveExternalSpeedMultiplier(eater,  mc .. "buff")
            end)
        end)

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
return createLuckyTea("lucky_tea")