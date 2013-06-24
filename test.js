// TODO: Do some stuff
function() {
    'use strict';

    function foo (value) {
        console.log(value);
    }

    foo(bar);
};

(function() {
    'use strict';

    function lol () {
        var text = 'lol',
        i = 0,
        n = 100;

        for (; i < n; i++) {
            // FIXME Wrong output!?!
            console.log(textje);
        }
    }
}());
