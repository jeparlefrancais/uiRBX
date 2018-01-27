import os
import ItemClasses

# settings
SOURCE = "src"
EXPORT_DIRECTORY = "builds"
EXPORT_NAME = "uiRBX_plugin"

root = ItemClasses.Root()
pluginFolder = ItemClasses.Folder("uiRBX")
root.addChild(pluginFolder)

def getContent(directory, parent):
    for filename in os.listdir(directory):
        if filename.endswith(".lua"): #  it's a module script
            if directory == SOURCE:
                script = ItemClasses.Script(filename[:-4], open(directory + "/" + filename, 'r').read())
                parent.addChild(script)
            else:
                moduleScript = ItemClasses.ModuleScript(filename[:-4], open(directory + "/" + filename, 'r').read())
                parent.addChild(moduleScript)

        else: # it's folder
            nextParent = ItemClasses.Folder(filename)
            parent.addChild(nextParent)
            getContent(directory + "/" + filename, nextParent)

def getFileName(n):
    if n == 0:
        return EXPORT_DIRECTORY + "/" + EXPORT_NAME + ".rbxmx"
    else:
        return EXPORT_DIRECTORY + "/" + EXPORT_NAME + " (" + str(n) + ").rbxmx"

getContent(SOURCE, pluginFolder)

if not os.path.exists(EXPORT_DIRECTORY):
    os.mkdir(EXPORT_DIRECTORY)

n = 0
name = getFileName(n)
while os.path.exists(name):
    n += 1
    name = getFileName(n)

with open(name, 'w') as file:
    file.write(root.getData())
    print("File " + name + " exported.")
