extends Actor

export var acceleration = 10
export var friction = 1000

func _physics_process(delta):
	var direction := Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	# move to right 1.0, moving to left -1.0
	direction = direction.normalized()
	
	# acceleration
	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(direction * max_speed, acceleration)
		
		# limit speed to max_speed
		if velocity.x > max_speed or velocity.x < max_speed * -1:
			velocity.x = max_speed * direction.x
		if velocity.y > max_speed or velocity.y < max_speed * -1:
			velocity.y = max_speed * direction.y
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	print(velocity)
