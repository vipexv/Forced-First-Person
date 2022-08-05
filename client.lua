local ped = PlayerPedId()
local inVeh = IsPedInAnyVehicle(ped, true)

CreateThread(function()
    while true do
        Wait(1000)
        ped = PlayerPedId()
        inVeh = IsPedInAnyVehicle(ped, true)
    end
end)


CreateThread(function()
    if Config.Options.ForcedFirst then 
        while true do
            sleep = 1000
            local _, weapon = GetCurrentPedWeapon(PlayerPedId())
            local unarmed = `WEAPON_UNARMED`
            if weapon == unarmed then
                sleep = 1000
            else
                sleep = 1
                if IsPlayerFreeAiming(PlayerId()) then
                    SetFollowPedCamViewMode(4)
                else
                    SetFollowPedCamViewMode(0)
                end
            end
        Wait(sleep)
        end
    end
end)


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
