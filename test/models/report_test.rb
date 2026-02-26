require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @emotion = emotions(:one)
  end

  test 'should save report with valid attributes' do
    report = Report.new(
      title: 'Test Report',
      content: 'This is a test report',
      user: @user,
      emotion: @emotion
    )
    assert report.save, 'Report should be saved with valid attributes'
  end

  test 'should not save report without title' do
    report = Report.new(
      content: 'This is a test report',
      user: @user,
      emotion: @emotion
    )
    assert_not report.save, 'Report should not be saved without title'
  end

  test 'should not save report without content' do
    report = Report.new(
      title: 'Test Report',
      user: @user,
      emotion: @emotion
    )
    assert_not report.save, 'Report should not be saved without content'
  end

  test 'should associate with user' do
    report = Report.new(
      title: 'Test Report',
      content: 'This is a test report',
      user: @user,
      emotion: @emotion
    )
    assert report.save
    assert_equal @user, report.user
  end

  test 'should associate with emotion' do
    report = Report.new(
      title: 'Test Report',
      content: 'This is a test report',
      user: @user,
      emotion: @emotion
    )
    assert report.save
    assert_equal @emotion, report.emotion
  end

  test 'should handle tags' do
    report = Report.new(
      title: 'Test Report',
      content: 'This is a test report',
      user: @user,
      emotion: @emotion
    )
    assert report.save
    
    # Add tags
    tag1 = Tag.create!(name: 'test')
    tag2 = Tag.create!(name: 'example')
    
    report.tags << tag1
    report.tags << tag2
    
    assert_equal 2, report.tags.count
    assert report.tags.include?(tag1)
    assert report.tags.include?(tag2)
  end
end