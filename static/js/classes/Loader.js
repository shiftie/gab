"use strict";

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

/* exported Loader */

var Loader = function () {
    function Loader() {
        _classCallCheck(this, Loader);

        /* Singleton */
        if (!Loader.prototype.instance) {
            Loader.prototype.instance = this;
        }
        return Loader.prototype.instance;
    }

    _createClass(Loader, [{
        key: "handle",
        value: function handle(fn) {
            fn();
        }
    }], [{
        key: "getInstance",
        value: function getInstance() {
            if (!Loader.prototype.instance) {
                return new this();
            } else {
                return Loader.prototype.instance;
            }
        }
    }]);

    return Loader;
}();
//# sourceMappingURL=Loader.js.map
