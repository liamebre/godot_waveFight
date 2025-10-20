extends weapons



var active = true: set = set_active
func set_active(value):
	active = value
	set_process(value)
	set_process_input(value)
	
func _ready():
	damage = 5
	speed = 4
	maxAngle = deg_to_rad(180)
	
	$AttackTime.wait_time = speed/8
	$AttackTime.start()
	$AnimatedSprite2D.play()
	
	set_contact_monitor(true)
	set_max_contacts_reported(100)

func _process(delta):	
	var mousePos = get_global_mouse_position()
	var rotationAngle = global_position.angle_to_point(mousePos)
	rotation = rotationAngle
	# i need to get the player node wiht out getting the player node and casuing recursion
	#rotation = lerp_angle(minAngle,maxAngle,tt)
	tt += delta * 4
	
func _on_attack_time_timeout() -> void:
	queue_free()
	
func set_pos(pos):
	global_position = pos
	
