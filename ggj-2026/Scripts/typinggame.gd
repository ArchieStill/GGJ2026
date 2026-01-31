extends Control

signal finished

@onready var input: LineEdit = $TextInput
@onready var target_word: Label = $TargetWord

var line
var index = 1
var last_caret_pos: int = 0
var words_done = 0
var can_play = false

func _ready() -> void:
	line = Typinggamewords.Text.pick_random()
	target_word.text = line
	input.grab_focus()

func _process(_delta: float) -> void:
	if can_play:
		input.grab_focus()
	else:
		input.release_focus()

func _on_text_input_text_changed(new_text: String) -> void:
	last_caret_pos = input.caret_column
	input.text = new_text.to_upper()
	input.caret_column = last_caret_pos
	if input.text == target_word.text:
		_new_word()
		input.clear()
		if words_done == 3:
			can_play = false
			target_word.text = "YAY"
			$EndTimer.start()

func _new_word():
	line = Typinggamewords.Text.pick_random()
	target_word.text = line
	words_done += 1
	$Goal.text = str(words_done) + "/3"


func _on_end_timer_timeout() -> void:
	hide()
	emit_signal("finished")
