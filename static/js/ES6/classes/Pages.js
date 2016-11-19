/* exported Pages */
/* global App */
/* global PubSub */
/* global Utils */
/* global Loader */
/* global ParallaxSlideshow */
/* global TweenMax */
/* global Power1 */
/* global Power2 */
/* global Power3 */
/* global Sine */
/* global TimelineMax */
/* global ScrollMagic */

class Pages {
    static init() {
        Pages.handleContact();
        $('body').addClass('page-' + $('.page').data('page'));
        PubSub.subscribe(App.getInstance().events.page.change, (e, data) => {
            console.log(data);
            if (data.href) {
                var url = data.href;
                $.ajax({
                    url: url,
                    dataType: 'html'
                }).done(function (data) {
                    Pages.doTransition(data);
                });
            }
        });

        /*if(typeof history !== 'undefined'){
            console.log('pushing', '/');
            history.pushState({page: '/'}, '/', '/');
        }*/

        if(typeof history !== 'undefined'){
            window.onpopstate = function(event) {
                console.log(event.state);
                if(event.state && event.state.page){
                    PubSub.publish(App.getInstance().events.page.change, { href: event.state.page });
                }else{
                    PubSub.publish(App.getInstance().events.page.change, { href: '/' });
                }
            };
        }
    }

    static doTransition(futurePageData) {
        let futurePage;

        futurePageData = $('<html />').html(futurePageData);
        if (futurePageData.find('.page')) {
            futurePage = futurePageData.find('.page').data('page');
            futurePageData = futurePageData.find('.page');
            if (futurePage) {
                // Unbind current page
                Pages[App.getInstance().currentView](true);
                let token = PubSub.subscribe(App.getInstance().events.page.outro.completed, () => {
                    // Change contents
                    PubSub.unsubscribe(token);
                    $('body').removeClass('page-' + App.getInstance().currentView).addClass('page-' + futurePage);
                    $('.page').removeClass(App.getInstance().currentView).addClass(futurePage).data('page', futurePage).html(futurePageData.html());
                    setTimeout(() => {
                        Pages[futurePage]();
                    }, 0);
                });
            }
        } else {
            console.error('.page node not found in returned data');
        }
    }

    static handleContact() {
        function attachAnimations($element) {
            let animation = new TimelineMax({
                paused: true,
                onComplete: () => {
                    $element.addClass('active');
                },
                onReverseComplete: () => {
                    $element.removeClass('active');
                }
            });

            animation.fromTo($element.find('.white-bg'), 0.5, { 'clip': 'rect(0vh, 100vw, 100vh, 100vw)' }, { 'clip': 'rect(0vh, 100vw, 100vh, 0vw)', ease: Power2.easeOut }, '+=0')
                .fromTo($element.find('.content'), 1, { 'clip': 'rect(0vh, 100vw, 100vh, 100vw)' }, { 'clip': 'rect(0vh, 100vw, 100vh, 0vw)', ease: Power2.easeOut }, '-=0.1')
                .fromTo($element.find('.typo-1'), 1, { x: '20%' }, { x: '0%', ease: Power2.easeOut }, '-=1')
                .fromTo($element.find('.typo-2'), 1, { x: '30%' }, { x: '0%', ease: Power2.easeOut }, '-=1')
                .fromTo($element.find('.typo-3'), 1, { x: '100%' }, { x: '0%', ease: Power2.easeOut }, '-=1')
                .fromTo($element.find('.text'), 1, { x: '50%', opacity: 0 }, { x: '0%', opacity: 1, ease: Power2.easeOut }, '-=1');
            $element.data('animation', animation);
        }

        function attachEvents($element) {
            PubSub.subscribe(App.getInstance().events.page.contact.open, () => {
                $element.data('animation').play();
            });
            PubSub.subscribe(App.getInstance().events.page.contact.close, () => {
                $element.data('animation').reverse();
            });
            PubSub.subscribe(App.getInstance().events.page.change, () => {
                PubSub.publish(App.getInstance().events.page.contact.close);
            });
        }

        console.log('handlecontact');
        App.getInstance().$contact = $('.contact');
        attachAnimations(App.getInstance().$contact);
        attachEvents(App.getInstance().$contact);
    }

