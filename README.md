# ios_Swift
The process of learning ios development.
* `var indexL: Int = 0`:claim a variable with **Int**;  

* `indexL = Int.random(in:1...6)`: generate a random **Int** from 1 to 6 by "...";  

*  `print(indexL)`: when running the project, check whether the action did as the code shows in console by print;  

* `var str = "hello"`: if the variable can be clearly recognised after "=", it don't need to claim the variable as the first line shows, the same as `var indexL = 0`;  

* **command delete**: when move the mouse on the last of current line, it can delete the whole line;  

* **command shift enter**: when open a **background** not **create a project** on Xcode, can run the pure code without UIview or simulator;  

* `let name = "grace"`: is same as **final string**, the value of which **let** claims cannot be changed = cannot **assign** to value that 'name' is **constant**, it needs less and less and less storage than ordinary variables;   
  so we can claim the variable as **let** at the beginning, if we need to change its value, then change it;      

* `let fullName = "\(name) liu"`: "name" is another varible with let which contains the value of "grace";

* `let flag: Bool = false`: **Bool** not boolean;  

* `let mini = 3.14`: will be **double**, because it will directly recognise it as double, but if we do not know the details of this variable, we should claim **double** though;    

* `diceImageViewL.image = UIImage(named = "dice-\(indexL)": change diceimageViewL's imageView into dice-X;   

* `let diceArray = ["dice-1", "dice-2", "dice-3", "dice-4", "dice-5", "dice-6"]`: an array with String;   
  `diceImageViewL.image = UIImage(named = diceArray[indexL]`;   

* `func methodName() {}`: claim a function;   

* `override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {code}`: Tells the receiver that a motion event has ended.  
   motion:   
   An event-subtype constant indicating the kind of motion. A common motion is shaking, which is indicated by UIEvent.EventSubtype.motionShake. 
    
   event:   
   An object representing the event associated with the motion. 

* `print()`;   

* hard code: e.g. print(1x) can only print 1x, cannot print 2x, so it is hard code;   
  if we want to print 2x/3x, etc. use the parameter in the method();  

* `func getMilk (nums: Int, total: Int) {}`: think more than twice about the license of the parameters -> nums: Int;   
  then in the func{`print(\(nums))`}  or   `print("buy \(nums) bottles of milk")  pay attention to **\(nums)**;  
  use it: `let rest = getMilk(nums: 2, total: 100)` ;  
 

* `func getMilk (nums: Int) -> Int {return 0}`: the format for return variable is **->Int**;  

* `func textSimilar (herName: String, hisName: String) -> String {}`has if-else then  
  `if nums > 80 {  
   }else if nums > 40 && nums <=80{   
   }else{  
   }`;  

* `round(double)`: focus on a double variable value into 4cut5add **BUT** will return a double as well like 22 
**.0**;   

* `pow(2, 3)`: 2^3 = 2x2x2;  

* `let nums = [1,2,7,4,3]`  
  `for num in nums {print(num)}`: will print 1,2,7,4,3 is the same as for(int item:arrayName){} in java;   
  the basic principle is: let num = nums[0], then print num;    then let num = nums[1], print num;  then...;   

* `for num in 1...10{}`: is the same as for(int i=0; i<=10; i++){};  
  `1..<10`: 10 is open, so the range is 1-9;  
  `1>..10`: 1 is open, so the range is 2-10;  

* `for i in 1...10 where i % 2 == 0 {print(i) or  print("now has \(i)")}`: will print 2,4,6,8,10 is same as for(int i=1; i<=10; i++) {if i % 2 == 0   print(i) };   
  (pay attention:`print("has \(i-1) iphones")`

* `(1...10).reversed()`: change 1->10 into 10->1;  

* `func calSong (howmany total: Int) {}` -> `calSong(howmany: 10)` -> **howmany** is the name to use, but **total** is the name to run in the code, it is gurantee the frequency of different meaning of function target (which is focus on foreigner? anyway, don't mention it);  
  **So** it will leads to:  
  when `func calSong (_ total: Int){}` -> `calSong(10)` -> we don't need to write variable name in calSong method when want to use it, but it is mostly used in original apple documental;    
 

* `@IBAction func touchKeys (_ sender: UIBotton) {}`: the first "_" is the meaning of null parameter outside method which we have mentioned before, like the parameter which we use it on the process of using the method and gave a name of parameter;   
  **sender** means the object which send this command, UIButton shows the sender is a UIBotton, it is the same as `@IBOutlet weak var btn: UIButton`, the sender is the **btn** in some of the meanings;   

* `if send.tag == 1 {}`  

* `import Foundation`is everything we can use in the .swift, which after we created a .swift file it will appear;  

* `import UIKit` is a more bigger package than **Foundation**, it contains Foundation;  

* initialise a class:  
```swift
  init(text: String, ans: Bool) {
       quesText = text
       quesAns = ans
  }    
```
* judge:  
```swift
var name = (flag ? "yes" : "no")
```
* `nil` is the same as `null` in java/c/etc.  

* int to string:   `String(IntVariableName)`   
  string to int:   `Int(StringVariableName)`   

* set button's corner:  
  `layer.cornerRadius - Number - 23`   

* set label's corner:
  as what done as button's, then **clip to bounds**  

* **control + option + command + enter**: open assistant on right;  

* **command = **: let the text in label can fit into the content;  

* **stack view**  

* only stack view has hug and compress, we should set the priority of these two properties, to avoid the condition that when the width of stack view has been confirmed, how to deal with the priority of two horizontal labels (high number has high priority);  

* **constraint to margin**: all setting is for **margin**;  

* four elements for confirming a thing on storyboard: x/y/width/height;   

* **Multipller** means the radio of self:superView(or other element);  

* **Autoshrink**: shrink the font as what you wanted, like minimum font size or minimum font scale;  

* **enum**:   
  ```swift
  enum Type{
       case apple
       case orange
       case banana
  }
  var type = Type.banana
  //var type:Type = .banana

* a non-parameter constructor:  
```swift
  convenience init(){
       init(name: "hello", seats: 2, type: .sports)
  }
or
  convenience init(name: String){
       init(name: "hello", seats: 2, type: .sports)
  }
```
Then we can use two approaches to init;

* inherit:  
```swift
   class Tesla:Car{
}
```
Tesla is son, Car is father   

* Override:  
```swift
   class fish:animal{
       override func breathe (){
             super.breathe()
             //do sth. here
       }
  }   
```   

* **optional**like ? or !:  
  `var destination:String?` -> at the beginning, there is no initialise value for it;   

* if we want to use destination into print which we have mention above, we need to use `destination!` as a **wrap action **or `nil`;  
  (but if we have not give destination a value, we print it, the code will crush, because there is no value for destination, but we try to **wrap** which means forced to figure out "?")   

*  how can we use destination? as a code:**iflet**   
```swift
   if let dest = destination{ 
        print(dest)
   }
```    
   so we don't need to use destination! every time;

* 







 








