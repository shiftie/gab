'use strict';

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

/* exported ParallaxSlideshow */
/* global TimelineMax */
/* global TweenMax */
/* global Power1 */
/* global Power2 */
/* global Power3 */
/* global PubSub */
/* global App */

var ParallaxSlideshow = function () {
    function ParallaxSlideshow() {
        var $element = arguments.length <= 0 || arguments[0] === undefined ? null : arguments[0];

        _classCallCheck(this, ParallaxSlideshow);

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

    _createClass(ParallaxSlideshow, [{
        key: 'handleContents',
        value: function handleContents() {
            var _this = this;

            this.slides.each(function (slide) {
                var $this = $(_this.slides[slide]);
                var $link = $this.find('a');
                $this.data('content', $this.find('.content-container'));
                $this.data('link', $link.attr('href'));
                $link.remove();
            });
            var $slideshow = this.$slideshow;
            $slideshow.append('<div class="content-wrapper"/>');
            var $contentContainer = $slideshow.children('.content-wrapper');
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
    }, {
        key: 'init',
        value: function init() {
            var _this2 = this;

            function attachAnimations(self) {
                var element = arguments.length <= 1 || arguments[1] === undefined ? null : arguments[1];

                if (element) {
                    (function () {
                        var $window = $(window);
                        var $element = $(element);
                        var intro = new TimelineMax({
                            paused: true,
                            onComplete: function onComplete() {
                                self.isAnimating = false;
                                $element.data('content').find('.description-container').attr('style', '');
                            }
                        });

                        intro.to($element.find('.cover-container'), 1.05, { y: -1 * 0.10 * $window.outerHeight() + 'px', ease: Power2.easeOut }).to($element.data('content'), 1, { y: '0', opacity: 1, ease: Power2.easeOut }, '-=0.5').fromTo($element.data('content').find('.description-container'), 0.75, { y: '10px', ease: Power1.easeIn }, { y: '0px', ease: Power1.easeOut }, '-=1');
                        $element.data('intro', intro);

                        var outro = new TimelineMax({
                            paused: true,
                            onComplete: function onComplete() {
                                $(self.slides[self.currentSlide]).removeClass('current');
                                $(self.slides[self.futureSlide]).addClass('current').removeClass('future');
                                self.currentSlide = self.futureSlide;
                                self.linkBtn.attr('href', $(self.slides[self.currentSlide]).data('link'));
                                $element.data('content').find('.title-container').attr('style', '');
                            }
                        });
                        outro.to($element.find('.cover-container'), 1.05, { y: -0.20 * $window.outerHeight() + 'px', 'clip': 'rect(0vh, 100vw, 0vh, 0vw)', ease: Power2.easeInOut }).to($element.data('content'), 0.5, { y: '-50px', ease: Power2.easeIn }, '-=1.05').to($element.data('content'), 0.4, { opacity: 0, ease: Power2.easeIn }, '-=0.95').to($element.data('content').find('.title-container'), 0.5, { y: '-10px', ease: Power2.easeIn }, '-=1');
                        $element.data('outro', outro);

                        var introReverse = new TimelineMax({
                            paused: true,
                            onComplete: function onComplete() {
                                self.isAnimating = false;
                            }
                        });

                        introReverse.to($element.find('.cover-container'), 1.05, { y: -1 * 0.10 * $window.outerHeight() + 'px', ease: Power2.easeOut }).to($element.data('content'), 1, { y: '0', opacity: 1, ease: Power3.easeOut }, '-=0.35');
                        $element.data('introReverse', introReverse);

                        var outroReverse = new TimelineMax({
                            paused: true,
                            onComplete: function onComplete() {
                                $(self.slides[self.currentSlide]).removeClass('current');
                                $(self.slides[self.futureSlide]).addClass('current').removeClass('future');
                                self.currentSlide = self.futureSlide;
                                self.linkBtn.attr('href', $(self.slides[self.currentSlide]).data('link'));
                            }
                        });
                        outroReverse.to($element.find('.cover-container'), 1.05, { y: 0 * $window.outerHeight() + 'px', 'clip': 'rect(120vh, 100vw, 120vh, 0vw)', ease: Power2.easeInOut }, '-=0').to($element.data('content'), 0.75, { y: '70px', ease: Power2.easeIn }, '-=1.05').to($element.data('content'), 0.5, { opacity: 0, ease: Power1.easeIn }, '-=0.75');
                        $element.data('outroReverse', outroReverse);
                    })();
                }
            }

            var self = this;
            this.handleContents();
            this.currentSlide = 0;
            this.totalSlides = this.slides.length;
            this.slides.each(function (index, slide) {
                return attachAnimations(self, slide);
            });
            this.isAnimating = false;
            PubSub.subscribe(App.getInstance().events.page.home.ready, function () {
                _this2.attachEvents();
            });
        }
    }, {
        key: 'attachEvents',
        value: function attachEvents() {
            var self = this;
            self.$slideshow.on('mousewheel.parallax-slideshow', function (e) {
                if (e.originalEvent.deltaY >= 0) {
                    self.next();
                } else {
                    self.prev();
                }
            });

            $('body').swipe({
                //Generic swipe handler for all directions
                swipe: function swipe(event, direction) {
                    if (direction === 'up') {
                        self.next();
                    } else if (direction === 'down') {
                        self.prev();
                    }
                },
                allowPageScroll: 'none'
            });
        }
    }, {
        key: 'doTransition',
        value: function doTransition(direction) {
            var fromSlide = arguments.length <= 1 || arguments[1] === undefined ? 0 : arguments[1];
            var toSlide = arguments.length <= 2 || arguments[2] === undefined ? 0 : arguments[2];

            var $window = $(window);
            var $fromSlide = $(this.slides[fromSlide]);
            var $toSlide = $(this.slides[toSlide]);
            direction = direction === 'up' ? 1 : -1;

            var toCover = $toSlide.find('.cover-container');
            var fromCover = $fromSlide.find('.cover-container');
            var toContent = $toSlide.data('content');
            TweenMax.to(toCover, 0, {
                top: 0,
                bottom: 'auto',
                y: direction * 0.50 * $window.outerHeight() + 'px',
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
                    y: -0.10 * $window.outerHeight() + 'px',
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
                        'y': -0.10 * $window.outerHeight() + 'px',
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
                y: direction * 30 + 'px',
                opacity: 0
            });

            $toSlide.addClass('future');
            var intro = undefined;
            var outro = undefined;
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
    }, {
        key: 'goTo',
        value: function goTo(direction, index) {
            var _this3 = this;

            if (!this.isAnimating) {
                (function () {
                    _this3.isAnimating = true;
                    _this3.futureSlide = index;
                    var $futureSlide = $(_this3.slides[_this3.futureSlide]);
                    if ($futureSlide.hasClass('ready')) {
                        _this3.$slideshow.removeClass('loading');
                        _this3.doTransition(direction, _this3.currentSlide, _this3.futureSlide);
                    } else {
                        (function () {
                            _this3.$slideshow.addClass('loading');
                            var token = PubSub.subscribe(App.getInstance().events.page.home.slideReady, function () {
                                if ($futureSlide.hasClass('ready')) {
                                    PubSub.unsubscribe(token);
                                    _this3.$slideshow.removeClass('loading');
                                    _this3.doTransition(direction, _this3.currentSlide, _this3.futureSlide);
                                }
                            });
                        })();
                    }
                })();
            }
        }
    }, {
        key: 'next',
        value: function next() {
            console.log('next');
            if (this.currentSlide + 1 >= this.totalSlides) {
                this.goTo('up', 0);
            } else {
                this.goTo('up', this.currentSlide + 1);
            }
        }
    }, {
        key: 'prev',
        value: function prev() {
            console.log('prev');
            if (this.currentSlide - 1 < 0) {
                this.goTo('down', this.totalSlides - 1);
            } else {
                this.goTo('down', this.currentSlide - 1);
            }
        }
    }, {
        key: 'destroy',
        value: function destroy() {
            function removeAnimations() {
                var element = arguments.length <= 0 || arguments[0] === undefined ? null : arguments[0];

                if (element) {
                    var $element = $(element);
                    $element.data('intro', null);
                    $element.data('outro', null);
                }
            }

            this.slides.each(function (index, slide) {
                return removeAnimations(slide);
            });
            this.$slideshow.off('click.parallax-slideshow');
            this.$slideshow.off('mousewheel.parallax-slideshow');
            $('body').swipe('destroy');
        }
    }]);

    return ParallaxSlideshow;
}();
//# sourceMappingURL=ParallaxSlideshow.js.map
