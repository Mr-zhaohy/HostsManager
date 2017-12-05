# HostsManager

[![CI Status](http://img.shields.io/travis/Mr_zhaohy/HostsManager.svg?style=flat)](https://travis-ci.org/Mr_zhaohy/HostsManager)
[![Version](https://img.shields.io/cocoapods/v/HostsManager.svg?style=flat)](http://cocoapods.org/pods/HostsManager)
[![License](https://img.shields.io/cocoapods/l/HostsManager.svg?style=flat)](http://cocoapods.org/pods/HostsManager)
[![Platform](https://img.shields.io/cocoapods/p/HostsManager.svg?style=flat)](http://cocoapods.org/pods/HostsManager)

### Example
***
#### HostsManager - 地址管理器
- 创建管理器单例
<br >`+(instancetype)shared;`
<br >e.g.
<br >`[HostsManager shared];`

- 新增一个url
<br >`-(void)addHostsUrl:(NSString *)url default:(BOOL)isDefault;`
<br >e.g.
<br >`[HostsManager shared] addHostsUrl:@"http://www.gitlab.com/" default:YES];`

- 删除一个url
<br >`-(void)removeHostsUrl:(NSString *)url;`
<br >e.g.
<br >`[HostsManager shared] removeHostsUrl:@"http://www.gitlab.com/"];`

***
##### CustomHostsView - 自定义的切换视图
![Alt text](http://img.blog.csdn.net/20141121162048979?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhhb2thaXFpYW5nMTk5Mg==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)
<br >侧滑支持更多操作

- 初始化
<br >`CustomHostsView *custonView = [[CustomHostsView alloc]init];`

- 设置代理
<br >`custonView.delegate = self;`

- 展示视图（**默认全屏**）
<br >`[custonView show];`

- 隐藏/消失视图
<br >`[custonView dismiss]; `

***
#### CustomHostsView - 代理方法
- 设置了一个默认地址
<br >`-(void)setDefaultWithUrl:(NSString *)url;`
- 自定义视图消失
<br >`-(void)customHostsViewDismiss;`

## Installation

```ruby
pod 'HostsManager'
```
---
## Author

Mr_zhaohy, zhy1@erongdu.com

## License

HostsManager is available under the MIT license. See the LICENSE file for more info.

