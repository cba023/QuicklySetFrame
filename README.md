
## 前言
iOS开发布局有多套方案可以实现，大致有几种方法。NSLayoutConstraint, Masony, Snapkit(Swift环境布局框架)，也可以用setframe来实现简单的布局。

* NSLayoutConstraint：苹果官方推出的约束方式，在XIB或故事板中可以使用拖拽快速实现，纯代码实现起来显得相当繁琐。
* Masony: 一款经典的三方布局框架，由Objective-C语言编写，适用于纯代码布局，相对于官方的NSLayoutConstraint是用代码布局而言，可以在一个block中实现对单一控件实现完整布局，有着很高的布局效率，缺点是有侵入性，代码的可以阅读性不够好。
* Snapkit: Swift版本的Masony,适用于由Swift语言搭建的项目,布局是在闭包中完成的。
* setFrame方法:利用系统的setFrame方法，可以实现快速的控件静态布局。setFrame方式需要准确的计算出控件的origin(原点坐标)，size(尺寸)，繁琐的计算导致该方法在使用中显得不够灵活，在屏幕适配中显得很麻烦。
* 还有其他的一些布局方式，github上可以找到很多类型的解决方案。有的太重量级，有的太繁琐，有的和系统布局的兼容性存在问题。鉴于之前遇到的问题。

## 我的Idea

根据多年的iOS开发经验。我自己对setFrame做了一个简单的封装，实现了对控件的简单布局。使用起来棒棒哒，如果下列代码能够吸引你，那么请继续看下去：

```
[_detailAddressLabel setFrameFromLayout:^(UIViewVirtualLayout *layout) {
                    layout.size = CGSizeMake(80.0, 40.0);
                    layout.yCenter = cell.contentView.h / 2.0;
                    layout.x = 15.0;
                }];
```

很显然的，上述代码其实就是被我含蓄地setFrame了,但是我几乎没有做什么计算我就把这个布局给完成了。一个地址Label,设置它的尺寸为 80 * 40， 纵坐标中心与它所在的cell的中心对齐，横坐标为15，是不是很简单呢。
我们再来看看Masony是怎么布局的；

```
 [_detailAddressLabel makeConstraints:^(MASConstraintMaker *make) {
                    make.width.equalTo(80.0);
                    make.height.equalTo(40.0);
                    make.left.equalTo(cell.contentView.left).offset(15.0);
                    make.centerY.equalTo(cell.contentView);
                }];
```

看起来出入不大，但是我可以告诉你，从程序的运行角度来说，通过我封装UIViewVirtualLayout方式来实现对控件的布局运行效率要高很多，关键是封装原理十分浅显易懂。 极大地降低了程序的体积，还降低了冗余。
当然setFrame的布局是静态的，如果控件相对于参照控件，布局是发生变化的，就需要在变化时去调用一下该方法，比如在tableViewCell或collectionViewCell中，就可以在cell的layoutSubViews方法中去调用setFrameFromLayout:方法。这个方法可用于创建布局和刷新布局，免去了像Masony中UpdateConstrains方法的麻烦。

## 实现

具体实现简单到爆，只怕没想到，谁都能做到。
在实现中我对UIView设置了一个类别，专用于对UIView及其子类进行改变frame，当然一次只能改变一个参数，对于改变frame中的一个参数来说，是非常高效的，免去了计算坐标的麻烦，但是如果要一起把UIView的所有坐标属性设定，则需要反复调用setFrame，所以对于布局来说这样还不是一个很好的解决方案。为了布局的快速实现并提高运行效率，这里引入了UIViewVirtualLayout类（后面简称layout）,我们利用layout来实现对frame的赋值，知道layout全部参数设定完成后再去赋值给view的frame，在这期间只对frame刷新一次。

> UIView+Layout类别中的布局实现代码

```
- (void)setFrameFromLayout:(VirtualLayoutBlock)layoutBlock {
    UIViewVirtualLayout * layout = [[UIViewVirtualLayout alloc] init];
    layout.frame = self.frame;
    layoutBlock(layout);
    [self setFrame:layout.frame];
}
```

显然的，layout相当于是一个布局的数据缓存，当他设定好值，再把值赋值给view的frame，完成它的使命。
代码已经上传到github，具体实现请参见 https://github.com/cba023/QuicklySetFrame

谢谢。

> 2018-05-17


