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

<br>   

## Applications   
* [Basic settings](#basic-settings)   

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

### Dice  

<br>   

### Xylophone   

<br>  

### Quiz  

<br>


### Weather  

<br>









 








