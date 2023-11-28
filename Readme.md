My Understanding of godot

Everything in godot is a node and its part of a hierarchy, the player is made out of 
	-RigidBody
		-CollisionShape
		-Sprite2D

A collection of nodes is called a scene, the player is a scene, the levels are scenes(more on it later) and the menus are scenes

Note: when referencing a scene in a GDscript, drag the script into the editor and it will write out the path. the path MUST be case sensitive, otherwise when you build the game the scene wont appear and the game will crash. (Why our level bugged out)

Game overview
	Game manager is a singleton that gets automatically created. Inside of the game manager you control the rest of the game.
	Game manager has a state, each menu part is a state, and you open differnet menus by going through different states.
		To control states there is a ChangeState() which calls an EndState() so it can wrap up anything needed in that state, and a StartState() so it can do any 1 time actions
	Each menu is 1 scene object and it is always in the var currentMenuObject scene.
	Note: menus control their own logic in their own script, each script tells buttons what to do.
Level:
	The level is a tilemap. All a tilemap is, is a grid of 32x32 pixel tiles (We can change size if needed but all tiles msut be the same size). Tiles can not have logic, except for a hitbox for collisions. To add new tiles, add another 32x32 inside of the images/tilemap.png. 