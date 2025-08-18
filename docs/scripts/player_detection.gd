extends RayCast2D


func _physics_process(_delta: float) -> void:

	if is_colliding() :
		if get_collider().get_class() ==  "CharacterBody2D":
			#print("/// Player detected ///") 
			await get_tree().create_timer(0.4).timeout 
			get_tree().change_scene_to_file("res://scenes/menus/gameover.tscn")
