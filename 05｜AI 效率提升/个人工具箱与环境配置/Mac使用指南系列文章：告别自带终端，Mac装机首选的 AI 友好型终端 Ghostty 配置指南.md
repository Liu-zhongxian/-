# Mac使用指南系列文章：告别自带终端，Mac装机首选的 AI 友好型终端 Ghostty 配置指南

# Mac使用指南系列文章：告别自带终端，Mac装机首选的 AI 友好型终端 Ghostty 配置指南

​

![图片展示了Mac终端工具Ghostty的相关信息。左侧是Ghostty的图标及文字，强调其为Mac新机必装工具，目前对AI终端最友好。右侧列出Ghostty的默认快捷键示例，包括Cmd + t新建标签页、Cmd + n新建窗口、Cmd + f模糊查找（可结合AI）、Cmd + k AI命令运行（示例）、Cmd + Shift + p命令面板、Cmd + Option + 方向键调整分割窗口、Cmd + 1 - 9切换标签页等。该图片与文档中介绍Mac使用指南系列文章中关于Ghostty配置的内容相关，直观呈现了Ghostty的部分功能与快捷键。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OTE1NGVhMjNlNzQ4YzkzZTlhMmNiNjZlM2YwYTA5MjRfZmJjMmM0ODJkYjgwYzUyNWI4ZjZmZjlmNDIwNDY2YjFfSUQ6NzY0NjMwNDEwMTc5ODIwMjMxMV8xNzgxNzcwOTkzOjE3ODE3NzQ1OTNfVjM)

这是这个系列第三篇文章，我会把自己最近从零开始梳理，整理 Mac 使用过程中的经验与步骤记录下来，作为留存与分享。如果拿到一款新的Mac，我最先安装的终端工具就是Ghostty。

我的Mac使用指南系列文章：

- 1、**<cite doc-id="JsWtwVCx5iszo4kM19jcWv8lnmd" file-type="wiki" title="Mac使用指南系列文章：Homebrew软件包管理器从入门到精通" type="doc"></cite>**
- **2、<cite doc-id="QKCZwzUPBilOBzkdgoKckEITnme" file-type="wiki" title="Mac使用指南系列文章：从零搭建Codex App桌面端结合GitHub CLI，体验 AI 自动化克隆与提交" type="doc"></cite>**

一直是轻度使用mac的用户，所以一直使用的就是mac自带的终端工具。但是在飞速发展的AI时代，自带的终端确实不够给力，打开Claude Code 想换行输入信息不好搞，想多加个命令行窗体要重开一个切换也麻烦等等。

刚好，Ghostty这个终端管理器又对AI工具特别友好，不过它支持mac和linux，但是目前还不支持window。

如果你使用AI终端比较多，比如Claude Code、Codex、Gemini Cli,那么这个终端工具或许你可以试试看。

## 1、codex app中安装ghostty

当然了你也可以使用其他的AI 客户端工具进行安装，都是没问题的

![图片展示的是Codex App中安装Ghostty后的界面。界面中说明Ghostty已安装，版本为1.3.1，应用在Ghostty.app。还提到本次Homebrew安装的是桌面App，本机默认没有把ghostty命令放进PATH，但可执行文件在ghostty，可直接从“应用程序”里打开。界面右上角有“直接帮我安装ghostty”按钮，下方有“已处理3m 33s”提示，底部有“要求后续变更”选项卡及“+”按钮等。该图片与上文介绍在Codex app中安装Ghostty的内容相呼应。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Y2I1OGE4ZGJhYTg3NjM4YTRmZWEzNzFjOGU4MGRjZDVfYjYxYjRhMTRjMjZmYTg4MzFhYjFhNDI0ODUyZGQ2ZTlfSUQ6NzY0NjMwNDEyNjU3ODI4MTQzM18xNzgxNzcwOTkzOjE3ODE3NzQ1OTNfVjM)

安装完毕，它是一个单独的APP应用，找到它，如果无法打开

