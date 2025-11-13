extends Node2D

var json_path = "user://saves/data.json"
var data:Dictionary = {}

var sample_data:Dictionary = {
	"current_level" : "res://scenes/levels/lvl_1.tscn",
	"arrow" : true,
	"color" : "R"
}


func _ready() -> void:
	load_file()

func create_file() -> void :
	# Ouverture du répertoire user
	var dir = DirAccess.open("user://")
	
	# Déplacement et potentielle création du répertoire "saves" s'il n'existe pas
	if dir.dir_exists("user://saves/") :
		dir.change_dir("user://saves/")
	else :
		dir.make_dir("./saves")
		dir.change_dir("user://saves/")
	
	# écriture du fichier de sauvegarde basique (sample_data)
	write_file(sample_data)


func write_file(new_data:Dictionary) -> void:
	var file = FileAccess.open(json_path, FileAccess.ModeFlags.WRITE)
	
	# vérifie l'existence du fichier :
	assert(file, "The file used for saving does not exist.")
	
	var json_text = JSON.stringify(new_data, "\t")
	file.store_string(json_text)
	
	file.close()


func load_file() -> void:
	
	# vérification de l'existence du fichier et potentielle création
	if !FileAccess.file_exists(json_path) :
		create_file()
	
	var file = FileAccess.open(json_path, FileAccess.READ)
	
	var json = file.get_as_text()
	var json_object = JSON.new()
	
	json_object.parse(json)
	data = json_object.data
	
	file.close()


func reset_data() -> void:
	data = sample_data
	write_file(data)


func update_level(level:String) -> void:
	data["current_level"] = level
	write_file(data)

#func get_level() :
	#return data["current_level"]


func update_arrow(want_arrow:bool) -> void:
	data["arrow"] = want_arrow
	write_file(data)

#func get_arrow():
	#return data["arrow"]


func update_color(color:String) -> void:
	data["color"] = color
	write_file(data)

#func get_color():
	#return data["current_level"]
