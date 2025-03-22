ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('admin:kickPlayer')
AddEventHandler('admin:kickPlayer', function(targetId)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == 'admin' then -- Vérifie si l'admin a les droits
        local targetPlayer = ESX.GetPlayerFromId(targetId)
        if targetPlayer then
            DropPlayer(targetId, "Vous avez été expulsé par un administrateur.")
        end
    else
        print('Tentative de kick non autorisée par ' .. GetPlayerName(source))
    end
end)

RegisterNetEvent("staff:GiveCar")
AddEventHandler("staff:GiveCar", function(targetId, vehicleName)
    local xPlayer = ESX.GetPlayerFromId(targetId)
    if xPlayer then
        MySQL.Async.execute("INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)", {
            ["@owner"] = xPlayer.identifier,
            ["@plate"] = "STAFF" .. math.random(1000, 9999),
            ["@vehicle"] = json.encode({ model = GetHashKey(vehicleName), plate = "STAFF" .. math.random(1000, 9999) })
        })
        TriggerClientEvent("esx:showNotification", targetId, "Un staff vous a donné un véhicule: ~g~" .. vehicleName)
    end
end)

RegisterServerEvent('admin:addMoney')
AddEventHandler('admin:addMoney', function(amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == 'admin' then
        xPlayer.addMoney(amount)
        TriggerClientEvent('esx:showNotification', source, "Vous avez ajouté ~g~" .. amount .. "~s~$ au joueur.")
    end
end)
