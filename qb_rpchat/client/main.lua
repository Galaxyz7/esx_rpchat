RegisterNetEvent('esx_rpchat:sendProximityMessage')
AddEventHandler('esx_rpchat:sendProximityMessage', function(playerId, title, message, color)
	local player = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local playerPed = PlayerPedId()
	local targetPed = GetPlayerPed(target)
	local playerCoords = GetEntityCoords(playerPed)
	local targetCoords = GetEntityCoords(targetPed)

	if target ~= -1 then
		if target == player or #(playerCoords - targetCoords) < 20 then
			TriggerEvent('chat:addMessage', {args = {title, message}, color = color})
		end
	end
end)

CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/twt',  Lang:t('twt_help'),  {{name = Lang:t('generic_argument_name'), help = Lang:t('generic_argument_help')}})
	TriggerEvent('chat:addSuggestion', '/anontwt',  Lang:t('twtanon_help'),  {{name = Lang:t('generic_argument_name'), help = Lang:t('generic_argument_help')}})
	TriggerEvent('chat:addSuggestion', '/me',   Lang:t('me_help'),   {{name = Lang:t('generic_argument_name'), help = Lang:t('generic_argument_help')}})
	TriggerEvent('chat:addSuggestion', '/do',   Lang:t('do_help'),   {{name = Lang:t('generic_argument_name'), help = Lang:t('generic_argument_help')}})
	TriggerEvent('chat:addSuggestion', '/ad',   Lang:t('ad_help'),   {{name = Lang:t('generic_argument_name'), help = Lang:t('generic_argument_help')}})

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/twt')
		TriggerEvent('chat:removeSuggestion', '/me')
		TriggerEvent('chat:removeSuggestion', '/do')
	end
end)


