class_name weapons
extends RigidBody2D

var tt = 0.0
@export var damage: float = 3
@export var speed: float = 1
@export var size: float = 1
@export var minAngle: float = 0 
@export var maxAngle: float = 0


func _ready() -> void:
	pass
	
func _physics_process(_delta) -> void:	
	lerp_angle(minAngle,maxAngle,tt)
	tt += _delta
