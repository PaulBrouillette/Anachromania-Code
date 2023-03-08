// When an event occurs that should not happen ever again, this script modifies the associated manager's
// variables to reflect that
function ChangeManagerVariable(_id){
	switch (_id) {
		#region obj_PrisonEventManager
		
		case "prisonCutsceneBlock1":
			obj_PrisonEventManager.prisonCutsceneBlock1 = true;
		break;
		
		case "prisonCutsceneBlock1Ignore":
			obj_PrisonEventManager.prisonCutsceneBlock1Ignore = true;
		break;
		
		#endregion
	}
}