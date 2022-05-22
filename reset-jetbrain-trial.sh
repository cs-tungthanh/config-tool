#!/bin/bash

for product in IntelliJIdea WebStorm DataGrip PhpStorm CLion PyCharm GoLand RubyMine Rider; do
  #force close product
  ps aux | grep -i MacOs/$product | cut -d " " -f 5 | xargs kill -9

  #removing evaluation key
  rm -rf ~/Library/Preferences/$product*/eval
  rm -rf ~/Library/Application\ Support/JetBrains/$product*/eval

  #removing all evlsprt properties in options.xml...
  sed -i '' '/evlsprt/d' ~/Library/Preferences/$product*/options/other.xml
  sed -i '' '/evlsprt/d' ~/Library/Application\ Support/JetBrains/$product*/options/other.xml

  echo
done

#removing additional plist files...
rm -f ~/Library/Preferences/com.apple.java.util.prefs.plist
rm -f ~/Library/Preferences/com.jetbrains.*.plist
rm -f ~/Library/Preferences/jetbrains.*.*.plist

#restarting cfprefsd
killall cfprefsd

echo
echo "Done!"
