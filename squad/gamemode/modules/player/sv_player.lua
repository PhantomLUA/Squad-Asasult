function GM:PlayerInitialSpawn(ply)
	ply:SetModel("models/player/Group03/male_08.mdl")
	if (ply:GetPData("playerLvl") == nil)then
		ply:SetNWInt("playerLvl", 1)
	else
		ply:SetNWInt("playerLvl", tonumber(ply:GetPData("playerLvl")))
		
		if (ply:GetPData("playerXp") == nil)then
			ply:SetNWInt("playerXp", 1)
		else
			ply:SetNWInt("playerXp", tonumber(ply:GetPData("playerXp")))
			
			if (ply:GetPData("playerMoney") == nil)then
				ply:SetNWInt("playerMoney", 1)
			else
				ply:SetNWInt("playerMoney", tonumber(ply:GetPData("playerMoney")))
				end
			end
		end
	end



function GM:PlayerSpawn(ply)
	ply:SetGravity(0.9)
	ply:SetMaxHealth(100)
	ply:SetRunSpeed(300)
	ply:SetWalkSpeed(200)
	ply:Give("weapon_physcannon")
	ply:Give("gmod_tool")
	ply:Give("weapon_physgun")
	ply:Give("cw_m1911")
	ply:Give("weapon_crowbar")
	ply:Flashlight( false )
	ply:AllowFlashlight( true )
	ply:SetupHands()
	ply:SetNWInt("playerHunger", 100)
	ply:SetNWInt("playerFood", 0)
	ply:SetNWInt("playerMaterials", 0)	
end 

function GM:OnNPCKilled(npc, attacker, inflictor)
	attacker:SetNWInt("playerMoney", attacker:GetNWInt("playerMoney") + 200)
	
	attacker:SetNWInt("playerXP", attacker:GetNWInt("playerXP") + 200)
	
	checkForLevel(attacker)
end

function GM:OnPlayerDealth(victim, attacker, inflictor)
	attacker:SetNWInt("playerMoney", attacker:GetNWInt("playerMoney") + 350)
	
	if attacker == victim then return end
	
	attacker:SetNWInt("playerXp", attacker:GetNWInt("playerXP") + 250)
	
	checkForLevel(attacker)
end

function GM:PlayerCanHearPlayersVoice( listener, talker )
	return ( listener:GetPos():Distance( talker:GetPos() ) <= 500 )
end

function Survey(ply)
	ply:SetFOV(5,1)
end
concommand.Add("survey_area", Survey)

function GM:PlayerGiveSWEP( ply, class, swep )
	if (ply:IsAdmin() or ply:IsSuperAdmin()) then
		return true
	else
		return false
	end
end

	
function checkForLevel(ply)
	local xpToLvl = (ply:GetNWInt("playerLvl")* 100) * 3
	local curXp = ply:GetNWInt("playerXp")
	local curLvl = ply:GetNWInt("playerLvl")
	
	if (curXp >= xpToLvl) then
		curXp = curXp - xpToLvl
		
		ply:SetNWInt("playerXp", curXp)
		ply:SetNWInt("playerLvl", curLvl + 1)
		ply:SetNWInt("playerMoney", ply:GetNWInt("playerMoney") + 1200)
	end
end

function ResetLvls(ply)
	ply:SetNWInt("playerLvl", 1)
	ply:SetNWInt("playerXp", 0)
end
concommand.Add("resetlvl", ResetLvls)

function resetcash(ply)
	ply:SetNWInt("playerMoney", 0)
end
concommand.Add("resetcashfordebugreasons", resetcash)