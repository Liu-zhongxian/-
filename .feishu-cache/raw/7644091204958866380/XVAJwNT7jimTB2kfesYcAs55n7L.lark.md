# 大早晨起来发现window巨慢，原来是C盘快满了，于是我就让OpenCode检查干干干，OpenCode一顿操作50G就有了

​

![图片以绿色放射状背景为主，上方文字为“大早晨起来 发现电脑巨慢 原来是 C盘快爆满了”，中间文字是“我用 OpenCode 搞一下”，下方文字为“50G空间就有了！”。图片与上下文紧密相关，上下文提到作者发现电脑运行缓慢，原来是C盘快满了，于是使用OpenCode清理，最终腾出50G空间，图片正是对这一情况的总结和强调，直观呈现了清理结果。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NzM0OTBmNjgwMTJlMDRkMGU5YmVkODcyMGIyOTA5YjRfMWY1YzZmODI1YWE3YTI2MDA0NTM1MTE4M2QwNTE3YTJfSUQ6NzY0NjMwNzcxMTk5OTY5MTczNV8xNzgxNzcwOTk0OjE3ODE3NzQ1OTRfVjM)

最近Codex桌面客户端mac和window都支持了，体感上身边用的人会越来越多，不知道4月2日活动结束后会怎么样，还有接近一个月的时间能piao的快去。

我的电脑上一直还是装着OpenCode 的客户端，相信使用的人也不少。今天就还是让OpenCode来看看，我Window电脑突然慢了很多，然后我才发现原来C盘快满了。

![图片展示了Windows系统中多个磁盘的存储情况。左侧依次显示本地磁盘（C:）、文档（E:）、新加卷（G:）的可用空间为6.96 GB、24.7 GB、34.3 GB，总容量分别为446 GB、182 GB、446 GB。右侧依次显示Software（D:）、64WinXP（F:）、新加卷（H:）的可用空间为42.3 GB、13.8 GB、38.4 GB，总容量分别为184 GB、198 GB、225 GB。这些信息与文档中提到的C盘快满导致电脑变慢的情况相关，直观呈现了各磁盘的存储状态。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NDIyZjlkMjM0ODI2NWEwYzQwYzZkM2JkYzA0OTJkYWRfMDE4ZDk4NzhmMTMyY2VmODI1OWFjMjg0OGU1ZGVlMGNfSUQ6NzY0NjMwNzczOTkwODI5NTY1Ml8xNzgxNzcwOTk0OjE3ODE3NzQ1OTRfVjM)

500G的C盘为什么也快满了，最近也没干什么怎么就满了，导致我电脑最近都慢了。

这是过年期间我收藏的雨神的解决方案:

> 2月26日

刚刚看了，但是我用不了呢: 它的核心逻辑是将其他盘的闲置空间迁移到C盘。而我这几个盘基本都要红了，没什么空间了。而且我的C盘是固态硬盘，其他是机械硬盘，两个也没办法合并。

我该怎么办？

我该怎么办？

我该怎么办？

对呀，现问问AI啊。

## “你帮我直接看看C盘为什么快满了”

![图片展示的是OpenCode与用户关于C盘空间问题的对话界面。用户询问C盘为什么快满了，OpenCode回复正在排队中。随后，OpenCode列出多项操作，如显示C盘使用状态、查找最大顶级C盘文件夹等。最后，OpenCode告知C盘仅剩7.46GB，已接近满状态，并将继续定位哪些目录占得最多。该图片与上下文紧密相关，直观呈现了OpenCode对C盘空间问题的处理过程及当前状态。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OWU3NmU2MjNiYTQwZGExOGVhNmJiNWM4ZTgwODVmNTdfODg1ZDE5MzU1NzZkOWE1ZDY5M2M5OTQ3Yzg2MTBmMzJfSUQ6NzY0NjMwNzc1OTI0ODM0NjA0Ml8xNzgxNzcwOTk0OjE3ODE3NzQ1OTRfVjM)

这是事实，还好你判断对了，继续高看你一眼。

![图片展示了OpenCode对C盘快满原因的分析。C盘总容量446.25GB，仅剩7.46GB可用。最大占用空间的不是普通文档，而是C:\\pagefile.sys，占64GB。其次为C:\\Users\\Administrator\\AppData\\Local\\Temp，占10.56GB。此外，还列出了下载目录、安装目录等占用较大的系统目录，如WinSxs、Installer等。最后给出先处理的几处，包括清理临时目录、删除或转移下载大文件、检查pagefile.sys等。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NzQzZWM2ZWQxMjMyZjJkM2U4NWM3YzY1MjQ0NTdmMDZfN2UzYTFiODMxYmJlMmEwODNmNzBhZWYzZGZiZTQ1ZGNfSUQ6NzY0NjMwNzc4OTAxMjE1OTQ0NF8xNzgxNzcwOTk0OjE3ODE3NzQ1OTRfVjM)

