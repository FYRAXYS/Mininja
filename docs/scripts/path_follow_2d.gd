extends PathFollow2D

@onready var timer = %EnemyTimer
#@onready var enemy = $"././EnemySprite"
var is_moving: bool = false
var pressed_direction_key: bool = false

func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("move_down") :
		pressed_direction_key = true
	elif Input.is_action_just_pressed("move_up") :
		pressed_direction_key = true
	elif Input.is_action_just_pressed("move_left") :
		pressed_direction_key = true
		#enemy.flip_h = true
	elif Input.is_action_just_pressed("move_right") :
		pressed_direction_key = true
		#enemy.flip_h = false
	
	if Input.is_action_just_pressed("Pass") :
		pressed_direction_key = true
	
	if pressed_direction_key :
		timer.start()
		pressed_direction_key = false


func _on_enemy_timer_timeout() -> void:
	is_moving = true
	# avancée de base : 32
	for i in range(8) :
		await get_tree().create_timer(0.01).timeout
		progress += 4
	is_moving = false
