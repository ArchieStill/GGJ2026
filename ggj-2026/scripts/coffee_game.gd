extends Control

signal finished

@onready var path = $Path2D/PathFollow2D
var number = 0
@onready var mug = $Path2D/PathFollow2D/ProgressBar

func _ready():
	path.progress_ratio = randf()
	
func _physics_process(delta: float) -> void:
	path.set_progress(path.get_progress() + 200 * delta)
	
	if Input.is_action_pressed("interact"):
		$Coffee.show()
		var overlaplist = $Coffee/Area2D.get_overlapping_areas()
		if (overlaplist.size() > 0):
			mug.value += 1 
			if mug.value >= 100:
				emit_signal("finished")
		else:
			$CoffeeSpill.show()
	
	if Input.is_action_just_released("interact"):
		$Coffee.hide()
