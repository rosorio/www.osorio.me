*Battery State displays your FreeBSD laptop battery status in text styleat*

# Usage

The Battery State application can be integrated in any WM application who accepts text style output like wmii, ratpoison and many others. The application was wrote for FreeBSD in plain C and uses the sysctl interface to query the battery state.

# Screenshot

# Download

[battery.c](http://files.bebik.net/code/battery.c):  Download the source code

# License

The code is delivered under [BSD License](https://en.wikipedia.org/wiki/BSD_licenses)

# Implementation details

The information about the battery state are provided by the “hw.acpi.battery.life” sysctl.

Those values are the power remaining in the battery in percent, and the charging state as a numeric value as displayed in the following array.

| Value | State       | Description                      |
|-------|-------------|----------------------------------|
| 1     | Discharging | We are using the battery         |
| 2     | Charging    | We are charging the battery      |
| 4     | Critical    | Something really weird, but what |
| 7     | Not present / max | Another unknown state      |

