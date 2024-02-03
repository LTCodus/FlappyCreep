extends CharacterBody2D

var screen_size
signal hit
signal ScoreUp
var game_running = false
var has_control = false
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size # gets the viewport size and sets the variable
	$AnimatedSprite2D.play("flap") # plays the flap animation on a loop

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	if game_running == true: # checks if game is running
		velocity.y += 12 # applies gravity if game is running
	if has_control: # checks if player has control
		if Input.is_action_pressed("move_up"): # set velocity when "move_up' is pressed
			velocity.y -= 50 # move player up
	
		
	
	
	move_and_slide() # needed to apply physics to character
	position.y = clamp(position.y, 0, screen_size.y)
	if position.y == 0 or position.y == screen_size.y:
		velocity.y = 0
	
func set_start_position(pos): # sets player start position
	position = pos
	show()
	

func _on_area_2d_area_entered(body):
	if body.name == "ScoreGate":
		ScoreUp.emit()
		print("score")
	else:
		velocity = Vector2.ZERO
		hit.emit()
		
		
	
	
