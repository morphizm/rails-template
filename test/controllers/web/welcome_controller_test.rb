# frozen_string_literal: true

require 'test_helper'

class Web::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test '#show' do
    get root_path
    assert_response :success
  end
end
