# Paul Goldsmith-Pinkham: Writing and Presentation Style Guide

*Created: 2026-02-15*
*Based on analysis of published papers, working papers, and presentation slides*

---

## I. WRITING STYLE PATTERNS

### A. Introductory Style

**Opening Move: Practical Problem First**
- Start with the problem researchers actually face, not abstract theory
- "Consider a linear regression..." (Contamination Bias)
- "Researchers estimating demand systems routinely face..." (Hausman draft)
- "Financial economists were practicing causal inference well before the credibility revolution" (Event Studies)

**Build from Simple to Complex**
- Section 2 titled "Motivating Example" with stripped-down version
- Use numbered examples: "Example 1 (Multi-Armed RCT)", "Example 2 (Two-Way Fixed Effects)"
- Always provide intuition before formalism

**Explicit Roadmap**
- "Our contribution is twofold. First,... Second,..."
- "This paper shows that..." followed by clear statement
- "We structure the rest of the paper as follows. Section 2..."
- Never leave reader guessing about paper organization

### B. Sentence Structure

**Prefer Active, Direct Construction**
- "We show that..." not "It is shown that..."
- "Our results demonstrate..." not "These results can be interpreted as demonstrating..."
- "This paper provides..." not "This paper aims to provide..."

**Use Subordinate Clauses for Context**
- "While financial event studies target causal effects as their estimands, the suite of estimators..."
- "Because the Bartik instrument combines two accounting identities, it is always possible to construct it."
- Set up tension, then resolve it

**Em-Dashes for Clarification**
- "We show the core result—focusing on the special case of a set of mutually exclusive treatment indicators, though our characterization applies even when..."
- "The problem may be surprising given an influential result in Angrist (1998)—showing that regressions on a single binary treatment..."
- Use to add precision without breaking flow

### C. Technical Precision

**Define Before Using**
- Never use notation without explicit definition
- **Definition 1** (Individual treatment effect / abnormal firm return).
- Follow with equation showing exactly what's meant

**Assumptions Are Numbered and Named**
- **Assumption 1** (Relevance). *For all k ∈ {1,...,K} and s ∈ {1,...,T}...*
- **Assumption 2** (Strict Exogeneity). *E[ε_it|D_it] = 0 for all k where g_k ≠ 0.*
- Italicize the formal statement

**Propositions State Results Cleanly**
- **Proposition 1.** *Under Assumptions 1 and 2, the treatment coefficients in (8) identify...*
- State conditions upfront
- Give clean formula
- Interpretation follows in text, not in proposition

### D. Pedagogical Devices

**Frequent Use of "To see this" and "Why?"**
- "To see this intuition clearly, suppose..."
- "Why would OLS be biased but Bartik be a valid instrument?"
- Address reader's anticipated questions explicitly

**Concrete Numerical Examples**
- "Suppose in the previous setting that school 0 has W_i = 0 assigned only 5 percent..."
- Full worked example with specific numbers
- "that λ_{12}(0) = 99/106 and λ_{12}(1) = -99/106"

**Running Example Throughout**
- Project STAR example introduced in Section 2
- "In our Project STAR example, this result shows that..."
- "Returning to our stylized Project STAR setting..."
- Continuity helps reader track abstract concepts

### E. Connecting to Literature

**Footnotes for Related Work**
- Extensive footnotes citing related papers
- "^1 Prominent RCTs where randomization probabilities vary across strata include Project STAR (Krueger, 1999) and the RAND Health Insurance Experiment..."
- Pack citations together topically, not chronologically

**Contrast with Existing Approaches**
- "This issue is distinct from the Freedman (2008a, 2008b) critique..."
- "Our 'contamination' follows Sun and Abraham (2021), and differs from its use in some analyses..."
- Explicitly state what's different

**Give Credit Generously**
- "Following standard practice in event studies..."
- "As we discuss more below in Test 1 in Section 5, studying correlates..."
- Never claim priority without evidence

---

## II. STRUCTURAL APPROACH

### A. Paper Organization

**Standard Sequence**
1. Introduction (3-5 pages with motivation, contribution, roadmap)
2. Motivating Example / Stylized Setting (builds intuition)
3. General Framework (formal treatment)
4. Solutions / Methods (what to do about it)
5. Applications (4-9 empirical examples)
6. Conclusion (brief, 1-2 pages)

