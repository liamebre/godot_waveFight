extends weapons

@export var damage: int = 3
@export var speed: int = 1
@export var size: int = 1

var active = true: set = set_active

func set_active(value):
	active = value
	set_process(value)
	set_process_input(value)
	
func _ready():
	print("sword")
	$AnimatedSprite2D.play()
	
func _on_body_shape_entered(_body):
	_body.health -= damage
