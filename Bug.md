## Bug    

* #### `A yellow ⚠️ appears when adding icon images into AppIcon in Asserts`   
  **`Reason`**: Don't worry, it is just a bug on Xcode;    
  **`Solution`**: Just move the icon out of the box, then move back;       

* #### `The app icon set "AppIcon" has an unassigned child`    
  **`Reason`**: We have no area for this icon, maybe because we have already had a 1024x1024;    
  **`Solution`**: Click the yellow warning ⚠️ icon, just delete it;      

* #### `Main.storyboard: warning: Auto Layout Localization:`   
  #### `Views without any layout constraints may clip their content or overlap other views.`       
  **`Reason`**: The view has no constraints with edges, so if the screen is larger than the size of **ImageView**, the image will not appear entirely;    
  **`Solution`**: Add constraints as [this link](#constraints) shows;       

* #### `The app identifier "com.iii17-grace.MyStar" cannot be registered to your development team`   
  #### `because it is not available.`  
  #### `Change your bundle identifier to a unique string to try again.`     
  **`Reason`**: When insert a real iphone into Xcode, and set Bundle identifier, a mistake will appear, which is about the Bundle identifier is not the only one, because we have used it before on a simulator.   
  **`Solution`**:    
  -Change Bundle identifier with a different name on app like appname**123**;   
  **or**    
  -Change the version of the Xcode project on: general - target - version chosen;     
  
* #### `Could not launch iphone`      
  **`Reason`**: The mac has not been trusted by iphone with the developer identifier;     
  **`Solution`**: On iphone - general - device management - click apple - trust;    

* #### `The picture in ImageView cannot be filled to all of box`       
  **`Reason`**: The chosen picture in **Assets** is not the correct size with filled with 1024x1024;     
  **`Solution`**: When choosing pictures in [canva](https://www.canva.com/), try to fill pictures into the whole screen of the 1024x1024;        

* #### `The picture in ImageView has an edge of white`    
  **`Reason`**: The chosen picture in **Assets** is not the only picture type, that means the edge of the picture should be null rather than white;     
  **`Solution`**: Use [iconfont](https://www.iconfont.cn/) or other tools to deal with the picture, let the edge of pictures is null;    

* #### `The set name of View cannot be connected to the name in Viewcontroller`      
  **`Reason`**: If I just change the name in the Viewcontroller, the name we set before for the view is not changed. We can open the source **code** of mainstoryboard which is a .xml file, it shows the connection between the view and the code is be setted with the name '1stSet', the action which change in viewcontroller cannot be synchronise with the view setting;     
  **`Solution`**: Delete it and reconnect again in **connection**;     

* #### `CANNOT find the class which we have claimed in another .swift file`      
  **`Reason`**: The .swift file has been moved into a folder, NOT a **Group**, so viewcontroller cannot recognise class in another folder;    
  **`Solution`**: Remember to add files into a group **without** folder;    

* #### `Apply type double to float or int, etc.`      
  **`Reason`**: A value of Int cannot do any actions with the value of Double;      
  **`Solution`**: Float(2) / 3 = 0.666666, float can / int, but int cannot / float;   

* #### `After clone .zip into our own project, but the .zip is ObjectC`       
  **`Reason`**: We can clone or download a completed project .zip from GitHub, but OC cannot be recognised well by swift, we need do sth.;     
  **`Solution`**: Whatever Xcode remind, click yes - deal with it, then in the file(Quizzler-bridging-header.h) add this:  
  ```swift  
     #import "ProgreeHUD.h";    
  ```    

* #### `Leading size,etc.`     
  **`Reason`**: If we just confirm one orientation of a label, the size of this label **may** override other labels, we need to give a lable at least three constraints;  
  **`Solution`**: We can confirm three constraints or set one constraints as <= a value;     

* #### `Put two items into one stack view:`      
  **`Reason`**: Two items in one stack view should be setted as it has been filled out - alignment and distribution;    
  **`Solution`**:    
  -Alignment(fill): Set the length of stack view is to satisfy the minimise of the item's one;    
  -Alignment(center): Set its length the same as the maximise one, so all of the items can show entirely;      
  -Distribution: Set the height of two items;       

* #### `After connecting one view with another one, the items cannot be shown entirely`       
  **`Reason`**: Actually, there maybe the problem of updating or bug;     
  **`Solution`**: I just move one item's position and move back, refresh, run, it goes well.      

* #### `This app has attempted to access privacy-sensitive data without a usage description.`     
  #### `The app's Info.plist must contain an “NSLocationWhenInUseUsageDescription” key`    
  #### `with a string value explaining to the user how the app uses this data`          
  **`Reason`**: When we use the location asked access, there should be a key or discription to tell users that we want to ask for location. If we don't tell users, there is no reasons for device to ask for location;       
  **`Solution`**: **info.plist** - first one - change into - **privacy location when in use usage description**, then change value into - "String"(a reason about why we want your location, maybe for the weather obtained);          

* #### `Exception NSException *	"Delegate must respond to locationManager:didFailWithError:"`         
  #### `0x0000600002f09050`        
  **`Reason`**: In the newly apple document, there must be a method to deal with error when we ask for the location;     
  **`Solution`**:   
  ```swift
     func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print(error)
     }
   ```    
 
* #### `Something goes wrong when using cocoapods:`      
  [Solutions](https://juejin.im/post/5cbd44a85188250a8c22aae8#heading-12)     
  [If no podFile](https://juejin.im/post/5d8891a06fb9a06ad16fafba)   

* #### `Expression implicitly coerced from 'Data?' to 'Any' **When we put let weather = JSON(json)`      
  **`Reason`**: We have not give response a default value, if json is null, how can we deal with it? So the warning appears;   
  **`Solution`**: We change response into responseJSON to confirm it must be a JSON:    
  ```swift
     AF.request("https://api.openweathermap.org/data/2.5/weather", parameters: paras).responseJSON { response in
            //debugPrint(response)
            if let json = response.value{
                let weather = JSON(json)
                print(weather)
            }
     }   
   ```

* #### `CANNOT switch into another viewController by segue`    
  **`Reason`**: An identifier should be set firstly on segue, but a thread interrupted because the prepare function are not located on a correct position;   
  **`Solution`**: Move prepared method into a correct position, which is after getWeather or has a value situation;    


<br>   
