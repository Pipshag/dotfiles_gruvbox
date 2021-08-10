# Personal Dotfiles
Here is a collection of my dotfiles that tries to integrate the Gruvbox theme (dark) as much as possible. There's configuration for Sway, Waybar, Kitty, and Spicetify (Spotify, theme is OnePunch Dark).
Get a good browser theme and GTK theme and you're all set.

### Screenshots

**Waybar**

![Screenshot of waybar](/screenshot_waybar.png?raw=true)
![Screenshot of kitty and gtk theme](/kitty_and_gtk.png?raw=true)
![Screenshot of Spotify with opacity and system background](/spotify_with_opacity.png?raw=true)

## Waybar config
What is waybar?
>Highly customizable Wayland bar for Sway and Wlroots based compositors.
Available in Arch community or AUR, openSUSE, and Alpine Linux

I've configured waybar in accordance to Gruvbox colors in mind as well as trying to take vital information and make it as easy as possible to take in. There is also a script for the custom-module part which simply shows the current cpugovernor (only supports Performance or Schedutil at the moment). Another module just added is for monitoring the GPU (not shown). Both of the scripts are very hacky but do the job for me.
Screenshot follows after list of items in the bar left to right.

### Left
* Clock
* Date
* Input language indicator
* Scratchpad widget, **cycles** contents or **sends** to scratch
* Pacman available updates indicator
* Idle-inhibitor
### Middle
* Workspaces, minimalistic. Configure names in waybar config
#### Right
* CPU Governor indicator, script in **custom_modules** can be extended
* CPU temperature with warning. Opens **htop** in term on click
* CPU max frequency and usage in percent
* DISABLED ~~GPU monitoring with frequency, temperature and utilization percentage. Opens [powerupp](https://github.com/azeam/powerupp) on click. Tooltip shows GPU info and Mesa version (from glxinfo).~~
* Pulseaudio control. Scroll for volume increase/decrease, click for **pavucontrol** or right-click to quickly **mute** microphone.
* DISABLED ~~Bluetooth indicator, opens **blueberry** on click~~
* Network indicator with mouse-over info (Strength, IP, Frequency, Speed etc)
* Tray to keep icons