**Section Numbering**
- Use clear hierarchy: 1, 1.1, 1.1.1
- Subsection titles are descriptive: "Convex Weights with One Randomized Treatment"
- Paragraph headers in **bold** for key concepts

### B. Building Complexity

**Start with 2x2, Then Generalize**
- "Consider the regression of an outcome Y_i on a single treatment indicator D_i ∈ {0,1}..."
- "In reality, Project STAR randomized students to three mutually exclusive conditions..."
- Show simplest case delivers core intuition

**"We now derive a general characterization..."**
- Transition phrase signals shift from intuition to formalism
- "We now consider the interpretation of each treatment coefficient β_k in terms of causal effects."
- Reader knows what's coming

**Remarks After Propositions**
- *Remark 1.* Since the contamination weights are mean zero...
- *Remark 2.* Since the weights in eq. (15) are functions of the variances...
- Unpack implications, don't leave reader to infer

### C. Applications Structure

**Multiple Heterogeneous Examples**
- RCTs: Project STAR, RAND Health Insurance
- Observational: racial disparities studies
- Financial: Acemoglu et al. (Treasury Secretary), M&A, index inclusions
- Span different methodological challenges

**Standardized Application Format**
1. Context: what's the research question?
2. Data: what's being studied?
3. Specification: what regression is run?
4. Standard results: what do existing methods show?
5. Diagnostic: what does contamination bias analysis reveal?
6. Revised estimates: how do results change?
7. Interpretation: what does this mean?

**Figures and Tables Integrated**
- Reference inline: "(Figure 1)"
- Figure captions are descriptive: "Figure 1: **Prevalence of financial event studies in finance journals**: This figure plots..."
- Never orphan a figure without discussion

---

## III. PRESENTATION STYLE

### A. Slide Design Principles

**Visual Hierarchy**
- Large, bold titles for each slide
- 2-3 levels of bullet points maximum
- Use color sparingly for emphasis (blue or red for key points)
- White space is your friend

**Equation Presentation**
- Center equations
- Box or highlight the key result
- Build equations step-by-step across slides
- Never put > 2-3 equations on one slide

**Incremental Revelation**
- Use overlays to build arguments
- First: setup, then: problem, then: solution
- Don't show everything at once

### B. Pedagogical Flow

**Roadmap Slides**
- Early slide: "Roadmap" or "This Talk"
- Numbered list of what's coming
- Return to roadmap between sections

**Motivation Before Math**
- Start with "Why should you care?"
- Concrete example (often a graph showing the problem)
- Formal treatment comes after

**Running Example Slides**
- Dedicate 3-4 slides to worked example
- Use same color scheme / formatting throughout
- "Project STAR Example" header on all related slides

### C. Results Presentation

**Comparison Tables**
- Side-by-side: Standard vs Proposed method
- Highlight differences in **bold** or color
- Include confidence intervals

**Figure Design**
- Clean, minimal axes
- Large fonts (readable from back of room)
- Annotate key features directly on plot
- "What happened here?" with arrow

**Takeaway Slides**
- After complex section: "Key Takeaway" slide
- 1-2 sentences in large font
- This is what to remember

### D. Conclusion Style

**Contributions Summary**
- "What We Did" slide
- Bullet points, not paragraphs
- Link back to motivation

**Practical Guidance**
- "What Should Researchers Do?"
- Actionable recommendations
- Point to code/packages if relevant

**Future Work (Brief)**
- 1-2 slides maximum
- Honest about limitations
- Specific open questions

---

## IV. COMMON PHRASES AND PATTERNS

### A. Transitions and Signposts

**Starting New Sections**
- "We now turn to..."
- "Having characterized X, we now..."
- "To build intuition for..."
- "This motivates our main result..."

**Introducing Results**
- "The following proposition shows that..."
- "We first derive a general characterization of..."
- "Our first proposition shows that with multiple treatments..."
- "A simple numerical example helps make the X problem concrete."

**Connecting Ideas**
- "To see this, note that..."
- "This can be seen by viewing..."
- "Analogous arguments show that..."
- "This follows immediately from..."

### B. Qualifying Statements

**Scope Limitations**
- "We note two limitations to our analysis. First,... Second,..."
- "This setup nests X by setting..."
- "We assume locations are independent and so ignore the possibility of..."
- Always explicit, never buried

