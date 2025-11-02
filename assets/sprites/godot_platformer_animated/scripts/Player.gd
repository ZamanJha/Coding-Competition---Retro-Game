
extends CharacterBody2D

@export var speed := 200.0
@export var jump_vel := -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
    if not is_on_floor():
        velocity.y += gravity * delta
    var dir = Input.get_axis("move_left","move_right")
    velocity.x = dir * speed
    if dir != 0:
        $AnimatedSprite2D.play("walk")
    else:
        $AnimatedSprite2D.stop()
    if Input.is_action_just_pressed("jump") and is_on_floor():
        velocity.y = jump_vel
    move_and_slide()
