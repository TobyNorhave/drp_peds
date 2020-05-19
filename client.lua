Citizen.CreateThread(function()
    TriggerServerEvent("DRP_Peds:InitAll")
end)

RegisterNetEvent("DRP_Peds:Init")
AddEventHandler("DRP_Peds:Init", function(peds)
    spawnPeds(peds)
end)

function deleteOldPeds()

end

function spawnPeds(peds)
    for a = 1, #peds, 1 do
        local lmodel = GetHashKey(peds[a].model)
        RequestModel(lmodel)
        while not HasModelLoaded(lmodel) do
            Wait(10)
        end
        local lPed = CreatePed(4, lmodel, peds[a].coords.x, peds[a].coords.y, peds[a].coords.z - 0.95, peds[a].coords.h, false, false)

        SetEntityInvincible(lPed, true)
        FreezeEntityPosition(lPed, true)
        SetBlockingOfNonTemporaryEvents(lPed, true)
        SetAmbientVoiceName(lPed, peds[a].voice)
        if peds[a].dict ~= nil then
            -- loadAnimDict("mini@strip_club@idles@bouncer@base")
            -- TaskPlayAnim(lPed, peds[a].dict, peds[a].anim, 8.0, 0.0, -1, 1, 0, 0, 0, 0)
        else
            TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", 0, 0)
        end
        SetModelAsNoLongerNeeded(lmodel)
    end
end
