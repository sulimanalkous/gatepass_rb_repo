require 'test_helper'

class GatepassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gatepass = gatepasses(:one)
  end

  test "should get index" do
    get gatepasses_url
    assert_response :success
  end

  test "should get new" do
    get new_gatepass_url
    assert_response :success
  end

  test "should create gatepass" do
    assert_difference('Gatepass.count') do
      post gatepasses_url, params: { gatepass: { car_color: @gatepass.car_color, car_no: @gatepass.car_no, car_type: @gatepass.car_type, company_id: @gatepass.company_id, from_date: @gatepass.from_date, gate_type_id: @gatepass.gate_type_id, national_id: @gatepass.national_id, note: @gatepass.note, person: @gatepass.person, reason: @gatepass.reason, ref_no: @gatepass.ref_no, to_date: @gatepass.to_date, user_id: @gatepass.user_id } }
    end

    assert_redirected_to gatepass_url(Gatepass.last)
  end

  test "should show gatepass" do
    get gatepass_url(@gatepass)
    assert_response :success
  end

  test "should get edit" do
    get edit_gatepass_url(@gatepass)
    assert_response :success
  end

  test "should update gatepass" do
    patch gatepass_url(@gatepass), params: { gatepass: { car_color: @gatepass.car_color, car_no: @gatepass.car_no, car_type: @gatepass.car_type, company_id: @gatepass.company_id, from_date: @gatepass.from_date, gate_type_id: @gatepass.gate_type_id, national_id: @gatepass.national_id, note: @gatepass.note, person: @gatepass.person, reason: @gatepass.reason, ref_no: @gatepass.ref_no, to_date: @gatepass.to_date, user_id: @gatepass.user_id } }
    assert_redirected_to gatepass_url(@gatepass)
  end

  test "should destroy gatepass" do
    assert_difference('Gatepass.count', -1) do
      delete gatepass_url(@gatepass)
    end

    assert_redirected_to gatepasses_url
  end
end
