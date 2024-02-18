///@ param text_id
function scr_game_script(_text_id){
	
	switch (_text_id) {
		
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
		
		case "Inv_Test":
			scr_text("You got a key! It's not very usefull...", "Sal");
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
		#endregion
		#region Chapter 0
		case "Malachi0_1":
			scr_text("You have arrived.", "Malachi", 1);
			scr_text("That means it worked.", "Malachi");
			scr_text("Welcome, my name is Malachi. You are welcome, for this gift you are about to receive.", "Malachi", 1);
			scr_text("The perfect gift for someone like you, a gift that you will cherish, love, and respect, even in your darkest moments in this very, very interesting world.", "Malachi", 1);
			scr_text("A body, a mind, a soul and a will, to become a real person like the rest, enjoying this very interesting world you have built together.", "Malachi", 1);
			scr_text("Do not get the wrong idea, I have not made you. They did. I am here to tell you what you should be, according to them.", "Malachi", 1);
				scr_text_color(48, 57, c_red, c_red, c_red, c_red); scr_text_color(113, 118, c_red, c_red, c_red, c_red);
			scr_text("Let's get started, shall we?", "Malachi", 1);
			scr_text("Step forward.", "Malachi", 1);
			break;
			
		case "Malachi0_2":
			scr_text("Firstly, you will be given a body, the empty shell of you. Treat it as a template for what you want to become during your life.", "Malachi", 1);
			scr_text("Second, you will be given a mind, to think, make your own decisions, impacting how this world will play out.", "Malachi", 1);
			scr_text("Next, you will be given a personality, you will like how certain things will happen, and you will not like how others do. It is up for you to decide.", "Malachi", 1);
			scr_text("As a bonus, they have made you look...different.", "Malachi", 1);
				scr_text_color(38, 48, c_yellow, c_yellow, c_yellow, c_yellow);
			scr_text("Finally, embrace yourself, for who you are, and will be. You are to be loved, to be accepted and most importantly, to be who you want to be.", "Malachi", 1);
			scr_text("Step forward.", "Malachi", 1);
			break;
		
		//ENTER NAME
		
		case "Malachi0_3":
			scr_text("Are you happy with who you are?", "Malachi", 1);
				scr_option("Yes", "Malachi0_3 Yes");
				scr_option("No", "Malachi0_3 No");
				break;
				
				case "Malachi0_3 Yes":
					scr_text("Very well. Your integrity to embrace yourself, made our meeting very simple and clear.", "Malachi", 1);
					scr_text("Step forward.", "Malachi", 1);
					break;
				case "Malachi0_3 No":
					scr_text("Understood. Whatever you think, it does not matter, you cannot change what they want. Our time together is nearing its end.", "Malachi", 1);
					scr_text("Step forward.", "Malachi", 1);
						scr_text_color(75, 83, c_red, c_red, c_red, c_red);
					break;
		
		case "Malachi0_4":
			scr_text("Thank you, for your cooperation. It is greatly appreciated.", "Malachi", 1);
			scr_text("Now, finally...Your Name.", "Malachi", 1);
			scr_text("You, are Sal.", "Malachi", 1);
				scr_text_color(9, 11, c_yellow, c_yellow, c_yellow, c_yellow); scr_text_float(9, 11);
			scr_text("I look forward to meeting you again, Sal. Perhaps our next meeting will be sooner than you think. Only time can tell.", "Malachi", 1);
				scr_text_float(37, 41);
			scr_text("For now...you need to know one more thing. Sal.", "Malachi", 1);
				scr_text_float(43, 47);
			scr_text("Step forward.", "Malachi", 1);
			break;
		
		case "Malachi0_5":
			scr_text("The great and barren nightmare, located deep within the heart of the universe, is going to awake soon.", "Malachi", 1);
			scr_text("It is fast approaching, thumping of it getting louder and louder.", "Malachi", 1);
			scr_text("You will know, when it reaches your world, you will see it, hear it, and most of all, fear it.", "Malachi", 1);
			scr_text("The definition of endless torment.", "Malachi", 1);
			scr_text("Wanting to fill the land with eternal anarchy and chaos.", "Malachi", 1);
			scr_text("Shattering your world across the universe.", "Malachi", 1);
			scr_text("There's no way of avoiding it.", "Malachi", 1);
			scr_text("You will meet them, your meeting will be short, seeing the truth of what they are and what they want.", "Malachi", 1);
			scr_text("The fate lies in your hand, Sal.", "Malachi", 1);
				scr_text_float(28, 31);
			scr_text("Do not give up.", "Malachi", 1);
			scr_text("Save their color.", "Malachi", 1);
			break;
		case "Malachi0_6": //ENCRYPTED
			scr_text("Hmm? Why are you still here, Sal?", "Malachi", 1);
			//I've got questions.
			scr_text("Oh. Well...I guess I should have seen this coming.", "Malachi", 1);
			//Am I safe here?
			scr_text("Yes.", "Malachi", 1);
			//When can I leave?
			scr_text("That is...complicated.", "Malachi", 1);
			//Am I saved?
			scr_text("Yes.", "Malachi", 1);
			//Will it come back?
			scr_text("No.", "Malachi", 1);
			//...
			scr_text("I'm assuming your silence means we are done here. Very well then.", "Malachi", 1);
			break;
		#endregion
		#region Chapter 1
		case "HR_intro_1_1":
			scr_text("Okay, let's review what I've told you to make sure we don't screw this up!", "Aster - normal", 1);
			scr_text("We don't want anyone here feeling unsafe now, do we?", "Aster - normal", 1);
			scr_text("Of course not, though I still hope this won't take too long, we're supposed to only entertain the city, not do...this.", "Hazel - normal", 1);
			scr_text("Um...I'm sure it will be a quick mission! Nothing to worry about sis.", "Rose - normal", 1);
			scr_text("We'll see I guess. Whatever, let's just make sure we remember what to do...", "Hazel - normal", 1);
			scr_text("When we arrive at out destination, we will get an update on where the signal is coming from.", "Hazel - normal", 1);
			scr_text("Then we just make our way over there, avoiding anything blocking our path, see what's causing the issue with your singals and make it stop, right?", "Hazel - normal", 1);
			scr_text("Precisely! Remember, if you're in trouble just let me know and I'll find a way to help you.", "Aster - normal", 1);
			scr_text("Boss? What happens if we aren't able to do it today? What if this is a bigger problem we have on our hands, will we get more people involved?", "Rose - normal", 1);
			scr_text("I'm hoping we don't have too, but if the situation is a lot more problematic I will figure something out, don't worry!", "Aster - normal", 1);
			scr_text("Fine, let's just get going so we have time to relax later, I don't wanna do this all day you know.", "Hazel - normal", 1);
			scr_text("Alright...wish us luck!", "Rose - normal", 1);
			scr_text("I'm sure you can do it, you two! I'll be on my way to the office to be in contact with you!", "Aster - normal", 1);
			scr_text("Remember, if you need help just let me know!", "Aster - normal", 1);
			scr_text("Yeah yeah whatever.", "Hazel - normal", 1);
			break;
		#endregion
	}
}