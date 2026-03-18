-- Fix for Anniversary Settings API (Replaces deprecated InterfaceOptions)
if not InterfaceOptions_AddCategory then
    InterfaceOptions_AddCategory = function(frame)
        local category, layout = Settings.RegisterCanvasLayoutCategory(frame, frame.name or frame.text)
        Settings.RegisterAddOnCategory(category)
        return category
    end
end

-- Compatibility Header for Anniversary TBC (2.05.05)
if not IsAddOnLoadOnDemand then IsAddOnLoadOnDemand = C_AddOns.IsAddOnLoadOnDemand end
if not LoadAddOn then LoadAddOn = C_AddOns.LoadAddOn end
if not GetAddOnMetadata then GetAddOnMetadata = C_AddOns.GetAddOnMetadata end
if not GetAddOnInfo then GetAddOnInfo = C_AddOns.GetAddOnInfo end

-- ClassicCodex loader

local L = LibStub("AceLocale-3.0"):GetLocale("ClassicCodex")

local function log(...)
    print(L['[ClassicCodex]'], ...)
end

local function tryLoad(name)
    if IsAddOnLoadOnDemand(name) then
        return LoadAddOn(name)
    else
        log(L['Missing component %s']:format(name))
        return false
    end
end

-- load database
if not tryLoad('ClassicCodex-db') then
    log(L['Failed to load database, ClassicCodex cannot be launched'])
    return
end

-- load database locales
if not tryLoad('ClassicCodex-db-'..GetLocale()) then
    if not tryLoad('ClassicCodex-db-enUS') then
        log(L['Failed to load database locales, ClassicCodex cannot be launched'])
        return
    end
end

-- load core
if not tryLoad('ClassicCodex') then
    log(L['Failed to load ClassicCodex core, ClassicCodex cannot be launched'])
    return
end

-- load patch
if not tryLoad('ClassicCodex-patch') then
    log(L['Unable to load database patch, quest data may be inaccurate'])
end
