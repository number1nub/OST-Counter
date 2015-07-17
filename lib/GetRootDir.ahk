GetRootDir() {
	if (%0% > 0) {
		dir = %1%
		return RegExReplace(dir, "\\$")
	}
	Gui +OwnDialogs
	FileSelectFolder, dir, *Q:\TestData\Tools, 4, Select root folder to analyze
	if (ErrorLevel || !dir)
		ExitApp
	return (RegExReplace(dir, "\\$") "\RSS*")
}