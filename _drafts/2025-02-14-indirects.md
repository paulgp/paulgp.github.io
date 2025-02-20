---
layout: blog
title: "Why Lowering Indirect Costs on NIH Grants Distorts Research Funding"
date: 2025-02-14
tags: [Economics, Grants]
---

[Big cuts to indirect costs](https://grants.nih.gov/grants/guide/notice-files/NOT-OD-25-068.html) in National Institute of Health (NIH) grants have [been](https://www.statnews.com/2025/02/08/nih-indirect-research-cost-rate-cuts-universities-threat/) [in](https://www.nytimes.com/2025/02/07/us/politics/medical-research-funding-cuts-university-budgets.html) [the](https://www.nytimes.com/interactive/2025/02/13/upshot/nih-trump-funding-cuts.html) [news](https://www.nytimes.com/2025/02/10/us/politics/nih-trump-lawsuit-medical-research.html).

If you have not been following this, the NIH issued guidance in the new Trump administration to cap the share of **indirect costs** that universities can charge on NIH grants. Indirect costs, broadly speaking, are the overhead that universities charge on top of direct research expenses to cover building maintenance, administrative support, and other infrastructure. The new guidance limits indirect costs to 15% of direct costs, [down from 38.6%.](https://officeofbudget.od.nih.gov/pdfs/FY21/br/5-SupplementaryTables.pdf) {% include sidenote.html number="0" text="I calculate this on Page 87 as 27.9/72.1 = 38.6" %}  However, some institutions are **much** higher. For example, [Yale charges an indirect cost of 67.5% on NIH grants.](https://research.yale.edu/announcements/new-indirect-costs-rates) To give you a sense of magnitude, Yale receives [643 million dollars a year in NIH grants](https://yaledailynews.com/blog/2025/02/10/nih-slashes-indirect-research-funding-sparking-concern-at-yale/#:~:text=In%20fiscal%20year%202024%2C%20Yale,million%20in%20NIH%20federal%20funding). Hence, Yale gets roughly 434 million a year in indirect cost funding. A drop to 15% indirect costs would mean a loss of 300 million dollars a year.  So, this is a big deal! 

So *why* the grants are structured this way? Indirect costs are not just a way to pad the budget; there is a good economic reason why we separate costs out in this way, and it relates to **two-part tariffs**. {% include sidenote.html number="1" text="This post was sparked by a discussion and explanation from a colleague, and I thought writing it up would be useful for others!" %} 

First, let's consider that a grant funded by the NIH to researchers is split into **direct costs** and **indirect costs**. Direct costs are straightforward—they pay for the salaries of researchers, specialized equipment, and consumables like reagents or test kits. Indirect costs, on the other hand, fund the essential overhead that keeps research functioning: building maintenance, electricity, administrative support, and so on. From the original NIH guidance letter I linked: 

>The National Institutes of Health (NIH) awards a large number of grants providing substantial federal funding for research purposes.  These grants include significant payments for “indirect costs,” defined as “facilities” and “administration.”  45 CFR 75.414(a). The “facilities” category is “defined as depreciation on buildings, **equipment and capital improvements,** interest on debt associated with certain buildings, equipment and capital improvements, and operations and maintenance expenses.”  Id.  And the “administration” category is defined as “general administration and general expenses such as the director’s office, accounting, personnel, and all other types of expenditures not listed specifically under one of the subcategories of ‘Facilities”’ (including cross allocations from other pools, where applicable).  Id.

When you first see indirect costs, a natural reaction may be the following: a hard-working researcher at your favorite institution has finally gotten a big grant to do research (budgeting out all their costs and needs), and the University has swooped in and tacked on a big chunk to subsidize all the rest of the university. The key thing to remember is that the university is not just a collection of independent labs and departments; it is a complex organization with shared resources and infrastructure. If we forced every research lab to pay the average cost of their share of the building, utilities, and admin staff, a huge number of research projects would be infeasible because *the marginal cost of their research should be close to zero*. 

Economic principles suggest that separating overhead from direct expenses can help avoid overcharging each incremental project or experiment. Below is a stylized example using both total project costs and an illustrative per-hour overhead scenario to show why.

---

### The Challenge of Fixed Costs

Universities have large **fixed costs**—infrastructure, administrative staff, core labs, equipment{% include sidenote.html number="3"  text="A new electron microscope can run a University [100k to 2 million!](https://www.labx.com/categories/electron-microscope)"%}—that must be funded even if only a few research projects are running. If you fold all those overhead expenses into each project’s direct costs, the price for each additional unit of research (whether that’s an hour of lab work, a piece of equipment usage, or a test subject visit) starts to incorporate fixed costs that *don’t actually vary* with the size of the project. The result is that each project’s “effective” cost becomes much higher than its *true marginal cost*, discouraging valuable research.

- This **\$200,000** is effectively a **fixed cost** for the university.  
- Multiple labs (and multiple NIH-funded projects) will share the microscope.  
- The microscope’s *marginal cost* of running one extra sample—electricity, some incremental supplies, maybe a small bit of wear and tear—is far lower than the average cost if we tried to divide the entire \$200,000 across each user hour.

---

### A Stylized Example


Suppose three different NIH-funded projects plan to use this electron microscope:

1. **Project A** (Small Pilot Study on Bacterial Samples)  
   - Plans to run **50 hours** of microscope time for an initial data  
   - Direct costs (researchers’ salaries, reagents, etc.) = \\$50,000  

2. **Project B** (Mid-Size Study on Engineered Tissues)  
   - Plans to run **250 hours** of microscope time, analyzing multiple tissue types  
   - Direct costs = \\$300,000  

3. **Project C** (Large Study on Neurodegenerative Disease Models)  
   - Plans to run **700 hours** of microscope time, involving many different cell lines  
   - Direct costs = \\$1,000,000  


#### Indirect Cost Approach

Currently, universities often handle big shared infrastructure (like the \\$2 million microscope) in part through **indirect costs**—the overhead pool that covers building depreciation, maintenance, and technical support. Suppose the negotiated indirect cost rate is **50%** of direct costs. Then:

- **Project A**  
  - Direct = \$50,000  
  - Indirect (50%) = \$25,000  
  - **Total = \$75,000**  

- **Project B**  
  - Direct = \$300,000  
  - Indirect (50%) = \$150,000  
  - **Total = \$450,000**  

- **Project C**  
  - Direct = \$1,000,000  
  - Indirect (50%) = \$500,000  
  - **Total = \$1,500,000**  

Collectively, that overhead revenue—\\$25,000 + \\$150,000 + \\$500,000 = \\$675,000—pays for (among other things) the \\$200,000 needed to keep the microscope running each year (and defray the overall cost of purchasing the microscope over time), plus other building and administrative costs.

**Crucially**, each project’s incremental decision—"Should we scan 10 more samples?"—depends mostly on direct costs (staff time, reagents). They don’t face a **huge** additional overhead penalty every time they add a sample.

### Under an “All Direct” System: Per-Hour Pricing Gone Wild

Now imagine a rule that says **all** costs must be labeled as direct. The university decides to recover the \$200,000 microscope overhead via **per-hour usage fees**. They estimate total usage across all projects at **1,000 hours** for the year (50 + 250 + 700 from the above three, plus maybe a bit extra from other minor projects). To break even, they set:

$$
\text{Microscope usage fee} = \frac{\$200,000}{1,000\ \text{hours}} = \$200 \text{ per hour}.
$$

Here’s how that might affect each project:

- **Project A (50 hours)**  
  - Base direct costs = \\$50,000 (for salaries, supplies).  
  - Electron microscope “direct” usage fee = 50 $\times$ \\$200 = \\$10,000.  
  - **Total direct costs** = \\$60,000.  
  - Potential overhead for everything else? Also must be captured somewhere, so the actual “direct” bill could be even higher if the university lumps in building insurance, admin staff, etc.

- **Project B (250 hours)**  
  - Base direct costs = \\$300,000.  
  - Microscope usage fee = 250 × \$200 = \\$50,000.  
  - **Total direct costs** = \\$350,000.  

- **Project C (700 hours)**  
  - Base direct costs = \\$1,000,000.  
  - Microscope usage fee = 700 × \$200 = \\$140,000.  
  - **Total direct costs** = \\$1,140,000.  

From the perspective of a researcher, each additional hour on the microscope now appears to “cost” \$200, even though the *actual marginal cost* (electricity, wear) is probably far less. Most of that \$200 is paying for the *fixed* portion: the technician’s salary, maintenance contract, depreciation on the microscope. If the researcher thinks, “Could I use an extra 20 hours to explore another promising line of inquiry?” that means an extra \$4,000 that might come out of the project’s budget—possibly discouraging those additional scans.

### Ramsey Pricing and Economic Efficiency

**Ramsey pricing** helps recover large fixed costs *without* making each marginal unit of consumption so expensive that users cut back. In our case, if the university tries to collect microscope overhead purely as an hourly usage fee, it risks:

- **Over-pricing** each hour, discouraging additional beneficial research.  
- **Under-utilizing** the microscope, leaving valuable infrastructure idle.

Under the **indirect cost** model, the microscope’s fixed costs are covered as part of a broader overhead pool, which in effect spreads the burden of that \\$200,000 across many projects more smoothly. That ensures the marginal cost for scanning more samples is closer to actual usage costs (maybe a modest incremental fee or technician time)—rather than \\$200/hour. 

<div class="boxnote">
<b>Two-part tariffs</b> are common for addressing this exact problem: 
<br>
<ol>
<li> A <b>fixed fee</b> that covers large overhead (like the cost of building or maintaining the facility—our $200,000 for the microscope).</li>
<li> A <b>usage-based</b> fee that’s either zero or close to the true marginal cost (electricity, consumables, fraction of a tech’s time per scan).</li>
</ol>
Indirect costs act like that fixed “membership fee,” ensuring the big overhead is funded. Each project then pays a modest marginal expense if they decide to run more scans or tests. This fosters exactly the kind of open-ended exploration that can yield breakthroughs—rather than making every additional hour cost-prohibitive.
</div>

---

### Why This Matters

Eliminating indirect costs on NIH grants—thus forcing all large infrastructure (like a \\$2 million electron microscope) to be recouped through direct, per-hour or per-use billing—might seem simple or transparent at first, but it can cause researchers to cut back on using that very equipment.  

**Overhead is real**: Universities have large fixed costs that must be funded, whether or not a particular project is running. An important question, of course, is whether this overhead is necessary overhead or if it just bloat. For example, [Stuart Buck has highlighted that there is significant growth in the regulatory burden facing researchers.](https://goodscience.substack.com/p/indirect-costs-at-nih)

<figure class="widefigure">
  <img src="/assets/img/buck_regulations.png" alt="Regulations ">
  <figcaption>Growth in federal regulatory burden from the Councial on Governmental Relations (COGR), replicated from Stuart Buck's blog.</figcaption>
</figure>

One could view these regulations as important or frivolous, but they likely contribute to a need for more administrative staff and overhead.

A more interesting question, to me, is whether fixed costs have grown over time, as a share of research costs. Do we have more large costs that need to be defrayed as our technology and research questions have become more complex? Presumably, if we had a measure of the actual fixed costs that needed to be borne by the researcher (and an agreement on how much this should be shared with the government), we could have a better sense of what the ``right'' indirect cost rate should be.

This would also explain the difference in institutions on their indirect cost share -- if only some institutions have access to certain expensive equipment then they would have a higher indirect cost share (and also capture a larger share of all grants, since they can do the actual research). To give some evidence of this, I've taken the top 25 higher education institutions that receive funds from the HHS (of which NIH is almost 90%).{% include sidenote.html number="4" text="Data courtesy of [Beth Popp Berman](https://bsky.app/profile/epopppp.bsky.social/post/3lhog3kx4x226)" %} I then looked up the indirect cost share for each institution. 

The following graph plots the top 25 institutions (ranked by their 2023 total HHS funding) and their indirect cost share. Note that these institutions make up **50%** of all HHS funding to higher education institutions (which was roughly 33 billion dollars in 2023). 

<figure class="widefigure">
  <img src="/assets/img/nih_grant_univ_costshare.svg" alt="NIH Cost Share for Top 25 Higher Ed Receipeints ">
  <figcaption>Top 25 Higher Ed institutions that receive the largest share of HHS grants (courtesy of Beth Popp Berman), originally from Survey of Federal Funds for Research and Development 2022 - 2023, https://ncses.nsf.gov/surveys/federal-funds-research-development/2022-2023. Indirect Cost Shares measured by me from various school websites. Measure is for on-campus primary research. Reported NIH average comes from NIH memo.</figcaption>
</figure>

This distribution of cost shares stands in remarkable contrast to the [overall average from the NIH memo](https://grants.nih.gov/grants/guide/notice-files/NOT-OD-25-068.html):

> Yet the average indirect cost rate reported by NIH has averaged between 27% and 28% over time.

It is possible that some institutions are overcharging for their fixed costs. But economics suggest that there are economies of scale in research that make it more efficient to have some institutions with large fixed costs that can be shared across many projects. Economists should provide a more full-throated defense of this system, as it likely reflects an important economic principle that is not well understood by the public.