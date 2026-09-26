extends PanelContainer


signal popup_menu(tile_position:Vector2)


@export var name_of_this_class:String = "Class": ## 课程名称
	set(value):
		name_of_this_class = name
		$CenterContainer/VBoxContainer/ClassName.text = value

@export var teacher_name:String = "Teacher": ## 教师名称
	set(value):
		teacher_name = value
		$CenterContainer/VBoxContainer/TeacherName.text = value

## 瓦片所属的位置，第一个代表天数，第二个代表节数。[br][b]注意：直接修改第二个数无法让其改变节数，只会导致数据读取错误。[/b]瓦片是隶属于 [HBoxContainer] 中的，每个 [HBoxContainer] 都代表了一周7天里每一天的某一节。因此只能控制这个瓦片在星期几，而不能控制在哪节课。
@export var tile_position:Vector2i = Vector2i(0,0):
	set(value):
		if (get_parent() == null) or !(get_parent() is HBoxContainer): # 如果没有父节点，或者父节点不是 HBoxContainer，就什么也不做，也不更新 
			return
		
		tile_position = value


func _gui_input(event: InputEvent) -> void:
	if (event is InputEventMouseButton) and (event.button_index == MOUSE_BUTTON_RIGHT) and event.pressed:
		accept_event()
		emit_signal("popup_menu",tile_position)
