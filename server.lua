RegisterNetEvent("DRP_Peds:InitAll")
AddEventHandler("DRP_Peds:InitAll", function()
    local src = source
    local peds = DRPPeds.PedLoc
    TriggerClientEvent("DRP_Peds:Init", src, peds)
end)
