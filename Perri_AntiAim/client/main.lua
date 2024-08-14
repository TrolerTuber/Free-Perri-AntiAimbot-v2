

CreateThread(function()
    local test = false
    local PlayerId = PlayerId()
    local ped = PlayerPedId()
    local Press = IsControlPressed
    local Aiming = IsPlayerFreeAiming
    while true do
    
        if Press(0, 25) or Aiming(PlayerId) then
            Wait(500)
            if Press(0, 25) or Aiming(PlayerId) then
                test = true
            else

                test = false
            end
        end
        --
        if IsPedReloading(ped) or not Aiming(PlayerId) then
            test = false
        else
            test = true

        end
        --
        Wait(750)

        CreateThread(function()
            while test do
                
                if Press(0, 25) then
                    SetGameplayCamRelativeRotation(0)
                else

                    test = false
                end
                Wait(0)
            end
        end)

    end
end)

