local isOpen = false
local mainMenu = RageUI.CreateMenu("Menu Staff", "Gestion du serveur")
local crypted = require("crypted")

-- Exemple d'utilisation de chiffrement pour enregistrer une action
local actionLog = "Admin a utilisé la commande /noclip."
local encryptedLog = crypted.encrypt(actionLog)

-- Enregistrer ce log chiffré dans un fichier (ou base de données sécurisée)
print("Log chiffré : " .. encryptedLog)

-- Déchiffrement lorsque nécessaire
local decryptedLog = crypted.decrypt(encryptedLog)
print("Log déchiffré : " .. decryptedLog)

-- Fonction pour ouvrir le menu staff
RegisterCommand("staffmenu", function()
    ESX.TriggerServerCallback('menu-staff:checkPermission', function(hasPermission)
        if hasPermission then
            isOpen = not isOpen
            RageUI.Visible(mainMenu, isOpen)
        else
            ESX.ShowNotification(Config.Messages.noPermission)
        end
    end)
end, false)

-- Boucle du menu
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if isOpen then
            RageUI.IsVisible(mainMenu, function()
                -- Option NoClip
                if Config.Options.noclip then
                    RageUI.Button("Activer NoClip", nil, {}, true, {
                        onSelected = function()
                            TriggerEvent("menu-staff:noclip")
                        end
                    })
                end

                -- Option GodMode
                if Config.Options.godmode then
                    RageUI.Button("Activer GodMode", nil, {}, true, {
                        onSelected = function()
                            TriggerEvent("menu-staff:godmode")
                        end
                    })
                end

                -- Option Revive
                if Config.Options.revive then
                    RageUI.Button("Réanimer un joueur", nil, {}, true, {
                        onSelected = function()
                            TriggerEvent("menu-staff:revive")
                        end
                    })
                end

                -- Option Téléportation
                if Config.Options.teleport then
                    RageUI.Button("Téléportation à un joueur", nil, {}, true, {
                        onSelected = function()
                            TriggerEvent("menu-staff:teleport")
                        end
                    })
                end
            end)
        end
    end
end)
