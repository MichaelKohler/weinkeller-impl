<?php
namespace FFHS\Weinkeller\Controller;
use TYPO3\Flow\Annotations as Flow;

class StandardController extends \TYPO3\Flow\Mvc\Controller\ActionController {

    /**
     * @var \TYPO3\Flow\Security\Authentication\AuthenticationManagerInterface
     * @Flow\Inject
     */
    protected $authenticationManager;

    /**
     * @var \TYPO3\Flow\Security\AccountRepository
     * @Flow\Inject
     */
    protected $accountRepository;

    /**
     * @var \TYPO3\Flow\Security\AccountFactory
     * @Flow\Inject
     */
    protected $accountFactory;

    public function authenticateAction() {
        try {
            $this->authenticationManager->authenticate();
        } catch (\TYPO3\Flow\Security\Exception\AuthenticationRequiredException $exception) {
            $postArguments = $this->request->getArguments();
            $account = $this->accountFactory->createAccountWithPassword($postArguments["name"], $postArguments["password"], array('FFHS.Weinkeller:User'));
            $this->accountRepository->add($account);
        }
        $this->redirect('overview', 'Standard');
    }

    public function logoutAction() {
        $this->authenticationManager->logout();
        $this->redirect('index', 'Standard');
    }

	public function indexAction() {
	}

    public function overviewAction() {
    }

    public function detailsAction() {
    }

}