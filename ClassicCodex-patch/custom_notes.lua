local customItemNotes = {
    [33993] = "Obtained by hexing a Forest Frog!", -- Mojo
    [33865] = "Used to hex Forest Frogs in ZA.",   -- Amani Hex Stick
    [23627] = "Purchased via Sealed Scroll Case (0.2% chance) from Forest Frog vendor in Zul'Aman",
}

local function AddCustomCodexNote(self)
    if self.CodexNoteAdded then return end

    local _, link = self:GetItem()
    if link then
        local itemId = tonumber(link:match("item:(%d+)"))
        if customItemNotes[itemId] then
            self:AddLine(" ") -- Top Spacer
            self:AddLine("|cff33ffccCodex Tip:|r " .. customItemNotes[itemId], 1, 1, 1, true)
            self:AddLine(" ") -- Bottom Spacer (The "Picky" fix)
            
            self.CodexNoteAdded = true
        end
    end
end

-- We also need to clear the flag when the tooltip is hidden/cleared
local function ClearCodexNoteFlag(self)
    self.CodexNoteAdded = false
end

GameTooltip:HookScript("OnTooltipSetItem", AddCustomCodexNote)
GameTooltip:HookScript("OnTooltipCleared", ClearCodexNoteFlag)

ItemRefTooltip:HookScript("OnTooltipSetItem", AddCustomCodexNote)
ItemRefTooltip:HookScript("OnTooltipCleared", ClearCodexNoteFlag)