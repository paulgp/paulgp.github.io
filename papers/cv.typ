// Curriculum Vitae — Paul Goldsmith-Pinkham
// Typst port of cv.tex

#set document(
  title: "Curriculum Vitae",
  author: "Paul Goldsmith-Pinkham",
  keywords: ("economics", "econometrics", "banking", "corporate finance", "social networks"),
)

// This file produces BOTH a print PDF and the web CV:
//   typst compile papers/cv.typ papers/cv.pdf --features html   (print)
//   papers/build_cv.sh                                          (PDF + web)
// For the web, build_cv.sh extracts the <body> of the HTML export into
// _includes/cv.html, which the Jekyll page papers/cv.html embeds in the site
// layout. So the HTML target emits plain, semantic markup (h1/h2/ul/ol/a)
// with NO styling of its own — the site's styles.css styles it natively.
// The target() branches below keep each output looking native.

// Apply print page geometry only for paper; HTML reflows in the browser.
#show: body => context {
  if target() == "html" {
    body
  } else {
    set page(paper: "us-letter", margin: (x: 1in, y: 1in))
    body
  }
}

// Spacers / inline kerns that only make sense in the paged layout (dropped,
// without warnings, in HTML where flow spacing comes from CSS margins).
#let vspace(amount) = context if target() != "html" { v(amount) }
#let hsp = context if target() != "html" { h(1em) }

// Palatino with old-style figures (mimics \usepackage[osf]{mathpazo}).
#set text(
  font: "Palatino",
  size: 11pt,
  hyphenate: false,
  number-type: "old-style",
  kerning: true,
  ligatures: true,
)
#set par(spacing: 0.7em, leading: 0.78em, justify: false)

// Links in blue (PDF); HTML link colour comes from the stylesheet above.
#show link: set text(fill: blue)

// Section headings: small caps with a subtle light-gray rule in the PDF,
// real <h2> elements (styled to match) in HTML.
#show heading.where(level: 1): it => context {
  if target() == "html" {
    html.elem("h2", it.body)
  } else {
    block(above: 1.15em, below: 0.55em, breakable: false, {
      text(size: 1.08em, weight: "medium", tracking: 0.03em, smallcaps(it.body))
      v(0.12em, weak: true)
      line(length: 100%, stroke: 0.5pt + luma(170))
    })
  }
}

// Numbered / bulleted lists with comfortable spacing
#set enum(spacing: 0.85em, indent: 0pt, body-indent: 0.4em)
#set list(marker: none, indent: 0pt, body-indent: 0pt, spacing: 0.7em)

// ---- Header ----
// In the PDF, the name is the title line (same Palatino as the body, just
// larger). In HTML it is omitted — the Jekyll page's title becomes the page
// <h1>, so emitting it here too would duplicate it.
#context if target() != "html" {
  text(size: 2.1em, weight: "regular")[Paul Goldsmith-Pinkham]
}

#vspace(0.6em)

Yale School of Management \
Finance Unit \
165 Whitney Ave \
New Haven, CT 06511

#vspace(0.4em)

Email: #link("mailto:paul.goldsmith-pinkham@yale.edu")[`paul.goldsmith-pinkham@yale.edu`] \
URL: #link("https://paulgp.github.io/")[`https://paulgp.github.io/`]

= Employment

- Yale School of Management
  - #hsp _Associate Professor (without tenure)_, `2024`-
  - #hsp _Assistant Professor_, `2018`-`2024`
- National Bureau of Economic Research
  - #hsp _Faculty Research Fellow_, `2022`-
- Federal Reserve Bank of New York
  - #hsp _Financial Economist_, `2015-2018`
  - #hsp _Research Assistant_, `2007-2009`

= Education

- Ph.D. Harvard University, 2015
  - Business Economics
- M.A. Harvard University, 2012
  - Business Economics
- B.A. Swarthmore College, 2007
  - Economics, High Honors, and Mathematics and Statistics

= Working Papers

