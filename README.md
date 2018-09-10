# BookAppointment--SSM
SSM项目记录

这个图书管理网站啊是基于SSM框架，Maven构建的Web项目，用了IDEA开发

主要功能：
  1. 游客模式：从首页进入书库里查询各类书籍，可以选择书名查询、类型查询、出版社查询，查到相应的书籍后呢，可以点进去详情页面，看看书的简介（这个忘了做个返回键返回上一页了），有预约按钮，按到了
就会跳转到登录界面，提醒你登录。
  2. 用户模式：
      1) 用户注册登录后，同样可以进入书库查询想要的书籍，点击详情进入详情页面可以对书籍进行预约，预约成功后相应书籍数量就会减少，当然，要是对还在预约期内的同一本书进行再次预约就会提醒你预约重复了。
      2) 预约单的状态分为四种：取消预约、预约成功、已借出、已归还，取消预约和已归还状态的同本书籍可再次进行预约。
      3) 用户可以查询自己的预约总记录、预约成功记录、已借走记录、已归还记录。
      4) 在预约成功记录这里，用户可以取消预约。
      5) 预约成功时系统会将当前时间以及预约到期时间（5天）一同记录到orders表中，这个时间可以在查询我的预约看到。
      6) 用户点击右上方的用户名时可以进入到个人中心，查看自己的所有信息，可以对信息进行修改。
  3. 管理员模式：（还没有完全做完，待后续补上）登录身份为管理员时，可以添加、修改、删除书籍，可以管理用户信息，当然不能随便改啦，可以管理订单等等等等。。。

 ![img](https://github.com/YannisCxy/BookAppointment--SSM/blob/master/src/main/img/%E4%B9%A6%E5%BA%93.PNG)
 
 ![img](https://github.com/YannisCxy/BookAppointment--SSM/blob/master/src/main/img/%E4%B9%A6%E5%90%8D%E6%90%9C%E7%B4%A2.PNG)
 
  ![img](https://github.com/YannisCxy/BookAppointment--SSM/blob/master/src/main/img/%E8%AF%A6%E6%83%85.PNG)
  
 ![img](https://github.com/YannisCxy/BookAppointment--SSM/blob/master/src/main/img/%E6%9F%A5%E8%AF%A2%E9%A2%84%E7%BA%A6.PNG)

 ![img](https://github.com/YannisCxy/BookAppointment--SSM/blob/master/src/main/img/%E9%A2%84%E7%BA%A6%E8%AE%B0%E5%BD%95.PNG)
这个项目其实不难，就当是SSM框架的初级练手题还是不错的，可以慢慢扩展，做点不一样的设计，难点可能在于controller怎么写，拦截器怎么样才能发挥作用，哪种方法是最有效率的，
代码里有一些是很蠢的做法，后续应该会改进，首页原本想放几首诗上去又不知道放什么，想到了再放。。。
