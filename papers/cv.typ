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
#set par(spacing: 0.7em, leading: 0.78em, justify: true)

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

= Published Research

+ Paul Goldsmith-Pinkham, Peter Hull, and Michal Kolesár (2026), #link("https://doi.org/10.1257/jep.20251480")[“Leniency Designs: An Operator's Manual”], #underline[Journal of Economic Perspectives], 40(3): 213-240.
+ Florian Ederer, Paul Goldsmith-Pinkham, and Kyle Jensen (2025), #link("https://doi.org/10.1257/pandp.20251048")[“Anonymous Attention and Abuse”], #underline[AEA Papers and Proceedings], 115: 188-194.
+ Paul Goldsmith-Pinkham, Peter Hull, and Michal Kolesár (2024), #link("https://doi.org/10.1257/aer.20221116")[“Contamination Bias in Linear Regressions”], #underline[American Economic Review], 114(12): 4015-4051.
+ Sonia Gilbukh and Paul Goldsmith-Pinkham (2024), #link("https://doi.org/10.1093/rfs/hhae048")[“Heterogeneous Real Estate Agents and the Housing Cycle”], #underline[The Review of Financial Studies], 37(11): 3431-3489.
+ Abhijit Banerjee, Marcella Alsan, Emily Breza, Arun G. Chandrasekhar, Abhijit Chowdhury, Esther Duflo, Paul Goldsmith-Pinkham, and Benjamin A. Olken (2024), #link("https://doi.org/10.1162/rest_a_01500")[“Can a Trusted Messenger Change Behavior When Information Is Plentiful? Evidence from the First Months of the COVID-19 Pandemic in West Bengal”], #underline[Review of Economics and Statistics], published online September 16, 2024: 1-33.
+ Jacob Wallace, Paul Goldsmith-Pinkham, and Jason L. Schwartz (2023), #link("https://doi.org/10.1001/jamainternmed.2023.1154")[“Excess Death Rates for Republican and Democratic Registered Voters in Florida and Ohio During the COVID-19 Pandemic”], #underline[JAMA Internal Medicine], 183(9): 916-923.
+ Paul Goldsmith-Pinkham, Matthew T. Gustafson, Ryan C. Lewis, and Michael Schwert (2023), #link("https://doi.org/10.1093/rfs/hhad041")[“Sea-Level Rise Exposure and Municipal Bond Yields”], #underline[The Review of Financial Studies], 36(11): 4588-4635.
+ Lisa Ho, Emily Breza, Abhijit Banerjee, Arun G. Chandrasekhar, Fatima C. Stanford, Renato Fior, Paul Goldsmith-Pinkham, Kelly Holland, Emily Hoppe, Louis-Maël Jean, Lucy Ogbu-Nwobodo, Benjamin A. Olken, Carlos Torres, Pierre-Luc Vautrey, Erica Warner, Esther Duflo, and Marcella Alsan (2023), #link("https://doi.org/10.1257/pandp.20231112")[“The Impact of Large-Scale Social Media Advertising Campaigns on COVID-19 Vaccination: Evidence from Two Randomized Controlled Trials”], #underline[AEA Papers and Proceedings], 113: 653-658.
+ Paul Goldsmith-Pinkham and Kelly Shue (2023), #link("https://doi.org/10.1111/jofi.13212")[“The Gender Gap in Housing Returns”], #underline[The Journal of Finance], 78(2): 1097-1145.
+ Paul Goldsmith-Pinkham, Karen Jiang, Zirui Song, and Jacob Wallace (2022), #link("https://doi.org/10.1257/pandp.20221111")[“Measuring Changes in Disparity Gaps: An Application to Health Insurance”], #underline[AEA Papers and Proceedings], 112: 356-360.
+ Ahmed Mushfiq Mobarak, Edward Miguel, Jason Abaluck, Amrita Ahuja, Marcella Alsan, Abhijit Banerjee, Emily Breza, Arun G. Chandrasekhar, Esther Duflo, James Dzansi, Denise Garrett, Paul Goldsmith-Pinkham, Gregg S. Gonsalves, Muhammad Maqsud Hossain, Aleksandra Jakubowski, Gagandeep Kang, Arjun Kharel, Michael Kremer, Niccolo Meriggi, Carol Nekesa, Benjamin A. Olken, Saad B. Omer, Firdausi Qadri, Helen Rees, Babatunde Salako, Maarten Voors, Shana Warren, and Witold Więcek (2022), #link("https://doi.org/10.1126/science.abo4089")[“End COVID-19 in Low- and Middle-Income Countries”], #underline[Science], 375(6585): 1105-1110. Policy Forum.
+ Andreas Fuster, Paul Goldsmith-Pinkham, Tarun Ramadorai, and Ansgar Walther (2022), #link("https://doi.org/10.1111/jofi.13090")[“Predictably Unequal? The Effects of Machine Learning on Credit Markets”], #underline[The Journal of Finance], 77(1): 5-47. Winner of the Brattle Prize for Best Paper in Corporate Finance.
+ Emily Breza, Fatima Cody Stanford, Marcella Alsan, Burak Alsan, Abhijit Banerjee, Arun G. Chandrasekhar, Sarah Eichmeyer, Traci Glushko, Paul Goldsmith-Pinkham, Kelly Holland, Emily Hoppe, Mohit Karnani, Sarah Liegl, Tristan Loisel, Lucy Ogbu-Nwobodo, Benjamin A. Olken, Carlos Torres, Pierre-Luc Vautrey, Erica T. Warner, Susan Wootton, and Esther Duflo (2021), #link("https://doi.org/10.1038/s41591-021-01487-3")[“Effects of a large-scale social media advertising campaign on holiday travel and COVID-19 infections: a cluster randomized controlled trial”], #underline[Nature Medicine], 27(9): 1622-1628.
+ Jacob Wallace, Karen Jiang, Paul Goldsmith-Pinkham, and Zirui Song (2021), #link("https://doi.org/10.1001/jamainternmed.2021.3922")[“Changes in Racial and Ethnic Disparities in Access to Care and Health Among US Adults at Age 65 Years”], #underline[JAMA Internal Medicine], 181(9): 1207-1215.
+ Carlos Torres, Lucy Ogbu-Nwobodo, Marcella Alsan, Fatima Cody Stanford, Abhijit Banerjee, Emily Breza, Arun G. Chandrasekhar, Sarah Eichmeyer, Mohit Karnani, Tristan Loisel, Paul Goldsmith-Pinkham, Benjamin A. Olken, Pierre-Luc Vautrey, Erica Warner, and Esther Duflo, for the COVID-19 Working Group (2021), #link("https://doi.org/10.1001/jamanetworkopen.2021.17115")[“Effect of Physician-Delivered COVID-19 Public Health Messages and Messages Acknowledging Racial Inequity on Black and White Adults' Knowledge, Beliefs, and Practices Related to COVID-19: A Randomized Clinical Trial”], #underline[JAMA Network Open], 4(7): e2117115.
+ Arun G. Chandrasekhar, Paul Goldsmith-Pinkham, Matthew O. Jackson, and Samuel Thau (2021), #link("https://doi.org/10.1073/pnas.2021520118")[“Interacting Regional Policies in Containing a Disease”], #underline[Proceedings of the National Academy of Sciences], 118(19): e2021520118.
+ Marcella Alsan, Fatima Cody Stanford, Abhijit Banerjee, Emily Breza, Arun G. Chandrasekhar, Sarah Eichmeyer, Paul Goldsmith-Pinkham, Lucy Ogbu-Nwobodo, Benjamin A. Olken, Carlos Torres, Anirudh Sankar, Pierre-Luc Vautrey, and Esther Duflo (2021), #link("https://doi.org/10.7326/M20-6141")[“Comparison of Knowledge and Information-Seeking Behavior After General COVID-19 Public Health Messages and Messages Tailored for Black and Latinx Communities”], #underline[Annals of Internal Medicine], 174(4): 484-492.
+ Paul Goldsmith-Pinkham, Isaac Sorkin, and Henry Swift (2020), #link("https://doi.org/10.1257/aer.20181047")[“Bartik Instruments: What, When, Why, and How”], #underline[American Economic Review], 110(8): 2586-2624.
+ Will Dobbie, Paul Goldsmith-Pinkham, Neale Mahoney, and Jae Song (2020), #link("https://doi.org/10.1111/jofi.12954")[“Bad Credit, No Problem? Credit and Labor Market Consequences of Bad Credit Reports”], #underline[The Journal of Finance], 75(5): 2377-2419.
+ C. Fritz Foley, Paul Goldsmith-Pinkham, Jonathan Greenstein, and Eric Zwick (2018), #link("https://doi.org/10.1016/j.jempfin.2017.12.004")[“Opting Out of Good Governance”], #underline[Journal of Empirical Finance], 46: 93-110.
+ Will Dobbie, Paul Goldsmith-Pinkham, and Crystal S. Yang (2017), #link("https://doi.org/10.1162/rest_a_00669")[“Consumer Bankruptcy and Financial Health”], #underline[The Review of Economics and Statistics], 99(5): 853-869.
+ Paul Goldsmith-Pinkham and Guido W. Imbens (2013), #link("https://doi.org/10.1080/07350015.2013.801251")[“Social Networks and the Identification of Peer Effects”], #underline[Journal of Business & Economic Statistics], 31(3): 253-264.
+ Adam Ashcraft, Paul Goldsmith-Pinkham, Peter Hull, and James Vickery (2011), #link("https://doi.org/10.1257/aer.101.3.115")[“Credit Ratings and Security Prices in the Subprime MBS Market”], #underline[American Economic Review], 101(3): 115-119.
+ Paul Goldsmith-Pinkham and Tanju Yorulmazer (2010), #link("https://doi.org/10.1007/s10693-009-0079-2")[“Liquidity, Bank Runs, and Bailouts: Spillover Effects During the Northern Rock Episode”], #underline[Journal of Financial Services Research], 37(2-3): 83-98.
+ Phil Everson and Paul S. Goldsmith-Pinkham (2008), #link("https://doi.org/10.2202/1559-0410.1107")[“Composite Poisson Models for Goal Scoring”], #underline[Journal of Quantitative Analysis in Sports], 4(2).

