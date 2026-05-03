extends ColorRect

enum states { IDLE, TYPING }
var state = states.IDLE

var dialog_text := ""
var current_length : int = 0
signal trigger_continue
signal show_choices_if_needed

@onready var timer := $DialogLabel/Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ArrowIndicator.hide()
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		if state == states.TYPING:
			jump_dialog()
		elif state == states.IDLE:
			emit_signal("trigger_continue")
		


func start_typing(text_line: String):
	$ArrowIndicator.hide()
	dialog_text = text_line.strip_edges()
	state = states.TYPING
	current_length=0
	type_next_letter()
	timer.start()
	
func type_next_letter():
	current_length+=1
	$DialogLabel.text = dialog_text.substr(0,current_length)
	#audioPlayer.stream = get_typing_sound()
	#audioPlayer.play()
	if current_length > dialog_text.length():
		stop_typing()
		return
		
func stop_typing():
	
	state = states.IDLE
	#audioPlayer.stop()
	timer.stop()
	$ArrowIndicator.show()
	emit_signal("show_choices_if_needed")


func jump_dialog():
	$DialogLabel.text = dialog_text
	stop_typing()
	
func _on_timer_timeout():
	type_next_letter()