**Robustness Claims**
- "This result provides a robustness rationale for..."
- "versions of this extension appear in, for instance,..."
- "Our results are framed in the context of X, but analogous results apply..."

**Practical Caveats**
- "In many contexts where researchers use X, it is used in the reduced-form..."
- "While our results are framed in X, we show how analogous results apply..."
- "This practical consideration motivates an alternative approach..."

### C. Emphasis Patterns

**Italics for Key Terms**
- "The decisive factor is the *economic structure* of pricing"
- "This generates a different form of *propensity score misspecification*"
- First use of important concept

**Bold for Definitions**
- "**contamination weights** λ_{k}(W_i) that average to zero"
- "**own treatment weights** λ_{kk}(W_i) that average to one"
- Makes scanning easier

**Quotes for Terminology**
- "Our use of the term 'contamination' follows..."
- "Prominent 'judge IV' examples include..."
- Signals borrowed/specific usage

### D. Mathematical Exposition

**Equation References**
- "as in eq. (4)" not "equation (4)" or "Equation 4"
- Consistent lowercase, parentheses

**Notation Introduction**
- "Let X denote... where..."
- "Define the residuals from regressing X_i on..."
- "Recall that E^*[X_{ik} | X_{i,-k}, W_i] gives the projection..."

**Proof Sketches**
- "The key steps are: (i) X, (ii) Y, (iii) Z."
- "By the FWL theorem, we can write..."
- "This follows from a first-order Taylor approximation."

---

## V. DISTINCTIVE FEATURES

### A. The "Paul" Voice

**Conversational But Precise**
- Not chatty or informal
- Not overly technical or dense
- Right balance: accessible to economists, rigorous for specialists

**Problem-Solving Orientation**
- Papers identify issues AND provide solutions
- Constructive tone: "here's what you should do"
- Code packages follow papers (multeR, stata-multe, bartik-weight)

**Transparent About Limitations**
- "We do not explore this case as it has already been studied extensively..."
- "Our analysis also relates to issues with interpreting multiple-treatment IV estimates..."
- "While our results are framed in the context of a causal model..."

### B. Methodological Contributions

**Unifying Frameworks**
- Connect seemingly disparate estimators
- "We show that the Bartik instrument is numerically equivalent to using industry shares as instruments..."
- "JIVE zeros out the diagonal of C, eliminating own-observation bias."

**Diagnostic Tools**
- Contamination bias weights
- Rotemberg weights
- "We develop weights that are easiest to estimate..."

**R and Stata Packages**
- Practical implementation always provided
- "The packages are available at CRAN and https://github.com/gphk-metrics/stata-multe"
- Reproducibility is priority

### C. Empirical Philosophy

**Multiple Applications**
- Never just one example
- Span experimental and observational
- Show when method works AND when it fails

**Honest Effect Sizes**
- "The largest contamination bias is found in the observational studies while the smallest is found in the experimental studies."
- Report what you find, not what you hoped

**Replication Focus**
- Revisit published findings
- "Revisiting four empirical applications, we show that some established findings... may reflect model misspecification rather than true treatment effects."
- Constructive reanalysis

---

## VI. STYLE CHECKLIST

**Before Submitting a Paper**
- [ ] Introduction has clear "Our contribution is twofold" structure
- [ ] Motivating example in Section 2
- [ ] All assumptions numbered and italicized
- [ ] All propositions state conditions upfront
- [ ] Roadmap at end of introduction
- [ ] Frequent "To see this..." transitions
- [ ] Multiple empirical applications
- [ ] Code/package referenced if applicable
- [ ] Limitations discussed transparently
- [ ] Related work acknowledged in footnotes

**Before Giving a Talk**
- [ ] Roadmap slide early
- [ ] Motivation before mathematics
- [ ] Running example with consistent formatting
- [ ] "Key Takeaway" slides after complex sections
- [ ] Comparison tables (standard vs proposed)
- [ ] Clean figures with large fonts
- [ ] "What Should Researchers Do?" conclusion
- [ ] Appendix slides for technical details

---

## VII. ANTI-PATTERNS (AVOID)

**Writing**
- ❌ Starting with literature review
- ❌ Introducing notation without definition
- ❌ Propositions without stated assumptions
- ❌ Results without interpretation
- ❌ Burying limitations in footnotes
- ❌ "It is shown that..." passive constructions
- ❌ Equations without context

