extends Node2D


var save_path = "res://saves/currrent_level.save"
var level_path = "res://scenes/levels/lvl_3.tscn"

func save(level_path):
	var file = FileAccess.open("res://saves/currrent_level.save", FileAccess.WRITE)
	file.store_var(level_path)
	file.close()


var paused = false
@onready var menu_pause = $Player/menu_pause
@onready var door = $Door

func _on_button_button_pressed() -> void:
	door.set_monitoring(true)
	print("bouton activé")

func _on_door_body_entered(body: Node2D) -> void:
	print(door.is_monitoring())
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

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
