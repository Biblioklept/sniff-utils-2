-- ORIGINAL MOD: https://modworkshop.net/mod/39838

dofile(ModPath .. "core.lua")
if SniffUtils:GetOption("health_flash_fix") then
if RequiredScript == "lib/managers/hud/hudteammate" then
    local HUDTeammate_set_health = HUDTeammate.set_health

    function HUDTeammate:set_health(data)
        if data.current == self._health_data.current and data.total == self._health_data.total then
            return
        end
        
        HUDTeammate_set_health(self, data)
    end
end