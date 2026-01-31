extends Node3D

func _on_mask_refill_refill() -> void:
	$timer.setValue(10)


func _on_interact_point_typing() -> void:
	$TypingGame.show()
	$TypingGame.can_play = true
	$Player.can_move = false
func _on_typing_game_finished() -> void:
	$Player.can_move = true

func _on_interact_point_simonsays() -> void:
	pass # Replace with function body.

func _on_interact_point_coffee() -> void:
	$CoffeeGame.show()
	$CoffeeGame.can_play = true
	$Player.can_move = false
func _on_coffee_game_finished() -> void:
	$Player.can_move = true
