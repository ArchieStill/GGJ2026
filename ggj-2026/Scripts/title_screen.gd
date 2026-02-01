extends Control

@onready var anim: AnimationPlayer = $AnimationPlayer
var quit = false

func _on_play_pressed() -> void:
	quit = false
	anim.play("fade_out")
func _on_quit_pressed() -> void:
	quit = true
	anim.play("fade_out")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_out":
		if quit:
			get_tree().quit()
		else:
			get_tree().change_scene_to_file("res://Scenes/game.tscn")
