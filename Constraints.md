# Constraints   

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
