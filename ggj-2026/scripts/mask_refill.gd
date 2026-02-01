extends Area3D

signal refill

func _ready() -> void:
	get_parent()._set_signal()

func _on_body_entered(body: Node3D) -> void:
	if body.get_name() == "Player":
		emit_signal("refill")
		self.queue_free()
