

import Foundation


class GetMyEventModel {
    
    struct getMyEvent_SuccessModel {
        var api_status :Int
        var my_events :[[String:Any]]
    }
    
    struct getMyEvent_ErrorModel :Codable {
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

extension GetMyEventModel.getMyEvent_SuccessModel{
    init(json :[String:Any]) {
        let apiStatus = json["api_status"] as? Int
        let events = json["my_events"] as? [[String:Any]]
        self.api_status = apiStatus ?? 0
        self.my_events = events ?? [["id" : "1234"]]
    }
}
