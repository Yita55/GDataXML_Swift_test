import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let label:UILabel = UILabel(frame:CGRectMake(100, 100,300,100));
        label.text = "output result to consle ... "
        self.view.addSubview(label)

        testXML()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testXML() {

        let path = NSBundle.mainBundle().pathForResource("users", ofType:"xml")

        let xmlData = NSData(contentsOfFile:path!)

        let doc:GDataXMLDocument = try! GDataXMLDocument(data:xmlData, options : 0)
        
        let users = try! doc.nodesForXPath("//User", namespaces:nil) as! [GDataXMLElement]
        
        for user in users {
        
            let uid = user.attributeForName("id").stringValue()
        
            let nameElement = user.elementsForName("name")[0] as! GDataXMLElement
        
            let uname =  nameElement.stringValue()
        
            let telElement = user.elementsForName("tel")[0] as! GDataXMLElement
        
            let mobile = (telElement.elementsForName("mobile")[0] as! GDataXMLElement).stringValue()
        
            let home = (telElement.elementsForName("home")[0] as! GDataXMLElement).stringValue()
            
            print("User: uid:\(uid) uname:\(uname) mobile:\(mobile) home:\(home)")
        }
    }
}

