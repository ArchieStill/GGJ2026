extends Control

var menu_open = false
var mouse_already_visible = false
@onready var main_audio_loop = $"../AudioStreamPlayer"

var master_index= AudioServer.get_bus_index("Master")
var BGM_index= AudioServer.get_bus_index("BGM")
var SFX_index= AudioServer.get_bus_index("SFX")

func _ready() -> void:
	AudioServer.set_bus_volume_db(master_index,linear_to_db($MasterAudioSlider.max_value)) 
	AudioServer.set_bus_volume_db(BGM_index,linear_to_db($BGMAudioSlider.max_value)) 
	AudioServer.set_bus_volume_db(SFX_index,linear_to_db($SFXAudioSlider.max_value)) 

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
	AudioServer.set_bus_volume_db(master_index,linear_to_db($MasterAudioSlider.value)) 
	
func _on_bgm_audio_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(BGM_index,linear_to_db($BGMAudioSlider.value)) 

func _on_sfx_audio_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(SFX_index,linear_to_db($SFXAudioSlider.value)) 
