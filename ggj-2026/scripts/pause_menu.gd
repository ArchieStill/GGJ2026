extends Control

var menu_open = false
@onready var main_audio_loop = $"../AudioStreamPlayer"

func _ready() -> void:
	main_audio_loop.volume_linear = $AudioSlider.max_value

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


func _on_audio_slider_value_changed(value: float) -> void:
	main_audio_loop.volume_linear = value