= Conditionally Accepted

+ Paul Goldsmith-Pinkham, Maxim Pinkovskiy, and Jacob Wallace (2026), #link("https://paulgp.github.io/papers/GPW_compressed.pdf")[“The Great Equalizer: Medicare and the Geography of Consumer Financial Strain”] (Conditionally Accepted, #underline[Review of Economics and Statistics], March 14, 2026)

= Revise and Resubmit

+ Arun Chandrasekhar, Paul Goldsmith-Pinkham, Tyler McCormick, Samuel Thau and Jerry Wei (2026) #link("https://paulgp.github.io/papers/diffusion_error_CGPMTW.pdf")[“Non-robustness of diffusion estimates on networks with measurement error”] (2nd Round R\&R, #underline[Econometrica])
+ Florian Ederer, Paul Goldsmith-Pinkham, and Kyle Jensen (2024) #link("https://florianederer.github.io/ejmr.pdf")[“Anonymity and Identity Online”] (Revise and Resubmit, #underline[Review of Economic Studies])
+ Dong Beom Choi, Paul Goldsmith-Pinkham, and Tanju Yorulmazer (2023) #link("https://arxiv.org/pdf/2308.06642.pdf")[“Contagion Effects of the Silicon Valley Bank Run”] (Reject and Resubmit, #underline[Journal of Financial Economics])
+ Adrien Auclert, Will Dobbie, and Paul Goldsmith-Pinkham (March 2019), #link("https://paulgp.github.io/papers/Macroeconomic_Effects_of_Debt_Relief_Posting_342019.pdf")[“Macroeconomic Effects of Debt Relief: Consumer Bankruptcy in the Great Recession”] [#link("https://paulgp.github.io/presentations/consumer_debt_relief_slides.pdf")[slides]] (Revise and Resubmit, #underline[American Economic Review])

