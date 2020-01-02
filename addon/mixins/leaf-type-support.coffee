import Mixin from "@ember/object/mixin"

TypeSupport = Mixin.create(

    classTypePrefix: null
    classNameBindings: ['typeClass']

    typeClass: ( ->
        type = @get 'type'
        if type?
          pref = @get 'classTypePrefix'
          "#{pref}-#{type}"
    ).property('type')
)

export default TypeSupport
