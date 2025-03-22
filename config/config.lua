Config = {}

-- Groupes autorisés à utiliser le menu staff
Config.AllowedGroups = {
    "help", --Helpeur
    "mod", --Modo
    "admin", --Admin
    "superadmin", --GÃ©rant Staff
    "owner", --GÃ©rant Staff
    "_dev" --Fondateur
}

-- Activer ou désactiver certaines options du menu
Config.Options = {
    noclip = true,      -- Activer NoClip
    godmode = true,     -- Activer le mode invincible
    revive = true,      -- Activer l'option Revive
    teleport = true,    -- Activer la téléportation
    GiveCar = true,    -- Activer le give car
    giveweapon = false  -- Désactiver Give Weapon
}

-- Messages personnalisés
Config.Messages = {
    noPermission = "❌ Vous n'avez pas la permission d'utiliser ce menu.",
    noclipOn = "🚀 NoClip activé.",
    noclipOff = "🛑 NoClip désactivé.",
    godmodeOn = "💪 Mode invincible activé.",
    godmodeOff = "⚠️ Mode invincible désactivé.",
    revived = "💉 Vous avez été réanimé.",
    teleported = "📍 Téléportation effectuée."
}

local staffMenu = RageUI.CreateMenu("Menu Staff", "Gestion des joueurs")

-- 🔵 Ajouter un bouton "NoClip"
staffMenu:AddButton("Activer NoClip", "Active/Désactive le mode vol", function()
    TriggerEvent("menu-staff:noclip")
end)

-- ✅ Ajouter une case à cocher "GodMode"
local godmodeState = false
staffMenu:AddCheckbox("Activer GodMode", godmodeState, function(state)
    godmodeState = state
    TriggerEvent("menu-staff:godmode", state)
end)

-- 📜 Ajouter une liste "Sanctions"
local sanctions = {"Avertissement", "Kick", "Ban 1 jour", "Ban permanent"}
local selectedSanction = 1

staffMenu:AddList("Sanctionner un joueur", sanctions, selectedSanction, function(index)
    selectedSanction = index
    print("Sanction sélectionnée : " .. sanctions[index])
end)

-- 🎚️ Ajouter un slider pour la vitesse du NoClip
local speed = 1.0
staffMenu:AddSlider("Vitesse NoClip", 0.5, 5.0, 0.5, speed, function(value)
    speed = value
    TriggerEvent("menu-staff:setNoClipSpeed", value)
end)

-- Commande pour ouvrir le menu
RegisterCommand("staffmenu", function()
    staffMenu:SetVisible(not staffMenu.isVisible)
end, false)

-- Boucle pour afficher le menu
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        staffMenu:Render()
    end
end)

local staffMenu = RageUI.CreateMenu("Menu Staff", "Gestion avancée")

-- 📊 Ajouter une barre de progression pour la santé du joueur
local health = 100
staffMenu:AddPanel(RageUI.Panels.Progress("Santé", health, 0, 100))

-- 🎚️ Ajouter un slider avancé pour la vitesse du NoClip
local speed = 1.0
staffMenu:AddPanel(RageUI.Panels.AdvancedSlider("Vitesse NoClip", 0.5, 5.0, 0.5, speed, function(value)
    speed = value
    TriggerEvent("menu-staff:setNoClipSpeed", value)
end))

-- 📈 Ajouter un panneau de statistiques joueur
local playerStats = {
    {label = "Kills", value = 10},
    {label = "Deaths", value = 3},
    {label = "Temps de jeu", value = "2h30m"}
}
staffMenu:AddPanel(RageUI.Panels.StatsPanel("Statistiques du joueur", playerStats))

-- Commande pour ouvrir le menu
RegisterCommand("staffmenu", function()
    staffMenu:SetVisible(not staffMenu.isVisible)
end, false)

-- Boucle pour afficher le menu
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        staffMenu:Render()
    end
end)

local staffMenu = RageUI.CreateMenu("Menu Staff", "Gestion avancée")

-- 📌 Ajouter une fenêtre d'informations sur le menu
staffMenu:AddWindow(RageUI.Windows.Info("Bienvenue", "Utilisez ce menu pour gérer les joueurs et le serveur."))

-- 👤 Ajouter une fenêtre d'infos sur un joueur
local playerName = "John_Doe"
local playerID = 12
local playerPing = 45
local playerJob = "Police"

staffMenu:AddWindow(RageUI.Windows.PlayerInfo(playerName, playerID, playerPing, playerJob))

-- 📜 Ajouter une fenêtre avec les logs des actions staff
local logs = {
    "[ADMIN] John_Doe a kick un joueur.",
    "[ADMIN] Jane_Doe a utilisé NoClip.",
    "[ADMIN] Alex a banni un cheater."
}

staffMenu:AddWindow(RageUI.Windows.Logs("Logs Administratifs", logs))

-- Commande pour ouvrir le menu
RegisterCommand("staffmenu", function()
    staffMenu:SetVisible(not staffMenu.isVisible)
end, false)

-- Boucle pour afficher le menu
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        staffMenu:Render()
    end
end)

