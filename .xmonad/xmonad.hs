--
-- streadway - xmonad.hs
--

import XMonad

import Data.List

import XMonad.Layout.NoBorders
import XMonad.Util.EZConfig
import XMonad.Hooks.ManageDocks

import XMonad.Actions.SpawnOn
import XMonad.Util.Run

-- {{ http://haskell.org/haskellwiki/Xmonad/Config_archive/John_Goerzen%27s_Configuration#Configuring_xmonad_to_use_xmobar
import XMonad.Actions.SinkAll
-- }}

-- {{ http://hackage.haskell.org/packages/archive/xmonad-contrib/0.8/doc/html/XMonad-Hooks-UrgencyHook.html#8
import XMonad.Hooks.UrgencyHook
-- }}

-- {{ Prompt
-- http://braincrater.wordpress.com/2008/11/29/pimp-your-xmonad-3-prompt/
import XMonad.Prompt
import XMonad.Prompt.RunOrRaise
-- import XMonad.Prompt.Shell
import XMonad.Prompt.Window
import XMonad.Prompt.XMonad
import XMonad.Prompt.AppLauncher
-- Prompt }}

myXPConfig = defaultXPConfig {
               font = "xft:Menlo:pixelsize=10"
             , position = Top
             }

-- If q contains x
contain q x = fmap (isInfixOf x) q

myManageHook = composeAll . concat $
    [ [ title `contain` c --> doFloat | c <- myFloats ]
    ]
    where myFloats = ["Option", "option", "Preference", "preference"]


main = do
  sp <- mkSpawner
  xmonad $ withUrgencyHookC
             dzenUrgencyHook { duration = (seconds 5.0), args = ["-xs", "1"] }
             urgencyConfig { suppressWhen = Focused, remindWhen = (Every (minutes 1.0)) }
         $ defaultConfig
    {
    --  modMask = mod4Mask
      terminal = "urxvt -ls -cd $HOME"
    , normalBorderColor  = "#cccccc"
    , focusedBorderColor = "#cd8b00"
    , manageHook = manageSpawn sp <+> manageDocks <+> manageHook defaultConfig <+> myManageHook
    , layoutHook = avoidStruts $ smartBorders $ layoutHook defaultConfig
    }
    `additionalKeysP`
    [ -- dmenu replacement
      ("M-p", shellPromptHere sp myXPConfig)
    , ("M-g", windowPromptGoto myXPConfig)
    , ("M-e", launchApp myXPConfig "vim")
    , ("M-S-k", kill)
    , ("M-d", sinkAll)
    , ("M-.", focusUrgent)
    , ("M-,", clearUrgents)
    ]

