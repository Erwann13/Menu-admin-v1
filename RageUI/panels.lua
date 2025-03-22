RageUI = RageUI or {}

RageUI.Panels = {}

-- 📊 Barre de progression
function RageUI.Panels.Progress(label, value, min, max)
    return {
        type = "progress",
        label = label,
        value = value or min,
        min = min,
        max = max
    }
end

-- 🎚️ Slider avancé avec un panneau
function RageUI.Panels.AdvancedSlider(label, min, max, step, value, callback)
    return {
        type = "advanced_slider",
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

-- 📈 Panneau Statistiques
function RageUI.Panels.StatsPanel(title, stats)
    return {
        type = "stats",
        title = title,
        stats = stats or {}
    }
end
