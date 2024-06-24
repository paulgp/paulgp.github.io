

Goal for today's chat is to highlight a number of useful ways that you can use AI in your research and teaching. I'm using AI super loosely here -- what I really mean is the relatively new innovations of Large Language Models that have sprung up following the release of ChatGPT 3.

A big chunk of what I want to show you revolves around [VS Code](https://code.visualstudio.com/). This is a free, open-source editor that is quite powerful and has a lot of extensions that make it a great choice for coding. Benefits (some for today, some for next week):

1. Free
2. Good IDE with broad support
3. Built-in Git that is quite good (see next talk)
4. Great remote access
5. Copilot (LLM for inline code suggestions and chat program)
6. Extensions with open community (good for many software platforms, also alows extensions in CodeGPT)


# VS Code + Copilot installation
1. Install VS Code 
    - https://code.visualstudio.com/
2. Setup Coding Extensions (Much built-in, but good extensions)
    - Python (Python, Pylance, Python Debugger, autopep8)
    - R (R) 
        - radian
        - https://aeturrell.com/blog/posts/setting-up-r-in-vscode/
    - Stata (stataRun, Stata Enhanced)
    - LaTeX (Latex Workshop) ([sometimes can't find latex compiler, see here](https://vkuhlmann.com/latex/configuration/fixingVSCode#fixing-using-the-wizard))
    - Remote
    - HTML Preview
3. Install Copilot + Chat
    - https://github.com/features/copilot/plans
    - In the extensions!
4. Setup Preferences
    - Theme
    - Font
    - Keybindings
    - Settings

## Known issues I've had
1. Launch vscode from the command line vs. from Applications -- the PATH variable isn't the same for each, and many of the relevant programs are on the command line PATH variable
2. Sometimes the latex compiler or python interpreter can't be found. This is a PATH issue.
3. Sometimes httpgd messes up inside VS Code. I often will have the graphs in a separate window, instead, but can be annoying. 

## Some examples of how Copilot is awesome
1. Example prompt/script for scraping data
2. Converting HTML to markdown
3. Creating comments for code

# Copilot vs. CodeGPT


# Construct a make file for a project
Use example  [README  from Bartik paper](http://paulgp.github.io/files/README_bartik.pdf) + Claude

# Write script to scrape data 
Example: Pull NBER Working paper codes

Example: pull all journal of finance brattle prize winners. Look at how citation counts correlate with probability of winning

# Write a sql query using words

# Quiz questions for class -> mapping to qualtrics

Prompt for class:
```
I'm writing a multiple choice short quiz for a class called "Investment Management" for MBA students. You're going to help me write the quizzes. My questions look like this

\\\`latex

\\question The CAPM model is a single factor model. What is the factor? \\begin{choices}

\\choice The risk-free rate

\\correctchoice The market risk premium

\\choice The market return

\\choice The market volatility

\\end{choices} \\\`

Generally, I want you to ask questions that probe understanding and require students to use logic, not just memory. Feel free to use situational questions like "Imagine that...". Please acknowledge.
```

Now we'll give it my materials from a day of class:

```
Let's write five questions evaluating the material in these slides that are attached.
```

Now let's output it to Qualtrics as well: (TODO)

# Making clip art for slides

[Midjourney](https://discord.com/channels/1254821865805840495/1254821865805840498) is my preferred approach

Example slides [here](https://paulgp.github.io/presentations/saffran_lecture.pdf)

# Chatbots 

Open AI has ChatGPT.

Anthropic has Claude.

Others include Gemini, Mixtral, and many alternatives (open source too).

# Converting math to code