= Other Working Papers

+ Paul Goldsmith-Pinkham, Chenhao Tan, and Alexander K. Zentefis (2026) #link("https://paulgp.github.io/papers/Radiology.pdf")[“Human-AI Collaboration in Radiology: The Case of Pulmonary Embolism”]
+ Paul Goldsmith-Pinkham #link("https://arxiv.org/abs/2405.20604")[“Tracking the Credibility Revolution across Fields”] (Submitted, #underline[Journal of Econometrics])
+ Paul Goldsmith-Pinkham and Tianshu Lyu (2026) #link("https://paulgp.github.io/papers/financial_event_studies_august2026.pdf")[“Causal Inference in Financial Event Studies”] (Latest draft August 31, 2026)

= Work In Progress

- Kory Kroft, Paul Goldsmith-Pinkham, and Yao Luo “Hausman Instruments”
- Paul Goldsmith-Pinkham and Sophia Gilbukh “Failed Listings”

= Resting Papers

+ Anusha Chari and Paul Goldsmith-Pinkham (2018), #link("https://paulgp.github.io/papers/cgp_nbergender.pdf")[“Gender Representation in Economics Across Topics and Time: Evidence from the NBER Summer Institute”] (Latest draft November 4, 2018; previously a reject-and-resubmit at the Review of Economics and Statistics)
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

