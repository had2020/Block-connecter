# Block-connecter
A Godot 4 project in which you can connect blocks, saving is still work in progress

----------------------------
<img width="576" alt="Screenshot 2023-12-15 at 1 05 13 PM" src="https://github.com/had2020/Block-connecter/assets/59424667/9c26d36a-3ba3-4732-b30a-84f40427d42b">

# About the project 
I made it for a future project, its a godot 4 game,
in which you drag blocks and connect them.
I will use this project for a ship editor, in a space sim

----------------------------

# How to run the project
This project was created in Godot 4.2, Any Godot 4 verison should work, but I can't say if it will work on every Godot 4 verison.
You will also need to add sound in the Block scene and level scene there will be a AudioStreamPlayer node in both scenes, in which you will add the sounds.

----------------------------

# Code analysis

Level / Node 2D 
<img width="213" alt="Screenshot 2023-12-15 at 1 04 39 PM" src="https://github.com/had2020/Block-connecter/assets/59424667/6ef0bf73-f658-4c90-84dd-08fd79dc1b0a">
- the level node is the root node where all nodes are held

  Sounds / Node 2D 
  - this node holds two AudioSteamPlayer nodes 

  BuildCam / Camera2D node
  - the camera node

  Saving / Node 2D
  - holds the code for saving -> which is still a work in progress,
    the ui is still connected to the code.

  Block-Icon / Node 2D
  - has a button child, and spawns in a new block, that's set as draging from the start

  Ship / Node 2D
  - holds all the blocks attached to the ship, this will be used in saving since all we need to save now, is the ship part, its position

<img width="217" alt="Screenshot 2023-12-15 at 1 05 42 PM" src="https://github.com/had2020/Block-connecter/assets/59424667/7265489e-6069-4af9-9c7e-65a22c29e135">

    Block / Node 2D - instantiate
    - is a basic scene for ship parts, includes code for dragging and playing drop sounds
      Button / Button node
      - causes a event that that starts the dragging code
      Edge / Area 2D - x4
      - used to know when other parts touch.
      AudioStreamPlayer node used to play sounds when droped
