extends MainFSM

func enter():
	context.pause_timer.set_deferred("visible", true)
	context.change_by_step.set_deferred("visible", true)
	context.set_physics_process(true)

func exit():
	context.pause_timer.set_deferred("visible", false)
	context.change_by_step.set_deferred("visible", false)
	context.set_physics_process(false)
