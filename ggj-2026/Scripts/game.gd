extends Node3D

func _on_mask_refill_refill() -> void:
	$MaskHealth.value = 100


func _on_interact_point_typing() -> void:
	$TypingGame.show()
	$TypingGame.can_play = true
	$Player.can_move = false
func _on_typing_game_finished() -> void:
	$Player.can_move = true

func _on_interact_point_coffee() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$CoffeeGame.show()
	$CoffeeGame.can_play = true
	$Player.can_move = false
func _on_coffee_game_finished() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$Player.can_move = true
	
func _on_interact_point_simonsays() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$SimonSaysGame.show()
	$SimonSaysGame.start_timer.start()
	$SimonSaysGame.can_play = true
	$Player.can_move = false
func _on_simon_says_game_finished() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$Player.can_move = true

#func _on_interact_point_folder() -> void:
	#Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	#$FolderGame.show()
	#$FolderGame.can_play = true
	#$Player.can_move = false


func _on_interact_point_paper() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$PaperGame.show()
	$PaperGame.can_play = true
	$Player.can_move = false
func _on_paper_game_finished() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$Player.can_move = true
