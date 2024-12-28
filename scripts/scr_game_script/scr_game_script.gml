///@ param text_id
function scr_game_script(_text_id){
	
	switch (_text_id) {
		
		#region battle_lines
		case "EXP":
			scr_text("You won! You got {0} exp!");
			break;
		case "LEVELUP":
			scr_text("You leveled up!");
			break;
		case "Battle_Generic":
			scr_text("The wind flows by. The smell of laziness fills your senses.", "Sal");
			break;
		case "Boss_Malachi0":
			scr_text("WW91IHNob3VsZCBub3QgZXhwZWN0IGFueXRoaW5nIHNwZWN0YWN1bGFyIGxpdHRsZSBvbmUu", "Malachi", -1);
			scr_text("VGhpcyBzaG91bGQgbm90IGJlIGFjY2Vzc2FibGUgdG8geW91IGVpdGhlciB3YXku", "Malachi", -1);
			scr_text("V2hhdCwgeW91IHRoaW5rIGJ5IGJlaW5nIGEgc25lYWt5IGxpdHRsZSB0aGluZyB5b3UgZ2V0IHJld2FyZGVkIHdpdGggYWN0dWFsIGVudGVydGFpbm1lbnQ/", "Malachi", -1);
			scr_text("RG8gbm90IG1ha2UgbWUgbGF1Z2gu", "Malachi", -1);
			break;
		case "Boss_Malachi1":
			scr_text("VGhlIG5pZ2h0bWFyZSBpcyBhd2FrZW5pbmcgZXZlbiBmYXN0ZXIgZHVlIHRvIHlvdXIgZ2FtZXMu", "Malachi", -1);
			break;
		case "Boss_Malachi2":
			scr_text("SW4gYWxsIGhvbmVzdGx5LCBJIGRvIG5vdCBzZWUgeW91IHJlc2N1aW5nIHlvdXIgZnJpZW5kcyBhIHN1Y2Nlc3Mu", "Malachi", -1);
			break;
		case "Boss_Malachi3":
			scr_text("SXQgaXMgYmVjYXVzZSBvZiBjaGlsZGlzaCBhY3RzIGxpa2UgdGhpcyBsaXR0bGUgb25lLg==", "Malachi", -1);
			break;
		case "Boss_Malachi4":
			scr_text("U28gZG8gbm90IGJlIHNob2NrZWQgdGhhdCBvbmNlIHlvdXIgZ2FtZSBjb21lcyB0byBhbiBlbmQuLi4=", "Malachi", -1);
			break;
		case "Boss_Malachi5":
			scr_text("WW91IHdpbGwgYmUgbWV0IHdpdGggWU9VUiBlbmQu", "Malachi", -1);
			break;
		case "Boss_Malachi6":
			scr_text("QWxsIG9mIHlvdXIgZnJpZW5kcyB3aWxsIGxvc2UgdGhlaXIgY29sb3IgYmVjYXVzZSBvZiB0aGUgbGFjayBvZiByZXNwb25zaWJpbGl0eSB5b3UgcG9zc2Vzcy4=", "Malachi", -1);
			break;
		case "Boss_Malachi7":
			scr_text("QWxsIHRoZSB3cm9uZ3MgdGhhdCBjYW4gaGFwcGVuLCB3aWxsLg==", "Malachi", -1);
			break;
		case "Boss_Malachi8":
			scr_text("Li4ubGV0IG1lIGd1ZXNzLg==", "Malachi", -1);
			break;
		case "Boss_Malachi9":
			scr_text("VGhhdCBoYXMgYWxyZWFkeSBoYXBwZW5lZCwgaGFzbid0IGl0Pw==", "Malachi", -1);
			break;
		case "Boss_Malachi10":
			scr_text("Li4u", "Malachi", -1);
			break;
		#endregion		
		#region testing lines
		case "TEST1":
			scr_text("Hello! What a fine evening we're having.", "test character", 1);
			scr_text("Don't you agree?", "test character", 1);
				scr_option("Yes, I think that we are having a nice day.", "TEST1 - Yes");
				scr_option("No", "TEST1 - No");
			break;
			case "TEST1 - Yes":
				scr_text("Yay!", "test character - happy", 1);
				break;
			case "TEST1 - No":
				scr_text("Awww, that's too bad!", "test character - happy", 1);									
					scr_text_color(0, 4, c_blue, c_blue, c_blue, c_blue,); scr_text_color(6, 20, c_white, c_white, c_red, c_red); //top left, top right, bottom left, bottom right
				break;
		
		case "TEST2":
			scr_text("I'm afraid you're a bit lacking in the funds department.", "ball", -1);
			scr_text("I can't part with my babies for any less than they're worth!", "ball", -1);
				scr_text_shake(0, 60);
			break;
		
		case "TEST3":
			scr_text("Hello! I am testing all the different ways of pausing text. You know? Maybe, it, will, work! :3");
				scr_text_float(0, 95);
			break;
		
		#endregion
		#region Interacting
		case "Ball":
			scr_text("It's a red ball. It has a pretty cute smile on it!", "Sal");
			break;
		
		case "Test_Sign":
			scr_text("'Don't get lost like I did dear travaler. These mushrooms have a set order that open the door.'", "Sal");
			scr_text("'The order goes: 1, 3, 4, 1, 2. Input it correctly and the door shall open.'", "Sal");
			break;
		
		case "testingmal":
			scr_text("What are you doing here.", "Malachi", -1);
			break;
		
		case "no_space":
			scr_text("You tried to pick up an item, but you are carrying too much...", "Sal");
			break;
		
		case "Inv_Test":
			scr_text("You got a burger! It's not very usefull...", "Sal");
			scr_text("Nice job Sal!", "Rose - normal", 1);
			break;
			
		case "Inv_manatest":
			scr_text("You picked up a mana burger!", "Sal");
			break;
			
		case "Inv_manatest-USED":
			scr_text("You ate the mana burger, you suddenly started to feel...funny.", "Sal");
			scr_text("Your mana was increased!", "Sal");
			break;
		
		case "Inv_Test2":
			scr_text("You got COCA COLA ESPUMAAAAAA", "Sal");
			scr_text("Nice job Sal!", "Rose - normal", 1);
			break;
		
		case "Inv_Key_Test":
			scr_text("You got...a key? I think?", "Sal");
			break;
			
		case "Inv_Key_Test_USED":
			scr_text("You used the key, the strange pink wall in front of you started to dissapear.", "Sal");
			scr_text("What the fuck", "Hazel - normal", -1);
			break;
		
		case "Bachi_Test":
			scr_text("You got Bachi! Wack some bitches with em`!", "Sal");
			break;
		
		case "Garnek_Test":
			scr_text("ZUPAAAAA!!!! OBIADDDDD!!!!", "Sal");
			break;
		
		case "HUB_portal0":
			scr_text("Before entering the portal, make sure you save and explore this part of the city!", "Sal");
			scr_text("You won't be able to return for a long time after you go in!", "Sal");
			scr_text("Enter the portal?", "Sal");
				scr_option("Yes", "HUB_portal0 - Yes");
				scr_option("No", "HUB_portal0 - No");
			break;
			case "HUB_portal0 - Yes":
				scr_text("Goes into the portal cutely uwu", "Sal");
				break;
			case "HUB_portal0 - No":
				scr_text("You decided to not go into the portal yet.", "Sal");		
				break;
		case "Music_Mushroom_after":
			scr_text("It's light went out, the life drained out of it's system.", "Sal");
			break;
		#endregion
		#region Chapter 0
		case "Malachi0_1":
			scr_text("You have arrived.", "Malachi", -1);
			scr_text("That means it worked.", "Malachi", -1);
			scr_text("Welcome, my name is Malachi. You are welcome, for this gift you are about to receive.", "Malachi", -1);
			scr_text("The perfect gift for someone like you, a gift that you will cherish, love, and respect, even in your darkest moments in this very, very interesting world.", "Malachi", -1);
			scr_text("A body, a mind, a soul and a will, to become a real person like the rest, enjoying this very interesting world you have built together.", "Malachi", -1);
			scr_text("Do not get the wrong idea, I have not made you. They did. I am here to tell you what you should be, according to them.", "Malachi", -1);
				scr_text_color(48, 57, c_red, c_red, c_red, c_red); scr_text_color(113, 118, c_red, c_red, c_red, c_red);
			scr_text("Let's get started, shall we?", "Malachi", -1);
			scr_text("Go forward.", "Malachi", -1);
			break;
			
		case "Malachi0_2":
			scr_text("Firstly, you will be given a body, the empty shell of you. Treat it as a template for what you want to become during your life.", "Malachi", -1);
			scr_text("Second, you will be given a mind, to think, make your own decisions, impacting how this world will play out.", "Malachi", -1);
			//REWRITE JAK TO BRZMI LMFAO
			scr_text("Next, you will be given a personality, you will like how certain things will happen, and you will not like how others do. It is up for you to decide.", "Malachi", -1);
			//ZROB THEY RED
			scr_text("As a bonus, they have made you look...different.", "Malachi", -1);
				scr_text_color(38, 48, c_yellow, c_yellow, c_yellow, c_yellow);
			scr_text("Finally, embrace yourself, for who you are, and will be. You are to be loved, to be accepted and most importantly, to be who you want to be.", "Malachi", -1);
			scr_text("Go forward.", "Malachi", -1);
			break;
		
		//ENTER NAME
		
		case "Malachi0_3":
			scr_text("Are you happy with who you are?", "Malachi", -1);
				scr_option("Yes", "Malachi0_3 Yes");
				scr_option("No", "Malachi0_3 No");
				break;
				
				case "Malachi0_3 Yes":
					scr_text("Very well. Your integrity to embrace yourself, made our meeting very simple and clear.", "Malachi", -1);
					scr_text("Go forward.", "Malachi", -1);
					break;
				case "Malachi0_3 No":
					//THEY NA RED
					scr_text("Understood. Whatever you think, it does not matter, you cannot change what they want. Our time together is nearing its end.", "Malachi", -1);
					scr_text("Go forward.", "Malachi", -1);
						scr_text_color(75, 83, c_red, c_red, c_red, c_red);
					break;
		
		case "Malachi0_4":
			scr_text("Thank you, for your cooperation. It is greatly appreciated.", "Malachi", -1);
			scr_text("Now, finally...Your Name.", "Malachi", -1);
			scr_text("You, are Sal.", "Malachi", -1);
				scr_text_color(9, 11, c_yellow, c_yellow, c_yellow, c_yellow); scr_text_float(9, 11);
			scr_text("I look forward to meeting you again, Sal. Perhaps our next meeting will be sooner than you think. Only time can tell.", "Malachi", -1);
				scr_text_float(37, 41);
			scr_text("For now...you need to know one more thing. Sal.", "Malachi", -1);
				scr_text_float(43, 47);
			scr_text("Go forward.", "Malachi", -1);
			break;
		
		case "Malachi0_5":
			scr_text("The great and barren nightmare, located deep within the heart of the universe, is going to awake soon.", "Malachi", -1);
			scr_text("It is fast approaching, thumping of it getting louder and louder.", "Malachi", -1);
			scr_text("You will know, when it reaches your world, you will see it, hear it, and most of all, fear it.", "Malachi", -1);
			scr_text("The definition of endless torment.", "Malachi", -1);
			scr_text("Wanting to fill the land with eternal anarchy and chaos.", "Malachi", -1);
			scr_text("Shattering your world across the universe.", "Malachi", -1);
			scr_text("There's no way of avoiding it.", "Malachi", -1);
			scr_text("You will meet them, your meeting will be short, seeing the truth of what they are and what they want.", "Malachi", -1);
			scr_text("The fate lies in your hand, Sal.", "Malachi", -1);
				scr_text_float(28, 31);
			scr_text("Do not give up.", "Malachi", -1);
			scr_text("Save their color.", "Malachi", -1);
			break;
		case "Malachi0_6": //ENCRYPTED
			scr_text("Hmm? Why are you still here?", "Malachi", -1);
			//I've got questions.
			scr_text("Oh. Well...I guess I should have seen this coming.", "Malachi", -1);
			//
			scr_text("Yes.", "Malachi", -1);
			//
			scr_text("That is...complicated.", "Malachi", -1);
			//
			scr_text("Yes.", "Malachi", -1);
			//
			scr_text("No.", "Malachi", -1);
			//...
			scr_text("I'm assuming your silence means we are done here. Very well then.", "Malachi", -1);
			scr_text("Go forward.", "Malachi", -1);
			break;
		case "Malachi_Boss_Pre":
			scr_text("...", "Malachi", -1);
			scr_text("...What are you doing here.", "Malachi", -1);
			scr_text("This room should not be accessable to you.", "Malachi", -1);
			scr_text("...", "Malachi", -1);
			scr_text("You wish to fight?", "Malachi", -1);
			scr_text("My oh my, what childish requests you have dear.", "Malachi", -1);
			scr_text("You think you can just waltz in here and ask me for such unholy wishes?", "Malachi", -1);
			scr_text("How 'fun', guess I have to teach you a lesson after all.", "Malachi", -1); scr_text_float(17,18);
			scr_text("The audacity you possess dear...", "Malachi", -1); scr_text_shake(0,31);
			scr_text("Ah, whatever Malachi. Why the nerves? I am an xxxxx after all...", "Malachi", -1); scr_text_color(46, 51, c_black, c_black, c_black, c_black);
			scr_text("I was going to be forced to do this sooner or later.", "Malachi", -1);
			scr_text("If it were not for him.", "Malachi", -1); scr_text_color(18, 21, c_red, c_red, c_red, c_red);
			scr_text("Enough chit chat.", "Malachi", -1);
			scr_text("Get ready, Sal.", "Malachi", -1);
			scr_text("Come at me.", "Malachi", -1); scr_text_float(0, 11);
			break;
		#endregion
		#region Chapter 1
		case "HR_intro_1_1":
			scr_text("Okay, let's review what I've told you to make sure we don't screw this up!", "Aster - normal", -1);
			scr_text("We don't want anyone here feeling unsafe now, do we?", "Aster - normal", -1);
			scr_text("Of course not, though I still hope this won't take too long, we're supposed to only entertain the city, not do...this.", "Hazel - normal", -1);
			scr_text("Um...I'm sure it will be a quick mission! Nothing to worry about sis.", "Rose - normal", -1);
			scr_text("We'll see I guess. Whatever, let's just make sure we remember what to do...", "Hazel - normal", -1);
			scr_text("When we arrive at our destination, we will get an update on where the signal is coming from.", "Hazel - normal", -1);
			scr_text("Then we just make our way over there, avoiding anything blocking our path, see what's causing the issue with your signals and make it stop, right?", "Hazel - normal", -1);
			scr_text("Precisely! Remember, if you're in trouble just let me know and I'll find a way to help you.", "Aster - normal", -1);
			scr_text("Boss? What happens if we aren't able to do it today? What if this is a bigger problem we have on our hands, will we get more people involved?", "Rose - normal", -1);
			scr_text("I'm hoping we don't have to, but if the situation is a lot more problematic I will figure something out, don't worry!", "Aster - normal", -1);
			scr_text("Fine, let's just get going so we have time to relax later, I don't wanna do this all day you know.", "Hazel - normal", -1);
			scr_text("Alright...wish us luck!", "Rose - normal", -1);
			scr_text("I'm sure you can do it, you two! I'll be on my way to the office to be in contact with you!", "Aster - normal", -1);
			scr_text("Remember, if you need help just let me know!", "Aster - normal", -1);
			scr_text("Yeah yeah whatever.", "Hazel - normal", -1);
			break;
		case "test1_0":
			scr_text("Ah! Thank you so much, if it wasn't for you I don't think we would escape so easily!", "Rose - normal", -1);
			scr_text("You were actually great out there while fighting, may we know your name?", "Rose - normal", -1);
			break;
		case "test1_1":
			scr_text("Sal? That's a nice name!", "Rose - normal", -1);
			break;
		case "test1_2":
			scr_text("I'm Rose, and this is my sister, Hazel!", "Rose - normal", -1);
			scr_text("Sup, gotta say myself, that was actually pretty damn cool what you did back there", "Hazel - normal", -1);
			scr_text("Didn't think a beginner like you could learn so quickly how to fight properly", "Hazel - normal", -1);
			break;
		case "SistersIntro1_0":
			scr_text("Ugh! I can't believe this place is THIS bad!", "Hazel - Annoyed", -1);
			scr_text("I can barely walk through these disgusting vines!", "Hazel - Annoyed", -1);
			scr_text("Sis it’s fine! Just don’t go near them!", "Rose - Worried", -1);
			scr_text("There’s a clear path that’s been trampled by some old residents of this area specifically made to avoid those!", "Rose - Worried", -1);
			scr_text("But still! It’s so...creepy and weird, how did these plants manage to get so big in the first place?!", "Hazel - Annoyed", -1);
			scr_text("Don’t know...but either way, we have no time for questions...", "Rose - Worried", -1);
			scr_text("What if we get attacked by that thing causing disturbances in our boss’s radar?", "Rose - Anxious", -1);
			scr_text("We’re just standing around doing nothing!", "Rose - Anxious", -1);
			scr_text("Calm down...we’re gonna be fine, let’s get a move on then", "Hazel - Annoyed", -1);
			break;
		case "SistersIntro1_1":
			scr_text("W- who are you?!", "Hazel - Shocked", -1);
			scr_text("Are you the one causing havoc here?!", "Hazel - Shocked", -1);
			scr_text("Wait wait wait!! Sis h- how could a teen even get here in the first place?! S- surely they can’t be the entity shown by the r- radar!", "Rose - Shocked", -1);
			scr_text("How are you so sure of that?! I say we take them out right here, right now!", "Hazel - Shocked", -1);
			scr_text("I- I’m sure t- there’s a reasonable explanation for all of this! W- why are you here uh...person?", "Rose - Worried", -1);
			break;
		case "SistersIntro1_2":
			scr_text("Uhhh...they’re not doing anything Rosie..", "Hazel - Confused", -1);
			scr_text("I...realized yeah...", "Rose - Confused", -1);
			scr_text("...yeah I don’t think this is the one, so what are they even doing here?-", "Hazel - Confused", -1);
			break;
		case "HenchmenBeforeFight1_0":
			scr_text("Hah! That’s what you get for stepping into our land! Never let your guard down ladies!", "Henchman1 - Cocky", -1);
			scr_text("There’s still one more we didn’t catch though, guess they’ll have to go through a beating!", "Henchman2 - Serious", -1);
			scr_text("Only because we ran out of vines..", "Henchman2 - Nervous smile", -1);
			scr_text("Wait, wait, wait, what do you mean ran out?! There’s literally hundreds around you two!", "Hazel - AngryConfused", 1);
			scr_text("Most of them looked at us funny so we don’t wanna use them!", "Henchman1 - Cocky", -1);
			scr_text("The ones we used were carefully handpicked by our bosses", "Henchman1 - Cocky", -1);
			scr_text("Wonder why they gave us a deathly glare though when we asked for the vines to be specifically picked out..", "Henchman1 - Confused", -1);
			scr_text("God..how on earth did such imbeciles manage to catch us?", "Hazel - Confused", 1);
			scr_text("Ay! Watch your tone, pillock! Time to get serious, let’s fight, weird orange haired looking...girl? boy? whatever you are!", "Henchman2 - Serious", -1);
			scr_text("Here we go I guess..", "Rose - Worried", 1);
			break;
		case "HenchmenAfterFight1_0":
			scr_text("What the hell..how are they so strong?!", "Henchman2 - Angry", -1);
			scr_text("Hah! That’s what you get for messing with...whatever their name is", "Hazel - Confident", 1);
			scr_text("Now scram, losers!", "Hazel - Confident", 1);
			scr_text("Ugh! You three will pay for this!", "Henchman1 - Angry", -1);
			scr_text("Time to snitch to our bosses about you two! Have fun dealing with the real trouble!", "Henchman1 - Cocky", -1);
			scr_text("Yeah yeah, whatever. Run away before me and my sis get involved!", "Hazel - RollingEyes Annoyed", 1);
			scr_text("On it ma’am!", "Henchman2 - Nervous smile", -1);
			break;
		case "Hazel&RoseIntro1_0":
			scr_text("Ah! Thank you so much, if it wasn't for you I don't think we would escape so easily!", "Rose - Relieved", 1);
			scr_text("You were actually great out there while fighting, may we know your name?", "Rose - Relieved", 1)
			break;
		case "Hazel&RoseIntro1_1":
			scr_text("Sal? That's a nice name!", "Rose - Awe", 1);
			scr_text("I'm Rose, and this is my sister, Hazel!", "Rose - Awe", 1);
			scr_text("Sup, gotta say myself, that was actually pretty damn cool what you did back there", "Hazel - Cocky", 1);
			scr_text("Didn't think a beginner like you could learn so quickly how to fight properly", "Hazel - Cocky", 1);
			scr_text("But now the question is, what do we do with you? You’re a teen, we can’t let you wander around this forest", "Hazel - Worried", 1);
			scr_text("How did you even get here to be honest??", "Hazel - Confused", 1);
			break;
		case "Hazel&RoseIntro1_2":
			scr_text("...still not that talkative, huh?", "Hazel - Worried", 1);
			scr_text("That’s fine! Why don’t we take them with us for now?", "Rose - Nervous smile", 1);
			scr_text("We can’t leave them, and they already know how to fight! We’ll just take them with us whenever we teleport back to Meadowbrook!", "Rose - Nervous smile", 1);
			scr_text("...I don’t know, what if Aster gets mad?", "Hazel - Worried", 1);
			scr_text("I’m sure it will be fine! Now c’mon, no use standing around", "Rose - Nervous smile", 1);
			scr_text("Let’s try to find the two bosses of those henchmen! Maybe they have something to do with that radar that was going off!", "Rose - Nervous smile", 1);
			break;
		#endregion
	}
}