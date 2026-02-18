#let data = yaml("./data.yaml")

#set page(
  paper: "a4",
  margin: 2cm
)

#set text(
  font: "Merriweather 24pt",
  size: 9pt
)

#show title: set text(size: 27pt)
#show heading: set block(below: 1em, above: 1em)
#show heading: set text(
  font: "Open Sans", 
  size: 9pt,
  weight: "bold",
  fill: rgb("2079c7")
)

#box(
  height: 3.5cm,

  align(
    bottom,

    stack(
      dir: ltr,
      spacing: 1fr,

      grid(
        columns: 1,
        row-gutter: 1em,
        title[#data.info.name],
        data.info.resume,
      ),
      
      grid(
        columns: 2,
        column-gutter: 1em,
        row-gutter: 1fr,
        [телеграм], data.info.tg,
        [почта], data.info.email,
        [формат работы], data.info.format
      )
    )
  )
)

#grid(
  columns: (5fr, 1.5fr),
  column-gutter: 1fr,

  stack(
    dir: ttb,
    spacing: 1.5em,

    grid(
      columns: 1fr,
      row-gutter: 2em,

      [= ОБРАЗОВАНИЕ],

      grid(
        columns: (2fr, 5fr),
        row-gutter: 1em,
        ..data
          .education
          .map(
            entry => (
              entry.period,
              [*#entry.title*, #entry.uni],
            ),
          )
          .flatten()
      ),
    ),

    grid(
      columns: 1fr,
      row-gutter: 2em,

      [= ОПЫТ РАБОТЫ],

      grid(
        columns: (2fr, 5fr),
        row-gutter: 1em,
        ..data
          .experience
          .map(
            entry => (
              entry.period,
              [
                *#entry.title*, #entry.employer,

                #entry.description
              ],
            ),
          )
          .flatten()
      )
    )
  ),

  stack(
    dir: ttb,
    spacing: 1.5em,

    [= НАВЫКИ],

    grid(
      columns: 1fr,
      row-gutter: 1em,
      ..data
        .skills
    ),

    [= ЯЗЫКИ],

    grid(
      columns: 1fr,
      row-gutter: 1em,
      ..data
        .languages
    )
  )
)
