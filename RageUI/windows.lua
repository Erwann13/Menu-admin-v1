RageUI = RageUI or {}

RageUI.Windows = {}

-- 📌 Création d'une fenêtre d'informations
function RageUI.Windows.Info(title, description)
    return {
        type = "info",
        title = title,
        description = description
    }
end

-- 👤 Fenêtre de détails joueur
function RageUI.Windows.PlayerInfo(name, id, ping, job)
    return {
        type = "player_info",
        name = name,
        id = id,
        ping = ping,
        job = job
    }
end

-- 📜 Fenêtre des logs administratifs
function RageUI.Windows.Logs(title, logs)
    return {
        type = "logs",
        title = title,
        logs = logs or {}
    }
end
