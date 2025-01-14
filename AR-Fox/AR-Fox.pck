GDPC                                                                                 D   res://.import/ARFoxSheet.png-d316a9ffdcbf0d93b163b5a953c6fa3d.stex  Ѐ      D      t.�B��QX�|ڬ͎H   res://.import/ARFox_palette.png-67d496552e856b4a6c2bd45e751efc3e.stex   ��      w       ��ݞf���/�d{��@   res://.import/Tileset1.png-323383d5c1e8f636f04faa77b140f99e.stex`�      �      H�,]��C�ƆP{4�]�<   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex �      �      �Q!����|M�<   res://.import/icon.png-c5087b039fa4dcce34c592ed22b614a9.stex��      �       �׹�0���:8�>�4̾$   res://Objects/Creatures/ARFox.tscn  �      D      W?o�t%���[h��,   res://Objects/Tilemaps/TestingTilemap.tres  �      "      tZW�vF�,gr�X9m,(   res://Objects/Tilemaps/TilemapTest.tscn �<      �      ��"l��K�?�S��=�   res://Scenes/Testing.tscn   `T      �#      �<�D��O�:����   res://Scripts/ARFox.gd.remap �      (       �x�� ���N��-�   res://Scripts/ARFox.gdc �w      �      S��X=۞��M��j��0   res://Sprites/Creatures/ARFoxSheet.png.import    �      T      )"~_�F8zh����0   res://Sprites/Creatures/ARFox_palette.png.import �      [      !q�W�}�Yڕ��CU,   res://Sprites/Tilesets/Tileset1.png.import  `�      M      �f���)@:�a��,   res://addons/TileSetCutter/icon.png.import  ��      E      >����f�U��h!Qq4   res://addons/TileSetCutter/tilesetcutter.gd.remap   0�      =       ��3�k"4�1���k,   res://addons/TileSetCutter/tilesetcutter.gdcЯ      �      �
J��4Y�ǳ�	�8   res://addons/TileSetCutter/tilesetcutter_plugin.gd.remapp�      D       �9ʶ𙁦`V��@�O4   res://addons/TileSetCutter/tilesetcutter_plugin.gdc ��      ]      �KrK_�M��|�M��a   res://default_env.tres  �      
      �?�թ+Ev�/h�!b�   res://icon.png  ��      �      �~dg`!����I�҃   res://icon.png.import   ��      .      y/�f�\�>w�ۨJ	   res://project.binaryp�      g      Z(�(��v�3�m����        [gd_scene load_steps=11 format=2]

[ext_resource path="res://Scripts/ARFox.gd" type="Script" id=1]
[ext_resource path="res://Sprites/Creatures/ARFoxSheet.png" type="Texture" id=2]

[sub_resource type="Shader" id=1]

code = "shader_type canvas_item;

// Which color you want to change
uniform vec4 u_color_key : hint_color;
// Which color to replace it with
uniform vec4 u_replacement_color : hint_color;
// How much tolerance for the replacement color (between 0 and 1)
uniform float u_tolerance;

void fragment() {
    // Get color from the sprite texture at the current pixel we are rendering
    vec4 original_color = texture(TEXTURE, UV);
    vec3 col = original_color.rgb;
    // Get a rough degree of difference between the texture color and the color key
    vec3 diff3 = col - u_color_key.rgb;
    float m = max(max(abs(diff3.r), abs(diff3.g)), abs(diff3.b));
    // Change color of pixels below tolerance threshold, while keeping shades if any (a bit naive, there may better ways)
    float brightness = length(col);
    col = mix(col, u_replacement_color.rgb * brightness, step(m, u_tolerance));
    // Assign final color for the pixel, and preserve transparency
    COLOR = vec4(col.rgb, original_color.a);
}"

[sub_resource type="ShaderMaterial" id=2]

render_priority = 0
shader = SubResource( 1 )
shader_param/u_color_key = Color( 0.145098, 0.172549, 0.231373, 1 )
shader_param/u_replacement_color = null
shader_param/u_tolerance = null
_sections_unfolded = [ "shader_param" ]

[sub_resource type="RectangleShape2D" id=3]

custom_solver_bias = 0.0
extents = Vector2( 8.57143, 10 )

[sub_resource type="Animation" id=4]

length = 1.0
loop = false
step = 0.1

[sub_resource type="Animation" id=5]

length = 0.4
loop = false
step = 0.1
tracks/0/type = "value"
tracks/0/path = NodePath("sprite:frame")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/keys = {
"times": PoolRealArray( 0, 0.1, 0.2, 0.3 ),
"transitions": PoolRealArray( 1, 1, 1, 1 ),
"update": 1,
"values": [ 20, 21, 22, 23 ]
}

[sub_resource type="Animation" id=6]

length = 0.8
loop = true
step = 0.1
tracks/0/type = "value"
tracks/0/path = NodePath("sprite:frame")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/keys = {
"times": PoolRealArray( 0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7 ),
"transitions": PoolRealArray( 1, 1, 1, 1, 1, 1, 1, 1 ),
"update": 1,
"values": [ 0, 1, 2, 3, 4, 5, 6, 7 ]
}

[sub_resource type="Animation" id=7]

length = 0.4
loop = false
step = 0.1
tracks/0/type = "value"
tracks/0/path = NodePath("sprite:frame")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/keys = {
"times": PoolRealArray( 0, 0.1, 0.2, 0.3 ),
"transitions": PoolRealArray( 1, 1, 1, 1 ),
"update": 1,
"values": [ 16, 17, 18, 19 ]
}

[sub_resource type="Animation" id=8]

length = 0.8
loop = true
step = 0.1
tracks/0/type = "value"
tracks/0/path = NodePath("sprite:frame")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/keys = {
"times": PoolRealArray( 0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7 ),
"transitions": PoolRealArray( 1, 1, 1, 1, 1, 1, 1, 1 ),
"update": 1,
"values": [ 8, 9, 10, 11, 12, 13, 14, 15 ]
}

[node name="ARFox" type="KinematicBody2D" index="0"]

input_pickable = false
collision_layer = 1
collision_mask = 1
collision/safe_margin = 0.08
script = ExtResource( 1 )

[node name="sprite" type="Sprite" parent="." index="0"]

material = SubResource( 2 )
texture = ExtResource( 2 )
vframes = 5
hframes = 8
_sections_unfolded = [ "Animation", "Material", "Region", "Transform" ]

[node name="Camera2D" type="Camera2D" parent="." index="1"]

position = Vector2( 57, 17 )
anchor_mode = 1
rotating = false
current = true
zoom = Vector2( 0.5, 0.5 )
limit_left = 0
limit_top = 0
limit_right = 550
limit_bottom = 550
limit_smoothed = false
drag_margin_h_enabled = false
drag_margin_v_enabled = false
smoothing_enabled = false
smoothing_speed = 5.0
offset_v = 0.0
offset_h = 0.0
drag_margin_left = 0.2
drag_margin_top = 0.2
drag_margin_right = 0.2
drag_margin_bottom = 0.2
editor_draw_screen = true
editor_draw_limits = false
editor_draw_drag_margin = false
_sections_unfolded = [ "Limit", "Material" ]

[node name="CollisionShape2D" type="CollisionShape2D" parent="." index="2"]

visible = false
position = Vector2( 0, 3 )
scale = Vector2( 0.7, 1.3 )
shape = SubResource( 3 )
_sections_unfolded = [ "Material", "Visibility" ]

[node name="anim" type="AnimationPlayer" parent="." index="3"]

root_node = NodePath("..")
autoplay = ""
playback_process_mode = 1
playback_default_blend_time = 0.0
playback_speed = 1.0
anims/edge = SubResource( 4 )
anims/falling = SubResource( 5 )
anims/idle = SubResource( 6 )
anims/jumping = SubResource( 7 )
anims/run = SubResource( 8 )
blend_times = [  ]
_sections_unfolded = [ "Playback Options" ]


            [gd_resource type="TileSet" load_steps=2 format=2]

[ext_resource path="res://Sprites/Tilesets/Tileset1.png" type="Texture" id=1]

[resource]

