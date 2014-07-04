##CONTENTS

###SUICIDE 1.1.0

#####credits: original concept/code by Grafzahl/overhaul by mudzereli


Out of the box, it adds a right click action to most pistols in the game that allows you to commit suicide.

It's configurable, cancellable, triggered outside of the scroll menu, and it plays randomly one of 2 animations :)

For some samples of what it can do, check out this gallery on imgur:

http://imgur.com/a/Pt0lM

-----

##Installation
 1. extract the **addons** and **overwrites** folder from the downloaded zip file into your mission file root
 2. add this line to the end of your mission file init.sqf.
   * ```call compile preprocessFileLineNumbers "addons\suicide\init.sqf";```
 3. edit "addons\suicide\config.sqf" to configure some options such as what guns it works with etc.

 -----

 **warning**: if you also use my deployable bike script and have this line in your mission file's init.sqf:

 ```call compile preprocessFileLineNumbers "overwrites\click_actions\init.sqf";```

 then you need to ![update the files](https://github.com/mudzereli/DayZEpochDeployableBike/archive/master.zip) for that addon and remove the above line from your config.

-----

##Change Log
* 1.1.0 - better message handling when cancel time is 0 (instant suicide)
* 1.0.0 - release