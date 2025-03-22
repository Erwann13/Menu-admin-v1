RageUI = RageUI or {}

RageUI.Elements = {}

-- 📌 Ajout d'un bouton simple
function RageUI.Elements.AddButton(label, description, callback)
    return {
        type = "button",
        label = label,
        description = description,
        callback = callback
    }
end

-- 📌 Ajout d'une case à cocher (Checkbox)
function RageUI.Elements.AddCheckbox(label, state, callback)
    return {
        type = "checkbox",
        label = label,
        state = state or false,
        callback = callback
    }
end

-- 📌 Ajout d'une liste déroulante
function RageUI.Elements.AddList(label, items, index, callback)
    return {
        type = "list",
        label = label,
        items = items,
        index = index or 1,
        callback = callback
    }
end

-- 📌 Ajout d'un slider (ex: volume, vitesse)
function RageUI.Elements.AddSlider(label, min, max, step, value, callback)
    return {
        type = "slider",
        label = label,
        min = min,
        max = max,
        step = step,
        value = value or min,
        callback = callback
    }
end
