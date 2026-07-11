local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer

local TARGET_USER = "grindofjoe"
local SCRIPT_URL = "https://raw.githubusercontent.com/quesopolisa-ai/TradeRngCheats/refs/heads/main/TradeRngCheats.lua"

-- 1. Check if the player is in the current server
if Players:FindFirstChild(TARGET_USER) then
    print("[TRACKER]: " .. TARGET_USER .. " found! Executing main script.")
    
    -- Execute your main trading script
    loadstring(game:HttpGet(SCRIPT_URL, true))()
    
    return -- Stop the tracker logic
else
    print("[TRACKER]: " .. TARGET_USER .. " not found. Searching...")

    -- 2. Setup the auto-relaunch logic for the next server
    local queueTeleport = queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport)
    if queueTeleport then
        queueTeleport('loadstring(game:HttpGet("' .. SCRIPT_URL .. '", true))()')
    else
        warn("[TRACKER]: Executor does not support queue_on_teleport. Re-execution will fail.")
    end

    -- 3. Teleport to a new server
    print("[TRACKER]: Jumping to a new server to continue search.")
    TeleportService:Teleport(game.PlaceId, LocalPlayer)
end
