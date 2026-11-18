// Shared layout for resumes and cover letters. Import it with:
//   #import "/templates/layout.typ": *
// then wrap the document with `#show: resume.with(...)` or `#show: letter.with(...)`.

#let font = "Libertinus Serif"

// Centered name and contact line, used by both documents.
#let header(name, contact) = align(center)[
  #text(size: 20pt, weight: "bold", name)
  #v(-0.6em)
  #contact
]

#let resume(name: "", contact: "", size: 10.5pt, body) = {
  set document(title: name + " - Resume", author: name)
  set page(paper: "us-letter", margin: (x: 0.7in, y: 0.6in))
  set text(font: font, size: size, hyphenate: false)
  set par(justify: false, leading: 0.5em, spacing: 0.85em)
  set list(indent: 0.6em, body-indent: 0.5em, spacing: 0.5em)
  show list: it => block(below: 0.9em, it)
  header(name, contact)
  body
}

// Section heading: small caps over a rule.
#let section(title) = block(above: 1.1em, below: 0.6em, width: 100%)[
  #text(size: 11.5pt, weight: "bold", tracking: 0.04em, smallcaps(title))
  #v(-0.7em)
  #line(length: 100%, stroke: 0.6pt)
]

// Role line: bold title, organization, dates at the right margin.
#let role(title, org, dates) = block(below: 0.5em)[
  *#title*#if org != none [, #org]#h(1fr)#text(fill: luma(60), dates)
]

#let letter(name: "", contact: "", size: 11.5pt, body) = {
  set document(title: name + " - Cover Letter", author: name)
  set page(paper: "us-letter", margin: (x: 1in, top: 0.9in, bottom: 0.9in))
  set text(font: font, size: size, hyphenate: false)
  set par(justify: false, leading: 0.62em, spacing: 1.15em)
  header(name, contact)
  v(-0.3em)
  line(length: 100%, stroke: 0.6pt)
  v(0.6em)
  body
}
