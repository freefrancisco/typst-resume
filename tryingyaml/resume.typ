#import "template/resumetemplate.typ" : *

#let data = yaml("resume.yaml")
// #let data = yaml("testresume.yaml")


#let format-bullet(bullet) = {
  if type(bullet) == dictionary {
    // Convert dictionary to "key: value" format
    let pairs = bullet.pairs()
    let formatted = pairs.map(((key, value)) => {
      str(key) + ": " + str(value)
    }).join(", ")
    [#formatted]
  } else if type(bullet) == str {
    [#bullet]
  } else {
    [#str(bullet)]
  }
}

#let format_skills_dict_of_lists(skills_dict) = {
  let skills_spacing = 2mm
  let cap = (s) => upper(s.at(0)) + s.slice(1)
  let titleize = (k) => k.split("_").map(w => cap(w)).join(" ")
  skills_dict.pairs().map(((key, value)) => [*#titleize(key):* #h(skills_spacing) #value.join(", ")]).join([\ ])
}


#let contact_icons = (
    [#icon("icons/email.svg") #link("mailto:freefrancisco@gmail.com")],
    [#icon("icons/github.svg") #link("https://github.com/freefrancisco")[freefrancisco]],
    [#icon("icons/linkedin.svg") #link("https://www.linkedin.com/in/francisco/")[francisco]],
   [#icon("icons/home.svg") Miami Beach, FL],
  )

#show: cv.with(
  author: "Francisco Gutierrez",
  contacts: contact_icons,
)

= Professional Summary
#set text(hyphenate: false)
#data.summary
#set text(hyphenate: true)
#set par(justify: true)

= Key Skills
#format_skills_dict_of_lists(data.skills)


// #let skills-spacing = 2mm
// = Key Skills
// - *Languages:* #h(skills-spacing) Haskell, Python, SQL, Julia, R,  JavaScript, TypeScript, Ruby, Unix Shell.
// - *Databases:* #h(skills-spacing) Postgres, Neo4j, MongoDB, Redis, MySQL, Sqlite.
// - *Haskell Tools:* #h(skills-spacing) Nix, Ghcid, IHP, Servant, Aeson, Lens, MTL, HSpec, QuickCheck, Scotty.
// - *Python Tools:* #h(skills-spacing) Numpy, Pandas, Scikit-learn, TensorFlow, Torch, Keras, Flask, Jupyter Notebooks.

// - *Technologies:* #h(skills-spacing) Machine Learning, NLP, LLMs, Functional Programming, Web Development.
// // - *Areas of Interest:* #h(skills-spacing) AI, Quantitative Finance, Bioinformatics, Data Science, Computational Biology.


= Experience

  #for job in data.experience [
    #let bullets_list = list(..job.bullets.map(bullet => format-bullet(bullet)))
    // #let bullets_list = list(..job.bullets.map(bullet => [#bullet]))
    #exp(
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
    // #let bullets_list = list(..edu.bullets.map(bullet => [#bullet]))
    #exp(
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
    // #let bullets_list = list(..edu.bullets.map(bullet => [#bullet]))
    #exp(
      edu.title,
      edu.provider,
      edu.location,
      str(edu.period) ,
      bullets_list
    )
  ]

= Hobbies And Interests

#list(..data.interests.map(bullet => format-bullet(bullet)))