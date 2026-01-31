extends Control

@onready var timer = $ProgressBar

func _ready() -> void:
	timer.value = 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer.value -= delta
	pass

func _on_progress_bar_value_changed(value: float) -> void:
	if value == 0:
		print("GAME OVER")

func setValue(new):
	timer.value = new
