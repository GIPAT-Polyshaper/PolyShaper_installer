function Component()
{
    // default constructor
}

function askUserInkscapePath()
{
	var result = QMessageBox.information("plugin.askinkscapepath", "Inkscape not found",
		"Could not find Inkscape. Specify inkscape installation path to proceed with inkscape plugin installation",
		QMessageBox.Ok | QMessageBox.Cancel, QMessageBox.ok);

	if (result == QMessageBox.Ok) {
		var dir = QFileDialog.getExistingDirectory("Inkscape installation path", "");
		return (dir == "") ? null : dir
	} else {
		return null;
	}
}

function checkPathContainsInkscape(path)
{
	// We simply check the path contains a file the plugin needs, i.e. share\extensions\inkex.py
	return installer.fileExists(path + "\\share\\extensions\\inkex.py")
}

Component.prototype.createOperations = function()
{
	component.createOperations();

	var inkscapeDir = null;
	// First check some possible paths for inkscape
	var appX64 = installer.value("ApplicationsDirX64") + "\\Inkscape"
	var appX86 = installer.value("ApplicationsDirX86") + "\\Inkscape"

	if (checkPathContainsInkscape(appX64)) {
		inkscapeDir = appX64;
	} else if (checkPathContainsInkscape(appX86)) {
		inkscapeDir = appX86;
	} else {	
		// If we don't find anything, asking the user
		do {
			inkscapeDir = askUserInkscapePath();
			
			if (checkPathContainsInkscape(inkscapeDir)) {
				break;
			}
		} while (inkscapeDir != null);
	}
	
	if (inkscapeDir == null) {
		QMessageBox.warning("plugin.cannotinstallplugin", "Inkscape not found",
			"Could not find Inkscape. The plugin installation will be skipped.",
			QMessageBox.Ok, QMessageBox.ok);
	} else {
		component.addElevatedOperation("Copy", "@TargetDir@\\plugin\\polyshaper2dplugin.inx", inkscapeDir + "\\share\\extensions\\");
		component.addElevatedOperation("Copy", "@TargetDir@\\plugin\\polyshaper2dplugin.py", inkscapeDir + "\\share\\extensions\\");
		component.addElevatedOperation("Mkdir", inkscapeDir + "\\share\\extensions\\polyshaper");
		component.addElevatedOperation("CopyDirectory", "@TargetDir@\\plugin\\polyshaper", inkscapeDir + "\\share\\extensions\\");
	}
}
