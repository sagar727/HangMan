//
//  ViewController.swift
//  Hang [someone]
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var charLabel0: UILabel!
    @IBOutlet weak var charLabel1: UILabel!
    @IBOutlet weak var charLabel2: UILabel!
    @IBOutlet weak var charLabel3: UILabel!
    @IBOutlet weak var charLabel4: UILabel!
    @IBOutlet weak var charLabel5: UILabel!
    @IBOutlet weak var charLabel6: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var lossLabel: UILabel!
    @IBOutlet weak var hangImage: UIImageView!
    
    @IBOutlet var buttonCollection: [UIButton]!

    //public variables to access everywhere
    
    //variable to store guessword
    public var hangWord = ""
    //variable to count six wrong button press
    public var count = 0
    //variable to count wins
    public var winCount = 0
    //variable to count losses
    public var lossCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearUI()
        hangWordSelector()
    }
    
    
    //function to get random word from array
    func hangWordSelector() {
        let wordArray = ["ability", "absence", "academy", "account", "accused", "achieve", "acquire", "address", "advance", "adverse", "advised", "adviser", "against", "airline", "airport", "alcohol", "alleged", "already", "analyst", "ancient", "another", "anxiety", "anxious", "anybody", "applied", "arrange", "arrival", "article", "assault", "assumed", "assured", "attempt", "attract", "auction", "average", "backing", "balance", "banking", "barrier", "battery", "bearing", "beating", "because", "bedroom", "believe", "beneath", "benefit", "besides", "between", "billion", "binding", "brother", "brought", "burning", "cabinet", "caliber", "calling", "capable", "capital", "captain", "caption", "capture", "careful", "carrier", "caution", "ceiling", "central", "centric", "century", "certain", "chamber", "channel", "chapter", "charity", "charlie", "charter", "checked", "chicken", "chronic", "circuit", "classes", "classic", "climate", "closing", "closure", "clothes", "collect", "college", "combine", "comfort", "command", "comment", "compact", "company", "compare", "compete", "complex", "concept", "concern", "concert", "conduct", "confirm", "connect", "consent", "consist", "contact", "contain", "content", "contest", "context", "control", "convert", "correct", "council", "counsel", "counter", "country", "crucial", "crystal", "culture", "current", "cutting", "dealing", "decided", "decline", "default", "defence", "deficit", "deliver", "density", "deposit", "desktop", "despite", "destroy", "develop", "devoted", "diamond", "digital", "discuss", "disease", "display", "dispute", "distant", "diverse", "divided", "drawing", "driving", "dynamic", "eastern", "economy", "edition", "elderly", "element", "engaged", "enhance", "essence", "evening", "evident", "exactly", "examine", "example", "excited", "exclude", "exhibit", "expense", "explain", "explore", "express", "extreme", "factory", "faculty", "failing", "failure", "fashion", "feature", "federal", "feeling", "fiction", "fifteen", "filling", "finance", "finding", "fishing", "fitness", "foreign", "forever", "formula", "fortune", "forward", "founder", "freedom", "further", "gallery", "gateway", "general", "genetic", "genuine", "gigabit", "greater", "hanging", "heading", "healthy", "hearing", "heavily", "helpful", "helping", "herself", "highway", "himself", "history", "holding", "holiday", "housing", "however", "hundred", "husband", "illegal", "illness", "imagine", "imaging", "improve", "include", "initial", "inquiry", "insight", "install", "instant", "instead", "intense", "interim", "involve", "jointly", "journal", "journey", "justice", "justify", "keeping", "killing", "kingdom", "kitchen", "knowing", "landing", "largely", "lasting", "leading", "learned", "leisure", "liberal", "liberty", "library", "license", "limited", "listing", "logical", "loyalty", "machine", "manager", "married", "massive", "maximum", "meaning", "measure", "medical", "meeting", "mention", "message", "million", "mineral", "minimal", "minimum", "missing", "mission", "mistake", "mixture", "monitor", "monthly", "morning", "musical", "mystery", "natural", "neither", "nervous", "network", "neutral", "notable", "nothing", "nowhere", "nuclear", "nursing", "obvious", "offense", "officer", "ongoing", "opening", "operate", "opinion", "optical", "organic", "outcome", "outdoor", "outlook", "outside", "overall", "pacific", "package", "painted", "parking", "partial", "partner", "passage", "passing", "passion", "passive", "patient", "pattern", "payable", "payment", "penalty", "pending", "pension", "percent", "perfect", "perform", "perhaps", "phoenix", "picking", "picture", "pioneer", "plastic", "pointed", "popular", "portion", "poverty", "precise", "predict", "premier", "premium", "prepare", "present", "prevent", "primary", "printer", "privacy", "private", "problem", "proceed", "process", "produce", "product", "profile", "program", "project", "promise", "promote", "protect", "protein", "protest", "provide", "publish", "purpose", "pushing", "qualify", "quality", "quarter", "radical", "railway", "readily", "Reading", "reality", "realize", "receipt", "receive", "recover", "reflect", "regular", "related", "release", "remains", "removal", "removed", "replace", "request", "require", "reserve", "resolve", "respect", "respond", "restore", "retired", "revenue", "reverse", "rollout", "routine", "running", "satisfy", "science", "section", "segment", "serious", "service", "serving", "session", "setting", "seventh", "several", "shortly", "showing", "silence", "silicon", "similar", "sitting", "sixteen", "skilled", "smoking", "society", "somehow", "someone", "speaker", "special", "species", "sponsor", "station", "storage", "strange", "stretch", "student", "studied", "subject", "succeed", "success", "suggest", "summary", "support", "suppose", "supreme", "surface", "surgery", "surplus", "survive", "suspect", "sustain", "teacher", "telecom", "telling", "tension", "theatre", "therapy", "thereby", "thought", "through", "tonight", "totally", "touched", "towards", "traffic", "trouble", "turning", "typical", "uniform", "unknown", "unusual", "upgrade", "upscale", "utility", "variety", "various", "vehicle", "venture", "version", "veteran", "victory", "viewing", "village", "violent", "virtual", "visible", "waiting", "walking", "wanting", "warning", "warrant", "wearing", "weather", "webcast", "website", "wedding", "weekend", "welcome", "welfare", "western", "whereas", "whereby", "whether", "willing", "winning", "without", "witness", "working", "writing", "written"]
        
        let randomNumber = Int.random(in: 0...wordArray.count-1)
        hangWord = wordArray[randomNumber].uppercased()
        print(hangWord)
        wordToChar(word: hangWord)
    }
    
    
    //function to clear all labels for word character
    func clearUI() {
        charLabel0.text = ""
        charLabel1.text = ""
        charLabel2.text = ""
        charLabel3.text = ""
        charLabel4.text = ""
        charLabel5.text = ""
        charLabel6.text = ""
        hangImage.image = UIImage(named: "Hangman_Start")
        count = 0
    }
    
    
    //function to convert word string to character array and then allocate each character to each label
    func wordToChar(word : String){
        let characters = Array(word)
        charLabel0.text = String(characters[0])
        charLabel1.text = String(characters[1])
        charLabel2.text = String(characters[2])
        charLabel3.text = String(characters[3])
        charLabel4.text = String(characters[4])
        charLabel5.text = String(characters[5])
        charLabel6.text = String(characters[6])
        charLabel0.isHidden = true
        charLabel1.isHidden = true
        charLabel2.isHidden = true
        charLabel3.isHidden = true
        charLabel4.isHidden = true
        charLabel5.isHidden = true
        charLabel6.isHidden = true
    }
    
    
    //function to show alert
    func showAlert(title:String,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default) { UIAlertAction in
            self.clearUI()
            self.hangWordSelector()
            
            for button in self.buttonCollection{
                button.backgroundColor = UIColor.white
                button.isEnabled = true
            }
        }
        let noAction = UIAlertAction(title: "No", style: .default){ UIAlertAction in
            for button in self.buttonCollection{
                button.isEnabled = false
            }
        }
        alert.addAction(yesAction)
        alert.addAction(noAction)
        self.present(alert,animated:true,completion:nil)
    }
    
    
    //function to check button with word character
    func charCheck(btnText: String, button: UIButton) {
        if(hangWord.contains(btnText)){
            button.backgroundColor = UIColor.green
            button.isEnabled = false
            if(btnText == charLabel0.text){
                charLabel0.isHidden = false
            }
            if(btnText == charLabel1.text){
                charLabel1.isHidden = false
            }
            if(btnText == charLabel2.text){
                charLabel2.isHidden = false
            }
            if(btnText == charLabel3.text){
                charLabel3.isHidden = false
            }
            if(btnText == charLabel4.text){
                charLabel4.isHidden = false
            }
            if(btnText == charLabel5.text){
                charLabel5.isHidden = false
            }
            if(btnText == charLabel6.text){
                charLabel6.isHidden = false
            }
            if(charLabel0.isHidden == false) &&
                (charLabel1.isHidden == false) &&
                (charLabel2.isHidden == false) &&
                (charLabel3.isHidden == false) &&
                (charLabel4.isHidden == false) &&
                (charLabel5.isHidden == false) &&
                (charLabel6.isHidden == false){
                
                hangImage.image = UIImage(named: "Happy")
                showAlert(title: "Woohoo!", message: "I'm safe! Would you like to play again?")
                
                winCount += 1
                winLabel.text = String(winCount)
            }
        }else{
            button.backgroundColor = UIColor.red
            button.isEnabled = false
            count += 1
            switch count{
            case 1:
                hangImage.image = UIImage(named: "Head")
            case 2:
                hangImage.image = UIImage(named: "Body")
            case 3:
                hangImage.image = UIImage(named: "Right_Hand")
            case 4:
                hangImage.image = UIImage(named: "Left_Hand")
            case 5:
                hangImage.image = UIImage(named: "Right_Leg")
            case 6:
                hangImage.image = UIImage(named: "Sad")
                lossCount += 1
                lossLabel.text = String(lossCount)
                count = 0
                showAlert(title: "Sorry", message: "The correct word was \(hangWord). Would you like to play again?")
            default:
                hangImage.image = UIImage(named: "Hangman_Start")
            }
        }
    }
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        let buttonText = (sender.titleLabel?.text) ?? ""
        charCheck(btnText: buttonText, button: sender)
    }
}

