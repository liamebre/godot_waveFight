extends CharacterBody2D
@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var dashSpeed = speed * 3
var tt = 0.0
var lastDash = 0.0

func _ready():
	screen_size = get_viewport_rect().size
	
func _physics_process(delta):
	tt+= delta
	get_input()
	move_and_collide(velocity * delta)
	
func get_input():
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if Input.is_action_just_pressed("dash")&&tt - lastDash > 0.50:
		$dashTimer.start()
		lastDash = tt #adds a pause inbetween dashes 
		speed = dashSpeed#stops stacking the dash multiplier
	velocity = input_dir * speed

func _on_dash_timer_timeout() -> void:
	speed = 400
