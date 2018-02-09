import Foundation

class Network {
    static func makeGetRequest(forUrl url:String,
                               withErrorCallback errorCallback:((_ error:Error?) -> Void)?,
                               andSuccessCallback successCallback:@escaping(_ response:Data) -> Void)
    {
        URLSession.shared.dataTask(with: URL(string: url)!) {(data, response, error ) in
            guard error == nil else {
                errorCallback?(error)
                return
            }
            
            guard let content = data else {
                print("No data")
                return
            }
            
            successCallback(content)
            }.resume()
    }
}