+ Paul Goldsmith-Pinkham #link("https://arxiv.org/abs/2405.20604")[“Tracking the Credibility Revolution across Fields”] (Submitted, 2026)
+ Arun Chandrasekhar, Paul Goldsmith-Pinkham, Tyler McCormick, Samuel Thau and Jerry Wei (2026) #link("https://paulgp.github.io/papers/diffusion_error_CGPMTW.pdf")[“Non-robustness of diffusion estimates on networks with measurement error”] (Resubmitted, #underline[Econometrica])
+ Paul Goldsmith-Pinkham and Tianshu Lyu (2025) #link("http://paulgp.github.io/papers/financial_event_studies_nov18.pdf")[“Causal Inference in Financial Event Studies”]
+ Paul Goldsmith-Pinkham, Peter Hull and Michal Kolesar (2025) #link("https://arxiv.org/abs/2511.03572")[“Leniency Designs: An Operator's Manual”] (Solicited and Submitted, #underline[Journal of Economic Perspectives])
+ Florian Ederer, Paul Goldsmith-Pinkham, and Kyle Jensen (2024) #link("https://florianederer.github.io/ejmr.pdf")[“Anonymity and Identity Online”] (Revise and Resubmit, #underline[Review of Economic Studies])
+ Dong Beom Choi, Paul Goldsmith-Pinkham, and Tanju Yorulmazer (2023) #link("https://arxiv.org/pdf/2308.06642.pdf")[“Contagion Effects of the Silicon Valley Bank Run”] (Reject and Resubmit, #underline[Journal of Financial Economics])
+ Adrien Auclert, Paul Goldsmith-Pinkham, and Will Dobbie (2020), #link("http://paulgp.github.io/papers/Macroeconomic_Effects_of_Debt_Relief_Posting_342019.pdf")[“Macroeconomic Effects of Debt Relief: Consumer Bankruptcy Protections in the Great Recession”] (Revise and Resubmit, #underline[American Economic Review])
+ Anusha Chari and Paul Goldsmith-Pinkham (2018), #link("http://paulgp.github.io/papers/cgp_nbergender.pdf")[“Gender Representation in Economics Across Topics and Time: Evidence from the NBER Summer Institute”] (Reject and Resubmit, #underline[Review of Economics and Statistics])

= Publications

