import ModernRIBs

protocol FinanceHomeDependency: Dependency {
}

final class FinanceHomeComponent: Component<FinanceHomeDependency>,
                                  SuperPayDashBoardDependency {
    
    var balance: ReadOnlyCurrentValuePublisher<Double> { balancePublisher }
    private let balancePublisher: CurrentValuePublisher<Double>
    
    init(dependency: FinanceHomeDependency,
         balancePublisher: CurrentValuePublisher<Double>) {
        self.balancePublisher = balancePublisher
        super.init(dependency: dependency)
    }
}

protocol FinanceHomeBuildable: Buildable {
    func build(withListener listener: FinanceHomeListener) -> FinanceHomeRouting
}

final class FinanceHomeBuilder: Builder<FinanceHomeDependency>, FinanceHomeBuildable {
    
    override init(dependency: FinanceHomeDependency) {
        super.init(dependency: dependency)
    }
    
    func build(withListener listener: FinanceHomeListener) -> FinanceHomeRouting {
        let balancePublisher = CurrentValuePublisher<Double>(10000)
        let component = FinanceHomeComponent(dependency: dependency,
                                             balancePublisher: balancePublisher)
        let viewController = FinanceHomeViewController()
        let interactor = FinanceHomeInteractor(presenter: viewController)
        interactor.listener = listener
        
        let superPayDashBoarBuilder = SuperPayDashBoardBuilder(dependency: component)
        
        
        return FinanceHomeRouter(
            interactor: interactor,
            viewController: viewController,
            superPayDashBoardBuildable: superPayDashBoarBuilder
        )
    }
}
