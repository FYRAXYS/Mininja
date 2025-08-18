extends Control

@onready var main_scene = $"../../"


func _on_resume_pressed():
	main_scene.pauseMenu()


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/menu.tscn")
