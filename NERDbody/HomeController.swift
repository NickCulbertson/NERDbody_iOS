import UIKit

class HomeController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "NERDbody"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(handleSignOut))
        
        let webV    = UIWebView()
        webV.frame  = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        let userLogin = UserDefaults.standard.value(forKey: "userLogin")
        let userPassword = UserDefaults.standard.value(forKey: "userPassword")
        
        
        
        
        let urlString = "http://www.nerdbody.com/login/form?user=\(userLogin ?? "")&pass=\(userPassword ?? "")"
        
        print("my string=",urlString)
        
        
        
        //without password
//        webV.loadRequest(NSURLRequest(url: NSURL(string: "http://www.nerdbody.com")! as URL) as URLRequest)
        
        
        //with password
        if let urlValue = NSURL(string: urlString) {
            webV.loadRequest(NSURLRequest(url: urlValue as URL) as URLRequest)
        }else{
            print("not a url")
            handleSignOut()
            return
        }
        
        //webV.loadRequest(NSURLRequest(url: NSURL(string: urlString)! as URL) as URLRequest)
        
        print("finished!")
        
        webV.delegate = self as? UIWebViewDelegate
        //self.view.addSubview(webV)
        self.view.addSubview(webV)
                _ = webV.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 64, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    
        
    }
    
    func handleSignOut() {
        UserDefaults.standard.setIsLoggedIn(value: false)
        
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
    
}