+ Paul Goldsmith-Pinkham, Maxim Pinkovskiy and Jacob Wallace (2026), #link("http://paulgp.github.io/papers/GPW_compressed.pdf")[“Medicare and the Geography of Financial Health”] (Conditionally Accepted, #underline[Review of Economics and Statistics])
+ Florian Ederer, Paul Goldsmith-Pinkham, and Kyle Jensen (May 2025) #link("https://florianederer.github.io/anonymous_P&P.pdf")[“Anonymous Attention and Abuse”] #underline[AEA Papers and Proceedings]
+ Paul Goldsmith-Pinkham, Peter Hull and Michal Kolesar (December 2024) #link("https://arxiv.org/abs/2106.05024")[“Contamination Bias in Linear Regressions”] #underline[American Economic Review]
+ Sonia Gilbukh and Paul Goldsmith-Pinkham (November 2024), #link("http://paulgp.github.io/papers/Heterogeneous_Real_Estate_Agents_and_the_Housing_Cycle.pdf")[“Heterogeneous Real Estate Agents and the Housing Cycle”] #underline[Review of Financial Studies]
+ Abhijit Banerjee, Marcella Alsan, Emily Breza, Arun G. Chandrasekhar, Abhijit Chowdhury, Esther Duflo, Paul Goldsmith-Pinkham, and Benjamin A. Olken (September, 2024), #link("https://economics.mit.edu/sites/default/files/2022-08/wb_manuscript_final.pdf")[“Can a Trusted Messenger Change Behavior when Information is Plentiful? Evidence from the First Months of the COVID-19 Pandemic in West Bengal”] #underline[Review of Economics and Statistics]
+ Jacob Wallace, Paul Goldsmith-Pinkham, and Jason Schwartz (July 2023), #link("https://jamanetwork.com/journals/jamainternalmedicine/fullarticle/2807617")[“Excess Death Rates for Republican and Democratic Registered Voters in Florida and Ohio During the COVID-19 Pandemic”] #underline[JAMA Internal Medicine]
+ Paul Goldsmith-Pinkham, Matthew Gustafson, Ryan Lewis and Michael Schwert (May 2023), #link("http://paulgp.github.io/papers/ggls_munis.pdf")[“Sea Level Rise and Municipal Bond Yields”] #underline[Review of Financial Studies]
+ Lisa Y. Ho, Emily Breza, Marcella Alsan, Abhijit Banerjee, Arun G. Chandrasekhar, Fatima Cody Stanford, Renato Fior, Paul Goldsmith-Pinkham, Kelly Holland, Emily Hoppe, Louis-Maël Jean, Lucy Ogbu-Nwobodo, Benjamin A. Olken, Carlos Torres, Pierre-Luc Vautrey, Erica Warner, and Esther Duflo (May 2023), #link("https://paulgp.github.io/papers/submission_manuscript_appendix_social_media_covid_vaccines.pdf")[“The impact of large-scale social media advertising campaigns on COVID-19 vaccination: Evidence from two randomized controlled trials”] #underline[AER Papers and Proceedings]
+ Paul Goldsmith-Pinkham and Kelly Shue (February 2023), #link("https://paulgp.github.io/papers/Gender_Gap_in_Housing_Returns.pdf")[“The Gender Gap in Housing Returns”] #underline[Journal of Finance]
+ Jacob Wallace, Paul Goldsmith-Pinkham, Karen Jiang and Zirui Song (May 2022), #link("https://paulgp.github.io/papers/aerpp_medicare.pdf")[“Measuring Changes in Disparity Gaps: An Application to Health Insurance”] #underline[AER Papers and Proceedings]
+ Andreas Fuster, Paul Goldsmith-Pinkham, Tarun Ramadorai and Ansgar Walther (February 2022), #link("https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3072038")[“Predictably Unequal? The Effects of Machine Learning in Credit Markets”] #underline[Journal of Finance], Winner of Brattle Prize for Best Paper in Corporate Finance
+ Emily Breza, Fatima Cody Stanford, Marcella Alsan, Burak Alsan, Abhijit Banerjee, Arun G. Chandrasekhar, Sarah Eichmeyer, Paul Goldsmith-Pinkham, Traci Glushko, Kelly Holland, Emily Hoppe, Mohit Karnani, Sarah Liegl, Tristan Loisel, Lucy Ogbu-Nwobodo, Benjamin A. Olken, Carlos Torres, Pierre-Luc Vautrey, Erica Warner, Susan Wootton & Esther Duflo. (August 2021), #link("https://www.nature.com/articles/s41591-021-01487-3.pdf")[“Effects of a large-scale social media advertising campaign on holiday travel and COVID-19 infections: a cluster randomized controlled trial”] #underline[Nature Medicine]
+ Jacob Wallace, Paul Goldsmith-Pinkham, Karen Jiang and Zirui Song (July 2021), #link("https://jamanetwork.com/journals/jamainternalmedicine/article-abstract/2782345")[“Changes in Racial and Ethnic Disparities in Access to Care and Health Among US Adults at Age 65 Years”] #underline[JAMA Internal Medicine]
+ Carlos Torres, Lucy Ogbu-Nwobodo, Marcella Alsan, Fatima Cody Stanford, Abhijit Banerjee, Emily Breza, Arun Chandrasekhar, Sarah Eichmeyer, Paul Goldsmith-Pinkham, Mohit Karnani, Tristan Loisel, Benjamin Olken, Pierre-Luc Vautrey, Erica Warner and Esther Duflo (July 2021), #link("https://jamanetwork.com/journals/jamanetworkopen/fullarticle/2781934")[“Effect of Physician-Delivered COVID-19 Public Health Messages and Messages Acknowledging Racial Inequity on Black and White Adults' Knowledge, Beliefs, and Practices Related to COVID-19: A Randomized Clinical Trial”] #underline[JAMA Network Open]
+ Arun Chandrasekhar, Paul Goldsmith-Pinkham, Matthew Jackson and Samuel Thau (April 2021), #link("https://arxiv.org/abs/2008.10745")[“Interacting Regional Policies in Containing a Disease”] #underline[Proceedings of the National Academy of Sciences]
+ Marcella Alsan, Fatima Cody Stanford, Abhijit Banarjee, Emily Breza, Arun Chandrasekhar, Sarah Eichmeyer, Paul Goldsmith-Pinkham, Lucy Ogbu-Nowbodo, Ben Olken, Carlos Torres, Anirudh Sankar, Pierre-Luc Vautrey and Esther Duflo (2020) #link("https://www.acpjournals.org/doi/10.7326/M20-6141")[“Comparison of Knowledge and Information-Seeking Behavior After General COVID-19 Public Health Messages and Messages Tailored for Black and Latinx Communities”], #underline[Annals of Internal Medicine]
+ Paul Goldsmith-Pinkham, Isaac Sorkin and Henry Swift (2020), #link("http://paulgp.github.io/papers/bartik_gpss.pdf")[“Bartik Instruments: What, When, Why and How”], #underline[American Economic Review]
+ Will Dobbie, Paul Goldsmith-Pinkham, Neale Mahoney and Jae Song (2020), #link("https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2844316")[“Bad Credit, No Problem? Credit and Labor Market Consequences of Bad Credit Reports”], #underline[Journal of Finance]
+ Fritz Foley, Paul Goldsmith-Pinkham, Jonathan Greenstein and Eric Zwick (2018), #link("http://www.nber.org/papers/w19953")[“Opting Out of Good Governence”], #underline[Journal of Empirical Finance]
+ Will Dobbie, Paul Goldsmith-Pinkham, and Crystal Yang (2017), #link("http://www.nber.org/papers/w21032")[“Consumer Bankruptcy and Financial Health”], #underline[Review of Economics and Statistics]
+ Paul Goldsmith-Pinkham and Guido Imbens (2013), #link("http://www.tandfonline.com/doi/pdf/10.1080/07350015.2013.801251")[“Social Networks and the Identification of Peer Effects”], #underline[Journal of Business & Economic Statistics], 31(3), 253-264.
+ Adam Ashcraft, Paul Goldsmith-Pinkham, and James Vickery (2011), #link("http://papers.ssrn.com.ezp-prod1.hul.harvard.edu/sol3/papers.cfm?abstract_id=1856823")[“Credit Ratings and Security Prices in the Subprime MBS Market”], #underline[AER Papers and Proceedings], 115-119.
+ Paul Goldsmith-Pinkham, and Tanju Yorulmazer (2009), #link("http://www.springerlink.com/content/ww187761jgr660q5/")[“Liquidity, Bank Runs, and Bailouts: Spillover Effects During the Northern Rock Episode”], #underline[Journal of Financial Services Research], 37(2-3), 83-98.
+ Phil Everson and Paul Goldsmith-Pinkham (2008), #link("http://www.bepress.com/jqas/vol4/iss2/13/")[\"Composite Poisson Models for Goal Scoring,\"] #underline[Journal of Quantitative Analysis in Sports], Vol. 4 : Iss. 2, Article 13.

