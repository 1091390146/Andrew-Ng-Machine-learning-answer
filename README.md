﻿# Andrew-Ng Machinelearning answer  

  ex1、目前只添加了第六节线性回归的答案，单变量和多变量完整答案，后续会继续添加;  

  ex2、添加了逻辑回归完整答案，本章重在理解，从推导sigmoid函数到极大似然估计法推导公式，再求导，运用梯度上升或者*(-1/m)运用梯度下降；
正则化需要注意是用来限制theta的，而theta(1)也就是对应X为1的那一列不需要正则化，因为会限制theta(1)上升或者下降，无法达到最值点;  
  
  ex3、完成了第三次多元分类与神经网络作业，注意理解多元分类运用的逻辑回归，本质也是一个0 1 分类问题，只不过把相对应的单元划为1，其余划为0去训练;
oneVsAll.m文件里面有对本次作业图片识别的对应说明，注意附加的神经网络作业已经给出了Theta抛砖引玉，只需理解即可;  
  
 ex4、完成了神经网络BP算法作业，这一章理解起来很难，前一张多元分类是依次训练10组数据，对应0~9,而我们需要手动依次相乘
会得到10组数据去进行判断是哪一个数字，而神经网络图片数字识别是直接训练10个输出，多元分类的theta对应的的是每个图片数字的最优解，
而神经网络不是，它是由每个单元共同决定输出结果，层层联系，最后输出十个输出单元去判断数字，
至于神经网络公式的推导为下面这个网址: https://blog.csdn.net/qq_32865355/article/details/80260212  
    但是文中的代价函数为线性方程的最小二乘法的代价,即E = 1/2/m*(y-o)^2,得到的公式如下所示:  
![链接内的代价函数推导的误差项](https://s2.ax1x.com/2019/07/18/ZX72iq.png)  
然而作业中用的代价公式是sigmoid的:![作业误差项说明](https://s2.ax1x.com/2019/07/18/ZX7fzT.jpg)  
最后得到sigmoid代价函数推导的公式应该为:![公式:](https://s2.ax1x.com/2019/07/18/ZX7ixU.jpg)   
  
ex5、完成了正则线性回归和偏差/方差,注意最后两个可选只做了一个，最后随机选参数计算误差因为不熟悉函数未做,其实
这一个作业就是判断高偏差了或者高方差，一共就是三个图，第一个是曲线的模拟图，由于维度太高一般很难模拟;
第二个是随着lambda的增加训练集的误差和验证集、训练集的误差比较判断偏差方差;第三个是随着m训练集样本的增加，训练集和验证集的误差曲线比较;  
  
ex6、支持向量机的多分类，这一章的作业主要还是用到三方库去进行实现，所以十分方便,
不过却有两个问题比较困扰:  
问题1:theta*f(i)如何拟合曲线?  
当theta*X时可以用向量内积投影去看待求解theta的最小值,同时可以在X的坐标系中画出曲线,因为theta与这条曲线上的
x相乘为0，也就是说theta向量正交与X，但我想这并不意味着每个x在theta上的投影都是最长的，但却是累加和的情况下求出的最好theta情况,
当使用theta*f(i)时，使用的应该是f的坐标系，即在f坐标系下划出一条曲线，这个theta*f为0,theta与其正交，那么这个曲线应该在f的坐标系下面画出来的，为什么可以在X坐标系下
画出来那，应该是有转换吧，因为这两者我的理解都是距离，theta*X向量内积本质是距离，而f本身就是某点与x点的距离，因此两者有某种对应关系；  
问题2:用何种方式确定theta  
可能也是用到梯度下降或者上升的方法吧；  
关于最大间隔,我的理解是theta*X这两个向量是正交的，但是数据点theta*x必须大于1或者-1，对应的cost(theta*x)才能等于零，对应的代价函数会越低,因此会产生大间隔,而对于逻辑回归，
对应的曲线上面的h(theta*X)值为0.5而大于0.5会判定为1,对比于大间隔来说准确度下降很多;



