local ped = PlayerPedId()
local inVeh = IsPedInAnyVehicle(ped, true)

if Config.Options.ForcedFirst then 
CreateThread(function()
        while true do
            sleep = 1000
            local weapon = GetCurrentPedWeapon(PlayerPedId())
            local unarmed = "WEAPON_UNARMED"
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
            if IsPedInAnyVehicle(PlayerPedId()) then
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
