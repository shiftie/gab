/* global App */
/* global PubSub */

class Menu {
    constructor($element = null) {
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

    init() {
        function attachEvents(self) {
            /* Handle menu links */
            /*self.$menu.on('click', 'a', (e) => {
                e.preventDefault();
                var url = $(e.currentTarget).attr('href');
                PubSub.publish(App.getInstance().events.page.change, { href: url });
            });*/
            self.$menu.on('click', '.contact-panel', () => {
                if (App.getInstance().$contact) {
                    if (App.getInstance().$contact.hasClass('active')) {
                        PubSub.publish(App.getInstance().events.page.contact.close);
                    } else {
                        PubSub.publish(App.getInstance().events.page.contact.open);
                    }
                }
            });
            PubSub.subscribe(App.getInstance().events.page.contact.close, () => {
                self.$menu.removeClass('light');
            });
            PubSub.subscribe(App.getInstance().events.page.contact.open, () => {
                self.$menu.addClass('light');
            });
        }

        let self = this;

        attachEvents(self);
    }

    static getInstance($element = null) {
        if (!Menu.prototype.instance) {
            return new this($element);
        } else {
            return Menu.prototype.instance;
        }
    }
}
