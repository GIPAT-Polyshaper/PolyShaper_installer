function Component()
{
    // default constructor
}

Component.prototype.createOperations = function()
{
	component.createOperations();

	var extensionsDir = installer.value("HomeDir") + "/.config/inkscape/extensions/";

    component.addElevatedOperation("Copy", "@TargetDir@/plugin/polyshaper2dplugin.inx", extensionsDir);
    component.addElevatedOperation("Copy", "@TargetDir@/plugin/polyshaper2dplugin.py", extensionsDir);
    if (!installer.fileExists(extensionsDir + "polyshaper")) {
        component.addElevatedOperation("Mkdir", extensionsDir + "polyshaper");
    }
    component.addElevatedOperation("Copy", "@TargetDir@/plugin/polyshaper/__init__.py", extensionsDir);
    component.addElevatedOperation("Copy", "@TargetDir@/plugin/polyshaper/border.py", extensionsDir);
    component.addElevatedOperation("Copy", "@TargetDir@/plugin/polyshaper/errors.py", extensionsDir);
    component.addElevatedOperation("Copy", "@TargetDir@/plugin/polyshaper/gcode.py", extensionsDir);
    component.addElevatedOperation("Copy", "@TargetDir@/plugin/polyshaper/helpers.py", extensionsDir);
    component.addElevatedOperation("Copy", "@TargetDir@/plugin/polyshaper/machine.py", extensionsDir);
    component.addElevatedOperation("Copy", "@TargetDir@/plugin/polyshaper/pathinfo.py", extensionsDir);
    component.addElevatedOperation("Copy", "@TargetDir@/plugin/polyshaper/pathsextraction.py", extensionsDir);
    component.addElevatedOperation("Copy", "@TargetDir@/plugin/polyshaper/pathsunion.py", extensionsDir);
    component.addElevatedOperation("Copy", "@TargetDir@/plugin/polyshaper/toolpathpainter.py", extensionsDir);
    component.addElevatedOperation("Copy", "@TargetDir@/plugin/polyshaper/toolpaths.py", extensionsDir);
    component.addElevatedOperation("Copy", "@TargetDir@/plugin/polyshaper/workingarea.py", extensionsDir);
}
