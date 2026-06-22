# Agent Skill时代不写代码也该懂的工具: Git，其实就是程序员经常喝的一瓶后悔药

# Agent Skill时代不写代码也该懂的工具: Git，其实就是程序员经常喝的一瓶后悔药

​

![图片以漫画形式呈现，左侧是一位面对电脑显示 “文件已删除” 而哭泣的人，右侧是一位戴着墨镜、面带笑容比耶的人。中间有一瓶标着 “Git 后悔药” 的罐子。画面底部文字写着 “4 种吃法 救命神器”“手残党必看！”。图片与上下文的关系是，通过生动形象的漫画，以 “后悔药” 为喻，强调 Git 工具对于在文件编辑中出现失误（如文件删除等情况）时的补救作用，呼应文档中提到的 Git 可用于追溯文件之前版本的内容。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MzQ3ZWNmMTJlYTU4OWRkMzliMWVjYjE1MDZmZTNiNzlfOTE5OWY0OGYyODY5ZGI3MDQ2NGRhY2IwY2E0ZjkwZTBfSUQ6NzY0NjMwMjY4Mzk2MDI0OTMxNF8xNzgyMDk5MTY4OjE3ODIxMDI3NjhfVjM)

git 可以说是程序员的必备工具，但它并不是只有程序员才需要。在当前Vibe Coding不仅仅为了程序员而设计的情况下，很多对文件比如word ppt excel、md、txt等等众多文件编辑领域，由于在AI的加持下，它的变化太多了，有时候随便聊聊，可能文件中的内容就变了，但是有时候又想回看之前的版本。就变得毫无章法了。这里就跟程序员的代码类似，程序员只要提交过，就可以随时进行追溯查看。

你看，程序员都可以吃**后悔药**，我们普通人为什么不可以呢？

既然要深入讲**后悔药**这个点，那我们就把 Git 想象成一瓶药效极其强大，不但能治病还能预防的神奇后悔药。

普通的撤销（Ctrl+Z）只能让你退回几步，一旦软件关了、或者电脑重启了，后悔药就失效了。

而 Git 这瓶后悔药，有以下 4 种不同维度的吃法，专治各种早知今日，何必当初呢

## 第一种吃法：定点穿越药（存档回滚）

![图片展示了Git的定点穿越药（存档回滚）吃法。画面左侧显示电脑屏幕上有多个错误提示框，表明当前状态为“现在的烂摊子”。中间有一个红色的“时光机（Reset）”按钮，下方文字说明“存档回滚：专治手贱误删”。右侧是昨天的完美版本界面，文件图标排列整齐。图片与上下文紧密相关，直观呈现了Git在遇到错误或误删时，可通过一键回滚到昨天完美版本的功能，解决“哎呀！早知今日，何必当初”的问题。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NWMxNWFhZWM3Mjg3ZGRkNzhkNDQ5ZDRkNDBhZTlmYThfOTVlN2JmOTcxYzBjZTRkNDlkZTVhMjEyNmRhOTZjMzhfSUQ6NzY0NjMwMjcwOTIxOTY5MTQ1Nl8xNzgyMDk5MTY4OjE3ODIxMDI3NjhfVjM)

专治：哎呀！手贱把昨天写好的那段最精彩的剧情删了，而且已经保存覆盖了！

我们平时写文档，点击保存，旧的内容就被新的覆盖了，旧的就死了，找不回来了。

但在 Git 的世界里，并没有覆盖这个概念，只有叠加。

每次你操作Git 的保存（提交），它不是覆盖旧文件，而是给当前所有文件的状态拍了一张快照，并生成一个编号。

药效：一个月后，你发现今天改的内容全是垃圾，想找回一个月前的版本。你只需要告诉 Git：我要吃那颗编号为 X 的后悔药。

结果：哪怕中间你改了一万次，Git 也能瞬间把你带回到一个月前那个下午的状态，连标点符号都不差。

## 第二种吃法：成分分析药（差异对比）

