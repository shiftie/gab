'use strict';

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

/* exported Utils */
/* global respimage */
/* global picturefill */

var Utils = function () {
				function Utils() {
								_classCallCheck(this, Utils);
				}

				_createClass(Utils, null, [{
								key: 'getCurrentSrc',
								value: function getCurrentSrc(element) {
												var _getSrc;
												if (!window.HTMLPictureElement) {
																if (window.respimage) {
																				respimage({ elements: [element] });
																} else if (window.picturefill) {
																				picturefill({ elements: [element] });
																}
																return element.src;
												}

												_getSrc = function getSrc() {
																element.removeEventListener('load', _getSrc);
																element.removeEventListener('error', _getSrc);
												};

												element.addEventListener('load', _getSrc);
												element.addEventListener('error', _getSrc);
												if (element.complete) {
																_getSrc();
																return element.currentSrc;
												}
								}
				}, {
								key: 'getView',
								value: function getView() {
												return $('.page').data('page') ? $('.page').data('page') : 'home';
								}
				}]);

				return Utils;
}();
//# sourceMappingURL=Utils.js.map
