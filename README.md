# realityTemplate

## code to add a sky box
Sky boxes adds a 360 image to the bcakground of you AR experience.
You need to put your file in a folder of the same name as the file and with the suffix of .skybox
```swift
        let skyboxName = "fileName"
        let skyboxResource = try! EnvironmentResource.load(named: skyboxName)
        arView.environment.lighting.resource = skyboxResource
        arView.environment.background = .skybox(skyboxResource)
```
Get HDRI files for sky boxes from here: [https://polyhaven.com/hdris](https://polyhaven.com/hdris)

For more information about follow this [rozengain](https://rozengain.medium.com/quick-realitykit-tutorial-programmatic-non-ar-setup-cafaf61e9884)


