-- ORIGINAL MOD: https://modworkshop.net/mod/37767

dofile(ModPath .. "core.lua")
if SniffUtils:GetOption("sticky_interaction") then
	pocostickyinteraction = pocostickyinteraction or {}
	if RequiredScript == "lib/units/beings/player/states/playerstandard" then
		-- Sticky Interaction clean up
		local _start_action_interact_orig = PlayerStandard._start_action_interact
		function PlayerStandard:_start_action_interact(t, ...)
			pocostickyinteraction._lastInteractStart = pocostickyinteraction._lastClick or 0;
			_start_action_interact_orig(self, t, ...)
		end

		local _check_action_primary_attack_orig = PlayerStandard._check_action_primary_attack
		function PlayerStandard:_check_action_primary_attack(t, input, complete, ...)
			-- local input = _check_action_primary_attack_orig{self, t, input, complete, ...}
			-- StickyInteraction trigger
			local lastInteractionStart, lastClick = pocostickyinteraction._lastInteractStart or 0, pocostickyinteraction._lastClick or 0
			if input.btn_steelsight_press and self:_interacting() then
				if lastInteractionStart < lastClick then
					pocostickyinteraction._lastClick = 0
					self:_interupt_action_interact()
				else
					pocostickyinteraction._lastClick = t
				end
			end
			return _check_action_primary_attack_orig(self, t, input, complete, ...)
		end

		-- StickyInteraction Execution
		local _interupt_action_interact_orig = PlayerStandard._interupt_action_interact
		function PlayerStandard:_interupt_action_interact(t, input, complete)
			
			local lastInteractionStart, lastClick = pocostickyinteraction._lastInteractStart or 0, pocostickyinteraction._lastClick or 0
			if not t and not complete and (lastInteractionStart < lastClick) then
				local caller = debug.getinfo(2,'n')
				caller = caller and caller.name

				if caller == '_check_action_interact' then
					return -- ignore interruption
				end
			end
			return _interupt_action_interact_orig(self, t, input, complete)
		end
	elseif RequiredScript == "lib/managers/hud/hudinteraction" then
		-- Sticky Interaction timer
		local _set_interaction_bar_width_orig = HUDInteraction.set_interaction_bar_width
		function HUDInteraction:set_interaction_bar_width(current, total)
			local lastInteractionStart, lastClick = pocostickyinteraction._lastInteractStart or 0, pocostickyinteraction._lastClick or 0
			local sticky = (lastInteractionStart < lastClick)
			if self._interact_circle and self.__lastSticky ~= sticky then
				local img = sticky and 'guis/textures/pd2/hud_progress_invalid' or 'guis/textures/pd2/hud_progress_bg'

				local anim_func = function(o)
					while alive(o) and sticky do
						over(0.75, function(p)
							o:set_alpha(math.sin(p * 180) * 0.5 )
						end)
					end
				end

				local bg = self._interact_circle._bg_circle
				if bg and alive(bg) then
					bg:stop()
					bg:animate(anim_func)
					bg:set_image(img)
				end

				self.__lastSticky = sticky
			end

			return _set_interaction_bar_width_orig(self, current, total)
		end
	end
end