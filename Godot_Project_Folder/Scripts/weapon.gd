extends Node2D



func _on_area_2d_body_entered(body):
	if body.is_in_group("Enemy"):
		print("Hello")
		body.queue_free()
