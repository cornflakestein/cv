#let data = yaml("./data.yaml")

#show heading: set block(below: 1em, above: 2em)

#box(
  height: 1.5cm,

  align(
    bottom,

    stack(
      dir: ltr,
      spacing: 1fr,

      grid(
        columns: 1,
        row-gutter: 1em,
        data.info.name,
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

#stack(
  dir: ttb,

  [= Образование],

  grid(
  ..data
    .education
    .map(
      entry => (
        entry.period,
        [#entry.title, #entry.uni],
      ),
    )
    .flatten()
  ),

  [= Опыт работы],

  grid(
    columns: (10em, 20em),
    row-gutter: 1em,
    ..data
      .experience
      .map(
        entry => (
          entry.period,
          [
            #entry.title, #entry.employer,

            #entry.description
          ],
        ),
      )
      .flatten()
  )
)

= Навыки

#grid(
  row-gutter: 1em,
  ..data
    .skills
)

= Языки

#grid(
  row-gutter: 1em,
  ..data
    .languages
)

#set grid(
  columns: (1fr, 5fr),
  row-gutter: 1em,
)
