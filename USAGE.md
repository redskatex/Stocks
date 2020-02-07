### if you want take price of item in your script just use callback
### it return the actual price of item
```LUA
ESX.RegisterServerCallback("rdsk_borsa:getPrezzo", function(source, nome, cb)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    local Nome = nome

    MySQL.Async.fetchAll('SELECT * FROM borsa WHERE Nome=@Nome', {['@Nome'] = Nome}, function(result)
        local prezzo = result.Attuale
    cb(prezzo)
    end)
end)
```

### P.S nome is the name of item in db
### this callback give you back actual price