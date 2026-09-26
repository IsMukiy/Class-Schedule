extends PanelContainer


var maximized:bool = false
const minimum_size:Vector2i = Vector2i(1700,600)
@onready var window:Window = get_window()


func _ready() -> void:
	# 窗口设置
	window.set_min_size(minimum_size)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("maximize"):
		if maximized:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			maximized = false
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
			maximized = true
