--[[
HoloFriends addon created by Holo, continued by Zappster, followed by Andymon

Get the latest version at wow.curse.com

See HoloFriends_change.log for more informations  
]]

--[[

This file defines pop-up-menus for *_friends and *_ignore

]]

HoloFriends_MenuModTDone = false;
HoloFriends_MenuModPDone = false;
HoloFriends_MenuModRDone = false;
HoloFriends_MenuModFDone = false;


-- BEGIN OF LIST WITH DROP DOWN MENU BUTTONS

function HoloFriends_SetDropDownButtons()
	-- list drop down
	UnitPopupButtons["HOLOFRIENDS_WHISPER"]      = { text = WHISPER,                           };
	UnitPopupButtons["HOLOFRIENDS_INVITE"]       = { text = INVITE,                            };
	UnitPopupButtons["HOLOFRIENDS_ONWARNING"]    = { text = HOLOFRIENDS_WINDOWMAINONWARNING,   };
	UnitPopupButtons["HOLOFRIENDS_ADDCOMMENT"]   = { text = HOLOFRIENDS_WINDOWMAINADDCOMMENT,  };
	UnitPopupButtons["HOLOFRIENDS_ADDFRIEND"]    = { text = ADD_FRIEND,                        };
	UnitPopupButtons["HOLOFRIENDS_ADDIGNORE"]    = { text = IGNORE_PLAYER,                     };
	UnitPopupButtons["HOLOFRIENDS_MOVETOGROUP"]  = { text = HOLOFRIENDS_WINDOWMAINMOVETOGROUP, nested = 1 };
	UnitPopupButtons["HOLOFRIENDS_ADDGROUP"]     = { text = HOLOFRIENDS_WINDOWMAINADDGROUP,    };
	UnitPopupButtons["HOLOFRIENDS_RENAMEGROUP"]  = { text = HOLOFRIENDS_WINDOWMAINRENAMEGROUP, };
	UnitPopupButtons["HOLOFRIENDS_REMOVEFRIEND"] = { text = REMOVE_FRIEND,                     };
	UnitPopupButtons["HOLOFRIENDS_REMOVEIGNORE"] = { text = STOP_IGNORE,                       };
	UnitPopupButtons["HOLOFRIENDS_REMOVEGROUP"]  = { text = HOLOFRIENDS_WINDOWMAINREMOVEGROUP, };
	UnitPopupButtons["HOLOFRIENDS_TURNINFO"]     = { text = HOLOFRIENDS_TOOLTIPTURNINFOTITLE,  };
	UnitPopupButtons["HOLOFRIENDS_WHOREQUEST"]   = { text = HOLOFRIENDS_WINDOWMAINWHOREQUEST,  };

	--extend the existing drop down menus
	if ( HOLOFRIENDS_OPTIONS.MenuModT and not HOLOFRIENDS_OPTIONS.MenuNoTaint ) then
		HoloFriends_MenuModTDone = true;
		HoloFriends_ExtendDropdown(UnitPopupMenus["PLAYER"]);
	end
	if ( HOLOFRIENDS_OPTIONS.MenuModP and not HOLOFRIENDS_OPTIONS.MenuNoTaint ) then
		HoloFriends_MenuModPDone = true;
		HoloFriends_ExtendDropdown(UnitPopupMenus["PARTY"]);
	end
	if ( HOLOFRIENDS_OPTIONS.MenuModR and not HOLOFRIENDS_OPTIONS.MenuNoTaint ) then
		HoloFriends_MenuModRDone = true;
		HoloFriends_ExtendDropdown(UnitPopupMenus["RAID"]);
	end
	if ( HOLOFRIENDS_OPTIONS.MenuModF and not HOLOFRIENDS_OPTIONS.MenuNoTaint ) then
		HoloFriends_MenuModFDone = true;
		HoloFriends_ExtendDropdown(UnitPopupMenus["FRIEND"]);
	end

	-- define empty menu for the group list
	UnitPopupMenus["HOLOFRIENDS_MOVETOGROUP"] = {};
end


