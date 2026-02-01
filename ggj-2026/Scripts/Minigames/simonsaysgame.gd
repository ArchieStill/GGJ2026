extends Control

signal finished

var pattern = randi_range(1,10) # CHANGE BACK TO 1,10
@onready var anim: AnimationPlayer = $ButtonPatterns
@onready var start_timer: Timer = $StartTimer
@onready var pattern_timer: Timer = $PatternTimer
var code = ""
var target_code = "RBGY"
var code_index: int = 0
var score: int = 0
var can_play = false

func _ready() -> void:
	_pattern_set()

func _pattern_set():
	match pattern:
		1: target_code = "RBGY"
		2: target_code = "GGYB"
		3: target_code = "RYRG"
		4: target_code = "YGBG"
		5: target_code = "GRBB"
		6: target_code = "BYGR"
		7: target_code = "RBYR"
		8: target_code = "GYBG"
		9: target_code = "BRYB"
		10: target_code = "YRYG"

func _on_pattern_timer_timeout() -> void:
	if can_play:
		match pattern:
			1: anim.play("pattern1")
			2: anim.play("pattern2")
			3: anim.play("pattern3")
			4: anim.play("pattern4")
			5: anim.play("pattern5")
			6: anim.play("pattern6")
			7: anim.play("pattern7")
			8: anim.play("pattern8")
			9: anim.play("pattern9")
			10: anim.play("pattern10")

func _on_red_pressed() -> void:
	$ButtonPressAudio.playing = true
	code = code + "R"
	code_index += 1
	$ButtonCount.text = str(code_index) + "/4"
	_code_check()
	
func _on_blue_pressed() -> void:
	$ButtonPressAudio.playing = true
	code = code + "B"
	code_index += 1
	$ButtonCount.text = str(code_index) + "/4"
	_code_check()
	
func _on_green_pressed() -> void:
	$ButtonPressAudio.playing = true
	code = code + "G"
	code_index += 1
	$ButtonCount.text = str(code_index) + "/4"
	_code_check()
	
func _on_yellow_pressed() -> void:
	$ButtonPressAudio.playing = true
	code = code + "Y"
	code_index += 1
	$ButtonCount.text = str(code_index) + "/4"
	_code_check()

func _code_check():
	if code_index == 4:
		if code == target_code:
			anim.play("win_anim")
			$LevelPassAudio.playing = true
			score += 1
			$Score.text = str(score) + "/3"
			if score == 1:
				_win()
		else:
			anim.play("lose_anim")
			$LevelFailAudio.playing = true
		code_index = 0
		$ButtonGuard.mouse_filter = MOUSE_FILTER_STOP

func _on_button_patterns_animation_finished(anim_name: StringName) -> void:
	if anim_name == "win_anim" or anim_name == "lose_anim":
		pattern = randi_range(1,10)
		_pattern_set()
		code = ""
		pattern_timer.start()
		$ButtonCount.text = str(code_index) + "/4"
	else:
		$ButtonGuard.mouse_filter = MOUSE_FILTER_IGNORE

func _win():
	$ButtonGuard.mouse_filter = MOUSE_FILTER_STOP
	can_play = false
	$EndTimer.start()

func _on_end_timer_timeout() -> void:
	hide()
	emit_signal("finished")


func _on_start_timer_timeout() -> void:
	pattern_timer.start()
