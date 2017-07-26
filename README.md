# Lantern Engine

A 2D game engine in Forth built on [Bubble.](https://github.com/RogerLevy/bubble)

Lantern is designed to be simple to use and modular.  With its modular design, it should be easy to swap out implementations and add enhancements and any needed capabilities or platform support.  Thanks to being powered by the Allegro 5 library, it takes advantage of hardware graphics acceleration for decent performance.

## Features

- Currently runs on SwiftForth / Windows 7 and up
- Designed for 2D games
- Integrated interactive REPL (part of Bubble)
- Idiom-based object system (like OOP but simpler)
- Multitasking scripts, enabling more complex AI
- Automatic static asset loading - no need to declare assets in source
- Basic sound support with samples and background music streaming

## Planned for 1.0
- Fast depth sorting
- Tilemap support with collision detection
- [Tiled](http://www.mapeditor.org/) map format support

## Shelved features (probably in 2018 or 2019)
- Fast ABAB / "Early Phase" collision detection
- [Spriter](https://brashmonkey.com/) support
- Mappable joystick support
- Physics
- Shader support
- GUI system for tool-building based on new "Workspaces" paradigm
- Object parenting / multiple object list management
- Adaptive display resolution (optional)

