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
end
