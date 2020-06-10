### Weather  
[https://github.com/iii17-grace/ios_Swift/tree/master/Weather](https://github.com/iii17-grace/ios_Swift/tree/master/Weather)   
      
**TODO**   
* When users enter the application, it will show current city's weather, temperature, and city's name;            
* User can switch city which user wants to know;     
* The condition of weather will display as a temperature as well as an image;     
     
**POINT**    
* **`cocoapods`**   
    -It is a platform for developer to storage different packages;     
    -Developer can find more comleted API or codes to achieve any functions;    
    -Any functions which has been developed can be found in the homepage of **cocoapods.com**;     

* **`Alamofire`**        
    -It is a nice tool for developer to get weather API;    
    
* **`Action segue`**   
    -When user click an button, a segue will appear;    
    -It is not another page, it just like the notification page;    
    -It is independent with other pages;    

* **`Delegate`**   
    -Allocate works to workers;    
    
* **`Protocol`**    
    -It is more likely the same as **Interface** in java;     
    -There is just the name of the method, no details to achieve the methods;    
    
     
**STEP**   
* **`Add object into the 1st storyboard`**      
    -A button for switching city;    
    -A label for displaying temperature;     
    -A label for displaying current city;    
    -An imageView for displaying the current weather condition;     

* **`Claim objects(labels) as a variable`**   

* **`import CoreLocation for managing iPhone's location`**     
    -`import CoreLocation`;    

* **`Give a background or licence (Delegate) to viewController`**   
    ```swift    
       extension ViewController: CLLocationManagerDelegate{
       }     
    ```     

* **`Let locationManager knows who is its agent`**    
    ```swift    
       locationManager.delegate = self    
    ```    

* **`Set locationManager's accuracy`**    
    ```swift      
       locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters     
    ```        
    -Higher accuracy with more power requirement;     

* **`Request User's location at the beginnning`**    
    ```swift    
       locationManager.requestLocation()   
    ```    

* **`viewDidAppear()`**      
    -Once the page appears, it runs;    
    -`viewDidLoad()` means what happened when the application is opened the first time;    
    ```swift    
       override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            locationManager.requestWhenInUseAuthorization()
       }     
    ```     
    -Ask for user whether it is allowed to request location like:    
    -**Allow to use location while in the use/always/never** on iPhone;   
    
* **`What system will do when app wants to request location`**   
    ```swift    
       func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let lat = locations[0].coordinate.latitude
            let lon = locations[0].coordinate.longitude
            print(lat, lon)
            let paras = ["lat":"\(lat)", "lon":"\(lon)", "appid":"\(appid)"]
            getWeather(paras: paras)
        }    
    ```  
    -If there has an error when applying for position:     
    ```swift    
       func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print(error)
       }    
    ```     

* **`Create a podfile using cocoaPods`**    
    -Because of some problems of cocoaPods, the podfile cannot be created by application directly;    
    -Terminal - cd folder - pop init;    
    -Open cocoaPods - `command O` - open popfile;     
 
* **`import Alamofire in cocoaPods`**    
    -`pod 'SVProgressHUD'`;      
    -`pod 'Alamofire'`;     
    -`pod 'SwiftyJSON'`;    

* **`getWeather() by applying for API from weather by Alamofire`**   
    ```swift    
       func getWeather(paras:[String:String]){
            AF.request("https://httpbin.org/get", parameters: paras).responseJSON { response in
                if let json = response.value{
                    let JSONWeather = JSON(json)
                    self.createWeather(JSONWeather: JSONWeather)
                    self.updateUI()
                }
            }
        
        }      
    ```    

* **`Create a class to store weather object`**    
    ```swift   
       class Weather {
            var temp = 0
            var city = ""
            var condition = 0
    
            var icon : String{
                switch (condition) {
                        case 0...300 : return "tstorm1"
                        case 301...500 : return "light_rain"
                        case 501...600 : return "shower3"
                        case 601...700 : return "snow4"
                        case 701...771 : return "fog"
                        case 772...799 : return "tstorm3"
                        case 800 : return "sunny"
                        case 801...804 : return "cloudy2"
                        default : return "dunno"
                 }
             }
        }     
    ```   
    -It is based on weather website API introduction;    

* **`createWeather() to create a weather object through JSON which has been replied`**    
    ```swift    
       func createWeather(JSONWeather: JSON) {
            weather.city = JSONWeather["name"].stringValue
            weather.condition = JSONWeather["weather", 0,"id"].intValue
            weather.temp = Int(round(JSONWeather["main", "temp"].doubleValue - 273.15))
        }
    ```    
    -The temperature should be transferred into original format, so - 273.15 to ˚;    
    
* **`updateUI()`**    
    ```swift   
       func updateUI() {
            cityLabel.text = weather.city
            tempLabel.text = "\(weather.temp)˚"
            weatherImage.image = UIImage(named: "\(weather.icon)")
       }    
    ```    
    
* **`Remember to give description in Info.plist`**     
    -`Privacy - Location When In Use Usage Description`;     
    -A description for why it needs location;   

* **`Add segue for selecting city page`**   
    -Create a new **viewController**;    
    -Add objects: **TextField** and **Button** in a stackView;   
    -Connect 1st switch button with this segue page;    
    -Set segue's identifier as **selectCity**;     

* **`Set for segue type`**   
    -`show`    
    -If NaigationController exists, the Controller which segue connects will be pushed in navigation stack, the new viewController has return button, click then return back;   
    
    -`show Detail`   
    -No matter NavigationController exists, it will not be pushed into stack, it just replaces the current view, there is no return button, it will show contents in Detail area;    
    
    -`Present Modally`   
    -It is not pushed into stack as well, like the view which move from button into above, more likely to be regarded as an alert/login in field. User cannot interactive with last view, unless close this view;     
    
    -`Present As Popover`   
    -Don't push into stack as well, like a downCrash menu, when click other area out of this area, this target view controller will disappear in ipad. But in iphone, this area will fill out the whole screen;      

* **`Protocol by creating a delegate for segue page to didChangeCity()`**    
    ```swift   
       import UIKit
       
       protocol SelectCityDelagte {
            func didChangeCity(city: String)
       }     
    ```     

* **`Give didChangeCity() details in viewController.swift`**   
    ```swift    
       func didChangeCity(city: String) {
            weather.city = city
            let paras = ["q":"\(weather.city)", "appid":"d838c529dbd89a6de2937fe3829a17dc"]
            getWeather(paras: paras)
       }    
    ```     

* **`Create a new class selectCityController which is a subClass of UIViewController`**    
    -Set segue belongs to **SelectCityController** first on the right navigation part;     
    ```swift   
       class SelectCityController: UIViewController {
       
                    var delegate : SelectCityDelegate?
                    
                    @IBOutlet weak var cityInputField: UITextField!
                                 
                    @IBAction func returnBtn(_ sender: Any) {
                            dismiss(animated: true, completion: nil)
                    }
                    
                    @IBAction func searchBtn(_ sender: Any) {
                            delegate?.didChangeCity(city: cityInputField.text!)
                            dismiss(animated: true, completion: nil)
                    }
                    
                    override func viewDidLoad() {
                            super.viewDidLoad()
                            // Do any additional setup after loading the view.
                    }
        }     
     ```    

* **`Prepare() method for communicate data from 1st page to 2nd page`**     
    ```swift   
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
            if segue.identifier == "selectCity"{
                let vc = segue.destination as! SelectCityController
                vc.delegate = self
     
            }
       }     
    ```     



     


   


<br>






















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

### Dice   
[https://github.com/iii17-grace/ios_Swift/tree/master/Dice](https://github.com/iii17-grace/ios_Swift/tree/master/Dice)    
    
**TODO**   
* User get different values of two dices in this game application;       
* When user first log in, a random combination appears;    
* Chick button then the values of two dices change automatically;    
* User can shake iPhone for getting new values of two dices as well;              
     
**POINT**    
* **`Int.random()`**    
    -From `.h` method to generate a random value;     

* **`command + D`**     
    -ctrl c + ctrl v = copy a same one;     

* **`Two interactive View`**              
    -`visible view`: static ImageView like logo, etc.       
    -`interactive view`: dynamic view like button, etc. can interactive with users, it will give a feedback to users like a respond or some other actions to achieve any goals;    
     
**STEP**       
* **`Add icon images into Assets`**     
    -Move app icons into folder directly;     
    -Move other images into the list of `Assets` in Xcode;   
    -Adjust images' size by **canva** and **appicon**;     
        
* **`Add objects into storyboard`**       
    
* **`Constraints`**    
    -Set background fill the whole screen to fit different devices;    
    -Other objects are set by ratio due to different screen's sizes;  
    
* **`Stack View`**   
    -Combine two imageView which contains diceImage into one **stackView**;    
  
* **`layer.cornerRadius`**    
    -For button should `Click to Bounds`;    
    -For others don't need to click above one;    
 
* **`Claim @IBOutlet for imageViews`**       

* **`Claim @IBAction for button`**    

* **`An independent function for updating dices`**   
    ```swift    
       func updateDice() {
            indexL = Int.random(in: 0...5)
            indexR = Int.random(in: 0...5)
            diceL.image = UIImage(named: diceArray[indexL])
            diceR.image = UIImage(named: diceArray[indexR])
       }
    ```    
* **`Put diceImages's name into an Array`**    
    ```swift  
       let diceArray = ["dice-1", "dice-2", "dice-3", "dice-4", "dice-5", "dice-6"]
       
       var indexL = 0
       var indexR = 0       
    ```    
    
* **`Add a function for shaking by google shake apple document`**    
    ```swift    
       override func motionEnded(_ motion: UIEvent.EventSubtype,
                     with event: UIEvent?) {
             updateDice()   
       }      
     ```        
  
* **`shake on simulator`**    
    -Device - shake;    
    -`control + command + Z`;    

<br>   

### Xylophone    
[https://github.com/iii17-grace/ios_Swift/tree/master/Xylophone](https://github.com/iii17-grace/ios_Swift/tree/master/Xylophone)    
    
**TODO**   
* The keys in application are regarded as 7 keys in keyboard;           
* When user click different keys, iPhone will display different sounds;     
     
**POINT**    
* **`tag`**          
    -Set different keys button with different values of tags;    
    -Programme can find these different button by tags;        

* **`import AVFoundation`**             
    -It contains `AVAudioPlayer`;     
     
**STEP**   
* **`Add objects into storyboard`**         
    -7 buttons;        

* **`Set constraints`**           
    -The same height can only be displayed after the Y position is confirmed;     
    
* **`Set tags`**   

* **`Set basic environment for player`**    
    ```swift    
       import AVFoundation    
    ```      

* **`Claim a player`**    
    ```swift    
       var player : AVAudioPlayer!         
    ```     

* **`Claim @IBAction for different buttons`**    
    -Combine different keys into this one @IBAction;     
    ```swift    
       @IBAction func click(_ sender: UIButton) {
             playMusic(tag: sender.tag)
       }    
    ```     
 
* **`Achieve playing music by clicking different keys`**      
    ```swift   
       func playMusic(tag: Int){
            let url = Bundle.main.url(forResource: "note\(tag)", withExtension: "wav")
        
            do{
                player = try AVAudioPlayer(contentsOf: url!)
                player.play()
            }catch{
                print(error)
            }
        }   
    ```      
    
  
    

<br>  

### Quiz   
[https://github.com/iii17-grace/ios_Swift/tree/master/Quiz](https://github.com/iii17-grace/ios_Swift/tree/master/Quiz)    
    
**TODO**   
* There has a data base which contains several questions;          
* User can do this quiz and then get the score;    
* The bottom of this application shows the progress bar and only the progress by text;    
* Current score will display in the bottom of screen which located on right part;    
* After completing all questions, an alert will display to ask whether user want to try again;    
     
**POINT**    
* **`MVC = Model + View + Controller`**     
    -User wants to do sth.;    
    -Tell (view)Controller;    
    -(view)Controller tells model;    
    -Model asks for data;    
    -Then back to (view)Controller;     
    -Finally, shows on View;       
   
* **`OOP = Object + Oriented + Program`**      

* **`Group files`**     
    -Developer can create many groups without folders to tidy up complex files;    
 
* **`Alert from apple document`**   

* **`Progress Bar`**      
    -`progressBar.frame.size.width = view.frame.width`:         
    -With frame means developer can correct its value;     
    -The above approach is for progressBar's progress is 0, we adjust the length of the bar, not the progress, through correcting the length of bar to show the progress;    
        
    -`progressBar.progress = Float (view.fram.width / 3)`:      
    -It shows the correct progress;  
    
     
**STEP**   
* **`Add objects into storyboard`**    
    -Question label;    
    -Two buttons with true and false;    
    -A stack view combined with two lable: complete and score;    
    -progress view = progress bar;    

* **`Assign files into different group`**    
    -MVC;     
    
* **`Create new .swift file in model folder`**    
    -Here are data in order to support the whole programme(MVC);    
    -A class claim here with class **QuesAndAns** which contains **quesText** and **quesAns**;    

* **`Put initial questions into an array`**    
    ```swift    
       let questions = [
                QuesAndAns(text: "1+1=2", ans: true),
                QuesAndAns(text: "1+1=3", ans: false),
                QuesAndAns(text: "1+2=3", ans: true)
       ]     
    ```    
    
* **`Set the original display when entering the application firstly`**     
    ```swift    
       override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        
            questionLabel.text = questions[0].quesText
            completeLabel.text = "Comlete:1/\(questions.count)"
            scoreLabel.text = "Score: 0"
            progressBar.progress = 1 / Float(questions.count)
        
        }     
    ```     

* **`What will do when click button with tag in different button`**      
    ```swift    
       @IBAction func button(_ sender: UIButton) {
        
            curAns = sender.tag == 1 ? true : false
            corAns = questions[curQues].quesAns
            checkAns()
            updateUI()
        
       }     
    ```     

* **`checkAns()`**   
    -Get `curScore` and `sumScore`;  
    ```swift    
       func checkAns() {
            curScore = curAns == corAns ? 10 : 0
            sumScore += curScore
        
       }    
    ```     

* **`updateUI()`**    
    -Update `scoreLabel`;   
    -Move to `nextQuestion()`;   
    ```swift    
        func checkAns() {
             curScore = curAns == corAns ? 10 : 0
             sumScore += curScore
        
        }     
    ```     

* **`nextQuestion()`**    
    -Judge whether it is the last question first;    
    -If it isn't the last question, update relative information;     
    ```swift    
       func nextQues() {
            curQues += 1
            if curQues < questions.count{
                 questionLabel.text = questions[curQues].quesText
                 completeLabel.text = "Complete: \(curQues + 1)/\(questions.count)"
                 progressBar.progress = Float(curQues + 1) / Float(questions.count)
            
            }else{
                endToBegin()
            }
        }    
     ```    
     
* **`endToBegin()`**    
    -Return to first page when entering into this application;    
    -Use **alert** to pop a text for asking whether user wants to try again;   
    ```swift    
       func endToBegin() {
        
            let alert = UIAlertController(
                            title: "Congratulations!", 
                            message: "Do you want to try again?", 
                            preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes, try again!", style: .default, handler: { _ in
                    self.curQues = 0
                    self.sumScore = 0
                    self.questionLabel.text = self.questions[0].quesText
                    self.completeLabel.text = "Comlete:1/\(self.questions.count)"
                    self.scoreLabel.text = "Score: 0"
                    self.progressBar.progress = 1 / Float(self.questions.count)
           
             }))
        
             self.present(alert, animated: true, completion: nil)
        
       }      
       





<br>


### Weather  
[https://github.com/iii17-grace/ios_Swift/tree/master/Weather](https://github.com/iii17-grace/ios_Swift/tree/master/Weather)    
    
**TODO**   
*       
*              
     
**POINT**    
* **``**    
    -   

* **``**     
    -  
     
**STEP**   
* **``**    
    -   

* **``**  

<br>









 








