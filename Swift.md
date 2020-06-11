## Swift   

* **`var indexL: Int = 0`**   
    -Claim a variable with **Int**;     

* **`indexL = Int.random(in:1...6)`**      
    -Generate a random **Int** from 1 to 6 by "...";     

* **`print(indexL)`**     
    -When running the project, check whether the action did as the code shows in console by **print**;      

* **`var str = "hello"`**     
    -If the variable can be clearly recognised after "=", it don't need to claim the variable as the first line shows;     
    -It is the same as `var indexL = 0`;     

* **`command delete`**     
    -When move the mouse on the last of current line, it can delete the whole line;     

* **`command shift enter`**      
    -When open a **background** not **create a project** on Xcode, it can run the pure code without UIview or simulator;      

* **`command option [`**     
    -Move the whole line codes up;    
    -`]` means move the whole line codes down;    

* **`let name = "grace"`**     
    -It is same as **final string**;    
    -The value of which **let** claims cannot be changed;   
    -It cannot **assign** to value that 'name' is **constant**;    
    -It needs less and less and less storage than ordinary variables;       
    -We can claim the variable as **let** at the beginning, if we need to change its value, change it after then;            

* **`let fullName = "\(name) liu"`**      
    -**"name"** is another varible with **let** which contains the value of "grace";     

* **`let flag: Bool = false`**   
    -**Bool** not boolean;  

* **`let mini = 3.14`**      
    -It will be **double**, because it will directly recognise it as double;    
    -But if we do not know the details of this variable, we should claim **double** though;        

* **`diceImageViewL.image = UIImage(named = "dice-\(indexL)"`**     
    -Change diceimageViewL's imageView into dice-X;   

* **`let diceArray = ["dice-1", "dice-2", "dice-3", "dice-4", "dice-5", "dice-6"]`**    
    -An array with String;      
    -`diceImageViewL.image = UIImage(named = diceArray[indexL]`;           
       
* **`func methodName() {}`    
    -Claim a function;     

* **`Tells the receiver that a motion event has ended.`**     
  ```swift  
     override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
              code
     }
  ```   
    -**`motion`**: An event-subtype constant indicating the kind of motion. A common motion is shaking, which is indicated by `UIEvent.EventSubtype.motionShake`;   
    -**`event`**: An object representing the event associated with the motion;     

* **`Hard Code`**
    -E.g. print(1x) can only print 1x, cannot print 2x, so it is hard code;      
    -If we want to print 2x/3x, etc. Use the parameter in the method();    

* **`function`**    
  ```swift
     func getMilk (nums: Int, total: Int) {
          total = nums * 5
          print(\(nums))
          print("Buy \(nums) bottles of milk needs \(total) pounds.")
     }  
  ```   
    -Think more than twice about the license of the parameters -> nums: Int;    
    -`let rest = getMilk(nums: 2, total: 100)`;      
 

* **`The type for return variable is **->Int**`**   
  ```swift   
     func getMilk (nums: Int) -> Int {
          return 0
     }
  ```    
 
* **`if-else`**    
  ```swift   
     func textSimilar (herName: String, hisName: String, num: Int) -> String {
          if nums > 80 {  
             return "Up"   
          }else if nums > 40 && nums <=80{  
             return "Mid"
          }else{  
             return "Down"
          }   
  ```

* **`round(double)`**    
    -Focus on a double variable value into 4cut5add **BUT** will return a double as well like 22 **.0**;   

* **`pow(2, 3)`**    
    -2^3 = 2x2x2;     