= Teaching

- #strong[Investment Management] (`MGT 544`), MBA, Yale School of Management, Spring 2019-Spring 2026
- #strong[Applied Empirical Methods] (`MGMT 737`; later cross-listed and renumbered), Ph.D., Yale University, Spring 2021-Spring 2026

= Doctoral Advising

// Compiled 2026-08-31 from the email record (registrar Reader's Report invitations and
// committee correspondence); evidence table in 08_private_support/dissertation_committee_roster.md
// (kept out of Git). Paul confirmed (2026-10-01) he was a committee member on all of them. Placements deliberately omitted pending
// verification.

_Dissertation committees, Yale (completed):_

- Natee Amornsiripanitch (Ph.D. 2021)
- Rahul Goravara (Ph.D. 2021)
- Leland Bybee (Ph.D. 2024)
- Belisa Pang (Ph.D. 2025)
- Adam Callister (Ph.D. 2026)
- Andrew Granato (Ph.D. 2026)
- Tianshu Lyu (Ph.D. 2026)
- Pengcheng Liu (Ph.D. 2026)

_Dissertation committees, Yale (in progress):_

Xugan Chen, Tania Diaz-Bazan, Dong Huang, Kwon Yong Jin, Jamil Rahman, Tudor Schlanger, Yi Wang, Nicolas Wuthenow Anglarill, Dolly Yu

_External dissertation committees (in progress):_

Tobias Großbölting (University of Mannheim)


= Professional Service

// Journal list compiled 2026-08-31 from email-confirmed referee reports (≈195 manuscripts
// since 2012); per-journal counts and evidence in 05_contributions/service_ledger.csv.

_Referee:_ American Economic Journal: Applied Economics, American Economic Journal: Economic Policy, American Economic Journal: Macroeconomics, American Economic Review, American Economic Review: Insights, Econometric Theory, Econometrica, Econometrics Journal, Economic Journal, European Economic Review, International Economic Review, International Journal of Central Banking, Journal of Applied Econometrics, Journal of Banking & Finance, Journal of Business & Economic Statistics, Journal of Econometrics, Journal of Economic Literature, Journal of Finance, Journal of Financial Economics, Journal of Financial Intermediation, Journal of Investment Strategies, Journal of Law & Economics, Journal of Money, Credit and Banking, Journal of Political Economy, Journal of Public Economics, Journal of Quantitative Analysis in Sports, Journal of the European Economic Association, Management Science, Quantitative Economics, Quarterly Journal of Economics, Review of Economic Studies, Review of Economics and Statistics, Review of Finance, Review of Financial Studies

_Program and scientific committees:_ Western Finance Association (2020, 2024–2026); SFS Cavalcade North America (2020-2026); Financial Intermediation Research Society (2022-2026); European Finance Association (2024-2026); Georgia Tech-Atlanta Fed Household Finance Conference; Philadelphia Fed / Lerner Fintech and Financial Institutions Conference; Columbia / Review of Financial Studies AI in Finance Conference; CFPB Research Conference (2022); Human × AI Finance Conference (2026); Baruch College Climate Finance and ESG Conference (2024); University of Oklahoma Energy and Climate Finance Research Conference (2022); Conference in Financial Economics and Accounting (2024); NY Fed / NYU Stern Financial Intermediation Conference (2019)

_Organizer:_ NBER Summer Institute Household Finance (2024, with Stephen Zeldes and Adair Morse)

_Other:_ Moderator, arXiv econ.GN, 2020-2022; ad hoc proposal reviewer, National Science Foundation

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