= Work In Progress

- Kory Kroft, Paul Goldsmith-Pinkham, and Yao Luo “Hausman Instruments”
- Paul Goldsmith-Pinkham and Sophia Gilbukh “Failed Listings”

= Resting Papers

+ Paul Goldsmith-Pinkham, Beverly Hirtle and David Lucca (2016), #link("https://www.newyorkfed.org/research/staff_reports/sr770.html")[“Parsing the Content of Bank Supervision”]
+ Adam Ashcraft, Paul Goldsmith-Pinkham, and James Vickery (2011), #link("http://papers.ssrn.com/sol3/papers.cfm?abstract_id=1615613")[“MBS ratings and the mortgage credit boom”]

= Honors & Awards

- 2022 Brattle Group Prize in Corporate Finance, First Place
- 2021 Jacobs Levy Center Research Paper Prize for Outstanding Paper
- Wharton School - WRDS award for the Best Empirical Finance Paper, WFA 2020
- Wharton School - WRDS award for the Best Empirical Finance Paper, WFA 2019
- Outstanding Ph.D. Student Paper Award at 11th Annual Conference on Corporate Finance at Olin Business School, “Debtor Protections and the Great Recession”, 2015
- Best Paper Award at 14th Annual Asian Real Estate Society International Conference, “Incentives and Mortgage-Backed Securities Ratings”, 2009
- High Honors, Swarthmore College, 2007.

= Language Skills

- English (fluent)
- French (fluent)

= Citizenship

United States, France

#vspace(1.5em)

#let updated = datetime.today().display("[month repr:long] [day], [year]")
#context if target() == "html" {
  html.elem("footer", {
    [Last updated: #updated · ]
    link("http://paulgp.github.io")[paulgp.github.io]
  })
} else {
  align(center, text(size: 8pt)[
    Last updated: #updated \
    #link("http://paulgp.github.io")[`http://paulgp.github.io`]
  ])
}
