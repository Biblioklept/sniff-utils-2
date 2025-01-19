-- ORIGINAL MOD: https://modworkshop.net/mod/17257

dofile(ModPath .. "core.lua")
if SniffUtils:GetOption("no_menu_transitions") then
    MenuComponentManager.play_transition = function() end
end