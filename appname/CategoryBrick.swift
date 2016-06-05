//
//  CategoryBrick.swift
//  awesomeswift
//
//  Created by Matteo Crippa on 02/06/2016.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import LeeGo
import UIKit

enum AwesomeCategoryBrick: BrickBuilderType {
    case Title, Description

    case Category

    static let reuseIdentifiers = [Category].map { component -> String in
        return component.brickName
    }

    static let brickClass: [AwesomeCategoryBrick: AnyClass] = [
        Title: UILabel.self,
        Description: UILabel.self
    ]
}

extension AwesomeCategoryBrick {
    func brick() -> Brick {
        switch self {
        case .Title:
            return build().style(Style.titleBasicStyle)
        case .Description:
            return build().style(Style.descriptionBasicStyle)
        case .Category:
            return build()
                .style([.backgroundColor(UIColor.whiteColor())])
                .bricks(
                    Title.brick(),
                    Description.brick()
                ) {
                    (Title, Description) in
                    Layout([
                        "V:|-8-[\(Title)]-8-[\(Description)]-8-|",
                        "H:|-8-[\(Title)]-8-|",
                        "H:|-8-[\(Description)]-8-|"
                        ])
            }
        }
    }
}
