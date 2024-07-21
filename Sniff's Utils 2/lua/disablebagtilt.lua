-- ORIGINAL MOD: https://modworkshop.net/mod/16487

dofile(ModPath .. "core.lua")
if SniffUtils:GetOption("disable_bag_tilt") then
PlayerCarry.target_tilt = 0 --original: -5