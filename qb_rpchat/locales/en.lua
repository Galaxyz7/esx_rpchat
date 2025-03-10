Locale = {}
Locale.__index = Locale

function Locale:new(data)
    local self = setmetatable({}, Locale)
    self.phrases = data.phrases or {}
    self.warnOnMissing = data.warnOnMissing or false
    return self
end

function Locale:t(key, ...)
    local phrase = self.phrases[key]
    if not phrase and self.warnOnMissing then
        print("^1[WARNING]^0 Missing translation for key: " .. key)
        return key
    end
    return phrase and string.format(phrase, ...) or key
end



local Translations = {
  ooc_prefix = '🌎 %s',
  twt_help = 'Send a tweet',
  ad_help = 'Make an advertisement',
  twt_prefix = '🪙 ^5@%s^0',
  ad_prefix = '📺 ^2$%s^0',
  me_help = 'personal action',
  me_prefix = 'me | %s',
  do_help = 'RP information',
  do_prefix = 'do | %s',
  generic_argument_name = 'message',
  generic_argument_help = 'the message',
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})