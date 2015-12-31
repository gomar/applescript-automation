-- 
on generateItemTextForAttachment(selectedFile)
	set resultText to "> \n"
	set currentFilename to name of selectedFile
	set resultText to resultText & currentFilename
	set resultText to resultText & ""
	return resultText
end generateItemTextForAttachment

-- getting Finder selected files
tell application "Finder"
	activate
	set theSelection to selection
	-- copying the files to the clipboard
	tell application "System Events" to keystroke "c" using command down
end tell

-- pasting the selected files to the frontmost opnened outgoing message
tell application "Mail"
	activate
	tell front outgoing message
		tell application "System Events" to keystroke "v" using command down
	end tell
end tell

delay 0.5

set textToWrite to "Comme convenu, veuillez trouver ci-joint les documents suivants :\n"
repeat with selectedFile in theSelection
	set currentFilename to name of selectedFile
	set textToWrite to textToWrite & generateItemTextForAttachment(selectedFile)
end repeat

set the clipboard to textToWrite