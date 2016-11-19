/* exported ParallaxSlideshow */
/* global TimelineMax */
/* global TweenMax */
/* global Power1 */
/* global Power2 */
/* global Power3 */
/* global PubSub */
/* global App */

class ParallaxSlideshow {
    constructor($element = null) {
        if ($element) {
            if (typeof $element === 'string') {
                $element = $($element);
            }
            if ($element.length) {
                this.$slideshow = $element.eq(0);
                this.$slideshow.data('slider', this);
                this.slides = this.$slideshow.children('.wrapper');
                this.init();
            }
        }
    }

    handleContents() {
        this.slides.each((slide) => {
            let $this = $(this.slides[slide]);
            let $link = $this.find('a');
            $this.data('content', $this.find('.content-container'));
            $this.data('link', $link.attr('href'));
            $link.remove();
        });
        let $slideshow = this.$slideshow;
        $slideshow.append('<div class="content-wrapper"/>');
        let $contentContainer = $slideshow.children('.content-wrapper');
        $contentContainer.append($slideshow.find('.content-container'));
        $contentContainer.append('<a class="goto-project">See Project</a>');
        /* Project link */
        this.linkBtn = $contentContainer.find('.goto-project');
        this.linkBtn.attr('href', $(this.slides[0]).data('link'));
        /*this.$slideshow.on('click', 'a', (e) => {
            e.preventDefault();
            PubSub.publish(App.getInstance().events.page.change, { href: $(e.currentTarget).attr('href') });
        });*/
    }

    init() {
        function attachAnimations(self, element = null) {
            if (element) {
                let $window = $(window);
                let $element = $(element);
                let intro = new TimelineMax({
                    paused: true,
                    onComplete: () => {
                        self.isAnimating = false;
                        $element.data('content').find('.description-container').attr('style', '');
                    }
                });

                intro.to($element.find('.cover-container'), 1.05, { y: ((-1 * 0.10) * $window.outerHeight() + 'px'), ease: Power2.easeOut })
                    .to($element.data('content'), 1, { y: '0', opacity: 1, ease: Power2.easeOut }, '-=0.5')
                    .fromTo($element.data('content').find('.description-container'), 0.75, { y: '10px', ease: Power1.easeIn }, { y: '0px', ease: Power1.easeOut }, '-=1');
                $element.data('intro', intro);

                let outro = new TimelineMax({
                    paused: true,
                    onComplete: () => {
                        $(self.slides[self.currentSlide]).removeClass('current');
                        $(self.slides[self.futureSlide]).addClass('current').removeClass('future');
                        self.currentSlide = self.futureSlide;
                        self.linkBtn.attr('href', $(self.slides[self.currentSlide]).data('link'));
                        $element.data('content').find('.title-container').attr('style', '');
                    }
                });
                outro.to($element.find('.cover-container'), 1.05, { y: (-0.20 * $window.outerHeight() + 'px'), 'clip': 'rect(0vh, 100vw, 0vh, 0vw)', ease: Power2.easeInOut })
                    .to($element.data('content'), 0.5, { y: '-50px', ease: Power2.easeIn }, '-=1.05')
                    .to($element.data('content'), 0.4, { opacity: 0, ease: Power2.easeIn }, '-=0.95')
                    .to($element.data('content').find('.title-container'), 0.5, { y: '-10px', ease: Power2.easeIn }, '-=1');
                $element.data('outro', outro);

                let introReverse = new TimelineMax({
                    paused: true,
                    onComplete: () => {
                        self.isAnimating = false;
                    }
                });

                introReverse.to($element.find('.cover-container'), 1.05, { y: ((-1 * 0.10) * $window.outerHeight() + 'px'), ease: Power2.easeOut })
                    .to($element.data('content'), 1, { y: '0', opacity: 1, ease: Power3.easeOut }, '-=0.35');
                $element.data('introReverse', introReverse);

                let outroReverse = new TimelineMax({
                    paused: true,
                    onComplete: () => {
                        $(self.slides[self.currentSlide]).removeClass('current');
                        $(self.slides[self.futureSlide]).addClass('current').removeClass('future');
                        self.currentSlide = self.futureSlide;
                        self.linkBtn.attr('href', $(self.slides[self.currentSlide]).data('link'));
                    }
                });
                outroReverse.to($element.find('.cover-container'), 1.05, { y: (0 * $window.outerHeight() + 'px'), 'clip': 'rect(120vh, 100vw, 120vh, 0vw)', ease: Power2.easeInOut }, '-=0')
                    .to($element.data('content'), 0.75, { y: '70px', ease: Power2.easeIn }, '-=1.05')
                    .to($element.data('content'), 0.5, { opacity: 0, ease: Power1.easeIn }, '-=0.75');
                $element.data('outroReverse', outroReverse);
            }
        }

        let self = this;
        this.handleContents();
        this.currentSlide = 0;
        this.totalSlides = this.slides.length;
        this.slides.each((index, slide) => attachAnimations(self, slide));
        this.isAnimating = false;
        PubSub.subscribe(App.getInstance().events.page.home.ready, () => {
            this.attachEvents();
        });
    }

