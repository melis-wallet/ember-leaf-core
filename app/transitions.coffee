
Transitions = ->

  @transition(
    @hasClass('ll-down-up')
    @toValue(true)
    @use('toDown')
    @reverse('toUp')
  )

  @transition(
    @hasClass('ll-right-left')
    @toValue(true)
    @use('toRight')
    @reverse('toLeft')
  )

  @transition(
    @hasClass('ll-left-right')
    @toValue(true)
    @use('toLeft')
    @reverse('toRight')
  )


`export default Transitions`