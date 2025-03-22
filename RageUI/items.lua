RageUI = RageUI or {}

RageUI.Items = {}

-- 📌 Gestion des Boutons
function RageUI.Items.Button(label, description, callback)
    return {
        type = "button",
        label = label,
        description = description,
        callback = function()
            if callback then
                callback()
            end
        end
    }
end

-- 📌 Gestion des Cases à cocher (Checkbox)
function RageUI.Items.Checkbox(label, state, callback)
    return {
        type = "checkbox",
        label = label,
        state = state or false,
        callback = function(newState)
            if callback then
                callback(newState)
            end
        end
    }
end

-- 📌 Gestion des Listes déroulantes
function RageUI.Items.List(label, items, index, callback)
    return {
        type = "list",
        label = label,
        items = items,
        index = index or 1,
        callback = function(newIndex)
            if callback then
                callback(newIndex)
            end
        end
    }
end

-- 📌 Gestion des Sliders (ex: vitesse, volume)
function RageUI.Items.Slider(label, min, max, step, value, callback)
    return {
        type = "slider",
        label = label,
        min = min,
        max = max,
        step = step,
        value = value or min,
        callback = function(newValue)
            if callback then
                callback(newValue)
            end
        end
    }
end
