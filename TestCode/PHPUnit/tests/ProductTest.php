<?php
use PHPUnit\Framework\TestCase;
include 'classes/class.products.php';
class ProductTest extends TestCase{
    protected $prod;
    protected function setUp():void
    {
        $this->prod=new Products();
    }
    public function testgetAllProd (){
        $val=$this->prod->get_all_products(10001);
        $this->assertEquals("10001",$val[0]['pro_id']);
        $this->assertEquals("AMX",$val[0]['pro_brand']);
        $this->assertEquals("Amoxicillin",$val[0]['pro_generic']);
    }
    public function testprodDetails (){
        $val=$this->prod->get_product_details(10001);
        $this->assertEquals("10001",$val['pro_id']);
        $this->assertEquals("AMX",$val['pro_brand']);
        $this->assertEquals("Amoxicillin",$val['pro_generic']);
    }
    public function testcatInfo (){
        $val=$this->prod->get_cat_info(10);
        $this->assertEquals("10",$val[0]['cat_id']);
        $this->assertEquals("ANTI-BACTERIAL",$val[0]['cat_name']);
    }

    public function testGetPrice(){
        $val=$this->prod->get_price(10001);
        $this->assertEquals(72.00,$val);
    }

}
?>