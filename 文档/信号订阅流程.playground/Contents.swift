
// 模拟订阅

class TestB {
    
    var callback: ((_ p: String) -> Void)?
    
    func on(p: String) {
        if let _callback = callback {
            _callback(p)
        }
    }
}

class TestA {
    
    var callback: ((_ b: TestB) -> Void)?
    
    func create(c: @escaping (_ b: TestB) -> Void) {
        callback = c
    }
    
    func subscribe(d: @escaping (_ p: String) -> Void) {
        let b = TestB()
        b.callback = d
        if let _callback = callback {
            _callback(b)
        }
    }
}

let a = TestA()
a.create { (b) in
    b.on(p: "A")
    b.on(p: "B")
    b.on(p: "C")
    b.on(p: "D")
    b.on(p: "E")
}

a.subscribe { (p) in
    print(p)
}
