private ["_position","_done","_timeLeft","_exitWith","_warning","_weapon","_display"];

// initialize variables
_exitWith = "nil";
_weapon = (currentWeapon player);

// close the gear display when player starts to commit suicide
disableSerialization;
_display = findDisplay 106;
if(!(isNull _display)) then {
    _display closeDisplay 0;
};

// only do this stuff if we have a suicide timer
if(DZE_SUICIDE_CANCEL_TIME > 0) then {
    // initialize these variables
    _done     = false;
    _position = position player;
    _timeLeft = DZE_SUICIDE_CANCEL_TIME;
    _warning  = "You will commit suicide in %1 seconds. Move to cancel!";

    // make sure the player really knows they are about to die
    hint format[_warning,_timeLeft];
    taskHint [format[_warning,_timeLeft], DZE_COLOR_DANGER, "taskNew"];

    // perform conditional checks while giving the player a chance to cancel
    while{!_done} do {
        cutText [format[_warning,_timeLeft], "PLAIN DOWN"];
        sleep 1;
        _timeLeft = _timeLeft - 1;
        _weapon   = (currentWeapon player);
        if(position player select 0 != _position select 0 || position player select 1 != _position select 1) exitWith {
            _exitWith = "Suicide Cancelled!";
        };
        if((isNil "_weapon") || {!(_weapon in DZE_SUICIDE_WEAPONS)}) exitWith {
            _exitWith = "No valid guns to kill yourself with!";
        };
        if(DZE_SUICIDE_REQUIRE_BULLET && ((player ammo _weapon) == 0)) exitWith {
            _exitWith = "You are out of ammunition!";
        };
        _done = _timeLeft <= 0;
    };
};

// if we didn't get an exit reason back, time to die!
if (_exitWith == "nil") then {
    _exitWith = "Goodbye!";
    taskHint[_exitWith, DZE_COLOR_SUCCESS, "taskDone"];
    hint _exitWith;
    cutText[_exitWith,"PLAIN DOWN"];
    player playmove (["ActsPercMstpSnonWpstDnon_suicide1B","ActsPercMstpSnonWpstDnon_suicide2B"] call BIS_fnc_selectRandom);
    sleep 7.5;
    player fire _weapon;
    sleep 1;
    player setDamage 1.5;
} else {
    taskHint[_exitWith, DZE_COLOR_DANGER, "taskFailed"];
    cutText[_exitWith,"PLAIN DOWN"];
};