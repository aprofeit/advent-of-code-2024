require 'minitest/autorun'
require './report'

class ReportTest < Minitest::Test
  def test_safe
    report = Report.new([7, 6, 4, 2, 1])

    assert_equal true, report.safe?
  end

  def test_not_safe
    report = Report.new([1, 2, 7, 8, 9])

    assert_equal false, report.safe?
  end

  def test_neither_increase_nor_decrease
    report = Report.new([8, 6, 4, 4, 1])

    assert_equal false, report.safe?
  end

  def test_safe_dampened_safe_without_removing_element
    report = Report.new([7, 6, 4, 2, 1])

    assert_equal true, report.dampened_safe?
  end

  def test_unsafe_dampened_safe
    report = Report.new([1, 2, 7, 8, 9])

    assert_equal false, report.dampened_safe?
  end

  def test_safe_dampened_safe_removing_element
    report = Report.new([8, 6, 4, 4, 1])

    assert_equal true, report.dampened_safe?
  end
end
