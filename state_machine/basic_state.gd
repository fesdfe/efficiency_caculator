extends Node
class_name MainFSM

var context : Main ## 状态机目标
var pre_state : MainFSM ## 前一个状态

## 进入状态
func enter():
	pass

## 离开状态
func exit():
	pass

## 状态活动
func active():
	pass
