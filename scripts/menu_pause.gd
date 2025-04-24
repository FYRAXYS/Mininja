extends Control

@onready var main_scene = $"../../"

func _on_resume_pressed() -> void:
	main_scene.pauseMenu()
	


func _on_exit_pressed() -> void:
	get_tree().quit()
