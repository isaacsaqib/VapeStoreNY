Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'],
  :secret_key      => ENV['SECRET_KEY']
}

p [Rails.configuration.stripe[:publishable_key], ENV['PUBLISHABLE_KEY']]

Stripe.api_key = Rails.configuration.stripe[:secret_key]

