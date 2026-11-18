// Master resume: every bullet you might use. Tailored variants are cut from it.
// Replace the example content below with your own.
#import "/templates/layout.typ": *
#show: resume.with(
  name: "Your Name",
  contact: "City, State · you@example.com · 555-555-5555",
)

#section[Summary]

Two or three sentences on what you do and what you're looking for.

#section[Experience]

#role[Job Title][Organization, City, ST][Jan 2020 – Present]
- Start each bullet with an action verb and show the project, what you did, and the result.
- Quantify size, scale, budget or staff where you have real numbers.

#role[Earlier Job Title][Organization, City, ST][Jun 2016 – Dec 2019]
- One to three bullets per role in a variant; the master can hold more.

#section[Projects and Volunteer Work]

#role[Project Name][personal project][2021 – Present]
- What you built or did, and how it turned out.

#section[Education]

#role[Degree or Coursework][Institution, City, ST][2016]
- Relevant courses, honors or GPA if strong.

#section[Certifications and Skills]

- *Certifications:* Name (Issuer, Year)
- *Skills:* tools, techniques and languages that matter for the jobs you want
