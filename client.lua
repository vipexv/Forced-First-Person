Citizen.CreateThread(function()
    while true do
        Wait(1)
         if Config.Options.ForcedFirst then
            if IsPlayerFreeAiming(PlayerId()) then
                SetFollowPedCamViewMode(4)
            else
                SetFollowPedCamViewMode(0)
            end
                if IsPedDoingDriveby(PlayerPedId()) then
                        SetFollowVehicleCamViewMode(4)
                    else
                        SetFollowVehicleCamViewMode(0)
            end
         end
    end
end)





Citizen.CreateThread(function()
	while true do
		Wait(1)
        if Config.Options.VehicleOnly then
            if IsPedDoingDriveby(PlayerPedId()) then
                    SetFollowVehicleCamViewMode(4)
            else
                SetFollowVehicleCamViewMode(0)
                        end
                    end
               end
            end)