**Presentations**
- ❌ Walls of text
- ❌ > 3 equations per slide
- ❌ Skipping motivation
- ❌ No roadmap
- ❌ Tiny fonts on figures
- ❌ Ending with "Future Work" (end with contributions)
- ❌ Technical details in main slides (move to appendix)

---

## VIII. EMPIRICAL WORK: DISTINCTIVE PATTERNS

### A. Question-Driven Openings

**Lead with the Empirical Question**
- "Why does consumer financial strain vary so much across the United States?" (Medicare paper)
- Not: "We estimate the effect of Medicare..."
- Start with puzzle, observation, or policy question

**Establish Relevance Early**
- "Housing accounts for the majority of most American households' wealth" (Gender Gap)
- "Medicare's incidence as one of the largest public programs is of first-order policy importance" (Medicare)
- Connect to broader economic or policy stakes in first paragraph

**Preview the Answer**
- "We use detailed transactions data across the US, we find that single women earn 1.5 percentage points lower annualized returns relative to single men." (Gender Gap)
- Answer the question in the abstract and first 2 pages
- Don't make reader wait for punchline

### B. Data and Measurement Sections

**Dedicated "Study Data" Section**
- Always Section 3 in empirical papers
- Subsections: 3.1 Financial outcomes data, 3.2 Demographic data, 3.3 Additional characteristics
- Describe each dataset's coverage, sample period, key variables

**Transparency About Data Limitations**
- "We are able to credibly identify the buyer gender and family structure according to the criteria described in Section B for approximately 62% of the sample" (Gender Gap)
- "Importantly, our data stops before changes in regulations and industry practice caused medical collections debt to be removed from credit reports" (Medicare)
- Address measurement error head-on with dedicated subsection

**Data Description is Concrete**
- "The CCP is a five percent random sample of all individuals in the U.S. with credit reports" (Medicare)
- Specific numbers: sample sizes, coverage rates, time periods
- Never vague about what data you actually have

### C. Empirical Strategy: RD and Quasi-Experimental

**Clear Identification Section**
- Title: "Empirical strategy: Regression discontinuity design" (Medicare)
- Subsections: 4.1 Econometric model, 4.2 Estimating change in certainty equivalence, 4.3 Forecasting causal effects
- Front-load the intuition, then formalism

**Honest Identification Approach**
- "To estimate the causal impact of Medicare, we use an RD design that takes advantage of the sharp change in eligibility at age 65." (Medicare)
- State assumptions explicitly: "Under this assumption, any discontinuities in financial health around age 65 can be attributed to the change in coverage"
- Acknowledge what you can and cannot identify

**Practical Implementation Details**
- "Because we only observe birth year in the CCP data, and the data is quarterly, we measure age with noise. As a result...we follow the 'honest' confidence intervals approach outlined in Kolesár and Rothe (2018)" (Medicare)
- Don't hide technical challenges in appendix
- Show how you handle real-world messiness

### D. Results Presentation in Applied Work

**Visual Results First**
- "Figure 1 presents the effect of Medicare at age 65 at the national level and for each state." (Medicare)
- Lead with graphical evidence before tables
- Describe what figure shows in text, don't just reference it

**Quantitative Precision**
- "We estimate a sharp reduction in geographical variation in health insurance rates of 93.2% (95% CI: 85.3 to 101.1)" (Medicare)
- Always report point estimates with confidence intervals
- Specific numbers, not "large" or "significant"

**Interpretation Immediately Follows Estimates**
- After reporting 28.5 dollar reduction: "This suggests that Medicare, as expected, eliminates almost all variation across states in health insurance rates." (Medicare)
- Don't leave reader to interpret
- Connect estimate to economic meaning

**Heterogeneity Analysis is Central**
- Entire section: "Medicare and the geography of financial strain" (Medicare)
- Maps showing variation across locations (Figure 2)
- Regression analysis of which areas see largest effects (Figure 3)
- Not just "on average" but "where and for whom"

### E. Decomposition and Mechanisms

**Structured Mechanism Analysis**
- Clear subsection titles: "Estimating the change in certainty equivalence" (Medicare)
- Multiple competing explanations tested systematically
- Use data features to distinguish: repeat sales, market timing, negotiation patterns

