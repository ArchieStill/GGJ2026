extends Node3D

func _on_mask_refill_refill() -> void:
	$UI._new_mask()

func _on_interact_point_typing() -> void:
	$TypingGame.show()
	$TypingGame.can_play = true
	$Player.can_move = false
	$UI.current_goal.hide()
func _on_typing_game_finished() -> void:
	Global.MinigamesCompleted += 1
	Global._randomise_goal()
	$Player.can_move = true
	$UI.current_goal.show()

func _on_interact_point_coffee() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$CoffeeGame.show()
	$CoffeeGame.can_play = true
	$Player.can_move = false
	$UI.current_goal.hide()
func _on_coffee_game_finished() -> void:
	Global.MinigamesCompleted += 1
	Global._randomise_goal()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$Player.can_move = true
	$UI.current_goal.show()
	
func _on_interact_point_simonsays() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$SimonSaysGame.show()
	$SimonSaysGame.start_timer.start()
	$SimonSaysGame.can_play = true
	$Player.can_move = false
	$UI.current_goal.hide()
func _on_simon_says_game_finished() -> void:
	Global.MinigamesCompleted += 1
	Global._randomise_goal()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$Player.can_move = true
	$UI.current_goal.show()

func _on_interact_point_folder() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$FolderGame.show()
	$FolderGame._toggle_can_play()
	$Player.can_move = false
	$UI.current_goal.hide()
func _on_folder_game_finished() -> void:
	Global.MinigamesCompleted += 1
	Global._randomise_goal()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$UI.current_goal.show()
	$Player.can_move = true


func _on_interact_point_paper() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$PaperGame.show()
	$Player.can_move = false
func _on_paper_game_finished() -> void:
	Global.MinigamesCompleted += 1
	Global._randomise_goal()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$Player.can_move = true

func _set_signal():
	var mask = get_node("maskRefill")
	mask.refill.connect(_on_mask_refill_refill)
