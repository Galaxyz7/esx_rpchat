AddEventHandler('chatMessage', function(playerId, playerName, message)
	if IsPlayerDead(playerId) then return end
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()

		playerName = GetRealPlayerName(playerId)
		TriggerClientEvent('chat:addMessage', -1, {args = {TranslateCap('ooc_prefix', playerName), message}, color = {0, 0, 0}})
	end
end)

RegisterCommand('twt', function(playerId, args, rawCommand)
	if IsPlayerDead(playerId) then return end
	if playerId == 0 then
		print('[^1ERROR^7] This Command Cannot Be Used By The Console!')
	else
		args = table.concat(args, ' ')

		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('chat:addMessage', -1, {args = {TranslateCap('twt_prefix', playerName), args}, color = {0, 153, 204}})
	end
end, false)

RegisterCommand('ad', function(playerId, args, rawCommand)
	if IsPlayerDead(playerId) then return end
	if playerId == 0 then
		print('[^1ERROR^7] This Command Cannot Be Used By The Console!')
	else
		args = table.concat(args, ' ')

		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('chat:addMessage', -1, {args = {TranslateCap('ad_prefix', playerName), args}, color = {0, 181, 26}})
	end
end, false)

RegisterCommand('anontwt', function(playerId, args, rawCommand)
	if IsPlayerDead(playerId) then return end
	if playerId == 0 then
		print('[^1ERROR^7] This Command Cannot Be Used By The Console!')
	else
		args = table.concat(args, ' ')

		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('chat:addMessage', -1, {args = {TranslateCap('twt_prefix', "Anonymous"), args}, color = {0, 153, 204}})
	end
end, false)

RegisterCommand('me', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('[^1ERROR^7] This Command Cannot Be Used By The Console!')
	else
		args = table.concat(args, ' ')
		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, TranslateCap('me_prefix', playerName), args, {255, 0, 0})
	end
end, false)

RegisterCommand('do', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('[^1ERROR^7] This Command Cannot Be Used By The Console!')
	else
		args = table.concat(args, ' ')
		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, TranslateCap('do_prefix', playerName), args, {0, 0, 255})
	end
end, false)

RegisterCommand('msg', function(playerId, args, user)
	if IsPlayerDead(playerId) then return end

	if GetPlayerName(tonumber(args[1])) then
		local player = tonumber(args[1])
		table.remove(args, 1)

		TriggerClientEvent('chat:addMessage', player, {args = {"^1PM from "..GetPlayerName(source).. "[" .. source .. "]: ^7" ..table.concat(args, " ")}, color = {255, 153, 0}})
		TriggerClientEvent('chat:addMessage', playerId, {args = {"^1PM SEND TO "..GetPlayerName(player).. "[" .. player .. "]: ^7" ..table.concat(args, " ")}, color = {255, 153, 0}})
	else
		TriggerClientEvent('chatMessage', playerId, "SYSTEM", {255, 0, 0}, "Specified Player Does Not Exist!")
	end

end,false)

function GetRealPlayerName(playerId)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer then
		if Config.EnableESXIdentity then
			if Config.OnlyFirstname then
				return xPlayer.get('firstName')
			else
				return xPlayer.getName()
			end
		else
			return GetPlayerName(playerId)
		end
	else
		return GetPlayerName(playerId)
	end
end

function IsPlayerDead(playerId)
    local playerPed = GetPlayerPed(playerId)
    local health = GetEntityHealth(playerPed)
    -- Check if the player's health is 0 or below
    if health <= 0 then 
		print("Cant message when dead?")
		return true
	else
		return false
	end
end

