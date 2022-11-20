extends KinematicBody2D

var velocity = Vector2(0, 0)
var bullet = preload("res://Bullet.tscn")
var can_fire = true
var weapon = "normal"

func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		velocity.y = -100
	elif Input.is_action_pressed("ui_down"):
		velocity.y = 100
	else:
		velocity.y = 0
	if Input.is_action_pressed("ui_left"):
		velocity.x = -100
	elif Input.is_action_pressed("ui_right"):
		velocity.x = 100
	else:
		velocity.x = 0
	
	if Input.is_mouse_button_pressed(1):
		if weapon == "normal":
			if can_fire:
				$Player.play("fire")
				var bullet_instance = bullet.instance()
				bullet_instance.position = $Position2D.position
				bullet_instance.rotation = self.rotation
				bullet_instance.apply_impulse(self.position, Vector2(1000, 0).rotated(rotation))
				add_child(bullet_instance)
				can_fire = false
				$Timer.start()
		elif weapon == "flamethrower":
			$Player.play("fire")
			var bullet_instance = bullet.instance()
			bullet_instance.position = $Position2D.position
			bullet_instance.rotation = self.rotation
			bullet_instance.apply_impulse(self.position, Vector2(1000, 0).rotated(rotation))
			add_child(bullet_instance)
			can_fire = false
	
	move_and_slide(velocity)
	look_at(get_global_mouse_position())

func _on_Timer_timeout():
	can_fire = true

func _on_Area2D_body_entered(body):
	if body.is_in_group("enemy"):
		queue_free()
