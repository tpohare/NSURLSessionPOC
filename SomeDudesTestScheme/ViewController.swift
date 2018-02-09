import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Network.makeGetRequest(forUrl: "https://api.myjson.com/bins/vi56v",
                               withErrorCallback: nil,
                               andSuccessCallback: buildCompanyBag(_:)
        )
    }
    
    private func buildCompanyBag(_ response:Data) {
        let bag:CompanyBag? = try? JSONDecoder().decode(CompanyBag.self, from: response)
        guard let guaranteedBag = bag else { return }
        
        print(guaranteedBag.companies)
    }
}
