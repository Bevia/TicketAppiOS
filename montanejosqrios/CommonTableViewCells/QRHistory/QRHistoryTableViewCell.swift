//
//  QRHistoryTableViewCell.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 1/12/23.
//

import UIKit

class QRHistoryTableViewCell: UITableViewCell {
    // You can add UI elements here that you want to display in each cell
    // You can add UI elements here that you want to display in each cell
    var date: UILabel!
    var title: UILabel!
    var event_uuid: UILabel!
    var uuid: UILabel!
    var concept: UILabel!
    var state: UILabel!
    var current_usages: UILabel!
    var available_usages: UILabel!
    var max_usages: UILabel!
    // Add more UI elements as needed

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Initialize and configure your UI elements
        title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(title)
        
        date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(date)
        
        concept = UILabel()
        concept.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(concept)
        
        state = UILabel()
        state.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(state)

        event_uuid = UILabel()
        event_uuid.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(event_uuid)
        
        uuid = UILabel()
        uuid.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(uuid)

        // Add layout constraints for your UI elements
        NSLayoutConstraint.activate([
            
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            date.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            date.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            date.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            concept.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 8),
            concept.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            concept.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            state.topAnchor.constraint(equalTo: concept.bottomAnchor, constant: 8),
            state.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            state.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            event_uuid.topAnchor.constraint(equalTo: state.bottomAnchor, constant: 8),
            event_uuid.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            event_uuid.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
           
            uuid.topAnchor.constraint(equalTo: event_uuid.bottomAnchor, constant: 8),
            uuid.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            uuid.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            uuid.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])

        // Additional configuration for your UI elements (font, color, etc.)
        title.font = UIFont.boldSystemFont(ofSize: 16)
        date.font = UIFont.systemFont(ofSize: 15)
        date.textColor = UIColor.gray
        concept.font = UIFont.systemFont(ofSize: 15)
        concept.textColor = UIColor.gray
        state.font = UIFont.systemFont(ofSize: 14)
        state.textColor = UIColor.gray
        event_uuid.font = UIFont.systemFont(ofSize: 14)
        event_uuid.textColor = UIColor.gray
        uuid.font = UIFont.systemFont(ofSize: 14)
        uuid.textColor = UIColor.gray
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


