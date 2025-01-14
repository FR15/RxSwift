//
//  ObserverType.swift
//  RxSwift
//
//  Created by Krunoslav Zaher on 2/8/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

/// Supports push-style iteration over an observable sequence.
public protocol ObserverType {
    /// The type of elements in sequence that observer can observe.
    associatedtype Element

    @available(*, deprecated, renamed: "Element")
    typealias E = Element

    /// Notify observer about sequence event.
    ///
    /// - parameter event: Event that occurred.
    func on(_ event: Event<Element>)
    
    // 事件是通过 枚举 Event 封装的
    // 三种类型的事件
    // 其中 next error 关联了相关的值
}

/// Convenience API extensions to provide alternate next, error, completed events
// 这个扩展里面定义并实现了 三个方法
// 这三个方法是借助 on 实现的
// 但是其核心方法 on 并没有实现
extension ObserverType {
    
    /// Convenience method equivalent to `on(.next(element: Element))`
    ///
    /// - parameter element: Next element to send to observer(s)
    public func onNext(_ element: Element) {
        self.on(.next(element))
    }
    
    /// Convenience method equivalent to `on(.completed)`
    public func onCompleted() {
        self.on(.completed)
    }
    
    /// Convenience method equivalent to `on(.error(Swift.Error))`
    /// - parameter error: Swift.Error to send to observer(s)
    public func onError(_ error: Swift.Error) {
        self.on(.error(error))
    }
}
