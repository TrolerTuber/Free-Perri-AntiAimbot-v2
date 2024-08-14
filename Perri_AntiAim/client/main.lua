local firstSpawn = true

AddEventHandler('playerSpawned', function()
    if firstSpawn then
        firstSpawn = false


        CreateThread(function()
            local test = false
            local player = PlayerId()
            local ped = PlayerPedId()
            local ControlPressed = IsControlPressed
            local Aiming = IsPlayerFreeAiming

            while true do
                if ControlPressed(0, 25) or Aiming(player) then
                    Wait(500)
                    if ControlPressed(0, 25) or Aiming(player) then
                        test = true

                    else
                        test = false

                    end
                end

                if IsPedReloading(ped) or not Aiming(player) then
                    test = false
                else

                    test = true
                end

                Wait(750)

                CreateThread(function()
                    while test do
                        if ControlPressed(0, 25) then
                            SetGameplayCamRelativeRotation(0, 0, 0)
                        else

                            test = false
                        end
                        
                        Wait(0)
                    end
                end)
            end
        end)
    end
end)
