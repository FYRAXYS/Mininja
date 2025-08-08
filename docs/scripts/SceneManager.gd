extends Node

func change_scene(path: String) -> void:
	var new_scene = load(path).instantiate()

	var current = get_tree().current_scene
	if current:
		current.call_deferred("free")  # éviter l’erreur "locked object"

	get_tree().root.add_child(new_scene)
	get_tree().current_scene = new_scene
