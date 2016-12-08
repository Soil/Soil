# Soil Coding Guidelines
These coding guidelines are based off the ones from ACE3, with a couple
additions. Have a read through them if you don't know them yet:  
http://ace3mod.com/wiki/development/coding-guidelines.html

## General

### Indentation
Always use 4 space indentation.


### Vertical Spacing
Opening and closing brackets go on the same line as their statement:

```sqf
if (_condition) then {
    ...
} else {
    ...
};
```

Do not overuse blank lines. Blank lines should only seperate related code
blocks.


### Horizontal Spacing
Binary operands and `=` shall always have spaces around them.

```sqf
private _c = sqrt (a ^ 2 + b ^ 2);
```

Horizontal padding to align the same keywords or commands can improve
readability, especially when initializing a bunch of variables at once.

```sqf
private _vehicle   = vehicle player;
private _driver    = driver _vehicle;
private _commander = commander _vehicle;
```


### Naming Conventions
Variables and functions names shall always indicate their meaning and
functionality, avoid meaningless single letter variables. Functions should
always start with a verb.

Variables and functions shall always use camelCase, starting with a lowercase
letter.

SQF components shall use snake_case, using only lower case letters (due to BI's
Linux shenanigans). C++ classes shall use CamelCase, starting with an uppercase
letter.

Filenames for code files should use the same naming convention as their
content. If not applicable (for example `XEH_postInit.sqf`) use snake_case.
Documentation files shall use Title Case.


### Commenting
Complex code should be well documented. Consider writing your code in a
different way if it requires an excessive amount of comments - chances are that
you are overcomplicating things.

Note that commenting trivial code can worsen the readability as well and thus
should be avoided.


### Function Headers
SQF functions shall use the following ACE3 style header:

```sqf
/*
 * Author: Author1, Author2
 * Short description of functionality. 
 *
 * Arguments:
 * 0: Parameter name                <TYPE>
 * 1: Parameter name (default: ...) <TYPE>
 * or
 * None
 *
 * Return Value:
 * Return value description
 * or
 * None
 *
 * Example:
 * [_param] call soil_component_fnc_function
 */
```

The example can be left out for non-API functions. Multiple examples can be
listed below the first one.


## SQF Specific

### Local Variables
Local variables shall always be initialized at their first occurance with the
`private` keyword or the `params` command. The latter is very much recommended
when using more than a single `select` and shall always be used for function
parameter reading.


### Parenthesis
Parenthesis should be used when stacking more than two unary or binary
commands, even when not necessary.

```sqf
private _randomCrewMember = selectRandom (crew vehicle player);
```

Parameters for `if` or `switch` shall always be in parenthesis, a `!` can be in
front for long conditions.

```sqf
if !(_unit in vehicle _player) then {
    ...
};
if (_bool) then {
    ...
};
```


### Macro Usage
Macros shall always be used instead of fully writing the variable or function
name, except for API functions and variables.

Each (non-inline) function's main scope needs to be exited with the `RETURN`
macro.
