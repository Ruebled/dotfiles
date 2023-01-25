{-# OPTIONS_GHC -Wno-deprecations #-}
import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops

main :: IO ()
main = xmonad $ def
    {
        terminal = "alacritty",
        startupHook = ewmhDesktopsStartup >> setWMName "LG3D"
    }
    `additionalKeysP`
    [ 
      ("<Print>", spawn "flameshot gui"),
      ("<XF86MonBrightnessUp>", spawn "backlight_control +1"),
      ("<XF86MonBrightnessDown>", spawn "backlight_control -1"),
      ("<XF86AudioLowerVolume>", spawn "pulseaudio-ctl down"),
      ("<XF86AudioRaiseVolume>", spawn "pulseaudio-ctl up 1"),
      ("<XF86AudioMute>", spawn "pulseaudio-ctl mute"),
      ("M-S-q", spawn "systemctl suspend && slock")
    ]
