# Changelog

## Beta 1.2.2 Update

More consistency updates
-"A Demonstration of Loyalty" update to match Anniversary realm.
-"Hogger" quest title had an extra space which made /codex quest Hogger search impossible.
-Some quest items were sourced from containers which were sourced by a vendor.  
    It meant that there was no direct connection from a quest item and a vendor.  A comment ability was added so that clarification could be added without breaking the DB structure (custom_notes.lua).
-Some quests were set up for wotlk positions and were moved back to tbc.


## Beta 1.2.1 (Hotfix)

- **Fixed "Faded/Washed-out" UI Text: Resolved an issue where the Quest Browser text appeared faint or transparent on some characters.
    Normalized Frame Layers: Hard-coded the FrameLevel to (1) to prevent the TBC Anniversary engine from "inflating" layers (Z-fighting), ensuring the background and text render correctly by default.
    Improved First-Time Setup: New characters will no longer require layout-local.txt resets to see a crisp, clear UI.

## Beta 1.1 - The "High-Visibility" Update
- **UI Fix**: Resolved "ghostly" faded text and icons in the browser results.
- **Scaling**: Optimized for 1440p and 3440px (Ultrawide) monitor resolutions.
- **Stability**: Restored core scroll-clipping logic to prevent overlapping lines.
- **Interaction**: Fixed U, O, and V action buttons in the Items tab.

## Beta 1.0 - The "Pure TBC" Update
- **Surgical Trim**: Removed all Northrend (WotLK) data (Items, NPCs, Objects, Quests).
- **Level Cap**: Removed Inscription and Level 80 profession caps (450).
- **Error Fix**: Patched "nil value" Lua errors during login.

# ClassicCodex core (Incompatible)

## [v1.5.3](https://github.com/SwimmingTiger/ClassicCodex/tree/v1.5.3) (2024-07-25)
[Full Changelog](https://github.com/SwimmingTiger/ClassicCodex/compare/v1.5.2...v1.5.3) 

- update interface version to 30403  
- fix Lua error on WotLK 3.4.3 China  
- Correctly enforce patch loc behavior  
- add ptBR to locale list  
