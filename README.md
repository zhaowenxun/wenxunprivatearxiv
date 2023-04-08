<p align="center">
<h1 align="center"> wenxun-Arxiv-追踪</h1>
</p>

<div align="center">
<p align="center">
  <a href="#使用说明">使用说明</a>/
  <a href="#参考资源">参考资源</a>/
</p>
</div>





---

<details open="open">
  <summary>Build Steps</summary>
  <ul>
        <li><a href="#website-settings"> ➤ 1. 托管网站设置</a></li>
        <li><a href="#Arxiv-domain"> ➤ 2. Arxiv领域偏好设置 </a></li>
        <li><a href="#highlight-scripts"> ➤ 3. 高亮脚本设置 </a></li>
        <li><a href="#workflow-settings"> ➤ 4. workflow设置 </a></li>
        <li><a href="#MyArxiv-website-settings"> ➤ 5. MyArxiv网页设置 </a></li>
        <li><a href="#Github-Pages-settings"> ➤ 6. Github Pages设置 </a></li>
  </ul>
</details>

<h4 id="website-settings">1. 托管网站设置</h4>

`config.toml`配置文件中，个人网站相关设置部分如下图所示：

<img src="./imgs/tutorial/2.1.1.png" style="zoom:45%;" />

此部分与个人MyArxiv托管的网站设置相关，默认设置如下：

```toml
site_title = "MyArxiv"
limit_days = 7
cache_url = "https://mlnlp-world.github.io/MyArxiv/cache.json"
```

- `site_title`：MyArxiv网站名称，默认为`"MyArxiv"`。

- `limit_days`：MyArxiv网站所缓存的过去几天的最新论文，默认为缓存过去`7`天的最新论文。

- `cache_url`：MyArxiv数据缓存地址，该地址设置与你托管当前项目的网站地址相关。
  - 若使用默认的Github Pages，那么会在`username.github.io`域名上托管该项目，项目具体地址为`username.github.io/reponame`，就要将`cache_url`设置为`username.github.io/reponame/cache.json`。
  - 若使用其他域名`yourarxivdomain`托管该项目，则要将`cache_url`使用对应的网址进行替换，设置为`yourarxivwebsite/cache.json`。

<h4 id="Arxiv-domain">2. Arxiv领域偏好设置</h4>

`config.toml`配置文件中，Arxiv领域偏好设置部分如下图所示：

<img src="./imgs/tutorial/2.2.1.png" style="zoom:45%;" />

此部分与个人定制的Arxiv领域配置相关，设置的样例如下：

```toml
[[sources]]
limit = 150
category = "cs.CL"
title = "Computation and Language"
```