![图片以“Diff差异对比：一眼看穿改了哪”为标题，介绍Git作为程序员“成分分析药”的吃法二。画面中，一位戴红绿眼镜的卡通男孩手持纸张，纸上有“旧代码删除”“新功能添加”等字样，旁边配有放大镜，标注“精准定位”。该图片与上下文紧密相关，通过形象化表达，说明Git能通过红绿眼镜对比“现在的你”和“昨天的你”，帮助程序员精准定位代码差异，解决因版本变化不知所改的困扰。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MmMwZTAwMWVlZTI4MGE0MDM1M2YwZDFkMDdlMDA2ZjJfMjE3MjQ4MzVmZTNkMzAyNDI2MGUxMDc4NGI4YzU3ZTRfSUQ6NzY0NjMwMjcyODgyNjM1ODcxNl8xNzgyMDk5MTY4OjE3ODIxMDI3NjhfVjM)

专治：我觉得现在的版本不对劲，但我忘了到底改了哪里，也不记得原来的版本是啥样了。

很多时候，我们的后悔不是全盘推翻，而是想不起来。比如你觉得文章读起来变别扭了，但不知道是哪句话的问题。

药效：Git 这颗药吃下去，它会给你一副红绿眼镜。

结果：它会把“现在的你”和“昨天的你”放在左右两边对比,或者上下。

你删掉的字，它用红色标出来。

你新增的字，它用绿色标出来。

你一眼就能看到：哦！原来我把这句关键的形容词给删了！然后只把这一句抓回来就行，不用整个文件回退。

## 第三种吃法：处方说明书（提交日志）

![图片展示了Git的“第三种吃法：处方说明书”，即提交日志功能。画面以一本打开的书为主体，书内记录着2023年10月20日删除第一段是因为客户觉得啰嗦。书旁有个男孩正在阅读，旁边气泡标注“Log日志”和“查明真相”。底部文字说明“不仅能回退，还能知原因”。该图片与上下文对应，直观地解释了Git提交日志可用于查明代码或文字编辑历史及原因，解决“这行奇怪的代码（或这段文字）是谁写的”这类问题。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NDI3ODVlMmJmM2M5ZWZmNmFhOWIxODhjNTZiYTUxZGFfZmVjMDM0OTZkNTFmMmRhYzExMGEzNzgwZGU5ZjYzZDFfSUQ6NzY0NjMwMjc1MjI0MzIzOTg2Nl8xNzgyMDk5MTY4OjE3ODIxMDI3NjhfVjM)

专治：这行奇怪的代码（或这段文字）是谁写的？为什么要这么写？我是脑子进水了吗？

几个月后，你看到自己写的一段东西，可能会感到莫名其妙，后悔当初没写个备注。

药效： Git 强制要求你在每次存后悔药的时候，写一张病情描述（也就是备注，比如：删除了第一段，因为客户说太啰嗦）。

结果： 一年后的你，看着这行被删掉的字发呆时，翻开 Git 的病历本，上面清楚地写着你当时的理由。你就会释怀：哦，原来是客户要求的，那没事了。——它治好了你不明不白的后悔。

## 第四种吃法：试错安慰剂（分支隔离）

![图片以“试错安慰剂”为主题，展示了主宇宙（Master）和实验宇宙（Branch）的概念。主宇宙中有一个保险箱，代表当前完美版本，用剪刀切断，表示分支隔离。实验宇宙里有一个人在实验，周围有烟雾和实验器材，象征大胆试错。图片下方文字说明Branch分支隔离，可放心大胆去试错。此图与上下文紧密相关，直观呈现了Git分支隔离功能，帮助理解在分支上大胆尝试，不怕失败的原理。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZDdiY2JmZGQ3OWI2ZmZjY2EwYjUyYjY2MzllMzE0OWVfMDYyNjQzOGQzY2JkMDkxYTQzYTIwYjMzODRlMmVmNzdfSUQ6NzY0NjMwMjc3NDMyOTkwNDA3NV8xNzgyMDk5MTY4OjE3ODIxMDI3NjhfVjM)

专治：我想大改一下，但万一改废了，原来的也回不来了，所以我不敢动。

这种后悔叫做因为害怕而没敢去尝试的后悔。

药效： Git 允许你把当前的完美版本冷冻起来，然后复制一个一模一样的克隆体给你去折腾。

