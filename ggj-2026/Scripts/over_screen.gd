extends Control

func _process(_delta: float) -> void:
	$Label2.text = "Minigames completed: " + str(Global.MinigamesCompleted)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/title.tscn")