- `limit`：每天更新当前Arxiv领域中的论文数目，默认为`150`，(*一般来说，大部分单领域Arxiv论文的每日更新数目不会超过150*。)
- `category`：所感兴趣的Arxiv文章领域标识，需根据[Arxiv](https://arxiv.org/)官网查找对应领域的标识。
- `title`：领域标识对应的领域名称，需根据[Arxiv](https://arxiv.org/)官网查找对应领域的名称。

上述设置为一个Arxiv领域对应的设置单元样例，默认设置涵盖NLP研究者主要关注的Arxiv中`cs.CL`、`cs.CV`、`cs.IR`、`cs.LG`以及`cs.MM`领域，使用者可以根据自己的研究偏好参照上述说明进行更改。

<h4 id="highlight-scripts">3. 高亮脚本设置</h4>

`config.toml`配置文件中，高亮脚本设置部分如下图所示：

<img src="./imgs/tutorial/2.3.1.png" style="zoom:45%;" />

此部分与个人定制的高亮信息相关，使用者在此部分可以根据自己的研究偏好，进一步添加定制化高亮信息。

```toml
[scripts]
highlight_title = "scripts/highlight_title.rhai"
highlight_author = "scripts/highlight_author.rhai"
highlight_conference = "scripts/highlight_conference.rhai"
```

目前所支持的高亮信息，包括文章标题、作者和会议名称三个方面。然而此部分所给出的信息只有脚本文件的位置，使用者需要转移到脚本文件夹`./scripts`下修改对应的高亮配置文件`./scripts/config.rhai`，其中文件中相关设置部分如下：

<img src="./imgs/tutorial/2.4.1.png" style="zoom:45%;" />

在`./scripts/config.rhai`中，定制化改动如下：

- `let titles = titles_model + titles_method + titles_type;`：标题的高亮可以自定义其内容，默认由***模型***、***方法***以及***类型***三部分组成：
  - `let titles_type = ["Dataset", "Survey"];`：添加需要高亮的文章类型；
  - `let titles_model = ["BERT", "GPT", "Transformer"];`添加需要高亮的文章模型信息；
  - `let titles_method = ["Pre-train", "Pretrain", "Prompt", "Self-Supervised"];`添加需要高亮的文章方法信息；
- `let authors_array = ["Yann LeCun", "Geoffrey Hinton", "Yoshua Bengio"];`添加需要高亮的作者信息；
- `let conferences = [];` 高亮的会议列表，默认包含了当前AI领域的大部分主流会议信息；

<h4 id="workflow-settings">4. workflow设置</h4>

workflow设置位于文件`./.github/workflows/update-feed.yml`中：

<img src="./imgs/tutorial/2.5.1.png" style="zoom:45%;" />

可以参考如下部分需要对此文件进行修改。

- `name: workflowname`：对Workflow进行命名，默认为`Update`。

- `- cron: "12 5 * * *"`：对Workflow运行的时间进行设置，即对MyArxiv每天更新的时间进行设置，*可以参考[crontab](https://crontab.guru/)，对时间进行调整*。

<h4 id="MyArxiv-website-settings">5. MyArxiv网页设置</h4>

完成MyArxiv个性定制化后，下面进行网页显示的修改，主要修改目标文件为`./includes/index.hbs`，使用者可以根据自己的风格喜好对网页格式进行各类更改，如下提供两个更改样例:

- 网页标题的修改：

  在`index.hbs`中，网页标题相关配置如下所示：

  <img src="./imgs/tutorial/2.6.1.png" style="zoom:50%;" />

  - 其中位于`line 56`的蓝线高亮部分为当前配置的网页标题，使用者可以自行进行更改：

    ```js
    <div class="header-title">
                    NAME YOU LIKE
                </div>
    ```

  - 其中位于`index.hbs `中`line 50 `的分区中已经注释掉的部分中，红线高亮部分表示将自己的`MyArxiv`仓库地址进行链接并对标题进行重新命名的相关设置，可以使用此设置，替代默认的网页标题，修改格式如下：

    ```js
        <div style="display:flex; justify-content:space-between; align-items:flex-end;">
            <div>
                <a href="https://github.com/username/reponame" style="text-decoration: none;">
                    <div class="header-title">
                        <span class="header-title-preffix">NAME YOU LIKE
                    </div>
                </a>
            </div>
    ```

- 徽章的修改：

  在`index.hbs`中，网页标题相关配置如下所示：

  <img src="./imgs/tutorial/2.7.1.png" style="zoom:45%;" />
  
  - 其中位于`line 125`的蓝线高亮部分为当前配置的网页时间戳，使用者可以根据自己需要进行自行更改：
  
    ```js
    {{time_format build_time "%F %T %Z"}}
    ```
  
  - 其中位于`index.hbs `中`line 119 `的分区中已经注释掉的部分中，红线高亮部分表示使用shield.io实时更新当前workflow的build时间戳，对`index.hbs`中`line 118`链接的workflow地址进行修改；可以使用此设置，设置徽章替代默认的网页时间戳，修改格式如下：
  
    ```js
    <img id="build-timestamp-badge"
                         src="https://img.shields.io/github/workflow/status/username/reponame/workflowname?label={{time_format
                        build_time "%F %T %Z"}}&style=for-the-badge"
                    alt="{{time_format build_time "%F %T %Z"}}">
    ```

    其中涉及`workflowname`需要与`./.github/workflows/update-feed.yml`中的`name`的保持一致。

配置修改完成，将上述更改提交至个人的Github仓库。

<h4 id="Github-Pages-settings">6. Github Pages设置</h4>

在完成上述定制后，需要对个人的MyArxiv库Github Pages进行设置，将项目进行托管：

- 访问`Github Pages`设置`https://github.com/username/reponame/settings/pages`

  <img src="./imgs/tutorial/2.8.1.png" style="zoom:40%;" />

- 若使用`username.github.io`来托管MyArxiv，则：
  - 将其中的`Branch`设置为`gh-pages`分支；
  - 成功Build后，定制化结束；
  - 访问`username.github.io./reponame`，即可实现MyArxiv的定制化访问
  
- 若使用其他域名来托管MyArxiv，则：
  - 将其中的`Branch`设置为`gh-pages`分支；
  - 将自己的域名填入`Custom Domain`;
  - 在`./statics`文件夹下新建`CNAME`文件，将域名写入其中:
  
    ```shell
    >> cd ./statics
    >> touch CNAME
    >> echo "your domain" > CNAME
    ```
  - 成功Build后，定制化结束；
  - 访问`username.github.io/reponame`，即可实现MyArxiv的定制化访问

到这里，就实现了`MyArxiv`的定制化。**Enjoy *YourArxiv*  !**

## <img src="./imgs/icon/link.png" width="25" />参考资源
Fork from - [MyArxiv](https://github.com/MLNLP-World/MyArxiv)

该项目部分参考如下项目：
- [ArxivFeed Template](https://github.com/NotCraft/ArxivDaily)
- Powered By [ArxivFeed](https://github.com/NotCraft/ArxivFeed)

## <img src="./imgs/icon/thanks.png" width="25" />致谢
感谢如下项目对本项目提供的帮助：
- [Osmosfeed](https://github.com/osmoscraft/osmosfeed)
- [AlongWY Version](https://github.com/AlongWY/ArxivDaily)
- [LooperXX Osmosfeed Version](https://github.com/LooperXX/ArxivDaily-Old)
