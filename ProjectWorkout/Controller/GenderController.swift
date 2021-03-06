//
//  GenderController.swift
//  ProjectWorkout
//
//  Created by Michael Zeng on 9/23/18.
//  Copyright © 2018 Michael Zeng. All rights reserved.
//

import Foundation
import UIKit

class GenderController: UIViewController {
    
    fileprivate var maleWidthAnchorA: NSLayoutConstraint?
    fileprivate var femaleWidthAnchorA: NSLayoutConstraint?
    fileprivate var maleWidthAnchorB: NSLayoutConstraint?
    fileprivate var femaleWidthAnchorB: NSLayoutConstraint?
    
    let titleSize: CGFloat = 0
    let buttonSize: CGFloat = 0
    
    let appNameLabel: UILabel = {
        let label = UILabel()
//        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        var size: CGFloat = 0
        if UIDevice.current.userInterfaceIdiom == .pad {
            size = 70
        } else {
            size = 60
        }
        label.attributedText = "20 Second Workouts".convertToNSAtrributredString(size: size, color: UIColor.rgb(red: 255, green: 245, blue: 232))
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let maleLabel: UIButton = {
        let maleOption = UIButton()
        maleOption.translatesAutoresizingMaskIntoConstraints = false
        var size: CGFloat = 0
        if UIDevice.current.userInterfaceIdiom == .pad {
            size = 50
        } else {
            size = 40
        }
        maleOption.setAttributedTitle("Male".convertToNSAtrributredString(size: size, color: .white), for: .normal)
        return maleOption
    }()
    
    let femaleLabel: UIButton = {
        let femaleOption = UIButton()
//        femaleOption.backgroundColor = .white
        femaleOption.translatesAutoresizingMaskIntoConstraints = false
        var size: CGFloat = 0
        if UIDevice.current.userInterfaceIdiom == .pad {
            size = 50
        } else {
            size = 40
        }
        femaleOption.setAttributedTitle("Female".convertToNSAtrributredString(size: size, color: .white), for: .normal)
        return femaleOption
    }()
    
    let topImageContainerView = UIView()
    let bottomImageContainerView = UIView()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        setupBackground()
        setupAppNameLabel()
        setupMaleButton()
        setupFemaleButton()
    }
    
    private func setupBackground() {
        // screen width and height:
        
        let imageViewBackground = UIImageView(frame: CGRect.zero)
        imageViewBackground.image = UIImage(named: "home-gender-icon3")
        
        view.addSubview(imageViewBackground)
        view.sendSubviewToBack(imageViewBackground)
        
        imageViewBackground.translatesAutoresizingMaskIntoConstraints = false
        imageViewBackground.contentMode = .scaleAspectFill
        imageViewBackground.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageViewBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageViewBackground.leadingAnchor.constraint(equalTo: view.safeLeadingAnchor).isActive = true
        imageViewBackground.trailingAnchor.constraint(equalTo: view.safeTrailingAnchor).isActive = true
    }
    
    private func setupAppNameLabel() {
//        topImageContainerView.backgroundColor = .blue
        self.view.addSubview(topImageContainerView)
        
//        topImageContainerView.backgroundColor = .green
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: self.view.safeTopAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: self.view.safeLeadingAnchor, constant: 20).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: self.view.safeTrailingAnchor, constant: -20).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 3/7).isActive = true
        
        topImageContainerView.addSubview(appNameLabel)
        
        appNameLabel.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor, constant: 0).isActive = true
        appNameLabel.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor, constant: 150).isActive = true
        appNameLabel.leadingAnchor.constraint(equalTo: topImageContainerView.leadingAnchor).isActive = true
        appNameLabel.trailingAnchor.constraint(equalTo: topImageContainerView.trailingAnchor).isActive = true
//        appNameLabel.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
    }
    
    private func setupMaleButton() {
        // male button in bottom third, left half of width, center
//        bottomImageContainerView.backgroundColor = .red
        self.view.addSubview(bottomImageContainerView)
        
        bottomImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        bottomImageContainerView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor).isActive = true
        bottomImageContainerView.leadingAnchor.constraint(equalTo: view.safeLeadingAnchor).isActive = true
        bottomImageContainerView.trailingAnchor.constraint(equalTo: view.safeTrailingAnchor).isActive = true
        bottomImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/7).isActive = true
        
        bottomImageContainerView.addSubview(maleLabel)

        maleLabel.topAnchor.constraint(equalTo: bottomImageContainerView.topAnchor).isActive = true
        let insetA = self.view.frame.width/9
        let insetB = self.view.frame.height/9

        if UIDevice.current.orientation.isLandscape {
            maleWidthAnchorA = maleLabel.leadingAnchor.constraint(equalTo: bottomImageContainerView.leadingAnchor, constant: insetB)
            maleWidthAnchorB = maleLabel.leadingAnchor.constraint(equalTo: bottomImageContainerView.leadingAnchor, constant: insetA)
        } else {
            maleWidthAnchorA = maleLabel.leadingAnchor.constraint(equalTo: bottomImageContainerView.leadingAnchor, constant: insetA)
            maleWidthAnchorB = maleLabel.leadingAnchor.constraint(equalTo: bottomImageContainerView.leadingAnchor, constant: insetB)
        }

        maleWidthAnchorA?.isActive = true

        maleLabel.addTarget(self, action: #selector(selectMale(sender:)), for: .touchUpInside)
    }
    
    @objc func selectMale(sender: UIButton!) {
        Defaults.setGender("male")
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupFemaleButton() {
        // male button in bottom third, left half of width, center
        bottomImageContainerView.addSubview(femaleLabel)
        
        femaleLabel.topAnchor.constraint(equalTo: bottomImageContainerView.topAnchor).isActive = true
//        femaleLabel.trailingAnchor.constraint(equalTo: bottomImageContainerView.trailingAnchor, constant: -1*screenWidth/9).isActive = true
        let insetA = self.view.frame.width/9
        let insetB = self.view.frame.height/9
        
        if UIDevice.current.orientation.isLandscape {
            femaleWidthAnchorA = femaleLabel.trailingAnchor.constraint(equalTo: bottomImageContainerView.trailingAnchor, constant: -1*insetB)
            femaleWidthAnchorB = femaleLabel.trailingAnchor.constraint(equalTo: bottomImageContainerView.trailingAnchor, constant: -1*insetA)
        } else {
            femaleWidthAnchorA = femaleLabel.trailingAnchor.constraint(equalTo: bottomImageContainerView.trailingAnchor, constant: -1*insetA)
            femaleWidthAnchorB = femaleLabel.trailingAnchor.constraint(equalTo: bottomImageContainerView.trailingAnchor, constant: -1*insetB)
        }
        
        femaleWidthAnchorA?.isActive = true
        
        femaleLabel.addTarget(self, action: #selector(selectFemale(sender:)), for: .touchUpInside)
    }
    
    @objc func selectFemale(sender: UIButton!) {
        Defaults.setGender("female")
        self.dismiss(animated: true, completion: nil)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
        if UIDevice.current.orientation.isLandscape {
            maleWidthAnchorA?.isActive = false
            femaleWidthAnchorA?.isActive = false
            maleWidthAnchorB?.isActive = true
            femaleWidthAnchorB?.isActive = true
        } else {
            maleWidthAnchorB?.isActive = false
            femaleWidthAnchorB?.isActive = false
            maleWidthAnchorA?.isActive = true
            femaleWidthAnchorA?.isActive = true
        }
        
    }
    
}
