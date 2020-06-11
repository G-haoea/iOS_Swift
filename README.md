Welcome to iostar✨
===

### If there is such a thing to make every second of life trace, here are some of traces.     
<br>

## Clues  
* Swift    
  [https://github.com/iii17-grace/ios_Swift/edit/master/Swift.md](https://github.com/iii17-grace/ios_Swift/edit/master/Swift.md)           

* Bug        
  [https://github.com/iii17-grace/ios_Swift/edit/master/Bug.md](https://github.com/iii17-grace/ios_Swift/edit/master/Bug.md)         
* Applications     
  [https://github.com/iii17-grace/ios_Swift/edit/master/Applications.md](https://github.com/iii17-grace/ios_Swift/edit/master/Applications.md)       
  
* [Basic settings](#basic-settings)      

* [Constraints](#constraints)      


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

* **`stack view`**      
    -Only stack view has hug and compress, we should set the priority of these two properties, to avoid the condition that when the width of stack view has been confirmed, how to deal with the priority of two horizontal labels (high number has high priority);    

* **`constraint to margin`**    
    -All setting is for **margin**;    

* **`Multipller`**   
    -It means the ratio of self:superView(or other element);    

* **`Autoshrink`**   
    -Shrink the font as what you wanted, like minimum font size or minimum font scale;    

* **`Set button's corner`**       
    -Add property - layer.cornerRadius - Number - 23;        

* **`Set label's corner`**    
    -As what done as button's, then **clip to bounds**;     

* **`control + option + command + enter`**    
    -Open assistant on right;    

* **`command =`**    
    -Let the text in label can fit into the content;       


   
<br>

