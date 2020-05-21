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
    
* **`command b/r`**   
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
    -The quality of pictures have been improved by Apple, so the different iPhone has the different abilities to deal with pictures. That's why we need to use a website called [appIcon]("www.appIcon.com") to handle image materials;        
    -Drag specific images into empty area of folder Assets.xcassets in Xcode;   
    -Set imageView's image = specific image by Attributes inspector;   
    -Set width or length in Attributes inspector as well;  
    
   
    
* **`Add app icon`**    
    -Open folder Assets.xcassets in finder on Mac;   
    -Replace original folder AppIcon.appiconset with specific iconImage folder named AppIcon.appiconset as well;   
    -So on Xcode folder Assets.xcassets, the position of AppIcon will display individual iconImage which we set;      
    
* **` `**
    -    
* **` `**
    -    
    
* **` `**
    -    
    
* **` `**
    -    

    




Add an picture: the quality of pictures have been improved by Apple, so the different iPhone has the different abilities to deal with pictures.
It means iPhone 2/3G/3GS can only deal with 1x that the one ratio pictures,
iPhone 4/4s/5/5s/6 can deal with 2x,
more than iPhone 6p with 3x.
So it is important to upload different pixel size of one pictures to fit with different version iPhones.

It is convenient to change the pixel by this website
use this website create 3 different size picture with downloading a zip
MENTION: the basic size should be the same with the picture, like 3x should focus on a picture with size 300x300;
then move them into Xcode, it will automatically fill the app box with these three pictures;

addition: even the picture show in the mainstoryboard is 100x100, that we setted before for the ImageView, but in the 1x screen it shows 100x100, in the 2x screen it shows 200x200, etc. That means the picture will show clearly, the number with ?x? is the pixel.

content mode: set the different type for the ImageView like whether the picture should scale the fill or not;

different type for the picture: scale to fill(anyway, fill) / aspect fit(no zip, but judage the ratio);

AppIcon: move all of the icon pictures into AppIcon part, until the line change into blue, then release the mouse, so the pictures will fill into the proper position.
if there is sth. wrong with yellow!, then just move it out the box and move back again. It is just the bug of Xcode, don't worry.

customise icon: canva
icon should be: 1024x1024 pixel;
Then download directly with an ouput: png;
Until now, we just create one size icon: 1024pt for appStore, anyway, we need 11 size for AppIcon in Asserts, so we reopen appicon to set different size for AppIcon by AppIcon on the page;

command R: run (build and run);

command B: just build, no run;

command M: minisize the simulator or other screen;

command Z: click View, command Z can recall the gesture which has just done before;

initialised device: click the name of the project on the left board - change the device into universal or iphone or ipad as well, this is for we don't add icons with ipad appropriate that a warning will appear when build it;

connect iphone with Xcode by wifi:
window - device and simulators - guarantee iphone and mac use a same wifi - click connect via network;
(no matter what errors or fails appear, just follow what it asks like disconnect and reconnect again)
if the app developer is ordinary user, apple allows us to download only about 7 apps one week dislike who bought it;
<br>

### Dice  

<br>   

### Xylophone   

<br>  

### Quiz  

<br>


### Weather  

<br>









 








