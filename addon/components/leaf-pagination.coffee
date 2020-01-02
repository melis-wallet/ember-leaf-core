import Component from '@ember/component'

import SizeSupport from 'ember-leaf-core/mixins/leaf-size-support'
import layout from 'ember-leaf-core/templates/components/leaf-pagination'

PaginationComponent = Component.extend(SizeSupport,
  layout: layout


  tagName: 'ul'
  classNameBindings: ['pager:pager:pagination', 'paginationSizeClass']
  classTypePrefix: 'pagination'

  pager: false

  pagerNext: '>'
  pagerPrevious: '<'
  paginationPrevious: '«'
  paginationNext: '»'
  paginationEllipsis: '&hellip;'

  currentPage: 1
  totalPages: 1

  maxPagesToDisplay: 7

  zeroCurrentPage: ((key, value, previousValue)->
    if (arguments.length > 1)
      @set('currentPage', value + 1)
    @get('currentPage') - 1
  ).property('currentPage')

  pageItems: (->

    currentPage = @get('currentPage')
    totalPages = @get('totalPages')

    maxPages = @get('maxPagesToDisplay')
    maxPages += 1 - maxPages % 2


    pages = for pageNumber in [1..totalPages]
      ellipses: false
      page: pageNumber
      current: currentPage == pageNumber

    if pages.length > maxPages

      # determine position in truncated array (1 to max)
      positionOfCurrent = ((maxPages - 1) / 2) + 1
      # does the position need to be shifted left?
      if positionOfCurrent > currentPage
        positionOfCurrent = currentPage
      # does the position need to be shifted right?
      if (totalPages - currentPage) < (maxPages - positionOfCurrent)
        positionOfCurrent = maxPages - (totalPages - currentPage)

      # if distance from max is greater than delta of values, truncate
      if (totalPages - currentPage) > (maxPages - positionOfCurrent)
        maxDistance = maxPages - positionOfCurrent
        overspill = totalPages - currentPage - maxDistance
        toRemove = overspill + 1
        idx = totalPages - 1 - toRemove
        pages.replace idx, toRemove, [
          ellipses: true
        ]


      # if distance from 1 is greater than delta of values, truncate
      if currentPage > positionOfCurrent
        maxDistance = positionOfCurrent
        overspill = currentPage - positionOfCurrent
        toRemove = overspill + 1
        idx = 1
        pages.replace idx, toRemove, [
          ellipses: true
        ]

    return pages
  ).property('currentPage', 'totalPages', 'maxPagesToDisplay')

  isLast: (->
    page = @get('currentPage')
    totalPages = @get('totalPages')
    page >= totalPages
  ).property('currentPage', 'totalPages')

  isFirst: (->
    page = @get('currentPage')
    totalPages = @get('totalPages')
    page == 1
  ).property('currentPage')

  actions:
    setCurrent: (number) ->
      @set('currentPage', number)

    next: ->
      unless @get('isLast')
        @incrementProperty('currentPage')

    previous: ->
      unless @get('isFirst')
        @decrementProperty('currentPage')
)

export default PaginationComponent

