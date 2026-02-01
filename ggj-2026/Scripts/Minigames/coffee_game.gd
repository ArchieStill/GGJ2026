extends Control

signal finished

@onready var path = $Path2D/PathFollow2D
var number = 0
@onready var mug = $ProgressBar
var can_play = false

func _ready():
	path.progress_ratio = randf()
	
func _physics_process(delta: float) -> void:
	if can_play:
		path.set_progress(path.get_progress() + 500 * delta)
		
		#$Coffee.position = Vector2(567, 272 + (1 * delta))
		
		#if Input.is_action_pressed("interact"):
			#$Coffee.show()
			#var overlaplist = $Coffee/Area2D.get_overlapping_areas()
			#if (overlaplist.size() > 0):
				#mug.value += 2.5 
				#if mug.value >= 100:
					#can_play = false
					#$EndTimer.start()
			#else:
				#$CoffeeSpill.show()


func _on_end_timer_timeout() -> void:
	hide()
	emit_signal("finished")


func _on_coffee_button_pressed() -> void:
	#$Coffee.position = Vector2(567,272)
	#var overlaplist = $Coffee/Area2D.get_overlapping_areas()
	#if (overlaplist.size() > 0):
	$AnimationPlayer.play("coffee")
	$AudioStreamPlayer.playing = true
	mug.value += 10
	if mug.value >= 100:
		$Overflow.show()
		$CoffeeButton.disabled = true
		$Scrumptious.show()
		can_play = false
		$EndTimer.start()
