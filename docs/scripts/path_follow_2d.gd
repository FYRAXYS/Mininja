extends PathFollow2D

@onready var timer = %EnemyTimer

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("move_down") :
		timer.start()
	elif Input.is_action_just_pressed("move_up") :
		timer.start()
	elif Input.is_action_just_pressed("move_left") :
		timer.start()
	elif Input.is_action_just_pressed("move_right") :
		timer.start()
	
	if Input.is_action_just_pressed("Pass") :
		timer.start()


func _on_enemy_timer_timeout() -> void:
	# avancée de base : 32
	for i in range(8) :
		await get_tree().create_timer(0.01).timeout
		progress += 4
