extends MainFSM

func enter():
	context.start_timer.set_deferred("visible", true)
	context.init_setting.set_deferred("visible", true)
	context.set_physics_process(false)
	context.reset()

func exit():
	context.start_timer.set_deferred("visible", false)
	context.init_setting.set_deferred("visible", false)
	context.set_physics_process(true)
