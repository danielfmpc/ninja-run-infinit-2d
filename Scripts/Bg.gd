extends Sprite2D


# Called when the node enters the scene tree for the first time.

@export var speed : float = 0.0

var displacement : float = 0.0
const resetDisplacement : float = 0.0

var hight : int
var width : int

func _ready():
	var width_screen = get_viewport().size.x
#	var hight_screen = get_viewport().size.y	
	self.region_rect.size.x = width_screen
	hight = self.texture.get_height()
	width = self.texture.get_width()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (!Global.gameover):
		displacement += speed

		self.region_rect.position = Vector2(displacement,0)
		
		if (displacement >= width):
			displacement = resetDisplacement
