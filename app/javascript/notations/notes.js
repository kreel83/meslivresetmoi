import "rangeslider.js";

const range_init = () => {
     // Initialize a new plugin instance for all
    // e.g. $('input[type="range"]') elements.

    $('input[type="range"]').rangeslider();

    // Destroy all plugin instances created from the
    // e.g. $('input[type="range"]') elements.
    $('input[type="range"]').rangeslider('destroy');

    // Update all rangeslider instances for all
    // e.g. $('input[type="range"]') elements.
    // Usefull if you changed some attributes e.g. `min` or `max` etc.

    console.log('coucou')
}

export { range_init }


