extends Sprite2D

@onready var block = preload("res://scenes/block.tscn")

func _on_button_button_down():
	spawn_block()
	print("spawned")

func spawn_block():
	var block_spawned = block.instantiate()
	$"../Ship".add_child(block_spawned)
	block_spawned.position = self.position
	block_spawned.dragging = true
	$"../Sounds/dropsound".play()
