extends ProgressBar

func _ready():
	value = 50
	$Timer.start()

func _on_Timer_timeout():
	value -= 1
	$Timer.start()
	
func _process(delta):
	if value <= 0:
		get_tree().change_scene("res://You_win.tscn")