0/name = "0"
0/texture = ExtResource( 1 )
0/tex_offset = Vector2( 0, 0 )
0/modulate = Color( 1, 1, 1, 1 )
0/region = Rect2( 0, 0, 16, 16 )
0/is_autotile = false
0/occluder_offset = Vector2( 8, 8 )
0/navigation_offset = Vector2( 8, 8 )
0/shapes = [  ]
1/name = "1"
1/texture = ExtResource( 1 )
1/tex_offset = Vector2( 0, 0 )
1/modulate = Color( 1, 1, 1, 1 )
1/region = Rect2( 16, 0, 16, 16 )
1/is_autotile = false
1/occluder_offset = Vector2( 8, 8 )
1/navigation_offset = Vector2( 8, 8 )
1/shapes = [  ]
2/name = "2"
2/texture = ExtResource( 1 )
2/tex_offset = Vector2( 0, 0 )
2/modulate = Color( 1, 1, 1, 1 )
2/region = Rect2( 32, 0, 16, 16 )
2/is_autotile = false
2/occluder_offset = Vector2( 8, 8 )
2/navigation_offset = Vector2( 8, 8 )
2/shapes = [  ]
3/name = "3"
3/texture = ExtResource( 1 )
3/tex_offset = Vector2( 0, 0 )
3/modulate = Color( 1, 1, 1, 1 )
3/region = Rect2( 48, 0, 16, 16 )
3/is_autotile = false
3/occluder_offset = Vector2( 8, 8 )
3/navigation_offset = Vector2( 8, 8 )
3/shapes = [  ]
4/name = "4"
4/texture = ExtResource( 1 )
4/tex_offset = Vector2( 0, 0 )
4/modulate = Color( 1, 1, 1, 1 )
4/region = Rect2( 0, 16, 16, 16 )
4/is_autotile = false
4/occluder_offset = Vector2( 8, 8 )
4/navigation_offset = Vector2( 8, 8 )
4/shapes = [  ]
5/name = "5"
5/texture = ExtResource( 1 )
5/tex_offset = Vector2( 0, 0 )
5/modulate = Color( 1, 1, 1, 1 )
5/region = Rect2( 16, 16, 16, 16 )
5/is_autotile = false
5/occluder_offset = Vector2( 8, 8 )
5/navigation_offset = Vector2( 8, 8 )
5/shapes = [  ]
6/name = "6"
6/texture = ExtResource( 1 )
6/tex_offset = Vector2( 0, 0 )
6/modulate = Color( 1, 1, 1, 1 )
6/region = Rect2( 32, 16, 16, 16 )
6/is_autotile = false
6/occluder_offset = Vector2( 8, 8 )
6/navigation_offset = Vector2( 8, 8 )
6/shapes = [  ]
7/name = "7"
7/texture = ExtResource( 1 )
7/tex_offset = Vector2( 0, 0 )
7/modulate = Color( 1, 1, 1, 1 )
7/region = Rect2( 48, 16, 16, 16 )
7/is_autotile = false
7/occluder_offset = Vector2( 8, 8 )
7/navigation_offset = Vector2( 8, 8 )
7/shapes = [  ]
8/name = "8"
8/texture = ExtResource( 1 )
8/tex_offset = Vector2( 0, 0 )
8/modulate = Color( 1, 1, 1, 1 )
8/region = Rect2( 0, 32, 16, 16 )
8/is_autotile = false
8/occluder_offset = Vector2( 8, 8 )
8/navigation_offset = Vector2( 8, 8 )
8/shapes = [  ]
9/name = "10"
9/texture = ExtResource( 1 )
9/tex_offset = Vector2( 0, 0 )
9/modulate = Color( 1, 1, 1, 1 )
9/region = Rect2( 16, 32, 16, 16 )
9/is_autotile = false
9/occluder_offset = Vector2( 8, 8 )
9/navigation_offset = Vector2( 8, 8 )
9/shapes = [  ]
10/name = "12"
10/texture = ExtResource( 1 )
10/tex_offset = Vector2( 0, 0 )
10/modulate = Color( 1, 1, 1, 1 )
10/region = Rect2( 32, 32, 16, 16 )
10/is_autotile = false
10/occluder_offset = Vector2( 8, 8 )
10/navigation_offset = Vector2( 8, 8 )
10/shapes = [  ]
11/name = "14"
11/texture = ExtResource( 1 )
11/tex_offset = Vector2( 0, 0 )
11/modulate = Color( 1, 1, 1, 1 )
11/region = Rect2( 48, 32, 16, 16 )
11/is_autotile = false
11/occluder_offset = Vector2( 8, 8 )
11/navigation_offset = Vector2( 8, 8 )
11/shapes = [  ]
12/name = "13"
12/texture = ExtResource( 1 )
12/tex_offset = Vector2( 0, 0 )
12/modulate = Color( 1, 1, 1, 1 )
12/region = Rect2( 0, 48, 16, 16 )
12/is_autotile = false
12/occluder_offset = Vector2( 8, 8 )
12/navigation_offset = Vector2( 8, 8 )
12/shapes = [  ]
13/name = "15"
13/texture = ExtResource( 1 )
13/tex_offset = Vector2( 0, 0 )
13/modulate = Color( 1, 1, 1, 1 )
13/region = Rect2( 16, 48, 16, 16 )
13/is_autotile = false
13/occluder_offset = Vector2( 8, 8 )
13/navigation_offset = Vector2( 8, 8 )
13/shapes = [  ]
14/name = "18"
14/texture = ExtResource( 1 )
14/tex_offset = Vector2( 0, 0 )
14/modulate = Color( 1, 1, 1, 1 )
14/region = Rect2( 32, 48, 16, 16 )
14/is_autotile = false
14/occluder_offset = Vector2( 8, 8 )
14/navigation_offset = Vector2( 8, 8 )
14/shapes = [  ]
15/name = "21"
15/texture = ExtResource( 1 )
15/tex_offset = Vector2( 0, 0 )
15/modulate = Color( 1, 1, 1, 1 )
15/region = Rect2( 48, 48, 16, 16 )
15/is_autotile = false
15/occluder_offset = Vector2( 8, 8 )
15/navigation_offset = Vector2( 8, 8 )
15/shapes = [  ]
16/name = "16"
16/texture = ExtResource( 1 )
16/tex_offset = Vector2( 0, 0 )
16/modulate = Color( 1, 1, 1, 1 )
16/region = Rect2( 0, 64, 16, 16 )
16/is_autotile = false
16/occluder_offset = Vector2( 8, 8 )
16/navigation_offset = Vector2( 8, 8 )
16/shapes = [  ]
17/name = "20"
17/texture = ExtResource( 1 )
17/tex_offset = Vector2( 0, 0 )
17/modulate = Color( 1, 1, 1, 1 )
17/region = Rect2( 16, 64, 16, 16 )
17/is_autotile = false
17/occluder_offset = Vector2( 8, 8 )
17/navigation_offset = Vector2( 8, 8 )
17/shapes = [  ]
18/name = "24"
18/texture = ExtResource( 1 )
18/tex_offset = Vector2( 0, 0 )
18/modulate = Color( 1, 1, 1, 1 )
18/region = Rect2( 32, 64, 16, 16 )
18/is_autotile = false
18/occluder_offset = Vector2( 8, 8 )
18/navigation_offset = Vector2( 8, 8 )
18/shapes = [  ]
19/name = "28"
19/texture = ExtResource( 1 )
19/tex_offset = Vector2( 0, 0 )
19/modulate = Color( 1, 1, 1, 1 )
19/region = Rect2( 48, 64, 16, 16 )
19/is_autotile = false
19/occluder_offset = Vector2( 8, 8 )
19/navigation_offset = Vector2( 8, 8 )
19/shapes = [  ]
20/name = "22"
20/texture = ExtResource( 1 )
20/tex_offset = Vector2( 0, 0 )
20/modulate = Color( 1, 1, 1, 1 )
20/region = Rect2( 0, 80, 16, 16 )
20/is_autotile = false
20/occluder_offset = Vector2( 8, 8 )
20/navigation_offset = Vector2( 8, 8 )
20/shapes = [  ]
21/name = "25"
21/texture = ExtResource( 1 )
21/tex_offset = Vector2( 0, 0 )
21/modulate = Color( 1, 1, 1, 1 )
21/region = Rect2( 16, 80, 16, 16 )
21/is_autotile = false
21/occluder_offset = Vector2( 8, 8 )
21/navigation_offset = Vector2( 8, 8 )
21/shapes = [  ]
22/name = "30"
22/texture = ExtResource( 1 )
22/tex_offset = Vector2( 0, 0 )
22/modulate = Color( 1, 1, 1, 1 )
22/region = Rect2( 32, 80, 16, 16 )
22/is_autotile = false
22/occluder_offset = Vector2( 8, 8 )
22/navigation_offset = Vector2( 8, 8 )
22/shapes = [  ]
23/name = "35"
23/texture = ExtResource( 1 )
23/tex_offset = Vector2( 0, 0 )
23/modulate = Color( 1, 1, 1, 1 )
23/region = Rect2( 48, 80, 16, 16 )
23/is_autotile = false
23/occluder_offset = Vector2( 8, 8 )
23/navigation_offset = Vector2( 8, 8 )
23/shapes = [  ]
24/name = "26"
24/texture = ExtResource( 1 )
24/tex_offset = Vector2( 0, 0 )
24/modulate = Color( 1, 1, 1, 1 )
24/region = Rect2( 0, 96, 16, 16 )
24/is_autotile = false
24/occluder_offset = Vector2( 8, 8 )
24/navigation_offset = Vector2( 8, 8 )
24/shapes = [  ]
25/name = "31"
25/texture = ExtResource( 1 )
25/tex_offset = Vector2( 0, 0 )
25/modulate = Color( 1, 1, 1, 1 )
25/region = Rect2( 16, 96, 16, 16 )
25/is_autotile = false
25/occluder_offset = Vector2( 8, 8 )
25/navigation_offset = Vector2( 8, 8 )
25/shapes = [  ]
26/name = "42"
26/texture = ExtResource( 1 )
26/tex_offset = Vector2( 0, 0 )
26/modulate = Color( 1, 1, 1, 1 )
26/region = Rect2( 48, 96, 16, 16 )
26/is_autotile = false
26/occluder_offset = Vector2( 8, 8 )
26/navigation_offset = Vector2( 8, 8 )
26/shapes = [  ]
27/name = "29"
27/texture = ExtResource( 1 )
27/tex_offset = Vector2( 0, 0 )
27/modulate = Color( 1, 1, 1, 1 )
27/region = Rect2( 0, 112, 16, 16 )
27/is_autotile = false
27/occluder_offset = Vector2( 8, 8 )
27/navigation_offset = Vector2( 8, 8 )
27/shapes = [  ]
28/name = "36"
28/texture = ExtResource( 1 )
28/tex_offset = Vector2( 0, 0 )
28/modulate = Color( 1, 1, 1, 1 )
28/region = Rect2( 16, 112, 16, 16 )
28/is_autotile = false
28/occluder_offset = Vector2( 8, 8 )
28/navigation_offset = Vector2( 8, 8 )
28/shapes = [  ]
29/name = "43"
29/texture = ExtResource( 1 )
29/tex_offset = Vector2( 0, 0 )
29/modulate = Color( 1, 1, 1, 1 )
29/region = Rect2( 32, 112, 16, 16 )
29/is_autotile = false
29/occluder_offset = Vector2( 8, 8 )
29/navigation_offset = Vector2( 8, 8 )
29/shapes = [  ]
30/name = "49"
30/texture = ExtResource( 1 )
30/tex_offset = Vector2( 0, 0 )
30/modulate = Color( 1, 1, 1, 1 )
30/region = Rect2( 48, 112, 16, 16 )
30/is_autotile = false
30/occluder_offset = Vector2( 8, 8 )
30/navigation_offset = Vector2( 8, 8 )
30/shapes = [  ]
31/name = "64"
31/texture = ExtResource( 1 )
31/tex_offset = Vector2( 0, 0 )
31/modulate = Color( 1, 1, 1, 1 )
31/region = Rect2( 0, 128, 16, 16 )
31/is_autotile = false
31/occluder_offset = Vector2( 8, 8 )
31/navigation_offset = Vector2( 8, 8 )
31/shapes = [  ]
32/name = "65"
32/texture = ExtResource( 1 )
32/tex_offset = Vector2( 0, 0 )
32/modulate = Color( 1, 1, 1, 1 )
32/region = Rect2( 16, 128, 16, 16 )
32/is_autotile = false
32/occluder_offset = Vector2( 8, 8 )
32/navigation_offset = Vector2( 8, 8 )
32/shapes = [  ]

   [gd_scene load_steps=3 format=2]

