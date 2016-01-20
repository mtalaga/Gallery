//
//  GalleryViewController.swift
//  Gallery
//
//  Created by Michal on 07.12.2015.
//  Copyright © 2015 Michal. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UIPageViewControllerDataSource {

    var images = [String]()
    var currentImage: Int = 0
    var pageViewController: UIPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageViewController = storyboard!.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        pageViewController.dataSource = self
        let start = chooseViewController(currentImage) as PhotoViewController
        let controllers = NSArray(object: start)
        pageViewController.setViewControllers(controllers as? [UIViewController], direction: .Forward, animated: true, completion: nil)
        pageViewController.view.frame = CGRectMake(0, 30, self.view.frame.width, self.view.frame.height)
        
        self.addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view)
        pageViewController.didMoveToParentViewController(self)
        
    }
    
    func chooseViewController(index: Int) -> PhotoViewController
    {
        let viewContoller: PhotoViewController = storyboard!.instantiateViewControllerWithIdentifier("PhotoViewController") as! PhotoViewController
        
        viewContoller.imageName = images[index]
        viewContoller.index = index
        
        return viewContoller
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        let vc = viewController as! PhotoViewController
        var index = vc.index as Int
        if (index == 0 || index == NSNotFound)
        {
            return nil
        }
        index--
        return self.chooseViewController(index)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! PhotoViewController
        var index = vc.index as Int
        
        if (index == NSNotFound)
        {
            return nil
        }
        index++
        if (index == self.images.count)
        {
            return nil
        }
        
        return self.chooseViewController(index)
    }
    

    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
    
        return images.count
    }

    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
        }

}
