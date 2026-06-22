# 大早晨起来发现window巨慢，原来是C盘快满了，于是我就让OpenCode检查干干干，OpenCode一顿操作50G就有了

​

![图片以绿色放射状背景为主，上方文字为“大早晨起来 发现电脑巨慢 原来是 C盘快爆满了”，中间文字是“我用 OpenCode 搞一下”，下方文字为“50G空间就有了！”。图片与上下文紧密相关，上下文提到作者发现电脑运行缓慢，原来是C盘快满了，于是使用OpenCode清理，最终腾出50G空间，图片正是对这一情况的总结和强调，直观呈现了清理结果。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OTk0ZWU5OWRiOWZjZjIwYzc0ZDkzZDQ1OWY5Yjc4M2FfYzJjZWMwNjkwNzczMzM2NTYxNzk1NmU2OGI4MmU2ZmRfSUQ6NzY0NjMwNzcxMTk5OTY5MTczNV8xNzgyMDk5MTcyOjE3ODIxMDI3NzJfVjM)

最近Codex桌面客户端mac和window都支持了，体感上身边用的人会越来越多，不知道4月2日活动结束后会怎么样，还有接近一个月的时间能piao的快去。

我的电脑上一直还是装着OpenCode 的客户端，相信使用的人也不少。今天就还是让OpenCode来看看，我Window电脑突然慢了很多，然后我才发现原来C盘快满了。

![图片展示了Windows系统中多个磁盘的存储情况。左侧依次显示本地磁盘（C:）、文档（E:）、新加卷（G:）的可用空间为6.96 GB、24.7 GB、34.3 GB，总容量分别为446 GB、182 GB、446 GB。右侧依次显示Software（D:）、64WinXP（F:）、新加卷（H:）的可用空间为42.3 GB、13.8 GB、38.4 GB，总容量分别为184 GB、198 GB、225 GB。这些信息与文档中提到的C盘快满导致电脑变慢的情况相关，直观呈现了各磁盘的存储状态。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NTUzZjJiOTk1ZmUyYjBmNGQ4YzE2NmRhNzU3MmUzNzRfZTE1NzEyYjFiMGFhMDI0NzkyNzE2ODJmMWY1YTk4MjhfSUQ6NzY0NjMwNzczOTkwODI5NTY1Ml8xNzgyMDk5MTcyOjE3ODIxMDI3NzJfVjM)

500G的C盘为什么也快满了，最近也没干什么怎么就满了，导致我电脑最近都慢了。

这是过年期间我收藏的雨神的解决方案:

> 2月26日

刚刚看了，但是我用不了呢: 它的核心逻辑是将其他盘的闲置空间迁移到C盘。而我这几个盘基本都要红了，没什么空间了。而且我的C盘是固态硬盘，其他是机械硬盘，两个也没办法合并。

我该怎么办？

我该怎么办？

我该怎么办？

对呀，现问问AI啊。

## “你帮我直接看看C盘为什么快满了”

![图片展示的是OpenCode与用户关于C盘空间问题的对话界面。用户询问C盘为什么快满了，OpenCode回复正在排队中。随后，OpenCode列出多项操作，如显示C盘使用状态、查找最大顶级C盘文件夹等。最后，OpenCode告知C盘仅剩7.46GB，已接近满状态，并将继续定位哪些目录占得最多。该图片与上下文紧密相关，直观呈现了OpenCode对C盘空间问题的处理过程及当前状态。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NjYxMDVlMjcxZmZmOGFjYjhmMGJjZDk5OTkxYWE2NmNfMTYzZjY0ZmYzY2Q4MWE0NGU1NzViMDBhYzE0NTQxMjRfSUQ6NzY0NjMwNzc1OTI0ODM0NjA0Ml8xNzgyMDk5MTcyOjE3ODIxMDI3NzJfVjM)

这是事实，还好你判断对了，继续高看你一眼。

![图片展示了OpenCode对C盘快满原因的分析。C盘总容量446.25GB，仅剩7.46GB可用。最大占用空间的不是普通文档，而是C:\\pagefile.sys，占64GB。其次为C:\\Users\\Administrator\\AppData\\Local\\Temp，占10.56GB。此外，还列出了下载目录、安装目录等占用较大的系统目录，如WinSxs、Installer等。最后给出先处理的几处，包括清理临时目录、删除或转移下载大文件、检查pagefile.sys等。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OWIwMGViNWMwMmZiMzBiMWUxMjA2ZDVhYjQwY2QyYTBfN2Q1MGY1YzAwMzIzZWM4MDg4MWM1ZTI5ZTAwOGNlZDRfSUQ6NzY0NjMwNzc4OTAxMjE1OTQ0NF8xNzgyMDk5MTcyOjE3ODIxMDI3NzJfVjM)

