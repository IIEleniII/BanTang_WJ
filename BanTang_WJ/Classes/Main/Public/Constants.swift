
//  ConstantsForSwift.swift


import UIKit

// MARK: - 常量

    //网络相关

let NETWORK_TIMEOUT: NSTimeInterval = 15 // 网络超时时间
let localHTTP : String = "http://182.140.132.172/HealthRecordCenter/XMLTest.ashx"// http请求头
let fileHTTP:String = "http://182.140.132.172/HealthRecordCenter/HealthRecordFile/"

    //屏幕的宽高

let screenW = UIScreen.mainScreen().bounds.size.width
let screenH = UIScreen.mainScreen().bounds.size.height
let navBarH:CGFloat = 64
let tabbarH:CGFloat = 44

    //颜色相关

let themeColor = UIColor.init(red: 37/255.0, green: 190/255.0, blue: 159/255.0, alpha: 1.0)
let selectedThemeColor = UIColor.init(red: 182/255.0, green: 209/255.0, blue: 200/255.0, alpha: 0.6)



// MARK: - 常用配置方法

    // 调试相关(需要配置)
    // **配置方法：Build Settings ->搜索 Other swift flags ->添加 “-D DEBUG”
func printLog<T>(message: T,
              file: String = #file,
              method: String = #function,
              line: Int = #line)
{
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}


    // RGB色
func RGBA (r:CGFloat,_ g:CGFloat, _ b:CGFloat,_ a:CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}
func RGB (r:CGFloat,_ g:CGFloat, _ b:CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
}

    // 字体
func FONT (size : CGFloat) -> UIFont {
    return UIFont.systemFontOfSize(size)
}



//MARK: - 类扩展方法

extension UIView {
    
    /**
     创建单个矩形圆角
     
     - parameter viewCorners:  需要倒角方向
     - parameter radio: 圆角半径
     - 使用方法：首先创建UIRectCorner 方法如下：
        let corner = UIRectCorner.TopLeft.rawValue | UIRectCorner.TopRight.rawValue  // 圆角位置（使用它的原始值）
     */
    
    func makeCornersForView(viewCorners corners: UInt, radio:CGFloat){
        
        let rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
        let radio = CGSizeMake(radio, radio) // 圆角半径
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner(rawValue: corners), cornerRadii: radio)  // 创建倒圆角路径
        let maskLayer = CAShapeLayer()  // 创建蒙版
        maskLayer.frame = self.bounds  // 蒙版尺寸
        maskLayer.path = path.CGPath  // 蒙版倒圆角路径
        self.layer.mask = maskLayer
    }
    
}
