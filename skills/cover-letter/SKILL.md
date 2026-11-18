---
name: cover-letter
description: Write and review a cover letter for a specific job with the user, using the MIT CAPD cover letter guide and a blunt hiring-manager read. Use when the user asks to write, draft, tailor, or review a cover letter.
---

# Cover letter

Write a one-page cover letter for one job with the user, following the MIT
CAPD cover letter guide, then review it the way that job's hiring manager
would. The letter is built from the user's own reasons and stories; every
change is agreed with the user before it goes in.

## Files

Letters live in the same variant folder as the resume for that application
(see the resume-tuning skill for the workspace layout and setup).

```
templates/layout.typ                       # shared layout; letters use `letter`
variants/
  <employer-role>/
    postings/                              # the job posting(s)
    resume-<employer-role>.typ             # the tailored resume
    cover-letter-<employer-role>.typ       # the cover letter
    README.md                              # who it's for and how it's delivered
```

Build PDFs with `scripts/build-pdfs.sh` (needs the
[Typst](https://typst.app) CLI). Output goes to `dist/`, which is never
committed.

## Workflow

Work through these steps in order. Keep chat replies short and cover one item
per turn.

1. **Gather the facts.** Save the posting in `postings/` if it isn't there.
   Record the hiring manager's full name (or "Dear Hiring Manager" if unknown),
   the job's reference number, and how the letter will be delivered (for
   example, a referral handing it over, or an online application).
2. **Ask the user.** One question per turn, until each is answered in the
   user's own words:
   - What is the letter asking for? (This role, a different level, a
     conversation.)
   - Why this role and this employer? Never supply a reason the user did not
     give.
   - Which two or three experiences best show they can do this job? Offer
     candidates from the resume and posting, and let the user choose.
   - For each chosen experience: what happened, what the user did, and how it
     turned out. Get the detail the resume leaves out.
3. **Draft.** Write the complete letter, send-ready, with no placeholders,
   brackets or notes, in a document the user can comment on: a Claude Doc
   where that's available, otherwise a Markdown file in the variant folder.
   Follow the structure below. After the first draft, the user approves every
   edit (see Redlines).
4. **Check and review.** Run the MIT checklist and the hiring-manager review
   (below).
5. **Redline.** Propose each change (below) until the user says the wording
   is right.
6. **Build.** Once the user calls the letter final, copy its text into
   `cover-letter-<employer-role>.typ`, importing `/templates/layout.typ` and
   using `letter`. Run `scripts/build-pdfs.sh`, confirm it is one page, and
   run `pdftotext -layout` on the PDF to confirm the text extracts in order.

## Structure (MIT CAPD)

Source: MIT Career Advising & Professional Development, "How to write an
effective cover letter",
<https://capd.mit.edu/resources/how-to-write-an-effective-cover-letter/>.
The guide's structure and its one-page limit win over any word count.

- **Introduction (one paragraph).** State the purpose in the first sentence,
  give a brief professional introduction, say why this position and this
  organization, and preview the main strengths.
- **Body (two to three paragraphs).** Cite a couple of examples from the
  user's experience, discuss the skills they built, and connect them to the
  role. Add detail the resume doesn't have; don't repeat the resume in
  paragraph form. A single story told in full (the problem, what the user
  did, how it turned out) beats a list of tasks.
- **Closing (one paragraph).** Restate the interest succinctly, say why the
  user is a good candidate, and thank the reader for their time and
  consideration.

## MIT CAPD checklist

Report every item, every time, in a table with **pass**, **fail** (with the
fix) or **n/a** (with the reason).

1. One page, no longer.
2. Font is 10 to 12 pt.
3. Contact information is included.
4. Addressed to the hiring manager by name, or "Dear Hiring Manager" if the
   name is unknown.
5. The job's reference number or code is included if one exists.
6. The first sentence states the letter's purpose.
7. The introduction says why this position and this organization, and
   previews the main strengths.
8. The body cites a couple of specific examples and connects the skills
   behind them to the role.
9. The body adds detail beyond the resume instead of repeating it.
10. The letter is tailored to this employer, using the posting and the
    employer's own website or LinkedIn page.
11. Where the user's background has no obvious link to the field, the letter
    says plainly why they are interested and what value they bring.
12. The closing restates interest, says why the user is a good candidate, and
    thanks the reader.
13. The letter has been revised carefully; it is also a writing sample.

## Hiring-manager review

Write it as the hiring manager for this job, reading the letter next to the
resume. Open with the top reasons they would stop reading or pass on the
user, then list what reads weak, vague or unsupported, ranked by impact. No
praise and no softening.

Also check the letter and the resume against each other: dates, durations
and numbers must match, and spellings must be consistent.

## Redlines

- While wording is going back and forth, show it in chat as
  ~~old text~~ **new text** inside the whole surrounding paragraph, one change
  per turn, with a one-line reason.
- When referring to a pending change, restate it in full. Never point back
  with "the one above" or "from before".
- Don't ask for approval after each version. Once the user says the wording
  is right, put it in the document as a suggestion (tracked change) the user
  accepts or rejects, never as a direct edit. Where the document can't hold
  suggestions, edit it only after the user approves the wording.
- When a change would put something in writing that could cause trouble for
  someone else (a referral, a current employer, a customer), say so and offer
  a safer wording.

## Facts

- Every claim must trace to the master resume, another file in the
  workspace, or something the user said. Name the source when proposing a new
  or changed sentence.
- Motivation ("why this employer") comes only from the user. Anything unknown
  is a question for the user, never a guess.
- Plans and things not yet done stay out of the letter; they make good
  interview talking points instead.
- Never copy colleague names, customer names or confidential details from
  `notes/` into a letter.

## Wording

Write formally, in the user's voice, using full names. Keep the user's
phrasing when tightening. Each theme below describes a kind of wording to
cut; the examples illustrate it and are not a complete list.

- **Weasel words and hedging:** vague or softening words that dodge a clear
  claim ("mostly", "helped", "some", "various", "should carry over").
- **Filler:** words or sentences that add length without information ("in
  order to", "I am writing to express my interest").
- **Office jargon:** corporate language that says nothing concrete
  ("stakeholders", "leveraged", "synergy").
- **Stock AI constructions:** formulaic set-ups ("from X to Y", "What I need
  is", "not just X but Y").
- **Clichés:** phrases every job posting uses ("complex systems", "fast-paced
  environment", "passionate about"). Say what the user did instead.
- **Casual or cute wording:** undercuts a professional tone ("tinkering",
  "played with").
- **Parts lists:** naming equipment or tools instead of the decision made or
  the result.
- **Unbacked claims:** asserting skill or impact with no evidence behind it,
  or predicting how the user will do ("would help me get up to speed
  quickly"). State what they have done.
- **Sycophancy, puffery and cheese:** overstating frequency or scale ("every
  week"), puffery about the user, or flattery of the employer ("great
  culture").