[ext_resource path="res://addons/TileSetCutter/tilesetcutter.gd" type="Script" id=1]
[ext_resource path="res://Sprites/Tilesets/Tileset1.png" type="Texture" id=2]

[node name="TilemapTest" type="Node2D" index="0"]

script = ExtResource( 1 )
ForceUpdate = null
PadZeroes = null
GenerateAllPalettes = true
TileSize = Vector2( 16, 16 )
Separation = Vector2( 1, 1 )
TextureToCut = ExtResource( 2 )

[node name="0" type="Sprite" parent="." index="0"]

texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 0, 0, 16, 16 )

[node name="1" type="Sprite" parent="." index="1"]

position = Vector2( 17, 0 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 16, 0, 16, 16 )

[node name="2" type="Sprite" parent="." index="2"]

position = Vector2( 34, 0 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 32, 0, 16, 16 )

[node name="3" type="Sprite" parent="." index="3"]

position = Vector2( 51, 0 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 48, 0, 16, 16 )

[node name="4" type="Sprite" parent="." index="4"]

position = Vector2( 0, 17 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 0, 16, 16, 16 )

[node name="5" type="Sprite" parent="." index="5"]

position = Vector2( 17, 17 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 16, 16, 16, 16 )

[node name="6" type="Sprite" parent="." index="6"]

position = Vector2( 34, 17 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 32, 16, 16, 16 )

[node name="7" type="Sprite" parent="." index="7"]

position = Vector2( 51, 17 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 48, 16, 16, 16 )

[node name="8" type="Sprite" parent="." index="8"]

position = Vector2( 0, 34 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 0, 32, 16, 16 )

[node name="10" type="Sprite" parent="." index="9"]

position = Vector2( 17, 34 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 16, 32, 16, 16 )

[node name="12" type="Sprite" parent="." index="10"]

position = Vector2( 34, 34 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 32, 32, 16, 16 )

[node name="14" type="Sprite" parent="." index="11"]

position = Vector2( 51, 34 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 48, 32, 16, 16 )

[node name="13" type="Sprite" parent="." index="12"]

position = Vector2( 0, 51 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 0, 48, 16, 16 )

[node name="15" type="Sprite" parent="." index="13"]

position = Vector2( 17, 51 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 16, 48, 16, 16 )

[node name="18" type="Sprite" parent="." index="14"]

position = Vector2( 34, 51 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 32, 48, 16, 16 )

[node name="21" type="Sprite" parent="." index="15"]

position = Vector2( 51, 51 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 48, 48, 16, 16 )

[node name="16" type="Sprite" parent="." index="16"]

position = Vector2( 0, 68 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 0, 64, 16, 16 )

[node name="20" type="Sprite" parent="." index="17"]

position = Vector2( 17, 68 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 16, 64, 16, 16 )

[node name="24" type="Sprite" parent="." index="18"]

position = Vector2( 34, 68 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 32, 64, 16, 16 )

[node name="28" type="Sprite" parent="." index="19"]

position = Vector2( 51, 68 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 48, 64, 16, 16 )

[node name="22" type="Sprite" parent="." index="20"]

position = Vector2( 0, 85 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 0, 80, 16, 16 )

[node name="25" type="Sprite" parent="." index="21"]

position = Vector2( 17, 85 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 16, 80, 16, 16 )

[node name="30" type="Sprite" parent="." index="22"]

position = Vector2( 34, 85 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 32, 80, 16, 16 )

[node name="35" type="Sprite" parent="." index="23"]

position = Vector2( 51, 85 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 48, 80, 16, 16 )

[node name="26" type="Sprite" parent="." index="24"]

position = Vector2( 0, 102 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 0, 96, 16, 16 )

[node name="31" type="Sprite" parent="." index="25"]

position = Vector2( 17, 102 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 16, 96, 16, 16 )

[node name="42" type="Sprite" parent="." index="26"]

position = Vector2( 51, 102 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 48, 96, 16, 16 )

[node name="29" type="Sprite" parent="." index="27"]

position = Vector2( 0, 119 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 0, 112, 16, 16 )

[node name="36" type="Sprite" parent="." index="28"]

position = Vector2( 17, 119 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 16, 112, 16, 16 )

[node name="43" type="Sprite" parent="." index="29"]

position = Vector2( 34, 119 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 32, 112, 16, 16 )

[node name="49" type="Sprite" parent="." index="30"]

position = Vector2( 51, 119 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 48, 112, 16, 16 )

[node name="64" type="Sprite" parent="." index="31"]

position = Vector2( 0, 136 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 0, 128, 16, 16 )

[node name="65" type="Sprite" parent="." index="32"]

position = Vector2( 17, 136 )
texture = ExtResource( 2 )
region_enabled = true
region_rect = Rect2( 16, 128, 16, 16 )


[gd_scene load_steps=3 format=2]

[ext_resource path="res://Objects/Tilemaps/TestingTilemap.tres" type="TileSet" id=1]
[ext_resource path="res://Objects/Creatures/ARFox.tscn" type="PackedScene" id=2]

[node name="Node2D" type="Node2D" index="0"]

[node name="TileMap" type="TileMap" parent="." index="0"]