**Quantitative Decompositions**
- "Approximately 45% of this gender gap in raw housing returns can be explained by market timing" (Gender Gap)
- Break down total effect into components
- Show what remains unexplained

**Robustness to Alternative Channels**
- Test property characteristics, home improvements, listing agents
- "The gender gap in housing returns remains large in a restricted sample for which the house listing does not mention any upgrades or renovations" (Gender Gap)
- Systematically rule out alternatives

### F. Policy and Economic Significance

**Translate to Dollar Terms**
- "A simple calculation implies that the housing-related gender gap in dollars is approximately $1,600 per year for the median single female homeowner" (Gender Gap)
- Convert percentage points to dollars, compare to familiar benchmarks
- "This is approximately half as large as the unexplained gender pay gap" (Gender Gap)

**Policy Implications with Nuance**
- "These findings highlight a potential limitation of policies, such as the ACA, that delegate states considerable latitude in policy implementation" (Medicare)
- Compare federal vs state-level programs
- Identify trade-offs, not just recommendations

**Broader Economic Context**
- "We estimate that the gender gap in housing returns can explain approximately 30% of the overall gender gap in wealth accumulation at retirement" (Gender Gap)
- Connect to larger literatures (wealth inequality, gender gaps)
- Show why this particular finding matters beyond itself

### G. Literature Positioning in Empirical Work

**"Our paper is most closely related to..."**
- Open Related Literature section with 2-3 most similar papers
- "Our paper is most closely related to two papers examining the financial risk protection provided by Medicare to elderly Americans. Caswell and Goddeeris (2019) use credit report data..." (Medicare)
- Describe their approach, findings, then contrast

**"Our paper expands on X in three key ways"**
- Enumerate specific contributions relative to prior work
- "First, we focus more on geographic heterogeneity...Second, we expand the set of financial health outcomes...Third, we document the effect of the ACA over a longer horizon" (Medicare)
- Constructive, not competitive tone

**Connect to Broader Literatures**
- "Our paper also connects to a series of papers on the financial risk protection from Medicare" (citations)
- "and a broader literature on the risk protection provided by health insurance" (citations)
- "We also contribute to a growing literature on the geography of health and economic opportunity" (citations)
- Show awareness of multiple conversations

### H. Common Empirical Phrases

**Describing Effects**
- "Medicare reduces geographic variation in debt collections by roughly two-thirds at age 65"
- "We find a large reduction in geographic variation"
- "The areas that experienced larger reductions...were concentrated in the Southern United States"

**Caveats and Scope**
- "We caution that our results do not necessarily imply that women make mistakes in housing negotiations"
- "It is not the goal of this paper to disentangle negotiation ability from other preferences"
- "While a strength of our data is the large sample size, we are limited to observations for which we can identify gender"

**Introducing Empirical Tests**
- "To quantify how Medicare reduces geographic disparities in consumer financial strain, we construct counterfactual estimates..."
- "To address this limitation, we replicate our analysis using the nationally representative American Housing Survey"
- "We begin by examining data on repeat sales of the same property"

---

## IX. EXAMPLES FROM PAPERS

### Bartik Paper (Econometric Methods)

**Opening Style:**
> "The Bartik instrument is formed by interacting local industry shares and national industry growth rates. We show that the typical use of Bartik instruments assumes a pooled exposure research design, where the shares measure differential exposure to common shocks, and identification is based on exogeneity of the shares."

**Building Intuition:**
> "Because the Bartik instrument combines two accounting identities, it is always possible to construct it. It is not plausible, however, that the Bartik instrument always provides a valid identification strategy. In this paper, we open the black box..."

**Pedagogical:**
> "To summarize, we view our contribution as explaining identification in the context of Bartik instruments in two ways. First, our GMM result shows that Bartik is numerically equivalent to using industry shares as instruments, and so the exogeneity condition should be interpreted in terms of the shares."

### Contamination Bias Paper

**Problem Statement:**
> "This paper shows that such multiple-treatment regressions generally fail to estimate convex weighted averages of heterogeneous causal effects, and discusses solutions to this problem. The problem may be surprising given an influential result in Angrist (1998)..."

**Transition to General:**
> "We now derive a general characterization of the contamination bias problem, in regressions of an outcome Y_i on a K-dimensional treatment vector X_i and flexible transformations of a control vector W_i."

