---
layout: blog
title: "LLM-Friendly Academic Papers: A Proposal"
date: 2026-03-10
tags: [AI, LLMs, Academic Publishing, Research]
---

_This post comes from many fruitful discussions with my friend Kyle Jensen. It also benefited from helpful comments from Kyle as well._

Researchers increasingly use large language models to summarize, compare, and synthesize academic papers. LLMs do this despite consuming formats designed for _human_ readers. Translating PDFs to plaintext—the lingua franca of AI—strips structure, garbles equations, and flattens authorial judgment into an undifferentiated stream. LLMs cope, but scholars would be better served if papers preserved structure and intent for machine consumption.

This is not hypothetical. A recent study found LLM-generated summaries were nearly five times more likely than human-authored summaries to overgeneralize scientific conclusions ([Peters and Chin-Yee 2025][peters2025]). The pattern it documents—machine summarization systematically drops scope limitations and contextual caveats—aligns with what researchers report across fields. A treatment effective for patients under 65 becomes "a treatment that works, full stop." Limitations are the information most likely dropped—and most dangerous when lost.

The PDF is not just a problem for machines. PDFs fail mobile devices. A large-scale analysis of 20,000 scholarly PDFs found 74.9% fail to meet _any_ accessibility criteria for blind and low-vision readers ([Kumar and Wang 2024][kumar2024]).

James Somers asked: "What would you get if you designed the scientific paper from scratch today?" ([Somers 2018][somers2018]). Not a two-column layout optimized for laser printers. We can be much more ambitious now.

Jeremy Howard's [llms.txt standard](https://llmstxt.org) offers a starting point. For websites, `llms.txt` is a markdown file at `/llms.txt` that helps LLMs navigate content without parsing HTML—a kind of site map for AI. Over 844,000 sites have adopted it. What makes the format noteworthy is its design: the file is _author-curated and lightweight_—interpretive choices about what matters, in plain language, without rigid schemas. No equivalent exists for academic papers, though they are harder for LLMs to parse: equations, figures, multi-column layouts, implicit structure.

We extend this to academic publishing. First: an `llms.txt` file for papers—an author-curated orientation that tells an LLM how to read a paper before it starts reading. At its simplest, a few paragraphs: what the paper shows, what it does not show, where to look. Second: a lightweight _paper bundle_—a zip archive containing the paper in markdown alongside figures, data, and the `llms.txt`—so the full content is available in clean, token-efficient form. At its most ambitious, the bundle is the paper and a reproduction package — code, data, dependencies — that an agent can execute and verify.

---

## The Proposal

Two components: a lightweight orientation file (`llms.txt`) and a paper bundle containing the full text in markdown alongside code and data.

### The `llms.txt` File

The `llms.txt` file is plain markdown, non-prescriptive, and author-controlled. No fields required. We suggest seven sections: _What is this paper about?_ (a direct statement, not an abstract); _Important context_ (common misconceptions, definitions, relationship to prior work); _Data and methods_ (a brief fingerprint); _Key results_; _Limitations and scope_ (what the paper does not show); _Navigation guide_ (which sections to prioritize); _Publication status_.

The most important field is _Limitations_—and the one most authors will skimp on. "Further research is needed" is not useful. Name specific boundary conditions: which populations, contexts, or conditions the results do _not_ cover. Available evidence suggests LLMs drop this information most systematically ([Peters and Chin-Yee 2025][peters2025])—and it is the most dangerous to lose.

---

To build intuition for what this standard looks like in practice, here is a concrete example. Consider the paper *Heterogeneous Real Estate Agents and the Housing Cycle* by Sonia Gilbukh and Paul Goldsmith-Pinkham (*Review of Financial Studies*, November 2024).

The following is a sample of a `llms.txt` that could accompany this paper:

```markdown
# Heterogeneous Real Estate Agents and the Housing Cycle
**Authors:** Sonia Gilbukh (Baruch College, CUNY) and Paul Goldsmith-Pinkham (Yale SOM, NBER)
**DOI:** https://doi.org/10.1093/rfs/hhae048

## What is this paper about?

The U.S. housing market is dominated by real estate agents, yet low barriers to entry and
fixed commission rates allow inexperienced agents to capture large market share—especially
after house price booms. This paper shows that inexperienced listing agents significantly
reduce a home's probability of sale, with effects strongest during housing busts. A structural
model estimates that flexible commissions would improve market liquidity by 3.7%.

## Important context

The paper has two distinct parts. The first is an empirical study establishing the causal
effect of agent experience on listing outcomes. The second is a structural model used to
evaluate counterfactual commission policies. Agent experience is measured as the number of
clients in the *prior calendar year*, not years in the profession.

## Limitations and scope

- Sample covers 60 MLS platforms from 2001—not a random sample of US markets.
- Does not model why sellers choose particular agents.
- The structural model abstracts from individual agent price-setting.
```

