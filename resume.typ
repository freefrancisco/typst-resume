#import "template/resumetemplate.typ" : *

#let data = yaml("data/resume.yaml")

#show: resume.with(
  author: "Francisco Gutierrez",
  contacts: contact_icons(data.contacts),
)

= Professional Summary
#set text(hyphenate: false)
#data.summary
#set text(hyphenate: true)
#set par(justify: true)

= Key Skills
#format_skills_dict_of_lists(data.skills)


= Experience
  #for job in data.experience [
    #let bullets_list = list(..job.bullets.map(bullet => format-bullet(bullet)))
    #experience(
      job.company,
      job.role,
      job.location,
      str(job.start_date) + " – " + str(job.end_date),
      bullets_list
    )
  ]

// #pagebreak()

= Education
  #for edu in data.education [
    #let bullets_list = list(..edu.bullets.map(bullet => format-bullet(bullet)))
    #experience(
      edu.school,
      edu.degree,
      edu.location,
      str(edu.start_date) + " – " + str(edu.end_date),
      bullets_list
    )
  ]

= Certifications
  #for edu in data.certifications [
    #let bullets_list = list(..edu.bullets.map(bullet => format-bullet(bullet)))
    #experience(
      edu.title,
      edu.provider,
      edu.location,
      str(edu.period) ,
      bullets_list
    )
  ]

= Hobbies And Interests
#list(..data.interests.map(bullet => format-bullet(bullet)))