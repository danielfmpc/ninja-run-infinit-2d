extends Marker2D

var enemy = preload("res://Scenes/scene_enemy.tscn")
var enemy2 = preload("res://Scenes/scene_enemy_2.tscn")

@export var min_pos : float
@export var max_pos : float

## Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_timer_timeout():
	if (!Global.gameover):
		randomize()
		$Timer.wait_time = randi_range(2,5)
		
		var number_random = randi_range(0,100)
		
		var obj
		
		if (number_random <= 50):
			obj = enemy.instantiate()
			var pos_y = randf_range(max_pos,min_pos)	
			obj.position = Vector2(position.x, pos_y)
		else:
			obj = enemy2.instantiate()
			obj.position = Vector2(position.x, 582)
			
		
		get_parent().add_child(obj)
