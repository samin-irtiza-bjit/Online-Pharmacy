<?php
use PHPUnit\Framework\TestCase;
include 'classes/class.users.php';

class UserTest extends TestCase{
    protected $user;
    protected function setUp():void
    {
        $this->user=new Users();
    }

    public function testGetUser(){
        $userList=$this->user->get_users();
        $this->assertEquals(1028,$userList[0]['client_id']);
    }

    public function testGetClient(){
        $client=$this->user->get_client(1028);
        $this->assertEquals("1028",$client);
    }

    public function testGetOrderHistory(){
        $history=$this->user->get_order_history(1028);
        $this->assertEquals("1028",$history[0]['client_id']);
        $this->assertEquals(398.00,$history[0]['total_amount']);
    }
}
?>