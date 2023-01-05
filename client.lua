local ped = PlayerPedId()
local inVeh = IsPedInAnyVehicle(ped, true)

if Config.Options.ForcedFirst then 
    CreateThread(function()
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
    end)
end


if Config.Options.Vehicle then
CreateThread(function()
    while true do
        sleep = 1000
        local _, weapon = GetCurrentPedWeapon(ped)
        local unarmed = `WEAPON_UNARMED`
        if inVeh and weapon ~= unarmed then
            sleep = 1
            if IsPedDoingDriveby(ped) then
                SetFollowVehicleCamViewMode(4)
            else
                SetFollowVehicleCamViewMode(0)
                end
            end
            Wait(sleep)
        end
    end)
end


if Config.Options.Bike then
    CreateThread(function()
        while true do
            sleep = 1000
            local _, weapon = GetCurrentPedWeapon(PlayerPedId())
            local unarmed = `WEAPON_UNARMED`
            if IsPedOnAnyBike(PlayerPedId()) and weapon ~= unarmed then
                sleep = 1
                if IsControlJustPressed(0, 25) then
                    SetCamViewModeForContext(2, 4)
                elseif IsControlJustReleased(0, 25) then
                    SetCamViewModeForContext(2, 0)
                end
            else
                sleep = 1000
            end
            Wait(sleep)
        end
    end)
end
