<?php

use Website\Controller\Action;

class DefaultController extends Action {
	public function __construct(Zend_Controller_Request_Abstract $request, Zend_Controller_Response_Abstract $response, array $invokeArgs = array()) {
        parent::__construct($request, $response, $invokeArgs);
        $this->enableLayout();
		$this->setLayout('standard');

        $vr = Zend_Controller_Action_HelperBroker::getStaticHelper('viewRenderer');
        $view = $vr->view;
        $navigation = $view->pimcoreNavigation()->getNavigation($view->document, Document::getByPath('/'),  'main-menu');
        $view->navigation()->menu()->setUseTranslator(true);
        $view->navigation($navigation);
        $this->view->menu = $view->navigation()->menu()->setUlId($cssClass)->renderMenu($navigation, array('maxDepth' => 10));

		Asset\Image\Thumbnail::setEmbedPicturePolyfill(false);
    }

	public function defaultAction () {

	}

	public function contactAction () {
		$this->disableLayout();
	}

	public function projectAction () {
		if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
			/* special ajax here */
			$this->disableLayout();
		}
	}
}
