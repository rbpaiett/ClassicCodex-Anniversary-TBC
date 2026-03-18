-- Fix for Anniversary Settings API
if not InterfaceOptions_AddCategory then
    InterfaceOptions_AddCategory = function(frame)
        local category, layout = Settings.RegisterCanvasLayoutCategory(frame, frame.name or frame.text)
        Settings.RegisterAddOnCategory(category)
        return category
    end
end

-- Compatibility Header
if not IsAddOnLoadOnDemand then IsAddOnLoadOnDemand = C_AddOns.IsAddOnLoadOnDemand end
if not LoadAddOn then LoadAddOn = C_AddOns.LoadAddOn end

-- ClassicCodex loader
CodexDatabaseReady = false -- THIS IS THE SAFETY GATE

local L = LibStub("AceLocale-3.0"):GetLocale("ClassicCodex")

local function tryLoad(name)
    if IsAddOnLoadOnDemand(name) then
        return LoadAddOn(name)
    end
    return false
end

-- The logic that handles the heavy lifting
local function StartCodex()
    -- 1. Load base database
    if not tryLoad('ClassicCodex-db') then return end

    -- 2. Load database locales
    local locale = GetLocale()
    if not tryLoad('ClassicCodex-db-'..locale) then
        tryLoad('ClassicCodex-db-enUS')
    end

    -- 3. Load core & patch
    if tryLoad('ClassicCodex') then
        tryLoad('ClassicCodex-patch')
        -- NOW we open the gate
        CodexDatabaseReady = true 
        print("|cff00ff00[ClassicCodex] Database Ready!|r")
    end
end

-- Wait for the player to be fully in-game, then wait 5 seconds for the "heavy" load
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    C_Timer.After(5, StartCodex)
end)