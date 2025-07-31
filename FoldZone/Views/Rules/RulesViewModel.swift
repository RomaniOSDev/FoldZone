//
//  RulesViewModel.swift
//  CardInfoTreining
//
//  Created by Роман Главацкий on 30.07.2025.
//

import Foundation

final class RulesViewModel: ObservableObject {
    @Published var simpleRules: Rules = .objective
    @Published var isPresented: Bool = false
    
    func tapOnRules(rules: Rules){
        simpleRules = rules
        isPresented.toggle()
    }
}

enum Rules: CaseIterable {
    case objective
    case hand
    case betting
    case blinds
    case game
    case winning
    
    var image: ImageResource {
        switch self {
            
        case .objective:
            return .objective
        case .hand:
            return .hand
        case .betting:
            return .betting
        case .blinds:
            return .blinds
        case .game:
            return .game
        case .winning:
            return .winning
        }
    }
    
    var description: String {
        switch self {
            
        case .objective:
            return "The goal of Texas Hold'em is to win chips by forming the strongest five-card hand — or by making your opponents fold. Each player is dealt two private cards (“hole cards”), and up to five community cards are revealed during the hand. You use any combination of the seven available cards to make the best hand. Victory comes through strategy, patience, and smart decision-making — not just luck."
        case .hand:
            return "Poker hands are ranked from strongest to weakest. Knowing these is essential:\n• Royal Flush: A♠ K♠ Q♠ J♠ 10♠\n• Straight Flush: Five cards in sequence, same suit\n• Four of a Kind: Four cards of the same rank\n• Full House: Three of a kind + a pair\n• Flush: Five cards of the same suit\n• Straight: Five cards in sequence, different suits\n• Three of a Kind\n• Two Pair\n• One Pair\nHigh Card: No combination, just your highest card\nUnderstanding hand strength is key to reading the board and your opponent."
        case .betting:
            return "💰 BETTING OPTIONS:\n• Fold: Discard your hand and lose any chips you’ve placed.\n• Call: Match the current bet amount placed by your opponents.\n• Raise: Increase the bet amount. You must increase the bet by at least one chip.\n• Check: Do not bet. You must still place a chip if any other player has bet.\nStrategic betting is at the heart of poker — it's not just about the cards, but how you play them."
        case .blinds:
            return "🔄 BLINDS & DEALER\nThe game begins with two players, known as the blinds, who are required to place bets before the cards are dealt.\n• The dealer button is usually to the dealer’s left.\n• The first player to the dealer’s left places the small blind, which is usually half the current buy-in.\n• The second player to the dealer’s left places the big blind, which is usually one or two times the small blind amount."
        case .game:
            return "Each hand of Texas Hold’em unfolds in multiple stages:\n1. Pre-Flop – After players receive their two hole cards.\n2. Flop – The dealer reveals 3 community cards.\n3. Turn – A 4th community card is dealt.\n4. River – The 5th and final community card.\n5. Showdown – If more than one player remains, cards are revealed and the best hand wins.\nAt each stage, players can fold, call, raise, or check, depending on the action."
        case .winning:
            return "🏆 WINNING\nThere are two main ways to win a hand in poker:\n1. Showdown – You reach the end of the hand and show the strongest five-card combination.\n2. Folding – All other players fold to your bet or raise.\nGood players don’t wait for great cards. They win with smart folds, aggressive bets, and reading their opponents."
        }
    }
}
