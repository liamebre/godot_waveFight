extends CharacterBody2D
@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size
	
func get_input():
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_dir * speed
	if Input.is_action_just_pressed("dash"):
		pass
func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)
	

	
