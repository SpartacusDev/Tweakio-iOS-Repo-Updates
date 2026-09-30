# Tweakio iOS Repo Updates
Adds the iOS Repo Updates API to Tweakio

## How does it work
This library gets installed to `/Library/TweakioPlugins` on rootful, `/var/jb/Library/TweakioPlugins` on rootless.

The library works by creating a new class that follows the structure of the `TWBaseApi` class that is defined in the Tweakio code, and changing the superclass to `TWBaseApi` during runtime.

## Jailbreaks
Built from a single source tree for both package layouts:

| Jailbreak | Layout | Build |
| --- | --- | --- |
| Dopamine, palera1n, roothide (iOS 15/16) | rootless, `/var/jb` | `make package ROOTLESS=1 FINALPACKAGE=1` |
| unc0ver, checkra1n, Taurine (iOS 12-14) | rootful, `/` | `make package FINALPACKAGE=1` |

The plugin is only meaningful alongside Tweakio itself, so it needs whatever
Tweakio needs: `mobilesubstrate`, which ElleKit provides on Dopamine. Tweakio
finds the plugin through `ROOT_PATH_NS(@"/Library/TweakioPlugins/")`, so it
installs to the right place on every layout without any extra code.

Prebuilt `.deb`s for both layouts are produced by the
[Build workflow](.github/workflows/build.yml) and attached to each workflow run.

## Building
Requires [Theos](https://github.com/theos/theos) cloned **recursively** – `substrate.h`,
`libroot` and the substrate stub live in submodules:

```sh
git clone --recursive https://github.com/theos/theos.git ~/theos
export THEOS=~/theos
make package ROOTLESS=1 FINALPACKAGE=1   # or: make package FINALPACKAGE=1
```

# Contributing
Feel free to contribute by making a pull request

# Found an issue?
Please either file an issue here in the GitHub repo (I may not see it fast, which is why I suggest the second method more, which is:) or tell me the issue in the [Discord server](https://discord.gg/mZZhnRDGeg)

# Credits
* Thanks to everyone who has made/maintained [iOS Repo Updates](https://www.ios-repo-updates.com)
* Thanks to [relisiuol](https://github.com/relisiuol) for making the original PR with iOS Repo Updates support for Tweakio
* Thanks to my trusty beta testers
