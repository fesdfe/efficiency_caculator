extends MainFSM

func enter():
	context.button_container.set_deferred("visible", true)
	context.set_physics_process(false)

func exit():
	context.button_container.set_deferred("visible", false)
	context.set_physics_process(true)