结果： 你在克隆体上随便乱改，改得天翻地覆。

改废了？没事，一键销毁克隆体，把冷冻的本体解冻，就像什么都没发生过。

改好了？太棒了，把克隆体的内容吸收到本体里。

作用：它让你在做任何危险操作前，都拥有一颗绝对兜底的后悔药，让你敢于去作死。

## 准备吧

上面简单介绍了git的伟大作用，让我们来切实的体验一下吧

1、首先安装git，安装包地址：[https://git-scm.com/install/windows](https://git-scm.com/install/windows)，一直默认下一步就可以。

```Plain Text
// window下 使用快捷键 Win + R 打开运行

git --version

// 如果出现类似的字符串说明安装成功

git version 2.52.0.windows.1


```

2、然后再装个可视化工具，[https://github.com/gitextensions/gitextensions/releases/tag/v6.0.5](https://github.com/gitextensions/gitextensions/releases/tag/v6.0.5)

也是一直默认就可以了，安装完毕打开桌面的gitextensions。这里我是window下的，当然也有很多种可视化的工具。

再点击下载安装就可以了，再次打开就出现如下所示界面

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OWYwNTQxYTcxYTBmYzE3OWNjMzZkZjdhODI5ZThmYzNfNzc3YzQ1ODYzNDM5OTNhYjliMmQzN2Q1MmNhYjFjNjNfSUQ6NzY0NjMwMjc5ODA3NDAzOTI0OF8xNzgyMDk5MTY4OjE3ODIxMDI3NjhfVjM)

先点击设置第一个红色的用户名邮箱，你常用的就可以了。

3、如果你无法下载也可以直接在评论区留言，我会单独把安装包发给你。

4、安装好之后，有一个问题，我们的东西到底是存到哪里呢？这里也就是需要一个远程仓库。

可以选择Github 这个当然懂得都懂。也可以选择码云 [https://gitee.com/](https://gitee.com/) 这个国内的也不错。当然也可以选择阿里的[https://codeup.aliyun.com](https://codeup.aliyun.com/)。

当然这些都是免费的哈。

不过这里我选择的码云:[https://gitee.com](https://gitee.com/)。

5、git 跟码云之间如何交互提交呢，就是如何进行通讯呢，就需要设置密钥

```Plain Text
///Win+R，输入cmd,然后复制如下邮箱改一下

ssh-keygen -t rsa -C "你的邮箱"



// 然后连续回车三次，使用默认设置，不用设置密码即可



// 然后到Windows: C:\Users\你的用户名\.ssh\id_rsa.pub



// 将id_rsa.pub文件中的内容复制到你的远程仓库的SSH公钥设置中即可。


```

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YmNkZTgzYWQwMmVmM2YzYzQwMmZhNTMxNWMyMmNmYzlfOTBiOTMwZmQ2MDI0ZDNiZTIzMzAyYzA4NWZiNTU3NDFfSUQ6NzY0NjMwMjgyMDcxNDk0MTM4MF8xNzgyMDk5MTY4OjE3ODIxMDI3NjhfVjM)

复制到公钥中即可，保存即可，然后进行测试

```Plain Text
// 运行命令进行测试是否成功

ssh -T git@gitee.com


```

再在[gitee.com](https://gitee.com/)上创建一个仓库

点击新建仓库

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NTdmNzg0OTc0ZmIxZTY1NzNhNDRjMjg3NzJiNTFkZWVfOWYyODMxMTlhYjIwMzUzNzJkZjgzZDk0ZWU1OGFiNjJfSUQ6NzY0NjMwMjg0MzM3MjU1NTIzOF8xNzgyMDk5MTY4OjE3ODIxMDI3NjhfVjM)

6、填写仓库名称，路径，仓库介绍，选择开源或者私有，然后创建即可

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZmNjMDRkMDFkZjE5ZDQwOWI5N2Q2NzhiYTIyOWQ5YmVfYzcwM2ExYzNmNTIwZjg5NmM2MmE2NWY5MjIwNjc0OThfSUQ6NzY0NjMwMjg2NTg1NDAwODI2OF8xNzgyMDk5MTY4OjE3ODIxMDI3NjhfVjM)

然后初始化一下仓库。点击复制克隆仓库的命令

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Y2M0MGQ5MDE5NGJmMDIxMTUzMjE3MTI1NjdkYjlhYzVfOTAzZDU0NjY1ZjVkNmFjM2U4OTY1ODA4Nzc1Y2M3MjlfSUQ6NzY0NjMwMjg5MDQ0NTQwOTIwOF8xNzgyMDk5MTY4OjE3ODIxMDI3NjhfVjM)

