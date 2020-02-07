### Load sql file in your database
database.sql

row spec.
ID = Primary auto_increment
Nome = Name of object in items table
Label = Name showed in gcphone
Attuale = Actual price , change every time stocks change [do not insert any value]
Min = Minium price of item
Max = Maxium price of item
Med = medion value [do not insert any value]

### Installation, Replace at line 528 on server.lua of your gcphone the function getBourse()

```LUA
function getBourse()
	
	nome = {}
	prezzo = {}
	medio = {}
	differenza = {}

	local result = MySQL.Sync.fetchAll("SELECT * FROM borsa",{})

	local qnt = #result
	for i=1, qnt, 1 do
		nome[i] = result[i].Label
		prezzo[i] = result[i].Attuale
		medio[i] = result[i].Med

		differenza[i] = prezzo[i] - medio[i]

	end

	local result = {}
	for i=1, qnt, 1 do
		local line = {libelle = nome[i], price = prezzo[i], difference = differenza[i]}
		table.insert(result, line)
	end
	return result
end
```

### Fix for arrow in Gcphone - Replace in app.js at line 2300

### this
```JavaScript
return 0 === t.difference ? ["fa-arrow-right", "iblue"] : t.difference < 0 ? ["fa-arrow-up", "ired"] : ["fa-arrow-down", "igreen"]
```
### whit this
```JavaScript
return 0 === t.difference ? ["fa-arrow-right", "iblue"] : t.difference < 0 ? ["fa-arrow-down", "igreen"] : ["fa-arrow-up", "ired"]
```

### Cfg start

start rdsk_borsa
start gcphone


### DISCORD FOR MORE RESOURCE
https://discord.gg/c5Q8qRa