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

## code to detect notification from Reality Composer
You can create notifications from Reality Composer that can be picked up by your code - for example when an entity is clicked etc
```swift
        //load scene anchor
        let sceneAnchor = try! Experience.loadScene()
        //detect notification
        sceneAnchor.actions.notificationName.onAction = {entity in
            //do stuff when notification is clicked
        }
```
make sure you change 'notificationName' to the name of the notification you created in Reality Composer.

## code to play spatial audio from an entity
To play a sound coming from an entity follow this code
```swift
        let audioFilePath = "path/to/audio/file"
        let entity = Entity()

        do {
          let resource = try AudioFileResource.load(named: audioFilePath, in: nil, inputMode: .spatial, loadingStrategy: .preload, shouldLoop: true)

          let audioController = entity.prepareAudio(resource)
          audioController.play()

          // If you want to start playing right away, you can replace lines 7-8 with line 11 below
          // let audioController = entity.playAudio(resource) 
        } catch {
          print("Error loading audio file")
        }
```
