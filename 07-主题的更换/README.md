### 主题换肤

pod SwiftTheme



[飞机票](https://github.com/wxxsw/SwiftTheme)

换肤的实现是本地创建多个plist文件 切换的时候 去加载不同的plist文件



#### 换肤的结果要保存到本地下一下次进入app 直接加载

#### 换肤之后也要去通知tabbar去修改子控制器中主题色

```swift
    // 换肤按钮的点击
    @IBAction func dayAndNightSwitch(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected;
        
        MyTheme.swichNight(sender.isSelected);
        
        
        // 按钮点击的时候要把日间和白天设置保存到本地  下一次进入应用的时候进行再次加载
        UserDefaults.standard.set(sender.isSelected, forKey: "DayAndNight");
        
        // 同时通知tabbar 相应的去改变背景颜色 然后去tabbar控制器中进行监听 
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "DayAndNightBtnClick"), object: sender.isSelected);
    
        
    }
```



在AppDeleage 中加载主题色

```swift
        // 加载主题色
        let is_sel = UserDefaults.standard.bool(forKey: "DayAndNight")
        MyTheme.swichNight(is_sel);
```





























