extends RayCast2D


func _physics_process(delta: float) -> void:

	if is_colliding() :
		if get_collider().get_class() ==  "CharacterBody2D":
	##		print("/// Player detected ///") ## DEBUG
			%Dead.show()
			

			get_tree().change_scene_to_file("res://scenes/gameover.tscn")
			
	## else :
	##	print("///////////////////////") ## DEBUG
