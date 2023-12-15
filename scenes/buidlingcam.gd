extends Camera2D

# effects zoom speed and smoothness 
var zoomspeed = 200
var zoommargin = 0.1 #lower means more smooth but it becomes slower to zoom

# zoom limits
var zoomMin = 5
var zoomMax = 20

var zoompos = Vector2()
var zoomfactor = 1.0

var drag_start = Vector2()

func _ready():
	# make the camera the current one
	make_current()

func _process(delta):
	zoom.x = lerp(zoom.x, zoom.x * zoomfactor, zoomspeed * delta)
	zoom.y = lerp(zoom.y, zoom.y * zoomfactor, zoomspeed * delta)
	
	zoom.x = clamp(zoom.x, zoomMin, zoomMax)
	zoom.y = clamp(zoom.y, zoomMin, zoomMax)
	
	# move the camera by the drag offset
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_MIDDLE):
		var drag_offset = drag_start - get_global_mouse_position()
		position += drag_offset

func _input(event):
	if abs(zoompos.x - get_global_mouse_position().x) > zoommargin:
		zoomfactor = 1.0
	if abs(zoompos.y - get_global_mouse_position().y) > zoommargin:
		zoomfactor = 1.0
	
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP: 
				zoomfactor -= 0.01 
				zoompos = get_global_mouse_position()
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoomfactor += 0.01
				zoompos = get_global_mouse_position()
		if event.button_index == MOUSE_BUTTON_MIDDLE:
			if event.pressed:
				drag_start = get_global_mouse_position()
			else:
				drag_start = Vector2()

