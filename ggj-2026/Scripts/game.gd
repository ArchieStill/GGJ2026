extends Node3D

func _on_mask_refill_refill() -> void:
	$MaskHealth.value = 100


func _on_interact_point_typing() -> void:
	$Minigames/TypingGame.show()
	$Minigames/TypingGame.can_play = true
	$Player.can_move = false
func _on_typing_game_finished() -> void:
	$Player.can_move = true

func _on_interact_point_coffee() -> void:
	$Minigames/CoffeeGame.show()
	$Minigames/CoffeeGame.can_play = true
	$Player.can_move = false
func _on_coffee_game_finished() -> void:
	$Player.can_move = true
	

func _on_interact_point_simonsays() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$Minigames/SimonSaysGame.show()
	$Minigames/SimonSaysGame.start_timer.start()
	$Minigames/SimonSaysGame.can_play = true
	$Player.can_move = false
func _on_simon_says_game_finished() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$Player.can_move = true
