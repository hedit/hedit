Multi Theft Auto: Ingame Handling Editor
=====

Any trouble with the handling editor? [Be sure to post it here!](http://forum.mtasa.com/viewtopic.php?f=108&t=30494 "Forum topic") Problems with installing? Feel free to ask there too! Found a bug, tell us [here!](https://github.com/hedit/hedit/issues]

Download
-------
Get the latest release from the [releases page.](https://github.com/hedit/hedit/releases). It's as simple as pressing "download zip"!

Installation
------------
First of all, you need a MTA server.

Once you downloaded the ZIP package, open it. Here you will see a folder called "hedit". Don't change the name from "hedit" to anything else! You have to copy this folder to your Multi Theft Auto SERVER resources folder. This folder is usually located at this path:
C:\Program Files\MTA San Andreas 1.3\server\mods\deathmatch\resources on your computer.
If you're using a 64-bit version of Windows, you have to search your server in "Program Files (x86)" instead.

Now go back to the "deathmatch" folder. Her you will find a file called "acl.xml". Place the following line into the admin group and save it:
<object name="resource.hedit"></object>

Once you placed the folder there, start your server and type "start hedit" into the console. Mkae sure you have administrator rights or the appropriate rights to start a resource! Now you've successfully installed and started the editor!
