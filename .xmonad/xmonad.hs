-- .xmonad/xmonad.hs
-- Author: Ulli Goschler <ulligoschler@gmail.com>
-- Copyright: public domain
-- Created: Mon, 11.05.2009 - 14:39:04
-- Last modified: Tue, 21.06.2016 - 09:29:08
-- XMonad Version 0.10
-- cyan layout


-- Colors:
--      cyan:   #FFFF00
--      red:    #FF0000
--      green:  #00FF00
--      yellow: #FFFF00
-- xmobarcolors:
--      cyan:   #2396BF [title]
--              "#e7e7e7" "#2396BF" [current]
--      green:  #00FF00
--              "#e7e7e7" "#009000"


import XMonad
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import System.IO
import XMonad.Util.Run
import XMonad.Actions.WindowGo
import XMonad.Layout.NoBorders
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.ManageHelpers
import XMonad.Actions.CycleRecentWS
import XMonad.Actions.CycleWS
import XMonad.Actions.GridSelect
import XMonad.Layout.Spacing
import XMonad.Layout.Reflect
import XMonad.Layout.ResizeScreen
import XMonad.Actions.SpawnOn

import XMonad.Layout.StackTile
import XMonad.Layout.Column
import XMonad.Layout.Mosaic
import XMonad.Layout.MosaicAlt
import qualified Data.Map as M

myManageHook = composeAll
    -- xprop | grep CLASS
    [ className =? "Icedove" --> doShift "9:mail"
    , className =? "chromium-browser" --> doShift "2:www"
    , className =? "Mozilla Firefox" --> doShift "2:www"
    , className =? "libreoffice-writer" --> doShift "8:doc"
    , isFullscreen --> doFullFloat
    ]

myLayout = Column 1.6 ||| mosaic 2 [3,2] ||| Full ||| MosaicAlt M.empty

gsconfigGreen colorizer = (buildDefaultGSConfig colorizer) { gs_cellheight = 50, gs_cellwidth = 120 }
-- | A green monochrome colorizer based on window class
greenColorizer = colorRangeFromClassName
                      black            -- lowest inactive bg
                      (0x70,0xFF,0x70) -- highest inactive bg
                      black            -- active bg
                      white            -- inactive fg
                      white            -- active fg
   where black = minBound
         white = maxBound

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ withUrgencyHook NoUrgencyHook defaultConfig
            { manageHook = manageSpawn <+> manageDocks <+> myManageHook <+> manageHook defaultConfig
            , workspaces = ["1:cli", "2:www", "3:vision", "4:p.hiera", "5:p.control", "6:misc", "7:misc", "8:doc", "9:mail"]
            --, layoutHook = avoidStruts $ smartBorders $ reflectHoriz $ myLayout
            , layoutHook = avoidStruts $ smartBorders $ spacing 2 $ myLayout
            , startupHook =  do
                        setWMName "LG3D"
                        spawn "urxvt -e zsh -c 'zsh ~/.xinitrc 2>/dev/null 1>&2 && zsh'"
--                      spawn "urxvt -e /bin/zsh"
--                      spawn "urxvt -e /bin/zsh"
--                      spawn "urxvt -e /bin/zsh"
                        spawn "feh --bg-fill .xmonad/wp/haskarch.png"
                        spawn "chromium"
                        spawnOn "9:mail" "icedove"
--                      spawnOn "3:vision" "urxvt -e zsh -is eval 'vim p.vision'"
--                      spawnOn "3:vision" "urxvt -e zsh -is eval 'cd p.vision'"
--                      spawnOn "4:p.hiera" "urxvt -e zsh"
--                      spawnOn "4:p.hiera" "urxvt -e zsh"
--                      spawnOn "5:p.control" "urxvt -e zsh -is eval 'vim p.control'"
--                      spawnOn "5:p.control" "urxvt -e zsh -is eval 'cd p.control'"

            , normalBorderColor = "#cccccc"
            , focusedBorderColor = "#3498DB"
            , borderWidth = 2
            , logHook = dynamicLogWithPP $ xmobarPP
                                    { ppOutput = hPutStrLn xmproc
                                      , ppTitle  = xmobarColor "#2396BF" "" . shorten 64,
                                        ppLayout = (>> ""),
                                        ppCurrent = xmobarColor "#e7e7e7" "#2396BF" . wrap " " " ",
                                        ppVisible = wrap "" "",
                                        ppSep = xmobarColor "#ffffff" "" " :: "
                                        , ppUrgent = xmobarColor "yellow" "red" . xmobarStrip
                                    }

            , modMask = mod4Mask     -- Rebind Mod to the Windows key
            --, terminal = "urxvt -tr +sb -bg black -tint black -sh 20 -fn 'xft:terminus:pixelsize=14'"
            , terminal = "urxvt -e /bin/zsh"
            --, terminal = "urxvt -e /bin/zsh -c '~/bin/base16-flat.dark.sh'"
            } `additionalKeysP`
                -- runOrRaise
                [ ("M-x t", unsafeSpawn "icedove")
                -- unsafeSpawn
                , ("M-`",   unsafeSpawn "exe=`dmenu_path | dmenu -fn 'xft:terminus:pixelsize=14' -nb '#000000' -nf '#e7e7e7' -sb '#45519a' -sf '#ffffff'` && eval $exe")
                --, ("M-x l", unsafeSpawn "xlock -fg gray -bg black -mode random -font terminus-font -planfont terminus -messagefont terminus" )
                , ("M-x l", unsafeSpawn "xscreensaver-command -lock" )
                , ("M-x c", unsafeSpawn "chromium")
                , ("M-<Esc>", focusUrgent)
                -- Grid Select
                --, ("M-g", goToSelected defaultGSConfig)
                , ("M-g", goToSelected $ gsconfigGreen greenColorizer)
                -- Cycle through recent Workspaces with [Alt] + [Tab]
                , ("M1-<Tab>", cycleRecentWS [xK_Alt_L] xK_Tab xK_grave)
                , ("M-a", sendMessage Taller)
                , ("M-z", sendMessage Wider)
                , ("M-r", sendMessage Reset)
               ]
            `additionalKeys`
                -- xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keycode /s/^.*keycode \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p'
                -- /usr/include/X11/XF86keysym.h
                [
                    -- XF86AudioPlay
                     ((0,0x1008FF14), spawn "mocp -G")
                    -- XF86AudioNext / Prev
                    , ((0,0x1008FF17), spawn "mocp -f")
                    , ((0,0x1008FF16), spawn "mocp -r")
                    -- XF86AudioStop
                    , ((0,0x1008FF15), spawn "mocp -s")
                    --, ((0,0x1008ff11), lowerVolume 4 >> return ())
                    --, ((0,0x1008ff13), raiseVolume 4 >> return ())
                    -- XF86Tools
                    --,((0, 0x1008FF12), spawn "urxvt -e mocp &")
                    -- pause
                    --((0, 0x1008FF12), spawn "mocp -G")
                ]
