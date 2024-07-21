-- ORIGINAL MOD: https://modworkshop.net/mod/34297

dofile(ModPath .. "core.lua")
if SniffUtils:GetOption("short_colors") then

    local text_original = LocalizationManager.text
    local testAllStrings = false  --Set to true to show all string ID's, false to return to normal.
    function LocalizationManager:text(string_id, ...)

    return string_id == "bm_global_value_collectable" and "Free"
    or string_id == "bm_global_value_wcs" and "Colors #1"
    or string_id == "bm_global_value_wcc" and "Colors #2"
    or string_id == "bm_global_value_ocp" and "Colors #3"
    or string_id == "bm_global_value_faco" and "Jiu Feng #1"
    or string_id == "bm_global_value_sawp" and "Jiu Feng #2"
    or string_id == "bm_global_value_tawp" and "Jiu Feng #3"
    or string_id == "bm_global_value_lawp" and "Jiu Feng #4"
    or string_id == "bm_global_value_sbzac2" and "SB"
    or string_id == "bm_global_value_snow" and "Winter"
    or string_id == "bm_global_value_tma1" and "Tijuana"

    or testAllStrings == true and string_id
    or text_original(self, string_id, ...)
    end
end