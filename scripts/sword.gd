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
	
func _process(delta):
	rotation = lerp_angle(minAngle,maxAngle,tt)
	tt += delta * 4
	
func _on_body_shape_entered(_body):
	_body.health -= damage
	
func _on_attack_time_timeout() -> void:
	queue_free()
