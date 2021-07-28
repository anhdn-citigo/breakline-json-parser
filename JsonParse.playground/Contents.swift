import UIKit



class UserElement: Codable {
    let id, senderID, senderName, pageID: String?
    let message: String?
    

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case senderID = "SenderId"
        case senderName = "SenderName"
        case pageID = "PageId"
        case message = "Message"
        
    }

    init(id: String?, senderID: String?, senderName: String?, pageID: String?, message: String?, timeStamp: Int?, type: String?, state: Int?, hasPhone: Bool?, hasEmail: Bool?, postID: String?, lastSenderID: String?, commentFromLiveVideo: Bool?, resolved: Int?) {
        self.id = id
        self.senderID = senderID
        self.senderName = senderName
        self.pageID = pageID
        self.message = message
    }
}

do {
    guard let fileUrl = Bundle.main.url(forResource: "data", withExtension: "json") else { fatalError() }
    let jsonData = try! Data(contentsOf: fileUrl)
    let datastring = String(data: jsonData, encoding: .utf8)
    let userElement = try? JSONDecoder().decode(UserElement.self, from: jsonData)
    print(userElement?.message ?? "???")
    print(userElement)
} catch {
    print(error)
}


