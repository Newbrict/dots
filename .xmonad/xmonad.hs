import XMonad
import XMonad.Actions.UpdatePointer
import XMonad.Layout.Spacing
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Util.EZConfig
import System.IO
------------------------------------------------------------------------
myTerminal           = "urxvt"
myFocusFollowsMouse  = False
myClickJustFocuses   = False
myBorderWidth        = 1
myModMask            = mod4Mask
myWorkspaces         = ["α","β","γ","δ","ε","ζ","μ","θ","λ"]
myNormalBorderColor  = "#aaaaaa"
myFocusedBorderColor = "#0000aa"
------------------------------------------------------------------------
myLayout = tiled ||| Mirror tiled ||| Full where
  -- default tiling algorithm partitions the screen into two panes
  tiled   = spacing 2 $ Tall nmaster delta ratio
  -- The default number of windows in the master pane
  nmaster = 1
  -- Default proportion of screen occupied by master pane
  ratio   = 1/2
  -- Percent of screen to increment by when resizing panes
  delta   = 5/100
------------------------------------------------------------------------
main = do
-- for relaunching, reload trayer
trayer <- spawn "killall trayer; sleep 0.1;trayer --edge bottom --align right --SetDockType true --expand true --transparent true --alpha 0 --tint 0x000000 --widthtype request --heighttype pixel --height 16 --distance -1 &"
xmprocT <- spawnPipe "/usr/bin/xmobar ~/.xmobar/xmobarrcTOP.hs"
xmprocB <- spawnPipe "/usr/bin/xmobar ~/.xmobar/xmobarrcBOT.hs"

xmonad $ defaultConfig {
    manageHook = manageDocks <+> manageHook defaultConfig
  , layoutHook = avoidStruts myLayout
  , logHook    = dynamicLogWithPP xmobarPP {
      ppOutput  = \s -> hPutStrLn xmprocT s -- >> hPutStrLn xmprocB s
    , ppTitle   = xmobarColor "#00ff00" "" . shorten 50
    , ppCurrent = xmobarColor "#ffffff" "#0000aa" .wrap " " " "
    , ppUrgent  = xmobarColor "#ffffff" "#ff0000" .wrap " " " "
    , ppLayout  = const ""
  } >> updatePointer (Relative 0.5 0.5)
  , terminal           = myTerminal
  , focusFollowsMouse  = myFocusFollowsMouse
  , clickJustFocuses   = myClickJustFocuses
  , borderWidth        = myBorderWidth
  , modMask            = myModMask
  , workspaces         = myWorkspaces
  , normalBorderColor  = myNormalBorderColor
  , focusedBorderColor = myFocusedBorderColor
} `additionalKeysP`
  [ ("M-b", sendMessage ToggleStruts)
  , ("<Print>", spawn "sleep 0.2; scrot -s")
  ]

