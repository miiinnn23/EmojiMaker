//
//  ViewController.swift
//  EmojiMaker
//
//  Created by 이승민 on 2021/01/03.
//

import UIKit

struct CaptionImage {
    let emoji: String
    let image: String
}
struct CaptionOption {
    let emoji: String
}

class ViewController: UIViewController {
    @IBOutlet weak var topCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var emojiImage: UIImageView!
    
    let imageChoices = [
        CaptionImage(emoji: "🙂", image: "emoji1.png"),
        CaptionImage(emoji: "😶", image: "emoji2.png"),
        CaptionImage(emoji: "😉", image: "emoji3.png"),
        CaptionImage(emoji: "😠", image: "emoji4.png")
    ]
    let emojiChoices = [
        CaptionOption(emoji:"💕"),
        CaptionOption(emoji:"🔥"),
        CaptionOption(emoji:"✨"),
        CaptionOption(emoji:"")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topCaptionSegmentedControl.removeAllSegments()
        for imageChoice in imageChoices {
            topCaptionSegmentedControl.insertSegment(withTitle: imageChoice.emoji, at: imageChoices.count, animated: false)
        }
        topCaptionSegmentedControl.selectedSegmentIndex = 0
        
        bottomCaptionSegmentedControl.removeAllSegments()
        for emojiChoice in emojiChoices {
            bottomCaptionSegmentedControl.insertSegment(withTitle: emojiChoice.emoji, at: emojiChoices.count, animated: false)
        }
        bottomCaptionSegmentedControl.selectedSegmentIndex = 0
        
        updateImage()
        updateEmoji()
    }

    @IBAction func topChangeSeletedValue(_ sender: Any) {
        updateImage()
    }
    
    @IBAction func bottomChangeSeletedValue(_ sender: Any) {
        updateEmoji()
    }
    
    func updateImage() {
        let topSelectedImage = imageChoices[topCaptionSegmentedControl.selectedSegmentIndex].image
        emojiImage.image = UIImage(named: topSelectedImage)
    }
    func updateEmoji() {
        let bottomSelectedIndex = bottomCaptionSegmentedControl.selectedSegmentIndex
        emojiLabel.text = emojiChoices[bottomSelectedIndex].emoji
    }
}

