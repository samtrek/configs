import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe, safeSpawn, runProcessWithInput)
import XMonad.Util.EZConfig(additionalKeysP)
import System.IO
import XMonad.Hooks.SetWMName
import XMonad.Layout.Fullscreen
import XMonad.Layout.Tabbed
import XMonad.Util.SpawnOnce
import XMonad.Util.NamedScratchpad
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), (??))
import XMonad.Hooks.ManageHelpers (isFullscreen, doFullFloat, doCenterFloat)

myTerminal = "kitty"
myBorderWidth = 1
myModMask = mod4Mask
myWorkspaces = ["1:web","2:office","3:read","4:refrence","5:term"] ++ map show [6..9]
myLauncher = "rofi -show"

myManageHook = composeAll
        [ className =? "Gimp"    --> doFloat
        , className =? "pcmanfm-qt" --> doCenterFloat
        , title =? "Mozilla Firefox" --> doShift "1:web"
        , resource =? "Places" --> doCenterFloat
        , title =? "LibreOffice" --> doShift "2:office"
        , title =? "Quick Format Citation" --> doCenterFloat 
        , className =? "okular"      --> doShift "3:read"
        , title     =? "My Library - Zotero"      --> doShift "4:refrence"
        , title     =? "Extension: (Zotero Connector) - Zotero Item Selector — Mozilla Firefox"      --> doCenterFloat
        , className =? "Zotero"      --> doCenterFloat
        , className =? "kitty"      --> doShift "5:term"
        , isFullscreen --> doFullFloat
        , className =? "confirm"  --> doFloat
        , className =? "splash"         --> doFloat
        , className =? "notification"   --> doFloat
        , className =? "toolbar"        --> doFloat
        , className =? "mpv"            --> doFloat
        , className =? "download"       --> doFloat
        , className =? "confirm"        --> doFloat
        , className =? "stalonetray"    --> doIgnore
        ]

tabConfig = defaultTheme {
    activeBorderColor = "#7C7C7C",
    activeTextColor = "#CEFFAC",
    activeColor = "#000000",
    inactiveBorderColor = "#7C7C7C",
    inactiveTextColor = "#EEEEEE",
    inactiveColor = "#000000"
}

myKeys :: [(String, X ())]
myKeys =
        [
        ("M-p", spawn "rofi -show")
        ]

myStartupHook ::X()
myStartupHook = do
        spawn "killall trayer"
        spawn ("sleep 2 && trayer --edge top --align right --widthtype request --padding 6 --SetDockType true --SetPartialStrut true --expand true --monitor 1 --height 16")
        

        spawnOnce "picom"
        spawnOnce "nm-applet"
        setWMName "LG3D"

main = do
        xmproc0 <- spawnPipe "xmobar -x 0 $HOME/.xmobarrc"
        xmproc1 <- spawnPipe "xmobar -x 1 $HOME/.xmobarrc"
        xmonad $ docks defaultConfig {
          manageHook = myManageHook <+> manageHook defaultConfig -- make sure the config is above 
        , layoutHook = avoidStruts $ layoutHook defaultConfig
        , logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = \x -> hPutStrLn xmproc0 x
                                        >> hPutStrLn xmproc1 x
                        , ppTitle = xmobarColor "green" "" . shorten 50

                        }
        , modMask = myModMask
        , terminal = myTerminal
        , borderWidth = myBorderWidth
        , workspaces = myWorkspaces
        , startupHook = myStartupHook
        }`additionalKeysP` myKeys
