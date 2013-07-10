set aRes to (do shell script "defaults read com.apple.Finder AppleShowAllFiles") as integer

if aRes is 0 then
    set aRes to "TRUE"
else if aRes is 1 then
    set aRes to "FALSE"
end if

do shell script "defaults write com.apple.finder AppleShowAllFiles -bool" & space & aRes

tell application "Finder" to quit
delay 1
tell application "Finder" to activate
