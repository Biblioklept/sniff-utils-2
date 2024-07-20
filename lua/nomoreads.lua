-- ORIGINAL MOD: https://modworkshop.net/mod/34268
-- Every file the original mod includes has been bundled here, each function equals one file

dofile(ModPath .. "core.lua")
if SniffUtils:GetOption("hide_ads") then
	function MenuCallbackHandler:get_latest_dlc_locked()
		return false
	end

	function MenuComponentManager.create_new_heists_gui()
		return
	end
end