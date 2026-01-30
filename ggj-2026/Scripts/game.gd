extends Node3D


func _on_interact_point_interacted() -> void:
	$TypingGame.show()
	$TypingGame.can_type = true
	$Player.can_move = false


func _on_typing_game_finished() -> void:
	$Player.can_move = true
