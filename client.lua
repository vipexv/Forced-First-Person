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
            while true do
            sleep = 1000
            if IsPedInAnyVehicle(PlayerPedId()) then --Lets make an extra check. If ped is in a vehicle, then we wake the loop. else we put it back to sleep
                sleep = 1
                if IsPedDoingDriveby(PlayerPedId()) then
                    SetFollowVehicleCamViewMode(4)
                else
                    SetFollowVehicleCamViewMode(0)
                end
            else
                sleep = 1000
            end
            Wait(sleep)
            end
        end)
    end



if Config.EnteringVehicle then
    CreateThread(function()
        while true do
            sleep = 1000
            if IsPedInAnyVehicle(PlayerPedId()) then
                sleep = 1
            else
                sleep = 1000
        if GetPedInVehicleSeat(inVeh, -1) then
        SetFollowVehicleCamViewMode(4)
                end
            end
            Wait(sleep)
        end
    end)
end
