extends Node3D

func _process(delta: float) -> void:
	match Global.CurrentGoal:
		1:
			$Typing.show()
			$Typing.monitoring = true
			$SimonSays.hide()
			$SimonSays.monitoring = false
			$Coffee.hide()
			$Coffee.monitoring = false
			$Folder.hide()
			$Folder.monitoring = false
		2:
			$Typing.hide()
			$Typing.monitoring = false
			$SimonSays.show()
			$SimonSays.monitoring = true
			$Coffee.hide()
			$Coffee.monitoring = false
			$Folder.hide()
			$Folder.monitoring = false
		3:
			$Typing.hide()
			$Typing.monitoring = false
			$SimonSays.hide()
			$SimonSays.monitoring = false
			$Coffee.show()
			$Coffee.monitoring = true
			$Folder.hide()
			$Folder.monitoring = false
		4:
			$Typing.hide()
			$Typing.monitoring = false
			$SimonSays.hide()
			$SimonSays.monitoring = false
			$Coffee.hide()
			$Coffee.monitoring = false
			$Folder.show()
			$Folder.monitoring = true
