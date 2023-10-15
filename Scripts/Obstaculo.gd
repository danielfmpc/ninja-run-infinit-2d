extends Area2D

@export var speed : float = 1.0
var ja_passou = false

## Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (!Global.gameover):
		position.x -= speed
		if (position.x <= -100):
			queue_free()
		
		var player = get_parent().get_node("Character")
		
		if (position.x < player.position.x and !ja_passou):
			Global.score += 1
			ja_passou = true


func _on_box_body_entered(body):
	if (body.name == "Character"):
		Global.gameover = true
		if (Global.record < Global.score):
			Global.record = Global.score
			Global.save_record()

func _on_rock_body_entered(body):
	if (body.name == "Character"):
		Global.gameover = true
		if (Global.record < Global.score):
			Global.record = Global.score
			Global.save_record()
