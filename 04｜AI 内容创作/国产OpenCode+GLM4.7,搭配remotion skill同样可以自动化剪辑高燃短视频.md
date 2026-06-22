# 国产OpenCode+GLM4.7,搭配remotion skill同样可以自动化剪辑高燃短视频

# 国产OpenCode+GLM4.7,搭配remotion skill同样可以自动化剪辑高燃短视频

​

![图片展示了OpenCode+GLM-4.7+remotion skill制作高燃短视频的流程。左侧是OpenCode和GLM-4.7，中间是准备技能，包括media - downloader下载视频素材、remotion - best - practices自动剪辑，右侧是高燃短视频成品，有字幕配音和切换动画。底部标注了国产工具、对话编程、素材下载、自动剪辑、字幕配音、高燃效果等关键词。该图与上下文介绍的使用国产工具和大模型制作短视频的内容相契合，直观呈现了制作流程。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NjA2N2ZkOWUwZDZiNmM5ZGIzMGRjMTQyMWRmNzFlZmNfODAyMDc0NGU1MzZlMTAwZDI1N2M2MjE0OTI2NjdmODZfSUQ6NzY0NjMwNjcyMzgwNDYyOTk0OF8xNzgyMDk5MTI3OjE3ODIxMDI3MjdfVjM)

因为我已经使用Codex生成过一次视频了，本文主要是想用国产的OpenCode工具，以及国产的大模型GLM-4.7 来看看他们配合的能力如何，没想到效果还是超出了我的预期，使用起来非常简单，全程都是跟OpenCode进行对话。

![图片展示了智能媒体下载器的界面。上方是“智能媒体下载器”标题，下方说明其根据描述自动搜索和_EOL addCriterion("图片")](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YTA1MzVlNDk5NzIzNjJjY2MzMGU3ZThjZTVjMmUxMjBfMzZhZmVlMDA2MjU3ZDExYWFhZGViYmUzMWQ3MDhmZDZfSUQ6NzY0NjMwNjc0NTE0OTY4ODgwMl8xNzgyMDk5MTI3OjE3ODIxMDI3MjdfVjM)

下面先看一个我用Codex生成的剪辑视频。



![图片展示的是电影《黑客帝国》中的场景。画面中，基努·里维斯饰演的尼奥站在前方，身着黑色西装，表情严肃。他身后有三名身穿黑色西装、戴着墨镜的男子，以及一名身着浅色上衣的女子。背景为绿色的门和墙，墙上挂着一些装饰物。该图片与文档中准备技能的内容相关，可能是用于展示技能应用时的场景背景。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZDRlNzUzOTI2NDgwMGEyNWE2NDNiNWUyMDIxOTVlMzRfMjVhMzVlMjI3ZmJmYzY0MmExNjhmMDFmZjQ0NWZhNmJfSUQ6NzY0NjMwNjc3MjM5NDg4ODE0NF8xNzgyMDk5MTI3OjE3ODIxMDI3MjdfVjM)

接下来就先进行准备工作

## 准备图片视频的 Skill

这是github上开源的可以直接下载放到skills文件夹下即可，我下面有操作怎么下载。