    static home(unbind = false) {
        let loaderToken;
        let slider;

        let playIntro = function () {
            console.log('intro');
            window.scrollTo(0, 0);

            slider.isAnimating = true;

            let $window = App.getInstance().$window;
            let contentWidthStart;
            let contentWidthEnd;
            let coverLeftOffset;

            if ($window.outerWidth() <= 1024) {
                contentWidthStart = '0vw';
                contentWidthEnd = '100vw';
                coverLeftOffset = '0vw';
            } else {
                if (($window.outerWidth() * 0.33) > 550) {
                    contentWidthStart = '0vw';
                    contentWidthEnd = '33vw';
                    coverLeftOffset = '16.5vw';
                } else {
                    contentWidthStart = '0px';
                    contentWidthEnd = '550px';
                    coverLeftOffset = (275 * 100 / $window.outerWidth()) + 'vw';
                }
            }

            TweenMax.set('.wrapper:nth-child(n+2)', { 'opacity': 0});
            TweenMax.set('.wrapper.current', { 'clip': 'rect(0vh 0vw 120vh 0vw)' });
            TweenMax.set('.wrapper.current .cover-container', { 'x': '-14%', 'y': (-0.10 * $window.outerHeight() + 'px') });
            TweenMax.set('.content-wrapper', { 'clip': 'rect(0vh ' + contentWidthStart + ' 120vh 0vw)' });
            TweenMax.set('.content-wrapper .content-container:nth-child(1) .title-container, .content-wrapper .content-container:nth-child(1) .description-container', { 'opacity': 0, 'y': -30 });
            TweenMax.set('.goto-project', { 'opacity': 0, 'y': -15 });
            let intro = new TimelineMax({
                paused: true,
                onComplete: () => {
                    $('.wrapper:nth-child(n+2)').attr('style', '');
                    $('.wrapper, .cover-container, .content-wrapper, .content-container:nth-child(1), .menu').attr('style', '');
                    TweenMax.set('.wrapper.current .cover-container', { 'y': (-0.10 * $window.outerHeight() + 'px') });
                    slider.isAnimating = false;
                    PubSub.publish(App.getInstance().events.page.intro.completed);
                }
            });

            intro.to('.wrapper', 1.5, { 'clip': 'rect(0vh 100vw 120vh 0vw)', ease: Power3.easeOut }, '+=0')
                .to('.wrapper.current .cover-container', 1.5, { 'x': '0%', ease: Power2.easeOut }, '-=1.5')
                .to('.wrapper.current ', 0.5, { 'clip': 'rect(0vh 100vw 120vh ' + coverLeftOffset + ')', ease: Power3.easeOut }, '-=1')
                .to('.content-wrapper', 1, { 'clip': 'rect(0vh ' + contentWidthEnd + ' 120vh 0vw)', ease: Power3.easeOut }, '-=1')
                .to('.content-wrapper .content-container:nth-child(1) .title-container', 0.8, { 'opacity': '1', 'y': 0, ease: Power1.easeOut }, '-=0.25')
                .to('.content-wrapper .content-container:nth-child(1) .description-container', 0.8, { 'opacity': '1', 'y': 0, ease: Power1.easeOut }, '-=0.65')
                .to('.goto-project', 0.8, { 'opacity': '1', 'y': 0, ease: Power1.easeOut }, '-=0.55');

            if (!$('.menu').hasClass('inited')) {
                TweenMax.set('.menu', { 'y': '-100%', 'opacity': 0 });
                intro.to('.menu', 1, {
                    'y': '0%',
                    'opacity': '1',
                    ease: Power1.easeOut,
                    onComplete: () => {
                        $('.menu').addClass('inited');
                    }
                }, '-=1');
            }

            setTimeout(function () {
                intro.play();
            }, 500);
        };

        let updateBgs = function ($item = false) {
            let $bgs;
            if ($item !== false) {
                $bgs = $item;
            } else {
                $bgs = $('.responsive-bg');
            }
            $bgs.each(function () {
                var $this = $(this);
                var src = Utils.getCurrentSrc($this.find('picture img')[0]);
                if (typeof src === 'string') {
                    $this.css('background-image', 'url(' + src + ')');
                }
            });
        };

        if (unbind) {
            console.log('unbind home');
            App.getInstance().$window.off('resize.home');
            slider = $('.parallax-slideshow').data('slider');
            slider.destroy();


            /* outro home */

            let outro = new TimelineMax({
                paused: false,
                onComplete: () => {
                    $('.parallax-slideshow').css('display', 'none');
                    PubSub.publish(App.getInstance().events.page.outro.completed);
                }
            });

            TweenMax.set('.wrapper:not(.current)', { 'opacity': 0 });
            let $window =  App.getInstance().$window;
            if($window.outerWidth() <= (64 * 16)){
                TweenMax.set('.wrapper.current', {  'clip': 'rect(0vh 100vw 120vh 0vw)', 'height': '66vh' });
            }else if($window.outerWidth() >= 1024 && $window.outerWidth() <= 1650){
                TweenMax.set('.wrapper.current', {  'clip': 'rect(0vh 100vw 120vh ' + (275 * 100 / $window.outerWidth()) + 'vw)'});
            }else{
                TweenMax.set('.wrapper.current', {  'clip': 'rect(0vh 100vw 120vh 16.5vw)'});
                TweenMax.set('.content-wrapper', {  'width': '33vw' });
            }

            outro.to('.wrapper.current', 1, { 'clip': 'rect(0vh 100vw 120vh 100vh)', ease: Power2.easeInOut }, '+=0')
                .to('.content-wrapper', 1, { 'width': '100vw', ease: Power1.easeIn }, '-=1')
                .to('.content-container', 0.5, { 'opacity': 0, ease: Power2.easeOut }, '-=0.5')
                .to('.goto-project', 0.5, { 'opacity': 0, ease: Power2.easeOut }, '-=1');

            /* end outro home */

        } else {
            slider = new ParallaxSlideshow($('.parallax-slideshow'));
            loaderToken = PubSub.subscribe(App.getInstance().events.page.home.ready, () => {
                playIntro();
                PubSub.unsubscribe(loaderToken);
                slider.$slideshow.addClass('ready');
            });
            App.getInstance().$window.on('resize.home', function () {
                updateBgs();
            });
            Loader.getInstance().handle(function () {
                let onComplete = function (img, first) {
                    if (first === true) {
                        PubSub.publish(App.getInstance().events.page.home.ready);
                    }
                    updateBgs($(img).closest('.responsive-bg'));
                    $(img).closest('.wrapper').addClass('ready');
                    PubSub.publish(App.getInstance().events.page.home.slideReady, { slide: $(img).closest('.wrapper') });
                };
                slider.$slideshow.find('picture img').each((index, img) => {
                    let first = (index === 0);
                    if (img.complete) {
                        onComplete(img, first);
                    } else {
                        img.addEventListener('load', () => {
                            onComplete(img, first);
                        });
                        img.addEventListener('error', () => {
                            onComplete(img, first);
                        });
                    }
                });
            });
        }
    }

