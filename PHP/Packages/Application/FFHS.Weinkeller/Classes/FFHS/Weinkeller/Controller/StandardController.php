<?php
namespace FFHS\Weinkeller\Controller;

/*                                                                        *
 * This script belongs to the TYPO3 Flow package "FFHS.Weinkeller".       *
 *                                                                        *
 *                                                                        */

use TYPO3\Flow\Annotations as Flow;

class StandardController extends \TYPO3\Flow\Mvc\Controller\ActionController {

	/**
	 * @return void
	 */
	public function indexAction() {
		$this->view->assign('foos', array(
			'bar', 'baz'
		));
	}

    public function overviewAction() {

    }

    public function detailsAction() {

    }

}