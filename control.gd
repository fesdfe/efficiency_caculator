class_name Main extends Control

@onready var time_caption: Label = $Body/GridContainer/TimeCaption
@onready var time: Label = $Body/GridContainer/Time
@onready var count_indicator: Label = $Body/GridContainer/Count
@onready var efficiency_indicator: Label = $Body/GridContainer/EfficiencyShown/Efficiency
@onready var efficiency_unit: Button = $Body/GridContainer/EfficiencyShown/EfficiencyUnit
@onready var start_timer: Button = $Body/StartTimer
@onready var pause_timer: Button = $Body/PauseTimer
@onready var button_container: HBoxContainer = $Body/ButtonContainer
@onready var step_indicator: LineEdit = $Body/StepControlContainer/Step
@onready var change_by_step: HBoxContainer = $Body/ChangeByStep
@onready var init_setting: VBoxContainer = $Body/InitSetting
@onready var use_init: HBoxContainer = $Body/InitSetting/UseInit
@onready var set_init: HBoxContainer = $Body/InitSetting/SetInit
@onready var set_init_control: LineEdit = $Body/InitSetting/SetInit/SetInitControl
@onready var fast_input_control: VBoxContainer = $Body/FastInput/FastInputControl
@onready var keyboard_input: LineEdit = $Body/FastInput/FastInputControl/KeyboardInput

@onready var state: MainFSM:
	set = set_state

func set_state(new_state: MainFSM):
	if state:
		state.exit()
		new_state.pre_state = state
	state = new_state
	state.enter()

## 计时器
var timer := 0.0
## 计数器
var counter := 0.0
## 计数器初始值
var counter_init := 0.0
## 计数器增减步进值
var step := 1.0
## 快速输入的内容
var keyboard_context := "0"
## 效率显示单位枚举
enum unit{SEC, MIN, HOUR}
## 当前单位显示倍率
var unit_rate := 1

func _ready() -> void:
	for tmp_state in $StateMachine.get_children():
		tmp_state.context = self
	start_timer.set_deferred("visible", false)
	pause_timer.set_deferred("visible", false)
	button_container.set_deferred("visible", false)
	change_by_step.set_deferred("visible", false)
	init_setting.set_deferred("visible", false)
	set_init.set_deferred("visible", false)
	fast_input_control.set_deferred("visible", false)
	
	step_indicator.text = str(step)
	
	set_state(find_child("Init"))

func _process(_delta: float) -> void:
	time.text = get_time(timer)
	count_indicator.text = str(counter)
	efficiency_indicator.text = String.num(counter/timer*unit_rate, 4)
	keyboard_input.text = keyboard_context

func _physics_process(delta: float) -> void:
	timer += delta

## 初始化数值
func reset():
	timer = 0.0
	counter = counter_init

## 处理时间戳
func get_time(arg_time:float) -> String:
	# 分解时间单位
	var hours = int(arg_time) / 3600
	var minutes = int(arg_time) % 3600 / 60
	var seconds = fmod(arg_time, 60)  # 保留小数秒

	# 格式化为字符串
	var formatted_time = "%02d:%02d:%05.2f" % [hours, minutes, seconds]
	return formatted_time

## 开始计时
func _on_start_timer_pressed() -> void:
	set_state(find_child("Running"))

## 暂停计时
func _on_pause_timer_pressed() -> void:
	set_state(find_child("Pause"))

## 继续计时
func _on_resume_timer_pressed() -> void:
	set_state(find_child("Running"))

## 结束计时
func _on_end_button_pressed() -> void:
	set_state(find_child("Init"))

## 步进增加调整
func _on_add_pressed() -> void:
	step += 1.0
	step_indicator.text = str(step)

## 步进减少调整
func _on_desc_pressed() -> void:
	step -= 1.0
	step_indicator.text = str(step)

## 按步进值降低
func _on_desc_by_step_pressed() -> void:
	counter -= step

## 按步进值增加
func _on_add_by_step_pressed() -> void:
	counter += step

## 显示/隐藏设置初值
func _on_use_init_control_toggled(toggled_on: bool) -> void:
	set_init.set_deferred("visible", toggled_on)

## 提交新的初值
func _on_line_edit_text_submitted(new_text: String) -> void:
	var tmp_value = float(new_text)
	if tmp_value:
		counter_init = tmp_value
		counter = counter_init
		set_init_control.text = str(tmp_value)
	else:
		set_init_control.text = "无效输入"

## 键盘1
func _keyboard_input_1() -> void:
	if keyboard_context != "无效输入":
		if keyboard_context != "-0":
			keyboard_context = keyboard_context+"1" if keyboard_context!="0" else "1"
		else:
			keyboard_context = "-1"
	else:
		keyboard_context = "1"

