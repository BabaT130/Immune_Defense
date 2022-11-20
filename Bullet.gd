extends RigidBody2D

func _ready():
	$Timer.start()

func _on_Area2D_body_entered(body):
	if body.is_in_group("enemy"):
		body.health -= 1
		queue_free()

func _on_Timer_timeout():
	queue_free()