position = Vector2( 3, 3 )
mode = 0
tile_set = ExtResource( 1 )
cell_size = Vector2( 16, 16 )
cell_quadrant_size = 16
cell_custom_transform = Transform2D( 1, 0, 0, 1, 0, 0 )
cell_half_offset = 2
cell_tile_origin = 0
cell_y_sort = false
cell_clip_uv = false
collision_use_kinematic = false
collision_friction = 1.0
collision_bounce = 0.0
collision_layer = 1
collision_mask = 1
occluder_light_mask = 1
format = 1
tile_data = PoolIntArray( 1310720, 536870930, 0, 1310721, 536870930, 0, 1310722, 536870930, 0, 1310723, 536870930, 0, 1310724, 536870930, 0, 1310725, 536870930, 0, 1310726, 536870930, 0, 1310727, 536870923, 0, 1376256, 536870922, 0, 1376257, 536870922, 0, 1376258, 536870922, 0, 1376259, 536870922, 0, 1376260, 536870922, 0, 1376261, 536870922, 0, 1376262, 536870922, 0, 1376263, 536870927, 0, 1376282, 11, 0, 1376283, 18, 0, 1376284, 18, 0, 1376285, 18, 0, 1376286, 18, 0, 1376287, 18, 0, 1376288, 18, 0, 1376289, 18, 0, 1441792, 536870922, 0, 1441793, 536870922, 0, 1441794, 536870922, 0, 1441795, 536870922, 0, 1441796, 536870922, 0, 1441797, 536870922, 0, 1441798, 536870938, 0, 1441799, 536870931, 0, 1441818, 19, 0, 1441819, 26, 0, 1441820, 10, 0, 1441821, 10, 0, 1441822, 10, 0, 1441823, 10, 0, 1441824, 10, 0, 1441825, 10, 0, 1507328, 536870922, 0, 1507329, 536870922, 0, 1507330, 536870922, 0, 1507331, 536870922, 0, 1507332, 536870922, 0, 1507333, 536870922, 0, 1507334, 536870942, 0, 1507335, 536870935, 0, 1507354, 23, 0, 1507355, 30, 0, 1507356, 10, 0, 1507357, 10, 0, 1507358, 10, 0, 1507359, 10, 0, 1507360, 10, 0, 1507361, 10, 0, 1572864, 536870922, 0, 1572865, 536870922, 0, 1572866, 536870922, 0, 1572867, 536870922, 0, 1572868, 536870922, 0, 1572869, 536870922, 0, 1572870, 536870922, 0, 1572871, 536870927, 0, 1572881, 536870919, 0, 1572882, 536870919, 0, 1572883, 536870919, 0, 1572884, 536870919, 0, 1572890, 15, 0, 1572891, 10, 0, 1572892, 10, 0, 1572893, 10, 0, 1572894, 10, 0, 1572895, 10, 0, 1572896, 10, 0, 1572897, 10, 0, 1638400, 536870922, 0, 1638401, 536870922, 0, 1638402, 536870922, 0, 1638403, 536870922, 0, 1638404, 536870922, 0, 1638405, 536870922, 0, 1638406, 536870938, 0, 1638407, 536870931, 0, 1638417, 4, 0, 1638418, 1, 0, 1638419, 1, 0, 1638420, 5, 0, 1638426, 19, 0, 1638427, 26, 0, 1638428, 10, 0, 1638429, 10, 0, 1638430, 10, 0, 1638431, 10, 0, 1638432, 10, 0, 1638433, 10, 0, 1703936, 536870922, 0, 1703937, 536870922, 0, 1703938, 536870922, 0, 1703939, 536870922, 0, 1703940, 536870922, 0, 1703941, 536870922, 0, 1703942, 536870942, 0, 1703943, 536870935, 0, 1703962, 23, 0, 1703963, 30, 0, 1703964, 10, 0, 1703965, 10, 0, 1703966, 10, 0, 1703967, 10, 0, 1703968, 10, 0, 1703969, 10, 0, 1769472, 536870922, 0, 1769473, 536870922, 0, 1769474, 536870922, 0, 1769475, 536870922, 0, 1769476, 536870922, 0, 1769477, 536870922, 0, 1769478, 536870922, 0, 1769479, 536870927, 0, 1769483, 536870919, 0, 1769484, 536870919, 0, 1769498, 15, 0, 1769499, 10, 0, 1769500, 10, 0, 1769501, 10, 0, 1769502, 10, 0, 1769503, 10, 0, 1769504, 10, 0, 1769505, 10, 0, 1835008, 536870922, 0, 1835009, 536870922, 0, 1835010, 536870922, 0, 1835011, 536870922, 0, 1835012, 536870922, 0, 1835013, 536870922, 0, 1835014, 536870938, 0, 1835015, 536870931, 0, 1835019, 4, 0, 1835020, 5, 0, 1835034, 19, 0, 1835035, 26, 0, 1835036, 10, 0, 1835037, 10, 0, 1835038, 10, 0, 1835039, 10, 0, 1835040, 10, 0, 1835041, 10, 0, 1900544, 536870922, 0, 1900545, 536870922, 0, 1900546, 536870922, 0, 1900547, 536870922, 0, 1900548, 536870922, 0, 1900549, 536870922, 0, 1900550, 536870942, 0, 1900551, 536870935, 0, 1900559, 536870919, 0, 1900570, 23, 0, 1900571, 30, 0, 1900572, 10, 0, 1900573, 10, 0, 1900574, 10, 0, 1900575, 10, 0, 1900576, 10, 0, 1900577, 10, 0, 1966080, 536870922, 0, 1966081, 536870922, 0, 1966082, 536870922, 0, 1966083, 536870922, 0, 1966084, 536870922, 0, 1966085, 536870922, 0, 1966086, 536870922, 0, 1966087, 536870927, 0, 1966095, 6, 0, 1966106, 15, 0, 1966107, 10, 0, 1966108, 10, 0, 1966109, 10, 0, 1966110, 10, 0, 1966111, 10, 0, 1966112, 10, 0, 1966113, 10, 0, 2031616, 536870922, 0, 2031617, 536870922, 0, 2031618, 536870922, 0, 2031619, 536870922, 0, 2031620, 536870922, 0, 2031621, 536870922, 0, 2031622, 536870938, 0, 2031623, 536870931, 0, 2031642, 19, 0, 2031643, 26, 0, 2031644, 10, 0, 2031645, 10, 0, 2031646, 10, 0, 2031647, 10, 0, 2031648, 10, 0, 2031649, 10, 0, 2097152, 536870922, 0, 2097153, 536870922, 0, 2097154, 536870922, 0, 2097155, 536870922, 0, 2097156, 536870922, 0, 2097157, 536870922, 0, 2097158, 536870942, 0, 2097159, 536870935, 0, 2097178, 23, 0, 2097179, 30, 0, 2097180, 10, 0, 2097181, 10, 0, 2097182, 10, 0, 2097183, 10, 0, 2097184, 10, 0, 2097185, 10, 0, 2162688, 8, 0, 2162689, 8, 0, 2162690, 12, 0, 2162691, 536870940, 0, 2162692, 29, 0, 2162693, 536870936, 0, 2162694, 24, 0, 2162695, 24, 0, 2162696, 24, 0, 2162697, 25, 0, 2162698, 24, 0, 2162699, 24, 0, 2162700, 536870936, 0, 2162701, 536870941, 0, 2162702, 536870940, 0, 2162703, 22, 0, 2162704, 16, 0, 2162705, 17, 0, 2162706, 16, 0, 2162707, 20, 0, 2162708, 13, 0, 2162709, 14, 0, 2162710, 8, 0, 2162711, 8, 0, 2162712, 8, 0, 2162713, 8, 0, 2162714, 8, 0, 2162715, 8, 0, 2162716, 8, 0, 2162717, 8, 0, 2162718, 8, 0, 2162719, 8, 0, 2162720, 8, 0, 2162721, 12, 0 )
_sections_unfolded = [ "Cell", "Transform", "Z Index" ]

[node name="StaticBody2D" type="StaticBody2D" parent="TileMap" index="0"]

input_pickable = false
collision_layer = 1
collision_mask = 1
constant_linear_velocity = Vector2( 0, 0 )
constant_angular_velocity = 0.0
friction = 1.0
bounce = 0.0

[node name="CollisionPolygon2D" type="CollisionPolygon2D" parent="TileMap/StaticBody2D" index="0"]

build_mode = 0
polygon = PoolVector2Array( 0, 229, 16, 229, 16, 528, 528, 528, 528, 246, 544, 246, 544, 544, 0, 544 )

[node name="CollisionPolygon2D2" type="CollisionPolygon2D" parent="TileMap/StaticBody2D" index="1"]

build_mode = 0
polygon = PoolVector2Array( 240, 480, 256, 480, 256, 496, 240, 496 )

[node name="CollisionPolygon2D3" type="CollisionPolygon2D" parent="TileMap/StaticBody2D" index="2"]

build_mode = 0
polygon = PoolVector2Array( 176, 448, 176, 464, 208, 464, 208, 448 )

[node name="CollisionPolygon2D4" type="CollisionPolygon2D" parent="TileMap/StaticBody2D" index="3"]

build_mode = 0
polygon = PoolVector2Array( 272, 400, 336, 400, 336, 416, 272, 416 )

[node name="CollisionPolygon2D5" type="CollisionPolygon2D" parent="TileMap/StaticBody2D" index="4"]

build_mode = 0
polygon = PoolVector2Array( 97, 520, 120, 520, 120, 524, 97, 524 )
one_way_collision = true

[node name="CollisionPolygon2D12" type="CollisionPolygon2D" parent="TileMap/StaticBody2D" index="5"]

position = Vector2( 327, 0 )
build_mode = 0
polygon = PoolVector2Array( 97, 520, 120, 520, 120, 524, 97, 524 )
one_way_collision = true

[node name="CollisionPolygon2D6" type="CollisionPolygon2D" parent="TileMap/StaticBody2D" index="6"]

position = Vector2( 0, -48 )
build_mode = 0
polygon = PoolVector2Array( 97, 520, 120, 520, 120, 524, 97, 524 )
one_way_collision = true

[node name="CollisionPolygon2D11" type="CollisionPolygon2D" parent="TileMap/StaticBody2D" index="7"]

position = Vector2( 327, -48 )
build_mode = 0
polygon = PoolVector2Array( 97, 520, 120, 520, 120, 524, 97, 524 )
one_way_collision = true

[node name="CollisionPolygon2D7" type="CollisionPolygon2D" parent="TileMap/StaticBody2D" index="8"]

position = Vector2( 0, -96 )
build_mode = 0
polygon = PoolVector2Array( 97, 520, 120, 520, 120, 524, 97, 524 )
one_way_collision = true

[node name="CollisionPolygon2D10" type="CollisionPolygon2D" parent="TileMap/StaticBody2D" index="9"]

position = Vector2( 327, -96 )
build_mode = 0
polygon = PoolVector2Array( 97, 520, 120, 520, 120, 524, 97, 524 )
one_way_collision = true

[node name="CollisionPolygon2D8" type="CollisionPolygon2D" parent="TileMap/StaticBody2D" index="10"]

position = Vector2( 0, -144 )
build_mode = 0
polygon = PoolVector2Array( 97, 520, 120, 520, 120, 524, 97, 524 )
one_way_collision = true

[node name="CollisionPolygon2D13" type="CollisionPolygon2D" parent="TileMap/StaticBody2D" index="11"]

position = Vector2( 327, -144 )
build_mode = 0
polygon = PoolVector2Array( 97, 520, 120, 520, 120, 524, 97, 524 )
one_way_collision = true

[node name="CollisionPolygon2D9" type="CollisionPolygon2D" parent="TileMap/StaticBody2D" index="12"]

position = Vector2( 327, -144 )
build_mode = 0
polygon = PoolVector2Array( -311, 468, -199, 468, -199, 464, -311, 464 )
one_way_collision = true

[node name="CollisionPolygon2D14" type="CollisionPolygon2D" parent="TileMap/StaticBody2D" index="13"]

position = Vector2( 727, -128.013 )
build_mode = 0
polygon = PoolVector2Array( -311, 468, -199, 468, -199, 464, -311, 464 )
one_way_collision = true

[node name="KinematicBody2D" parent="." index="1" instance=ExtResource( 2 )]

position = Vector2( 130.969, 84.3264 )


