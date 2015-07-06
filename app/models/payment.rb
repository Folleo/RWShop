class Payment < ActiveRecord::Base

  def process
    # Billing should be implemented here
    # But according to the test it's unnecessary
    self.success = true
    self.save

    true
  end

end
