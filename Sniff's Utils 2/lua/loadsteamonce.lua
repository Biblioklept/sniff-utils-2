-- ORIGINAL MOD: https://modworkshop.net/mod/24008
-- Every file the original mod includes has been bundled here, each function equals one file

Hooks:PostHook(BlackMarketGui, "create_steam_inventory", "post_steam_inventory_creation", function(self)
    managers.network.account._inventory_loaded = false
    managers.network.account:inventory_load()
end)

Hooks:PostHook(NetworkAccountSTEAM, "init", "nas_post_init_var", function(self)
    self._inventory_loaded = false
end)

function NetworkAccountSTEAM:inventory_load()
    if self._inventory_loaded then
        --log("inventory already loaded, return.")
        return
    end

	if self._inventory_is_loading then
		return
	end

	self._inventory_is_loading = true

    Steam:inventory_load(callback(self, self, "_clbk_inventory_load"))
    self._inventory_loaded = true
    --log("loaded inventory.")
end