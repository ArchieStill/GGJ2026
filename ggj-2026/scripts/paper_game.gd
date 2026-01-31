extends Control

var paperInside = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_box_back_body_entered(body: Node2D) -> void:
	if body.is_in_group("paper"):
		if body._getBox() == false:
			paperInside += 1
			body._setBox(true)
			print(paperInside)

func _on_box_back_body_exited(body: Node2D) -> void:
	if body.is_in_group("paper"):
		if body._getBox() == true:
			paperInside -= 1
			body._setBox(false)
			print(paperInside)

func _process(delta: float) -> void:
	if paperInside >= 4:
		print("won")
