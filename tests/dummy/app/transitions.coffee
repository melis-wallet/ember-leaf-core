
Transitions = ->

  @transition(
    @hasClass('ll-down-up')
    @toValue(true)
    @use('toDown')
    @reverse('toUp')
  )


`export default Transitions`