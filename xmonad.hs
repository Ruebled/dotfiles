{-# OPTIONS_GHC -Wno-deprecations #-}
import XMonad
import XMonad.Core

import XMonad.Util.EZConfig
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Util.Ungrab

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops

import qualified XMonad.StackSet as W
main :: IO ()
main=do
   xmonad $ def
    {
        terminal = "alacritty"
        ,startupHook = ewmhDesktopsStartup >> setWMName "LG3D"
    } `additionalKeysP` (myAdditionalKeys)

myAdditionalKeys =
    [
      ("<Print>", spawn "flameshot gui"),
      ("<XF86MonBrightnessUp>", spawn "backlight_control +5"),
      ("<XF86MonBrightnessDown>", spawn "backlight_control -5"),
      ("<XF86AudioLowerVolume>", spawn "pulseaudio-ctl down"),
      ("<XF86AudioRaiseVolume>", spawn "pulseaudio-ctl up"),
      ("<XF86AudioMute>", spawn "pulseaudio-ctl mute"),
      ("M-S-q", spawn "systemctl suspend && slock"),
      ("M-<F6>", spawn "pacmd set-sink-port 0 analog-output-headphones"),
      ("M-<F7>", spawn "pacmd set-sink-port 0 analog-output-speaker")
    ]
