---
layout: blog
title: "An Incomplete List of Things I Want to Build"
date: 2026-04-08
tags: [AI, LLMs, Research, Programming]
---

AI has lowered a huge number of frictions for me with respect to programming. I am now able to code up many tools and ideas, and I really enjoy it. But it's not uniformly doable across all projects — not because the coding is too hard for LLMs (I am not enough of a computer scientist to think of hard problems) but because humans have created moats and frictions to make things inaccessible or difficult (or it's hard to articulate what I want).

*This post was originally published on my [Substack](https://paulgp.substack.com/p/an-incomplete-list-things-i-want).*

Here's a list of things I'm trying to figure out how to implement going forward:

## 1. Citation networks

I would like to have a richer sense of citation patterns and cross-paper references. However, [Google Scholar is extremely cranky about API requests](https://stackoverflow.com/questions/62938110/does-google-scholar-have-an-api-available-that-we-can-use-in-our-research-applic). Hard to do at scale, and it's hard to work with generally. Google has no reason to share their data.

**Goal: Build out citation network.**

## 2. Expanding my knowledge database

Relatedly: I would like to continue to build out my knowledge database with papers. However, as I've learned working on my economics literature database, journals are a huge pain to download from automatically. It is slow and unwieldy. Journals have zero reason (nor does [JSTOR](https://en.wikipedia.org/wiki/Aaron_Swartz)) to make it easy for me to have as many articles as I would like.

**Goal: Build out more articles.**

## 3. Replication package infrastructure

I would like to have a more automated system for understanding and harmonizing replication packages (e.g. the AEA [replication repository](https://www.icpsr.umich.edu/sites/aea/home)). If you're interested in a single paper, it's gotten a lot easier. However, if you (like me) want to see the swath of papers that use diff-in-diff, it's not easy to reimplement papers at scale — you have to parse the right locations (e.g. the Journal of Finance doesn't have a repository, it just keeps the replication package as a zip file). Moreover, you often don't know which packages actually are replicable until you unzip and parse. There is huge duplication of effort by applied econometricians.

**Goal: Build out database of metadata on replication packages.**

## 4. Email that doesn't suck

My email absolutely sucks because I have to use Outlook and it has horrid search.

<blockquote class="tiktok-embed" cite="https://www.tiktok.com/@fentifriedchicken/video/7436517309889400107" data-video-id="7436517309889400107" data-embed-from="oembed" style="max-width:605px; min-width:325px;"> <section> <a target="_blank" title="@fentifriedchicken" href="https://www.tiktok.com/@fentifriedchicken?refer=embed">@fentifriedchicken</a> <p>Emails are so cool <a title="corporate" target="_blank" href="https://www.tiktok.com/tag/corporate?refer=embed">#Corporate</a> <a title="working" target="_blank" href="https://www.tiktok.com/tag/working?refer=embed">#Working</a> </p> <a target="_blank" title="♬ original sound - Joe Fenti" href="https://www.tiktok.com/music/original-sound-7436517343955520302?refer=embed">♬ original sound - Joe Fenti</a> </section> </blockquote> <script async src="https://www.tiktok.com/embed.js"></script>

However, I do not want to forward my work email to my Gmail (and also I'd rather use other agents than Gemini to interface with my work). Yale's Microsoft API graph is pretty locked down, so it's very hard for me to give any LLM access to my email. I've made progress on improving this, but I need to improve on it.

<figure class="widefigure">
<img src="/blog_images/2026-04-08-outlook-search.png" alt="Email search skill in action">
</figure>

**Goal: Automate database ingestion and find a way to have the LLM create drafts of emails.**

## 5. Better econometric software packages

There are not enough software packages for important econometric tests. For example: the Kitagawa test is not used nearly enough. Why? There's not really a rich package for it (probably needs to get added to [fixest](https://lrberge.github.io/fixest/)). Writing good statistical packages is still really hard...

**Goal: Identify good tests and try to work with fixest folks to get it added.**

## 6. Tennis ball toss tracker

I want to make an iPhone app that tracks how consistent your ball toss is on your serve motion. I tried to do this 2 years ago and failed. I have to imagine it's easier now but this opens up whole new programming skills that I know little about (video analysis).

**Goal: Make a proof of concept app that tracks consistency of ball toss on serve.**

---

This list is incomplete. I have many research projects I want to do / finish.
