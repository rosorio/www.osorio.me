* The libibbudy is a loadable library to control the i-buddy device for many unixes.

![The i-Budy device](img/ibuddy.jpg)

# The libibbudy API
* The [libibbudy]({ROOT}/projects/dev/libibbudy/api.html) API description

# Utilities / Demo applications

The libibuddy is released with a sample CLI tool called ibuddycmd. With this tool you can easily control the i-Buddy device from the command line.

## ibuddycmd usage

With the ibuddycmd tool, you can drive the i-buddy from the command line. By design, the command can only handle one i-buddy device, the first found in the devices list.

`ibuddycmd [id] <command> [args]`

Th *id* is the iBuddy number in the usb scan list. First iBuddy ID is O. If not provided,
this argument will be 0 by default.

The command can be :

* reset : without args to reset the i-buddy state
* flip : makes a body flip (right/left) 
Two optional args can be used to set the number of flips and the delay between each flip.
* flap : makes a wings flap
Two optional args can be used to set the number of flips and the delay between each flip.
* headcolor : changes the head color
One optional argument can be used to specify the color as a combination of the three colors, 'r' for red, 'g' for green, 'b' for the blue.

# flip & flap arguments

* The first arg is the number of times the action is repeated
* the second arg is the delay in milliseconds between each action

# Sample usage

* change the head color to light blue (blue + green)
ibuddycmd headcolor bg
* flap wings 5 times with a delay of 10 seconds
ibuddycmd flap 5 5000
* flip body 7 times
ibuddycmd 7

![The i-Budy device](img/ibuddy.gif)

# Download

The latest version is the v0.0.2, see [GitHub](https://github.com/rosorio/libibuddy).

v0.0.1 : [changelog](http://files.bebik.net/libibuddy/changelog.txt) for details.

| Version | Sources | Checksum |
|---------|---------|----------|
| v0.0.1  | [libibuddy-0.0.1.tgz](http://files.bebik.net/libibuddy/libibuddy-0.0.1.tgz) | [libibuddy-0.0.1.sum](http://files.bebik.net/libibuddy/libibuddy-0.0.1.sum) |
| v0.0.2  | GITHUB | GITHUB |


# License

The code is delivered under [BSD License](https://en.wikipedia.org/wiki/BSD_licenses)
