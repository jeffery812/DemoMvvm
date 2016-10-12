//
//  ReactiveViewController.swift
//  DemoMvvm
//
//  Created by Zhihui Tang on 2016-10-12.
//  Copyright © 2016 Zhihui Tang. All rights reserved.
//

import UIKit
import RxSwift

class ReactiveViewController: UIViewController {
    var cars: Variable<[CarViewModel]> = Variable((UIApplication.sharedApplication().delegate as! AppDelegate).cars)
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.estimatedRowHeight = 80
        
        cars.asObservable().bindTo(tableView.rx_itemsWithCellIdentifier("CarCell", cellType: CarTableViewCell.self)) { (index, carViewModel: CarViewModel, cell) in
            cell.carViewModel = carViewModel
        }.addDisposableTo(disposeBag)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
