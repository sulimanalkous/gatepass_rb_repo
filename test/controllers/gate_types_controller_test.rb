require 'test_helper'

class GateTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gate_type = gate_types(:one)
  end

  test "should get index" do
    get gate_types_url
    assert_response :success
  end

  test "should get new" do
    get new_gate_type_url
    assert_response :success
  end

  test "should create gate_type" do
    assert_difference('GateType.count') do
      post gate_types_url, params: { gate_type: { name: @gate_type.name } }
    end

    assert_redirected_to gate_type_url(GateType.last)
  end

  test "should show gate_type" do
    get gate_type_url(@gate_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_gate_type_url(@gate_type)
    assert_response :success
  end

  test "should update gate_type" do
    patch gate_type_url(@gate_type), params: { gate_type: { name: @gate_type.name } }
    assert_redirected_to gate_type_url(@gate_type)
  end

  test "should destroy gate_type" do
    assert_difference('GateType.count', -1) do
      delete gate_type_url(@gate_type)
    end

    assert_redirected_to gate_types_url
  end
end