function HoloFriends_ExtendDropdown(dropdown)
	if ( not (dropdown and type(dropdown) == "table") ) then
		return;
	end

	table.insert(dropdown, table.getn(dropdown), "HOLOFRIENDS_ADDFRIEND");
	table.insert(dropdown, table.getn(dropdown), "HOLOFRIENDS_ADDIGNORE");
	table.insert(dropdown, table.getn(dropdown), "HOLOFRIENDS_WHOREQUEST");
end


function HoloFriends_InsertDropDown()
	UnitPopupMenus["HOLOFRIENDS_LIST"] = {	"HOLOFRIENDS_WHISPER",
						"HOLOFRIENDS_INVITE",
						"HOLOFRIENDS_ONWARNING",
						"HOLOFRIENDS_ADDCOMMENT",
						"HOLOFRIENDS_ADDFRIEND",
						"HOLOFRIENDS_MOVETOGROUP",
						"HOLOFRIENDS_ADDGROUP",
						"HOLOFRIENDS_RENAMEGROUP",
						"HOLOFRIENDS_REMOVEFRIEND",
						"HOLOFRIENDS_REMOVEGROUP",
						"HOLOFRIENDS_TURNINFO",
						"HOLOFRIENDS_WHOREQUEST",
						"CANCEL" };
end


function HoloIgnore_InsertDropDown()
	UnitPopupMenus["HOLOIGNORE_LIST"] = {	"HOLOFRIENDS_ADDCOMMENT",
						"HOLOFRIENDS_ADDIGNORE",
						"HOLOFRIENDS_MOVETOGROUP",
						"HOLOFRIENDS_ADDGROUP",
						"HOLOFRIENDS_RENAMEGROUP",
						"HOLOFRIENDS_REMOVEIGNORE",
						"HOLOFRIENDS_REMOVEGROUP",
						"CANCEL" };
end

-- END OF LIST WITH DROP DOWN MENU BUTTONS


-- HoloFriends specific functions

function HoloFriends_ListDropDown_Initialize()
	local list = HoloFriends_GetList();
	local tab = UnitPopupMenus["HOLOFRIENDS_MOVETOGROUP"];
	HoloFriendsLists_FillTableWithGroups(list, tab);
	UnitPopup_ShowMenu(UIDROPDOWNMENU_OPEN_MENU,
			   "HOLOFRIENDS_LIST",
			   nil,
			   HoloFriendsDropDown.name,
			   HoloFriendsDropDown.userData);
end


function HoloFriends_ShowListDropdown(id)
	local list = HoloFriends_GetList();

	HideDropDownMenu(1);

	HoloFriendsDropDown.initialize = HoloFriends_ListDropDown_Initialize;
	HoloFriendsDropDown.displayMode = "MENU";
	HoloFriendsDropDown.name = HoloFriendsLists_GetName(list, id, HF_DISPLAY);
	HoloFriendsDropDown.userData = { id = id };
	HoloFriendsDropDown.unit = "player";
	if ( HoloFriendsLists_IsRealID(list, id) ) then HoloFriendsDropDown.bnetIDAccount = 1; end
	ToggleDropDownMenu(1, nil, HoloFriendsDropDown, "cursor");
end

-- end of HoloFriends specific functions


-- HoloIgnore specific functions

function HoloIgnore_ListDropDown_Initialize()
	local list = HoloIgnore_GetList();
	local tab = UnitPopupMenus["HOLOFRIENDS_MOVETOGROUP"];
	HoloFriendsLists_FillTableWithGroups(list, tab);
	UnitPopup_ShowMenu(UIDROPDOWNMENU_OPEN_MENU,
			   "HOLOIGNORE_LIST",
			   nil,
			   HoloIgnoreDropDown.name,
			   HoloIgnoreDropDown.userData);
end


function HoloIgnore_ShowListDropdown(id)
	local list = HoloIgnore_GetList();

	HideDropDownMenu(1);

	HoloIgnoreDropDown.initialize = HoloIgnore_ListDropDown_Initialize;
	HoloIgnoreDropDown.displayMode = "MENU";
	HoloIgnoreDropDown.name = HoloFriendsLists_GetName(list, id, HF_DISPLAY);
	HoloIgnoreDropDown.userData = { id = id };
	HoloIgnoreDropDown.unit = "player";
	ToggleDropDownMenu(1, nil, HoloIgnoreDropDown, "cursor");
end

-- end of HoloFriends specific functions
