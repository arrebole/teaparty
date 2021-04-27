local function liaoli(mc)
	STRINGS.NAMES[string.upper(mc)] = "料理"
	STRINGS.CHARACTERS.GENERIC.DESCRIBE[string.upper(mc)] = "模板料理"

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

		inst:AddComponent("edible")--可食用的组件
		inst.components.edible.healthvalue = 36
		inst.components.edible.hungervalue = 36
		inst.components.edible.sanityvalue = 36

		inst:AddComponent("stackable")--可堆叠组件
		inst.components.stackable.maxsize = 40--堆叠上限

		inst:AddComponent("inspectable")--可检查组件

		inst:AddComponent("inventoryitem")--物品组件
		inst.components.inventoryitem.atlasname = "images/inventoryimages/" .. mc .. ".xml"--物品贴图
		return inst
	end,
	{
		Asset("ANIM", "anim/" .. mc .. ".zip"),
		Asset("ATLAS", "images/inventoryimages/" .. mc .. ".xml"),
	})
end

return liaoli("ll")