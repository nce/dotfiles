-- .xmonad/xmonad.hs
-- Author: Ulli Goschler <ulligoschler@gmail.com>
-- Copyright: public domain
-- Created: Mon, 11.05.2009 - 14:39:04
-- Last modified: Fri, 20.01.2012 - 23:14:25
-- XMonad Version 0.10
-- cyan layout


-- Colors:
--      cyan:   #0087AF
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

import XMonad.Layout.StackTile
import XMonad.Layout.Mosaic
import XMonad.Layout.MosaicAlt
import qualified Data.Map as M

myManageHook = composeAll
    -- xprop | grep CLASS
    [ className =? "Thunderbird" --> doShift "3:mail"
    , className =? "Chromium" --> doShift "2:www"
    , className =? "Opera" --> doShift "2:www"
    , className =? "Skype" --> doShift "6:misc"
    , className =? "Mozilla Firefox" --> doShift "2:www"
    , className =? "MPlayer" --> doShift "8:video"
    , className =? "Picard" --> doShift "6:misc"
    , className =? "Eclipse" --> doShift "4:code"
	, isFullscreen --> doFullFloat
	]

myLayout = mosaic 2 [3,2] ||| Full ||| MosaicAlt M.empty

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
            { manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
            , workspaces = ["1:cli", "2:www", "3:mail", "4:code", "5:code", "6:misc", "7:dev", "8:video", "9:gimp"]
            --, layoutHook = avoidStruts $ smartBorders $ reflectHoriz $ myLayout
			, layoutHook = avoidStruts $ smartBorders $ spacing 2 $ myLayout
            , startupHook =  do
						setWMName "LG3D"
						spawn "urxvtc"
						spawn "urxvtc"
						spawn "urxvtc"
						spawn "urxvtc"
						spawn "feh --bg-fill /home/ull/.xmonad/wp/haskarch.png"
						spawn "unclutter -idle 2 -jitter 20"
						spawn "/home/ull/scripts/xflux -l 49,27 -g 11,5 -k 4300 >/dev/null 2>&1 &"
						spawn "chromium"
						spawn "thunderbird"

            , normalBorderColor = "#cccccc"
            , focusedBorderColor = "#0087AF"
            , borderWidth = 1
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
			, terminal = "urxvtc"
            } `additionalKeysP`
                -- runOrRaise
                [ ("M-x f", runOrRaise "firefox" $ className =? "Mozilla Firefox")
                , ("M-x t", unsafeSpawn "thunderbird")
                -- unsafeSpawn
                , ("M-x o", unsafeSpawn "opera")
                , ("M-`",   unsafeSpawn "exe=`dmenu_path | dmenu -fn 'xft:terminus:pixelsize=14' -nb '#000000' -nf '#e7e7e7' -sb '#45519a' -sf '#ffffff'` && eval $exe")
                , ("M-x l", unsafeSpawn "xlock -fg gray -bg black -mode random -font terminus-font -planfont terminus -messagefont terminus" )
                , ("M-x e", unsafeSpawn "eclipse")
				, ("M-x c", unsafeSpawn "aoss chromium")
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
                    -- XF86Tools
                    --,((0, 0x1008FF12), spawn "urxvt -e mocp &")
					-- pause
                    --((0, 0x1008FF12), spawn "mocp -G")
                ]
