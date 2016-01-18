import XMonad
import XMonad
import XMonad.Actions.UpdatePointer
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Util.Run
import XMonad.Util.EZConfig
import System.IO
import System.Taffybar.Hooks.PagerHints (pagerHints)
------------------------------------------------------------------------
myTerminal           = "st"
myFocusFollowsMouse  = False
myClickJustFocuses   = False
myBorderWidth        = 1
myModMask            = mod4Mask
myWorkspaces         = ["α","β","γ","δ","ε","ζ","μ","θ","λ"]
myNormalBorderColor  = "#aaaaaa"
myFocusedBorderColor = "#0000aa"
------------------------------------------------------------------------
myLayout = smartBorders tiled ||| Mirror tiled ||| Full where
  -- default tiling algorithm partitions the screen into two panes
  tiled   = spacing 2 $ Tall nmaster delta ratio
  -- The default number of windows in the master pane
  nmaster = 1
  -- Default proportion of screen occupied by master pane
  ratio   = 1/2
  -- Percent of screen to increment by when resizing panes
  delta   = 5/100
------------------------------------------------------------------------
myManageHook = composeAll
   [ className =? "OakTale"  --> doFloat
   , manageDocks
   ]

main = do
taffy <- spawnPipe "/usr/bin/taffybar"

xmonad $ ewmh $ pagerHints $ defaultConfig {
    manageHook = myManageHook <+> manageHook defaultConfig
  , layoutHook = avoidStruts myLayout
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
