extends StaticBody2D

func _on_Area2D_body_entered(body):
	if body.is_in_group("enemy"):
		get_tree().change_scene("res://Game_Over.tscn")
