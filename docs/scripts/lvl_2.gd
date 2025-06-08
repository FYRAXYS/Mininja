extends Node2D


var save_path = "res://saves/currrent_level.save"
var level_path = "res://scenes/levels/lvl_2.tscn"

func save(level_path):
	var file = FileAccess.open("res://saves/currrent_level.save", FileAccess.WRITE)
	file.store_var(level_path) 
	file.close()

var paused = false
@onready var menu_pause = $Player/menu_pause

func _on_door_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://scenes/levels/lvl_3.tscn")

func _process(delta: float) -> void:
	save(level_path)
	
	if Input.is_action_just_pressed("pause_menu"):
		pauseMenu()
	
func pauseMenu():
	if paused :
		menu_pause.hide()
		get_tree().paused = false
	else :
		menu_pause.show()
		get_tree().paused = true
	
	paused = !paused
