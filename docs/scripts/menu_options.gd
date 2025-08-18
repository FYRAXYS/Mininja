extends Control

var reset_level_path = "res://scenes/levels/lvl_1.tscn"

func _on_reset_pressed() -> void:
	var file = FileAccess.open("res://ressources/saves/currrent_level.save", FileAccess.WRITE)
	file.store_var(reset_level_path) 
	file.close()


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/menu.tscn")