看来OpenCode还有点东西，主要有以下几个原因

- pageFile.sys 占了64GB
- Temp占了10.56GB
- Downloads 占了3.78GB
- WinSxs 占了8.29GB
- InStaller 占了5.94GB

光这些就不少了，口算一下好像大致有90G。

## “直接继续排查pagefile.sys 这个文件为什么这么大”

![图片展示的是OpenCode平台的对话界面，显示“直接继续排查pagefile.sys为什么这么大”及“排队中”等信息。下方列出Shell命令，如“Shows pagefile allocation and usage”等，用于查看虚拟内存配置等。下方文字说明pagefile.sys之所以有64GB，因虚拟内存非系统自动管理，而是手动固定/半固定配置，当前设置为C:\\pagefile.sys 32768 65536，表示初始大小32GB、最大大小64GB，因此文件会长得很大。该图片与上文排查pagefile.sys占用大量空间的原因分析相关，提供了排查依据。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MDIxZGNmZGZkN2NjMjg0ZDJiY2Y1ZDM1ZTI3NzFjY2FfYmYyZjZjZjNjNmE2NGRmNzYzN2Y2ZjAzNTJjZTFhMDJfSUQ6NzY0NjMwNzgxMDMwNTAxODg1Ml8xNzgxNzcwOTk0OjE3ODE3NzQ1OTRfVjM)

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MGRjYWI3Y2FkZjhmNjcxYzUxNDZlMjc5Mjg2ODgyZDBfMzJlOWM5YjU2NDNkOTRmY2Q2YjU2MmZlZjgxOTA4NGFfSUQ6NzY0NjMwNzgyODE1NjIwNjAxMV8xNzgxNzcwOTk0OjE3ODE3NzQ1OTRfVjM)

看他这意思是可以降下来的。

## “能直接帮我改吗”

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YWFiYjdiYWI2NDc3MGQ5NDgxNGIyMDViZTBhNmQyNThfNTNjMzM4OGQ3ZDMzNjdiZTNhZjIyNTgxZDFhY2MzNjNfSUQ6NzY0NjMwNzg1MTExOTk1NDg4Ml8xNzgxNzcwOTk0OjE3ODE3NzQ1OTRfVjM)

牛逼很快就改好了，简直太强了，它上面说叫我重启，算了我重启一下吧。

“继续清理Temp”

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NjQyYjNjYTBmNzNiZjg4OTBhYzk4OWZkMDQ3MTgwY2JfNDgwNzY4MDZlNDA4ZjM0N2UyMWU0NDU4Y2E0ZTg0OTZfSUQ6NzY0NjMwNzg3MTEwMTg2NDg4OF8xNzgxNzcwOTk0OjE3ODE3NzQ1OTRfVjM)

让他继续帮我删掉两个大文件

## “帮我把这两个文件删除”

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZmQzNmUxNWIyNDQzMmVjZTQ4ZDBmYmFkZTIzNTMxOWFfZDlhZDU4NzJhMDBkMWM3OTU1MWUzMWVmYWU1YzBmM2VfSUQ6NzY0NjMwNzg5MjczNjQ2MTc1Ml8xNzgxNzcwOTk0OjE3ODE3NzQ1OTRfVjM)

最后回到我的电脑看看效果

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OTIyZWQwYzFhYjUxYTAyZTY2N2I4NzdkOTFiMWY2ZTVfOWM2ZGM0MDJmZjJmYmQ4NGVhZmIxMWJkOWE2MjFlZGNfSUQ6NzY0NjMwNzkxNjM0NjA1MTU0NF8xNzgxNzcwOTk0OjE3ODE3NzQ1OTRfVjM)

刚好50个G就这么轻松的挤出来了，到底是OpenCode强还是GPT-5.4强，我觉得可能都有原因吧。

行了先用一段时间看看后续还会满不？

如果你也有类似的问题也可以让AI进行检查一下。但是请记住了，执行前一定要确认对电脑的影响，如果不清楚影响可以多几个AI进行确认，因为有些操作可能是不可逆的，一旦执行导致电脑不能用了，也就很尴尬了。

好了，今天就分享到这里，希望我的思路对你有帮助。