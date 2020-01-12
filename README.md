# Grayles - Starbound Plus Modpack

This repository is intended to provide a way for multiple developers to collaborate on modpack fixes intended for the Starbound Plus server at grayles.net.

Grayles custom modules are located in source/ as Git submodules.
Modules that require customization will also be created as submodules in source/.  A shell script is provided to automate unpacking third-party modules that do not already have Git repositories.  Place the source pak file in source-binaries and run unpack-mods.sh, which will unzip and either freshen the submodule or create a folder with the extracted contents for use in starting a new submodule.

The current list of modules is:
