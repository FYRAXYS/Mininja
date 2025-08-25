extends Button


func _pressed() -> void:
	get_tree().change_scene_to_file(SaveManager.data["current_level"])