看来OpenCode还有点东西，主要有以下几个原因

- pageFile.sys 占了64GB
- Temp占了10.56GB
- Downloads 占了3.78GB
- WinSxs 占了8.29GB
- InStaller 占了5.94GB

光这些就不少了，口算一下好像大致有90G。

## “直接继续排查pagefile.sys 这个文件为什么这么大”

![图片展示的是OpenCode平台的对话界面，显示“直接继续排查pagefile.sys为什么这么大”及“排队中”等信息。下方列出Shell命令，如“Shows pagefile allocation and usage”等，用于查看虚拟内存配置等。下方文字说明pagefile.sys之所以有64GB，因虚拟内存非系统自动管理，而是手动固定/半固定配置，当前设置为C:\\pagefile.sys 32768 65536，表示初始大小32GB、最大大小64GB，因此文件会长得很大。该图片与上文排查pagefile.sys占用大量空间的原因分析相关，提供了排查依据。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MzVjNDkwNzA0NDU5MTcwMzQ4ZjA1NWNiYTc2ZGY3ZDBfN2Y0NzA5ZWRlOThjOWEzYjMwODE4ZGZhY2E3NmQ1MTdfSUQ6NzY0NjMwNzgxMDMwNTAxODg1Ml8xNzgyMDk5MTcyOjE3ODIxMDI3NzJfVjM)

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZmFkOGUwNzYxNzU1ZWRiNGRkYzNhM2NkMDY0MDUxMDdfNDdlZjhkY2E1MTUxMDVmYTAxZGNiYTIwMDQ2N2QyODNfSUQ6NzY0NjMwNzgyODE1NjIwNjAxMV8xNzgyMDk5MTcyOjE3ODIxMDI3NzJfVjM)

看他这意思是可以降下来的。

## “能直接帮我改吗”

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZGY4OTM0ZTIxYWRkZDQzMTAwN2IyZTE4NWY3OGNlNmRfNjgwM2EwOGY4MTQxN2ZlNTU5MjgxYTU1ZjdiM2U0OTJfSUQ6NzY0NjMwNzg1MTExOTk1NDg4Ml8xNzgyMDk5MTcyOjE3ODIxMDI3NzJfVjM)

牛逼很快就改好了，简直太强了，它上面说叫我重启，算了我重启一下吧。

“继续清理Temp”

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Mzg5Mjg5MzI0NDM0NzM3MWIwMmY3YzQxNjY3ZDM5NzBfNmEzNmRmZWVhOWQwMDJiNWY5N2YxNDMzMWI2YmRjYzdfSUQ6NzY0NjMwNzg3MTEwMTg2NDg4OF8xNzgyMDk5MTcyOjE3ODIxMDI3NzJfVjM)

让他继续帮我删掉两个大文件

## “帮我把这两个文件删除”

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=N2M3NDVjNmQwYjRhMDRiY2NjZGU5NDE2MDM3M2U1NTBfMzY1NWFmNjljYzU0NzFjYTYwNGRmYjllZGM5OTFlNjJfSUQ6NzY0NjMwNzg5MjczNjQ2MTc1Ml8xNzgyMDk5MTcyOjE3ODIxMDI3NzJfVjM)

最后回到我的电脑看看效果

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ODUxYjBhNGZkYzgxMjAwOTQ0ZTAxZGM1NmVlYjdkOTJfNmExMDYzZGRhM2E0ZmVlZDhjYWM5ZGYwNTk5YWI5YTlfSUQ6NzY0NjMwNzkxNjM0NjA1MTU0NF8xNzgyMDk5MTcyOjE3ODIxMDI3NzJfVjM)

刚好50个G就这么轻松的挤出来了，到底是OpenCode强还是GPT-5.4强，我觉得可能都有原因吧。

行了先用一段时间看看后续还会满不？

如果你也有类似的问题也可以让AI进行检查一下。但是请记住了，执行前一定要确认对电脑的影响，如果不清楚影响可以多几个AI进行确认，因为有些操作可能是不可逆的，一旦执行导致电脑不能用了，也就很尴尬了。

好了，今天就分享到这里，希望我的思路对你有帮助。
