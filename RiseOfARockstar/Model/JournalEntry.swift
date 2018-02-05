//
//  JournalEntry.swift
//  RiseOfARockstar
//
//  Created by Charles Ferreira on 04/02/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation

enum JournalEntry {
    
    case newGame
    case gig(venue: Venue, firstTime: Bool)
    case newGuitar(ShopItem)
    
    func toString() -> String {
        switch self {
        case .newGame:
            return "Hoje começa minha jornada rumo ao sucesso. Meu sonho é ser um rockstar e, agora que consegui minha primeira guitarra, vou mostrar para todos o meu talento!"
            
        case .gig(let venue, let firstTime):
            if firstTime {
                let random = arc4random_uniform(2)
                switch random {
                case 0:
                    return "Mais um dia de trabalho. Acho que preciso treinar um pouco mais na escola. Vamos que vamos!"
                default:
                    return "Hoje foi um bom dia. Rendeu algumas gorjetas para a cerveja no final do dia."
                }
            }
            
            switch venue.requiredStars {
            case 1:
                return "Minha primeira apresentação. Toquei com a galera na pista de skate. Sinto que serei um sucesso!"
            case 2:
                return "Primeira apresentação para um público um pouco maior, no Bar do Tadeu. As gorjetas estão ficando mais gordas! Oh yeah!"
            case 3:
                return "Cara! Fui com uns amigos na rua XV tirar um som, e foi alucinante! Já tenho alguns fãs pela cidade."
            case 4:
                return "Primeira noite no John Bull. Tocamos a noite inteira e a galera pirou!"
            default:
                return "O dia com que eu mais sonhei: tocar na Pedreira. O palco dos rockstars! Meu senti o Deus do Rock. Foi muito massa!"
            }
            
        case .newGuitar(let guitar):
            let random = arc4random_uniform(2)
            switch random {
            case 0:
                return "Dei um upgrade na minha guita. Comprei uma \(guitar.brand) \(guitar.model)! Sinto o cheiro do sucesso se aproximando."
            default:
                return "Cada vez mais profissa! Agora com uma \(guitar.brand) \(guitar.model), pronta pra arrasar."
            }
        }
    }
    
}