[https://github.com/yizhiyanhua-ai/media-downloader](https://github.com/yizhiyanhua-ai/media-downloader)

如果你不知道怎么下载也可以直接丢给OpenCode、Claude Code 、Codex 、Cursor等工具，它会直接把这个skill给你下载下来。下面我的提示词

> [https://github.com/yizhiyanhua-ai/media-downloader](https://github.com/yizhiyanhua-ai/media-downloader) 给我把这个代码仓库下载下来，它是一个skill,帮我放到对应的文件夹中

看下面截图已经到了我的Skills文件夹下了

![图片展示的是OpenCode对指令“给我把这个代码仓库下载下来，它是一个skill,帮我放到对应的文件夹中”的回复。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ODI0YThjNjEzYTNkOWRhZTk5ZjkyMmM0ZjJlYjAxMThfMThjOTRkNGY2YjEwZjcyZDliZGZkNDQ5NWU0YmVjODJfSUQ6NzY0NjMwNjc5NDI1MTQyMjY1MF8xNzgyMDk5MTI3OjE3ODIxMDI3MjdfVjM)

第一个skill准备完毕

## 准备第二个skill

直接打开链接 [https://skills.sh/remotion-dev/skills/remotion-best-practices](https://skills.sh/remotion-dev/skills/remotion-best-practices)

![图片展示的是在终端中安装remotion最佳实践技能的命令界面。命令为“npx skills add https://github.com/remotion-dev/skills --skill remotion-best-practices”，右侧有一个红色箭头指向该命令。该图片与上下文紧密相关，上下文提到准备第二个技能，直接打开链接https://skills.sh/remotion-dev/skills/remotion-best-practices，然后看箭头复制这个命令，或交给OpenCode安装，此图即为复制的安装命令。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NWU3ZDVkNTkxZTA3NjU3ZDAxM2FkMGM5MTM1YTdlOTBfMjUxMzgzNjE3NDA5N2UzOWE3NmVhMGM0YWNjODRlMDNfSUQ6NzY0NjMwNjgxODE5MjgzNzU4OF8xNzgyMDk5MTI3OjE3ODIxMDI3MjdfVjM)

看我的箭头复制这个命令,还是交给OpenCode给我安装

> npx skills add [https://github.com/remotion-dev/skills](https://github.com/remotion-dev/skills) --skill remotion-best-practices 帮我执行这个命令 安装这个skill

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZjY5MTAxMjRmZjJlNjExNjNlN2Q1ZTgyYTFiYmIxZGVfNmM5YThiMDUyODA0MTUwN2JhZDAxOWIyNjQ5ZDAxNmNfSUQ6NzY0NjMwNjg0NTAzNjY0NTMwN18xNzgyMDk5MTI3OjE3ODIxMDI3MjdfVjM)

## 准备完毕，开始出片

> 通过 media-downloader 下载一些基努里维斯的电影片段并使用remotion-best-practices（生成的项目就放在本工作区）剪辑成一个高燃的短视频。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MzVmMWIzMzAxYWUyMGQ3Mzk2NTNlMWEzNjU0NWI3ODFfNjY3M2U5NjNiMTIyZWYzNGEyNWFjZjYzNzFiYzM3MmZfSUQ6NzY0NjMwNjg2NjU3NDExNzgxNl8xNzgyMDk5MTI3OjE3ODIxMDI3MjdfVjM)

我一般喜欢点支烟静静的看OpenCode到底在干什么，有时候看他一直报错我就会停下来告诉他。其实我什么也没说，就说报错了你看看怎么处理。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NDRkZTA5ZmUxNTM1ODRlMzc0MjE4MmVhOGI3M2M1YTdfZjkwMDhjNzhmNmFhZjc3OTg2ZmM2Nzk3NGQyODZlY2ZfSUQ6NzY0NjMwNjg4ODE5OTYwNTE5Nl8xNzgyMDk5MTI3OjE3ODIxMDI3MjdfVjM)

它现解决了这个错误，然后继续它之前规划的任务了。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NGY3YWUyNTdmNzE2YWQ5YWJmYjM1MmE4ZDc3YWM4NTZfMGMyYThmMTNlN2YxMTIwY2M1ZGVhYWEzMTU4ODE5ZjJfSUQ6NzY0NjMwNjkwNjk0ODQ1NTM5Nl8xNzgyMDk5MTI3OjE3ODIxMDI3MjdfVjM)

两个时间段第一个接近8分钟，第二个接近19分钟，总共27分钟。

好了来看视频效果吧。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YzVmOWYxNmNkNmEwYjViZTQxNjdmNDc0ZDczNzdlMTVfMjVhMGNmNjc3N2JhNzdmMGRjZmUzYWU3NzViN2I4ZDJfSUQ6NzY0NjMwNjkyNjYzMDYwMzcxNl8xNzgyMDk5MTI3OjE3ODIxMDI3MjdfVjM)

我应该让他找高清视频的。也就是要找好的素材。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MzhmNGE3MjRjODVlMmZjNjZjNDhjMjRjOTE2ZWE4NzhfZjNmOTE0OGYzMjQyMmFlOTZiMTEwMTYxMTA5YTIwOWJfSUQ6NzY0NjMwNjk0OTYzOTYzNzk4MF8xNzgyMDk5MTI3OjE3ODIxMDI3MjdfVjM)

我当时应该限制一下片段个数和时间长度。不过也没关系。这里的字幕解决其实就是示意一下，然后我们根据场景去修改文字就可以了。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZmUwODU0MGZhN2Y3ZWM4ZDIwYzE0NjA5NTdhNmI5NDRfMWQzY2EyZmQ1NWI0MGJkYzg0MWVmYjc1NDY4N2U3MWRfSUQ6NzY0NjMwNjk2OTkzMDQzNTU1MF8xNzgyMDk5MTI3OjE3ODIxMDI3MjdfVjM)

我继续让他加点东西，左上角主角标识，左下角第几个片段标识，每个片段切换时的动画效

其实并不好看，也不炫酷，主要是来看能不能操作。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MTQ4NjNiZjk0ZmQyNTE4YWVmNjM2OTYyZGZjOTlmNjlfZjUxMjE0ZmYzZjllMDhiMTU3NmEyZjcwZTMyMDY2YTRfSUQ6NzY0NjMwNjk5MjA5NzI4MzAyMl8xNzgyMDk5MTI3OjE3ODIxMDI3MjdfVjM)

给字幕配个音吧，其实这里我应该部署一下qwen3-tts，可以定制设计声音，不过本地都还没部署，等有空了继续进行尝试吧。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZGI5ODRkOWM1YjFlNjMzNWJiODQzNTJlZDE4MmZlY2ZfZGFjOWMyNTA1NzYwODI1YjQzNTc0YmRmYjQ5MTFlZjFfSUQ6NzY0NjMwNzAxMjU5MDkxNDUwOF8xNzgyMDk5MTI3OjE3ODIxMDI3MjdfVjM)

## 最后

后期就是针对每个地方进行优化打磨，其实就这么简单 so easy。但是想要做一个好的剪辑视频出来也不是那么容易的，还是有很多的细节去研究。

好了今天的分享就到这里，希望我的分享对你有帮助。

最后如果你不知道怎么导出视频就问AI就好了。
