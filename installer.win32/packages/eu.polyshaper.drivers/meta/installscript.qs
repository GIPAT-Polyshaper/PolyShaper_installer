function Component()
{
    // default constructor
}

Component.prototype.createOperations = function()
{
    component.createOperations();

    if (systemInfo.productType === "windows") {
        component.addOperation("Execute", "rundll32.exe", "newdev", "DiInstallDriverA", "NULL", "@TargetDir@\\drivers\\arduino.inf", "0", "NULL");
    }
}
