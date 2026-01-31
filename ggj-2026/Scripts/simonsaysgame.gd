extends Control

var pattern = randi_range(1,1) # CHANGE BACK TO 1,10
@onready var anim: AnimationPlayer = $ButtonPatterns
var code = ""
var target_code = "RBGY"

func _ready() -> void:
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

func _on_start_timer_timeout() -> void:
	match pattern:
		1: anim.play("Pattern 1")

func _on_red_pressed() -> void:
	code = code + "R"
	_code_check()
func _on_blue_pressed() -> void:
	code = code + "B"
	_code_check()
func _on_green_pressed() -> void:
	code = code + "G"
	_code_check()
func _on_yellow_pressed() -> void:
	code = code + "Y"
	_code_check()

func _code_check():
	if code == target_code:
		anim.play("win_anim")
