function Component()
{
    // default constructor
}

Component.prototype.createOperations = function()
{
	component.createOperations();

	var extensionsDir = installer.value("HomeDir") + "/.config/inkscape/extensions/";

    component.addOperation("Copy", "@TargetDir@/plugin/polyshaper2dplugin.inx", extensionsDir);
    component.addOperation("Copy", "@TargetDir@/plugin/polyshaper2dplugin.py", extensionsDir);
    
    var pluginLibDir = extensionsDir + "polyshaper"
    if (!installer.fileExists(pluginLibDir)) {
        component.addOperation("Mkdir", pluginLibDir);
    }
    component.addOperation("Copy", "@TargetDir@/plugin/polyshaper/__init__.py", pluginLibDir);
    component.addOperation("Copy", "@TargetDir@/plugin/polyshaper/border.py", pluginLibDir);
    component.addOperation("Copy", "@TargetDir@/plugin/polyshaper/errors.py", pluginLibDir);
    component.addOperation("Copy", "@TargetDir@/plugin/polyshaper/gcode.py", pluginLibDir);
    component.addOperation("Copy", "@TargetDir@/plugin/polyshaper/helpers.py", pluginLibDir);
    component.addOperation("Copy", "@TargetDir@/plugin/polyshaper/machine.py", pluginLibDir);
    component.addOperation("Copy", "@TargetDir@/plugin/polyshaper/pathinfo.py", pluginLibDir);
    component.addOperation("Copy", "@TargetDir@/plugin/polyshaper/pathsextraction.py", pluginLibDir);
    component.addOperation("Copy", "@TargetDir@/plugin/polyshaper/pathsunion.py", pluginLibDir);
    component.addOperation("Copy", "@TargetDir@/plugin/polyshaper/toolpathpainter.py", pluginLibDir);
    component.addOperation("Copy", "@TargetDir@/plugin/polyshaper/toolpaths.py", pluginLibDir);
    component.addOperation("Copy", "@TargetDir@/plugin/polyshaper/workingarea.py", pluginLibDir);
}
