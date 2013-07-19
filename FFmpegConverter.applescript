property ffmpeg : "/usr/local/bin/ffmpeg"

on run
	repeat with f in (choose file default location (name of front window of application "Finder") with multiple selections allowed)
		main(f)
	end repeat
end run

on open args
	repeat with f in args
		main(f)
	end repeat
end open

on main(input)
	set input to quoted form of POSIX path of input
	
	copy text item delimiters of AppleScript to save_IFS
	copy space to text item delimiters of AppleScript
	set cmd to {ffmpeg, "-i", input, "-acodec copy", "-vcodec copy", input & ".mp4", ";", "exit"} as string
	copy save_IFS to text item delimiters of AppleScript
	
	tell application "Terminal" to activate (do script cmd)
end main
