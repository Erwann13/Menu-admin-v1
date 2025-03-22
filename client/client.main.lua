local menuOpen = false

-- Créer le thread pour gérer l'ouverture du menu
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) -- Permet de maintenir une exécution fluide et de ne pas bloquer le serveur

        -- Vérifier si la touche F10 (ID = 57) est pressée pour ouvrir le menu admin
        if IsControlJustReleased(0, 57) then
            menuOpen = not menuOpen  -- Toggle entre ouvert et fermé
        end

        -- Si le menu est ouvert, afficher l'interface avec RageUI
        if menuOpen then
            -- Créer le menu admin
            RageUI.IsVisible(adminMenu, function()
                -- Bouton Kick un joueur
                RageUI.Button("Kick un joueur", "Expulser un joueur du serveur", {}, true, {
                    onSelected = function()
                        local players = ESX.GetPlayers() -- Récupère la liste des joueurs en ligne
                        local playerIds = {}

                        -- Construire la liste des joueurs avec leurs noms et ID
                        for _, playerId in ipairs(players) do
                            local playerName = GetPlayerName(playerId)
                            table.insert(playerIds, {label = playerName, value = playerId})
                        end

                        -- liste de vheicul pour les give
                        local vehicleList = { "adder", "zentorno", "t20", "police", "ambulance" } -- Liste des véhicules disponibles

                        RageUI.Button("Donner un véhicule", nil, { RightLabel = "→" }, true, {
                            onSelected = function()
                                local player, distance = ESX.Game.GetClosestPlayer()
                                if player ~= -1 and distance < 3.0 then
                                    local playerId = GetPlayerServerId(player)
                                    local vehicleName = "adder" -- Remplace par un input si besoin
                                    TriggerServerEvent("staff:GiveCar", playerId, vehicleName)
                                    ESX.ShowNotification("Vous avez donné une ~g~" .. vehicleName .. "~s~ au joueur.")
                                else
                                    ESX.ShowNotification("~r~Aucun joueur à proximité.")
                                end
                            end
                        })
                        

                        -- Afficher la liste des joueurs pour choisir un joueur à kick
                        RageUI.List("Choisir un joueur", playerIds, 1, nil, {}, true, {
                            onSelected = function(index, item)
                                local targetId = item.value
                                -- Lancer l'événement serveur pour expulser un joueur
                                TriggerServerEvent('admin:kickPlayer', targetId)
                            end
                        })
                    end
                })

                -- Bouton Give cash (Donner de l'argent)
                RageUI.Button("Give cash", "Donner de l'argent", {}, true, {
                    onSelected = function()
                        local playerPed = GetPlayerPed(-1)  -- Récupère le joueur actuel
                        local amount = 1000  -- Exemple d'argent à donner
                        -- Lancer l'événement serveur pour donner de l'argent
                        TriggerServerEvent('admin:addMoney', amount)
                    end
                })

                -- Ajoute d'autres actions ici si nécessaire

            end)

        end -- Fin du menu ouvert
    end
end)
