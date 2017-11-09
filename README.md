# 手势识别相关

## 概述

手势识别器是处理视图中的触摸或者按压事件最简单的方法，我们可以在任意视图上附加一个或多个手势识别器。手势识别器封装了处理和解释该视图的触摸事件所需的所有逻辑，并将其与已知模式进行匹配。当触摸事件与已知模式匹配时，手势识别器会通知其关联的目标对象进行处理。手势识别器使用`target-action`设计模式去发送通知，如下图所示。当`UITapGestureRecognizer`对象在视图中检测到单指轻敲时，回调用视图所属的视图控制器的操作方法来回应。

![图1-1 手势识别器通知其关联到目标对象](https://docs-assets.developer.apple.com/published/7c21d852b9/0c8c5e29-c846-4a16-988b-3d809eafbb6b.png)

手势识别器有两种类型：离散型和连续型。当识别出手势后，**离散型手势识别器**只会调用一次其关联目标对象的操作方法。**连续型手势识别器**则可能会多次调用其关联目标对象的操作方法，包括手势的开始和结束以及跟踪手势细节的变化。例如，使用拖拽手势识别器时，只要触摸事件的位置发生变化，`UIPanGestureRecognizer`对象就会调用其关联对象的操作方法。

## 配置手势识别器

配置手势识别器分为以下三步：

- 使用代码创建一个手势识别器对象，并将其附加到视图上。或者，使用`storyboard`，直接将手势识别器拖动到视图上。
- 实现识别手势后目标对象要调用的操作方法。
- 调用手势识别器对象的`addTarget:action:`方法将目标对象和目标对象要调用的操作方法与手势识别器关联起来。或者，使用`storyboard`，右键单击手势识别器将其**Sent Action selector**连接到目标对象来创建关联操作方法。

## 回应手势

与手势识别器关联的操作方法为应用程序提供了对该手势的响应。对于离散型手势，其关联的操作方法与按钮的操作方法类似。只有手势识别成功后，才会调用其关联对象的操作方法作出响应。对于连续型手势，其关联的操作方法不仅可以对手势识别成功后作出响应，还可以在识别手势之前跟踪手势细节的变化。

手势识别器的`state`属性可以反映当前的手势识别状态。对于连续型手势，手势识别器会在手势识别过程中将此属性值从`UIGestureRecognizerStateBegan`变更为`UIGestureRecognizerStateChanged`，手势被识别后变更为`UIGestureRecognizerStateEnded`。

### 点击手势

点击手势识别器`UITapGestureRecognizer`对象会简要地检测一个或多个手指点击屏幕。涉及手势的手指不能从初始触摸点**显著移动**到其他地方，但可以配置手指必须触摸屏幕的次数。例如，可以配置点击手势识别器来检测单击，双击或者三击。

![图3-1 Tap gestures](https://docs-assets.developer.apple.com/published/7c21d852b9/14d1769c-c081-4c4a-9466-e5dca8a2e053.png)

点击手势属于离散型手势，只有当点击手势识别成功后才会调用其关联对象的操作方法。由于手势可以被取消的原因有很多，所以在操作方法中回应手势前，检查`state`属性可以确保不会出错。

> 注意：如果触摸屏幕后没有调用与手势识别器关联的对象的操作方法，请检查下列条件是否成立：

- 视图的`userInteractionEnabled`属性设置为`YES`。`UIImageView`和`UILabel`类默认将此属性设为`NO`。
- 点击次数等于`numberOfTapsRequired`属性中指定的次数。
- 手指个数等于`numberOfTouchesRequired`属性中指定的个数。

### 长按手势

长按手势识别器`UILongPressGestureRecognizer`对象检测一个或者多个手指长时间触摸屏幕。涉及手势的手指不能从初始触摸点**显著移动**到其他地方，但可以配置手指必须触摸屏幕的次数以及长按手势的最短持续时间。手势识别器仅由触摸的持续时间而不是与其相关的力触发。

![图3-2 Long-press gesture](https://docs-assets.developer.apple.com/published/7c21d852b9/c57fc4b9-4419-4ef9-9067-d27f474504af.png)

长按手势根据触摸的持续时间来确定手势的成功或者失败，它属于连续型手势，手势关联对象的操作方法可能会随着手势状态的变化而被多次调用。长按手势识别器在用户手指停留在屏幕上一定时间后(用户手指仍旧停留在屏幕上)进入`UIGestureRecognizerStateBegan`状态，当触摸事件更新时，进入`UIGestureRecognizerStateChanged`状态，用户手指离开屏幕时，进入`UIGestureRecognizerStateEnded`状态。

> 注意：如果触摸屏幕后没有调用与手势识别器关联的对象的操作方法，请检查下列条件是否成立：

- 视图的`userInteractionEnabled`属性设置为`YES`。`UIImageView`和`UILabel`类默认将此属性设为`NO`。
- 点击次数等于`numberOfTapsRequired`属性中指定的次数。
- 手指个数等于`numberOfTouchesRequired`属性中指定的个数。
- 触摸持续时间大于`minimumPressDuration`属性中指定的时间。

### 拖拽手势

拖拽手势识别器`UIPanGestureRecognizer`对象检测一个或者多个手指在屏幕上移动。屏幕边缘拖拽手势是限定触摸位置在屏幕边缘的拖拽手势，使用`UIScreenEdgePanGestureRecognizer`对象来识别屏幕边缘拖拽手势。

![图3-3 Pan gesture](https://docs-assets.developer.apple.com/published/7c21d852b9/92edf0c4-8d94-469b-b81d-c00a20e74f5e.png)

拖拽手势属于连续型手势，在手势识别过程中，会多次调用手势关联对象的操作方法。当手指开始移动时，拖拽手势识别器进入`UIGestureRecognizerStateBegan`状态，继续移动会导致手势识别器进入`UIGestureRecognizerStateChanged`状态。当手指离开屏幕时，进入`UIGestureRecognizerStateEnded`状态。

使用`UIPanGestureRecognizer`对象的`translationInView:`方法可以获取手指从初始触摸位置移动的距离。在手势开始时，拖拽手势识别器会存储初始触摸点。如果手势涉及多个手指，则手势识别器会使用多个手指的触摸点的中心点。

> 注意：如果触摸屏幕后没有调用与手势识别器关联的对象的操作方法，请检查下列条件是否成立：

- 视图的`userInteractionEnabled`属性设置为`YES`。`UIImageView`和`UILabel`类默认将此属性设为`NO`。
- 触摸次数在`minimumNumberOfTouches`和`maximumNumberOfTouches`属性中指定的值之间。
- 如果是屏幕边缘拖拽手势，应确保触摸位置在`edges`属性中指定的区域中。

### 轻扫手势



