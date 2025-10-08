---
layout: blog
title: "Economics Job Market Tracker: Visualizing JOE Posting Trends 2015-2025"
date: 2025-10-08
tags: [Economics, Job Market, Data Visualization]
---

I've been tracking job postings from the American Economic Association's Job Openings for Economists (JOE) over the past decade. The interactive visualizations below show how the economics job market has evolved from 2015 to 2025.

## The Data

The dataset includes over 14,000 job postings spanning 11 academic years. Each posting includes the date it became active on JOE, which allows us to track the timing of hiring activity throughout each academic year cycle.

The visualizations start from calendar week 31 (early August), which marks the beginning of the academic hiring season for most economics positions.{% include sidenote.html number="1" text="The data was scraped from JOE and processed using Python (pandas, plotly). The visualizations are fully interactive - you can: 1) Hover to see exact values 2) Click and drag to zoom 3) Double-click to reset the view 4) Click legend items to show/hide specific years" %}


## Cumulative Job Postings by Week

This first chart shows the cumulative number of job postings over the course of each academic year. You can hover over the lines to see exact values, zoom in on specific time periods, and click on years in the legend to show/hide them.

<figure class="widefigure">
<iframe src="/joe-tracker/job_postings_by_week.html" width="900px" height="900px" frameborder="0"></iframe>
<figcaption><a href="/joe-tracker/job_postings_by_week.html">View fullscreen</a></figcaption>
</figure>


## Rolling 4-Week Flow of New Postings

This second chart smooths out weekly volatility by showing the rolling 4-week sum of new job postings. This makes it easier to identify when hiring activity peaks and troughs.

<figure class="widefigure">
<iframe src="/joe-tracker/job_postings_rolling_4wk.html" width="850px" height="850px" frameborder="0"></iframe>
<figcaption><a href="/joe-tracker/job_postings_rolling_4wk.html">View fullscreen</a></figcaption>
</figure>

## Summary Statistics

Here's a breakdown by academic year:

| Year | Total Postings | Avg per Week | Notes |
|------|---------------|--------------|--------|
| 2015 | 1,543 | 49.8 | |
| 2016 | 1,436 | 49.5 | |
| 2017 | 1,517 | 52.3 | |
| 2018 | 1,555 | 48.6 | Peak year |
| 2019 | 1,451 | 46.8 | |
| 2020 | 1,134 | 39.1 | Pandemic year |
| 2021 | 1,390 | 38.6 | Recovery |
| 2022 | 1,502 | 46.9 | |
| 2023 | 1,297 | 41.8 | |
| 2024 | 1,221 | 37.0 | |
| 2025 | 433 | 39.4 | Partial year |


The code and data is here: https://github.com/paulgp/joe-tracker

---

*Data source: American Economic Association Job Openings for Economists (JOE)*
*Last updated: October 8, 2025*
