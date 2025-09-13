extends Node

var activity := DiscordppActivity.new()
var client := DiscordppClient.new()

func _ready() -> void:
	print("Discord Social SDK prêt")

	# Configuration de l’activité
	activity.SetApplicationId(1338905665820688437) # Ton App ID
	activity.SetType(DiscordppActivityTypes.Playing)
	activity.SetDetails("Improving the game")
	activity.SetState("In the menu")
	activity.SetAssets("icon_large") # Clé de ton image dans le portail Discord
	
	var button1 := DiscordppActivityButton.new()
	button1.SetLabel("Join the Discord Server !");
	button1.SetUrl("https://discord.gg/yQnmPK5sPt");
	activity.AddButton(button1);
	
	# Mettre à jour la Rich Presence
	_send_activity()

func _process(_delta: float) -> void:
	Discordpp.RunCallbacks()

func _send_activity() -> void:
	client.UpdateRichPresence(activity, func(result: DiscordppClientResult) -> void:
		if result.Successful():
			print("Rich Presence mise à jour !")
	)
