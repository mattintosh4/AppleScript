property ffmpeg : "/usr/local/bin/ffmpeg"

tell application "Finder" to set selections to selection as alias list
repeat with f in selections
	if folder of (info for f) is not true then
		set f to quoted form of POSIX path of f
		main({"-i", f, "-acodec copy", "-vcodec copy", f & ".mp4", ";", "exit"})
	end if
end repeat

on main(args)
	copy text item delimiters of AppleScript to save_IFS
	copy space to text item delimiters of AppleScript
	set args to args as string
	copy save_IFS to text item delimiters of AppleScript
	tell application "Terminal" to activate (do script ffmpeg & space & args)
end main
