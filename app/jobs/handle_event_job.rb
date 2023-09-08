class HandleEventJob < ApplicationJob
  queue_as :default

  def perform(event)
    case event.source
    when 'paystack'
      handle_paystack_event(event)
    end
  end

  def handle_paystack_event(event)
    paystack_event = JSON.parse(event.data.to_json)
    case paystack_event['event']
    when 'charge.success'
      update_product_sales_count(paystack_event)
      handle_transaction_successful_event(paystack_event)
    end
  end

  def update_product_sales_count(paystack_event)
    cart_items = paystack_event['data']['metadata']['custom_fields'].each do |field|
      field['value'].each do |name|
        product = Product.find_by(name: name)
        product.increment!(:sales_count)
      end
    end
  end

  def handle_transaction_successful_event(paystack_event)
    puts "transaction.successful #{paystack_event['data']['id']}"
  end
end
