/* 
	NOTE: You MUST have something in every case, be it moving or dialogue. If there is nothing
	between the case declaration and the break statement, it will lead to problems, most likely
	a game crash.
	
	*********************************************************************************************
	*********************************************************************************************
	*********************************************************************************************
	If a dialogue response is to be included, it MUST BE THE LAST THING IN ANY GIVEN CASE. NO CUTS,
	NO BUTS, NO COCONUTS. Same goes with Item Requests, MUST BE LAST THING
	*********************************************************************************************
	*********************************************************************************************
	*********************************************************************************************
	
*/
#region Moving characters
/*
If we want to make cutscene actions i.e. characters walking around, we can do:
	
	Move(obj_PrisonGuard, 100, 200, 1, UP);
	
The accompanying arguments are:

argument[0] = actor
argument[1] = endX
argument[2] = endY
argument[3] = walkSpeed (1 is default)
argument[4] = endFace (UP, DOWN, LEFT, RIGHT)
*/
#endregion
#region Trading items
/*
If we want to have an NPC request an item from us, we can do

	RequestItem("ItemTest");
	global.ItemRecipient = "ItemTest";
	
with "ItemTest" being the textID of the thing asking for an item. When an item is offered up,
say for example item 55, when you hand over item 55, 55 will be conconcatenated to the textID.
If the textID is "SomeGuy", the new textID will be "SomeGuy55". A dialogue box will made right after
an exchange, so their reaction to item 55 will be in "SomeGuy55".

To add an item, we can do
	with (instance_create_depth(0, 0, 10000, obj_Inventory)) {
		InventoryAdd(id, 0);
		instance_destroy();
	}
	
with "0" being replaced with whatever. This is because an obj_Inventory is not always in existance, 
but rather created when we need to see it. Also because this inventory reads and writes to the
global.Inventory array, doing this is fine.
*/
#endregion
#region Dialogue responses
/*
If we want to make a response, we can do:

	PrepareResponseDialogue("Response Text", "linkToNextTextID");
	
Note though, this has to be the last thing before the break statement. Also note, you can have
multiple of these one after another to create more responses at a time. The responseTextID
is what links to dialogue or an action after choosing a response. 
*/
#endregion
#region Waiting
/*
If we want to wait, for example have nothing happen but make the player locked or
wait in between certain actions, we can do:

	Wait(1);
	
With 1 being the amount of time to wait. More information can be inside the Wait
script for how long the argument waits for
*/
#endregion
#region Textbox dialogue
/*
If we want to draw dialogue on a textbox, we can do:

	textArray = [
		"This is some text"
	];
			
	DrawTextboxDialogue(textArray);
	
Note, if we want a character portrait with this, that would be the second argument
*/
#endregion
#region Sprite changes
/*
If we want to change a sprite, we can do:

	SpriteChange(actor, newSprite)
	
Note that for sprites with different sizes and origins, this may get funky
*/
#endregion

