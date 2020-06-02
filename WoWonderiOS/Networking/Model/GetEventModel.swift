

import Foundation

class GetEventModel {
    
    struct getEvent_SuccessModel {
        var api_status :Int
        var events :[[String:Any]]
    }
    
    struct getEvent_ErrorModel :Codable {
        let apiStatus: String
        let errors: Errors
        enum CodingKeys: String, CodingKey {
            case apiStatus = "api_status"
            case errors
        }
    }
    // MARK: - Errors
    struct Errors: Codable {
        let errorID: Int
        let errorText: String
        
        enum CodingKeys: String, CodingKey {
            case errorID = "error_id"
            case errorText = "error_text"
        }
    }
}

extension GetEventModel.getEvent_SuccessModel{
    
    init(json :[String:Any]) {
        let apiStatus = json["api_status"] as? Int
        let events = json["events"] as? [[String:Any]]
        self.api_status = apiStatus ?? 0
        self.events = events ?? [["id" : "1234"]]
    }
}
