ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


-- GENERA PREZZI ATTUALI BORSA --
RegisterServerEvent('rdsk_borsa:GeneraPrezzi')
AddEventHandler('rdsk_borsa:GeneraPrezzi', function()

    MySQL.Async.fetchAll('SELECT * FROM borsa', {}, function(result)

        for i=1, #result, 1 do

            local id = result[i].ID

            local nome = result[i].Nome
            local attuale = result[i].Attuale
            local min = result[i].Min
            local max = result[i].Max 
            local med = result[i].Med
    
            local med = ((min + max) / 2)

            local rnd = math.random(min, max)
    
            MySQL.Async.execute('UPDATE borsa SET Attuale=@RND , Med=@MED WHERE ID=@ID',
                {
                    ['@RND'] = rnd,
                    ['@MED'] = med,
                    ['@ID'] = id
                })
        end

    end)

end)


ESX.RegisterServerCallback("rdsk_borsa:getPrezzo", function(source, nome, cb)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    local Nome = nome

    MySQL.Async.fetchAll('SELECT * FROM borsa WHERE Nome=@Nome', {['@Nome'] = Nome}, function(result)
        local prezzo = result.Attuale
    cb(prezzo)
    end)
end)

