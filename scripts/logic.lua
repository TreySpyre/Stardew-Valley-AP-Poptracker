function has(item, amount)
    local count = Tracker:ProviderCountForCode(item)
    amount = tonumber(amount)
    if not amount then
        return count > 0
    else
        return count >= amount
    end
end

function can_mine_copper()
    return (has("CopperPick") or has("e5"))
end

function can_mine_iron()
    return (has("SteelPick") or has("e40"))
end

function can_mine_gold()
    return (has("GoldPick") or has("e80"))
end

function has_skull_key()
    return has("skullkey")
end

function can_access_desert()
    return (has("desertwarp") or has ("bus"))
end

function can_access_island()
    return has("islandwarp")
end

function can_mine_iridium()
    return (has("IridiumPick") and ((can_access_desert() and has("skullkey")) or can_access_island()))
end

function can_fish()
    return has("rod")
end

function has_crab_pots()
    return (can_mine_iron() and has("fishing",3))
end

function can_chop_stumps()
    return has("CopperAxe")
end

function can_chop_logs()
    return has("SteelAxe")
end

function has_coop()
    return has("chicken")
end

function has_big_coop()
    return has("duck")
end

function has_deluxe_coop()
    return has("rabbit")
end

function has_barn()
    return has("cow")
end

function has_big_barn()
    return has("goat")
end

function has_deluxe_barn()
    return has("pig")
end

function has_bridge()
    return has("bridge")
end

function secret_notes()
    return has("notes")
end

function can_cook()
    return (has("kitchen") or has("foraging",9))
end

function exoticforagebundle()
    local amt = 0
    local need = 5
    if can_access_desert() then
        amt = amt + 2
    end
    if has("foraging",3) then
        amt = amt + 3
    end
    if can_chop_logs() then
        amt = amt + 1
    end
    if has("e40") then
        amt = amt + 2
    end
    if has("e80") then
        amt = amt + 1
    end
    return (amt >= need)
end

function animalbundle()
    local amt = 0
    local need = 5
    if has_barn() then
        amt = amt + 1
    end
    if has_big_barn() then
        amt = amt + 1
    end
    if has_coop() then
        amt = amt + 2
    end
    if has_big_coop() then
        amt = amt + 1
    end
    if (has_deluxe_coop() or has_deluxe_barn()) then
        amt = amt + 1
    end
    return (amt >= need)
end

function chefbundle()
    return (can_chop_logs() and has_deluxe_barn() and can_cook())
end

function dyebundle()
    return (has("e40") and has_big_coop() and (has("e80") or can_chop_logs()))
end

function fieldresearchbundle()
    return (has("e40") and can_fish())
end

function enchantbundle()
    return (has_deluxe_coop() and has("farming",8) and has("foraging",3))
end

function farming1()
    return has("farming",1)
end