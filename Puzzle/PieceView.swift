//
//  PieceView.swift
//  Puzzle
//
//  Created by 鶴本賢太朗 on 2017/04/22.
//  Copyright © 2017年 鶴本賢太朗. All rights reserved.
//

import UIKit

protocol PieceViewDelegate: class {
    func onTapBegan(point: CGPoint, pieceView: PieceView)
    func onTapMoved(diffPoint: CGPoint, pieceView: PieceView)
    func onTapEnded(point: CGPoint, pieceView: PieceView)
}

class PieceView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    
    private var firstTouchPoint: CGPoint = CGPoint()
    internal weak var delegate:PieceViewDelegate?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch: UITouch = touches.first else { return }
        let touchPoint: CGPoint = touch.location(in: self)
        self.firstTouchPoint = touchPoint
        print("最初の位置:" + "\(touchPoint)")
        
        guard let delegate: PieceViewDelegate = self.delegate else { return }
        delegate.onTapBegan(point: touchPoint, pieceView: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch: UITouch = touches.first else { return }
        let touchPoint: CGPoint = touch.location(in: self)
        print(touchPoint)
        let diff: CGPoint = CGPoint(x: touchPoint.x - self.firstTouchPoint.x, y: touchPoint.y - self.firstTouchPoint.y)
        guard let delegate: PieceViewDelegate = self.delegate else { return }
        delegate.onTapMoved(diffPoint: diff, pieceView: self)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch: UITouch = touches.first else { return }
        let touchPoint: CGPoint = touch.location(in: self)
        guard let delegate: PieceViewDelegate = self.delegate else { return }
        delegate.onTapEnded(point: touchPoint, pieceView: self)
    }
}
