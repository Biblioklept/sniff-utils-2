if not SniffUtils then
	SniffUtils = {}
	SniffUtils._path = ModPath
	SniffUtils._lua_path = SniffUtils._path .. "lua/"
	SniffUtils._menu_file = SniffUtils._path .. "options.json"
	SniffUtils._defaults_file = SniffUtils._path .. "defaults.json"
	SniffUtils._options_file = SavePath .. "sniff-utils_options.json"
	SniffUtils._loc_path = SniffUtils._path .. "loc/"
	SniffUtils._options = {}

	SniffUtils._hook_files = {}

	function SniffUtils:Save()
		local file = io.open(self._options_file, "w+")
		if file then
			file:write(json.encode(self._options))
			file:close()
		end
		log("[SNIFF'S UTILS] Settings saved")
	end

	function SniffUtils:Load()
		self:LoadDefaults()
		local file = io.open(self._options_file, "r")
		if file then
			local options = json.decode(file:read("*all"))
			file:close()
			for id, value in pairs(options) do
				self._options[id] = value
			end
		end 
		log("[SNIFF'S UTILS] Settings loaded")
	end

	function SniffUtils:LoadDefaults()
		local file = io.open(self._defaults_file)
		self._options = json.decode(file:read("*all"))
		file:close()
	end

	function SniffUtils:GetOption(id)
		return self._options[id]
	end

	function SniffUtils:SetOption(id, value)
		if self._options[id] ~= value then
			self._options[id] = value
			self:Save()
		end
	end

    Hooks:Add("MenuManagerInitialize", "MenuManagerInitialize_SniffUtils", function(menu_manager)
		function MenuCallbackHandler:SniffUtils_menu_callback(item)
			local optionName = item._parameters.name
			local value = item:value()
			if item._type == "toggle" then
				value = (item:value() == "on")
			end
			SniffUtils:SetOption(optionName, value)
		end
	end)

	Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_SniffUtils", function(loc)
		loc:load_localization_file(SniffUtils._loc_path .. "english.json", false)
	end)

	SniffUtils:Load()

	MenuHelper:LoadFromJsonFile(SniffUtils._menu_file, SniffUtils, SniffUtils._options)
end

if RequiredScript then
	local hook_files = SniffUtils._hook_files[RequiredScript:lower()]
	if hook_files then
		if type(hook_files) == "string" then
			hook_files = {hook_files}
		end
		for _, file in pairs(hook_files) do
			dofile(SniffUtils._lua_path .. file)
		end
	end
end