## 键盘2
func _keyboard_input_2() -> void:
	if keyboard_context != "无效输入":
		if keyboard_context != "-0":
			keyboard_context = keyboard_context+"2" if keyboard_context!="0" else "2"
		else:
			keyboard_context = "-2"
	else:
		keyboard_context = "2"

## 键盘3
func _keyboard_input_3() -> void:
	if keyboard_context != "无效输入":
		if keyboard_context != "-0":
			keyboard_context = keyboard_context+"3" if keyboard_context!="0" else "3"
		else:
			keyboard_context = "-3"
	else:
		keyboard_context = "3"

## 键盘4
func _keyboard_input_4() -> void:
	if keyboard_context != "无效输入":
		if keyboard_context != "-0":
			keyboard_context = keyboard_context+"4" if keyboard_context!="0" else "4"
		else:
			keyboard_context = "-4"
	else:
		keyboard_context = "4"

## 键盘5
func _keyboard_input_5() -> void:
	if keyboard_context != "无效输入":
		if keyboard_context != "-0":
			keyboard_context = keyboard_context+"5" if keyboard_context!="0" else "5"
		else:
			keyboard_context = "-5"
	else:
		keyboard_context = "5"

## 键盘6
func _keyboard_input_6() -> void:
	if keyboard_context != "无效输入":
		if keyboard_context != "-0":
			keyboard_context = keyboard_context+"6" if keyboard_context!="0" else "6"
		else:
			keyboard_context = "-6"
	else:
		keyboard_context = "6"

## 键盘7
func _keyboard_input_7() -> void:
	if keyboard_context != "无效输入":
		if keyboard_context != "-0":
			keyboard_context = keyboard_context+"7" if keyboard_context!="0" else "7"
		else:
			keyboard_context = "-7"
	else:
		keyboard_context = "7"

## 键盘8
func _keyboard_input_8() -> void:
	if keyboard_context != "无效输入":
		if keyboard_context != "-0":
			keyboard_context = keyboard_context+"8" if keyboard_context!="0" else "8"
		else:
			keyboard_context = "-8"
	else:
		keyboard_context = "8"

## 键盘9
func _keyboard_input_9() -> void:
	if keyboard_context != "无效输入":
		if keyboard_context != "-0":
			keyboard_context = keyboard_context+"9" if keyboard_context!="0" else "9"
		else:
			keyboard_context = "-9"
	else:
		keyboard_context = "9"

## 键盘0
func _keyboard_input_0() -> void:
	if keyboard_context != "无效输入":
		if keyboard_context != "-0":
			keyboard_context = keyboard_context+"0" if keyboard_context!="0" else "0"
	else:
		keyboard_context = "0"

## 小数点
func _keyboard_input_dot() -> void:
	if keyboard_context != "无效输入":
		keyboard_context = keyboard_context+"." if keyboard_context[-1]!="." else keyboard_context
	else:
		keyboard_context = "0."

## 负号
func _keyboard_input_negtive() -> void:
	if keyboard_context != "无效输入":
		if keyboard_context[0] != "-":
			keyboard_context = "-"+keyboard_context
		else:
			keyboard_context = keyboard_context.substr(1)
	else:
		keyboard_context = "-0"

## 提交
func _keyboard_commit() -> void:
	var tmp_value = float(keyboard_context)
	if tmp_value:
		counter += tmp_value
		keyboard_context = "0"
	else:
		keyboard_context = "无效输入"

## 清除
func _keyboard_clear() -> void:
	keyboard_context = "0"

## 退格
func _keyboard_backspace() -> void:
	if keyboard_context == "无效输入" || keyboard_context == "-0" || keyboard_context == "0":
		keyboard_context = "0"
	else:
		if keyboard_context.length() >= 2:
			keyboard_context = keyboard_context.left(keyboard_context.length()-1)
		else:
			keyboard_context = "0"

## 显示/隐藏快捷键盘
func _on_control_toggled(toggled_on: bool) -> void:
	fast_input_control.set_deferred("visible", toggled_on)

## 直接修改步进值
func _on_step_text_submitted(new_text: String) -> void:
	var tmp_value = float(new_text)
	if tmp_value:
		step = tmp_value
		step_indicator.text = str(tmp_value)
	else:
		step_indicator.text = str(step)

## 更改显示单位
func _on_efficiency_unit_pressed() -> void:
	if unit_rate == 1:
		unit_rate = 60
		efficiency_unit.text = "每分钟"
	elif unit_rate == 60:
		unit_rate = 3600
		efficiency_unit.text = "每小时"
	else:
		unit_rate = 1
		efficiency_unit.text = "每秒钟"
