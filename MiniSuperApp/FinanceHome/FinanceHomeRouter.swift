import ModernRIBs
import Darwin

protocol FinanceHomeInteractable: Interactable, SuperPayDashBoardListener {
    var router: FinanceHomeRouting? { get set }
    var listener: FinanceHomeListener? { get set }
}

protocol FinanceHomeViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func addDashboard(_ view: ViewControllable)
}

final class FinanceHomeRouter: ViewableRouter<FinanceHomeInteractable, FinanceHomeViewControllable>, FinanceHomeRouting {
    
    private let superPayDashBoardBuildable: SuperPayDashBoardBuildable
    private var superPayRouting: Routing?
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: FinanceHomeInteractable,
         viewController: FinanceHomeViewControllable,
         superPayDashBoardBuildable: SuperPayDashBoardBuildable
    ) {
        self.superPayDashBoardBuildable = superPayDashBoardBuildable
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachSuperPayDashBoard() {
        if superPayRouting != nil {
            return
        }
        
        let router = superPayDashBoardBuildable.build(withListener: interactor)
        let dashboard = router.viewControllable
        viewController.addDashboard(dashboard)
        
        self.superPayRouting = router
        attachChild(router)
        
    }
}
