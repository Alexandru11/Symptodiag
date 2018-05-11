//
//  ViewController.swift
//  SymptoDiag
//
//  Created by Eduard Radu on 10/05/2018.
//  Copyright © 2018 Alexandru Radu. All rights reserved.
//

import UIKit

class StartController: UIViewController {
    
    @IBOutlet weak var diagnoseButtonOutlet: UIButton!
    
    @IBAction func diagnoseButtonAction(_ sender: UIButton) {
        deployProlog()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func deployProlog() {
        
        var session = NMSSHSession(host: "18.219.108.152", port: 22, andUsername: "ec2-user")
   
        session?.connect()
        if (session!.isConnected){
            session!.authenticate(byPublicKey: "/Users/eduardradu/Documents/LicentaFinal/SymptoDiag/SecurityExpertSystem.pem", privateKey: nil, andPassword: nil)
            if (session!.isAuthorized){
                print("Authentification succeeded")
            }
        }
        var mesaj:String = "mesajul meu predefinit"
        do{
            try mesaj = session!.channel.execute("ll")
        }
        catch {
            print("ceva")
        }
        
        print(mesaj)
        session?.disconnect()
        
        
    }

}

