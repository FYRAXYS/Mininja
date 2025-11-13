extends Node2D


var level_path = "res://scenes/levels/lvl_1.tscn"

@onready var arrow = %Arrow

var paused = false
@onready var menu_pause = $Player/menu_pause

func _ready() -> void:
	for child in $"borders".get_children() :
		if child is AnimatedSprite2D :
			child.play()

func _process(_delta: float) -> void:
	SaveManager.update_level(level_path)
	
	if Input.is_action_just_pressed("pause_menu"):
		pauseMenu()
	
	if SaveManager.data["arrow"] :
		arrow.look_at($Door.global_position)
	else :
		arrow.hide()




func _on_door_body_entered(_body: Node2D) -> void:
	get_tree().change_scene_to_file("res://scenes/levels/lvl_2.tscn")


func pauseMenu():
	if paused :
		menu_pause.hide()
		get_tree().paused = false
	else :
		menu_pause.show()
		get_tree().paused = true
	
	paused = !paused
