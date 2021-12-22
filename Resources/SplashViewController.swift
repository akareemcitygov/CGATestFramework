//
//  SplashViewController.swift
//  CGA
//
//  Created by Abdul Kareem on 12/14/21.
//
//
import UIKit

public class SplashViewController: UIViewController {

    @IBOutlet public var label: UILabel!
    
    public init() {
        super.init(nibName: "SplashViewController", bundle: Bundle(for: SplashViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
