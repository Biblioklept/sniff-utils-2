-- ORIGINAL MOD: https://modworkshop.net/mod/15368

dofile(ModPath .. "core.lua")
if SniffUtils:GetOption("rats_blur_removal") then
function ElementBlurZone:on_executed(instigator)
    if not self._values.enabled then
        return
    end
    --if self._values.mode == 0 then
    --  managers.environment_controller:set_blurzone(self._values.mode)
    --else
    --  managers.environment_controller:set_blurzone(self._values.mode, self._values.position, self._values.radius, self._values.height)
    --end
    ElementBlurZone.super.on_executed(self, instigator)
end