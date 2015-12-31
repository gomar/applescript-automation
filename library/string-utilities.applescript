-- function to split text with the given delimiter
-- and return an array of the different parts of the splitted text
-- copied from http://erikslab.com/2007/08/31/applescript-how-to-split-a-string/
on strSplit(theString, theDelimiter)
	-- save delimiters to restore old settings
	set oldDelimiters to AppleScript's text item delimiters
	-- set delimiters to delimiter to be used
	set AppleScript's text item delimiters to theDelimiter
	-- create the array
	set theArray to every text item of theString
	-- restore the old setting
	set AppleScript's text item delimiters to oldDelimiters
	-- return the result
	return theArray
end strSplit
