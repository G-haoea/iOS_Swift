Welcome to iostar✨
===

### If there is such a thing to make every second of life trace, here are some of traces.     
<br>

## Clues  
* [Swift](#swift)      

* [Bug](#bug)          

* [Applications](#applications)   
<br>

## Swift   

<br>   

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

## Applications   
* [Basic settings](#basic-settings)   

* [Constraints](#constraints)   

* [Dice](#dice)   

* [Xylophone](#xylophone)   

* [Quiz](#quiz)   

* [Weather](#weather)    

<br>

### Basic settings   
This is about how to create a project when entering Xcode. Some basic settings are considered as well.    
* **`Bundle Identifier(= Organization Identifier + Product name)`**       
    -It is a only symbol in global AppStore;    
  
* **`command +/-`**    
    -Zoom up/down;   
    
* **`command B/R`**   
    -Compile/Run;  

* **`print("Hello world")`**   
    -The text will be displayed on the console;  
    
* **`Assets.xcassets`**   
    -A folder to store pictures and appIcon;   
    
* **`Add an object(label, etc.)` or `command shift L`**    
    -Choose from library;      
    -Drag it into storyboard;       
    -Change Attributes as you want;             
    
* **`Add an image`**    
     The quality of pictures have been improved by Apple. So the different iPhone has the different abilities to deal with pictures. It means iPhone 2/3G/3GS can only handle 1x that the one ratio pictures, iPhone 4/4s/5/5s/6 can deal with 2x, more than iPhone 6p with 3x. That's why we need to use a website called [appicon](https://appicon.co/) to handle image materials.  
     Use this website to create 3 different size of images with downloading a .zip file.     
     
    -Drag specific images into empty area of folder Assets.xcassets in Xcode;   
    -It will automatically fill the app box with those 1x 2x 3x images;    
    -Set imageView's image = specific image by Attributes inspector;   
    -Set width or length in Attributes inspector as well;    
    
    Tips:  the basic size should be the same with the image, like 3x should focus on an image with size of 300x300. Even the image displayed in the mainstoryboard is 100x100 which we set before for the imageView, but in a 1x screen it shows 100x100, in the 2x screen it shows 200x200, etc. That means the image will display clearly. The number with ?x? is the pixel.    
    
* **`Add app icon`**    
    -Open folder Assets.xcassets in finder on Mac;   
    -Replace original folder AppIcon.appiconset with specific iconImage folder named AppIcon.appiconset as well;   
    -So on Xcode folder Assets.xcassets, the position of AppIcon will display individual iconImage which we set;      
    
* **`Content Mode in imageView`**    
    -Scale: change radio of width:length;   
    -Aspect: keep radio of width:length;   
    -Fit: display whole image, even there is emply on imageView;   
    -Fill: fill the whole imageView, even the edge of image will not display;    
    
* **`command M`**   
    -Minimise window;        
    
* **`command option control Enter`**     
    -Open the code page as a right editor;        
    
* **`command 0`**      
    -Open/close left side window(Navigator);   
    
* **`command option Enter`**      
    -Open another device display as a right editor;   
    
* **`Initialise device`**  
    -Click project name on Navigator(left side);  
    -Change the device into universal of iPhone of iPad;    
    -The chosen of iPad influences whether requires an iPad icon;    
    
* **`Connect iPhone with Xcode by wifi`**  
    -Window - Device and simulators;   
    -Guarantee iPhone and Mac use a same wifi;   
    -Click Connect via network;  
    
    Tips: no matter what errors or fails appear, just follow what it asks like disconnect and reconnect again.   

<br>

### Constraints   

* **`Safe area`**    
    -Except what shows in the top of bottom of iphoneX+;    
    
* **`4 elements to comfirm an object`**   
    -x, y, width, height;   

* **`Align`**   
    -Horizontally/vertically in container(view);    
    
* **`Add new constraints`**   
    -4 distance which from the nearest area;    
    
* **`Constraints to margin`**   
    -It means which from the safe view;    
    
* **`After moving an object to somewhere, a yellow line appears`**     
    -If you want to confirm the position like the original line does;    
    -Click update frames, or to confrim the current position;    
    -Click resolve auto constraints assues and pay attention to whether selected view is one or the whole;   

* **`Combine multiple items into one stack view`**    
    -All original constraints in mutiple items will disappear automatically;    

* **`Adjust object's position`**    
    -Horizontally center first, then confirm 'Y';   
    
* **`If we confirm the left value and right value as well as length of object`**   
    -We need to consider the priority;    
    -Actually, when left and right values are confirmed, the length is confirmed;     
    -But if the length is also confirm, it is a conflict;   

* **`The position of multiple items in one stack view`**   
    -Distribution - Fill equally;    
    -Then two items in stack view will be split into two equal length items;   
    -Fill proportionally means they split into items according to different contents' length of items;  

* **`Alignment`**   
    -The content in the item will be centered in the `Alignment` like we do in word;    

* **`Modify two items into one width`**   
    -Click one object, commamd + another object;   
    -Click bottom - add new constraints - equal width/heights;   
    **or**  
    -Click one, control + moving to another one;   
    -Choose a choice; 
    
* **`Confirm an object's position due to ratio with view`**   
    -The first step can be above shows;   
    -Change multiple as 1:7 or 1:3, etc.;   
    
* **`Add a claim like brand etc. on the bottom of the page`**   
    -Confirm the left/right margin first;   
    -Set the text as in the center of the label;   
    -Autoshrink choose minimum font scale to let texts fill with a proper label in different devices' view;      

* **`command D`**    
    -Duplicates one;   
    **or**   
    -Click, keep option, three fingers move;   
    -Release fingers first, then release option;   
       
    Tips: If the original one has connected with an action, the new one will has the same connection with this action as well;    
* **`Remove the object from a stack view`**  
    -Just move them out of the stack view;   
    **or**    
    -Choose unembed;   
   
<br>

### Dice  

<br>   

### Xylophone   

<br>  

### Quiz  

<br>


### Weather  

<br>









 








