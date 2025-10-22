extends CharacterBody2D
@export var weapon: PackedScene
@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var dashSpeed = speed * 3
var tt = 0.0
var lastDash = 0.0
var attack
var health = 50
var kids
var score = 0 
signal dead


func _ready():
	screen_size = get_viewport_rect().size
	hide()
	
func start(pos):
	kids = get_child_count()
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
func _physics_process(delta):
	tt+= delta
	get_input()
	move_and_collide(velocity * delta)
	if attack:
		attack.set_pos(position)
	
func get_input():
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if Input.is_action_just_pressed("dash")&&tt - lastDash > 0.50:
		$dashTimer.start()
		lastDash = tt #adds a pause inbetween dashes 
		speed = dashSpeed#stops stacking the dash multiplier
	velocity = input_dir * speed
	if Input.is_action_just_pressed("Lmouse") and get_child_count(false) == kids:
		attack = weapon.instantiate()
		add_child(attack)

func _on_dash_timer_timeout() -> void:
	speed = 400

func _on_area_2d_body_entered(body):
	if body.is_in_group("badGuy") && $hitTimer.time_left == 0:
		$hitTimer.start()
		print("hit")
		health -= body.damage
		if health <= 0:
			dead.emit()
