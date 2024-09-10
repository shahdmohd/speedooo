//
//  DemoViewController.swift
//  try
//
//  Created by 1234 on 10/09/2024.
//

import UIKit

class DemoViewController: UIPageViewController {

    
    //MARK: -Attributes
    var pages = [UIViewController]()
    
    let skipButton = UIButton()
    let nextButton = UIButton()
    let pageControl = UIPageControl()
    let initialPage = 0
    
    var pageControlBottomAnchor: NSLayoutConstraint?
    var skipButtonTopAnchor: NSLayoutConstraint?
    var nextButtonTopAnchor: NSLayoutConstraint?
    
    
    
    //MARK: - lifeCycle function

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()

    }
    
}


//MARK: - 1st EXTENSION

    extension DemoViewController {
        //MARK: - setupfunction

        func setup(){
            dataSource = self
            delegate = self
            
            pageControl.addTarget(self, action: #selector(PageControlTapped(_:)), for: .valueChanged)
            
            let page1 = onboardingViewController(imageName: "error404", titleText: "Welcome", subtitleText: "Hello"
            )
            let page2 = onboardingViewController(imageName: "fast-loading", titleText: "Welcome", subtitleText: "Hello"
            )
            let page3 = onboardingViewController(imageName: "error404", titleText: "Welcome", subtitleText: "Hi"
            )
            let page4 = VC2()
            pages.append(page1)
            pages.append(page2)
            pages.append(page3)
            pages.append(page4)

            setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
        }
        
        
        //MARK: - style function

        func style(){
            pageControl.translatesAutoresizingMaskIntoConstraints = false
            pageControl.currentPageIndicatorTintColor = .black
            pageControl.pageIndicatorTintColor = .systemGray2
            pageControl.numberOfPages = pages.count
            pageControl.currentPage = initialPage
    }
        //MARK: - layout function -> for constraints

        func layout(){
            view.addSubview(pageControl)
            
            NSLayoutConstraint.activate([
                pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
                pageControl.heightAnchor.constraint(equalToConstant: 20),
                view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 1)
            ])
    }
}



//MARK: - 2nd EXTENSION

extension DemoViewController {
    @objc func PageControlTapped(_ sender: UIPageControl){
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
    }
 }


//MARK: - 3rd EXTENSION for DataSource
    // orevious screen
extension DemoViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else{return nil}
        if currentIndex == 0 {
            return pages.last // wrap to last
        }else {
            return pages[currentIndex - 1] // go to previous
        }
        
    }
    // Next Page
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else{return nil}
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1] // Go to next
        }else {
            return pages.first // wrap to first
        }
    }
    
    
}

 
//MARK: - 4th EXTENSION for Delegates
extension DemoViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewControllers = pageViewController.viewControllers else {return}
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else {return}
        
        pageControl.currentPage = currentIndex

    }
}
