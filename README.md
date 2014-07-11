#SUICIDE 1.2.2
**credits**: original concept/code by Grafzahl/overhaul by mudzereli

Out of the box, this script adds a right click action to most pistols in the game that allows you to commit suicide.

It's configurable, triggered from right click instead of scroll menu, and it plays randomly one of 2 animations

For some samples of what it does, check out this [gallery on imgur](http://imgur.com/a/Pt0lM "imgur gallery"):

-----

##Features:
- fully configurable
- right click so no accidental suicides
- cancel suicide by moving/etc
- better visual/audio cues

-----

##Installation
 1. [download the files](https://github.com/mudzereli/DayZEpochSuicide/archive/master.zip "download files")
 2. extract the **addons** and **overwrites** folder from the downloaded zip file into your **mission file root**
 3. add this line to the end of your mission file init.sqf.
   * ```call compile preprocessFileLineNumbers "addons\suicide\init.sqf";```
 4. edit **addons\suicide\config.sqf** to configure some options such as what guns it works with etc.

-----

##Change Log

version|change
-------|-------
1.2.2  | better click actions build conflict detection
1.2.1  | update for compatibility w/ new click actions build
1.2.0  | now you can suicide without having the handgun equipped. option to enable or disable actual weapon use (selection / firing)
1.1.0  | better message handling when cancel time is 0 (instant suicide) / change default cancel time to 0
1.0.0  | release 