extends KinematicBody2D

class_name Actor

export var max_speed := 500

var velocity := Vector2.ZERO

func _physics_process(delta):
	velocity = move_and_slide(velocity)
