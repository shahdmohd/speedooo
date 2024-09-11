import UIKit

class CustomPresentationController: UIPresentationController {
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else {
            return .zero
        }
        let height: CGFloat = 300
        return CGRect(x: 0, y: containerView.bounds.height - height, width: containerView.bounds.width, height: height)
    }
    
    override func presentationTransitionWillBegin() {
        guard let containerView = containerView else { return }
        
        // Add a dimming view
        let dimmingView = UIView(frame: containerView.bounds)
        dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        dimmingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        containerView.addSubview(dimmingView)
        
        // Set initial alpha of the dimming view
        dimmingView.alpha = 0
        
        // Animate the dimming view's appearance
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                dimmingView.alpha = 1
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.3) {
                dimmingView.alpha = 1
            }
        }
    }
    
    override func dismissalTransitionWillBegin() {
        if let dimmingView = containerView?.subviews.first {
            if let coordinator = presentedViewController.transitionCoordinator {
                coordinator.animate(alongsideTransition: { _ in
                    dimmingView.alpha = 0
                }, completion: { _ in
                    dimmingView.removeFromSuperview()
                })
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    dimmingView.alpha = 0
                }) { _ in
                    dimmingView.removeFromSuperview()
                }
            }
        }
    }
}
