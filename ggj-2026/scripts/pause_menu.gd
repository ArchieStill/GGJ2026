extends Control

var menu_open = false
var mouse_already_visible = false
@onready var main_audio_loop = $"../AudioStreamPlayer"

func _ready() -> void:
	main_audio_loop.volume_linear = $AudioSlider.max_value

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("toggle_menu"):
		if(menu_open):
			hide()
			if (!mouse_already_visible):
				Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			menu_open = false
		else:
			show()
			if (Input.mouse_mode == Input.MOUSE_MODE_VISIBLE):
					mouse_already_visible = true
			else:
				Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			menu_open = true

func _on_quit_game_button_button_down() -> void:
	get_tree().quit()


func _on_audio_slider_value_changed(value: float) -> void:
	main_audio_loop.volume_linear = value