**Practical Guidance:**
> "We then discuss three solutions to the contamination bias problem, and their trade-offs. These solutions apply when the propensity scores are non-degenerate, such as in an RCT or other 'design-based' regression specification."

### Event Studies Paper

**Motivation:**
> "Financial economists were practicing causal inference well before the credibility revolution (Angrist & Pischke, 2010). By examining how asset prices respond to information events—such as merger announcements, earnings releases, or regulatory changes—financial event studies compare the returns of treated assets to benchmark comparison asset returns."

**Identifying the Problem:**
> "This paper demonstrates that this standard approach faces a fundamental identification challenge. We show analytically that when the factor model is misspecified—which is almost certainly the case given the ongoing debates about the appropriate asset pricing model—abnormal return estimators are generally inconsistent estimators for causal effects."

**Offering Solutions:**
> "We provide precise conditions under which traditional event study methods identify causal effects. Identification of the average treatment effect on the treated requires either correct specification of the factor model (unlikely given decades of asset pricing research showing the difficulty of this task), random assignment of treatment across securities, or random assignment of many events across time and stationary factor distribution."

### Medicare Paper (Applied Policy Evaluation)

**Opening with the Question:**
> "Why does consumer financial strain vary so much across the United States (Keys, Mahoney and Yang, 2020)? In this paper, we examine the role that health insurance plays in shaping the geography of financial health."

**Three-Part Contribution:**
> "We use our location-specific estimates of Medicare's effects for three purposes. First, we show that Medicare reduces geographic variation in debt collections by roughly two-thirds at age 65. Second, we show that the gains in financial health due to Medicare are greatest in the South...Third, using shrinkage estimators, we construct forecasts of the causal effect of expanding coverage to the near-elderly in each of the 741 CZs in the United States"

**Transparency About Data:**
> "Importantly, our data stops before changes in regulations and industry practice caused medical collections debt to be removed from credit reports. Our data was not retroactively changed in response to new legislation."

**Quantifying Mechanisms:**
> "This 'extensive margin' effect of Medicare on coverage explains a surprisingly large share of the variation (R² = 0.38), with small estimated reductions in collections for states with small estimated changes in the insurance rate at age 65."

**Interpretation with Numbers:**
> "We estimate a sharp reduction in geographical variation in health insurance rates of 93.2% (95% CI: 85.3 to 101.1) at age 65 due to Medicare eligibility. This suggests that Medicare, as expected, eliminates almost all variation across states in health insurance rates."

### Gender Gap in Housing Returns (Applied Finance/Real Estate)

**Concrete Opening:**
> "Housing accounts for the majority of most American households' wealth, with Americans investing more in the housing market than in the stock market. Housing also differs from other common forms of household savings, such as bank deposits, bonds, and stocks, in that it is an illiquid and heterogeneous asset with prices determined through bilateral negotiation."

**Mechanism Testing Structure:**
> "We begin by examining data on repeat sales of the same property. We further compare men and women who transact in the same zip code and year-month. This allows us to examine the remaining gender gap after adjusting for differences in market timing. Holding the property fixed, and comparing men and women to transact in the same zip-year-month, women buy the same property for 1-2% more than men and sell for 2-3% less."

**Quantitative Decomposition:**
> "We find that single men earn 1.5 percentage points higher unlevered annualized returns relative to single women. Approximately 45% of this gender gap in raw housing returns can be explained by market timing, i.e., the choice of where and when to buy, and when to sell."

**Economic Significance:**
> "A simple calculation implies that the housing-related gender gap in dollars is approximately $1,600 per year for the median single female homeowner. This is approximately half as large as the unexplained gender pay gap...our findings also offer insight into variation in wealth accumulation (e.g., Ruel and Hauser (2013)). We estimate that the gender gap in housing returns can explain approximately 30% of the overall gender gap in wealth accumulation at retirement."

**Careful Interpretation:**
> "We caution that our results do not necessarily imply that women make mistakes in housing negotiations or have lower negotiation ability. Exley et al. (2016) show that women can experience more negative outcomes by 'leaning-in' and negotiating aggressively...It is not the goal of this paper to disentangle negotiation ability from other preferences that could affect negotiated outcomes."

---

*Last Updated: 2026-02-15*
*This guide should be referenced when writing papers or preparing presentations in Paul's style*
