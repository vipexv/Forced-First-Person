local ped = PlayerPedId()
local inVeh = IsPedInAnyVehicle(ped, true)

CreateThread(function()
    while true do
        Wait(1000)
        ped = PlayerPedId()
        inVeh = IsPedInAnyVehicle(ped, true)
    end
end)

if Config.Options.ForcedFirst then
    CreateThread(function()
        local plyId = PlayerId()

        while true do
            Wait(1)
            if IsPlayerFreeAiming(plyId) then
                SetFollowPedCamViewMode(4)
            else
                SetFollowPedCamViewMode(0)
            end
            if IsPedDoingDriveby(ped) then
                SetFollowVehicleCamViewMode(4)
            else
                SetFollowVehicleCamViewMode(0)
            end
        end
    end)
end

if Config.Options.VehicleOnly then
    CreateThread(function()
        while inVeh do
            Wait(1)
            if IsPedDoingDriveby(ped) then
                SetFollowVehicleCamViewMode(4)
            else
                SetFollowVehicleCamViewMode(0)
            end
        end
    end)
end
