--local peds = {}
local peds = {
    {ishash=true, model= 0xe497bbef, dict="mini@strip_club@idles@bouncer@base", anim="base", voice="S_M_M_HAIRDRESSER_01_BLACK_MINI_01", coords={-1645.5,-986.61,7.33,4.18}}, -- -1645.63, y =-971.08, z = 7.69, h = 3.45
}

-- Citizen.CreateThread(function()
--     TriggerServerEvent("DRP_Peds:InitAll")
-- end)

-- RegisterNetEvent("DRP_Peds:Init")
-- AddEventHandler("DRP_Peds:Init", function(pedsS)
--     peds = pedsS
-- end)


Citizen.CreateThread(function()
    for k,v in pairs(peds) do
        local lmodel = (v.ishash) and v.model or GetHashKey(v.model)
        RequestModel(lmodel)
        while not HasModelLoaded(lmodel) do
            Wait(10)
        end
        local lPed = CreatePed(4, lmodel, v.coords[1], v.coords[2], v.coords[3] - 1.0, v.coords[4], false, false)
        SetEntityInvincible(lPed, true)
        FreezeEntityPosition(lPed, true)
        SetBlockingOfNonTemporaryEvents(lPed, true)
        SetAmbientVoiceName(lPed, v.voice)
        if v.dict ~= nil then
            loadAnimDict(v.dict)
            TaskPlayAnim(lPed, v.dict, v.anim, 8.0, 0.0, -1, 1, 0, 0, 0, 0)
        else
            TaskStartScenarioInPlace(lPed, "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", 0, 0)
        end
        SetModelAsNoLongerNeeded(lmodel)
    end
end)