function Component()
{
    // default constructor
}

Component.prototype.createOperations = function()
{
	component.createOperations();

	var extensionsDir = installer.value("HomeDir") + ".config/inkscape/extensions/";

    component.addElevatedOperation("Copy", "@TargetDir@/plugin/polyshaper2dplugin.inx", extensionsDir);
    component.addElevatedOperation("Copy", "@TargetDir@/plugin/polyshaper2dplugin.py", extensionsDir);
    component.addElevatedOperation("Mkdir", extensionsDir + "polyshaper");
    component.addElevatedOperation("CopyDirectory", "@TargetDir@/plugin/polyshaper", extensionsDir);
}