The full file includes data descriptions, methods fingerprints, navigation, and publication status. State-of-the-art AI could extract much of this material from the paper directly, but the `llms.txt` achieves two goals: first, it provides a structured overview that helps LLMs understand the paper's contributions and limitations without needing to spend significant tokens; second, it gives the *author* the ability to flag and highlight concerns or limitations that an LLM might miss or misinterpret.


### The Paper Bundle

The second component is a zip archive:

```
llms.txt              # author guidance
paper.md              # full text in markdown
figures/              # images referenced from paper.md
data/                 # underlying data for generated plots (CSV)
code/                 # analysis scripts (where applicable)
  reproduce.sh        # single entry point to regenerate results
  requirements.txt    # pinned dependencies
references.bib        # bibliography
```

The spine is `paper.md`—the full paper in markdown. For most LaTeX papers, `pandoc paper.tex -o paper.md` gets you there. Academics spend hours adjusting line colors on subpanel 4, nudging table column widths, wrestling LaTeX into placing Figure 3 on the same page as its caption. Markdown strips `\begin{table}`, font directives, and layout macros, reducing token count. We are not proposing authors abandon LaTeX for writing. Markdown is a delivery format, not an authoring format.

Tables should always appear as markdown tables or CSV, never as images. An LLM reading a PNG of regression output sees pixels. An LLM reading the same table as CSV can compare estimates across specifications, compute standard-error ratios, flag whether reported p-values match the coefficients. Include both: the image for human readers, the data for machines.

The bundle is not merely a delivery format. Properly constructed, it is an _executable claim_. The scholarship is the complete environment: code, data, parameters, dependencies. For three decades this has been an aspiration honored more in the breach. The reason is simple: reproducing computational work means navigating a maze of software versions, broken dependencies, undocumented preprocessing steps, and README files that assume knowledge the reader does not possess. A 2018 study found that fewer than half of sampled computational studies in top journals provided enough information for independent researchers to regenerate results, even when code was ostensibly available ([Stodden et al. 2018][stodden2018]).

An AI agent can execute a workflow with inhuman patience—if the workflow is documented with machine precision. This package could include the code and your raw data (or clear instructions for obtaining it). Include the exact programs and command sequence that generates each figure. What has historically been too tedious for human reproduction becomes tractable for machine reproduction.

The most complete form of this bundle includes a form of the reproduction packages that have become an increasing focus of journals and the Open Science movement ([Vilhuber et al. 2023][vilhuber2023]). By tying the paper bundle to its computational workflow, this would rapidly expand the set of tools and ability of AI to aid in verifying and expanding on results.

### Why Not Just Fix the PDF Parsers?

The obvious objection: if LLMs struggle with PDFs, why not build better parsers rather than ask authors to produce parallel markdown?

Because the ceiling is real, and because perfect extraction would not solve the problem anyway. A comparative evaluation of state-of-the-art extraction tools found that even the best achieved only modest accuracy on equations and table structure in diverse academic PDFs ([Adhikari and Agarwal 2024][adhikari2024]). These are neural models trained on hundreds of thousands of documents; incremental improvement is possible but the error modes are intrinsic. A parser must infer which text spans constitute a figure caption, which columns are parallel sections versus sequential narrative, whether a superscript "2" is an exponent or a citation marker—all from pixel coordinates and font directives. In a two-column economics paper with appendix tables, the ground truth is genuinely ambiguous.

Second, even perfect extraction does not solve the core problem. A parser can convert a PDF to clean text, but it cannot tell a machine reader which results are central versus peripheral, which limitations matter most, or that "experience" in this paper means prior-year client count rather than career tenure. These are interpretive judgments only the author can make. The `llms.txt` is not a workaround for bad parsing—it is a layer of authorial intent that no parsing technology can extract because the information does not exist in the PDF to begin with.

We are asking the AI to parse a photograph of text, when we have access to all of the underlying intent and context.

---

## Automation and Implementation

Most of the bundle can be machine-generated. Authors should focus on the judgment-dependent fields no algorithm can fill: which results matter most, which limitations are binding, what the common misreadings are.