然后再到想去的文件夹进行执行命令就可以了

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OGJmYjcwNWM2OWQ2ZGVhZGYzM2E5OWZjNmNkNWJiZTdfNDY1ZGVhYjhiZWM0MzdjNWIwZjM0NzBjNjRhMTI0ZWZfSUQ6NzY0NjMwMjkxMzQyNTM0NTQ3NF8xNzgyMDk5MTY4OjE3ODIxMDI3NjhfVjM)

看到如上图所示的命令，说明配置成功了。

## 回到OpenCode工具

在这之前我是把之前可以看千年两篇文章中的\\\`公众号文件夹\\\`下的内容搬移到新的文件夹中，然后再OpenCode工具中重新打开新的文件夹。因为这个文件夹相当于有了git环境。

接下来我们继续跟AI聊聊天看看我接下来将会干什么

```Plain Text
// 我的提示词如下

现在不写文章，帮我写一个工作流或者skil我用它来提交我当前这个项目到代码仓库


```

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MTczZmQzZTAzYTU1YjQ1ZDY1ZWUxNzg3OGQ0MGNlNzRfNDlmZmQyNjdiMGFlOGVlYWQwYzU3MDYwMDM2Mzg3OTFfSUQ6NzY0NjMwMjkzNTUxODY0NTE3OV8xNzgyMDk5MTY4OjE3ODIxMDI3NjhfVjM)

这里它直接给我创建了一个skill。既然它创建好了那就直接提交测试一下

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YTkxNDUyY2YwODM4ZjRkMTllYjhiYmU5MTY4N2UyOGRfNDA2MzI4NWFiZTNkM2U0MzIyMzAyODRjZmQyNTdmYjVfSUQ6NzY0NjMwMjk1NTAwMDA1Njc3NF8xNzgyMDk5MTY4OjE3ODIxMDI3NjhfVjM)

这里已经提交成功了，但是还没有推送大码云服务器上。也就是在本地有了提交历史，其实丢失的问题就解决了，看什么时候推送大服务器上而已。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MWFhYTVmMTJlOGVmNTBmNDQxNzcxNjAyMDRlNTlkMmZfNGRlOWEyYWVlMTI1NGIwMGI1NjNmOWFhZmNmMDhhOGVfSUQ6NzY0NjMwMjk3ODgyNzUzNzM1Nl8xNzgyMDk5MTY4OjE3ODIxMDI3NjhfVjM)

我们再到服务器上去看看

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=N2YxNzczNjYwOGM4ZDRiOTNiY2E2ZGU3MWI4MjE0MjJfYjNmMTQ1NGY0N2ZjYmQ0YTBhMjU4YzA2MTlkNmIzZWJfSUQ6NzY0NjMwMzAwMDAwNDc3NDg3MF8xNzgyMDk5MTY4OjE3ODIxMDI3NjhfVjM)

看到服务器上也有了项目文件，初步大功告成了。

## 总结

也就是你是不是的就可以直接在聊天框中输入 “提交项目文件” 或者“推送项目文件”，它就会识别到这个skill来为我们生成提交历史，并备份到服务器。

通过我们安装的可视化工具也是可以看到提交记录

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZjA1MWU1MWNjMGQyZGI0NWMzNmVkZGRiNGQyNTc3Y2VfNjBlZmZjOWM3ZjRjMmVjODJjOWJlMWRlMDBlODg1MWFfSUQ6NzY0NjMwMzAyNDAxMjkwNTQ0Nl8xNzgyMDk5MTY4OjE3ODIxMDI3NjhfVjM)

并且想查找历史也可以通过这个工具一目了然。当然git的功能其实非常强大，你有兴趣也可以借助AI进行了解和学习。
