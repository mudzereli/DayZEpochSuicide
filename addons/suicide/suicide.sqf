private ["_position","_done","_timeLeft","_exitWith","_warning","_display"];

// initialize variables
_exitWith = "nil";
_done     = false;
     = position player;
_timeLeft = DZE_SUICIDE_CANCEL_TIME;
_warning  = "You will commit suicide in %1 seconds. Move to cancel!";

// close the gear display when player starts to commit suicide
disableSerialization;
_display = findDisplay 106;
if(!(isNull _display)) then {
    _display closeDisplay 0;
};

// only do this stuff if we have a suicide timer
if(_timeLeft > 0) then {
    // make sure the player really knows they are about to die
    hint format[_warning,_timeLeft];
    taskHint [format[_warning,_timeLeft], DZE_COLOR_DANGER, "taskNew"];
};

// perform conditional checks while giving the player a chance to cancel
while{!_done} do {
    cutText [format[_warning,_timeLeft], "PLAIN DOWN"];
    if(_timeLeft > 0) then {
        sleep 1;
        _timeLeft = _timeLeft - 1;
    };
    if(position player select 0 != _position select 0 || position player select 1 != _position select 1) exitWith {
        _exitWith = "Suicide Cancelled!";
    };
    if(!(_this in (weapons player))) exitWith {
        _exitWith = "You need the weapon to kill yourself with!";
    };
    if(DZE_SUICIDE_REQUIRE_BULLET && ((player ammo _weapon) == 0)) exitWith {
        _exitWith = "You are out of ammunition!";
    };
    _done = _timeLeft <= 0;
};

if(DZE_SUICIDE_USE_WEAPON) then {
    player selectWeapon _this;
    sleep 3;
};

// if we didn't get an exit reason back, time to die!
if (_exitWith == "nil") then {
    _exitWith = "Goodbye!";
    taskHint[_exitWith, DZE_COLOR_SUCCESS, "taskDone"];
    hint _exitWith;
    cutText[_exitWith,"PLAIN DOWN"];
    player playmove (["ActsPercMstpSnonWpstDnon_suicide1B","ActsPercMstpSnonWpstDnon_suicide2B"] call BIS_fnc_selectRandom);
    sleep 7.5;
    if(DZE_SUICIDE_USE_WEAPON) then {
        player fire _this;
    };
    sleep 1;
    player setDamage 1.5;
} else {
    taskHint[_exitWith, DZE_COLOR_DANGER, "taskFailed"];
    cutText[_exitWith,"PLAIN DOWN"];
};