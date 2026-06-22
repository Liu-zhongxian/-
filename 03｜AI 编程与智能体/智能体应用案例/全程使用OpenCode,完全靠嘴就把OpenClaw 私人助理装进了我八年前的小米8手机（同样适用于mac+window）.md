# 全程使用OpenCode,完全靠嘴就把OpenClaw 私人助理装进了我八年前的小米8手机（同样适用于mac+window）

​

![图片展示了全程使用使用 自动生成图片](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NGIxZGE5YmM1ZDRkNmI1MDVjMTM5MzRiOGJmMDIyNDZfNGMyM2U1NTc2MDNlOWJmZTk1MjczMDcxYzYwNGQ2Y2NfSUQ6NzY0NjMwNjEzNzI5MTU3NDIwMl8xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

上个周末，我的前端哥说你看“铁锤人”的OpenClaw 教程成为了技术圈的顶流。目前好像793W流量，恐怖如斯。于是我换了个角度，输出了我的米8实战，没想到也引来了部分爱好者的围观，虽然离“铁锤人”的流量还有很远的距离，但自认为流量也算不错，也是我没想到的，也帮我顺利突破2000粉丝。

围观者中：有小米10、苹果手机、一加、红米、平板、树莓派、mac min、window、还有一些特特有设备，也让我看到了像我一样的极客们，也躲在角落里在寻找志同道合的人，才引来了这场看似不经意的碰撞。

本质上，我对OpenClaw私人助理并不是特别感冒，因为Claude Code、Codex、Gemin Cli、OpenCode 等在电脑上的自主能力已经在这几个月被无限放大。而且也有类似插件，可以手机直接语音也好文字也好来实现，类似OpenClaw的代理功能。当然这可能只是在技术圈，而阿里云或腾讯云的一键安装助推了私人助理在普通AI关注者中的流行。

其实安装的难度不大，主要是使用的问题稳定性确实太多，毕竟这个东西很新，出问题是非常正常的。接下来我就像一个小白一样来教你通过OpenCode来安装私人助理，其实更重要的是学会思路，举一反三，看到这类工具真正的强大，我一般都是先跑通，再跑懂。一步一步搞明白。

希望OpenClaw这类工具能进化到像装一个APP一样就完成了部署安装，那才叫方便

再讲一下我的想法是怎么来的呢？

首先我的想法也不是凭空而出，主要基于以下三点：

早期我之前有在手机上体验过ollma 部署大模型，之前就使用过termux，termux相当于终端命令行工具。我相信应该也有很多人接触使用过。

然后前端时间刚好写过一个MCP，MCP的功能实现就是将本地项目，编译打包后自动上传到服务器的对应目录，刚好用到ssh远程服务器的操作。

第三点就是使用OpenCode 或者Claude Code 这类工具，他们在window或者mac上早已体现的有点无所不能的样子，只不过现在对接了一个远程遥控器一样，当然对需要的人来说那也是真的方便了。

当时上周末我还特意去找了一下，简单搜索好像还没什么教程，今天有没有就不清楚了。但是我感觉肯定有很多极客们甚至比我先行。

好了，所以基于以上三点开启，下面就开始了我的探索之旅。全程基本全靠OpenCode来进行黑盒的操作，我本想大不了就是打不开这个手机了。

下面所有的对话都是我在OpenCode中进行的。我是在window下操作的，mac下不知道会不会有不一样?

## 第一步

按照我的惯例来进行，先来问问OpenCode，因为我之前就已经知道要使用这个termux 的APK了（同样IOS也有类似的工具）。

[https://github.com/termux/termux-app](https://github.com/termux/termux-app) 这个开源项目用来干什么的

![图片展示了关于Termux开源项目的回答内容。Termux是一个Android终端模拟器和Linux环境应用，主要功能包括在Android上提供完整的Linux命令行环境、支持包管理器安装软件包、运行Linux工具和编程语言、支持插件扩展功能等。简单来说，它让Android手机/平板变成能运行Linux命令的便携设备，常用于开发、脚本编写、服务器管理等场景。该图片与文档中介绍Termux相关功能的上下文对应，是对Termux功能的详细说明。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Njc3NDQxZTBhZDU2Nzg4MzEzOTBkMjRlYTQ3ZDcyMTJfNjU2YTU0OTRiNGRiYjlhMjlmMjIwZjcyYWM4ZTI1ZWNfSUQ6NzY0NjMwNjE1OTM0MzQyMjQwNl8xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

## 第二步

**给我下载一个最新的apk**

![图片展示了在OpenCode中下载Termux最新apk的回复内容。显示已下载完成，文件保存在当前目录，大小约112MB，为universal版本，适用于所有架构的Android设备。安装前需在Android设置中允许安装未知来源的应用。下方有“termux-v0.118.3.apk”文件图标，可点击下载。该图片与文档中“给我下载一个最新的apk”步骤对应，直观呈现了下载完成后的状态及文件信息。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MjBlMDgwM2JiYThhYjM0MTgzMWI1MWRhMjRlOTRlMDhfYmQxMWE5MzhjYjg3N2I0YTQ5N2RjNmM2YTk0MWY2NWVfSUQ6NzY0NjMwNjE5Mjk1MTc3NDE2OV8xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

最好用较新的，因为OpenClaw中开发基本都是用的较新的技术，太过于老旧，遇到的问题就多，而且不太好解决。

## 第三步

**拷贝到安卓手机**

我使用的微信进行传输，点击接收，然后右上角使用QQ浏览器打开安装即可，然后打开Termux进行测试，如果出现下图的界面说明安装成功

![图片展示的是在Termux终端界面，显示“Welcome to Termux!”欢迎信息，包含Docs、Donate、Community等链接。下方列出与包操作相关的命令，如Search、Install、Upgrade等。还提示订阅额外仓库，如Root、X11等，以及解决仓库问题的命令。界面底部有ESC、/、HOME等快捷键标识。该图片对应文档中“拷贝到安卓手机”步骤后的“测试安装成功”的说明，若出现此界面则说明安装成功。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YTIyNTAyOTQ0YWRkOWVhMzFhZWQ4MzJlMDMwYTNiYjJfZTFhNGQwNTQyNjBiMDdhZDkxZTUzZGNkMjMxODI5NDZfSUQ6NzY0NjMwNjIxNzE0MDU4NzQ5NF8xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

## 第四步

\*\*开启远程操作手机，\*\*已经安装完毕，能否在window上远程安卓手机

![图片展示了在Windows上远程控制Android手机的三种方法之一，即SSH远程终端。通过Termux搭建SSH服务器，Windows终端连接。在Termux中执行安装OpenSSH、设置密码、启动SSH服务器、查看用户名等操作。在Windows上使用PowerShell或Git Bash，输入ssh命令连接，其中<用户名>和<手机IP地址>需替换为实际信息，端口为8022。该图片与文档中“开启远程操作手机”步骤相关，为在Windows上远程控制Android手机提供了操作指引。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YjYzYWUyZWQyYjk0NzQxNjRlZDdjMDIxNDYxMjkyZTZfMTRkNTY0ZGE0MmMxY2RmNjk2M2IxNGJiZTczODBkNWFfSUQ6NzY0NjMwNjIzNzIyNjQyMTIwMV8xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

> 注意一下：sshd这个命令后面还会经常用到

看上面写的‘方法一’给我提供了三种方法，剩余两种我暂时就不考虑

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZTM0YTM3YjU2NmZlMjY2M2UwN2U1ZDZlYzg5MDE4MzdfNTg3MmMyMGYzYTBlMDNlOGVkMTY3OWJhZWM2MjU0NDhfSUQ6NzY0NjMwNjI1ODY2ODE3ODM3OV8xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

这两种方法有兴趣的也可以试试。

这里我先按照第一个方案执行了，顺序执行上面‘方法一’中的四个命令就可以了

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZWQ4ZWI0M2MyYzJlYzdhZTMyZjdhN2ZiMzcwZTA0MjhfMzcxZjE0NDAyNzE3MjE1N2VmZWUxYjg4ZWI1ZGUzMGZfSUQ6NzY0NjMwNjI4MzkxMzU2MzA3OF8xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

要记得自己设置的密码哈

装好了，开始使用window或者mac进行连接，不对好像没有手机IP，继续问问OpenCode。

## 第五步

上面我使用的是第一种方法，IP地址怎么获取

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YjI5N2Q0MmRjYWE1MDE0M2Q0YzA4NDE4MjAzNjIyYzZfZjQxMzY1YTBlOTlmM2UxZDQyMmUxNjliZmUxNWJiNzZfSUQ6NzY0NjMwNjMwNDA4NDE1MTI1NV8xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

我在termux中，直接使用方法2，但是它提示我要先执行pkg install iproute2

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YjFhYzA1MGRiMTA4ODAwZDc3OWRiOTQ3Yzk0OGNlZThfZTg0YmFmZWIyYzA3NmQ3NmU3OWQ0ZDBjZmNmYTEwMjZfSUQ6NzY0NjMwNjMzMDkwMjI4NTI2NV8xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

根据上面如图所示之后，就可以继续向下看

在我们的window或者mac的令行工具输入这个命令

ssh u0\\\_a242@192.168.1.6 -p 8022，回车后再输入密码

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YWFlNDRjMTBjODEzZDcxMzYyYjQwM2NlNGRmNDY5ZjRfOTAxOTY3Y2Q2Y2IzYWFmN2VjMzFkM2IwNTA2MTAzY2FfSUQ6NzY0NjMwNjM1NDE3NjU5Mjg0M18xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

出现如上图所示，说明我们成功远程了我们的安卓手机了。

其实这里如果是在局域网就没啥问题了，随时可以连接。但是比如我现在在地铁，或者在户外，我想练怎么办呢？继续追问OpenCode

## 第六步（这里简单一点暂时可以省略，因为上面局域网已经可以连接了）

可以了，现在可以远程了。但是这个只是局域网的，能否随时可以连

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZjU1NTBlZWYzZjdjOWI3M2JiMDdhYjA1NTlkNDRhMjZfZmNhMzQ5NDg1NmY2MGMyOGFlNjc2NDk2NDQyZTNjYzNfSUQ6NzY0NjMwNjM3MjI3MTMyODIyNl8xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

## 第七步

Tailscale 给我下载window安装包和安卓安装包 都要最新的

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZDdlMDgyZDAxNzEzNmQwODlkYzQxMjQ2NGU1Nzk1YTBfMTJhMDNiNWY4ZDU0YWZjZjhmOTExMjYxMTA0YzFhNzZfSUQ6NzY0NjMwNjM5NTgwOTQ1MDk0OF8xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

## 第八步

现在我就去进行安装了。安装完毕，再打开tailscale官网。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YWFlNTZhYTEyOTYzOWNjMTFkNmMzNDM0YzlmMzdjNDVfMmQwNzEzYTk3OTg2M2VhOTgzZDM5YThhMmJjNzdhZDNfSUQ6NzY0NjMwNjQxNTg1NjQ4NzM3MV8xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

左侧的一个字段就是IP，我就没漏出来了，我现在让OpenCode来给我连接试试看。

（tailscale 有付费功能，也可以换成别的开源工具，这里提一嘴）

## 第九步

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NzYxMDllYzhjMzM3MDVkYjRhNzc4NjhkNGM2Nzg5ZDVfNjg3MmU4N2M0YTdiMGQxODQ0YWNjOTBjZmU2ZjI2N2FfSUQ6NzY0NjMwNjQzOTg5NTgyOTQ1Nl8xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

接下来我直接让OpenCode 给我远程登录我的安卓手机

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OTM2YzdhMWEwOGI2ZDZiN2Q2MGQwODJmZTVlNjdiNWVfNDI1ZDNkZTBkMzEwM2ZkNmQzMzc4NDNkNTJmYzEwNGZfSUQ6NzY0NjMwNjQ1OTU2ODk1MDIyMl8xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

这里最好生成SSH 密钥，相信我你后面玩的话还会遇到这个问题

接着我叫他给我把上面的脚本生成一个skill,方便我日后经常使用，并将密码配置在单独的配置文件中

## 第十步

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ODQ5ZWZmYzYxMTIwNDc1MjM0MDUxNGM4MTljYzQ0ZjNfMTA2MmVjM2NhNGJiMTQ3YzkwZjc0Njk4MGU1NGNiMDJfSUQ6NzY0NjMwNjQ4MDQzODY2MDA2MF8xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

下次你只需要直接呼叫他连接就好了。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YjQ5OWUxNWIxOWU3NmNjNTNhZmQ0MjdkNTI2MWE2MGRfYzU2MDYxNWQ1NzZjM2M3ODQ5N2UxMjJjY2ExMDlkODdfSUQ6NzY0NjMwNjUwMDIzMTY2MjU0MF8xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

看到这里帅不帅，但是我不能让他为所欲为的事情。

## 开始进入正题

先让他分析这个项目能不能安装到我的米8战机上

[https://github.com/openclaw/openclaw](https://github.com/openclaw/openclaw) 给我看看这个项目能否安装在我的米8上

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZjNmNDVhODhkOTQyYTc2MjdkNmRhZmMwZjJmODUyMjhfZWY5OTczODNhNzM5MGYyYzQ3ZTdhOTg2MWQ2M2I3ZDdfSUQ6NzY0NjMwNjUyMzk4MzEyMTM2MF8xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

条件挺多的，其实就是要安装nodejs git python 等环境，下面就让他开干吧

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MzcwOGRmNjhhY2JjMmQ3MTAxMDkwODI4NTZmODVlN2FfN2YwMGJlYWY4ZDBiNzIxNzNiYzhmZDVhNDUxYWQyNGVfSUQ6NzY0NjMwNjU0NjY5MDkwMjk5MF8xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

**游戏开始了，潘多拉的魔盒逐渐打开**

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Mzk2ODBhMDFiMDhjYjY2M2RmMTcyMjEyNWZiZDYxY2RfOWI4MmZhNWE1ZTg3NzRlN2NjY2UwOTFlOGMxNmIzMmFfSUQ6NzY0NjMwNjU2NTI0Nzg5NjUyOV8xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

经过了差不多十分钟

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MDk5MDllNDEwMjgzZGJlY2VmOTYwY2IxMzczNDQxOWJfODc1ZjhjODQ4Njg4N2Y0OWI4YTVhNjRkYjAyOWE5ZWRfSUQ6NzY0NjMwNjU5MDYwOTQ5Mjk1M18xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

还要进行向导设置

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZGUwNjhiNDYxYjJhZmM5MzNlMDc4NzVhYjZkNDY1N2RfZDMzNDhkY2NlNmQyNzE5M2E0Y2JlNTk4ZjA2MDQyZjlfSUQ6NzY0NjMwNjYxMTAwMjU3NTgzMl8xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

由于我不清楚这个配置文件的位置

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MTBkYzE0YzRkYzg4MDMwYjQ3ZTgyNTQyZjY4N2JkYTFfNjQyYzYxYjI3N2NhNTI0YjcyODZlM2Y2ZmUxMjljYjhfSUQ6NzY0NjMwNjYyOTMyODE2MTc0MF8xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

直接让他将米8私人助理服务器上的配置文件，给我拷贝到本地，我修改完他再拷贝回去,我只改了两个配置(如上图箭头所示)。

然后进行配置模型，

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NWFmMTVkNDNiNzNiODZiZGNmZTc3NmZlZjNiNDkwZDdfMGQyMjk3OWQ3MjhiNzljMzFjMDUyOTI0Y2JlODQwMTlfSUQ6NzY0NjMwNjY1MjI0MTAzODMwMl8xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YzdjYWQzZGU5YjVmMmU5ZDJhNmU1NjZhYzQ3NjllMmJfMGU0ZjAxYmI4MjI2N2Y3ODg0NGYxNDUyNTRjYWRkYmNfSUQ6NzY0NjMwNjY2ODMyNjg0OTQ5NF8xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

配置完毕，准备开启

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=N2FmMGI2MGQxMmRhYTE2M2RhNTY3ZDQ0MmZiZTNlMTNfMDcyMzViNzJiNDJmMTk5M2Q5ODFlMjVlYWY0NzE3ZjRfSUQ6NzY0NjMwNjY5MDQ2Mzk3NjQxN18xNzgyMTA3MjYzOjE3ODIxMTA4NjNfVjM)

最后一张图推特限制上传不了了。

其实就是我上一篇中手机在的预览对话成功的。

手机访问http://127.0.0.1:18789,要配置一下上面gateway 密码，目前在overview中进行设置，保存后，再去对话，如果AI回复你了就说明你部署成功了。

## 最后

都可以找OpenCode试试，而且每个人因为环境不同或者AI对话效果不同，经历肯定也不尽相同，我这里算是也只是提供一个思路，给愿意折腾的人提供一个途径。window 和Mac应该也是可以的。

快过年了，预祝大家一切顺利。

---

> 来源：飞书 · AI Spark AI Wiki ｜ 原文（最新版）：<https://lcnniolukk80.feishu.cn/wiki/CcJawJ50ci9i3hksCGbcZN70ndi> ｜ 归档：2026-06-22
