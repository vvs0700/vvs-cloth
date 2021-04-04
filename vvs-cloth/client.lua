CreateThread(function() while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Wait(0) end
end)

RegisterNetEvent("vvs:cleaningcloth")
AddEventHandler("vvs:cleaningcloth", function()
	local playerPed = PlayerPedId()
	local vehicle   = ESX.Game.GetVehicleInDirection()
	local coords    = GetEntityCoords(playerPed)

	if DoesEntityExist(vehicle) then
		TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_MAID_CLEAN', 0, true)
		Citizen.CreateThread(function()
		exports['progressBars']:startUI(10000, "Ciscenje...")
		Citizen.Wait(10000)
		SetVehicleDirtLevel(vehicle, 0)
		ClearPedTasksImmediately(playerPed)

	if SetVehicleDirtLevel(vehicle, 0) then
		exports['mythic_notify']:DoHudText('success', 'Vozilo je ociscenjo')
			end
		end)
	end
end)