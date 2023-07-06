boatsinvincible = true -- Sets all boats to be invincible
NoSinkZone = true -- stops boats from sinking when past the sink zone border
InfSwim = true -- allows infinite swimming, similar to gta 5 swimming

--no touchy below this, unless you know what you're doing!

function CheckPlayerWaterStatus()
    if IsPedSwimming(PlayerPedId()) and InfSwim then
        local stam = GetAttributeCoreValue(PlayerPedId(), 1)
        Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, stam > 2 and stam or 5)
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

function SinkZone()
    if NoSinkZone then
        Citizen.InvokeNative(0xC1E8A365BF3B29F2, PlayerPedId(), 364, 1) -- stop boat from sinking past sink zones
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        CheckPlayerWaterStatus()
        SinkZone()
        if boatsinvincible then
            StopBoatFromSinking()
        end
    end
end)
