extends Node2D

var Ship_Name

func _ready():
	pass

func _on_save_button_button_down():
	#save_node() work in progress 
	pass

func _on_load_button_button_down():
	#load_scene() work in progress 
	pass

func _on_line_edit_text_changed(new_text):
	Ship_Name = new_text

# Save a node with a given path as a packed scene
func save_node(node_path):
	# Get the node from the path
	var node = get_node(node_path)
	# Create a packed scene object
	var packed_scene = PackedScene.new()
	# Pack the node into the packed scene
	packed_scene.pack(node)
	# Save the packed scene to a file with the same name as the node
	ResourceSaver.save("res://" + node.name + ".tscn", packed_scene)

# Load a packed scene from a file and add it as a child of the current scene
func load_scene(file_path):
	# Load the packed scene resource
	var packed_scene = load(file_path)
	# Check if the resource is valid
	if packed_scene != null:
		# Instantiate the packed scene
		var scene = packed_scene.instance()
		# Add the scene as a child of the current scene
		add_child(scene)
	else:
		# Print an error message
		print("Invalid file path: " + file_path)
