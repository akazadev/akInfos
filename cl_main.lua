------------------------------------------------------------
------------------ Développer par Akaza --------------------
------------------------------------------------------------
--- LOCAL FUNCTIONS

local function Notify(text, duration)

	Citizen.CreateThread(function()

		SetNotificationTextEntry("STRING")

		AddTextComponentSubstringPlayerName(text)

		if duration then 

			local Notification = DrawNotification(true, true)

			Citizen.Wait(duration)

			RemoveNotification(Notification)

		else 

			DrawNotification(false, false) 

		end

	end)

end

--- MENU

local menuMain = MenuV:CreateMenu(false, 'Menu infos illégal', 'topleft', 78, 76, 76, 'size-150', 'default', 'menuv', 'example_namespace')

--- ITEMS

local menuMain_button = menuMain:AddButton({ icon = '', label = 'Cambriolage', value = nil, description = 'Prendre des infos sur les cambriolages'})
local menuMain_button2 = menuMain:AddButton({ icon = '', label = 'Ressources militaires', value = nil, description = 'Prendre des infos sur les ressources militaires'})

--- EVENTS

menuMain_button:On('select', function(item)
	Notify("~r~Cambriolage~s~ : Va acheter un Boxville, attends la nuit.. je dirai entre 00h et 05h30 du matin.", 3000)

	Citizen.Wait(3000)
			
	Notify("Place toi en conducteur et appuie sur le ~g~bouton [E]~s~ de ton tableau de bord.", 3000)

	Citizen.Wait(3000)
end)
menuMain_button2:On('select', function(item)
	Notify("~r~Ressources~s~ : Apparement des cargaisons auraient été lâchées dans l\'eau.", 3000)

	Citizen.Wait(3000)

	Notify("Le recycleur pourrait servir, elles ont chutées en profondeur.", 3000)

	Citizen.Wait(3000)

	Notify("Ils ont caché la revente dans un bunker, et l\'accès est lui aussi sous l\'eau.", 3000)

	Citizen.Wait(3000)
end)

--- FUNCTIONS

local coords = { ['x'] = 887.4094, ['y'] = -953.7605, ['z'] = 38.2132}

Citizen.CreateThread(function()

	Citizen.Wait(500)

	while true do

		Citizen.Wait(0)

		local pos = GetEntityCoords(GetPlayerPed(-1), false)

		if(Vdist(coords.x, coords.y, coords.z, pos.x, pos.y, pos.z) < 2.5) then

			DisplayHelpText("~INPUT_CONTEXT~ Infos illégal")

			if(IsControlJustReleased(1, 51))then

				menuMain:Open()

			end

		end

	end

end)

function DisplayHelpText(str)

	SetTextComponentFormat("STRING")

	AddTextComponentString(str)

	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end