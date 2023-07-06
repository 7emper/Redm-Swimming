Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        -- Check if the player is in water
        if IsEntityInWater(PlayerPedId()) then
            stam = GetAttributeCoreValue(PlayerPedId(), 1)
            if stam > 2 then
                --print(stam)
                Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, stam)
            else
                Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, 5)
            end
        else
            -- Do nothing
        end
    end
end)