* **`loop`**    
  ```swift    
     let nums = [1,2,7,4,3]`  
     for num in nums {
         print(num)
     }
  ```    
    -It will print 1,2,7,4,3 is the same as for the below in java      
  ```java  
     for(int item:arrayName){
         System.out.println(item);
     } 
  ```    
    -The basic principle is:    
  ```swift   
     var num = nums[0]
     print(\(num))
     num = nums[1]
     print (\(num))
     then ...
   ```   
   
* **`The original loop`**        
    ```swift
       for num in 1...10{  
           print(num)
       }
    ```     
    -It will print 1,2,3,...,10 as what java shows:    
    ```java     
       for(int i=1; i<=10; i++) {
           System.out.println(i);
       }
     ```    
     
* **`Fixed scope`**    
    -`1..<10`: 10 is open, so the range is 1-9;    
    -`1>..10`: 1 is open, so the range is 2-10;      

* **`Add condition on loop`**    
    ```swift
       for i in 1...10 where i % 2 == 0 {
             print(i)
             print("The current number is \(i)")
       }
    ```     
    -It will print 2,4,6,8,10 which is same as what java show:    
    ```java   
       for(int i=1; i<=10; i++) {
           if(i % 2 == 0) {
                  System.out.println(i);    
           }
       }
    ```    

* **`(1...10).reversed()`**    
    -Change 1->10 into 10->1;    

* **`How to use methods`**    
  ```swift    
     func calSong (howmany total: Int) {
     }
     
     calSong(howmany: 10)
  ```    
    -**`howmany`**: It is the name to use;    
    -**`total`**: It is the name to run in the code;    
    -`Target`: To guarantee the frequency of different meaning of function target, which is focus on foreigner? Anyway, don't mention it;      
    -If we don't care foreigner language:    
    ```swift    
       func calSong (_ total: Int) {
       }
       
       calSong(10)   
    ```    

* **`IBAction of UIButton`**     
  ```swift   
     @IBAction func touchKeys (_ sender: UIBotton) {
     }
  ```    
    -**`_`**: The meaning of null parameter outside method which we have mentioned before. It is the parameter name which when we use this method and give a name of this parameter;    
    -**`sender`**: It is the sender of this action, the same as the object which sends this command. It is equal to what shows as follows that sender is **btn**:        
    ```swift    
       @IBOutlet weak var btn: UIButton    
       @IBAction func touchKeys (_ sender: btn) {    
       }    
    ```   
    
* **`if send.tag == 1 {}`**    
  
* **`import Foundation`**     
    -It is everything we can use in the .swift, which after we created a .swift file it will appear;     

* **`import UIKit`**      
    -It is a more wide package than **Foundation**, it contains Foundation;    

* **`Initialise a class`**        
  ```swift
  init(text: String, ans: Bool) {
       quesText = text
       quesAns = ans
  }    
  ```   

* **`Judge then give a value`**       
    -`var name = (flag ? "yes" : "no")`;              

* **`nil`**    
    -It is the same as `null` in java/c/etc.;       

* **`Transfer variable type`**    
    -Int to String: `String(IntVariableName)`;      
    -String to Int: `Int(StringVariableName)`;        


* **`enum`**      
  ```swift
  enum Type{
       case apple
       case orange
       case banana
  }
  var type = Type.banana
  //var type:Type = .banana

* **`A non-parameter constructor`**  
  ```swift
  convenience init(){
       init(name: "hello", seats: 2, type: .sports)
  }    
  
  or
  
  convenience init(name: String){
       init(name: "hello", seats: 2, type: .sports)
  }
  ```
    -Then we can use two approaches to init;   

* **`inherit`**      
    -Tesla is son, Car is fater;    
  ```swift   
     class Tesla:Car{  
     }  
  ```    

* **`Override`**      
  ```swift
   class fish:animal{
       override func breathe (){
             super.breathe()
             //do sth. here
       }
  }   
  ```     

* **`optional`**    
    -Like ? or !;     
    -`var destination:String?`;    
    -It means at the beginning, there is no initialise value for it;      
    -If we want to use **destination** into print which we have mention above, we need to use `destination!` as a **wrap action** or `nil`;    
    
    -Tips: But if we have not give **destination** a value, we print it, the code will crush, because there is no value for **destination**, but we try to **wrap** which means forced to figure out "?";       

* **`Use 'destination?' as a code`**    
    -if let;    
  ```swift
   if let dest = destination{ 
        print(dest)
   }
  ```   
    -So we don't need to use **destination!** every time;     

