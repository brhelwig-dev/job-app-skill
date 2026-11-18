---
name: resume-tuning
description: Tailor and review a resume for a specific job posting, using the MIT CAPD resume checklist and a blunt hiring-manager read. Use when the user hands over a job posting and asks to tailor, tune, or review a resume for it.
---

# Resume tuning

Build a resume variant for one job posting from the user's master resume,
check it against the MIT CAPD resume checklist, and review it the way that
posting's hiring manager would. Every change is agreed with the user before it
goes in.

## Workspace

The skill works in a folder (ideally a git repository) laid out like this:

```
master-resume.typ                # master resume: every bullet; source of truth
templates/layout.typ             # shared layout (resume, letter, section, role)
scripts/build-pdfs.sh            # builds every .typ to PDF in dist/
notes/                           # optional private reference, never quoted
variants/
  <employer-role>/               # one folder per application, kebab-case
    postings/                    # the job posting(s), saved as PDF, HTML or text
    resume-<employer-role>.typ   # the tailored resume
    README.md                    # who it's for and how it's being delivered
```

If the folder doesn't exist yet, set it up:

1. Copy `starter/templates/layout.typ` and `starter/scripts/build-pdfs.sh`
   from this plugin's root folder (two levels above this skill's folder) into
   the workspace, and
   `starter/master-resume.typ` as the starting master.
2. Ask the user for their current resume (any format) and convert it into
   `master-resume.typ`, keeping their wording. Ask about anything unclear
   rather than guessing.
3. Add `dist/` to `.gitignore`: built PDFs duplicate the `.typ` sources.

