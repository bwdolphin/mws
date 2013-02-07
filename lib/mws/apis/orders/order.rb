module Mws::Apis::Orders

  class Order
    def initialize(connection)
      @connection = connection
      @option_defaults = {
        version: '2011-01-01',
        list_pattern: '%{key}.%{ext}.%<index>d'
      }
    end

    def list(params={})
      params[:markets] ||= [ params.delete(:markets) || params.delete(:market) || 'ATVPDKIKX0DER' ].flatten.compact
      options = @option_defaults.merge action: 'ListOrders'
      doc = @connection.get "/Orders/#{options[:version]}", params, options
      doc.xpath('Orders/Order').map do | node |
        'Someday this will be an Order'
      end
    end

    #takes a list of order ids
    def get(order_ids)
      params = {
        :amazon_order_id => order_ids
      }
      options = @option_defaults.merge action: 'GetOrder'
      doc = @connection.get "/Orders/#{options[:version]}", params, options
    end

    #gets list items for an order
    def list_items(order_id)
      params = {
        :amazon_order_id => order_id
      }
      options = @option_defaults.merge action: 'ListOrderItems'
      doc = @connection.get "/Orders/#{options[:version]}", params, options
      order_items = []
      items = doc.xpath('OrderItems').first
      items.xpath('OrderItem').each do |item|
        order_items.push( ItemResult.from_xml item )
      end
      order_items
    end
  end
end