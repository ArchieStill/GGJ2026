extends Control

var folder_scene = preload("res://Scenes/Minigames/FolderPreset.tscn")
var foldersToSolve = 5
var can_play = false

func _ready() -> void:
	for i in range(5):
		var new_num = randi() % Namelist.Text.size()
		
		$FolderController.get_child(i).get_child(4).text = Namelist.Text[new_num]
		

func _on_ah_body_entered(body: Node2D) -> void:
	name = body.get_child(4).text
	var letter_num = ord(name.left(1).to_upper()) - ord('A')
	if (letter_num >= 0 && letter_num <= 7):
		body.queue_free()
		foldersToSolve -= 1
		_check_finish()

func _on_ip_body_entered(body: Node2D) -> void:
	name = body.get_child(4).text
	var letter_num = ord(name.left(1).to_upper()) - ord('A')
	if (letter_num >= 8 && letter_num <= 15):
		body.queue_free()
		foldersToSolve -= 1
		_check_finish()

func _on_qz_body_entered(body: Node2D) -> void:
	name = body.get_child(4).text
	var letter_num = ord(name.left(1).to_upper()) - ord('A')
	if (letter_num >= 16 && letter_num <= 25):
		body.queue_free()
		foldersToSolve -= 1
		_check_finish()
		
func _check_finish():
	if foldersToSolve == 0:
		print("won")
