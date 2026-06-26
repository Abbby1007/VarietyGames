extends Node2D

@onready var life_container: HBoxContainer = $lifeContainer
@onready var life: TextureRect = $lifeContainer/life
@onready var life2: TextureRect = $lifeContainer/life2
@onready var life3: TextureRect = $lifeContainer/life3
@onready var life4: TextureRect = $lifeContainer/life4
@onready var life5: TextureRect = $lifeContainer/life5

@onready var level: RichTextLabel = $level
@onready var timer: RichTextLabel = $timer

var time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await Timer(5.0) #using function created
	
	if Global.minigames_done < 3: #if you haven't completed 3 minigames yet
		Global.minigames_done = Global.minigames_done + 1
		get_tree().change_scene_to_file("res://scenes/minigame_"+str(Global.minigames_done) + ".tscn") #changes your scene by arranging this frankenstein path
	
#Above, your script is being told to go to the next minigam. If the
#current minigame is level 1, then you would go on minigame1. If you
#complete that level, you have the minigames_done add one, and then you
#look for the scene titled `mingame_` and then whatever minigame number
#should be next. Make sure you name your minigame saves appropriately
	else:
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn") # changes your scene
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match Global.lives:#asks or check if lives is equal to one of 
		#these values, cool hack. 
		# creator says this is a bad way to show the lives
		#they suggest maybe fixing it later
		4:
			life.hide()
		3:
			life.hide()
			life2.hide()
		2:
			life.hide()
			life2.hide()
			life3.hide()
		1:
			life.hide()
			life2.hide()
			life3.hide()
			life4.hide()
		0:
			life_container.hide() #just hides everything
			
	timer.text = str(time)#makes this text reflect the value of the time variable. this manes names easier. the str() convert the int to a String
	level.text = "Level" + str(Global.minigames_done)#This tells you what minigame you're on using concatenatnion	

func Timer(start_time: float):# making a new function for timer countdown
	#we want the timer to go down, adn when it reaches 0 it transitions
	#to the next scene!
	time = start_time #make the timer, which is reflected through the timer text, start at your desired number
	
	while time > 0.0: #
		await wait(0.1)# ask script to wait on this function. the 'wait' name for the function does nothing here, 
		#as awaitis just telling teh script to wait for the  function to complete before progresion
		time -= 0.1 #remove 0.1
		# progressivelt get the value smaller and smaller
		#when timer reaches 0
		return
func wait(seconds: float) -> void: #write this simple function out for wait!
		await get_tree().create_timer(seconds).timeout #makes u wait
	
