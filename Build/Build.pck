GDPC                @                                                                         \   res://.godot/exported/133200997/export-09855746089e3bbe7572954395e33cac-AnswerQuestion.scn          p      �,�t:��X������q    T   res://.godot/exported/133200997/export-1161529a89f1065f282d71bdc2390ae6-mainmenu.scnp      H      �1Ǚ|D�}k*���I�    P   res://.godot/exported/133200997/export-8ec1ce4394550eef6b399142f35b815f-Game.scn@      #      &�s���SfݠQ�?��    X   res://.godot/exported/133200997/export-c461ecbbab34ef516f8f953f53f536ab-GameManager.scn p      }      ��ZBh��P�h4�N    \   res://.godot/exported/133200997/export-ee626203ec0934dfe7c166e74392fc9b-pickquestiontype.scn�	      }      ���6�+�{���    ,   res://.godot/global_script_class_cache.cfg  �1             ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"      �      �̛�*$q�*�́        res://.godot/uid_cache.bin  �5            
��}���Y�Uɔi�       res://Scenes/Game.tscn.remap 1      a       B��D��������    $   res://Scenes/GameManager.tscn.remap p1      h       H����F�:��ﰃ�t    ,   res://Scenes/Menus/AnswerQuestion.tscn.remap�/      k       ��5v�mG����,    (   res://Scenes/Menus/mainmenu.tscn.remap   0      e       8�J��enpSjC�B�    0   res://Scenes/Menus/pickquestiontype.tscn.remap  �0      m       q#y|z6�ג��5"        res://Scripts/AnswerQuestion.gd P      �      ��p8zeUGd�Eñ�:�       res://Scripts/GameManager.gd�            ������Mi��O�       res://Scripts/MainMenu.gd   p            �f2�L"�Aj8˺YH��    $   res://Scripts/PickQuestionType.gd   �      �      �N��~�fo��x��       res://icon.svg   2      �      C��=U���^Qu��U3       res://icon.svg.import   �.      �       �����xV���/�8�S"       res://project.binary�=      �      %��&y`��RI `3    RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script     res://Scripts/AnswerQuestion.gd ��������      local://PackedScene_4y3xs          PackedScene          	         names "      	   MainMenu    script    Node2D    Title    unique_name_in_owner    offset_left    offset_top    offset_right    offset_bottom    text    Label    Time Left Text $   theme_override_font_sizes/font_size    Question Text    TextBox 	   TextEdit    	   variants                            D     �B    @4D     �B      Answer Questions      �A     D    ��C    �D   <         Time Left:      ��C    ��C    @D    ��C      Question Text:       ;D     �C    �PD    ��C      node_count             nodes     Y   ��������       ����                      
      ����                                 	                  
      ����                        	      
         	                  
      ����                                       	                        ����                                                 conn_count              conns               node_paths              editable_instances              version             RSRCRSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://Scripts/MainMenu.gd ��������      local://PackedScene_03ht4          PackedScene          	         names "      	   MainMenu    script    Node2D    PlayButton    unique_name_in_owner    offset_left    offset_top    offset_right    offset_bottom $   theme_override_font_sizes/font_size    text    Button    ExitButton    	   variants                           @D     C     9D     DC   (      
   Play Game     �D    ��C    @:D     �C   
   Exit Game       node_count             nodes     3   ��������       ����                            ����                                 	      
                        ����                  	      
         	      
                conn_count              conns               node_paths              editable_instances              version             RSRC        RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script "   res://Scripts/PickQuestionType.gd ��������      local://PackedScene_n6ew2          PackedScene          	         names "         PickQuestionType    script    Node2D    Label    offset_left    offset_right    offset_bottom $   theme_override_font_sizes/font_size    text    FractionsButton    unique_name_in_owner    offset_top    Button    GeometryButton    PreAlgebraButton    	   variants                     �D    �(D     �A            Pick Question Type
            �C     �B    @DD     VC   @           Fractions       ��C    ��C    �QD    ��C       Geometry      ��C    �D      Pre-Algebra       node_count             nodes     Y   ��������       ����                            ����                                                	   ����   
                     	      
                                 ����   
                                                            ����   
                     	                               conn_count              conns               node_paths              editable_instances              version             RSRC   RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script           local://PackedScene_neb6o �          PackedScene          	         names "         Game    Node2D    	   variants              node_count             nodes        ��������       ����              conn_count              conns               node_paths              editable_instances              version             RSRC             RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://Scripts/GameManager.gd ��������      local://PackedScene_ma5q0          PackedScene          	         names "         GameManager    script    Node2D    	   variants                       node_count             nodes     	   ��������       ����                    conn_count              conns               node_paths              editable_instances              version             RSRC   extends Node

@onready var mainMenuScene = "res://Scenes/Menus/mainmenu.tscn"
@onready var pickQuestionTypeScene = "res://scenes/menus/pickquestiontype.tscn"
@onready var answerQuestionScene = "res://scenes/menus/answerQuestion.tscn"

enum gameState{
	STATE_NONE,
	STATE_MAIN_MENU,
	STATE_MENU_PICK_QUESTION,
	STATE_ANSWER_QUESTION,
	STATE_GAMEPLAY,
}

var state = gameState.STATE_NONE
var currentMenuObj = null

# Called when the node enters the scene tree for the first time.
func _ready():
	changeState(gameState.STATE_MAIN_MENU)
	print("Test")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func changeState(newState):
	if newState == state:
		print("Cant change state to same state: " + str(newState))
		return
	endState()
	beginState(newState)
		
func beginState(newstate):
	if newstate == gameState.STATE_MAIN_MENU:
		ImmediateLoadMenu(mainMenuScene)
	elif newstate == gameState.STATE_MENU_PICK_QUESTION:
		ImmediateLoadMenu(pickQuestionTypeScene)
	elif newstate == gameState.STATE_ANSWER_QUESTION:
		ImmediateLoadMenu(answerQuestionScene)
	elif newstate== gameState.STATE_GAMEPLAY:
		pass
	state = newstate
	
func endState():
	if (currentMenuObj):
		remove_child(currentMenuObj)
		currentMenuObj = null
	if state == gameState.STATE_MAIN_MENU:
		pass
	elif state == gameState.STATE_MENU_PICK_QUESTION:
		pass
	elif state == gameState.STATE_ANSWER_QUESTION:
		pass
	elif state == gameState.STATE_GAMEPLAY:
		pass
	
#Loads and adds child
func ImmediateLoadMenu( path ):
	var menu = load(path)
	currentMenuObj = menu.instantiate()
	add_child(currentMenuObj)
	pass
 extends Node

@onready var gm = get_node("/root/GameManager")
@onready var playButton = $PlayButton
@onready var exitButton = $ExitButton

# Called when the node enters the scene tree for the first time.
func _ready():
	playButton.pressed.connect(_playGame)
	exitButton.pressed.connect(_exit)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _playGame():
	gm.changeState(gm.gameState.STATE_MENU_PICK_QUESTION)
	pass
	
func _exit():
	get_tree().quit()
         extends Node

@onready var gm = get_node("/root/GameManager")

@onready var fracButton = %FractionsButton
@onready var geoButton = %GeometryButton
@onready var algButton = %PreAlgebraButton

# Called when the node enters the scene tree for the first time.
func _ready():
	fracButton.pressed.connect(_choseFrac)
	geoButton.pressed.connect(_choseGeo)
	algButton.pressed.connect(_choseAlg)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _choseFrac():
	_picked()
func _choseGeo():
	_picked()
func _choseAlg():
	_picked()

func _picked():
	print("Picked")
	gm.changeState(gm.gameState.STATE_ANSWER_QUESTION)
	pass
	
         extends Node
@onready var gm = get_node("/root/GameManager")
@onready var titleText = %Title
@onready var timeLeftText =  %"Time Left Text"
@onready var questionText = %"Question Text"
@onready var textBox = %TextBox

const MAX_ANSWER_TIME = 3
var timeLeft = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	timeLeft = MAX_ANSWER_TIME
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timeLeft -= delta
	_updateUI()
	
	if ( timeLeft <= 0 ):
		gm.changeState(gm.gameState.STATE_GAMEPLAY)
		
func _updateUI():
	timeLeftText.text = "Time Left: " + str(int(timeLeft))
              GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح�m�m������$$P�����එ#���=�]��SnA�VhE��*JG�
&����^x��&�+���2ε�L2�@��		��S�2A�/E���d"?���Dh�+Z�@:�Gk�FbWd�\�C�Ӷg�g�k��Vo��<c{��4�;M�,5��ٜ2�Ζ�yO�S����qZ0��s���r?I��ѷE{�4�Ζ�i� xK�U��F�Z�y�SL�)���旵�V[�-�1Z�-�1���z�Q�>�tH�0��:[RGň6�=KVv�X�6�L;�N\���J���/0u���_��U��]���ǫ)�9��������!�&�?W�VfY�2���༏��2kSi����1!��z+�F�j=�R�O�{�
ۇ�P-�������\����y;�[ ���lm�F2K�ޱ|��S��d)é�r�BTZ)e�� ��֩A�2�����X�X'�e1߬���p��-�-f�E�ˊU	^�����T�ZT�m�*a|	׫�:V���G�r+�/�T��@U�N׼�h�+	*�*sN1e�,e���nbJL<����"g=O��AL�WO!��߈Q���,ɉ'���lzJ���Q����t��9�F���A��g�B-����G�f|��x��5�'+��O��y��������F��2�����R�q�):VtI���/ʎ�UfěĲr'�g�g����5�t�ۛ�F���S�j1p�)�JD̻�ZR���Pq�r/jt�/sO�C�u����i�y�K�(Q��7őA�2���R�ͥ+lgzJ~��,eA��.���k�eQ�,l'Ɨ�2�,eaS��S�ԟe)��x��ood�d)����h��ZZ��`z�պ��;�Cr�rpi&��՜�Pf��+���:w��b�DUeZ��ڡ��iA>IN>���܋�b�O<�A���)�R�4��8+��k�Jpey��.���7ryc�!��M�a���v_��/�����'��t5`=��~	`�����p\�u����*>:|ٻ@�G�����wƝ�����K5�NZal������LH�]I'�^���+@q(�q2q+�g�}�o�����S߈:�R�݉C������?�1�.��
�ڈL�Fb%ħA ����Q���2�͍J]_�� A��Fb�����ݏ�4o��'2��F�  ڹ���W�L |����YK5�-�E�n�K�|�ɭvD=��p!V3gS��`�p|r�l	F�4�1{�V'&����|pj� ߫'ş�pdT�7`&�
�1g�����@D�˅ �x?)~83+	p �3W�w��j"�� '�J��CM�+ �Ĝ��"���4� ����nΟ	�0C���q'�&5.��z@�S1l5Z��]�~L�L"�"�VS��8w.����H�B|���K(�}
r%Vk$f�����8�ڹ���R�dϝx/@�_�k'�8���E���r��D���K�z3�^���Vw��ZEl%~�Vc���R� �Xk[�3��B��Ğ�Y��A`_��fa��D{������ @ ��dg�������Mƚ�R�`���s����>x=�����	`��s���H���/ū�R�U�g�r���/����n�;�SSup`�S��6��u���⟦;Z�AN3�|�oh�9f�Pg�����^��g�t����x��)Oq�Q�My55jF����t9����,�z�Z�����2��#�)���"�u���}'�*�>�����ǯ[����82һ�n���0�<v�ݑa}.+n��'����W:4TY�����P�ר���Cȫۿ�Ϗ��?����Ӣ�K�|y�@suyo�<�����{��x}~�����~�AN]�q�9ޝ�GG�����[�L}~�`�f%4�R!1�no���������v!�G����Qw��m���"F!9�vٿü�|j�����*��{Ew[Á��������u.+�<���awͮ�ӓ�Q �:�Vd�5*��p�ioaE��,�LjP��	a�/�˰!{g:���3`=`]�2��y`�"��N�N�p���� ��3�Z��䏔��9"�ʞ l�zP�G�ߙj��V�>���n�/��׷�G��[���\��T��Ͷh���ag?1��O��6{s{����!�1�Y�����91Qry��=����y=�ٮh;�����[�tDV5�chȃ��v�G ��T/'XX���~Q�7��+[�e��Ti@j��)��9��J�hJV�#�jk�A�1�^6���=<ԧg�B�*o�߯.��/�>W[M���I�o?V���s��|yu�xt��]�].��Yyx�w���`��C���pH��tu�w�J��#Ef�Y݆v�f5�e��8��=�٢�e��W��M9J�u�}]釧7k���:�o�����Ç����ս�r3W���7k���e�������ϛk��Ϳ�_��lu�۹�g�w��~�ߗ�/��ݩ�-�->�I�͒���A�	���ߥζ,�}�3�UbY?�Ӓ�7q�Db����>~8�]
� ^n׹�[�o���Z-�ǫ�N;U���E4=eȢ�vk��Z�Y�j���k�j1�/eȢK��J�9|�,UX65]W����lQ-�"`�C�.~8ek�{Xy���d��<��Gf�ō�E�Ӗ�T� �g��Y�*��.͊e��"�]�d������h��ڠ����c�qV�ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[             [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://ufcf2fuk6dcx"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 [remap]

path="res://.godot/exported/133200997/export-09855746089e3bbe7572954395e33cac-AnswerQuestion.scn"
     [remap]

path="res://.godot/exported/133200997/export-1161529a89f1065f282d71bdc2390ae6-mainmenu.scn"
           [remap]

path="res://.godot/exported/133200997/export-ee626203ec0934dfe7c166e74392fc9b-pickquestiontype.scn"
   [remap]

path="res://.godot/exported/133200997/export-8ec1ce4394550eef6b399142f35b815f-Game.scn"
               [remap]

path="res://.godot/exported/133200997/export-c461ecbbab34ef516f8f953f53f536ab-GameManager.scn"
        list=Array[Dictionary]([])
     <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
          ,   ?��1[�   res://icon.svg���o���   res://Scenes/GameManager.tscn�����!    res://Scenes/Menus/MainMenu.tscn� J�t)&   res://Scenes/Menus/AnswerQuestion.tscn��A���{(   res://Scenes/Menus/PickQuestionType.tscn�����!    res://scenes/menus/mainmenu.tscn�����!    res://scenes/Menus/mainmenu.tscn� J�t)&   res://scenes/Menus/AnswerQuestion.tscn��A���{(   res://scenes/Menus/PickQuestionType.tscn��A���{(   res://scenes/menus/pickquestiontype.tscn��
�t��]   res://Scenes/Game.tscn�����!    res://Scenes/Menus/MainMenu.tscn��A���{(   res://Scenes/Menus/PickQuestionType.tscn��ԩ��H    res://scenes/menus/mainmenu.tscn��A���{(   res://scenes/menus/pickquestiontype.tscn��ԩ��H    res://Scenes/Menus/MainMenu.tscn��A���{(   res://Scenes/Menus/PickQuestionType.tscn��ԩ��H    res://scenes/menus/mainmenu.tscn��A���{(   res://scenes/menus/pickquestiontype.tscn��A���{(   res://scenes/Menus/pickquestiontype.tscn��ԩ��H    res://scenes/Menus/mainmenu.tscn��ԩ��H    res://Scenes/Menus/MainMenu.tscn��A���{(   res://Scenes/Menus/PickQuestionType.tscn��ԩ��H    res://scenes/menus/mainmenu.tscn��A���{(   res://scenes/menus/pickquestiontype.tscn��ԩ��H    res://Scenes/Menus/MainMenu.tscn��A���{(   res://Scenes/Menus/PickQuestionType.tscn��ԩ��H    res://scenes/menus/mainmenu.tscn��A���{(   res://scenes/menus/pickquestiontype.tscn��ԩ��H    res://Scenes/Menus/MainMenu.tscn��A���{(   res://Scenes/Menus/PickQuestionType.tscn��ԩ��H    res://scenes/menus/mainmenu.tscn��A���{(   res://scenes/menus/pickquestiontype.tscn��ԩ��H    res://Scenes/Menus/MainMenu.tscn��A���{(   res://Scenes/Menus/PickQuestionType.tscn��ԩ��H    res://scenes/menus/mainmenu.tscn��A���{(   res://scenes/menus/pickquestiontype.tscn� J�t)&   res://Scenes/Menus/AnswerQuestion.tscn��ԩ��H    res://Scenes/Menus/MainMenu.tscn��A���{(   res://Scenes/Menus/PickQuestionType.tscn��ԩ��H    res://scenes/menus/mainmenu.tscn��A���{(   res://scenes/menus/pickquestiontype.tscn/��<$��3    res://Scenes/Menus/mainmenu.tscn}���E�z(   res://Scenes/Menus/pickquestiontype.tscn ECFG      application/config/name         SuperMathMakerP2   application/run/main_scene          res://Scenes/Game.tscn     application/config/features(   "         4.1    GL Compatibility       application/config/icon         res://icon.svg     autoload/GameManager(         *res://Scenes/GameManager.tscn  "   display/window/size/viewport_width         #   display/window/size/viewport_height      �     dotnet/project/assembly_name         SuperMathMakerP2"   editor/import/size/viewport_height      �  !   editor/import/size/viewport_width      �  #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility        