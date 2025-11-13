extends CharacterBody2D


func _on_player_detect() -> void:
	for child in get_children() :
		if child is RayCast2D :
			#print("raycast | ", child)
			
			var collider = child.get_collider()
			if collider && collider.get_class() == "CharacterBody2D" :
				#print("/// Player detected ///") 
				await get_tree().create_timer(0.2).timeout 
				get_tree().change_scene_to_file("res://scenes/menus/gameover.tscn")
			#else :
				#print("/////////////////////////")
