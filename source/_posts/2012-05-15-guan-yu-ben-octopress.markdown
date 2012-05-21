---
layout: post
title: "关于本octopress"
date: 2012-05-15 22:32
comments: true
categories: technology
---
{% blockquote %}
记录下本octopress的搭建过程，全当做备忘。
{% endblockquote %}

### 基本startup
我的环境是fedora，所以是直接参考的官方文档，简单方便，见[这里](http://octopress.org/docs/setup/)。如果是windows环境，那么请果断google吧，很多前人已经总结的很好了。

这里记录下我犯的一个错误：在按照教程step by step的过程中，我执行了如下命令：
```
git add .
git commit -m 'your message'
git push origin source
```
然后我写了post，并deploy到github，我以为我的源文件也一起被commit到了source分支，所以就没有再次执行上面的命令。结果是我在其他地方clone后发现根本就没有之前写的post！汗，所以写完post后，别忘记了执行上面的命令。

### 插件
+ 评论插件。我用的disqus，在[disqus.com](disqus.com)注册账户，并设置好site，并得到唯一的短名字。然后在_config.yml中打开disqus_show_comment_count，并设置disqus_short_name为前面得到的短名字即可。

+ 侧边栏最近评论。同样是使用的disqus，可以参考[这里](http://chen.yanping.me/cn/blog/2012/02/07/comment-sidebar/)

+ 图片外链。这个我难得找，直接使用的国内的，[六间房](http://tu.6.cn/)，蛮方便的，但是感觉速度一般。

+ 分享。这个我使用的是[加网](http://www.jiathis.com/)的服务，都不用注册，简单方便。

+ 侧边栏标签。这个折腾了一会儿，想搞成中文的，但是没有成功，就放弃了，只用E文算了，反正我的标签也不多。




