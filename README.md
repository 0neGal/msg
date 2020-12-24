## What is msg?

`msg` is a simple script I use to produce nice a consistent messages, prefixed properly, most of the looks are inspired from [pacman](https://wiki.archlinux.org/index.php/Pacman) and [yay](https://github.com/Jguer/yay)

Here's an example of how the error messages can look:

```
 Status message!
> Other message!
:: Action message!
Error: Error message!
Success: Success message!
Warning: Warning message!
 -> Notice message!
```

All of them having customizable colors and prefixes, meaning if you don't want the error message to say have "Error:" as it's prefix you can change it (At least you'll be able to soon...)

The main objective of this was instead of creating functions inside my scripts for making good looking output I made this script to unify it.

Outside of that you can also color the actual message with escape sequences. Meaning if you want part of the message red you can add `\e[31m` somewhere and to stop the read add `\e[0m` so `msg "An error occured in \e[31mscript\e[0m fix it" error` would produce and error message where the word "script" is in red. For more info on this read up on terminal codes, [here's](https://wiki.bash-hackers.org/scripting/terminalcodes) a good place to get a good grip on how it works.
