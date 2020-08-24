//
//  BlueController.swift
//  Toast
//
//  Created by Олег Романов on 26.07.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import SPAlert
import UIKit

final class OnboardingController: UIViewController {
    // MARK: - Properties

    lazy var customView: OnboardingView = OnboardingView()

    // MARK: - Life cycle

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addActionHandlers()
        loadSlides()
    }

    private func loadSlides() {
        let data = Slide.generateSlides()
        customView.updateData(data)
    }

    // MARK: - Action handlers

    private func addActionHandlers() {
        customView.skipButton.addTarget(
            self, action: #selector(skipButtonClicked), for: .touchUpInside
        )
        customView.nextButton.addTarget(
            self, action: #selector(nextButtonClicked), for: .touchUpInside
        )
    }

    @objc private func nextButtonClicked() {
        if customView.getIsLastPage() {
            showPersons()
        } else {
            customView.nextPage()
        }
    }

    @objc private func skipButtonClicked() {
        showPersons()
    }

    // MARK: - Private Methods

    private func showPersons() {
        let navigationController = UINavigationController(rootViewController: PersonsContoller())
        navigationController.navigationBar.prefersLargeTitles = true
        AppDelegate.shared?.window?.rootViewController = navigationController
    }
}
