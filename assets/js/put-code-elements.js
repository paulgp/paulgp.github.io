/*
    https://github.com/cademirci/jekyll-code-style

    Author: Caglayan Demirci (cademirci.com)
    GitHub: cademirci
*/

window.addEventListener('DOMContentLoaded', () => {

  var codeBlocks = document.querySelectorAll("pre.highlight")
  codeBlocks.forEach((element) => {
    var self = element.children[0]
    var highlighterClassName = element.parentElement.parentElement.className
    var languageName = highlighterClassName
                       .substring(0, highlighterClassName.indexOf(" "))
                       .replace("language-", "")
                       .toUpperCase()
    var lines = self.innerHTML.split('\n')
    if (languageName === 'TERMINAL') {
      // if language is terminal (shell), put dollar signs instead numbers
      // and its symbol (>_) as pre::before content.
      self.parentElement.setAttribute('data-before', 'terminal')
      self.innerHTML = putDollarSigns(lines)
    }
    else {
      self.parentElement.setAttribute('data-before', languageName)
      if (lines.length > 5) {
        // if number of lines is less than 5, code numbers are unnecessary.
        self.innerHTML = putLineNumbers(lines)
      }
    }
  })

})

function putDollarSigns(lines) {
  var lineWithSign = ""
  var codeWithSigns = ""
  lines.forEach((element, index) => {
    if (index !== lines.length - 1) { // if this is not the last line (empty line)
      lineWithSign = "<span class='ln'>~$&ensp;&ensp;</span>" + element
      codeWithSigns += lineWithSign + "\n"
    }
  })
  return codeWithSigns
}

function putLineNumbers(lines) {
  var numberAndSpace = ""
  var lineWithNumber = ""
  var codeWithLineNumbers = ""
  lines.forEach((element, index) => {
    if (index !== lines.length - 1) {
      var number = index + 1
      if (number < 10) {
        numberAndSpace = "<span class='ln'>" + number + "&ensp;&ensp;&ensp;</span>"
        // if I do not put these &ensp whitespaces, when digit numbers increase, 
        // the current code line would be shifted one character.
      }
      else if (number < 100) {
        // 9   x
        // 10  x
        numberAndSpace = "<span class='ln'>" + number + "&ensp;&ensp;</span>"
      }
      else {
        // 99  x
        // 100 x
        numberAndSpace = "<span class='ln'>" + number + "&ensp;</span>"
        // I assume users do not put over 1000-line code on their page.
      }
      lineWithNumber = numberAndSpace + element
      codeWithLineNumbers += lineWithNumber + '\n'
    }
  })
  return codeWithLineNumbers
}
