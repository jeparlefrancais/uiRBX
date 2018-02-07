# uiRBX
Create a plugin to handle UI development on Roblox

## Python Files
Run the *build_plugin.py* to generate a *.rbxmx* file. This file will contains all the scripts and modules from the folder *src*.
*item_classes.py* are just classes used by *build_plugin.py*

## main script
This script calls the *CreateGui* function and gives the size of the buttons of the plugin and the PluginModel that contains all the information to generate all the buttons.

## UI
This folder contains everything related to the visual of the plugin.
The plugin contains has that are stored in *sections*. Each sections is a closable sub-frame of the main frame. 
Everything is generated by code.

### CreateGUI
##### Arguments: number size, table PluginModel
Returns the *ScreenGui* with every buttons and sections generated from the PluginModel. All connections to events are connected.

### Dialogs
It will contain usual Error, Warning and Information, but also other dialogs to get input from the user (choose from a string list, returns an EnumItem from an EnumType, returns an AnchorPoint from a 3x3 grid). More info soon.

### Utils
#### Create
##### Arguments: string className, dictionary properties
*Create* is a function that returns another function that takes a dictionary of properties and sets these properties to the new object.
Example:
```lua
local folder = Create'Folder'{
  Name = 'Folder'
}
```
#### CreateActionButton
##### Arguments: ActionClass action, number actionButtonSize, number order, PluginModel pluginModel
Creates an action button and connect mouse events.

#### CreateSection
##### Arguments: SectionClass section, Instance parent, PluginModel, pluginModel
Creates a new section and generates the action buttons from that given section.

#### GetAnimation
##### Arguments: Instance object, number duration, dictionary propertyGoals, easingStyle, easingDirection, bool reverse, number repeatCount, number delayTime
Returns an *Tween* created from the *[TweenService](wiki.roblox.com/index.php?title=API:Class/TweenService)*.

#### SetHoverAnimation
##### Arguments: GuiObject button, dictionary hoverProperties
Creates and connects an new animation that interpolate between the original properties of the button to the given properties.

## Plugin
This folder contains the logical aspect of the plugin. It has the PluginModel used to generate the UI and all the possible *actions*.

### Actions
##### Dictionary of the actions
This module returns a dictionary of the possible actions. All the functions triggered by the actions will be called with the PluginModel as the first argument.

### Classes
This folder will contain all the classes used by the PluginModel.
