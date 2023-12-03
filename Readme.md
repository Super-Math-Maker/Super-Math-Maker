My Understanding of godot

Everything in godot is a node and its part of a hierarchy, the player is made out of 
	-RigidBody
		-CollisionShape
		-Sprite2D

A collection of nodes is called a scene, the player is a scene, the levels are scenes(more on it later) and the menus are scenes

Note: when referencing a scene in a GDscript, drag the script into the editor and it will write out the path. the path MUST be case sensitive, otherwise when you build the game the scene wont appear and the game will crash. (Why our level bugged out)
Note: adding @export before a variable will allow it to show in the editor, so each instance of an object can have things set there. For instnace startingDirection of enemies is @export so some walk left and some walk right

Game overview
	Game manager is a singleton that gets automatically created. Inside of the game manager you control the rest of the game.
	Game manager has a state, each menu part is a state, and you open differnet menus by going through different states.
		To control states there is a ChangeState() which calls an EndState() so it can wrap up anything needed in that state, and a StartState() so it can do any 1 time actions
	Each menu is 1 scene object and it is always in the var currentMenuObject scene.
	Note: menus control their own logic in their own script, each script tells buttons what to do.
Level:
	The level is a tilemap. All a tilemap is, is a grid of 32x32 pixel tiles (We can change size if needed but all tiles msut be the same size). Tiles can not have logic, except for a hitbox for collisions. To add new tiles, add another 32x32 inside of the images/tilemap.png. 
	
	Pausing game: For all entities, at the start of each update function check that gamestate = gameState.GAMEPLAY, if not just return
	
Adding sprites:
	Im adding sprites from the spritesheet, to do that i drag the spritesheet onto texture, and in region i check enabled ,and set the offsets to the correct values. Also make sure to scale it by 2 on x & y
	
Level Editor:
	To add an assist to the level editor:
		1) get the scene path and store in a var (can drag it)
		2) set an itemsButton[x].pressed.connect to a new function for creating that item. #Im not sure how to pass parameters to a pressed.connect so this is how im handling it
		3) in that function just copy whats in _buySpring() and replace the scene.
		4) the rest of the system is set up so that it does not care what item you have selected.
		
	
TODO:
Quiz
	Get Money for answering

Assists
	Springs (Functionality)
	Figure out rest of them
	
Traps
	Figure out what to do 
	
Level Editor
	Rest of assits
	
Enemies
	Flyer
	Walker
	Jumper

Player
	Health
	Attacks
	
Goal
Multiple Levels