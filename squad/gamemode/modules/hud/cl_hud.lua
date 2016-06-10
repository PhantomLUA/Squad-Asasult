function HUD()
	local client = LocalPlayer()

	if !client:Alive() then
		return
	end

	local xpToLevel = (client:GetNWInt("playerLvl") * 100) * 3
	
	
	draw.SimpleText("Health: ".. client:Health(), "DermaDefaultBold", 8, ScrH() - 55, Color(255, 255, 255, 125),0 ,0)
	
	draw.RoundedBox(4, 0, ScrH() - 60, 250, 125, Color(30, 30, 30, 100))
	draw.SimpleText("Armor: ".. client:Armor(), "DermaDefaultBold", 8, ScrH() - 40, Color(255, 255, 255, 125),0 ,0)
	
	
	draw.RoundedBox(0, 90, ScrH() - 55, math.Clamp(client:Health(), 0, 100) * 1.65, 11, Color(255, 0, 0, 130))
	draw.RoundedBox(0, 90, ScrH() - 40, math.Clamp(client:Armor(), 0, 100) * 1.65, 11, Color(0, 0, 255, 130))
	
	draw.RoundedBox(0, 90, ScrH() - 55, 100 * 1.65, 11, Color(50, 50, 50, 90))
	draw.RoundedBox(0, 90, ScrH() - 40, 100 * 1.65, 10, Color(50, 50, 50, 90))
	
	draw.SimpleText("Level " .. client:GetNWInt("PlayerLvl"), "DermaDefaultBold", 75, ScrH() - 25, Color(255, 255, 255, 125), 0)
	draw.SimpleText("XP: " .. client:GetNWInt("PlayerXp") .. "/" .. xpToLevel, "DermaDefaultBold", 145, ScrH() - 25, Color(255, 255, 255, 125), 0)

	draw.SimpleText(FormatMoney(client:GetNWInt("PlayerMoney")), "DermaDefaultBold", 8, ScrH() - 25, Color(255, 255, 255, 125), 0)
	
	draw.RoundedBox(0, 0, ScrH()-5, ScrW()-1116,5,Color(30,30,30,85))
	draw.RoundedBox(0, 0, ScrH()-5,(client:GetNWInt("playerXp")/xpToLevel)*(ScrW()-1116), 5, Color(50,200,10,95))
	
	
	if(client:GetActiveWeapon():IsValid()) then  
		if (client:GetActiveWeapon():GetPrintName() != nil) then
			draw.SimpleText(client:GetActiveWeapon():GetPrintName(), "DermaDefaultBold", ScrW() - 120, ScrH() - 65, Color(255, 255, 255, 125), 0, 0)
		end
		
		if(client:GetActiveWeapon():Clip1() != -1) then
			draw.SimpleText("Ammo: ".. client:GetActiveWeapon():Clip1() .. "/" .. client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()), "DermaDefaultBold", ScrW() - 120, ScrH() - 45, Color(255, 255, 255, 125), 0, 0)
		end
	end
end
hook.Add("HUDPaint", "TestHud", HUD)

function HideHud(name)
	for k, v in pairs({"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo"}) do
		if name == v then
			return false
		end
	end
end
hook.Add("HUDShouldDraw", "HideDefaultHud", HideHud)