//
//  ViewController.swift
//  scrollViewApp
//
//  Created by Mobioapp on 12/7/17.
//  Copyright © 2017 Mobioapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var pageControll: UIPageControl!
    var contentWidth:CGFloat=0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.delegate=self
        setupScrollView()
    }
    
    func setupScrollView() {
        for image in 0...3{
            let imageToDisplay=UIImage(named:"\(image).jpeg")
            let imageView=UIImageView(image:imageToDisplay)
            let  xCoordinate = view.frame.midX+view.frame.width*CGFloat(image)
            contentWidth += view.frame.width
            scrollView.addSubview(imageView)
            imageView.frame=CGRect(x:xCoordinate - 50 ,y:(view.frame.height/2)-50, width:100, height:100)
        }
        
        scrollView.contentSize=CGSize(width:contentWidth ,height:view.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        pageControll.currentPage=Int(scrollView.contentOffset.x/CGFloat(420))
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

