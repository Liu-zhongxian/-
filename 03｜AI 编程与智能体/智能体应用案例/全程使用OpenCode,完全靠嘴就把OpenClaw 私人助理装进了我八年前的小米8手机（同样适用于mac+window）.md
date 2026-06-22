# 全程使用OpenCode,完全靠嘴就把OpenClaw 私人助理装进了我八年前的小米8手机（同样适用于mac+window）

​

![图片展示了全程使用使用 自动生成图片](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZmVjZmE2ZjRmNTZmYTYyMGFkNjZhMDg1YWRhMjRjZmZfZGZhYmUyMTYwNzY4MmQxYTBhNDJkYTA4ODA4ODMzY2NfSUQ6NzY0NjMwNjEzNzI5MTU3NDIwMl8xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

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

![图片展示了关于Termux开源项目的回答内容。Termux是一个Android终端模拟器和Linux环境应用，主要功能包括在Android上提供完整的Linux命令行环境、支持包管理器安装软件包、运行Linux工具和编程语言、支持插件扩展功能等。简单来说，它让Android手机/平板变成能运行Linux命令的便携设备，常用于开发、脚本编写、服务器管理等场景。该图片与文档中介绍Termux相关功能的上下文对应，是对Termux功能的详细说明。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZmNhZWNiZTdjMWUxNjUxMzZiZDlkMjA0NmMxMTVmNTBfODM1NTNkZWViNDY3ZTFkZTlhODI2Y2NjNWE5MGI3ZjRfSUQ6NzY0NjMwNjE1OTM0MzQyMjQwNl8xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

## 第二步

**给我下载一个最新的apk**

![图片展示了在OpenCode中下载Termux最新apk的回复内容。显示已下载完成，文件保存在当前目录，大小约112MB，为universal版本，适用于所有架构的Android设备。安装前需在Android设置中允许安装未知来源的应用。下方有“termux-v0.118.3.apk”文件图标，可点击下载。该图片与文档中“给我下载一个最新的apk”步骤对应，直观呈现了下载完成后的状态及文件信息。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ODQwOWEwY2NmYjYzZDZlMzBiODg5NDU5Zjg2ZTBkYjlfNDMwYTI1MGFkMDc5YjJjNzQ5YzlhMTVhOWVhN2ViNTlfSUQ6NzY0NjMwNjE5Mjk1MTc3NDE2OV8xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

最好用较新的，因为OpenClaw中开发基本都是用的较新的技术，太过于老旧，遇到的问题就多，而且不太好解决。

## 第三步

**拷贝到安卓手机**

我使用的微信进行传输，点击接收，然后右上角使用QQ浏览器打开安装即可，然后打开Termux进行测试，如果出现下图的界面说明安装成功

![图片展示的是在Termux终端界面，显示“Welcome to Termux!”欢迎信息，包含Docs、Donate、Community等链接。下方列出与包操作相关的命令，如Search、Install、Upgrade等。还提示订阅额外仓库，如Root、X11等，以及解决仓库问题的命令。界面底部有ESC、/、HOME等快捷键标识。该图片对应文档中“拷贝到安卓手机”步骤后的“测试安装成功”的说明，若出现此界面则说明安装成功。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YTQ1MDAzNmJmM2VhYzI3MjZiOTI0ZDRhNjkzYzQ3MzhfOTcwZDZkMmJlZjE5NDAxNGQ1NjBkZDEyN2UwY2Q3Y2NfSUQ6NzY0NjMwNjIxNzE0MDU4NzQ5NF8xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

## 第四步

\*\*开启远程操作手机，\*\*已经安装完毕，能否在window上远程安卓手机

![图片展示了在Windows上远程控制Android手机的三种方法之一，即SSH远程终端。通过Termux搭建SSH服务器，Windows终端连接。在Termux中执行安装OpenSSH、设置密码、启动SSH服务器、查看用户名等操作。在Windows上使用PowerShell或Git Bash，输入ssh命令连接，其中<用户名>和<手机IP地址>需替换为实际信息，端口为8022。该图片与文档中“开启远程操作手机”步骤相关，为在Windows上远程控制Android手机提供了操作指引。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YmM1YjliZGViOTY4YTA5ZjE2NjlhNDc5NjdiYjdmMzhfNjE0MWRjMjAxZTZiMTg3ZTVlNWQ2ZTY2MTJlYTY1OGNfSUQ6NzY0NjMwNjIzNzIyNjQyMTIwMV8xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

> 注意一下：sshd这个命令后面还会经常用到

看上面写的‘方法一’给我提供了三种方法，剩余两种我暂时就不考虑

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YWVmMmM2ZjEzMTllZGMwYTFlMGVhNzdmNGI0OTU2ZmFfNmNkNmMzMjI0NDBiOGVmZWI4ZWQ0ZDNiOTcyOGU1YjRfSUQ6NzY0NjMwNjI1ODY2ODE3ODM3OV8xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

这两种方法有兴趣的也可以试试。

这里我先按照第一个方案执行了，顺序执行上面‘方法一’中的四个命令就可以了

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MmNjM2ZkYzAwOWM3NmU2NGQzOTdiMTY5Y2M0YTNiYjdfYTY5OGMzZGRkMDU4NGQ0YmQxNDQ0NmVkOTg1YTUyZmNfSUQ6NzY0NjMwNjI4MzkxMzU2MzA3OF8xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

要记得自己设置的密码哈

装好了，开始使用window或者mac进行连接，不对好像没有手机IP，继续问问OpenCode。

## 第五步

上面我使用的是第一种方法，IP地址怎么获取

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZmE0ZWE3OTFhNmQ2M2VmYzk2YmJhOTg0NGJjMTdkZGFfOGQwZGJiOTI3NDhmYWYzYmQ3YTVhZjA5OGRjM2VhY2NfSUQ6NzY0NjMwNjMwNDA4NDE1MTI1NV8xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

我在termux中，直接使用方法2，但是它提示我要先执行pkg install iproute2

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NTc2NWQ5NTUyZDE5NGZkOTk4YTg3YTJlZDU1NTY2YWVfODE5OTUxMzU4ZmRkYjkxODljZmNmNGE4ODkzMWNkNmZfSUQ6NzY0NjMwNjMzMDkwMjI4NTI2NV8xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

根据上面如图所示之后，就可以继续向下看

在我们的window或者mac的令行工具输入这个命令

ssh u0\\\_a242@192.168.1.6 -p 8022，回车后再输入密码

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NDYwMGRjMWQyMWU5MWVlY2FjZGIxYTY3ZThmZjgzMWVfYTIwZTE3YWVlZjMyMmU0ZTQ3YzQ1ZWUyMjI1MjNkM2ZfSUQ6NzY0NjMwNjM1NDE3NjU5Mjg0M18xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

出现如上图所示，说明我们成功远程了我们的安卓手机了。

其实这里如果是在局域网就没啥问题了，随时可以连接。但是比如我现在在地铁，或者在户外，我想练怎么办呢？继续追问OpenCode

## 第六步（这里简单一点暂时可以省略，因为上面局域网已经可以连接了）

可以了，现在可以远程了。但是这个只是局域网的，能否随时可以连

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=M2NmNmQwYzk3YWJkNmFlYTA0YTNjNDkwMDEyYTNlMDVfOGE1MWJkM2FmYzAzNzYyOTEzMjI3MDQzODg0ZDljNTdfSUQ6NzY0NjMwNjM3MjI3MTMyODIyNl8xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

## 第七步

Tailscale 给我下载window安装包和安卓安装包 都要最新的

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MDk4YmQ0NDhhOTZmYTRhYmQyZmFlZjFmZjg5ZTBjYjNfMDM2NTNlYWI2OTNjODBiYWRiZWE0Njk0ODZjYTUzNTFfSUQ6NzY0NjMwNjM5NTgwOTQ1MDk0OF8xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

## 第八步

现在我就去进行安装了。安装完毕，再打开tailscale官网。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MmM3ZGVkZmY5NTk5ZGEwMDBiMGMwNjBlNTU4NzJjNTFfOTNlYTY5YTYzZmY0OGIzOTIzMmQ4MzUwNTg3MGIwYmZfSUQ6NzY0NjMwNjQxNTg1NjQ4NzM3MV8xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

左侧的一个字段就是IP，我就没漏出来了，我现在让OpenCode来给我连接试试看。

（tailscale 有付费功能，也可以换成别的开源工具，这里提一嘴）

## 第九步

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OWZjNTFlODJkY2U4YjdlZjcxZTEyYTJhMDgxZGE2NzdfYjYzMjQ3YjFmNmJkYzI1YmExMTY3NjhlZGRjOTIzMDNfSUQ6NzY0NjMwNjQzOTg5NTgyOTQ1Nl8xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

接下来我直接让OpenCode 给我远程登录我的安卓手机

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Y2RiNzNlNTNkMDVhODVhZDA5YjgyNmQ3NGZmMTI5MzJfN2I5ZWY4MDI3OGJkMTgzYTNmYmE2ZmM3NTA2YmEwMzVfSUQ6NzY0NjMwNjQ1OTU2ODk1MDIyMl8xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

这里最好生成SSH 密钥，相信我你后面玩的话还会遇到这个问题

接着我叫他给我把上面的脚本生成一个skill,方便我日后经常使用，并将密码配置在单独的配置文件中

## 第十步

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MWFmYjZmNjkwNmE2ODVmYzY0ZDljOGM3M2MzMzk2OWFfNzY3NjRhNmMwNWQ0MGJiZGRlZTgxZDI1NDFkMGM3NTlfSUQ6NzY0NjMwNjQ4MDQzODY2MDA2MF8xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

下次你只需要直接呼叫他连接就好了。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YTU4ZGUyMDdlMzhiYTRmNGVhN2FkOWU2ZGYyNjE1MjFfMzg4Zjc1OWVjMzhiZjRkYTQwOTY3MDVhZWE2ZGUzYjlfSUQ6NzY0NjMwNjUwMDIzMTY2MjU0MF8xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

看到这里帅不帅，但是我不能让他为所欲为的事情。

## 开始进入正题

先让他分析这个项目能不能安装到我的米8战机上

[https://github.com/openclaw/openclaw](https://github.com/openclaw/openclaw) 给我看看这个项目能否安装在我的米8上

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YWFlMDAzZTI1ZGYyNDU4MTg1ZGY1YjE3ZGUxYTNkYWZfODM0NWRkZTZlYTRmN2ZjMjI3ODNlOGE0MDBiZGRhNzZfSUQ6NzY0NjMwNjUyMzk4MzEyMTM2MF8xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

条件挺多的，其实就是要安装nodejs git python 等环境，下面就让他开干吧

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MTgwNTU4MmY3ZTZiZjNiMTUwZjFhOGVjZDhiMTY3NGVfODAxOWFiNzlmOTIxMDg5MDM1ZDM4OGU5YTUxNzdjNTdfSUQ6NzY0NjMwNjU0NjY5MDkwMjk5MF8xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

**游戏开始了，潘多拉的魔盒逐渐打开**

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZDAwZjFiNGEwN2E0MDY0NDExNTZmYmEwMDIzMTIzMjVfMzIwM2Q1ZDgyYjc3YThjODI0YmNlMDExZjljMTY0YThfSUQ6NzY0NjMwNjU2NTI0Nzg5NjUyOV8xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

经过了差不多十分钟

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZTM1ZTQ3MDViNDFjZjgyYTFjMDllYzkxZjYxNzU2NjZfYWRiYmVjMDY2MzhmODYwNmMyNGViYjY1NDZiMTY0YmZfSUQ6NzY0NjMwNjU5MDYwOTQ5Mjk1M18xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

还要进行向导设置

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MDFjZjYyZWEwOTEyNzFmMzk2YWJiY2E4Mjk1ODRlMmJfNTcxMzE3MjkzNzFjMTE3ZDk2ZDhiMzE0OTE1ZTAzNDdfSUQ6NzY0NjMwNjYxMTAwMjU3NTgzMl8xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

由于我不清楚这个配置文件的位置

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ODE2NzVlOTE5NmM5ZGI0NmNhMDMwNjZlMDZhMDgyM2RfNWYzNzYwMDBlYmQwZDRjNjE2MjM2ZDIzYzUyZjc3OGRfSUQ6NzY0NjMwNjYyOTMyODE2MTc0MF8xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

直接让他将米8私人助理服务器上的配置文件，给我拷贝到本地，我修改完他再拷贝回去,我只改了两个配置(如上图箭头所示)。

然后进行配置模型，

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NDNjNmQ2N2MyMjQ0Yjk3MGFjOGQ4OTIzNWU3MjYxNTJfYmRkNjZhNDUwYjU4MzUzYzk4ZTE2OTZhMGUyOWFiNGJfSUQ6NzY0NjMwNjY1MjI0MTAzODMwMl8xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MGMxNmYxNjI3MWI5NGM0OWQ5YTJlZjZkNGUyZjI1OTBfZjYyMzA1MDA0MjI0ZTAyOWNlNDM1MjVmN2Y5ODUyOWRfSUQ6NzY0NjMwNjY2ODMyNjg0OTQ5NF8xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

配置完毕，准备开启

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Mjg4YjU4ZWQ0OTVlMjY4MWE1ZjNhYjQxYmJiZDZkZDZfNjgwZTE2NzQ0NmI2YTRhY2JkM2JmZjE3MmRmMWVjZjVfSUQ6NzY0NjMwNjY5MDQ2Mzk3NjQxN18xNzgyMDk5MDkyOjE3ODIxMDI2OTJfVjM)

最后一张图推特限制上传不了了。

其实就是我上一篇中手机在的预览对话成功的。

手机访问http://127.0.0.1:18789,要配置一下上面gateway 密码，目前在overview中进行设置，保存后，再去对话，如果AI回复你了就说明你部署成功了。

## 最后

都可以找OpenCode试试，而且每个人因为环境不同或者AI对话效果不同，经历肯定也不尽相同，我这里算是也只是提供一个思路，给愿意折腾的人提供一个途径。window 和Mac应该也是可以的。

快过年了，预祝大家一切顺利。
