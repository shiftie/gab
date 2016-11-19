'use strict';

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

/* exported App */
/* global Utils */
/* global Pages */
/* global Menu */
/* global PubSub */

var App = function () {
    function App() {
        _classCallCheck(this, App);

        /* Singleton */
        if (!App.prototype.instance) {
            App.prototype.instance = this;
        }
        return App.prototype.instance;
    }

    _createClass(App, [{
        key: 'init',
        value: function init() {
            var self = this;
            this.events = {
                'page': {
                    'contact': {
                        'open': 'page.contact.open',
                        'close': 'page.contact.close'
                    },
                    'home': {
                        'ready': 'page.home.ready',
                        'slideReady': 'page.home.slide.ready'
                    },
                    'project': {
                        'ready': 'page.project.ready'
                    },
                    'change': 'page.change',
                    'intro': {
                        'completed': 'page.intro.completed'
                    },
                    'outro': {
                        'completed': 'page.outro.completed'
                    }
                }
            };

            self.$window = $(window);
            self.currentView = Utils.getView();
            Pages.init();
            Pages[self.currentView]();
            Menu.getInstance('.menu').init();
            self.handleHistory();

            PubSub.subscribe(App.getInstance().events.page.intro.completed, function () {
                self.currentView = Utils.getView();
            });
        }
    }, {
        key: 'handleHistory',
        value: function handleHistory() {
            if (typeof history !== 'undefined') {
                $('body').on('click', 'a', function (e) {
                    console.log('interrupt');
                    if ($(e.target).attr('target') !== '_blank' && $(e.target).attr('href').indexOf('mailto:') === -1) {
                        console.log($(e.target).attr('href').indexOf('mailto:'));
                        var url = $(e.target).attr('href');
                        console.log('pushing', url);
                        e.preventDefault();
                        history.pushState({ page: url }, url, url);
                        PubSub.publish(App.getInstance().events.page.change, { href: url });
                    }
                });
            }
        }
    }], [{
        key: 'getInstance',
        value: function getInstance() {
            if (!App.prototype.instance) {
                return new this();
            } else {
                return App.prototype.instance;
            }
        }
    }]);

    return App;
}();
//# sourceMappingURL=App.js.map
