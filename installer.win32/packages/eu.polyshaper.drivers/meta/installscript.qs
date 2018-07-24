function Component()
{
    // default constructor
}

Component.prototype.createOperations = function()
{
	component.createOperations();

	// There is no need to install the arduino driver on Windows 10, serial communication
	// works out of the box
	if (systemInfo.productType === "windows" && !systemInfo.productVersion.startsWith("10")) {
		windir = installer.environmentVariable("windir");
		if (windir == "") {
			//Just in case.
			windir = "c:\\windows";
		}

		// The pnptool we use to install the driver has different path depeding on whether the
		// operating system is 32bit or 64 bit
		if (systemInfo.currentCpuArchitecture === "i386") {
			pnputil = windir + "\\system32\\pnputil.exe";
		} else {
			pnputil = windir + "\\sysnative\\pnputil.exe";
		}

		// New syntax for pnptool, not sure it works on older windows, using the legacy one
		//component.addElevatedOperation("Execute", pnputil, "/add-driver", "/install", "@TargetDir@\\drivers\\arduino.inf");
		component.addElevatedOperation("Execute", pnputil, "-a", "-i", "@TargetDir@\\drivers\\arduino.inf");
	}
}
