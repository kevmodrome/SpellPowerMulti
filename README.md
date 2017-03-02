## spellPowerMulti

This addon displays a box with information about buffs/debuffs that affects the current damage multiplier. For example CoS gives a 1.1 multiplier. Currently only works for warlocks. Will be updating with support for Frost and Fire Mages as well as Shadow Priests. The idea is to use this in order to more easily know when to activate trinkets.

The current version checks the following debuffs on target:
* Curse of Shadows (CoS)
* Shadow Bolt Vulnerability (SB Crit talent)
* Nightfall weapon proc
* Shadow Weaving (Shadow Priest debuff)

The text will turn green when a debuff is active on the target. In the case of Shadow Weaving the text will be yellow if there are 2-4 stacks and green when there are 5 stacks.

## Screenshot

![Image showing the addon in action](http://i.imgur.com/RUxVkM4.jpg)

## Installation

Clone the repository and extract to Addons folder. Remove "-master" from folder name.

To change settings edit the SpellPowerMulti.lua file.

## Bugs and other stuff

In the future the window will auto-hide when not in combat. Not yet implemented.
