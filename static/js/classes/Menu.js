'use strict';

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

/* global App */
/* global PubSub */

var Menu = function () {
    function Menu() {
        var $element = arguments.length <= 0 || arguments[0] === undefined ? null : arguments[0];

        _classCallCheck(this, Menu);

        /* Singleton */
        if (!Menu.prototype.instance) {
            Menu.prototype.instance = this;
        }

        if ($element) {
            if (typeof $element === 'string') {
                $element = $($element);
            }
            if ($element.length) {
                this.$menu = $element.eq(0);
            }
            this.$toggleBtn = $('.topbar .toggle-menu').eq(0);
        }

        return Menu.prototype.instance;
    }

    _createClass(Menu, [{
        key: 'init',
        value: function init() {
            function attachEvents(self) {
                /* Handle menu links */
                /*self.$menu.on('click', 'a', (e) => {
                    e.preventDefault();
                    var url = $(e.currentTarget).attr('href');
                    PubSub.publish(App.getInstance().events.page.change, { href: url });
                });*/
                self.$menu.on('click', '.contact-panel', function () {
                    if (App.getInstance().$contact) {
                        if (App.getInstance().$contact.hasClass('active')) {
                            PubSub.publish(App.getInstance().events.page.contact.close);
                        } else {
                            PubSub.publish(App.getInstance().events.page.contact.open);
                        }
                    }
                });
                PubSub.subscribe(App.getInstance().events.page.contact.close, function () {
                    self.$menu.removeClass('light');
                });
                PubSub.subscribe(App.getInstance().events.page.contact.open, function () {
                    self.$menu.addClass('light');
                });
            }

            var self = this;

            attachEvents(self);
        }
    }], [{
        key: 'getInstance',
        value: function getInstance() {
            var $element = arguments.length <= 0 || arguments[0] === undefined ? null : arguments[0];

            if (!Menu.prototype.instance) {
                return new this($element);
            } else {
                return Menu.prototype.instance;
            }
        }
    }]);

    return Menu;
}();
//# sourceMappingURL=Menu.js.map
