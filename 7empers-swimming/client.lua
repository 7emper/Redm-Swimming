function CheckPlayerWaterStatus()
    if IsEntityInWater(PlayerPedId()) then
        local stam = GetAttributeCoreValue(PlayerPedId(), 1)
        if stam > 2 then
            Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, stam)
        else
            Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, 5)
        end
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        CheckPlayerWaterStatus()
    end
end)
