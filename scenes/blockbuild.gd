extends Sprite2D

var dragging = false
var of = Vector2(0,0)

var cnct = null;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging:
		position = get_global_mouse_position() 
	else:
		if cnct != null:
			position = cnct
			dragging = false

func _on_button_button_down():
	dragging = true
	of = get_global_mouse_position()

func _on_button_button_up():
	dragging = false
	$AudioStreamPlayer.play()

func areasnap(area):
	if dragging:
		cnct = area.get_parent().position 
		cnct += area.position*2

func _on_edge_area_entered(area):
	areasnap(area)

func _on_edge_2_area_entered(area):
	areasnap(area)

func _on_edge_3_area_entered(area):
	areasnap(area)

func _on_edge_4_area_entered(area):
	areasnap(area)
