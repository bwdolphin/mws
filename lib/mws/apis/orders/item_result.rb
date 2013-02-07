module Mws::Apis::Orders

  class ItemResult
    
    private :initialize

    private_class_method :new

    attr_accessor :title, :asin, :seller_sku, :item_price, :shipping_price, :order_item_id

    Mws::Enum.sym_reader self, :type, :status

    def initialize(node)
      @title = node.xpath('Title').text
      @asin = node.xpath('ASIN').text
      @seller_sku = node.xpath('SellerSKU').text
      @item_price = node.xpath('ItemPrice').text
      @shipping_price = node.xpath('ShippingPrice').text
      @order_item_id = node.xpath('OrderItemId').text

    end

    def self.from_xml(node)
      new node
    end 

  end

end