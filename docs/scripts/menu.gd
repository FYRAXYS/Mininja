extends Control



func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/lvl_1.tscn")


func _on_level_selection_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu_lvls.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_discord_button_pressed() -> void:
	OS.shell_open("https://discord.gg/yQnmPK5sPt")
