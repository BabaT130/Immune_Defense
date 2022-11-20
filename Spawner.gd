extends Position2D

var enemy = preload("res://Virus_Pawn.tscn")
var rand = RandomNumberGenerator.new()
var spawn_time = 3
var num = 3

func _ready():
	$Timer.start()
	$Timer2.start()


func _on_Timer_timeout():
	for i in range(num):
		var virus = enemy.instance()
		virus.position = Vector2(rand_range(100, 700), 0)
		add_child(virus)
		$Timer.start(spawn_time)


func _on_Timer2_timeout():
	num += 1
	$Timer2.start()
