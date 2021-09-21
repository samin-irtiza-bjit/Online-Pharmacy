<?php
namespace App;
use PHPUnit\Framework\TestCase;
class MockProductTest extends TestCase{
    public function testGetProducts(){
        $mockProd=$this->createMock(Products::class);
        $mockProdArray=[
            ['id' => 1,'name' => "Acne Ointment"],
            ['id' => 2, 'name' => "Parasetamol"],
        ];

        $mockProd->method('get_all_products')->willReturn($mockProdArray);

        $productslist=$mockProd->get_all_products();

        $this-> assertEquals("Acne Ointment",$productslist[0]['name']);
        $this-> assertEquals("Parasetamol",$productslist[1]['name']);
    }

    public function testgetProductDetail(){
        $mockProd=$this->createMock(Products::class);
        $mockProdArray=['pro_id'=>10001,'pro_band'=>'AMX','pro_generic'=>'Amoxicillin','pro_formulation'=>'100mg/ml PFS Drops','pro_packaging'=> 'Bot. of 10ml','pro_unit_price'=>72.00,'pro_reorder_level'=>45,'pro_reorder_level'=>60,'pro_total_qty'=>10,'date_added'=>'0000-00-00','time_added'=>'00:00:00','date_modified'=>'0000-00-00','time_modified'=>'00:00:00','status'=>1,'user_id'=>1002];
        $mockProd->method('get_product_details')->willReturn($mockProdArray);
        $prodDetails=$mockProd->get_product_details(1001);
        $this->assertEquals("Amoxicillin",$prodDetails['pro_generic']);
    }
}
?>