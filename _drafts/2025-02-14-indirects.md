---
layout: blog
title: "Why do we use indirect costs on NIH grants?"
date: 2025-02-14
tags: [Economics, Grants]
---


## Why Lowering Indirect Costs on NIH Grants Could Distort Research Funding  
*An economics perspective*

[Big cuts to indirect costs](https://grants.nih.gov/grants/guide/notice-files/NOT-OD-25-068.html) in National Institute of Health (NIH) grants have [been](https://www.statnews.com/2025/02/08/nih-indirect-research-cost-rate-cuts-universities-threat/) [in](https://www.nytimes.com/2025/02/07/us/politics/medical-research-funding-cuts-university-budgets.html) [the](https://www.nytimes.com/interactive/2025/02/13/upshot/nih-trump-funding-cuts.html) [news](https://www.nytimes.com/2025/02/10/us/politics/nih-trump-lawsuit-medical-research.html).

If you have not been following this, the NIH issued guidance in the new Trump administration to cap the share of **indirect costs** that universities can charge on NIH grants. Indirect costs, broadly speaking, are the overhead that universities charge on top of direct research expenses to cover building maintenance, administrative support, and other infrastructure. The new guidance limits indirect costs to 15% of direct costs, [down from 38.6%.](https://officeofbudget.od.nih.gov/pdfs/FY21/br/5-SupplementaryTables.pdf){% include sidenote.html number="0" text=I calculate this on Page 87 as 27.9/72.1 = 38.6" %} However, some institutions are **much** higher. For example, [Yale charges an indirect cost of 67.5% on NIH grants.](https://research.yale.edu/announcements/new-indirect-costs-rates) To give you a sense of numbers for my home institution, Yale, we receive [643 million dollars a year in NIH grants](https://yaledailynews.com/blog/2025/02/10/nih-slashes-indirect-research-funding-sparking-concern-at-yale/#:~:text=In%20fiscal%20year%202024%2C%20Yale,million%20in%20NIH%20federal%20funding.) Hence, we get roughly 434 million a year in indirect cost funding. A drop to 15% indirect costs would mean a loss of 300 million dollars a year.  So, this is a big deal!

I thought it might be interesting to discuss *why* the grants are structured this way, and why the indirect costs are not just a way to pad the budget. 

**direct costs** and **indirect costs**. Direct costs are straightforward—they pay for the salaries of researchers, specialized equipment, and consumables like reagents or test kits. Indirect costs, on the other hand, fund the essential overhead that keeps research functioning: building maintenance, electricity, administrative support, and so on.{% include sidenote.html number="0" text="This post was sparked by a discussion and explanation from a colleague, and I thought writing it up would be useful for others!" %}

Some have argued for eliminating these indirect costs—rolling them into “all direct” expenses—under the assumption that this would be simpler and more transparent. But economic principles around **Ramsey pricing** and **two-part tariffs** show that separating overhead from direct expenses can help avoid overcharging each incremental project or experiment. Below is a stylized example using both total project costs and an illustrative per-hour overhead scenario to show why.

---

### The Challenge of Fixed Costs

Universities have large **fixed costs**—infrastructure, administrative staff, core labs—that must be funded even if only a few research projects are running. If you fold all those overhead expenses into each project’s direct costs, the price for each additional unit of research (whether that’s an hour of lab work, a piece of equipment usage, or a test subject visit) starts to incorporate fixed costs that *don’t actually vary* with the size of the project. The result is that each project’s “effective” cost becomes much higher than its *true marginal cost*, discouraging valuable research.

---

### A Stylized Example with Total Costs

Suppose a university’s biomedical department is planning three projects:

1. **Project A**: Small Pilot Study  
   - Direct costs = \$50,000

2. **Project B**: Mid-Size Lab Experiment  
   - Direct costs = \$300,000

3. **Project C**: Large Clinical Trial  
   - Direct costs = \$1,000,000

Let’s assume the university’s total overhead (for administration, facilities, utilities, etc.) that must be covered by these grants is \$675,000. Under the **current system**, it’s common to apply an *indirect cost rate* (say, 50%) on top of direct costs to recover this overhead proportionally:

- **Project A**: Direct = \$50,000; Indirect = \$25,000 (50%); Total = \$75,000  
- **Project B**: Direct = \$300,000; Indirect = \$150,000 (50%); Total = \$450,000  
- **Project C**: Direct = \$1,000,000; Indirect = \$500,000 (50%); Total = \$1,500,000  

The combined indirect is \$25,000 + \$150,000 + \$500,000 = \$675,000, exactly covering the overhead. This arrangement keeps each project’s *marginal research expenses* closer to the true additional cost of doing one more experiment, rather than piling everything into each test.

#### Under an “All Direct” System

Now imagine a rule forcing **all** fixed and overhead costs into “direct” line items. Each project must incorporate part of the \$675,000 overhead into its own budget. If the university attempts to divvy overhead evenly or by some formula, smaller projects might bear a disproportionate cost, or large projects might see a large “lump sum” charge. In either case, the cost of each extra experiment or test appears higher because it’s bundled with overhead that doesn’t really grow with usage.

---

### Adding a Per-Hour Billing Twist

To make the “all direct” approach feasible, some institutions might try a **per-hour** overhead charge. For example:

- The university calculates that all active projects combined will use roughly **6,750 hours** of research staff time (lab work, technician support, etc.) over a grant year.  
- To recover the \$675,000 in overhead, they set an **overhead fee of \$100/hour** (since \$675,000 / 6,750 hours = \$100/hour).  

Now, whenever a researcher bills an hour of work, the direct cost includes not just their wage and fringe benefits, but also a \$100 overhead surcharge to cover building maintenance, utilities, administrative support, and so forth.

#### Why This Can Be Distortive

- **Project A** (Small Pilot Study) may only need 500 hours of staff time across its entire run. Even if the direct wage/fringe is \$50/hour, the overhead adds another \$100/hour—tripling the effective labor cost to \$150/hour. If the pilot team is borderline on budget, they might cut back on crucial data collection or analysis because each additional hour “costs” far more than it truly should.  
- **Project B** (Mid-Size Lab Experiment) might use 2,000 hours of staff time, facing an extra \$100 x 2,000 = \$200,000 in overhead on top of direct wages. That overhead chunk doesn’t reflect a *marginal* cost per experiment or per reagent—it’s largely fixed infrastructure.  
- **Project C** (Large Clinical Trial) might be more tolerant of the overhead surcharge because it has a big budget. But its 4,250 hours could still rack up \$425,000 in overhead, potentially dissuading them from adding new patient visits or experimental arms if they’re worried about ballooning costs.

In reality, the *true marginal cost* of an additional hour of work might be closer to the wage plus a small increment for wear-and-tear on labs or small incremental utilities. The *fixed* overhead for the building and admin staff remains the same whether they conduct 10 hours or 10,000 hours of research. Attaching a \$100/hour fee effectively makes each extra hour “look” a lot more expensive, potentially leading to under-investment in additional research tasks.

---

### Ramsey Pricing and Economic Efficiency

The underlying problem is: **How do we pay for large fixed costs without discouraging the very usage we want to promote?** This is where **Ramsey pricing** comes in, often used in utilities like electricity or water. By applying different markups for different groups—or in NIH’s case, an indirect cost that’s separate from the direct usage—the institution recovers overhead without forcing each marginal unit of research to cover its entire share of fixed infrastructure.

---

### Two-Part Tariffs: The Gym Membership Analogy

Another lens is the **two-part tariff**:  
1. A fixed fee (like a gym membership) that covers the bulk of overhead—rent, equipment, insurance, etc.  
2. A usage-based fee (possibly zero or minimal) that reflects the true incremental cost per exercise class or hour.  

In research, **indirect costs** act like the membership fee: labs pay for building upkeep, admin staff, and facilities at a predictable rate. Then, each incremental supply purchase or hour of labor is “closer” to its actual direct cost, avoiding a situation where overhead inflates the price so much that researchers cut back on otherwise valuable experiments.

---

### Why This Matters

1. **Promoting Efficient Research Decisions**  
   Burying all fixed costs in per-hour or per-task direct charges inflates the apparent expense of each additional experiment or study modification. Labs may conduct fewer studies or smaller investigations than socially optimal.

2. **Maintaining University Infrastructure**  
   If overhead is fully reliant on direct cost line items, universities face uncertainty when grant activity fluctuates. Facilities and administrative staff must be funded consistently, and a purely per-hour or per-supply approach can yield unpredictable budgets.

3. **Encouraging Collaboration and Innovation**  
   When the “price” of each hour or experiment is overly inflated, labs become wary of any extra usage or collaborative effort (which might require more staff time). This can reduce the interdisciplinary research that often leads to major breakthroughs.

