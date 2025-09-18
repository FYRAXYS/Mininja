extends PathFollow2D

@onready var timer = %EnemyTimer
var is_moving: bool = false
var pressed_direction_key: bool = false
var player_moved: bool = false

func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("move_down") && player_moved :
		pressed_direction_key = true
	elif Input.is_action_just_pressed("move_up") && player_moved :
		pressed_direction_key = true
	elif Input.is_action_just_pressed("move_left") && player_moved :
		pressed_direction_key = true
	elif Input.is_action_just_pressed("move_right") && player_moved :
		pressed_direction_key = true
	
	if Input.is_action_just_pressed("Pass") :
		pressed_direction_key = true
	
	if pressed_direction_key :
		timer.start()
		pressed_direction_key = false
		player_moved = false
	


func _on_enemy_timer_timeout() -> void:
	is_moving = true
	# avancée de base : 32
	for i in range(8) :
		await get_tree().create_timer(0.01).timeout
		progress += 4
	is_moving = false


func _on_player_moved() -> void:
	player_moved = true
	print(player_moved , " | " , pressed_direction_key)
