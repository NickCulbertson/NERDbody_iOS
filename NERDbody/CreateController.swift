import UIKit

class CreateController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Join NERDbody"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log In", style: .plain, target: self, action: #selector(handleSignOut))
        
        let webV    = UIWebView()
        webV.frame  = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        webV.loadRequest(NSURLRequest(url: NSURL(string: "http://nerdbody.com/#SignUp")! as URL) as URLRequest)
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
