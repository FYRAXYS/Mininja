extends Button


func _pressed() -> void:
	if(FileAccess.file_exists("res://saves/currrent_level.save")) :
		load_data_game_over()
	else :
		SceneManager.change_scene("res://scenes/levels/lvl_1.tscn")


func load_data_game_over() :
	var file = FileAccess.open("res://saves/currrent_level.save", FileAccess.READ)
	var level_path_reload = file.get_var()
	file.close()
	
	SceneManager.change_scene(level_path_reload)