    static project(unbind = false) {
        let playIntro = function () {
            console.log('intro');
            window.scrollTo(0, 0);

            TweenMax.set('.project', { 'opacity': 0 });
            TweenMax.set('.project h1', { 'margin-top': '-50px', 'opacity': 0 });

            let intro = new TimelineMax({
                paused: true,
                onComplete: () => {
                    PubSub.publish(App.getInstance().events.page.intro.completed);
                }
            });

            intro.to('.project', 1, { 'opacity': 1 })
                .to('.project h1', 1, { 'margin-top': '0px', 'opacity': 1 }, '-=0.5');

            intro.play();

            // init controller
			let controller = new ScrollMagic.Controller();
            let tween = TweenMax.fromTo('.project .responsive-bg', 1,
										{opacity: 0.5},
										{opacity: 1, ease: Power1.easeInOut}
									);

			// build scene
			let scene = new ScrollMagic.Scene({triggerElement: '.project header', duration: App.getInstance().$window.outerHeight() / 2, offset: 0, triggerHook: 0})
							.setTween(tween)
							.addTo(controller);

            $('.scroll-indicator').on('click', function(){
                let offset = $('.block').offset().top;
                TweenMax.to(window, 1, {scrollTo:{y:offset, x:0}, ease: Power3.easeOut});

            });
        };
        if (unbind) {
            console.log('unbind project');
            App.getInstance().$window.off('resize.project');

            $('.scroll-indicator').off('click');

            TweenMax.to('.page > article', 0.5, {
                opacity: 0,
                onComplete: () => {
                    PubSub.publish(App.getInstance().events.page.outro.completed);
                }
            });
        } else {
            let updateBgs = function ($item = false) {
                let $bgs;
                if ($item !== false) {
                    $bgs = $item;
                } else {
                    $bgs = $('.responsive-bg');
                }
                $bgs.each(function () {
                    var $this = $(this);
                    var src = Utils.getCurrentSrc($this.find('picture img')[0]);
                    if (typeof src === 'string') {
                        $this.css('background-image', 'url(' + src + ')');
                    }
                });
            };

            App.getInstance().$window.on('resize.home', function () {
                updateBgs();
            });
            Loader.getInstance().handle(function () {
                let onComplete = function (img, first) {
                    if (first === true) {
                        PubSub.publish(App.getInstance().events.page.project.ready);
                    }
                    updateBgs($(img).closest('.responsive-bg'));
                    $(img).closest('.project').addClass('ready');
                };
                $('header picture img').each((index, img) => {
                    let first = (index === 0);
                    if (img.complete) {
                        onComplete(img, first);
                    } else {
                        img.addEventListener('load', () => {
                            onComplete(img, first);
                        });
                        img.addEventListener('error', () => {
                            onComplete(img, first);
                        });
                    }
                });
            });
            playIntro();
            App.getInstance().$window.on('resize.project', function () {
                /* resize handle here */
                updateBgs();
            });
        }
    }
}
