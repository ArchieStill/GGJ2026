extends Control

signal finished

@onready var input: LineEdit = $TextInput
@onready var target_word: Label = $TargetWord

var line
var index = 1
var words_done = 0
var can_type = false

func _ready() -> void:
	line = Typinggamewords.Text.pick_random()
	target_word.text = line
	input.grab_focus()

func _process(_delta: float) -> void:
	if can_type:
		input.grab_focus()
	else:
		input.release_focus()

func _on_text_input_text_changed(new_text: String) -> void:
	if new_text == target_word.text:
		_new_word()
		input.clear()
		if words_done == 5:
			can_type = false
			target_word.text = "YAY"
			print("YOU WIN")
			$EndTimer.start()

func _new_word():
	line = Typinggamewords.Text.pick_random()
	target_word.text = line
	words_done += 1
	$Goal.text = str(words_done) + "/5"


func _on_end_timer_timeout() -> void:
	hide()
	emit_signal("finished")
