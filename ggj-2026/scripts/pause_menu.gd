extends Control

var menu_open = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("toggle_menu"):
		if(menu_open):
			hide()
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			menu_open = false
		else:
			show()
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			menu_open = true

func _on_quit_game_button_button_down() -> void:
	get_tree().quit()
