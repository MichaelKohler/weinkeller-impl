<?php
namespace FFHS\Weinkeller\Models;

use Doctrine\ORM\Mapping as ORM;
use TYPO3\Flow\Annotations as Flow;

/**
 * @Flow\Entity
 */
class User extends \TYPO3\Party\Domain\Model\Person {
    /**
     * @var \Doctrine\Common\Collections\Collection<\Brain\Domain\Model\Action>
     * @ORM\OneToMany(mappedBy="owner")
     */
    protected $actions;

    /**
     * @var \Doctrine\Common\Collections\Collection<\TYPO3\Flow\Security\Account>
     * @ORM\OneToMany(mappedBy="party", cascade={"persist"})
     */
    protected $accounts;

    /**
     * Constructor
     *
     * @return void
     */
    public function __construct() {
        parent::__construct();
        $this->actions = new \Doctrine\Common\Collections\ArrayCollection();
    }

    public function getUsername() {
        return $this->getAccounts()->first()->getAccountIdentifier();
    }

    /**
     * Assign action to party.
     *
     * @param \FFHS\Weinkeller\Models\Action $action The action
     * @return void
     */
    public function addAction(\FFHS\Weinkeller\Models\Action $action) {
        $this->actions->add($action);
        $action->setParty($this);
    }

    /**
     * Remove an action from party
     *
     * @param \FFHS\Weinkeller\Models\Action $action Action to remove
     * @return void
     */
    public function removeAction(\FFHS\Weinkeller\Models\Action $action) {
        $this->actions->removeElement($action);
    }

    /**
     * Returns the actions of the party
     *
     * @return \Doctrine\Common\Collections\Collection All actions
     */
    public function getActions() {
        return $this->actions;
    }

    /**
     * Returns the accounts of this party
     *
     * @param \Doctrine\Common\Collections\Collection accounts
     */
    public function getAccounts() {
        return $this->accounts;
    }
}

?>