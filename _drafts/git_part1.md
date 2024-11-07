---
layout: blog
title: "How I learned to stop worrying and love git: Part 1 of the Workflow Cycle"
date: 2024-06-24
tags: [Git, Research, VS Code]
---

*[N.B. I gave a version of this post for an internal discussion at SOM. I've modified it for general consumption. Many of the examples I walked through live -- I will try to add videos for those, in the future, but for now they will just sit as "examples" in the text.]*

# The best time to start was yesterday. The next best time is now.
Many people own a power drill but aren't carpenters. I own a power drill to drill a few screws in more easily. I barely understand the various types of attachments I can buy for the drill, although they all look very cool, and I vaguely understand that they would make me better at home repair. 

The same sentiment holds for me and `git`. I use `git` to version control my code, but I am not a software engineer, I work in relatively small teams, and I don't write enterprise-level code.[^1] Heck, I don't even write nice code.[^2] Nonetheless, I have been aware for a very long time that [reproducible research](https://book.the-turing-way.org/reproducible-research/vcs) [requires](https://onlinelibrary.wiley.com/share/NBNCB8REEWJIFT2UMAZY?target=10.1002/jae.1083) [version](https://scfbm.biomedcentral.com/articles/10.1186/1751-0473-8-7) [control](https://pubs.aeaweb.org/doi/pdfplus/10.1257/jel.20171350). 

The problem with almost all discussion about "good practices" in coding and research, including version control, is that the learning curve feels steep. Almost all of the advice is written by people way up the mountain, shouting down to you, "Just climb up here! It's easy!" 

The goal of this set of posts is to give you a sense of my workflow. My workflow is not great, but it likely has something useful in it that you can adopt for yours. My workflow is particularly useful to describe because I tend to work on a very wide variety of projects, with a wide variety of collaborators, and I have to be able to switch between them quickly.[^3]

Today's post will begin by highlighting how to get started using `git` for version control, but the various accoutrement that go along wiht it. With all things, there's no **one** software tool that gets used in isolation -- they all mix together. It's your job to figure out how to mix them together in a way that works for you.

# The Basics (Skip if not a beginner)
1. Install `git` on your computer. You can do this by going to the [git website](https://git-scm.com/).
2. Create a Github account. You can do this by going to the [Github website](https://www.github.com/)
   This is free, and will be useful going forward.
3. Install [VS Code](https://code.visualstudio.com/download). If you haven't used VS Code, see [my discussion about why it and Github Copilot are so great.](https://paulgp.github.io/2024/06/24/llm_talk.html)

I'm going to assume you have a vague sense of what `git` is.[^4] It's a version control software that keeps track of your work. It lets you work collaboratively with others, managing places where you may be in conflict. It also lets you try out new things without fully committing to it -- think of it as the sophisticated version of "Track Changes" in Word, or creating a new copy of a file with `_V2` appended at the end.

# The Workflow


[^1]: Enterpise-level code just means code written for large businesses -- you end up having much more abstraction, etc. 
[^2]: Although I write nicer code than some of you -- I've seen your Stata code. I'm looking at you Mr. and Ms. I-don't-label-my-variables. 
[^3]: Some might say I have *too* wide of a range of projects.
[^4]: Github, in contrast, is a website that you can use `git` in conjunction with. Layered on top of `git` is a bunch of useful tools, such as a way to create and track tasks/issues, create documentation, provide a centralized repository, and sync up your version control with your documentation. More on this later. 