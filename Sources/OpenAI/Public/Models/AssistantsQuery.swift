//
//  AssistantsQuery.swift
//  
//
//  Created by Chris Dillard on 11/07/2023.
//

import Foundation

public struct AssistantsQuery: Codable {

    public let model: Model

    public let name: String

    public let description: String

    public let instructions: String

    public let tools: [Tool]?

    public let fileIds: [String]?

    enum CodingKeys: String, CodingKey {
        case model
        case name
        case description
        case instructions
        case tools
        case fileIds = "file_ids"
    }
    
    public init(model: Model, name: String, description: String, instructions: String, tools: [Tool], fileIds: [String]? = nil) {
        self.model = model
        self.name = name

        self.description = description
        self.instructions = instructions

        self.tools = tools
        self.fileIds = fileIds
    }
}

public struct Tool: Codable, Equatable {
    public let toolType: String
    public let funcJson: ChatFunctionDeclaration?

    enum CodingKeys: String, CodingKey {
        case toolType = "type"
        case funcJson = "function"
    }
    
    public static func == (lhs: Tool, rhs: Tool) -> Bool {
        return lhs.toolType == rhs.toolType
    }

    public init(toolType: String, funcJson: ChatFunctionDeclaration?) {
        self.toolType = toolType
        self.funcJson = funcJson
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        toolType = try values.decode(String.self, forKey: .toolType)
        funcJson = try? values.decode(ChatFunctionDeclaration.self, forKey: .funcJson)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(toolType, forKey: .toolType)
        guard let jsonObject = funcJson else { return }
        try container.encode(jsonObject, forKey: .funcJson)
    }

}
