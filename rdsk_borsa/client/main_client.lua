ESX = nil
local second = 1000
local minute = 60 * second
local hour = 60 * minute


-- ESX --
Citizen.CreateThread(function()
    while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	end
end)

local display = false

-- PREZZI INIZIALI --
AddEventHandler('onClientResourceStart', function (resourceName)
  if(GetCurrentResourceName() ~= resourceName) then
    return
  end
  TriggerServerEvent("rdsk_borsa:GeneraPrezzi", object)
  TriggerServerEvent("gcPhone:allUpdate")
  while true do
    Citizen.Wait(Config.time * hour)
    TriggerServerEvent("rdsk_borsa:GeneraPrezzi", object)
    TriggerServerEvent("gcPhone:allUpdate")
  end
end)