![图片展示的是Mac系统中安装Ghostty终端管理器后，若无法打开时弹出的警告窗口。窗口上方有Ghostty的图标，下方文字提示“未打开‘Ghostty’，Apple无法验证‘Ghostty’是否包含可能危害Mac安全或泄漏隐私的恶意软件。”并有“完成”和“移到废纸篓”两个按钮。该图片与上下文紧密相关，上下文提到安装完毕后若无法打开，需点击右上角“❓”->“隐私与安全”->“安全性”->“仍要打开”来解决此问题，此图直观呈现了无法打开时的提示窗口。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NmY3MWRiOWMyMTI1MmY0ZWQ2MjA5NjNkNWUwMjgwZGZfMTgwNmM5YzI3ZmM4MzNhN2NiMGIwYTMwYjMxMTJjNDJfSUQ6NzY0NjMwNDE0ODg2NjU5OTg3OV8xNzgxNzcwOTkzOjE3ODE3NzQ1OTNfVjM)

点击右上角❓-> 点击隐私与安全->安全性->点击仍要打开就可以了。

![图片展示了Mac系统中“安全性”设置界面。左侧为系统偏好设置菜单，选中“安全性与隐私”。右侧“安全性”部分显示“已阻止‘Ghostty’以保护Mac”，下方有“文件保险箱”“配件”“锁定模式”“后台安全改进”等选项，其中“仍要打开”按钮被红色框突出显示。该图片与上文“如果无法打开Ghostty，点击右上角❓->点击隐私与安全->安全性->点击仍要打开”内容对应，直观呈现了操作步骤中需点击的“仍要打开”按钮位置。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MWJjNzkxMzY1ZmVhMzVjZTE2YjEzOTc0NzIxZDBiZjFfYzg0NDYxNWNhNTU3MjE4YjkxY2E3ODNiNzk3ODUyN2JfSUQ6NzY0NjMwNDE2ODE2OTM5MzExNF8xNzgxNzcwOTkzOjE3ODE3NzQ1OTNfVjM)

如果你担心AI执行有问题。同样可以再终端下执行如下命令,如果你还没安装Homebrew,请查看我上面系列文章的第一篇。

```Bash
## 先通过命令查找工具

brew search ghostty



## 安装工具

brew install --cask ghostty



## 也可以去官网进行

## ghostty.org/download


```

## 2、配置

上面安装完了，可以直接到App中查看点击使用，也可以进行设置命令行中开启如下图

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YzBmOTM5ODgxYzFjODY0ZDE3M2U2YzgyZThjYTM4NzlfNzMyZjUxYmRmMGZmZDc2NDZhYWQ5YzJlZTkzYjhjMjZfSUQ6NzY0NjMwNDE5NTE0NjU2NjU5NF8xNzgxNzcwOTkzOjE3ODE3NzQ1OTNfVjM)

设置别名完毕，再让他生成一份“适合写代码”的Ghostty初始化配置。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YjMyMTc2MjgzZjFkNmIyYzhiZjM2NzY0ODRmNmNmMDBfZTgyYzc2ZTRlMWU5NzAyOWVjOGM1NGFmNzJmMWFhOWVfSUQ6NzY0NjMwNDIxOTA4NzIyNzg2OF8xNzgxNzcwOTkzOjE3ODE3NzQ1OTNfVjM)

我暂时就这么用用看，可以双Tab，然后 Command + 1, Command +2 轻松切换Tab。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MmYxMWZmMGQ3MGVjNzQ2YWE4MWRkOTU4MjFjNWE1NjhfMDZkNjJiYzhmOGQzZTQ2ZDVmNzM0NjYyZWYxMTBmYTNfSUQ6NzY0NjMwNDIzNjc4NzY2NTg1MF8xNzgxNzcwOTkzOjE3ODE3NzQ1OTNfVjM)

也可以一个Tab 左右两个命令行窗口： Command + D

也可以一个Tab上下两个命令行：Command + Shift + D

还可以通过Command + option + left 向左边聚焦，其他三个以此类推

这里我也提供一个完整的配置

