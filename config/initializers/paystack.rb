require 'paystack'

if Rails.application.credentials[:paystack]
    PAYSTACKOBJ = Paystack.new(Rails.application.credentials[:paystack][:PAYSTACK_PUBLIC_KEY],Rails.application.credentials[:paystack][:PAYSTACK_PRIVATE_KEY])
end