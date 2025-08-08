extends Control

@onready var main_scene = $"../../"


func _ready() -> void:
	$MarginContainer/VBoxContainer/Resume.pressed.connect(_on_resume_pressed)
	$MarginContainer/VBoxContainer/Exit.pressed.connect(_on_exit_pressed)

func _on_resume_pressed():
	main_scene.pauseMenu()


func _on_exit_pressed():
	SceneManager.change_scene("res://scenes/menus/menu.tscn")
