Gibbon::Request.api_key = ENV['MAILCHIMP_KEY']
Gibbon::Request.timeout = 15
Gibbon::API.throws_exceptions = true