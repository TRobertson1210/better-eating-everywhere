
## riot-viewport-mixin

Relies on matchMedia, which is supported in all browsers

Updates the riot tag when the results of a media query change


## Installation

``` bash
npm i -S riot-viewport-mixin
```


## API

`riot-viewport-mixin` exports two values


`viewport` will let you configure media queries

Alternatively you can execute and listen to the media queries you configure


`viewportMixin` will actually create the mixins to be used in riot


## Configure and use in javascript

``` javascript
import { viewport } from 'riot-viewport-mixin'

// Define a config, naming your media queries with the object keys
const mediaQueryConfig = {
  // mobile
  sm: matchMedia('screen and (max-width: 767px)'),

  // tablet
  md: matchMedia('screen and (min-width: 768px) and (max-width: 1024px)'),

  // desktop
  lg: matchMedia('screen and (min-width: 1025px) and (max-width: 1200px)')
}

viewport.config(mediaQueryConfig)

// on mobile viewport

// attach listener
viewport.on('sm', mql => {
  console.log(mql.matches) // => true
})

// remove listener
viewport.off('sm', listener)

// check specific media query
viewport.is('md') // => false
viewport.isNot('lg') // => true

// get current matching viewport
// note: this will only work correctly if you don't have overlapping media queries
viewport.current() // => 'sm'
```


## Use as a shared mixin

``` js
import { viewportMixin } from 'riot-viewport-mixin'

const config = {
  sm: matchMedia('screen and (max-width: 767px)'),
  md: matchMedia('screen and (min-width: 768px) and (max-width: 1024px)'),
  lg: matchMedia('screen and (min-width: 1025px) and (max-width: 1200px)')
}

// Assign the media query `config.sm` to the mixin `mobile`
this.mixin('mobile', viewportMixin('mobile', config.sm))

// Similarly for `tablet` and `config.md`
this.mixin('tablet', viewportMixin('tablet', config.md))
```

``` html
<my-tag>

  <!--
    When component functionality changes drastically between viewports
    for example:
  -->
  <Simple-Inline-List if={ !mobile } />
  <Hidden-Mega-List if={ mobile } />

  <script>
    this.mixin('mobile')
    // `this.mobile` is set according to the media query
    // When the viewport changes to/from mobile, this.update() is called and the variable is updated
  </script>

</my-tag>
```


## Use as a standalone mixin

``` js
import { viewport } from 'riot-viewport-mixin'

const config = {
  mobile: matchMedia('screen and (max-width: 767px)')
}

// Set up mixins for `config` values using the `config` keys as mixin names
viewport.config(config)
```

``` html
<my-tag>

  <div if={ mobile }> Mobile view </div>

  <script>
    import { viewportMixin } from 'riot-viewport-mixin'

    this.mixin(viewportMixin('mobile'))
    // `this.mobile` is set as above

    // Alternatively, provide your own callback
    this.mixin(
      viewportMixin('mobile', () => {
        // `this.mobile` is already set with the new result
        console.log(this.mobile)
        this.update()
      })
    )
  </script>

</my-tag>
```


