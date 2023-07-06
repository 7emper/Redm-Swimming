boatsinvincible = true -- Sets all boats to be invincible

function CheckPlayerWaterStatus()
    local playerPed = PlayerPedId()
    if IsEntityInWater(playerPed) then
        local stam = GetAttributeCoreValue(playerPed, 1)
        Citizen.InvokeNative(0xC6258F41D86676E0, playerPed, 1, stam > 2 and stam or 5)
    end
end

function StopBoatFromSinking()
    if IsPedInAnyBoat(PlayerPedId()) then
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        local health = GetEntityMaxHealth(veh)
        SetEntityInvincible(veh, true)
    else
        SetEntityInvincible(veh, false)
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        CheckPlayerWaterStatus()
        if boatsinvincible then
            StopBoatFromSinking()
        end
    end
end)
