//
//  RegisterDeviceEventsTableViewCell.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 27/11/23.
//

import UIKit

class DeviceTableViewCell: UITableViewCell {
    // You can add UI elements here that you want to display in each cell
    // You can add UI elements here that you want to display in each cell
    var nameLabel: UILabel!
    var eventNameLabel: UILabel!
    var uuid: UILabel!
    // Add more UI elements as needed

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Initialize and configure your UI elements
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)

        eventNameLabel = UILabel()
        eventNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(eventNameLabel)
        
        uuid = UILabel()
        uuid.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(uuid)

        // Add layout constraints for your UI elements
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            eventNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            eventNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            eventNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
           
            uuid.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor, constant: 8),
            uuid.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            uuid.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            uuid.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])

        // Additional configuration for your UI elements (font, color, etc.)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        eventNameLabel.font = UIFont.systemFont(ofSize: 14)
        eventNameLabel.textColor = UIColor.gray
        uuid.font = UIFont.systemFont(ofSize: 14)
        uuid.textColor = UIColor.gray
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


