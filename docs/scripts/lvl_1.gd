extends Node2D


var level_path = "res://scenes/levels/lvl_1.tscn"

@onready var arrow = %Arrow


func save(path: String):
	var file = FileAccess.open("res://ressources/saves/currrent_level.save", FileAccess.WRITE)
	file.store_var(path) 
	file.close()

var paused = false
@onready var menu_pause = $Player/menu_pause

func _on_door_body_entered(_body: Node2D) -> void:
	get_tree().change_scene_to_file("res://scenes/levels/lvl_2.tscn")

func _process(_delta: float) -> void:
	DiscordManager.change_state("Playing level 1")
	DiscordManager.change_level(1)
	
	save(level_path)
	
	if Input.is_action_just_pressed("pause_menu"):
		pauseMenu()
	
	arrow.look_at($Door.global_position)

func pauseMenu():
	if paused :
		menu_pause.hide()
		get_tree().paused = false
	else :
		menu_pause.show()
		get_tree().paused = true
	
	paused = !paused
