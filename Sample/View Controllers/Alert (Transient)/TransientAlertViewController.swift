//
//  TransientAlertViewController.swift
//  PanModal
//
//  Created by Stephen Sowole on 3/1/19.
//  Copyright © 2019 Detail. All rights reserved.
//

import UIKit

class TransientAlertViewController: AlertViewController {

    private var timer: Timer?
    private var countdown: Int = 5

    override func viewDidLoad() {
        super.viewDidLoad()
        alertView.titleLabel.text = "Transient Alert"
        updateMessage()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startTimer()
    }

    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TransientAlertViewController.updateMessage), userInfo: nil, repeats: true)
    }

    @objc func updateMessage() {
        countdown -= 1
        guard countdown > 0 else {
            invalidateTimer()
            dismiss(animated: true, completion: nil)
            return
        }
        alertView.message.text = "Message disppears in \(countdown) seconds"
    }

    func invalidateTimer() {
        timer?.invalidate()
    }

    deinit {
        invalidateTimer()
    }

    // MARK: - Pan Modal Presentable

    override var showDragIndicator: Bool {
        return false
    }

    override var anchorModalToLongForm: Bool {
        return true
    }

    override var backgroundAlpha: CGFloat {
        return 0.0
    }

    override var isUserInteractionEnabled: Bool {
        return false
    }
}
