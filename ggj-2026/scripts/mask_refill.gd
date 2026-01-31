extends Area3D

signal refill

func _on_body_entered(body: Node3D) -> void:
	emit_signal("refill")
	self.queue_free()
