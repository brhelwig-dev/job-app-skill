# Job application skills for Claude

A Claude Code plugin with two skills for job hunting:

- **resume-tuning**: tailors your resume to a job posting. It maps the posting's qualifications to your experience, cuts a one-page variant from your master resume, checks it against the [MIT CAPD resume checklist](https://capd.mit.edu/resources/resume-checklist/), and reviews it the way the hiring manager would.
- **cover-letter**: writes a cover letter with you from your own reasons and stories, following the [MIT CAPD cover letter guide](https://capd.mit.edu/resources/how-to-write-an-effective-cover-letter/), then reviews it next to your resume.

Both skills ask you questions instead of inventing facts, show every change as a redline, and only make an edit once you've agreed to the wording.

## Install

In Claude Code:

```
/plugin marketplace add brhelwig-dev/job-app-skill
/plugin install job-application@job-app-skill
```

## Getting started

1. Make a folder (a private git repository works well) for your job search and open Claude Code in it.
2. Ask Claude to tailor your resume for a job and hand it the posting. The first time, it sets up the folder from `starter/` and asks for your current resume to turn into `master-resume.typ`.
3. Ask for a cover letter for the same job when you're ready.

Resumes and cover letters are written in [Typst](https://typst.app) and built to PDF with `scripts/build-pdfs.sh`, so you need the `typst` CLI installed. Set `PDF_PREFIX=Your-Name-` to put your name on the PDF file names. If you'd rather keep your resume in another format, tell Claude and it will skip the Typst steps.

## What's in here

- `skills/resume-tuning/SKILL.md` and `skills/cover-letter/SKILL.md`: the skills.
- `starter/`: the files copied into a new job-search folder: the shared layout (`templates/layout.typ`), the build script, an example master resume and a `.gitignore`.
- `.claude-plugin/`: the plugin and marketplace manifests.

## License

MIT. See [LICENSE](LICENSE). The resume and cover letter checklists are paraphrased from MIT Career Advising & Professional Development and link to the originals.
