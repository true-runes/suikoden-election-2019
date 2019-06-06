Rails.application.config.generators do |g|
  g.template_engine = :slim
  g.assets true
  g.helper true
  g.test_framework :rspec,
                   fixtures: true,
                   view_specs: true,
                   helper_specs: true,
                   routing_specs: true,
                   controller_specs: true,
                   request_specs: true
  g.fixture_replacement :factory_bot, dir: 'spec/factories'
end