    attachEvents() {
        let self = this;
        self.$slideshow.on('mousewheel.parallax-slideshow', function (e) {
            if (e.originalEvent.deltaY >= 0) {
                self.next();
            } else {
                self.prev();
            }
        });

        $('body').swipe({
            //Generic swipe handler for all directions
            swipe: function (event, direction) {
                if (direction === 'up') {
                    self.next();
                } else if (direction === 'down') {
                    self.prev();
                }
            },
            allowPageScroll: 'none'
        });
    }

    doTransition(direction, fromSlide = 0, toSlide = 0) {
        let $window = $(window);
        let $fromSlide = $(this.slides[fromSlide]);
        let $toSlide = $(this.slides[toSlide]);
        direction = (direction === 'up') ? 1 : -1;

        let toCover = $toSlide.find('.cover-container');
        let fromCover = $fromSlide.find('.cover-container');
        let toContent = $toSlide.data('content');
        TweenMax.to(toCover, 0, {
            top: 0,
            bottom: 'auto',
            y: (direction * 0.50) * $window.outerHeight() + 'px',
            'max-height': '120vh',
            'scaleY': 1,
            'clip': 'rect(0vw, 100vw, 120vh, 0vw)'
        });
/*
        TweenMax.to(toCover.find('.cover'), 0, {
            'y': '0%',
            'scaleY': 1
        });
*/
        if (direction === 1) {
            TweenMax.to(fromCover, 0, {
                'transform-origin': 'center top',
                y: (-0.10) * $window.outerHeight() + 'px',
                'max-height': '120vh',
                'clip': 'rect(0vw, 100vw, 120vh, 0vw)'
            });
            /*
            TweenMax.to(fromCover.find('.cover'), 0, {
                'y': '0%'
            });
            */
        } else {
            TweenMax.to(fromCover, 0, {
                'y': (-0.10) * $window.outerHeight() + 'px',
                'transform-origin': 'center bottom',
                'max-height': '120vh',
                'clip': 'rect(0vw, 100vw, 120vh, 0vw)'
            });
            /*
            TweenMax.to(fromCover.find('.cover'), 0, {
                'y': '0%'
            });
            */
        }

        TweenMax.to(toContent, 0, {
            y: (direction * 30) + 'px',
            opacity: 0
        });

        $toSlide.addClass('future');
        let intro;
        let outro;
        if (direction === 1) {
            intro = $toSlide.data('intro');
            outro = $fromSlide.data('outro');
        } else {
            outro = $fromSlide.data('outroReverse');
            intro = $toSlide.data('introReverse');
        }
        intro.restart(true);
        outro.restart(true);
    }

    goTo(direction, index) {
        if (!this.isAnimating) {
            this.isAnimating = true;
            this.futureSlide = index;
            let $futureSlide = $(this.slides[this.futureSlide]);
            if ($futureSlide.hasClass('ready')) {
                this.$slideshow.removeClass('loading');
                this.doTransition(direction, this.currentSlide, this.futureSlide);
            } else {
                this.$slideshow.addClass('loading');
                let token = PubSub.subscribe(App.getInstance().events.page.home.slideReady, () => {
                    if ($futureSlide.hasClass('ready')) {
                        PubSub.unsubscribe(token);
                        this.$slideshow.removeClass('loading');
                        this.doTransition(direction, this.currentSlide, this.futureSlide);
                    }
                });
            }
        }
    }

    next() {
        console.log('next');
        if ((this.currentSlide + 1) >= this.totalSlides) {
            this.goTo('up', 0);
        } else {
            this.goTo('up', this.currentSlide + 1);
        }
    }

    prev() {
        console.log('prev');
        if ((this.currentSlide - 1) < 0) {
            this.goTo('down', this.totalSlides - 1);
        } else {
            this.goTo('down', this.currentSlide - 1);
        }
    }

    destroy() {
        function removeAnimations(element = null) {
            if (element) {
                let $element = $(element);
                $element.data('intro', null);
                $element.data('outro', null);
            }
        }

        this.slides.each((index, slide) => removeAnimations(slide));
        this.$slideshow.off('click.parallax-slideshow');
        this.$slideshow.off('mousewheel.parallax-slideshow');
        $('body').swipe('destroy');
    }
}