* **`import CoreLocation`**    
    -Apple's own position package;       

* **`Get the current location`**    
    -`let locationManager = CLLocationManager()`    
    -There is no actions in CLLocationManager;    
    -The actions claims are the another protocol(**CLLocationManagerDelegate**);      
   

* **`Some function appropriates Xcode to show it when the app appears`**     
  ```swift  
     override func viewWillAppear(_ animated: Bool) {
        <#code#>
     }   
  ```

* **`When the device wants to use the location, device may request the agreement from the device`**       
    -Device may request the agreement from the device;    
    -`locationManager.requestWhenInUseAuthorization()`;     
   
* **`Set accuracy of location`**       
    -`locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters`;      
  
* **`Request for location`**     
    -There is a description when click this one - request one-time/all the time(we can change it);      
    -`locationManager.requestLocation()`;    


* **`A class has 3 parameters: property, method, actions`**    
  
* **`delegate`**  
    -Delegate is the same usage as **Interface**, just method name, no details;    
    -All optional method can be chosen optional, others are must be used;     
  ```swift    
     class ViewController: UIViewController, CLLocationManagerDelegate{
     }
  ```    

* **`didUplocation`**    
    -It is used after we want to **requestLocation**;    
    -It means if we use **requestLocation**, it will use **didUplocation**;        
  ```swift
     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
          <#code#>
     }
     //all requests are stored in an array - [CLLocation] which concerns latitude & longitude;  
  ```     

* **`Get current position's lat and lon`**        
    -`let lat = locations[0].coordinate.latitude`;       
    -`let lon = locations[0].coordinate.longitude`;    
    -**Remember** to add this line into **viewdidload**: `locationManager.delegate = self`;        

* **`dictionary`**       
    -(key:value): `let dict : [String: String] = ["name":"Grace", "age":"12", "gender":"female"]`;     
    -We can get one of an array by 'arr[index]', we can get one of dictionary's value by `dict["name"]`;    
    -`dict[key] = value`;    
    -It can be set as `[String:Any]` that means `"name":Grace` but `"age":12` is also allowed, the value can be any variables;    
* **`SwiftyJSON`**   
    -If we want to analyse **JSON** which we get from api, we can use **SwiftyJSON** on cocoapod;     
    -When we use **SwiftyJSON** to anaylse, we need to get value;   
    -`.String`: if the value of "name" is null, the whole one maybe null;   
    -`.StringValue`: it will be a ' ', not null;   

* **`Computed variable`**     
    -The variable of this type cannot be detected automatically, so we need to give variables as a original value;      
  ```swift
  var iconName:String{
      //the value of this iconName will change when the other changes;   
        switch (condition) {
        case 0...100:
            return "cloudy"
        case 100...200:
            return "fog"
        default:
            return: "sunny"
  } 
  ```   

* **`round()`**      
    -4 throw, 5 add;      

* **`extention`**   
    -We can create an extention viewcontroller outside of the main viewcontroller to avoid inconvenience of the confusing code;        

* **`prepare in second viewController on segue`**    
    -There will be a **prepare** method on the second **viewController** about **segue**;       

* **`Switch one controller to another one`**       
  ```swift
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "selectCity"{
            segue.destination as! SelectCityController
        }
    }
  ```

* **`as   as!   as?`**    
    -`Int(3.2)   =    3.2 as Int`: Up transfer, from sub to father;     
    -`as! and as?`: Down transfer, from father to son, one is must, one is optional - **upcasting**;        

* **`Individual delegate`**      
  ```swift
     protocol SelectCityDelegate {
           func didChangeCity()
     }
     var delegate:SelectCityDelegate?
     @IBAction func changeCityBtn(_ sender: Any) {
           delegate?.didChangeCity()
     }
     vc.delagate = self; 
  ```

* **`Let current page disapper`**     
    -`dismiss(animated: true, completion: nil)`   

<br>   
