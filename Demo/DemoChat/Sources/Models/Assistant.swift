//
//  Conversation.swift
//  DemoChat
//
//  Created by Sihao Lu on 3/25/23.
//

import Foundation
import OpenAI

struct Assistant: Hashable {
    init(id: String, name: String, description: String? = nil, instructions: String? = nil, codeInterpreter: Bool, retrieval: Bool, fileIds: [String]? = nil, funcJson: ChatFunctionDeclaration?) {
        self.id = id
        self.name = name
        self.description = description
        self.instructions = instructions
        self.codeInterpreter = codeInterpreter
        self.retrieval = retrieval
        self.fileIds = fileIds
        self.funcJson = funcJson
    }
    
    typealias ID = String
    
    let id: String
    let name: String
    let description: String?
    let instructions: String?
    let fileIds: [String]?
    let funcJson: ChatFunctionDeclaration?
    var codeInterpreter: Bool
    var retrieval: Bool
}

extension Assistant: Equatable, Identifiable {}
