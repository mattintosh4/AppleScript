tell application "Finder" to set selections to selection as alias list
repeat with x in selections
	if folder of (info for x) ≠ true then
		do shell script "ln" & space & quoted form of POSIX path of x & space & "~/"
	end if
end repeat
do shell script "afplay /System/Library/Sounds/Hero.aiff"
