require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @other_user = users(:two)
    @emotion = emotions(:one)
    @report = reports(:one)
    @report.user = @user
    @report.save
  end

  test 'should redirect to login when not logged in' do
    get reports_url
    assert_redirected_to new_user_session_url
  end

  test 'should get index when logged in' do
    sign_in @user
    get reports_url
    assert_response :success
  end

  test 'should get new when logged in' do
    sign_in @user
    get new_report_url
    assert_response :success
  end

  test 'should create report when logged in' do
    sign_in @user
    assert_difference('Report.count') do
      post reports_url, params: {
        report: {
          title: 'New Report',
          content: 'This is a new report',
          emotion_id: @emotion.id
        }
      }
    end

    assert_redirected_to report_url(Report.last)
  end

  test 'should show report when logged in' do
    sign_in @user
    get report_url(@report)
    assert_response :success
  end

  test 'should get edit when logged in and owner' do
    sign_in @user
    get edit_report_url(@report)
    assert_response :success
  end

  test 'should not get edit when not owner' do
    sign_in @other_user
    get edit_report_url(@report)
    assert_redirected_to reports_url
  end

  test 'should update report when logged in and owner' do
    sign_in @user
    patch report_url(@report), params: {
      report: {
        title: 'Updated Report',
        content: 'This is an updated report'
      }
    }
    assert_redirected_to report_url(@report)
  end

  test 'should not update report when not owner' do
    sign_in @other_user
    patch report_url(@report), params: {
      report: {
        title: 'Updated Report',
        content: 'This is an updated report'
      }
    }
    assert_redirected_to reports_url
  end

  test 'should destroy report when logged in and owner' do
    sign_in @user
    assert_difference('Report.count', -1) do
      delete report_url(@report)
    end

    assert_redirected_to reports_url
  end

  test 'should not destroy report when not owner' do
    sign_in @other_user
    assert_no_difference('Report.count') do
      delete report_url(@report)
    end

    assert_redirected_to reports_url
  end
end