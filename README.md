# ELSegmentView
![Demo](https://github.com/lyonsonline/ELSegmentView/blob/master/ELSegmentViewDemo.gif)
## Requirements
- iOS 8.0+ / Mac OS X 10.11+ / SnapKit
- Xcode 8.0+
- Swift 3.0+
## Usage
  `ELSegmentView`使用`SnapKit`设置约束.
  ~~~ Swift
  class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let titles = ["日排行","周排行","月排行","总排行"]
        let segmentView = ELSegmentView(titles: titles)
        view.addSubview(segmentView)
        segmentView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(64)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()    
    }
  }
  ~~~
  满足`ELSegmentDelegate`可以响应 button 的点击事件
  ~~~ Swift
  protocol ELSegmentViewDelegate: class {
    func segmentView(_ segmentView: ELSegmentView, didSelectRowAt index: Int)
}
  ~~~
  在`ViewController`将代理赋给`self`
  `segmentView.delegate = self`
  满足协议
  ~~~ Swift
  extension ViewController: ELSegmentViewDelegate {
    func segmentView(_ segmentView: ELSegmentView, didSelectRowAt index: Int) {
        print(index)
    }
}
  ~~~
  > 协议提供默认实现