Build PDFs with `scripts/build-pdfs.sh` (needs the
[Typst](https://typst.app) CLI). Set `PDF_PREFIX` (for example
`PDF_PREFIX=Jane-Doe-`) to put the user's name at the front of each PDF's file
name.

If the user keeps their resume in another format and doesn't want Typst, use
their format and skip the build and text extraction steps that don't apply.

## Workflow

Work through these steps in order. Keep chat replies short and cover one item
per turn.

1. **Save the posting.** Put it in `variants/<employer-role>/postings/`. List
   its required qualifications, preferred qualifications and keywords.
2. **Map the posting to evidence.** For each qualification and keyword, find
   the bullet in the master resume that backs it and mark it **covered**,
   **weak** or **missing**. Each missing item becomes a question for the user.
   Never write a bullet to fill a gap.
3. **Cut the variant.** Copy the sections, order and bullets that serve this
   posting from the master into `resume-<employer-role>.typ`, importing
   `/templates/layout.typ`. Target one page; two pages is the hard maximum.
   Use the starting points below.
4. **Check and review.** Run the MIT checklist (below) and the hiring-manager
   review (below) against the posting.
5. **Redline.** Propose each change as a redline (below) and keep refining it
   until the user says the wording is right. Do not edit the file before that.
6. **Edit and build.** Make the agreed edits, run `scripts/build-pdfs.sh`,
   confirm the page count, and run the text extraction check.

## Starting points for a variant

The posting decides the final order and bullets. These help with the first
cut:

- **Section order:** put the experience that best matches the posting first.
  For a career change, a short Summary followed by the most relevant
  experience (paid, volunteer or project) usually reads better than strict
  reverse-chronological order.
- **Lead bullets:** the ones that prove the posting's required
  qualifications, then its preferred ones.
- **Skills:** show the tools, tasks and certifications the posting names, where
  the user really has them. Trim skills the posting doesn't care about.
- **Trim:** bullets that only matter for a different kind of job, older
  technology, and anything that repeats another bullet.
- **Length:** one page unless the user has an advanced degree or 10+ years of
  directly relevant experience.

## MIT CAPD resume checklist

Source: MIT Career Advising & Professional Development,
<https://capd.mit.edu/resources/resume-checklist/>. Report every item, every
time, in a table with **pass**, **fail** (with the fix) or **n/a** (with the
reason). Where the user has said a standing preference (for example, no
Education section), mark the affected items n/a with that reason and don't
raise them again.

### General format
1. **Text extraction check** (replaces MIT's "written in Word without a
   template" item when the resume is built with Typst). Run
   `pdftotext -layout` on the built PDF and confirm all text comes out in
   reading order, with name, contact details and section headings intact.
2. Margins are consistent and between 0.5 and 1 inch.
3. Font is 10 to 12 pt and easy to read.
4. One page, or two with an advanced degree or 10+ years of experience.
5. Enough white space for easy reading.
6. Bold and italics used consistently for headings and positions; no
   underlining.
7. Dates are clear and use one format and punctuation style throughout.
8. Sections are ordered by importance to this employer.
9. Headings are descriptive (for example "Relevant Experience" rather than
   "Other").

### Contact information
10. Legal name is clear and bold at the top, and on page two if there is one.
11. Phone number is included.
12. Email address is included and professional.
13. Citizenship or work authorization is stated where a reader would
    otherwise wonder.

### Education
14. Institution names are spelled out in full.
15. The official name of each degree or course is listed.
16. The month and year earned (or expected) is listed.
17. A strong GPA, with its scale, was considered.
18. Coursework relevant to this posting is listed.

### Experience
19. Organization name and job title are clear.
20. City and state (or country) are included.
21. Dates are listed for each position.
22. Each experience shows the project, the activity and the result.
23. Each bullet starts with an action verb: past tense for past work, present
    tense for current work.
24. Impact is quantified (size, scale, budget, staff) where the evidence
    supports a number.
25. Keywords from the industry and the posting are used where they are true.
26. No "I" or other first-person pronouns.
27. Every part of the user's experience that relates to the posting is
    included.

### Skills
28. All relevant skill types are included (for example languages, tools,
    techniques, certifications).
29. All relevant skills are listed within each type.

### Activities, honors and leadership
30. Relevant activities, honors and leadership experience are listed.

## Hiring-manager review

Write it as the hiring manager for this posting. Open with the top reasons
they would pass on the user, then list what reads weak or vague, ranked by
impact. No praise and no softening. Turn each gap into a question for the
user; never answer it with an invented fact.

## Redlines

- One change per chat turn, shown as ~~old text~~ **new text** inside the
  whole surrounding section or bullet list, with a one-line reason.
- When referring to a pending change, restate it in full. Never point back
  with "the one above" or "from before".
- For changes across the whole resume, produce a rendered redline PDF (struck
  old text, inserted new text) instead of a long chat message.
- Do not ask for approval after each proposal. Keep refining until the user
  says the wording is right; they will say when to put it in.
- If the workspace is a git repository, commit and push each agreed change
  right away so no work is lost.

## Facts

- Every bullet must trace to the master resume, another file in the
  workspace, or something the user said. Name the source when proposing a new
  or changed bullet.
- Numbers, dates and keywords go in only where they are true. Anything unknown
  is a question for the user.
- Save facts the user gives you (dates, locations, results, what they can't
  claim) in a notes file so later sessions don't ask again.
- Never copy colleague names, customer names or confidential details from
  `notes/` into a resume.

## Wording

Write formally, in the user's voice. Keep the user's phrasing when tightening.
Each theme below describes a kind of wording to cut; the examples illustrate
it and are not a complete list.

- **Weasel words and hedging:** vague or softening words that dodge a clear
  claim ("mostly", "helped", "some", "various", "should carry over"). State
  the specific scope instead.
- **Filler:** words or sentences that add length without information ("in
  order to", "responsible for", "a wide range of").
- **Office jargon:** corporate language that says nothing concrete
  ("stakeholders", "leveraged", "synergy").
- **Stock AI constructions:** formulaic set-ups ("from X to Y", "What I need
  is", "not just X but Y").
- **Casual or cute wording:** undercuts a professional tone ("tinkering",
  "played with").
- **Parts lists:** naming equipment or tools instead of the decision made or
  the result.
- **Unbacked claims:** asserting skill or impact with no evidence behind it.
- **Sycophancy, puffery and cheese:** overstating frequency or scale ("every
  week", "countless"), puffery about the user, or flattery of the employer.
