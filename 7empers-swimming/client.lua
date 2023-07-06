function CheckPlayerWaterStatus()
    local playerPed = PlayerPedId()
    if IsEntityInWater(playerPed) then
        local stam = GetAttributeCoreValue(playerPed, 1)
        Citizen.InvokeNative(0xC6258F41D86676E0, playerPed, 1, stam > 2 and stam or 5)
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        CheckPlayerWaterStatus()
    end
end)
