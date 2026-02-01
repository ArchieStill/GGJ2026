extends Control

signal finished

@onready var input: LineEdit = $TextInput
@onready var target_word: Label = $TargetWord

var line
var index = 1
var last_caret_pos: int = 0
var words_done = 0
var can_play = false
var allowed_characters = "[A-Za-z]"

func _ready() -> void:
	line = Typinggamewords.Text.pick_random()
	target_word.text = line
	input.grab_focus()
	$Typing.volume_linear = 0.5

func _process(_delta: float) -> void:
	if can_play:
		input.grab_focus()
	else:
		input.release_focus()

func _on_text_input_text_changed(new_text: String) -> void:
	# Prevents non-letters from being typed
	var old_caret_position = input.caret_column
	var word = ''
	var regex = RegEx.new()
	regex.compile(allowed_characters)
	for valid_character in regex.search_all(new_text):
		word += valid_character.get_string()
	input.text = word.to_upper()
	input.caret_column = old_caret_position
	$Typing.playing = true
	if input.text == target_word.text:
		_new_word()
		input.clear()
		if words_done == 3:
			can_play = false
			input.hide()
			target_word.hide()
			$WinText.show()
			#target_word.text = "YAY"
			$EndTimer.start()
			

func _new_word():
	line = Typinggamewords.Text.pick_random()
	target_word.text = line
	words_done += 1
	$Goal.text = str(words_done) + "/3"


func _on_end_timer_timeout() -> void:
	hide()
	emit_signal("finished")
