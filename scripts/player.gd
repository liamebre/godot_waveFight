extends CharacterBody2D
@export var weapon: PackedScene
@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var dashSpeed = speed * 3
var tt = 0.0
var lastDash = 0.0
signal hit
signal die
var attack
var health = 50
var kids
var score = 0 


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
	if health <= 0:
		died()
	
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

func _on_body_entered(_body):
	hide() # Player disappears after being hit.
	hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)
	
	if _body.is_in_group("badGuy"):
		health -= 5 
		print(health)
		
func died():
	die.emit()
