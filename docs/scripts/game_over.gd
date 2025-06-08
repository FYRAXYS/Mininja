extends Button


func _pressed() -> void:
	if(FileAccess.file_exists("res://saves/currrent_level.save")) :
		load_data()
	else :
		get_tree().change_scene_to_file("res://scenes/levels/lvl_1.tscn")


func load_data() :
	var file = FileAccess.open("res://saves/currrent_level.save", FileAccess.READ)
	var level_path_reload = file.get_var()
	file.close()
	
	get_tree().change_scene_to_file(level_path_reload)
