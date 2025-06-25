
#let icon(name, baseline: 1.5pt) = {
  box(
    baseline: baseline,
    height: 10pt,
    image(name)
  )
}

#let contact_icons(contacts) = (
    [#icon("icons/email.svg") #link("mailto:" + str(contacts.email))],
    [#icon("icons/github.svg") #link("https://github.com/" + str(contacts.github))[#contacts.github]],
    [#icon("icons/linkedin.svg") #link("https://www.linkedin.com/in/" + str(contacts.linkedin))[#contacts.linkedin]],
   [#icon("icons/home.svg") #str(contacts.location)],
  )

#let experience(company, title, location, time, details) = {
  pad(
    bottom: -1pt,
    grid(
      columns: (auto, 1fr),
      align(left)[
        *#company* \
        #emph[#title]
      ],
      align(right)[
        #location \
        #time
      ]
    )
  )
  pad(top: -5pt, bottom: -1pt, details)
}


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



#let resume(author: "", contacts: (), body) = {
  set document(author: author, title: author)
  set text(font: "Linux Libertine", lang: "en")

  show heading: it => [
    #pad(bottom: -10pt, [#smallcaps(it.body)])
    #line(length: 100%, stroke: 1pt)
  ]

  // Author
  align(center)[
    #block(text(weight: 700, 1.75em, author))
  ]

  // Contact information.
  pad(
    top: 0.5em,
    bottom: 0.5em,
    x: 2em,
    align(center)[
      #grid(
        columns: 4,
        gutter: 1em,
        ..contacts
      )
    ],
  )

  // Main body.
  set par(justify: true)
  pad(left: -1pt, right: -10pt, body)
  // body
}
