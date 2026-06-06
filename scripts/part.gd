extends Area3D

@export var mask : BaseMaterial3D
@export var panel : PanelContainer
@onready var mesh = $FanPartMesh

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event.is_action_pressed("interact"):
		mesh.material_overlay = mask
		var screen_pos : Vector2
		screen_pos = get_viewport().get_mouse_position()
		if panel:
			panel.global_position = screen_pos
			panel.visible = true
			
func _clear():
	mesh.material_overlay = null
	panel.visible = false


func _on_node_3d_clear() -> void:
	_clear()
