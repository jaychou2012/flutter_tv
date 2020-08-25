# flutter_tv
 flutter_tv
 
Flutter Dart技术交流QQ群：979966470

之前一直在进行Flutter在移动端的应用尝试，现在我们将拓展到TV应用的开发上来。我们知道目前的智能电视和机顶盒都是基于Android系统的，所以一般的TV应用开发都是采用Android原生进行开发，Google对Android TV的开发也进行了一些规范和库的制定。当然也有的是采用的B/S架构进行设计的。这里我们将进行尝试Flutter开发TV应用。虽然写出来了，效果也还可以，体验流畅，自动适配。不过开发成本还是挺高的，按键监听、焦点处理和焦点框处理比较麻烦，由于Google官方并没有推出Flutter TV应用的SDK，所以暂时还是不要用Flutter编写TV应用了，使用原生leanback等库进行开发或者B/S结构开发。

## Flutter TV应用开发主要难点

由于Google Flutter官方并没有推出TV版Flutter SDK，所以用Flutter尝试编写TV应用，主要是焦点框和焦点移动、焦点顺序的处理，其他的和手机应用差别不大。按键监听、焦点框和焦点处理比较麻烦，所以Flutter的TV应用开发还不成熟，体验还不错，很流畅，开发成本比较高。所以这里我们只是作为研究拓展，实际开发还是要选择原生的TV支持库进行开发，如官方的Leanback，或者采用B/S架构进行开发TV应用。

原生Android的控件就默认有焦点的处理属性，直接配置使用即可。还支持指定下一个焦点的id。

```java
//焦点处理
android:focusable="true"
//触摸模式下是否可以点击，可选可不选
android:focusableInTouchMode="true"
```
Flutter开发TV应用就要自己处理按键监听、焦点和焦点框、焦点移动顺序了，比较的麻烦，处理好了这几个问题，开发起来也就没太大难度了。

**不过最新版的Flutter多了一个DefaultFocusTraversal这个类，我们可以进行指定方向自动移动焦点了，相对简单了一些。**

APK下载体验地址：https://github.com/jaychou2012/flutter_tv/blob/master/app-release.apk?raw=true

运行在机顶盒上看效果。

我们先看下Flutter TV开发实现的效果图：

![运行效果](https://github.com/jaychou2012/flutter_tv/blob/master/screenshot/gifhome_540x303_21s.gif?raw=true)

![运行效果](https://github.com/jaychou2012/flutter_tv/blob/master/screenshot/device-2019-08-12-224530.png?raw=true)

![运行效果](https://github.com/jaychou2012/flutter_tv/blob/master/screenshot/device-2019-08-12-224545.png?raw=true)

![运行效果](https://github.com/jaychou2012/flutter_tv/blob/master/screenshot/device-2019-08-12-224601.png?raw=true)


## 《从零开始学Flutter》已出版


### 新书涵盖Flutter最新的大部分的组件技术和内容，从零开始深入讲解其中涉及的技术点，包括：Dart基础 、Flutter基础组件、Flutter开发规范、路由与生命周期、Http网络请求、应用打包与发布等，值得购买阅读。


![从零开始学Flutter](https://img10.360buyimg.com/n1/jfs/t1/150105/31/6483/200868/5f448b12E10484765/20a772cdd2d0a857.jpg "从零开始学Flutter")


### 纸质书购买：

[京东](https://item.jd.com/10020767293895.html "京东")         [天猫](https://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.46.4d964d77KORSb8&id=625677553628&areaId=500100&user_id=1932014659&cat_id=2&is_b=1&rn=cfb373631608a3f9e449fc0a225a090d "天猫")  [当当](http://product.dangdang.com/1675961491.html "当当")
