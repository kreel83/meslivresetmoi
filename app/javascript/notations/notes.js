import "rangeslider.js";

const range_init = () => {
     // Initialize a new plugin instance for all
    // e.g. $('input[type="range"]') elements.

    $('input[type="range"]').rangeslider({

    // Feature detection the default is `true`.
    // Set this to `false` if you want to use
    // the polyfill also in Browsers which support
    // the native <input type="range"> element.
    polyfill: true,

    // Default CSS classes
    rangeClass: 'rangeslider',
    // disabledClass: 'rangeslider--disabled',
    // horizontalClass: 'rangeslider--horizontal',
    verticalClass: 'rangeslider--vertical',
    // fillClass: 'rangeslider__fill',
    // handleClass: 'rangeslider__handle',

    // Callback function
    onInit: function() {},

    // Callback function
    onSlide: function(position, value) {},

    // Callback function
    onSlideEnd: function(position, value) {}
  });

    // Destroy all plugin instances created from the
    // e.g. $('input[type="range"]') elements.


    // Update all rangeslider instances for all
    // e.g. $('input[type="range"]') elements.
    // Usefull if you changed some attributes e.g. `min` or `max` etc.

    console.log('coucou')
  }

  export { range_init }


