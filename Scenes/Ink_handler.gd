# warning-ignore-all:return_value_discarded

extends Control

@onready var choice_btn = load("res://Scenes/Dialog/Dialog_Button.tscn")
@onready var _ink_player = InkPlayerFactory.create()
@onready var _btns = []

func _ready():
	add_child(_ink_player)
	_ink_player.ink_file = load("res://Ink/JAM.ink.json")
	_ink_player.loads_in_background = true
	_ink_player.connect("loaded", Callable(self, "_story_loaded"))
	_ink_player.connect("show_choices_if_needed", Callable(self, "_on_dialog_box_show_choices_if_needed"))
	_ink_player.connect("trigger_continue", Callable(self, "_on_dialog_box_trigger_continue"))
	_ink_player.create_story()

func _story_loaded(successfully: bool):
	if !successfully:
		print("Not loaded")
		return

	#_observe_variables()
	# _bind_externals()

	_continue_story()

func _continue_story():

	if _ink_player.can_continue:
		var text_line = _ink_player.continue_story()
		process_tags(_ink_player.current_tags)
		$DialogBox.start_typing(text_line)
		
	
		

# Uncomment to bind an external function.
#func _bind_externals():
# 	_ink_player.bind_external_function("<function_name>", self, "_external_function")
#
# func _external_function(arg1, arg2):
# 	pass

func _observe_variables():
	_ink_player.observe_variables(["var"], self, "_variable_changed")

func _variable_changed(variable_name, new_value):
	print("Variable '%s' changed to: %s" %[variable_name, new_value])
	

func _index_choose(button):
	var index = _btns.find(button)
	if index != -1:
		_select_choice(index)

func _select_choice(index):
	for button in $DialogBox/ChoiceContainer.get_children():
		$DialogBox/ChoiceContainer.remove_child(button)
		_btns.erase(button)
		
	_ink_player.choose_choice_index(index)
	_continue_story()

func process_tags(tags: Array):
	for tag in tags:
		var parts = tag.split(":")
		var key = parts[0].strip_edges()
		var value = parts[1].strip_edges()
		
		match key:
			"background": load_background(value)
			

func load_background(bg: String):
	var tex = load("res://Assets/Backgrounds/%s.png" % bg)
	$Background.texture = tex
	


func _on_dialog_box_trigger_continue() -> void:
	_continue_story()


func _on_dialog_box_show_choices_if_needed() -> void:
	if _ink_player.has_choices and _btns.size()==0:
		
		for choice in _ink_player.current_choices:
			var button = choice_btn.instantiate()
			button.text = choice.text
			
			button.connect("pressed", Callable(self, "_index_choose").bind(button))
			
			_btns.append(button)
			$DialogBox/ChoiceContainer.add_child(button)
	
