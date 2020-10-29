#!/bin/zsh

##############################################################################
# Useful Android Functions
# ----------------------------------------------------
# For everyday use - hand written and artisinal (potentially even organic!!!) 
# Just source this file from your ~/.zshrc and you're good to go!
##############################################################################


# Prints the id of an emulator if one is running
function emulator_id {
  while read sn device; do
    echo $sn
    return
  done < <(adb devices | sed '1d' | grep "emulator")
}

# Enables/disables Talkback on the emulator
function talkback {
  ID=$(emulator_id)
  if [[ $1 = "on" ]]; then
    adb -s $ID shell settings put secure enabled_accessibility_services com.google.android.marvin.talkback/com.google.android.marvin.talkback.TalkBackService
  elif [[ $1 = "off" ]]; then
    adb -s $ID shell settings put secure enabled_accessibility_services com.android.talkback/com.google.android.marvin.talkback.TalkBackService
  else
    echo "No dice!"
    echo "Hint: Pass either 'on' or 'off' as arguments"
  fi
}

# Checks for a non-emulator device and opens it with scrcpy
function run_scrcpy {
  while read sn device; do
    [ ! -z "$sn" ] && scrcpy -s $sn
  done < <(adb devices | sed '1d' | grep -v "emulator")
}