```YAML
# ===========================

# Ghostty 完整配置

# ===========================



# --- 外观 ---

# 主题跟随系统深色模式自动切换

theme = light:Catppuccin Latte,dark:Catppuccin Mocha



# 背景透明度（0.0 ~ 1.0）

background-opacity = 0.88



# 背景模糊（配合透明度使用，毛玻璃效果）

background-blur = 20



# 背景图片（可选，放一张喜欢的图，终端瞬间好看）

# background-image = ~/Pictures/wallpaper.png

# background-image-opacity = 0.3

# background-image-fit = cover



# 标题栏集成 Tab 栏（比 hidden 多了 Tab 支持）

macos-titlebar-style = tabs



# 非活跃分屏的透明度（让你一眼看出焦点在哪）

unfocused-split-opacity = 0.9



# --- 字体 ---

# 推荐 Maple Mono NF CN（brew install --cask font-maple-mono-nf-cn）

font-family = "Maple Mono NF CN"

font-size = 14

font-thicken = true



# 连字支持

font-feature = calt

font-feature = liga



# --- 窗口行为 ---

# 永远记住窗口状态（分屏、Tab、目录）

window-save-state = always



# 新分屏继承当前目录

window-inherit-working-directory = true



# 新窗口继承字体大小

window-inherit-font-size = true



# 内边距

window-padding-x = 4

window-padding-y = 4

window-padding-balance = true



# --- Quick Terminal（下拉终端） ---

keybind = global:ctrl+grave_accent=toggle_quick_terminal

quick-terminal-screen = main

quick-terminal-position = top

quick-terminal-size = 50%

quick-terminal-autohide = true

quick-terminal-animation-duration = 0.15



# --- 分屏焦点切换 ---

keybind = cmd+alt+left=goto_split:left

keybind = cmd+alt+right=goto_split:right

keybind = cmd+alt+up=goto_split:top

keybind = cmd+alt+down=goto_split:bottom



# --- Shell 集成 ---

# 自动注入 shell 集成（光标样式、sudo、标题、SSH terminfo）

shell-integration-features = cursor,sudo,title,ssh-terminfo,ssh-env



# --- 滚动 ---

# 滚动缓冲区大小，单位是字节（默认 10MB，这里设为 50MB）

scrollback-limit = 50000000



# --- 光标 ---

cursor-style = block

cursor-style-blink = false



# 鼠标隐藏（打字时自动隐藏鼠标）

mouse-hide-while-typing = true



# --- 剪贴板 ---

# 选中即复制到系统剪贴板（和 iTerm2 一样）

copy-on-select = clipboard



# 复制时自动去除行尾空格

clipboard-trim-trailing-spaces = true



# --- macOS 专属 ---

# 退出时不弹确认框（如果你习惯了 Cmd+Q）

confirm-close-surface = false



# Option 键作为 Alt 使用（对 vim/emacs 用户很重要）

macos-option-as-alt = true


```

**使用方法：**

在 Ghostty 里按 Cmd + , 打开配置文件，把上面的内容粘贴进去。

里面使用了一个字体，别忘了装：

```Bash
brew install --cask font-maple-mono-nf-cn


```

然后按 Cmd + Shift + , 重载配置，搞定。

上面完整的配置文件参考的是这篇文章整理非常细致，我只是添加了分屏焦点切换的快捷键。

> 3月16日

## 3、最后

奉上一份Ghostty快捷键有时候可以多查查。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MGRjOGE3MDQxZDFmZjIyMTMzNzUxZDJlMGE2MmU2YWZfNWJkMTY3NDc4YzI3ZjU3OThjZGVlNzQyY2RmMGU2YzVfSUQ6NzY0NjMwNDI1ODM3NTk3NzkzMl8xNzgxNzcwOTkzOjE3ODE3NzQ1OTNfVjM)

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZTJiMWUwODVhMzZiYTVmNDBkMzc2ZGEyMTJjZWVmODZfNzc2OTQ4NTdjNzk4OGQ5M2ViOGNiYzJhMjhkYjdiNmVfSUQ6NzY0NjMwNDI3Mzc4MTYyMzc3Ml8xNzgxNzcwOTkzOjE3ODE3NzQ1OTNfVjM)
