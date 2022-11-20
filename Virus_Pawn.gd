extends KinematicBody2D

var velocity = Vector2(0, 0)
var target = null
var speed = rand_range(100, 200)
var health = 1

func _physics_process(delta):
	if target:
		velocity = position.direction_to(target.position) * speed
	
	move_and_slide(velocity)
	
	if health <= 0:
		queue_free()

func _on_Area2D_body_entered(body):
	if body.is_in_group("goal"):
		target = body