A preliminary version of code to construct this is available at [github.com/paulgp/academic-llms](https://github.com/paulgp/academic-llms). Using arXiv's data structure, you can:

1. Download the source tarball (replace with your paper's arXiv ID):
   ```bash
   curl -L "https://arxiv.org/src/2401.12345" -o source.tar.gz
   ```
2. Extract into a directory:
   ```bash
   mkdir paper && tar xzf source.tar.gz -C paper/
   ```
3. Run the pipeline:
   ```bash
   just convert paper/
   just draft
   just review      # optional: interactively edit each section
   just bundle
   ```

### Tiered Adoption

**Tier 1—Full automation (arXiv and Overleaf).** arXiv receives approximately 20,000 submissions monthly, nearly all LaTeX. Its LaTeXML-based HTML pipeline already converts TeX to HTML. Extending this pipeline to produce `paper.md` and a draft `llms.txt` is a small step.

Overleaf, with 15 million users, catches the paper while the author writes. A "Generate LLM bundle" button alongside "Submit to arXiv" is the natural integration.

Both arXiv and Overleaf would use the same tool: a script that takes a LaTeX directory and produces a zip. The script also bootstraps adoption before platform integration: install, run, post the zip. No institutional coordination required.

**Tier 2—PDF-based.** Without LaTeX, extract from PDF using GROBID, Docling ([IBM 2024][docling2024]), or Nougat. The resulting `paper.md` is noisier, figures lose their underlying data, and equations are less reliable. Upload a PDF, receive a draft bundle, review, and publish on Zenodo or your site.

**Tier 3—Manual.** Write an `llms.txt` by hand and post it alongside the PDF on your website. No bundle, no automation—but any LLM that retrieves the paper gets the orientation. Fifteen minutes, a text editor, and the knowledge that the next agent summarizing your work will read your caveats before it reads anything else.

### Generating a Draft `llms.txt`

An LLM can draft the `llms.txt` automatically—but only the author knows which limitation matters most. Two passes: first, an LLM reads `paper.md` and populates the template. Second, the author edits the judgment-dependent fields. An LLM will summarize what the paper _says_ about limitations; it cannot judge which limitation _matters_ most—which one determines whether the finding generalizes, which sample restriction is the real binding constraint, which robustness check you would bet your career on. This is where author editing is most relevant.

### Hosting the Bundles

In the case of a fully published paper, the bundle could be hosted directly by the journal. For working papers, the bundle could be hosted by either the repository (arXiv, SSRN) or the author's website. The bundle could be linked from the paper's landing page and included in the metadata so that it is discoverable by search engines and LLMs.

In the context of replication packages, the bundle could be hosted on platforms like GitHub or Zenodo, with a DOI for citation. The key is that the bundle is easily accessible and clearly associated with the paper it describes, so that when an LLM retrieves the paper, it also retrieves the bundle and can use the `llms.txt` to guide its understanding and summarization of the paper's content and limitations.

### Managing the Versions

One concern is that just as we have many versions of a paper (working paper, preprint, published version), we might end up with many versions of the `llms.txt` and bundle. The solution is to treat the `llms.txt` and bundle as living documents that can be updated as the paper evolves. When a new version of the paper is released, the author can update the `llms.txt` as well. The key is to maintain a clear versioning system and to link the `llms.txt` and bundle to the specific version of the paper they correspond to. On arXiv, this should be straightforward since each version of the paper has a unique identifier (e.g., 2401.12345v1, 2401.12345v2). For journal publications, the `llms.txt` and bundle can be updated to reflect the final published version, and the DOI can be used to link them together.

---

## Conclusion

The infrastructure exists. arXiv has LaTeX source for 2.4 million papers. Overleaf has 15 million users. What is missing is not technology but convention: the expectation that when you publish a paper, you also publish a short note telling machines what it shows, what it does not, and where to look.

And for the reader who is unconvinced on the future of AI in research — the bundle improves accessibility, reproducibility, and human readability, regardless of whether an LLM is involved. The markdown version is more accessible on mobile devices and screen readers. The data and code make it easier for human researchers to verify and build on the work.

The minimal ask: write a brief `llms.txt` for your next paper. Two paragraphs stating what it shows and what it does not. Post it with your PDF. Fifteen minutes. The value: when an LLM summarizes your work six months from now—and it will—the machine reads your caveats first. If you write in LaTeX, run Pandoc and include the markdown. At the ambitious end, include the computational environment so an agent can reproduce your results without human intervention. The minimal version costs minutes of reflection; the full version offers a path out of the reproducibility crisis.
