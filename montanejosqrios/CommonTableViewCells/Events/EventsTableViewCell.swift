//
//  CustomTableViewCell.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 23/11/23.
//

import UIKit

class EventsTableViewCell: UITableViewCell {
    var uuid: UILabel!
    // Add more UI elements as needed

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Initialize and configure your UI elements
        uuid = UILabel()
        uuid.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(uuid)

        // Add layout constraints for your UI elements
        NSLayoutConstraint.activate([
            uuid.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            uuid.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            uuid.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            uuid.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])

        // Additional configuration for your UI elements (font, color, etc.)
        uuid.font = UIFont.systemFont(ofSize: 14)
        uuid.textColor = UIColor.gray
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

