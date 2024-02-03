extends Node2D

@export var wall_scene: PackedScene # lets you pick what scene is the wall
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func game_over():
	$WallTimer.stop() # stop the wall spawn timer
	for wallgameover in $Walls.get_children():
		wallgameover.gamerunning = false
	
	$PlayerRigid2D.has_control = false
	$HUD/StartButton.show()

func new_game():
	$WallTimer.start() # starts the wall timer
	$PlayerRigid2D.game_running = true # sets players gamerunning to true
	score = 0 # resets score to zero
	$HUD/Score.text = str(score) # resets HUD score to score value on game start
	for wallgameover in $Walls.get_children(): # gets a list of all of the children of walls
		wallgameover.queue_free() # deletes walls on screen
	$PlayerRigid2D.set_start_position($PlayerSpawn.position) # resets player to start pos on game start
	$PlayerRigid2D.has_control = true # gives player control on game start

func _on_wall_timer_timeout():
	var wall = wall_scene.instantiate() # create instance of wall scene and makes that the wall variable
	$Walls.add_child(wall) # adds wall to scene
	wall.position = $WallSpawn.position # sets wall position to WallSpawn
	wall.position.y += randi_range(-300, 300) # randomizes y value of walls to add variation
	



func _on_player_rigid_2d_score_up(): # listens to Players score emit, then increments score
	score += 1
	$HUD/Score.text = str(score)
