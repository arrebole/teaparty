-- witch_pavilion -> 魔女之亭
local containers = require("containers")

local function onopen(inst)
	return
end

local function onclose(inst)
	return
end

-- 创建容器、设置容器大小
local function createContainer(mc)
    containers.params[mc] =
    {
	    widget =
	    {
		    slotpos = {},
		    animbank = "ui_chest_3x3",
		    animbuild = "ui_chest_3x3",
		    pos = Vector3(160, 20, 0),
	    },
	    type = "chest",
    }

    for y = 2, 0, -1 do
        for x = 0, 2 do
            table.insert(
                containers.params[mc].widget.slotpos, 
                Vector3(80 * x - 80 * 2 + 80, 80 * y - 80 * 2 + 80, 0)
            )
        end
    end

    return mc
end

local function create(mc)
    return Prefab(mc, function()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        -- 建筑物标签
        inst:AddTag("structure")
    
        inst.AnimState:SetBank( mc)
        inst.AnimState:SetBuild(mc)
        inst.AnimState:PlayAnimation("idle")

        if not TheWorld.ismastersim then
            return inst
        end

        MakeInventoryPhysics(inst)

        -- 可以被检查
        inst:AddComponent("inspectable")

        -- 可以存放物品
        inst:AddComponent("container")
        inst.components.container:WidgetSetup(createContainer(mc))
        inst.components.container.onopenfn = onopen
        inst.components.container.onclosefn = onclose
        inst.components.container.skipclosesnd = true
        inst.components.container.skipopensnd = true

        -- 设置存放物品防腐烂保险 -> 永久保险
        inst:AddComponent("preserver")
        inst.components.preserver:SetPerishRateMultiplier(0)

        return inst
    end,
    {
        Asset("ANIM", "anim/" .. mc .. ".zip"),
        Asset("ATLAS", "images/inventoryimages/" .. mc ..".xml"),
    })
end

-- 
return create("witch_pavilion"),
    MakePlacer("witch_pavilion_placer", "witch_pavilion", "witch_pavilion", "idle")