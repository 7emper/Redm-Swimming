local boatsInvincible = true -- Sets all boats to be invincible
local noSinkZone = true -- Stops boats from sinking when past the sink zone border
local infSwim = true -- Allows infinite swimming, similar to GTA 5 swimming
local StaminaLevel = 10 -- stamina level you want to keep while swimming recommended value is - 10 otherwhise players can just get max stam core if they swim.

function CheckPlayerWaterStatus()
    if IsPedSwimming(PlayerPedId()) and infSwim then
        local stam = GetAttributeCoreValue(PlayerPedId(), 1)
        if stam < StaminaLevel then
            Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, StaminaLevel)
        end
    end
end

function StopBoatFromSinking()
    local ped = PlayerPedId()
    if IsPedInAnyBoat(ped) then
        local veh = GetVehiclePedIsIn(ped, false)
        SetEntityInvincible(veh, boatsInvincible)
    end
end

function ApplySinkZone()
    if noSinkZone then
        Citizen.InvokeNative(0xC1E8A365BF3B29F2, PlayerPedId(), 364, 1) -- Stop boat from sinking past sink zones
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        CheckPlayerWaterStatus()
        ApplySinkZone()
        StopBoatFromSinking()
    end
end)
