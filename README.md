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
To play a sound coming from an entity follow this code. Make sure you gegt or create an entity to add the file in it is called myEntity in this code.
```swift
        
        do {
          let resource = try AudioFileResource.load(named: "audioFileName", in: nil, inputMode: .spatial, loadingStrategy: .preload, shouldLoop: true)
          let audioController = myEntity.playAudio(resource) 
        } catch {
          print("Error loading audio file")
        }
```
Further reading [here](https://ethansaadia.medium.com/immersive-audio-in-realitykit-b3748c0a4319)

## code to load a USDZ model as an entity
```swift
        var entity:Entity!
        do{
            entity = try Entity.load(named: "USDZName")
            //uncomment if you want to do collisions or taps etc
            //entity.generateCollisionShapes(recursive: true)
        }catch{
            print("usdz not loading error")
        }
        
       
        let entityAnchor = AnchorEntity(world: .zero)
        arView.scene.addAnchor(entityAnchor)
        //sort size of model
        entity.transform.scale *= 0.3
        //set poistion of model x, y, z
        entity.transform.translation = simd_make_float3(0, 0, -0.3)
        entityAnchor.addChild(entity)
```
