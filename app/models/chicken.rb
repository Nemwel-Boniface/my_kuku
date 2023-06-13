class Chicken < ApplicationRecord
  before_create :generate_tag_number

  private

  def generate_tag_number
    # Get the corrent month eh June
    current_month = Date.today.strftime('%B')

    # Get the current date in the month
    current_date = Date.today.strftime('%d')

    id = Chicken.count + 1

    # Let's append a few zeros before the ID of the record being created
    tag_number_with_zeros = format('%03d', id)

    # Now let's wire them all up together
    self.tag_number = "#{current_month}#{current_date}#{tag_number_with_zeros}"
  end
end
