extends Node2D

var gamerunning = true
@export var speed = 150 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if gamerunning == true: # checks if game is running, if it is, sets the walls movement
		position.x -= speed * delta # sets the walls movement



func _on_visible_on_screen_notifier_2d_screen_exited():
	print("wall removed")
	queue_free() # deletes wall when it leaves screen
