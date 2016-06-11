include('shared.lua') -- At this point the contents of shared.lua are ran on the client only.

function NPCShopMenu()
 if (Menu == nil)then

 	 Menu = vgui.Create( "DFrame" )
	 Menu:SetPos( 0, ScrH()/200)
 	 Menu:SetSize(500, 1000)
 	 Menu:SetTitle("Weapons Market")
 	 Menu:SetDraggable(false)
 	 Menu:ShowCloseButton(false)
 	 Menu:SetDeleteOnClose(false)
 	 Menu.Paint = function()
 	     surface.SetDrawColor(75, 83, 32, 200)
 	     surface.DrawRect(0,0,Menu:GetWide(),Menu:GetTall())

 	     surface.SetDrawColor(40,40,40,255)
 	     surface.DrawRect(0,24,Menu:GetWide(),1)
 	     end

 	addButtons(Menu)
 	gui.EnableScreenClicker(true)
 	   else
 	     if(Menu:IsVisible())then
 	 	 Menu:SetVisible(false)
 	 	 gui.EnableScreenClicker(false)
 	     else
 	     	Menu:SetVisible(true)
			gui.EnableScreenClicker(true)
      end    
 end
	-- We can also do anything else the client can do, like using the chat!
	chat.AddText(Color(255,255,128), "Merchant: ",Color(255,255,255), "Welcome to my shop, how can I help you?" )
end
concommand.Add("open_game_menu", NPCShopMenu)

function CreateShopPanel()
	local shopPanel = vgui.Create("ShopPanel", Menu)
		
	local entityCatergory = vgui.Create("DCollapsibleCategory", shopPanel)
	entityCatergory:SetPos(0,0)
	entityCatergory:SetSize(shopPanel:GetWide(), 100)
	entityCatergory:SetLabel("Entities")
	
	local weaponCatergory = vgui.Create("DCollapsibleCategory", shopPanel)
	weaponCatergory:SetPos(0,200)
	weaponCatergory:SetSize(shopPanel:GetWide(), 100)
	weaponCatergory:SetLabel("Weapons")
	
	local entityList = vgui.Create("DIconLayout", entityCatergory)
	entityList:SetPos(0,20)
	entityList:SetSize(entityCatergory:GetWide(), entityCatergory:GetTall())
	entityList:SetSpaceY(5)
	entityList:SetSpaceX(5)
	
	local weaponList = vgui.Create("DIconLayout", weaponCatergory)
	weaponList:SetPos(0,20)
	weaponList:SetSize(weaponCatergory:GetWide(), weaponCatergory:GetTall())
	weaponList:SetSpaceY(5)
	weaponList:SetSpaceX(5)
	
	
	for k,v in pairs(OWC.Config.SHOP.entsArr)do
		local icon = vgui.Create("SpawnIcon", entityList)
		icon:SetModel(v[1])
		icon:SetToolTip(v[3].."\nCost: "..v[4])
		entityList:Add(icon)
		icon.DoClick = function(icon)
			net.Start("buy_entity")
				net.WriteInt(k,32)
			net.SendToServer()
		end
	end
	
	for k,v in pairs(OWC.Config.SHOP.weaponsArr)do
		local icon = vgui.Create("SpawnIcon", weaponList)
		icon:SetModel(v[1])
		icon:SetToolTip(v[3].."\nCost: "..v[4])
		weaponList:Add(icon)
		icon.DoClick = function(icon)
			net.Start("buy_gun")
				net.WriteInt(k,32)
			net.SendToServer()
		end
	end

	return shopPanel
end



usermessage.Hook("ShopNPCUsed", NPCShopMenu) --Hook to messages from the server so we know when to display the menu.