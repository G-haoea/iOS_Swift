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
    -First: claim a procotol;    
    -Second: var delegate in selectCityViewController;    
    -Third: Trigger when click change city button - IBAction;    

* **`Dictionary`**    
    -To store some data;    

    
     
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



### etc  
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









 









