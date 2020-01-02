import Mixin from '@ember/object/mixin'

SizeSupport = Mixin.create(
    classTypePrefix: null
    classNameBindings: ['sizeClass', 'largeSizeClass', 'smallSizeClass', 'extraSmallSizeClass']

    #Size value according to Bootstrap sizes: sm/lg/xs
    size: null

    #possible properties to define component size
    xs: null
    small: null
    large: null


    extraSmallSizeClass: ( ->
        pref = @get 'classTypePrefix'
        if @xs then "#{pref}-xs" else null
    ).property('xs')

    smallSizeClass: ( ->
        pref = @get 'classTypePrefix'
        if @small then "#{pref}-sm" else null
    ).property('small')

    largeSizeClass: ( ->
        pref = @get 'classTypePrefix'
        if @large then "#{pref}-lg" else null
    ).property('large')

    sizeClass: ( ->
        size = @get 'size'
        pref = @get 'classTypePrefix'

        if size then "#{pref}-#{size}" else null
    ).property('size')
)

export default SizeSupport
