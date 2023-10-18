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
      ("M-<F6>", spawn "pulseaudio-ctl mute yes && pacmd set-sink-port 0 analog-output-headphones && pulseaudio-ctl mute no"),
      ("M-<F7>", spawn "pulseaudio-ctl mute yes && pacmd set-sink-port 0 analog-output-speaker && pulseaudio-ctl mute no"),
      ("M-S-p", spawn "passmenu"),
	  ("M-C-1", spawn "bluetoothctl connect E4:90:FD:48:91:0E"),
	  ("M-C-0", spawn "bluetoothctl disconnect E4:90:FD:48:91:0E")
    ]