function FindDialogueOrAction(textID, _id){
	// The array that contains text. 
	textArray = [""];
	
	instance_create_depth(0, 0, -9998, obj_TextBoxQueue);
	switch(textID) {
		#region Battle
			case "BattleStart1":
				textArray = ["A fight is imminent!"];
				DrawTextboxDialogue(textArray);
			break;
			
			case "BattleStart2":
				textArray = ["Fight to the death 3 2 1 go"];
				DrawTextboxDialogue(textArray);
			break;
			
			case "BattleGuy1":
				textArray = ["Battle Guy wants to spread your cheeks"];
				DrawTextboxDialogue(textArray);
			break;
		#endregion
		
		#region Tests
		case "Demonstration":
			
			
			Move(obj_PrisonGuard, 165, 70, 1, RIGHT);
			
			textArray = [
				"Sinner: 'Presbyter, forgive me, for I have sinned.'"
			];
			DrawTextboxDialogue(textArray);
			SpriteChange(obj_PrisonGuard, spr_PrisonGuard_Left);
			Wait(.5);
			SpriteChange(obj_PrisonGuard, spr_PrisonGuard_Up);
			Wait(.5);
			Move(obj_PrisonGuard, 230, 70, 1, DOWN);
			textArray = [
				"Sinner: 'Presbyter, forgive me, for I have sinned again.'"
			];
			DrawTextboxDialogue(textArray);
			Wait(.5);
			
			RequestItem("ItemTest");
			global.ItemRecipient = "ItemTest";
			
			
			break;
		
		case "ItemTest":
		
			textArray = [
			"Ayy lemme get a whiff"
			];
			
			DrawTextboxDialogue(textArray);
			
			RequestItem("ItemTest");
			global.ItemRecipient = "ItemTest";
			
			break;
			
		case "ItemTest0":
			textArray = [
				"I got a 0!"
			];
			
			DrawTextboxDialogue(textArray);
			break;
			
		case "ItemTest1":
			textArray = [
				"I got a 1!"
			];
			
			DrawTextboxDialogue(textArray);
			break;
			
		case "ItemTest2":
			textArray = [
				"I got a 2!"
			];
			
			DrawTextboxDialogue(textArray);
			break;
			
		case "ItemTest-1":
			textArray = [
				"Earth provides enough to satisfy every man's needs, but not every man's greed."
			];
			
			DrawTextboxDialogue(textArray);
			break;
		
		case "":
			
			textArray = [
				"Anachromania!"
			];
			DrawTextboxDialogue(textArray);
			
			break;
			
		case "moveTest":
		
			Move(obj_PrisonGuard, 100, 200, 1, UP);
			Wait(.25);
			
			break;
		
		case "TestTextBox":	
			textArray = [
				"Greetings there",
				"This is some text",
				"The quick brown fox jumped over the lazy brown dog. What they don't tell you is that I'm disenfranchised in four countries."
			];
			
			DrawTextboxDialogue(textArray);
			
			PrepareResponseDialogue("Dumbass poem", "ResponseTest");
			PrepareResponseDialogue("Sussy ahh", "ResponseTest2");
			PrepareResponseDialogue("No", "ResponseTest3");
		
			
			break;
			
		case "ResponseTest":
			textArray = [
				"Great reponse!"
			];
			DrawTextboxDialogue(textArray);
			break;
			
		case "ResponseTest2":
			textArray = [
				"Bad response!"
			];
			DrawTextboxDialogue(textArray);
			break;
			
		case "ResponseTest3":
			textArray = [
				"Yickadee!"
			];
			DrawTextboxDialogue(textArray);
			break;
			
		
		#endregion Tests 
		
		#region Prison
		
		case "prisonCutsceneBlock1":
		
			textArray = [
				"Maybe there's some stuff in that room over yonder.",
				"Go check it out!"
			];
			
			DrawTextboxDialogue(textArray);
			Move(obj_Player, 415, 316, .5, UP);
			
			break;
			
		case "prisonCutsceneBlock1Ignore":
				
				textArray = [
				"Bruh"
			];
			DrawTextboxDialogue(textArray);
				
			break;
			
		case "PrisonGuard1Speak":
		
			textArray = [
				"Hi"
			];
			DrawTextboxDialogue(textArray);
			
			break;
			
		#region SaultownSoldier1	
		
		case "SaultownSoldier1":
			
			textArray = [
				"So, you're the prisoner, huh?",
				"Welp, welcome to the outside world."
			];
			DrawTextboxDialogue(textArray);
			
			PrepareResponseDialogue("How's it hanging coffin dodger?", "SaultownSoldier1Response1");
			PrepareResponseDialogue("Thanks for the rescue", "SaultownSoldier1Response2");
			PrepareResponseDialogue("Who are you?", "SaultownSoldier1Response3");
			
			break;
			
			case "SaultownSoldier1Response1":
				
				textArray = [
					"Coffin dodger? Come on now, I'm not that old.",
					"Now, from what I understand, you've been in prison for quite a long time.",
					"But, you're out now! You don't need to keep up that tough girl attitude anymore!"
				];
				DrawTextboxDialogue(textArray);
				
				PrepareResponseDialogue("Of course, my apologies", "SaultownSoldier1Response1_res1");
				PrepareResponseDialogue("I will outlive you", "SaultownSoldier1Response1_res2");
				
				break;
				
			case "SaultownSoldier1Response2":
				
				textArray = [
					"You're welcome, young lady.",
					"I can't take all the credit, though. I'm just an old farmer. If you want to thank someone, thank Walter.",
					"When our trebuchet failed, Walter, the beast he is, picked up the stones and hurled them into the tower himself.",
					"He's that colossal mass of meat over yonder. It's impossible to not see him."
				];
				DrawTextboxDialogue(textArray);
			
				break;
				
			case "SaultownSoldier1Response3":
				
				textArray = [
					"I am Martin, full time farmer and part time prison escaper. Wait no... prison break out of-er? Prison breaker? Hm...",
					"I helped break you out of prison is what I'm trying to say.",
					"We're all from Saultown. Like I said, I'm a farmer but for today I got to help do this prison escape.",
					"I don't really know why we did this, but I signed up because the reward was an apple.",
					"I like apples. I find them to be quite scrumptious."
				];
				DrawTextboxDialogue(textArray);
				
				break;
				
			case "SaultownSoldier1Response1_res1":
				
				textArray = [
					"Apology accepted, young lady.",
					"Now, you've talked to Eugene already, right? He'll be the one to escort you to Saultown.",
					"He's an odd man, Eugene. I mean, he means well. He's lionhearted and loyal to the end, but he can get... distracted. ",
					"Don't expect him to actually escort you to town. But hey! That means you can explore a little if you want on your way down.",
					"Just make sure you don't run away. I think you'll want to talk to Saul when you get there, I heard that this whole prison break was his idea.",
					"Anyway, if you lose Eugene on your way, just keep going south. Saultown is a straight path down from here.",
					"I own a small farm in town, please do stop by when you get there!"
				];
				DrawTextboxDialogue(textArray);
				
				break;
				
			case "SaultownSoldier1Response1_res2":
			
				textArray = [
					":("
				];
				DrawTextboxDialogue(textArray);
			
				break;
				
			#endregion
		#region SaultownSoldier2
			
			case "SaultownSoldier2":
			
				textArray = [
					"Come here, let me take a good look at you.",
					"*Sniff*      *Sniff*             *Sniff*                *SNIFF*        *Sniff*  *Sniff*            *Sniff*     *SNOOOOOOOOORT*",
					"Those keen eyes, those strong hands. Yeah... I think it's all coming together",
					"Wait. Wait a goddamn minute.",
					"Are you a woman?"
				];
				DrawTextboxDialogue(textArray);
				
				PrepareResponseDialogue("Hell no", "SaultownSoldier2Response1");
				PrepareResponseDialogue("Hell yes", "SaultownSoldier2Response2");
			
				break;
				
			case "SaultownSoldier2Response1":
			
				textArray = [
					"Nah, you can't fool me. That's a real shame though.",
					"Not that you're a woman, but because you're not a man."
				];
				DrawTextboxDialogue(textArray);
			
			break;
			
			case "SaultownSoldier2Response2":
				
				textArray = [
					"So you're telling me you're NOT a bulk, hot, smutty beefcake who'd step on me, call me demeaning and humiliating names and beat the everloving Christ out of me???",
					"Damn, can't believe I almost fell in love with a girl."
				];
				DrawTextboxDialogue(textArray);
				
				break;
				
		#endregion
		#region PrisonAppleBox
		
		#endregion
		
		#endregion
			
		
		default:
			textArray = [
				"I was not assigned a textID or no textID can be found!"
			];
			DrawTextboxDialogue(textArray);
			break;
	}
}