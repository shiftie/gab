/* exported App */
/* global Utils */
/* global Pages */
/* global Menu */
/* global PubSub */

class App {
    constructor() {
        /* Singleton */
        if (!App.prototype.instance) {
            App.prototype.instance = this;
        }
        return App.prototype.instance;
    }

    init() {
        let self = this;
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

        PubSub.subscribe(App.getInstance().events.page.intro.completed, () => {
            self.currentView = Utils.getView();
        });
    }

    handleHistory(){
        if(typeof history !== 'undefined'){
            $('body').on('click', 'a', function(e){
                console.log('interrupt');
                if($(e.target).attr('target') !== '_blank' && $(e.target).attr('href').indexOf('mailto:') === -1){
                    console.log( $(e.target).attr('href').indexOf('mailto:'));
                    let url =  $(e.target).attr('href');
                    console.log('pushing', url);
                    e.preventDefault();
                    history.pushState({page: url}, url, url);
                    PubSub.publish(App.getInstance().events.page.change, { href: url });
                }
            });
        }
    }

    static getInstance() {
        if (!App.prototype.instance) {
            return new this();
        } else {
            return App.prototype.instance;
        }
    }
}
