function GM:PlayerDisconnected(ply)
	ply:SetPData("playerLvl", ply:GetNWInt("playerLvl"))
	ply:SetPData("playerXp", ply:GetNWInt("playerXp"))
	ply:SetPData("playerMoney", ply:GetNWInt("playerMoney"))
end

function GM:ShutDown()
	for k,v in pairs(player.GetAll()) do
		v:SetPData("playerLvl",v:GetNWInt("playerLvl"))
		v:SetPData("playerXp",v:GetNWInt("playerXp"))
		v:SetPData("playerMoney",v:GetNWInt("playerMoney"))
	end
end

function GM:GravGunPunt(ply, entity)
	return false
end