GDSC         U   p     ������������τ�   ������������   ����������������   ���������������涶��   ��������������   ����������   ����������   �������������������   ���������������   ������������������������   ���������ڶ�   ���������Ӷ�   �������Ķ���   ���۶���   �����Ӷ�   ���������������Ŷ���   ����׶��   �������������Ӷ�   ����������Ķ   �����������Ҷ���   ����¶��   ����������������Ҷ��   ζ��   ���������������������Ҷ�   ϶��   �������۶���   ����Ӷ��   ���϶���            �                 �������?  K         �         �        �������?                    ui_left       ui_right      ui_up         idle      run       jumping       falling                                      "      '      ,   	   1   
   6      ;      <      C      H      M      N      S      T      U      \      ]      d      e      f      j      k      l      m      n      t      u       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   �   /   �   0   �   1   �   2   �   3   �   4   �   5   �   6   �   7   �   8   �   9   �   :   �   ;   �   <   �   =   �   >   �   ?   �   @   �   A     B   
  C     D     E     F     G     H   %  I   .  J   ?  K   G  L   H  M   P  N   T  O   W  P   [  Q   \  R   b  S   f  T   n  U   5TT<�  �  LN�  MT<�  �  LN�  MT<�  T<�  �  T<�  �  T<�  �  T<�  T<�  �  T<�	  �  TT=�
  �  LMT=�  T=�  �  TT=�  �	  TTT7=�  S�  TT3�  L�  MR�  T�  �  �  T�  T�  �  �
  �  �  �  �  �
  �  L�
  N�  N�  M�  �  &�  LMR�  �  T�  �  �  	�  T�  T�  �  =�  �  &�  P�  L�
  MR�  �  �  �  &�  P�  L�  MR�  �  �  T�  �  �  �  �
  P�  �  T�  �  &�  �  P�  L�  MR�  �
  P�  �  TT�  T�  =�  �  T�  &�  R�  &�
  P�  	�  R�  �  P�  P�  �  �  �  �  T�  &�
  P�  �  R�  �  P�  P�  �  �  �  �  �  (R�  �  �  �  &�  P�  L�
  M�  P�  L�  MR�  �  P�  P�  �  �  &�  P�  L�  M�  P�  L�
  MR�  �  P�  P�  �  T�  &�
  P�  	R�  �  �  �  (R�  �  �  T�  &�  �  R�  �  �  �  S�  P�  L�  MT[        GDST   �            (  PNG �PNG

   IHDR      �   ��<  �IDATx��Oh]G�ƿ7���$	�;�����7�^dP��� C�'�d:i��@��HpP/���!Ҧ�Y�݆nL$�j�'b��[{a�r?�ۘ���@3�Y�wJ�֭������W�"�����=��T�{��i��q��h�G�>6~ޔ6����h�&m��'��Pc�C�ѫ列s���� w�0:�NL�/�D[B�d��W�������m�p6�I�^}W�)��Z�V$�}�^}�>X�YR���YU;=9�>��v�H����������@+�s�12��n�#`h��և�_����&���{�;��W���W�  V��.6:�8=9�׎>�kG����[;ʘ/><�۷b��%�O�F�X�5����H����=�S��o �S�t�וx{kG}Nܾ����\B6�!��?��Ŀ~�[�kG������N��s��֎���/����{���C�?�>!����O���� �A,�N���`}1���[q�;���@�#t#=a�Z_�_��m	�������w?�۷*Q ��x=e��I��B!a������H����: �����)��v�%�?�0��h}���:���Y
ܳ�(M}�@wA-6�@Np��F�h|�}����L�{t�����H�m6���B+�[;��7�9�g?��q��*����v������u�h}���*���;��^F'ř�u���q��_�:�����?��[g�7>� ����P�	)Ȏ!���Z_G�_��]f ���No�����pc�wؼr-%b�����@��[;F'�����l�Ehxn����%�Vj��J 9���y�ZO�������������A�N������s�����{ �o� ؼr�W�a����w^]� 5�����c���C�C�����Z_�M�W� ���#z �F���y���'O�;8p
�����^��:p~F��#��/M ~���5��!�Z_�_��]g ��'a��g��;���+גN0��8��~����Z����Z��$� ;9�>xp��0$����z���F�2�5�����l�H���"�N���o��/�~��2��b��iA�F`u �l'�5����NN&�@�����g۠k�B��l�p��%N'=w�:��,��\������X��U ��,�3�T#�ݓ�D���F@�������:�gߙ��ш?a���ҳ��~�7n�ҳG�էk�ϗg�p��:�9�^��}`��,���w ��㇁��sde�{��{
��qϿ�����/><��p��d�q��p�F��=U��U���.8��?�� 7B�sg�������n��9��7��?]�����똾qm�}�Ʈst�z',s��H�G8�y	��_w��x��YY�⍛���֎��YYĩ�� ���_]�� s�Py���O���!�?��P���K }����u�S������Q?�9�/�a��We�O��h�E���v���ˉ/S\��n�?�>o�����}�_uj=���?]V ��_׫��)�{�%��<;�w�8=9���%�oڃ�]u���BY8�dK��l	��z0�?u��(���g�S���6��"� �N@�3K��U�?q	�0�����  L|�� |�D�7�xa��4=�}�z����&�N  6:����o���PA�u?,�N���.�%�vz||�O��O>�����o�a���n}���]\t��F�o����K���{ vC���� �S��Ϊ�.�N���$��4{'D�7�f�6 ��#��cU6B��:@#  ����4~o�1��'g��Bğo
�d����j"	V���vB%�t��r��v��d������++�O�9 ��k;n�J�F�����E�GH����h�/�i2�z�������T%��v��;=9�y҄�eA�Y���&�c�)���>�d�/l��O�����N������-���GY~�1J��OZ�ݎ:�i���)lw;���t����ô�/H(�n�M��>~p�P��-�Zq��]��g����f�~��.���E~ �<�:�ϵ��I�H������r�Z�*�8�Q��;hK�����0��e)�H1�a���'i{1��Æ����g���I��F�xl	@�~h�|n;Fֿ�3�j����~���jK�3��vm[a��b����F�.��@���fCS~0����J#�֗�BWG��DsH?ĪMH����|0tu�ah�@X?ĪH��ж&�Х��Ѝ0�b��H�����$���~�U[�_��-Eif"��C�!V�����ʃ7R�ٵ<4�QW�fB��Um�&�kg%  ���C#�C#�-�ϥVm�ڀ\8���Yǯ���aFE;��ڪ6`���}���j���H���v�H}xfG�*�#�-�����qFk��5��'?M	�x��i���]��:�jo�`�����o>3V����!��������DZ>E�*�#�-�o^[� b��cP�b�vї�W�� ��eUGe�e>{5�f�`��1�������o|�P4��W��&b���ڀ���+;�X}���D3~8���S?��� �>]�2�e��b0���v�n/ `yv���������PX{0 Y�?'�0ԇ��~�@���)?�o�����
�ڴ�g�R�g��{�`E��9��=�&�:��^~8{�0����{-BY�A�R�C�t�M�p���L��3�8���
X��<?��:��X�m�W�T�H^-V�'�����/��d����u���)����w�ң0�ы��6 ��&���G˲�b���꨾+�x�x^�11�"QB��F~xp��c''�����V�pde�/�Uს���th��Ƣ��n7q�@�Rozz�v���U��6Ņ��Ծ��68���<s�=��Y�����
�C��p�9�N|e3 ]�tM����l���.��'WP��:����D�1�3/�?vr�������>MYYăk8���3�-������*�V^���@;9�:�ɖ��c��M��m�22m0�>< �`z\�8�I���J���֝�o�O�oW�m�9�ޑ���s�D�|�I?U���LI/C��T�mҿ����,�K��o���n��Ls��3 }����Ϊ�Je�\�g6�im��c��:�z9��MG���Do�����_a��3���Z�mv��^����O�zw��a�~�⤮6����������ee�~�1�H�h�N��0J��>�O/c���M�yvJ%�E<�/�6qy|^D>Zi�T ���X�2*�� _��W�����Wjǘ�6�]���u�~C<=9����7� ���T%�~v��%*�n~U��Ȇ���r������`b������Ňg�x�٩j1��㰟2�F8��=Rں/������߉ho�P[S����'SG��� d��9u>^���7��N�����o����&
%N�96�.^O�pJ8��&^+�w���h����H��t��nG���R�@�z�ׇ�[C��2�O7Wu�yE���[��ػ�`� �j.�^�.1��]�����D�_�Y���Y��}�O�|�����J���c�� ܠ��=�z�ĿG���e�}�oZ��	�6P��(_$?��3 ��<z\�d�~^���4�ob������L7�|<m�<�ş��+/f�{�4����  ��X2tn�1l�������K��1�9��@�Ự�o�4��y_`m`75ԿT����_�{��xuD��NG7�F�\�,2b���\��d��S�|������� �W�7�g�Ҷ%a�B,_��InJ �N_�rOSC6�����
����� ���-�''m���ɺ	UD�H���[Jľ�%���sNV ���.���s=��+)L#��~ot�Wh6݆<���;
�jW�YJ��|c���	/,zeb�mƠ���e��/��+���JzZ��*� ��׿����ѵ����_*1���f�g ��6�_�I��M�ҙ�x���3�o�7j�,��o<F���O=�˰/�*��I���w�ՁE9}~�.�����ǥoM tw�b��q�iz�W1E_�E���.ڄ~�{1��������M�e�o#��]�F,�?��AE_�E�^}�ۀ���Nb�C:uP���岴N[[=�s�/��߀�Ӷ�|:bB_��?����"��/���g%��u�D_�E�f�a/*��_�>Plw�Q�O��␢/�U�{0�����-� 4W�M�E_���W� �벉��q]����⠢/������~�6��	ۻ�)j(�(�a�SoՅ�'��4��j9}�� )H���là�Ѱ~�ԡ�S��j���\��oW�����-�,a��jܕw��}@�oA8=k����O�A�T�d����9i�Y3���\e�]q}j�zY2C=�\}m�9脉�u}���zm8�ST>��~B�*��KQH[Ȩ��)D��U뻠'~SY2*�	��t�g���8��*�M��,@�L�ܒ���/�~f�3�Z:@�� ��5�u�|�s^��3�*�}��k(K���vz���G���+I~�S�A����ʰGVUa���p= =�yj$���Z�%%�g��x�&.={�_}���|yv
�.��s�������ħ7 ����oT�m����p4��*��HϤ���.Kv��Y�y�}	�M6����*�2*��MA���7a�t^$�2I��k�w��N�&�[;��̄)���f*J3�#+�8uy�k��1Ve�I�������M3AӽGݔ_S�u~��f}��r������w�����2W��C(s���t�z-D�L��n�/��q��t~N�t����{�:�l�
sVy��������#[4�JlhR?�&`�!T�r:��¨Z������ zg�(�����z�I��;� �sF} 9��2����Xq�j�wr���+c�����83m���m
j�c����)H�Կn}�ї�J�.;��,yMh덠
}�&�=�U��}@K>u��H_vR�h�"ЯHE%鲪2�>�:���ש�h6xM�`X�{3KX��?�ҧ�k#��r���կ���V�o U��T��U��(4�����f�j��{�`������Z5n�=��X� .{"dMD!�9��U��G��Ϊ�˳Яŷ����d��u�gi�h���gV��[��8/��e����6:�֚�e�=i�>��D�*?�����+$�� ؈��R`������A�ċn Ѵ����w��Y�&��`�L������S#05@ N1�{�	��U��aGʮ�n�w�}01v�8iH���zP�P/j�Z �"�z�߄~�6Q�~�6-1A�H%������J�{����Sǩ���n��Z�Z�У��kp�Ɗ�z���su�0O�)h��ˆ������$�r��qC�'ʃ�)�>��
;� B�'��mנU�;��j|+�F}Wz��1���:�1�PX߆��B�o��	��ƹW�u\�R�S4饾_T�d,�_����\m���T�2���Ч�Fߪ�e��F����g�*�_Q(�o�N����eCYݦ��@�΁����PUЛ��L���a:Nh�mھ�.��q�@�>�9֣sWߺ�m	fɷI��B����چ�����m�� F���*�y1Og�ņQ%�+� q!� !b$B�H��� #	@"F� D�$ A�I �1� !b$B�H��� #	@"F� D�$ A�I �1� !b$B�H��� #	@"F� D�$ A�I �1� !b$B�H��� #	@"F� D�$ A�I �1� !b$B�H��� #	@"F� D�$ A�I �1� !b$B�H��� #	@"F� D�$ A�I �1� !b$B�H��� #	@"F� D�$ A�I �1� !b$B�H�����"B�&�    IEND�B`�            [remap]

importer="texture"
type="StreamTexture"
path="res://.import/ARFoxSheet.png-d316a9ffdcbf0d93b163b5a953c6fa3d.stex"

[deps]

source_file="res://Sprites/Creatures/ARFoxSheet.png"
dest_files=[ "res://.import/ARFoxSheet.png-d316a9ffdcbf0d93b163b5a953c6fa3d.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
            GDST              [   PNG �PNG

   IHDR         �K�P   IDAT�c�6%۽q��z����%D�� �G����    IEND�B`�         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/ARFox_palette.png-67d496552e856b4a6c2bd45e751efc3e.stex"

[deps]

source_file="res://Sprites/Creatures/ARFox_palette.png"
dest_files=[ "res://.import/ARFox_palette.png-67d496552e856b4a6c2bd45e751efc3e.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
     GDST@   �            �  PNG �PNG

   IHDR   @   �   �Wm�  �IDATx��]]l����ņ���\�\0N��FN�D$���Z��H����O�H�U�QE}H�Zч*�����X�
I�J�(����&P��A%(0��v�6�6c��>�={gggfgwg�^s�^|wvΞ�ٝ3�|{f��˷�P�p~���J ��oMVƢ^��w�J��lz�l	 �~f+��~蝨��E���8uo���O���>t?�s�{�E���M�=7�����< ���Y�l �ɖ�^YgsW�Z��{�$}`]�S6�ڡ" `��y��Y��0}�++�����v������Q@��Ǐ����6�s����ʩ[ �k�n��|b	 `�Υ^Y��=�k��N����^�}<��j �;��q����^������{�uy��S ܎�յ�B��~� `�������2?���ﲯ�ߢ�J?�>��*��wm�u���|[�m�L�����6 ����&d�A�J>6�o��;S�yf(������ �T�B>� 0�qpp~�鲧���7"ɱLW�:�������B*�LW�:����������߭]X��(�uuG�Ñ��d����)����&�m��w.��c���4��A��L���ǅ�D���"����ǅ����:�b�0 �7��� E<)�ѡ�V�@�?-Hm�i쭃.���~y��.� |�8~�R�:�>�h�;�W&��]z.�d@������)�J����j��KVf�_&��O|w�p]��q�K�ppp�3���y�8w��Y"���|5�^�9q���8 �w�� % ��K'(�Yą��y:Μiϯ�MLO  V,[�G|u��̝dK%{c�2ޚ,)CO$��E�幉�	\�9��k+k��� ���&� ؁B���n�!h$Ĕ�����"�k���  �:'��5�:c��|
d����W��R���q�}�����|��pu=^�d�ȳ�����R�c˛pajF�	[�?(Sz&�:£�a�gF#�;��T�S�g�W�,�k�ݻ���pr�F (�LyFwIw��<_n�q�������n.�5�{ϻwA�3<.���(~  �<<E����;��%�����!8/	�~ _?����7�n�����O,�1:T&��fa�f^l@y��^�p��m�߹ԣ�zp�+��5Eؼ�s�9:���'��Ǐrqde ppk��~  g�8��x��&z��<e:]q� ���Z���R���)���W�Ɛ���PZ�G,? k>���K�7 ��d�X���'���> �Ț�q�b���<� � p^>>T�xlyS��?� `x����M�g4�\�as�f�X^�_'<�b��'oB��q���U@t_�����ލ��-�f<��{~V�/�*��t���0��o}z�����h�QR>��u^��o�Ny������"Gw^����GP�	�^ �d�?:���{B�blـ0P[TyJ�N�| _N�)Y�paj�
[�8x:z�o�	� X��y�����{t2�O�j��d�:��A��>�xC(�� Q,pOC����|�}> 22���P}@�G�k�T6s> i~ �0?�o.�g�T#? �k������)g����� - T�l��|~�J>i� P�T�d#dH5?�����S֩F~��ip�~i�u0>=�������P����!�k&����k�<��X���l�0}O�l�m��2��RtH� ����u���+PF�[�������m6�s���0���J�  ߴ�'S�6 ?�<A~�S�XL7�G��1P��)w< ��\�Эu��P7|�r
d��8�0T��|^��3s>���0>@��� ��cu��k�|�������w��v�����:>=�j~�L_��3wn㍁��1}���i,@~����>�� �.�-8�A��;��y)@��ק9J�$<��O�:��8��]Z.�(v�pJ��4|P��K�� �]���7}Ά�F~��������*T3? ���@F���=7�}0��PԩAz|���
���@w��bwGc�����:���Nt>K��a��'\8�]³�?�$r��,��s]~ �=�<��_kK*��~�w��'_��oe����׋JY x��U,*.�M�*��7�<{P�|@X�U �CW��3�:o.��K��"�E�_x��� ��<? +�=�<? +P�j~ }Ϧ�dl������v���R故A�������?�h�`�2��oŢW��	�R�L�ـ�_�4A��)�H��D�n	�>*�p^lm�N��3B.�:���b V�=#H�봊��w@�����J���	�8�"ݭ+؀T����\ҵ1Q�S�0���:�&�Vy�7j�H"߹F�����ؐ���؀j � ,���#��U� �����4���yz���s�AS��,���0�K� �!? �}����b;z�����@����I�C�	 ��¦�%p�i ��?O�`;?@��o���}f�x���^���bw1���-��d<��O�S������=�*T+?@�'�O�w2�~&���Ǯ���C�|M��H��7!�~�P�B5�t6`�?A9k�d����(�>�xC(�LL�o�����ws����^������y%_��m��,`I߯�����9=�v�El�=0�{��u�rX���q�ɛ�������j���ݯ���Q�����2&�ڽ�����k4oa7������\��n^X��on|8p�(������12)�6�t�G�������V{��&��M�U��Y���=a�a��"�-��_$�"t��e6@&��ׇ`�ܸ(�z6���T^���5qca�
&�a��yT}�a�j���<թ5������z�Q����7�d�+��w��:B�~��.����    IEND�B`�            [remap]

importer="texture"
type="StreamTexture"
path="res://.import/Tileset1.png-323383d5c1e8f636f04faa77b140f99e.stex"

[deps]

source_file="res://Sprites/Tilesets/Tileset1.png"
dest_files=[ "res://.import/Tileset1.png-323383d5c1e8f636f04faa77b140f99e.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
   GDST               �   PNG �PNG

   IHDR         ��a   iIDAT8����	�0D���o�:X�?$�D�A�'���?:F�qʽ-h�Uܬ�w��FPK�AP�����1C!4���oP���B�i*BH�������b. /�v0h���    IEND�B`�              [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-c5087b039fa4dcce34c592ed22b614a9.stex"

[deps]

source_file="res://addons/TileSetCutter/icon.png"
dest_files=[ "res://.import/icon.png-c5087b039fa4dcce34c592ed22b614a9.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
           GDSC   4      ^   Q     ���ӄ�   ����ζ��   ����������Ӷ   ����������Ӷ   ��������Ŷ��   ������������������Ŷ   �������Ӷ���   �������������Ӷ�   ���������ض�   ���������������ض���   ������Ӷ   �����������¶���   ������������Ӷ��   ����Ӷ��   ������������Ӷ��   ߶��   ��������������¶   ��������Ҷ��   ���������Ӷ�   ζ��   ϶��   ����   ��������޶��   ޶��   ���������¶�   �ζ�   �϶�   �����Ŷ�   �������϶���   �����Ӷ�   �����Ӷ�   ����   �������Ӷ���   ������Ӷ   �������������Ҷ�   ����������¶   �������ض���   ��������Ҷ��   ��������Ķ��   �������Ӷ���   ��������������������¶��   ��������   �����¶�   ����Ӷ��   �������׶���   ���ݶ���   �ζ�   �϶�   ����ڶ��   ��������ڶ��   ׶��   �����ݶ�                             %0        d                                         
                  !      1   	   A   
   L      M      N      U      Y      Z      a      e      f      m      q      r      y      }      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,     -     .     /     0     1     2   "  3   >  4   H  5   Q  6   R  7   V  8   h  9   k  :   u  ;   v  <   |  =   �  >   �  ?   �  @   �  A   �  B   �  C   �  D   �  E   �  F   �  G   �  H   �  I   �  J   �  K   �  L   �  M   �  N     O     P     Q   (  R   )  S   5  T   =  U   @  V   A  W   G  X   H  Y   K  Z   L  [   M  \   N  ]   O  ^   8T5TT=�  T:L�  M=�  ;�  T:L�  M=�  T:L�  M=�  T:L�  M=�  �  L�  N�  M;�  T:L�  M=�  �  LNM;�	  T:L�
  M=�  �  ;�  TTT3�  L�  MR�  �  LMTT3�  L�  MR�  �  �  �  T3�	  L�  MR�  �  �  �  T3�  L�  MR�  �  �  �  �  �  &�  R�  �  LM�  (R�  )�  �@  LN�  LMMR�  �  L�  MP�  LM�  T3�  LMR�  �  &�  �  R�  &�  P�  �  P�  R�  �  =�  �  P�  LM�  =�  �  P�  LM�  =�  �  �  P�  �  =�  �  �  P�  �  �  =�  �L  L�6  L�  �  MM�  �7  L�  M�  �  )�  �@  LN�  LMMR�  �  L�  MP�  LM�  �  �  �  )�  �@  L�  MR�  )�  �@  L�  MR�  &�  L�  N�  �  P�  N�  �  P�  N�  P�  N�  P�  MR�  �  L�  �  M�  �  =�  �  P�  LMT�  &�  R�  �  P�   LL�  �6  L�  M�  M�  M�  (R�  �  P�   L�6  L�  MM�  �  �  P�!  �  �  �  P�"  �  �  �  P�#  �  L�  �  P�  N�  �  P�  N�  P�  N�  P�  M�  �  P�$  P�  L�  �  P�  ML�  �  P�  M�  �  P�$  P�  L�  �  P�  ML�  �  P�  M�  �  �  �%  L�  M�  �  P�&  L�'  LMP�(  LMM�  T�  0�  T3�)  LMR�  0�  T3�  L�!  N�  N�  N�  N�  MR�  =�*  �  �  =�+  �!  P�,  LM�  �+  P�-  LM�  )�.  �@  L�  N�  �  MR�  )�/  �@  L�  N�  �  MR�  �  =�0  �+  P�1  L�.  N�/  M�  &�0  P�2  R�  1�  �  �  �+  P�3  LM�  �  1�*  �  �  �  �  �  [              GDSC         	   *      �����������ض���   ����������Ӷ   ��������������Ӷ   ���������Ӷ�   �����������������Ӷ�      TileSetCutter         Node2D        ./tilesetcutter.gd     
   ./icon.png                                                   $   	   8T5TTT3�  LMR�  �  LN�  N?L�  MN?L�  MMTT3�  LMR�  �  LM[   [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

radiance_size = 4
sky_top_color = Color( 0.0470588, 0.454902, 0.976471, 1 )
sky_horizon_color = Color( 0.556863, 0.823529, 0.909804, 1 )
sky_curve = 0.25
sky_energy = 1.0
ground_bottom_color = Color( 0.101961, 0.145098, 0.188235, 1 )
ground_horizon_color = Color( 0.482353, 0.788235, 0.952941, 1 )
ground_curve = 0.01
ground_energy = 1.0
sun_color = Color( 1, 1, 1, 1 )
sun_latitude = 35.0
sun_longitude = 0.0
sun_angle_min = 1.0
sun_angle_max = 100.0
sun_curve = 0.05
sun_energy = 16.0
texture_size = 2

[resource]

background_mode = 2
background_sky = SubResource( 1 )
background_sky_custom_fov = 0.0
background_color = Color( 0, 0, 0, 1 )
background_energy = 1.0
background_canvas_max_layer = 0
ambient_light_color = Color( 0, 0, 0, 1 )
ambient_light_energy = 1.0
ambient_light_sky_contribution = 1.0
fog_enabled = false
fog_color = Color( 0.5, 0.6, 0.7, 1 )
fog_sun_color = Color( 1, 0.9, 0.7, 1 )
fog_sun_amount = 0.0
fog_depth_enabled = true
fog_depth_begin = 10.0
fog_depth_curve = 1.0
fog_transmit_enabled = false
fog_transmit_curve = 1.0
fog_height_enabled = false
fog_height_min = 0.0
fog_height_max = 100.0
fog_height_curve = 1.0
tonemap_mode = 0
tonemap_exposure = 1.0
tonemap_white = 1.0
auto_exposure_enabled = false
auto_exposure_scale = 0.4
auto_exposure_min_luma = 0.05
auto_exposure_max_luma = 8.0
auto_exposure_speed = 0.5
ss_reflections_enabled = false
ss_reflections_max_steps = 64
ss_reflections_fade_in = 0.15
ss_reflections_fade_out = 2.0
ss_reflections_depth_tolerance = 0.2
ss_reflections_roughness = true
ssao_enabled = false
ssao_radius = 1.0
ssao_intensity = 1.0
ssao_radius2 = 0.0
ssao_intensity2 = 1.0
ssao_bias = 0.01
ssao_light_affect = 0.0
ssao_color = Color( 0, 0, 0, 1 )
ssao_quality = 0
ssao_blur = 3
ssao_edge_sharpness = 4.0
dof_blur_far_enabled = false
dof_blur_far_distance = 10.0
dof_blur_far_transition = 5.0
dof_blur_far_amount = 0.1
dof_blur_far_quality = 1
dof_blur_near_enabled = false
dof_blur_near_distance = 2.0
dof_blur_near_transition = 1.0
dof_blur_near_amount = 0.1
dof_blur_near_quality = 1
glow_enabled = false
glow_levels/1 = false
glow_levels/2 = false
glow_levels/3 = true
glow_levels/4 = false
glow_levels/5 = true
glow_levels/6 = false
glow_levels/7 = false
glow_intensity = 0.8
glow_strength = 1.0
glow_bloom = 0.0
glow_blend_mode = 2
glow_hdr_threshold = 1.0
glow_hdr_scale = 2.0
glow_bicubic_upscale = false
adjustment_enabled = false
adjustment_brightness = 1.0
adjustment_contrast = 1.0
adjustment_saturation = 1.0

            GDST@   @           �  PNG �PNG

   IHDR   @   @   �iq�  tIDATx��{p�U�����#�t��y�@y@�	��D�8;#ಳ���S3���FJ�*�-�]fQ�qx�K��B��$�y����o�AB:�n���U����{�=�|����ۢ`�<<^? �V����.%!L��(�K���m�e5p,� ZD��y x�~��h�=#@u�48��n����@��1��Z�^��$�} j��V��R!�tK��/�"$��^�>��d�=R�����% �7�J�>!Im�	�Ԛ��x !$Tj:c�DB��������4BSd4h ��IH*���x �Tj��$ ����I:��@�J�3�U߅�R���N%-�B�A �V�u�it���J@�7������I � B��В`b��b�3�}��bg��b,	���U ����,̞2�IwR�3!����}���ưm~��1-�����P~�������49�Dϸ;�pD��L徱�!QV�ƻ{�8\�¸O�N�w��[���-�Ⱥ��<�`�0+w����,���u�$�n��ɳ�q�7�������E�ֲ�������w����͜1Cx����Kouk�O̠�dӑx�2��?P��3�ә~GcF����+hs��s\w:�&�&)���w����n���2�r()�'{���!vJ����Ql8T��/wk�����=U,~�I�f�MO��;\�N��Z��@�:[����]��Z������-G�¶�ym�"�h�24����7����[��{:��h������*�S�7}ċ�:���t��Վ�ew���#^�<�u2S�-�LM�y[�KfW=��^{�1���=�8ߝ6�݇������p����,|��&�MU���Ǝ�鋊������sOSR��ʷ6����L����0i�w ��}�xsC�rŨiO) &������i�p�C����/�S����>�MIQ9Y��e5�%Rn���%�ܒ��?�s����OL��?���ƤS�	�������?�(����)3�����x�Lv��"k�U��T#?�7��fݏ�d��i闁})��_���6���Q���geY����U'բg�ܙ��7���}��s�%���P��������n�݌�'S���y���d��SQ����\������j���4^j۾k�9	.[<I�a�S=��ht�t��[==��
+��BRiX�xn�r":`������+il��il���+W���)%�Ft���t�;�l��!�
����y��Y��Et@C��L��Iy���o3��Rȴih����?�MYEK��a3i��@b3iY2-���>�xwĺ
���o֡�^x0?�J$/<��FR��o�
�_@����K��vwg'SZ�wJ�VSZh���d^[�������F���e�3HO2�ZG��xr\�YV�&-�Ml=Vω����h)�Lb��t�N����xm��5rb5��ç{��u,`�k{M�Z�Z^�;�������M����[�n,�5�$���d# ��Iz������������2��xL�`oy�%�ydX��={�E1g�#�zx67ld��lF�%�m���'51�y�ȴD�O�fㆍ�zx6sf?¢��8{�,V#KJ�bQ�W��3��L����e�ϗQYy �������}{�:���Q����%�^PBqfR����۷�7^��3	RYy��?_���e��d����3��a�&�������ԣ|׮�d��<מ�$	$I�kO�)w��]�z.aMMM���#�`Xr�����+�O�N�\�����6��ËV~���WsG���v@c���]��撗��{)I3g��pU�)��UfΜ�$uW1/?���\�_v�%>�KZ��O�Q���rJKKIM�SXX����m���Tc�2w�j�m��|�/),,$5�N���X��+���C��$EO7�����iy����"�����h�6��m���~����\����ҫ�bԪQ�3;X��WT6��o��e�+������0hT��Z�Z"�v��"�+�Ŏ���	�
k�T�fOV�O@[�F��٠' �i<@PVX�eM�r��y#�����I�#@��%C�Q�N�ˏ�����]��OyC;m�9J���OK�f�b3i����L���'4������kvr�Çդ%+�Ș��nuZ=���z�Q�aaL���r���-����.��ǊI�.(����p�9��ΠY�ރ��i8Py�w�Vu{f���g�ΨtK���?�G�-��mrA
���|P����[x�J.?-����ߓM��!}X�Q;  ˨U=á�+J�9<gZѫ%�aBU�$H��[��owV��㟦�R���J�aW�j	�J����uԨ�`�e5QO�m�.����b���]^j���zW���U5�\W���j.�P�$��E���4W^jb���a5ii�� 5�P^]��9��;��Cq��\`p����AZ��+/�.�BWً�BH2j0i�u����+#�9s��O{���{��d��ߡ0�������'eq�e��ZL:5&��I����D���Nez���.��p�H6ki�hl���q���|A\� ��~v�i۾0�B��Ț#'�5+��Q�V���.����G���o��W��I�A��?�>�0꣱.|� /��DA���g �ƌ�����D^Y��O�%�epǾcd���x�L�*�W�����hQK��^���v^�`;���}�����`�%O�&�n�w;+8Zۿ��2&+�N�%�f⵵[X��O1�P����� ZC���ՔU�0�<Z2���8}.�6:���a6M��'����ʲ�ֲm�����Keԓ`84j5ߛu?���5�Ls���O5r�����mx�Oe�E��(L�P��Ĕ�vR���;Y���������]�`�ЅZ�b�]�̚2����U*�BeSU�\Էxhl������㗑C
mW��YT���Ua1h��Ǟ�'�j`� �'��AY��c����9RFP�q��ע�i(�Ϧ8?���3��"����h������q�������0�G"�;B���8x�O���L�Q��b#-�J�لѠC-IX-��rG�9�����t���BC� �=���VP�aVe�~3���o������@���SP�
� !y��m᪭
���� �o�;@���V�߹]�ZQ9���M���$��(�,	i�w{����ֿj'�� ^g�����U�̑ �j��ɠ�<(J!$��c��A�Og��n��PB�;��)!IV:P���V�g�>�*���d�Ƿ�`�-1u>�ۇ*=o n�O��Rp�9�j�P=B�>�������w���
��"��eY�Q�Ѩ��1>��g�    IEND�B`�   [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
  [remap]

path="res://Scripts/ARFox.gdc"
        [remap]

path="res://addons/TileSetCutter/tilesetcutter.gdc"
   [remap]

path="res://addons/TileSetCutter/tilesetcutter_plugin.gdc"
            �PNG

   IHDR   @   @   �iq�  qIDATx��{pTU����~���I�A	$2$�H E, 
(�>��ؙ\vvqtwj�ف�}��H�S�̨�*����0��
��S^�
B!$��t������!��N��t�_U�n�9�;������sסO�'}��QA!~'i�E�Dw2��P��w=�%EY}���c�˕�ɢ�!u�$m�)��qz�ȷD�~F����y��ly���n\s�i�}�����$!�Pi��4:$YF�V��g%H0��u��� *�.����zr�W֥Ô���V-���>��Z�G�d�����B I2*��FK��A� !��_�#1��'��:� �MH��V�ܯ~\mV���-�HZYZ(@Vk���H�
�V�@�ZYZ(Ձd��V����akPxP�������:[�$�����KJ00u|	�Y�^��43u|	I	�7��U ��������=e<��*bX�@�(�¦���C��ŢG�[6!AE���%v)g���X[�EϘ;�hh�L徱E!Q^�ʻ{�9|��qy&�*�����OEu]�r��Y�-�Ⱥ�8x����F�2����,���u��n�ɩs�1�7�H���w�/���/��x=��3���ɜ�y����ov)���������%\� ��6��%-A�̒L�����y<��JZ�Θ��i޴��HN�g�;�x{Ou��� �r���;�L�@3�Ņ�3f�������<����%�"91�iG�R�ض ����8�L��2��cu̽+��/[��}��˖�u!�tȼ��XS�]k�	:5�������3��t��ڝ��W������(�]�7uĊ�:��� �
��֨ew��#VD��j���L�NO��Z��CfG���N}�Q��_>�ߟ6�݇��ݻ��t�
z���/z��&�Mu���F[Ԋ�Fe���&;���S����͍�<^����9L�= ��c+���\1bړ
���6��?������_�������%���wSZ\@^N&�y���*7oiT�`^� ����z�<���'��{�/`Ъ��������x��;��r4[�eFR��b�̛�ί/�v� v�n�G�����qx�,�t��5�}2�7�A�u�/p���{x�e�Y�e��9�9�'�X2o&��>?p�W��� �dֿ�sj��<���@ׯ�o���	P���yё��Ǡ��l�wy���}l����l�WZB��h�v�˗�C�լ�v��� ���o�x��W7�|�U�N#�j�/�׫���=��qŅ���*�B��#�mn��k��=�4lް���E���'b�����\�:��6_X44Y�6�1� ��{;3� �lSM�']a��ǻ)��a�LML�OLK�P^YÇ��7��� ���:Ԓ�s�T���QK
���:�����(p��
����ݹ)��ҺՔ��;7�W�n�bÕ^�G4�ӧ{Y��2��=�Ѫ$��CI��AC����c���z����df��dHZ�/�k���`m�+ǁ�8�>?�toD�#^�u���8/�E�1 ��ƽ��ܓ�ʻ{����ͅ�����\`����J�(+�������hvz{(�T<��`Oq�ed�8w��-f��G���l6n�Ȃ���HY.=QGzb�����,�������l��~�ŋs��9��q,-+�F��sH,^�b�n7�~����� 8�N^�u����������dV/,e��RJ����Oaf߾�����8��A����,��r�n7����{8���b@AEE��[��]�< ���|s�$�$A�9�������}�X,TTT �`pJ���쀦k�O�V2]���d�~�ds�ф�{t��d�{|��hlss���|

��.%Ib����>v���̙3���*����ū���Ob�
+����2����b�op���<��̝�q�ͬX����HO7S�@+W�@A��'�P=6A�3m����xfZ���!pz�l=ZǺ��!��=�������yj�`^x�e�4*E��e�>��*K������p���O��
�Z����9|�`�ח1^[_�8u9d_@a͞j��&˨�j���B�Yb�7��z5�PX�eM�r#�y3��'�b@�-@����Q�I�Ë�����\�쥢������e$�(�H�d�`2h04�����j����r����7ٹb�`4h�I�c� c�<-.~�ցee%1:��c:���fN��|`ţ%dܰ(�j�`ux9��ƀ-9ƞm7Up��*�����x��O�?��Ia�?�@٦���RY��P������_Tauxivt]��=��؋%��|� *��r���uV%�Ft*	w���,	2���l�;+�����|J�R�%A ��N%��%ꬮ�A�,��C����lms`��9,f���
���7�ʜ�C%K�\qt�7��\q��%�7��a����.u��h���j�-��BÇ���n��7�UO|s�������iq�P�}к0{i�?4! 9N�A�"N�U͎�B1<#���z�������)&��=�2�8U߽����2No��x�
�V�ɠ!��s�^�U���K=wp�Z�:<��khs�hluc���:�8<~?W�^v�m
Y�(+�Lck���Ԭ�7G�5����3�s�v~��I���ǐ�<�����~(�xk���ǋk61,#��(�v:G-D{$xXF"/��ԫ���0�c�1r�SY2o&*Y���g�m+<RT��_�c�p3�}����EW>�
Wo����ҧf�o��՝���[��f���O��m2���-�����eȩy#�@��<�t���5L9���C�����r?O�����lb��!�pR�--,e-�v�J���>TF�	�B�R�Y�3����i����t#'j[8Uߊ�~W&Rtj���$�s��2�Lj���6;�?���>��?�%rG'�'t��e&�UĬ)�_2�,*TYlT_qP�좱͍��M�ˇ� Th�vL.I�F�z�L�^MZ�s��,���IK@��@�/��a�_��H9���;8���VMqa.%����#7�L�)��'���T�5r��y�WTs�L5�(z�pDuF(�O�������4j�&2R�$���kQIƤ�p���N ����fw���LC��/�9�͢RP��(J�������[���op+P�����B=�_&���i�B��t���w����a��k�.	X�(J��q}'ZA0���q�(J@�j���5jԨUw|d�!�m�J�?n{(
N����s�o�~�]��S}|�dP�=.%�B�;��h��Y?>����Bvۮ��o=,�i]��IZ�w��˳��lY��u���NCWj^��.%e���O-T&�(:��s������|�3�y?��c�ٓ��Z}�s�����J~u�qK    IEND�B`�      ECFG      application/config/name         AR-Fox     application/run/main_scene$         res://Scenes/Testing.tscn      application/config/icon         res://icon.png     display/window/size/width     &         display/window/size/height     &         input/ui_cancel@              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode           unicode              echo          script            input/ui_leftx              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode  A          unicode              echo          script               InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode           unicode              echo          script            input/ui_rightx              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode  D          unicode              echo          script               InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode           unicode              echo          script            input/ui_up�              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode  W          unicode              echo          script               InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode             unicode              echo          script               InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode           unicode              echo          script            input/ui_downx              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode  S          unicode              echo          script               InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode           unicode              echo          script         )   rendering/environment/default_clear_color        �<  �<  �<  �?)   rendering/environment/default_environment          res://default_env.tres           GDPC