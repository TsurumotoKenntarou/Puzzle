//
//  PuzzleBaseView.swift
//  Puzzle
//
//  Created by 鶴本賢太朗 on 2017/04/29.
//  Copyright © 2017年 鶴本賢太朗. All rights reserved.
//

import UIKit

class PuzzleBaseView: UIView {
    
    // 縦と横のピースの数
    private let verticalCount: Int = 3
    private let horizontalCount: Int = 3
    
    // ピース一覧
    private var pieceViews: [PieceView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setPieceViewFrame()
    }
    
    // MARK: 初期化
    private func initialize() {
        for i in 0 ..< self.horizontalCount * self.verticalCount {
            let pieceView: PieceView = PieceView.instantiate()
            pieceView.tag = i + 1
            pieceView.delegate = self
            self.addSubview(pieceView)
            self.pieceViews.append(pieceView)
        }
        
        //　空白のピースが他のピースの前に表示されないように最背面に移動する
        self.sendSubview(toBack: self.pieceViews.last!)
    }
    
    // MARK: ピースの位置を設定する
    private func setPieceViewFrame() {
        let width: CGFloat = self.frame.width / CGFloat(self.horizontalCount)
        let heigth: CGFloat = self.frame.height / CGFloat(self.verticalCount)
        for pieceView in self.pieceViews.enumerated() {
            let i: Int = pieceView.offset
            let horiIndex: CGFloat = CGFloat(i % self.horizontalCount)
            let verIndex: CGFloat = CGFloat(i / self.verticalCount)
            let rect: CGRect = CGRect(x: horiIndex * width, y: verIndex * heigth, width: width, height: heigth)
            pieceView.element.frame = rect
            pieceView.element.imageView.image = UIImage(named: "pic_0" + "\(i + 1)")
            self.pieceViews.append(pieceView.element)
        }
    }
}

extension PuzzleBaseView: PieceViewDelegate {
    
    func onTapBegan(point: CGPoint, pieceView: PieceView) {
//        var rect: CGRect = pieceView.frame
//        rect.origin = point
//        pieceView.frame = rect
    }
    
    func onTapMoved(diffPoint: CGPoint, pieceView: PieceView) {
        var rect: CGRect = pieceView.frame
        rect.origin.x = rect.origin.x + diffPoint.x
        rect.origin.y = rect.origin.y + diffPoint.y
        pieceView.frame = rect
    }
    
    func onTapEnded(point: CGPoint, pieceView: PieceView) {
//        var rect: CGRect = pieceView.frame
//        rect.origin = point
//        pieceView.frame = rect
    }
}
