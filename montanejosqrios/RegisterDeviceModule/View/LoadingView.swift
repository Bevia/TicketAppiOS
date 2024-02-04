//
//  LoadingView.swift
//  montanejosqrios
//
//  Created by Vincent Bevia on 5/12/23.
//

import UIKit

class LoadingView: UIView {

    var activityIndicator: UIActivityIndicatorView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLoadingView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLoadingView()
    }

    private func setupLoadingView() {
        // Create an activity indicator
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .black
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()

        // Add the activity indicator to the center of the view
        addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        // Customize the background color or other properties of the loading view
        backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        layer.cornerRadius = 10
    }
}

