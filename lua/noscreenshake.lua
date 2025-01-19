-- ORIGINAL MOD: https://modworkshop.net/mod/34446

dofile(ModPath .. "core.lua")
if SniffUtils:GetOption("no_screen_shake") then
    PlayerCamera.play_shaker = function(self) return 0 end
end
